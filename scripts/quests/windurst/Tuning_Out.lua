-----------------------------------
-- Tuning Out
-----------------------------------
-- Log ID: 2, Quest ID: 91
-- Leepe-Hoppe       : !pos 13 -9 -197 238
-- Jakoh Wahcondalo  : !pos 101 -16 -115 250
-- Romaa Mihgo       : !pos 29 -13 -176 250
-- qm2 Waterfall     : !pos 362 4 220 123
-- Comitiolus        : !pos 100 -7 -13 252
-- Torino-Samarino   : !pos 105 -20 140 111
-----------------------------------
-- !addquest 2 91
-- !additem 1695
-- !additem 4297
-- !additem 4506
-----------------------------------
require('scripts/globals/interaction/quest')
require('scripts/globals/npc_util')
require('scripts/globals/quests')
require('scripts/globals/titles')
require('scripts/globals/zone')
-----------------------------------
local yuhtungaID  = require("scripts/zones/Yuhtunga_Jungle/IDs")
-----------------------------------
local quest = Quest:new(xi.quest.log_id.WINDURST, xi.quest.id.windurst.TUNING_OUT)

quest.reward =
{
    title    = xi.title.FRIEND_OF_THE_HELMED,
    item     = xi.items.CACHE_NEZ,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return (status == QUEST_AVAILABLE and
                player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.TUNING_IN) == QUEST_COMPLETED and
                os.time() > player:getCharVar("tuningIn_date")) or
                quest:getVar(player, 'Prog') == 1
        end,

        [xi.zone.WINDURST_WATERS] =
        {
            ['Leepe-Hoppe'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 1 then
                        return quest:event(889) -- Reminder to go help Ildy in Kazham
                    else
                        return quest:progressEvent(888) -- Starting dialogue
                    end
                end,
            },

            onEventFinish =
            {
                [888] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 1)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return quest:getVar(player, 'Prog') >= 1 and quest:getVar(player, 'Prog') <= 8
        end,

        [xi.zone.KAZHAM] =
        {
            ['Jakoh_Wahcondalo'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 1 then
                        return quest:progressEvent(293) -- Ildy meets Jakoh to inquire about Shikaree Y
                    elseif quest:getVar(player, 'Prog') == 2 then
                        return quest:event(294) -- Mentions expedition that was talked about in CS 293
                    end
                end,
            },

            ['Romaa_Mihgo'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 2 then
                        return quest:progressEvent(295) -- Ildy meets Romaa. Romaa tells player to go to waterfall
                    elseif quest:getVar(player, 'Prog') == 3 or quest:getVar(player, 'Prog') == 4 then
                        return quest:event(296) -- Repeats hint to go to waterfall
                    elseif quest:getVar(player, 'Prog' == 5) then
                        return quest:progressEvent(297, 0, xi.items.HABANEROS, xi.items.BLACK_CURRY, xi.items.MUTTON_TORTILLA) -- After fight with the Nasus. Mentions guard needs Habaneros, Black Curry, Mutton Tortilla
                    elseif quest:getVar(player, 'Prog' == 6) then
                        return quest:event(298, 0, xi.items.HABANEROS, xi.items.BLACK_CURRY, xi.items.MUTTON_TORTILLA) -- Repeats guard need for Habaneros, Black Curry, Mutton Tortilla
                    end
                end,
            },

            onEventFinish =
            {
                [293] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 2)
                end,

                [295] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 3)
                end,

                [297] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 6)
                end,
            },
        },

        [xi.zone.NORG] =
        {
            ['Comitiolus'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 6 then
                        return quest:progressEvent(206) -- Declines request to speak to Kamui
                    elseif quest:getVar(player, 'Prog') == 7 then
                        return quest:event(208) -- Repeat hint for player to go to Beaucedine Glacier
                    end
                end,

                onTrade = function(player, npc, trade)
                    if
                        npcUtil.tradeHasExactly(trade, { xi.items.HABANEROS, xi.items.BLACK_CURRY, xi.items.MUTTON_TORTILLA }) and
                        quest:getVar(player, 'Prog', 6)
                    then
                        return quest:progressEvent(207, 0, xi.items.HABANEROS) -- Receives spicy food, mentions only Habaneros
                    end
                end,
            },

            onEventFinish =
            {
                [207] = function(player, csid, option, npc)
                    player:confirmTrade()
                    quest:setVar(player, 'Prog', 7)
                end,
            },
        },

        [xi.zone.BEAUCEDINE_GLACIER] =
        {
            ['Torino-Samarino'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 7 then
                        return quest:progressEvent(207) -- Ildy meets up with Rhinostery peers
                    elseif quest:getVar(player, 'Prog') == 8 then
                        return quest:event(208) -- Talks about Ildy being passionate about his work
                    end
                end,
            },

            onEventFinish =
            {
                [207] = function(player, csid, option, npc)
                    npcUtil.giveCurrency(player, "gil", 6000)
                    quest:setVar(player, 'Prog', 8)
                end,
            },
        },

        [xi.zone.WINDURST_WATERS] =
        {
            ['Leepe-Hoppe'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 8 then
                        return quest:progressEvent(897) -- Finishing dialogue
                    end
                end,
            },

            onEventFinish =
            {
                [897] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        quest:setVar(player, 'Prog', 0) -- zero when quest is done
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == QUEST_ACCEPTED and
                quest:getVar(player, 'Prog') == 3 or
                quest:getVar(player, 'Prog') == 4
        end,

        [xi.zone.YUHTUNGA_JUNGLE] =
        {
            ['qm2'] =
            {
                onTrigger = function(player, npc)
                    if os.time() >= npc:getLocalVar("cooldown") then
                        if quest:getVar(player, 'Prog') == 3 then
                            return quest:progressEvent(28)
                        elseif quest:getVar(player, 'Prog') == 4 then
                            npc:setLocalVar("QuestPlayer", player:getID())
                            npc:setLocalVar("cooldown", os.time() + 900)
                            npc:setLocalVar("NasusKilled", 0)
                            npcUtil.popFromQM(player, npc, {
                                yuhtungaID.mob.NASUS_OFFSET,
                                yuhtungaID.mob.NASUS_OFFSET + 1,
                                yuhtungaID.mob.NASUS_OFFSET + 2,
                                yuhtungaID.mob.NASUS_OFFSET + 3,
                                yuhtungaID.mob.NASUS_OFFSET + 4
                            }, { claim = true, hide = 0 })
                            return quest:messageSpecial(yuhtungaID.text.SWARM_APPEARED)
                        end
                    elseif npc:getLocalVar("NasusKilled") == 1 then
                        return quest:progressEvent(29)
                    else
                        return quest:messageSpecial(yuhtungaID.text.NOTHING_HAPPENS)
                    end
                end,
            },

            ['Nasus'] =
            {
                onMobDeath = function(mob, player, optParams)
                    if
                        GetMobByID(yuhtungaID.mob.NASUS_OFFSET):isDead() and
                        GetMobByID(yuhtungaID.mob.NASUS_OFFSET + 1):isDead() and
                        GetMobByID(yuhtungaID.mob.NASUS_OFFSET + 2):isDead() and
                        GetMobByID(yuhtungaID.mob.NASUS_OFFSET + 3):isDead() and
                        GetMobByID(yuhtungaID.mob.NASUS_OFFSET + 4):isDead() and
                        (quest:getVar(player, 'Prog') == 3 or
                        quest:getVar(player, 'Prog') == 4) and
                        GetNPCByID(yuhtungaID.npc.TUNING_OUT_QM):getLocalVar("QuestPlayer") == player:getID()
                    then
                        GetNPCByID(yuhtungaID.npc.TUNING_OUT_QM):setLocalVar("NasusKilled", 1)
                    end
                end,
            },

            onEventFinish =
            {
                [28] = function(player, csid, option, npc)
                    if
                        GetMobByID(yuhtungaID.mob.NASUS_OFFSET):isAlive() or
                        GetMobByID(yuhtungaID.mob.NASUS_OFFSET + 1):isAlive() or
                        GetMobByID(yuhtungaID.mob.NASUS_OFFSET + 2):isAlive() or
                        GetMobByID(yuhtungaID.mob.NASUS_OFFSET + 3):isAlive() or
                        GetMobByID(yuhtungaID.mob.NASUS_OFFSET + 4):isAlive()
                    then
                    else
                        quest:setVar(player, 'Prog', 4)
                        npc:setLocalVar("QuestPlayer", player:getID())
                        npc:setLocalVar("cooldown", os.time() + 900)
                        npc:setLocalVar("NasusKilled", 0)
                        npcUtil.popFromQM(player, npc, {
                            yuhtungaID.mob.NASUS_OFFSET,
                            yuhtungaID.mob.NASUS_OFFSET + 1,
                            yuhtungaID.mob.NASUS_OFFSET + 2,
                            yuhtungaID.mob.NASUS_OFFSET + 3,
                            yuhtungaID.mob.NASUS_OFFSET + 4
                        }, { claim = true, hide = 0 })
                        return quest:messageSpecial(yuhtungaID.text.SWARM_APPEARED)
                    end
                end,

                [29] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 5)
                end,
            }
        },
    },
}

return quest
