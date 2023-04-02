------------------------------------
-- Carbuncle Debacle
-- !addquest 2 83
-- Koru-moru !pos -120 -6 124 239
--
------------------------------------
require('scripts/globals/items')
require('scripts/globals/keyitems')
require('scripts/globals/npc_util')
require('scripts/globals/quests')
require('scripts/globals/status')
require('scripts/globals/interaction/quest')
-----------------------------------------------
local windyWallsID = require("scripts/zones/Windurst_Walls/IDs")
local windyWatersID = require("scripts/zones/Windurst_Waters/IDs")
-----------------------------------------------

local quest = Quest:new(xi.quest.log_id.WINDURST, xi.quest.id.windurst.CLASS_REUNION)

quest.reward =
{
    item            =   xi.items.EVOKERS_HORN,
    fame            =   60,
    fameArea        =   xi.quest.fame_area.WINDURST,
}

quest.sections =
{
    --Section: Quest Available

    {
        check = function(player, status, vars)
            return status == QUEST_AVAILABLE and
                player:getMainJob() == xi.jobs.SMN and
                player:getMainLvl() >= xi.settings.main.AF3_QUEST_LEVEL and
                player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.CLASS_REUNION) == QUEST_COMPLETE
        end,

        [xi.zone.WINDURST_WALLS] =
        {
            ['_6n2'] =
            {

                onTrigger = function(player, npc)
                    if player:getVar("Quest[2][82]Prog") == 0 then
                        return quest:progressEvent(415)
                    elseif player:getVar("Quest[2][82]Prog") == 1 then
                        return event(403)
                    end
                end,

                onEventFinish =
                {
                    [415] = function(player, csid, option, npc)
                            quest:begin(player)
                            quest:setVar(player, 'Prog', 1)
                    end,
                },
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == QUEST_ACCEPTED
        end,

        --Section: Quest Accepted
        [xi.zone.WINDURST_WALLS] =
        {
            ['Koru-Moru'] =
            {
                onTrigger = function(player, npc)
                    local questProgress = quest:getVar(player, 'Prog')

                    if questProgress == 1 or questProgress == 2 then
                        return quest:progressEvent(416)
                    elseif questProgress == 4 then
                        return quest:progressEvent(417)
                    elseif questProgress == 7 then
                        return quest:progressEvent(419)
                    elseif quest:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.CARBUNCLE_DEBACLE) == QUEST_COMPLETE then
                        return player:event(420)
                    end
                end,

                onEventFinish =
                {
                    [416] = function(player, csid, option, npc)
                        quest:setVar(player, 'Prog', 2)
                        npcUtil.addKeyItem(xi.ki.DAZE_BREAKER_CHARM)
                    end,

                    [417] = function(player, csid, option, npc)
                        quest:setVar(player, 'Prog', 5)
                        npcUtil.addKeyItem(xi.ki.DAZE_BREAKER_CHARM)
                    end,

                    [419] = function(player, csid, option, npc)
                        quest:complete(player)
                    end
                }
            }
        },

        [xi.zone.MHAURA] =
        {
            ['Ripapa'] =
            {
                onTrigger = function(player, npc)
                    local questProgress = quest:getVar(player, 'Prog')

                    if questProgress == 2 then
                        return quest:progressEvent(10022)
                    elseif questProgress == 3 and not player:hasItem(xi.items.LIGHTNING_PENDULUM) then
                        return quest:progressEvent(10023)
                    end
                end,

                onEventFinish =
                {
                    [10022] = function(player, csid, option, npc)
                        npcUtil.giveItem(xi.items.LIGHTNING_PENDULUM)
                        quest:setVar(player, 'Prog', 3)
                    end,

                    [10023] = function(player, csid, option, npc)
                        npcUtil.giveItem(xi.items.LIGHTNING_PENDULUM)
                    end
                }
            }
        },

        [xi.zone.CLOISTER_OF_STORMS] =
        {
            onEventFinish =
            {
                [32001] = function(player, csid, option, npc)

                        if player:getLocalVar('battlefieldWin') == 577 and questProgress == 3 then
                           quest:setVar(player, 'Prog', 5)
                           player:delKeyItem(xi.ki.DAZE_BREAKER_CHARM)
                        end
                    end
            },
        },

        [xi.zone.RABAO] =
        {
            ['Agado-Pugado'] =
            {
                onTrigger = function(player, npc)
                    local questProgress = quest:getVar(player, 'Prog')

                    if questProgress == 5 and player:hasKeyItem(xi.ki.DAZE_BREAKER_CHARM) then
                        return quest:progressEvent(86)
                    elseif questprogress == 6 then
                        return quest:event(87)
                    else
                        return event(88)
                    end
                end,

                onEventFinish =
                {
                    [86] = function(player, csid, option, npc)
                        npcUtil.giveItem(xi.items.WIND_PENDULUM)
                        quest:setVar(player, 'Prog', 6)
                    end,

                    [87] = function(player, csid, option, npc)
                        npcUtil.giveItem(xi.items.WIND_PENDULUM)
                    end
                }
            }
        },

        [xi.zone.CLOISTER_OF_GALES] =
        {
            onEventFinish =
            {
                [32001] = function(player, csid, option, npc)
                    if player:getLocalVar('battlefieldWin') == 577 and questProgress == 6 then
                        quest:setVar(player, 'Prog', 7)
                        player:delKeyItem(xi.ki.DAZE_BREAKER_CHARM)
                    end
                end
            },
        },
    }

}
return quest