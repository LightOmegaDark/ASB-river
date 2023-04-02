-----------------------------------------------
--  Class Reunion
-- !addquest 2 82
-- Koru-Moru !pos -120 -6 124 239
--
-----------------------------------------------
require('scripts/globals/items')
require("scripts/globals/keyitems")
require('scripts/globals/npc_util')
require('scripts/globals/quests')
require("scripts/globals/status")
require('scripts/globals/interaction/quest')
-----------------------------------------------

local quest = Quest:new(xi.quest.log_id.WINDURST, xi.quest.id.windurst.CLASS_REUNION)

quest.reward =
{
    item        = xi.items.EVOKERS_SPATS,
    fame        = 40,
    fameArea    = xi.quest.fame_area.WINDURST,
}

quest.sections =
{
    --Section: Quest Available
    {
        check = function(player, status, vars)
            return status == QUEST_AVAILABLE and
                player:getMainJob() == xi.jobs.SMN and
                player:getMainLvl() >= xi.settings.main.AF2_QUEST_LEVEL and
                player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.THE_PUPPET_MASTER) == QUEST_COMPLETE
        end,

        [xi.zone.WINDURST_WALLS] =
        {
            ['_6n2'] =
            {

                onTrigger = function(player, npc)
                    if player:getVar("Quest[2][82]Prog") == 0 then
                        return quest:progressEvent(413)
                    elseif player:getVar("Quest[2][82]Prog") == 1 then
                        return event(403)
                    end
                end
            },

            onEventFinish =
            {
                [413] = function(player, csid, option, npc)
                        quest:begin(player)
                        npcUtil.giveKeyItem(player, xi.ki.CARBUNCLES_TEAR)
                        quest:setVar(player, 'Prog', 1)
                end,
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

                    if questProgress == 1 then
                        return quest:progressEvent(412)
                    elseif questProgress == 2 then
                        return quest:progressEvent(414)
                    elseif questProgress == 6 then
                        return quest:event(410)
                    end
                end,

                onTrade = function(player, npc, trade)
                    local questProgress = quest:getVar(player, 'Prog')

                    if questProgress == 2 then
                        if npcUtil.tradeHasExactly(trade, xi.items.ASTRAGALOS) then
                            return quest:progressEvent(407)
                        end
                    end
                end
            },

            ['Shantotto'] =
            {
                onTrigger = function(player, npc)
                    local questProgress = quest:getVar(player, 'Prog')

                    if questProgress >= 2 then
                        quest:event(409)
                    end
                end
            },

            onEventFinish =
            {
                [412] = function(player, csid, option, npc)
                    player:delKeyItem(xi.ki.CARBUNCLES_TEAR)
                    quest:setVar(player, 'Prog', 2)
                end,

                [407] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 3)
                    player:confirmTrade()
                end,

                [410] = function(player, csid, option, npc)
                    quest:complete(player)
                end

            }
        },

        [xi.zone.WINDURST_WATERS] =
        {
            ['Fuepepe'] =
            {
                onTrigger = function(player, npc)
                    local questProgress = quest:getVar(player, 'Prog')

                    if questProgress >= 2 then
                        quest:event(817)
                    end
                end
            },

            ['Furakku-Norakku'] =
            {
                onTrigger = function(player, npc)
                    local questProgress = quest:getVar(player, 'Prog')

                    if questProgress >= 2 then
                        quest:event(816)
                    end
                end
            }
        },

        [xi.zone.NORTHERN_SAN_DORIA] =
        {
            ['Gulmama'] =
            {
                onTrigger = function(player, npc)
                    local questProgress = quest:getVar(player, 'Prog')

                    if questProgress == 3 then
                        quest:progressEvent(713)
                    elseif questProgress == 4 and not player:hasItem(xi.items.ICE_PENDULUM) then
                        quest:event(712)
                    end
                end
            },

            onEventFinish =
            {
                [713] = function(player, csid, option, npc)
                    npcUtil.giveItem(xi.items.ICE_PENDULUM)
                    player:setVar(player, 'Prog', 4)
                end,

                [712] = function(player, csid, option, npc)
                    npcUtil.giveItem(xi.items.ICE_PENDULUM)
                    player:setVar(player, 'Prog', 5)
                end
            }
        },

        [xi.zone.CLOISTER_OF_FROST] =
        {
            onEventFinish =
            {
                [32001] = function(player, csid, option, npc)
                    if player:getLocalVar('battlefieldWin') == 577 and questProgress == 4 then
                        quest:setVar(player, 'Prog', 6)
                    end
                end
            },
        },
    }
}

return quest
