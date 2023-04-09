#include "spirit_controller.h"

#include "../../../common/utils.h"
#include "../../entities/petentity.h"
#include "../../status_effect_container.h"
#include "../../utils/battleutils.h"
#include "../../utils/petutils.h"
#include "../../utils/zoneutils.h"
#include "../ai_container.h"

CSpiritController::CSpiritController(CPetEntity* PSpirit)
: CPetController(PSpirit)
, PSpirit(PSpirit)
{
}

void CSpiritController::Tick(time_point tick)
{
    TracyZoneScoped;

    if ((PSpirit->PMaster == nullptr || PSpirit->PMaster->isDead()) && PSpirit->isAlive())
    {
        PSpirit->Die();
        return;
    }

    if (PSpirit->shouldDespawn(tick))
    {
        petutils::DespawnPet(PSpirit->PMaster);
        return;
    }

    if (!PSpirit->m_setup)
    {
        setMagicCooldowns();

        if (PSpirit->m_PetID == PETID::PETID_LIGHTSPIRIT)
        {
            LoadLightSpiritSpellList();
        }

        PSpirit->m_LastMagicTime = tick;
        PSpirit->m_setup         = true;
    }

    if (PSpirit->PAI->IsEngaged())
    {
        PTarget = static_cast<CBattleEntity*>(PSpirit->GetEntity(PSpirit->GetBattleTargetID()));
        if (CPetController::TryDeaggro())
        {
            Disengage();
            return;
        }

        PSpirit->PAI->EventHandler.triggerListener("COMBAT_TICK", CLuaBaseEntity(PSpirit));
        luautils::OnMobFight(PSpirit, PTarget);
        if (TrySpellcast(tick))
        {
            PSpirit->m_LastMagicTime = tick;
            return;
        }

        CPetController::Move();
    }
    else
    {
        // if pet can't follow then don't
        if (!PSpirit->PAI->CanFollowPath())
        {
            return;
        }
        if (TryIdleSpellcast(tick))
        {
            PSpirit->m_LastMagicTime = tick;
            return;
        }
        else
        {
            CPetController::DoRoamTick(tick);
        }
    }

    CMobController::Tick(tick);
}

void CSpiritController::setMagicCooldowns()
{
    uint32 castTime = ((45000 + (GetSMNSkillReduction() / 3)) + GetDayWeatherBonus());

    if (PSpirit->PMaster->StatusEffectContainer->HasStatusEffect(EFFECT_ASTRAL_FLOW))
    {
        castTime -= 5000;
    }

    CItemEquipment* legSlotItem = static_cast<CCharEntity*>(PSpirit->PMaster)->getEquip(SLOT_LEGS);

    // Summoner's Spats & Summoner's Spats +1
    if (legSlotItem && (legSlotItem->getID() == 15131 || legSlotItem->getID() == 15594))
    {
        castTime -= 5000;
    }

    // Light Spirit idle spellcasting time is halved if the Light Spirit is not engaged.
    // Applies only to buffs, so we'll need to do another check elsewhere.
    if(PSpirit->m_PetID == PETID_LIGHTSPIRIT && !PSpirit->PAI->IsEngaged())
        castTime /= 2;

    // TODO: Make the cast time update on "Assault"/"Release".
    PSpirit->m_magicCooldown = std::chrono::milliseconds(castTime);
}

bool CSpiritController::TrySpellcast(time_point tick)
{
    if (!PSpirit->PMaster || PSpirit->PMaster->objtype != TYPE_PC ||
        m_Tick <= PSpirit->m_LastMagicTime + PSpirit->m_magicCooldown ||
        PSpirit->StatusEffectContainer->HasPreventActionEffect() ||
        PSpirit->StatusEffectContainer->HasStatusEffect(EFFECT_SILENCE))
    {
        return false;
    }

    if ((PSpirit->m_PetID < PETID_LIGHTSPIRIT || PSpirit->m_PetID == PETID_DARKSPIRIT) && TryCastSpell())
    {
        return true;
    }
    else if (PSpirit->m_PetID == PETID_LIGHTSPIRIT)
    {
        CBattleEntity* PLowest       = nullptr;
        float          lowestPercent = 1.f;
        uint8          choice        = xirand::GetRandomNumber(2, 4);
        uint16         chosenSpell   = static_cast<uint16>(SpellID::Cure);

        // clang-format off
        PSpirit->PMaster->ForParty([&](CBattleEntity* PMember)
        {
            if (PMember != nullptr && PSpirit->PMaster->loc.zone->GetID() == PMember->loc.zone->GetID() && distance(PSpirit->loc.p, PMember->loc.p) <= 20 &&
                !PMember->isDead())
            {
                float memberPercent = PMember->health.hp / PMember->health.maxhp;
                if (PLowest == nullptr ||
                    (lowestPercent >= memberPercent))
                {
                    PLowest = PMember;
                    lowestPercent = memberPercent;
                }
            }
        });
        // clang-format on

        if (lowestPercent < 0.5f) // 50% HP
        {
            uint8 chance = xirand::GetRandomNumber(100);
            if (chance <= 20)
            {
                choice = 1;
            }
            else if (chance <= 60)
            {
                choice = 2;
            }
            else
            {
                choice = 3;
            }
        }

        switch (choice)
        {
            case 1:
                if (PSpirit->m_healSingleSpells.size() > 0)
                {
                    chosenSpell = xirand::GetRandomElement(PSpirit->m_healSingleSpells);
                }
                break;
            case 2:
                if (PSpirit->m_buffSpells.size() > 0)
                {
                    chosenSpell = xirand::GetRandomElement(PSpirit->m_buffSpells);
                }
                break;
            case 3:
                if (PSpirit->m_offensiveSpells.size() > 0)
                {
                    chosenSpell = xirand::GetRandomElement(PSpirit->m_offensiveSpells);
                }
                break;
        }
        if (CanCastSpells())
        {
            CastSpell(static_cast<SpellID>(chosenSpell));
            return true;
        }
    }

    return false;
}

bool CSpiritController::TryIdleSpellcast(time_point tick)
{
    if (!PSpirit->PMaster || PSpirit->PMaster->objtype != TYPE_PC ||
        tick <= PSpirit->m_LastMagicTime + PSpirit->m_magicCooldown ||
        PSpirit->StatusEffectContainer->HasPreventActionEffect() ||
        PSpirit->StatusEffectContainer->HasStatusEffect(EFFECT_SILENCE))
    {
        return false;
    }

    uint8 mLvl = PSpirit->GetMLevel();
    switch (PSpirit->m_PetID)
    {
        case PETID_LIGHTSPIRIT:
            CBattleEntity* PLowest       = nullptr;
            uint8          numUnderThreshold = NULL;
            uint8          choice        = 2;
            uint16         chosenSpell   = static_cast<uint16>(SpellID::Cure);

            // clang-format off
            // Light Spirit cures/curagas can target other alliance members.
            PLowest = GetLowestThresholdHPMember();
            if(PLowest != nullptr) {
                choice = 1;
                numUnderThreshold = GetLowestHPThresholdCountForParty(*PLowest);
            }
            // clang-format on

            switch (choice)
            {
                case 1:
                    if (PSpirit->m_healSingleSpells.size() > 0)
                    {
                        // TODO: We should make it so that Light Spirit could prefer using Curaga spells even when a single party/alliance member is at yellow HP.
                        if(numUnderThreshold > 1)
                            chosenSpell = DetermineHighestSpellFromMP(PSpirit->m_healAOESpells);
                        else
                            chosenSpell = DetermineHighestSpellFromMP(PSpirit->m_healSingleSpells);

                        // If the spirit doesn't have the MP to cast a spell, don't do anything.
                        if(chosenSpell == 0) return false;

                         if (CanCastSpells())
                        {
                            CastIdleSpell(static_cast<SpellID>(chosenSpell), PLowest->targid);
                            return true;
                        }
                    }
                    break;
                case 2:
                    if (PSpirit->m_buffSpells.size() > 0)
                    {
                        PSpirit->PMaster->ForAlliance([&](CBattleEntity* PMember)
                        {

                        });
                        chosenSpell = xirand::GetRandomElement(PSpirit->m_buffSpells);
                    }
                    break;
            }
            break;

        default:
            break;
    }

    return false;
}

void CSpiritController::LoadLightSpiritSpellList()
{
    uint8 mLvl = PSpirit->GetMLevel();
    if (mLvl >= 71)
    {
        PSpirit->m_healAOESpells.push_back(static_cast<uint16>(SpellID::Curaga_IV));
    }
    if (mLvl >= 68)
    {
        PSpirit->m_buffSpells.push_back(static_cast<uint16>(SpellID::Shell_IV));
    }
    if (mLvl >= 65)
    {
        PSpirit->m_offensiveSpells.push_back(static_cast<uint16>(SpellID::Banish_III));
    }
    if (mLvl >= 63)
    {
        PSpirit->m_buffSpells.push_back(static_cast<uint16>(SpellID::Protect_IV));
    }
    if (mLvl >= 61)
    {
        PSpirit->m_healSingleSpells.push_back(static_cast<uint16>(SpellID::Cure_V));
    }
    if (mLvl >= 57 && mLvl < 68)
    {
        PSpirit->m_buffSpells.push_back(static_cast<uint16>(SpellID::Shell_III));
    }
    if (mLvl >= 51 && mLvl < 71)
    {
        PSpirit->m_healAOESpells.push_back(static_cast<uint16>(SpellID::Curaga_III));
    }
    if (mLvl >= 50)
    {
        PSpirit->m_offensiveSpells.push_back(static_cast<uint16>(SpellID::Holy));
    }
    if (mLvl >= 47 && mLvl < 63)
    {
        PSpirit->m_buffSpells.push_back(static_cast<uint16>(SpellID::Protect_III));
    }
    if (mLvl >= 41 && mLvl < 61)
    {
        PSpirit->m_healSingleSpells.push_back(static_cast<uint16>(SpellID::Cure_IV));
    }
    if (mLvl >= 40)
    {
        PSpirit->m_buffSpells.push_back(static_cast<uint16>(SpellID::Haste));
    }
    if (mLvl >= 37)
    {
        PSpirit->m_offensiveSpells.push_back(static_cast<uint16>(SpellID::Flash));
    }
    if (mLvl >= 37 && mLvl < 57)
    {
        PSpirit->m_buffSpells.push_back(static_cast<uint16>(SpellID::Shell_II));
    }
    if (mLvl >= 31)
    {
        PSpirit->m_offensiveSpells.push_back(static_cast<uint16>(SpellID::Dia_II));
    }
    if (mLvl >= 31 && mLvl < 71)
    {
        PSpirit->m_healAOESpells.push_back(static_cast<uint16>(SpellID::Curaga_II));
    }
    if (mLvl >= 30)
    {
        PSpirit->m_offensiveSpells.push_back(static_cast<uint16>(SpellID::Banish_II));
    }
    if (mLvl >= 27 && mLvl < 57)
    {
        PSpirit->m_buffSpells.push_back(static_cast<uint16>(SpellID::Protect_II));
    }
    if (mLvl >= 21)
    {
        PSpirit->m_buffSpells.push_back(static_cast<uint16>(SpellID::Regen));
    }
    if (mLvl >= 21 && mLvl < 41)
    {
        PSpirit->m_healSingleSpells.push_back(static_cast<uint16>(SpellID::Cure_III));
    }
    if (mLvl >= 17 && mLvl < 37)
    {
        PSpirit->m_buffSpells.push_back(static_cast<uint16>(SpellID::Shell));
    }
    if (mLvl >= 16 && mLvl < 51)
    {
        PSpirit->m_healAOESpells.push_back(static_cast<uint16>(SpellID::Curaga));
    }
    if (mLvl >= 11 && mLvl < 41)
    {
        PSpirit->m_healSingleSpells.push_back(static_cast<uint16>(SpellID::Cure_II));
    }
    if (mLvl >= 7 && mLvl < 27)
    {
        PSpirit->m_buffSpells.push_back(static_cast<uint16>(SpellID::Protect));
    }
    if (mLvl >= 5 && mLvl < 65)
    {
        PSpirit->m_offensiveSpells.push_back(static_cast<uint16>(SpellID::Banish));
    }
    if (mLvl >= 1 && mLvl < 21)
    {
        PSpirit->m_healSingleSpells.push_back(static_cast<uint16>(SpellID::Cure));
    }
}

int16 CSpiritController::GetSMNSkillReduction()
{
    if (PSpirit->PMaster && PSpirit->PMaster->objtype == TYPE_PC)
    {
        uint8 masterLvl = PSpirit->PMaster->GetMLevel();

        if (PSpirit->PMaster->GetMJob() != JOB_SMN)
        {
            masterLvl = PSpirit->PMaster->GetSLevel();
        }

        uint16 skill    = PSpirit->PMaster->GetSkill(SKILL_SUMMONING_MAGIC);
        uint16 maxSkill = battleutils::GetMaxSkill(SKILL_SUMMONING_MAGIC, JOB_SMN, masterLvl);

        return 1000 * (skill - maxSkill);
    }

    return 0;
}

int16 CSpiritController::GetDayWeatherBonus()
{
    if (PSpirit->PMaster == nullptr || PSpirit->PMaster->objtype != TYPE_PC)
    {
        return 0;
    }

    WEATHER zoneWeather = zoneutils::GetZone(PSpirit->PMaster->getZone())->GetWeather();
    uint32  vanaDay     = CVanaTime::getInstance()->getWeekday();
    int16   bonus       = 0;

    switch (PSpirit->m_PetID)
    {
        case PETID_EARTHSPIRIT:
            if (zoneWeather == WEATHER_DUST_STORM || zoneWeather == WEATHER_SAND_STORM)
            {
                bonus -= 2000;
            }
            if (zoneWeather == WEATHER_WIND || zoneWeather == WEATHER_GALES)
            {
                bonus += 2000;
            }
            if (vanaDay == DAYTYPE::EARTHSDAY)
            {
                bonus -= 3000;
            }
            if (vanaDay == DAYTYPE::WINDSDAY)
            {
                bonus += 3000;
            }
            break;
        case PETID_WATERSPIRIT:
            if (zoneWeather == WEATHER_RAIN || zoneWeather == WEATHER_SQUALL)
            {
                bonus -= 2000;
            }
            if (zoneWeather == WEATHER_THUNDER || zoneWeather == WEATHER_THUNDERSTORMS)
            {
                bonus += 2000;
            }
            if (vanaDay == DAYTYPE::WATERSDAY)
            {
                bonus -= 3000;
            }
            if (vanaDay == DAYTYPE::LIGHTNINGDAY)
            {
                bonus += 3000;
            }
            break;
        case PETID_AIRSPIRIT:
            if (zoneWeather == WEATHER_WIND || zoneWeather == WEATHER_GALES)
            {
                bonus -= 2000;
            }
            if (zoneWeather == WEATHER_SNOW || zoneWeather == WEATHER_BLIZZARDS)
            {
                bonus += 2000;
            }
            if (vanaDay == DAYTYPE::WINDSDAY)
            {
                bonus -= 3000;
            }
            if (vanaDay == DAYTYPE::ICEDAY)
            {
                bonus += 3000;
            }
            break;
        case PETID_FIRESPIRIT:
            if (zoneWeather == WEATHER_HOT_SPELL || zoneWeather == WEATHER_HEAT_WAVE)
            {
                bonus -= 2000;
            }
            if (zoneWeather == WEATHER_RAIN || zoneWeather == WEATHER_SQUALL)
            {
                bonus += 2000;
            }
            if (vanaDay == DAYTYPE::FIRESDAY)
            {
                bonus -= 3000;
            }
            if (vanaDay == DAYTYPE::WATERSDAY)
            {
                bonus += 3000;
            }
            break;
        case PETID_ICESPIRIT:
            if (zoneWeather == WEATHER_SNOW || zoneWeather == WEATHER_BLIZZARDS)
            {
                bonus -= 2000;
            }
            if (zoneWeather == WEATHER_HOT_SPELL || zoneWeather == WEATHER_HEAT_WAVE)
            {
                bonus += 2000;
            }
            if (vanaDay == DAYTYPE::ICEDAY)
            {
                bonus -= 3000;
            }
            if (vanaDay == DAYTYPE::FIRESDAY)
            {
                bonus += 3000;
            }
            break;
        case PETID_THUNDERSPIRIT:
            if (zoneWeather == WEATHER_THUNDER || zoneWeather == WEATHER_THUNDERSTORMS)
            {
                bonus -= 2000;
            }
            if (zoneWeather == WEATHER_DUST_STORM || zoneWeather == WEATHER_SAND_STORM)
            {
                bonus += 2000;
            }
            if (vanaDay == DAYTYPE::LIGHTNINGDAY)
            {
                bonus -= 3000;
            }
            if (vanaDay == DAYTYPE::EARTHSDAY)
            {
                bonus += 3000;
            }
            break;
        case PETID_DARKSPIRIT:
            if (zoneWeather == WEATHER_GLOOM || zoneWeather == WEATHER_DARKNESS)
            {
                bonus -= 2000;
            }
            if (zoneWeather == WEATHER_AURORAS || zoneWeather == WEATHER_STELLAR_GLARE)
            {
                bonus += 2000;
            }
            if (vanaDay == DAYTYPE::DARKSDAY)
            {
                bonus -= 3000;
            }
            if (vanaDay == DAYTYPE::LIGHTSDAY)
            {
                bonus += 3000;
            }
            break;
        case PETID_LIGHTSPIRIT:
            if (zoneWeather == WEATHER_AURORAS || zoneWeather == WEATHER_STELLAR_GLARE)
            {
                bonus -= 2000;
            }
            if (zoneWeather == WEATHER_GLOOM || zoneWeather == WEATHER_DARKNESS)
            {
                bonus += 2000;
            }
            if (vanaDay == DAYTYPE::LIGHTSDAY)
            {
                bonus -= 3000;
            }
            if (vanaDay == DAYTYPE::DARKSDAY)
            {
                bonus += 3000;
            }
            break;
    }

    return bonus;
}

CBattleEntity* CSpiritController::GetLowestThresholdHPMember()
{
            CBattleEntity* PLowest       = nullptr;
            float          lowestPercent = 1.f;

            // The SMN always takes priority over the rest of the alliance.
            if( PSpirit->PMaster->GetHPP() <= 0.5f)
            return PSpirit->PMaster;
            // clang-format off
            // Light Spirit cures/curagas can target other alliance members.
            // Light Spirit does not cast cures on invisible players, no matter how low their HP is.
            PSpirit->PMaster->ForAlliance([&](CBattleEntity* PMember)
            {
                if (PMember != nullptr && PSpirit->PMaster->loc.zone->GetID() == PMember->loc.zone->GetID() && distance(PSpirit->loc.p, PMember->loc.p) <= 20 &&
                    !PMember->isDead() && !PMember->StatusEffectContainer->HasStatusEffect(EFFECT_INVISIBLE) && PMember->GetHPP() <= 0.5f)
                {
                    float memberPercent = PMember->health.hp / PMember->health.maxhp;
                    if (PLowest == nullptr ||
                        (lowestPercent >= memberPercent))
                    {
                        PLowest = PMember;
                        lowestPercent = memberPercent;
                    }
                }
            });
            // clang-format on

            return PLowest;
}
uint8 CSpiritController::GetLowestHPThresholdCountForParty(CBattleEntity& target)
{
    uint8 numMeetsThreshold = 0;
    // clang-format off
    target.ForParty([&](CBattleEntity* PMember)
    {
        // Check to see how many low HP party members are there in Curaga range.
        if(PMember != nullptr && PSpirit->PMaster->loc.zone->GetID() == PMember->loc.zone->GetID() &&
           distance(PSpirit->loc.p, PMember->loc.p) <= 20 && !PMember->isDead() && PMember->GetHPP() <= 0.5f)
           {
                numMeetsThreshold++;
           }
    });
    // clang-format on

    return numMeetsThreshold;
}

uint16 CSpiritController::DetermineHighestSpellFromMP(std::vector<uint16> &spellList)
{
    for(
        std::vector<uint16>::iterator spellIterator = spellList.end();
        spellIterator >= spellList.begin();
        spellIterator--
    ) {
        CSpell* spell = new CSpell(static_cast<SpellID>(*spellIterator));
        uint16 spellMPCost = spell->getMPCost();
        if(static_cast<CBattleEntity*>(PSpirit)->health.mp >= spellMPCost)
        {
            return static_cast<uint16>(*spellIterator);
        }
    }
    return static_cast<uint16>(0);
}

void CSpiritController::CastIdleSpell(SpellID spellId, uint16 target)
{

}