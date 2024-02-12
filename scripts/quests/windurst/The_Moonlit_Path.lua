-----------------------------------
-- The Moonlit Path
-----------------------------------
-- Log ID: 2, Quest ID: 9
-- Leepe-Hoppe            : !pos 13 -9 -197 238
-- Wind Protocrystal      : !pos -361 1 -381 201
-- Lightning Protocrystal : !pos 534.5 -13 492 202
-- Ice Protocrystal       : !pos 558 0 596 203
-- Fire Protocrystal      : !pos -721 0 -598 207
-- Earth Protocrystal     : !pos -539 1 -493 209
-- Water Protocrystal     : !pos 560 36 560 211
-- Moon Spiral            : !pos -302 9 -260 170
-----------------------------------
-- Quest                : !addquest 2 9
-- Whisper of Flames    : !addkeyitem 320
-- Whisper of Tremors   : !addkeyitem 321
-- Whisper of Tides     : !addkeyitem 322
-- Whisper of Gales     : !addkeyitem 323
-- Whisper of Frost     : !addkeyitem 324
-- Whisper of Storms    : !addkeyitem 325
-- Moon Bauble          : !addkeyitem 334
-- Whisper of The Moon  : !addkeyitem 326
-----------------------------------
require('scripts/globals/interaction/quest')
require('scripts/globals/npc_util')
require('scripts/globals/quests')
require('scripts/globals/titles')
require('scripts/globals/zone')
-----------------------------------
local windurstWatersID  = require("scripts/zones/Windurst_Waters/IDs")
-----------------------------------
local quest = Quest:new(xi.quest.log_id.WINDURST, xi.quest.id.windurst.THE_MOONLIT_PATH)

local function getFenrirRewardMask(player)
    local rewardMask = 0

    if player:findItem(xi.items.FENRIRS_STONE) then
        rewardMask = rewardMask + 1
    end -- Fenrir's Stone

    if player:findItem(xi.items.FENRIRS_CAPE) then
        rewardMask = rewardMask + 2
    end -- Fenrir's Cape

    if player:findItem(xi.items.FENRIRS_TORQUE) then
        rewardMask = rewardMask + 4
    end -- Fenrir's Torque

    if player:findItem(xi.items.FENRIRS_EARRING) then
        rewardMask = rewardMask + 8
    end -- Fenrir's Earring

    if
        player:findItem(xi.items.ANCIENTS_KEY) or
        player:getQuestStatus(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.MAMA_MIA) == QUEST_COMPLETED
    then
        rewardMask = rewardMask + 16
    end -- Ancient's Key

    if player:hasSpell(xi.magic.spell.FENRIR) then
        rewardMask = rewardMask + 64
    end  -- Pact

    if
        not player:hasKeyItem(xi.ki.TRAINERS_WHISTLE) or
        player:hasKeyItem(xi.ki.FENRIR_WHISTLE)
    then
        rewardMask = rewardMask + 128
    end -- Mount Pact

    return rewardMask
end

quest.reward =
{
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == QUEST_AVAILABLE and
            player:getFameLevel(xi.quest.fame_area.WINDURST) >= 6 and
            player:getFameLevel(xi.quest.fame_area.SANDORIA) >= 6 and
            player:getFameLevel(xi.quest.fame_area.BASTOK) >= 6 and
            player:getFameLevel(xi.quest.fame_area.NORG) >= 4
        end,

        [xi.zone.WINDURST_WATERS] =
        {
            ['Leepe-Hoppe'] =
            {
                onTrigger = function(player, npc)
                    return quest:progressEvent(842, 0, xi.items.CARBUNCLES_RUBY)
                end,
            },

            onEventFinish =
            {
                [842] = function(player, csid, option, npc)
                    if option == 2 then
                        quest:begin(player)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == QUEST_ACCEPTED
        end,

        [xi.zone.WINDURST_WATERS] =
        {
            ['Leepe-Hoppe'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(xi.ki.MOON_BAUBLE) then
                        return quest:event(845, 0, xi.items.CARBUNCLES_RUBY, xi.ki.MOON_BAUBLE) -- Default text after acquiring moon bauble and before fighting Fenrir
                    elseif player:hasKeyItem(xi.ki.WHISPER_OF_THE_MOON) then
                        local availRewards = 0
                        if
                            not player:hasKeyItem(xi.ki.TRAINERS_WHISTLE) or
                            player:hasKeyItem(xi.ki.FENRIR_WHISTLE)
                        then
                            availRewards = availRewards + 128 -- Mount Pact
                        end

                        return quest:progressEvent(846, 0, xi.items.FENRIRS_EARRING, xi.items.ANCIENTS_KEY, xi.items.CARBUNCLES_RUBY, availRewards, xi.items.FENRIRS_STONE, xi.items.FENRIRS_CAPE) -- Quest turn-in
                    elseif
                        player:hasKeyItem(xi.ki.WHISPER_OF_FLAMES) and
                        player:hasKeyItem(xi.ki.WHISPER_OF_TREMORS) and
                        player:hasKeyItem(xi.ki.WHISPER_OF_TIDES) and
                        player:hasKeyItem(xi.ki.WHISPER_OF_GALES) and
                        player:hasKeyItem(xi.ki.WHISPER_OF_FROST) and
                        player:hasKeyItem(xi.ki.WHISPER_OF_STORMS)
                    then
                        return quest:progressEvent(844, 0, xi.items.CARBUNCLES_RUBY, xi.ki.MOON_BAUBLE) -- Collected all whispers
                    else
                        return quest:event(843, 0, xi.items.CARBUNCLES_RUBY) -- Talked to after flag without the whispers
                    end
                end,
            },

            onEventFinish =
            {
                [844] = function(player, csid, option, npc)
                    player:addKeyItem(xi.ki.MOON_BAUBLE)
                    player:messageSpecial(windurstWatersID.text.KEYITEM_OBTAINED, xi.ki.MOON_BAUBLE)
                    player:delKeyItem(xi.ki.WHISPER_OF_FLAMES)
                    player:delKeyItem(xi.ki.WHISPER_OF_TREMORS)
                    player:delKeyItem(xi.ki.WHISPER_OF_TIDES)
                    player:delKeyItem(xi.ki.WHISPER_OF_GALES)
                    player:delKeyItem(xi.ki.WHISPER_OF_FROST)
                    player:delKeyItem(xi.ki.WHISPER_OF_STORMS)
                    player:delQuest(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.TRIAL_BY_FIRE)
                    player:delQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.TRIAL_BY_EARTH)
                    player:delQuest(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.TRIAL_BY_WATER)
                    player:delQuest(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.TRIAL_BY_WIND)
                    player:delQuest(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.TRIAL_BY_ICE)
                    player:delQuest(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.TRIAL_BY_LIGHTNING)
                end,

                [846] = function(player, csid, option, npc)
                    local reward = 0
                    if option == 1 then
                        reward = xi.items.FENRIRS_STONE
                    elseif option == 2 then
                        reward = xi.items.FENRIRS_CAPE
                    elseif option == 3 then
                        reward = xi.items.FENRIRS_TORQUE
                    elseif option == 4 then
                        reward = xi.items.FENRIRS_EARRING
                    elseif option == 5 then
                        reward = xi.items.ANCIENTS_KEY
                    elseif option == 6 then
                        npcUtil.giveCurrency(player, 'gil', 15000)
                    elseif option == 7 then
                        player:addSpell(xi.magic.spell.FENRIR) -- Pact
                    elseif option == 8 then
                        npcUtil.giveKeyItem(player, xi.ki.FENRIR_WHISTLE) -- Pact as Mount
                    end

                    if
                        player:getFreeSlotsCount() > 0 or
                        reward == 0
                    then
                        player:addTitle(xi.title.HEIR_OF_THE_NEW_MOON)
                        player:delKeyItem(xi.ki.WHISPER_OF_THE_MOON)
                        player:setCharVar("MoonlitPath_date", getMidnight())
                        player:addFame(xi.quest.fame_area.WINDURST, 30)

                        quest:complete(player)

                        if reward ~= 0 then
                            npcUtil.giveItem(player, reward)
                        end

                        if
                            player:getRank(xi.nation.WINDURST) == 10
                        then
                            npcUtil.giveKeyItem(player, xi.ki.DARK_MANA_ORB)
                        end
                    else
                        player:messageSpecial(windurstWatersID.text.ITEM_CANNOT_BE_OBTAINED, reward)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == QUEST_COMPLETED
        end,

        [xi.zone.WINDURST_WATERS] =
        {
            ['Leepe-Hoppe'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(xi.ki.MOON_BAUBLE) then -- Default text after acquiring moon bauble and before fighting Fenrir
                        return quest:event(845, 0, xi.items.CARBUNCLES_RUBY, xi.ki.MOON_BAUBLE)
                    elseif player:hasKeyItem(xi.ki.WHISPER_OF_THE_MOON) then -- Repeat turn-in
                        local availRewards = getFenrirRewardMask(player)
                        return quest:progressEvent(850, 0, xi.items.FENRIRS_EARRING, xi.items.ANCIENTS_KEY, xi.items.CARBUNCLES_RUBY, availRewards, xi.items.FENRIRS_STONE, xi.items.FENRIRS_CAPE)
                    elseif os.time() < player:getCharVar("MoonlitPath_date") then --24 hours have passed, flag a new fight
                        return quest:event(848, 0, xi.items.CARBUNCLES_RUBY, xi.ki.MOON_BAUBLE)
                    else
                        return quest:event(847, 0, xi.items.CARBUNCLES_RUBY) -- Having completed Moonlit Path, this will indefinitely replace his standard dialogue!
                    end
                end,
            },

            onEventFinish =
            {
                [848] = function(player, csid, option, npc)
                    if option == 2 then
                        npcUtil.giveKeyItem(player, xi.ki.MOON_BAUBLE)
                    end
                end,

                [850] = function(player, csid, option, npc)
                    local reward = 0
                    if option == 1 then
                        reward = xi.items.FENRIRS_STONE
                    elseif option == 2 then
                        reward = xi.items.FENRIRS_CAPE
                    elseif option == 3 then
                        reward = xi.items.FENRIRS_TORQUE
                    elseif option == 4 then
                        reward = xi.items.FENRIRS_EARRING
                    elseif option == 5 then
                        reward = xi.items.ANCIENTS_KEY
                    elseif option == 6 then
                        npcUtil.giveCurrency(player, 'gil', 15000)
                    elseif option == 7 then
                        player:addSpell(xi.magic.spell.FENRIR) -- Pact
                    elseif option == 8 then
                        npcUtil.giveKeyItem(player, xi.ki.FENRIR_WHISTLE) -- Pact as Mount
                    end

                    if
                        player:getFreeSlotsCount() > 0 or
                        reward == 0
                    then
                        player:addTitle(xi.title.HEIR_OF_THE_NEW_MOON)
                        player:delKeyItem(xi.ki.WHISPER_OF_THE_MOON)
                        player:setCharVar("MoonlitPath_date", getMidnight())
                        player:addFame(xi.quest.fame_area.WINDURST, 30)

                        if reward ~= 0 then
                            npcUtil.giveItem(player, reward)
                        end

                        if
                            player:getRank(xi.nation.WINDURST) == 10
                        then
                            npcUtil.giveKeyItem(player, xi.ki.DARK_MANA_ORB)
                        end
                    else
                        player:messageSpecial(windurstWatersID.text.ITEM_CANNOT_BE_OBTAINED, reward)
                    end
                end,
            },
        },
    },
}

return quest