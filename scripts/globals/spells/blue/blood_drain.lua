-----------------------------------
-- Spell: Blood Drain
-- Steals an enemy's HP. Ineffective against undead
-- Spell cost: 10 MP
-- Monster Type: Birds
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 2
-- Stat Bonus: HP-5, MP+5
-- Level: 20
-- Casting Time: 4 seconds
-- Recast Time: 90 seconds
-- Magic Bursts on: Compression, Gravitation, Darkness
-- Combos: None
-----------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.diff = caster:getStat(xi.mod.MND)-target:getStat(xi.mod.MND)
    params.attribute = xi.mod.MND
    params.skillType = xi.skill.BLUE_MAGIC
    params.bonus = 1.0
    local resist = xi.magic.applyResistance(caster, target, spell, params)
    dmg = dmg*resist
    dmg = xi.magic.addBonuses(caster, spell, target, dmg)
    dmg = xi.magic.adjustForTarget(target, dmg, spell:getElement())
    if (dmg > (caster:getSkillLevel(xi.skill.BLUE_MAGIC) + 20)) then
        dmg = (caster:getSkillLevel(xi.skill.BLUE_MAGIC) + 20)
    end

    if (dmg < 0) then
        dmg = 0
    end

    if (target:isUndead()) then
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
        return dmg
    end

    if (target:getHP() < dmg) then
        dmg = target:getHP()
    end

    params.attackType = xi.attackType.MAGICAL
    params.damageType = xi.damageType.DARK
    params.diff = 0 -- no stat increases magic accuracy
    params.skillType = xi.skill.BLUE_MAGIC
    params.dmgMultiplier = 3

    return xi.spells.blue.useDrainSpell(caster, target, spell, params, 0, false)
end

return spellObject
