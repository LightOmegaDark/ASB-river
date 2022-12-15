-----------------------------------
-- Chasing Dreams
-----------------------------------
-- Log ID: 5, Quest ID: 195
--  Datta: !pos -6 -25 5
-----------------------------------
require('scripts/globals/items')
require('scripts/globals/npc_util')
require('scripts/globals/quests')
require('scripts/globals/titles')
require('scripts/globals/zone')
require('scripts/globals/interaction/quest')
-----------------------------------

local quest = Quest:new(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.CHASING_DREAMS)

quest.reward =
{
    fame     = 30,
    item     = xi.items.VENERER_RING,
    fameArea = xi.quest.fame_area.SELBINA_RABAO,
    gil      = 4000,
}

local handleFlask = function(player)
    if quest:isVarBitsSet(player, 'Option', 1, 2, 3, 4) then
        npcUtil.delKeyItem(xi.ki.WASHUS_FLASK)
        npcUtil.giveKeyItem(player, xi.ki.FLASK_OF_CLAM_WATER)
        quest:setVar(player, 'Prog', 4)
    end
end

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == QUEST_AVAILABLE
        end,

        [xi.zone.RABAO] =
        {
            ['Rudolfo'] = quest:progressEvent(0),

            onEventFinish =
            {
                [0] = function(player, csid, option, npc)
                    if option == 0 then
                        quest:begin(player)
                    end
                end,
            },
        },
    },

    {
        -- Quest stage preceding and including getting clam water
        check = function(player, status, vars)
            return status == QUEST_ACCEPTED and vars.Prog <= 3
        end,

        [xi.zone.RABAO] =
        {
            ['Zoriboh'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 0 then
                        return quest:progressEvent(0)
                    end
                end,
            },

            onEventFinish =
            {
                [0] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 1)
                end,
            },
        },

        [xi.zone.NORG] =
        {
            ['Sohyon'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 1 then
                        return quest:progressEvent(0)
                    end
                end,
            },

            ['Washu'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 2 then
                        return quest:progressEvent(1)
                    end
                end,
            },

            onEventFinish =
            {
                [0] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 2)
                end,
                [1] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, xi.ki.WASHUS_FLASK)
                    quest:setVar(player, 'Prog', 3)
                end,
            },
        },

        [xi.zone.KORROLOKA_TUNNEL] =
        {
            ['_4t0'] =
            {
                onTrigger = function(player, npc)
                    if
                        not quest:isVarBitsSet(player, 'Option', 1) and
                        player:hasKeyItem(xi.ki.WASHUS_FLASK)
                    then
                        return quest:progressEvent(549)
                    end
                end,
            },
            ['_4t1'] =
            {
                onTrigger = function(player, npc)
                    if
                        not quest:isVarBitsSet(player, 'Option', 2) and
                        player:hasKeyItem(xi.ki.WASHUS_FLASK)
                    then
                        return quest:progressEvent(551)
                    end
                end,
            },
            ['_4t2'] =
            {
                onTrigger = function(player, npc)
                    if
                        not quest:isVarBitsSet(player, 'Option', 3) and
                        player:hasKeyItem(xi.ki.WASHUS_FLASK)
                    then
                        return quest:progressEvent(553)
                    end
                end,
            },
            ['_4t3'] =
            {
                onTrigger = function(player, npc)
                    if
                        not quest:isVarBitsSet(player, 'Option', 4) and
                        player:hasKeyItem(xi.ki.WASHUS_FLASK)
                    then
                        return quest:progressEvent(555)
                    end
                end,
            },

            onEventFinish =
            {
                [549] = function(player, csid, option, npc)
                    quest:setVarBit(player, 'Option', 1)
                    handleFlask(player)
                end,
                [551] = function(player, csid, option, npc)
                    quest:setVarBit(player, 'Option', 2)
                    handleFlask(player)
                end,
                [553] = function(player, csid, option, npc)
                    quest:setVarBit(player, 'Option', 3)
                    handleFlask(player)
                end,
                [555] = function(player, csid, option, npc)
                    quest:setVarBit(player, 'Option', 4)
                    handleFlask(player)
                end,
            },
        },
    },

    {
        -- Quest section suceeding having gathered the clam water
        check = function(player, status, vars)
            return status == QUEST_ACCEPTED and vars.Prog >= 4
        end,

        [xi.zone.NORG] =
        {
            ['Sohyon'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:hasKeyItem(xi.ki.FLASK_OF_CLAM_WATER) and
                        not player:hasKeyItem(xi.ki.STOREROOM_KEY)
                    then
                        return quest:progressEvent(0)
                    end
                end,
            },

            ['Gimb'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(xi.ki.FLASK_OF_CLAM_WATER) then
                        return quest:progressEvent(1)
                    end
                end,
            },

            onEventFinish =
            {
                [0] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, xi.ki.STOREROOM_KEY)
                end,
                [1] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 5)
                end,
            },
        },

        [xi.zone.PORT_BASTOK] =
        {
            ['Kagetora'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 5 then
                        return quest:progressEvent(0)
                    end
                end,
            },

            ['Patient_Wheel'] =
            {
                onTrade = function(player, npc, trade)
                    if
                        npcUtil.tradeHasExactly(trade, { { xi.items.EASTERN_GEM, 5 } }) and
                        quest:getVar(player, 'Prog') == 6
                    then
                        return quest:progressEvent(0)
                    end
                end,
            },

            onEventFinish =
            {
                [0] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 6)
                end,
                [1] = function(player, csid, option, npc)
                    player:confirmTrade()
                    quest:setVar(player, 'Prog', 7)
                end,
            },
        },

        [xi.zone.SELBINA] =
        {
            ['Abelard'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 7 then
                        return quest:progressEvent(0)
                    end
                end,
            },

            onEventFinish =
            {
                [0] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 8)
                end,
            },
        },

        [xi.zone.LUFAISE_MEADOWS] =
        {
            onZonein =
            {
                function(player, prevZone)
                    if quest:getVar(player, 'Prog') == 8 and prevZone:getID() == xi.zone.VALKURM_DUNES then
                        return 0
                    end
                end,
            },

            onEventFinish =
            {
                [0] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 9)
                end,
            },
        },

        [xi.zone.RABAO] =
        {
            ['Zoriboh'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 9 then
                        return quest:progressEvent(0)
                    end
                end,
            },

            onEventFinish =
            {
                [0] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        npcUtil.delKeyItem(xi.ki.STOREROOM_KEY)
                    end
                end,
            },
        },
    },
}

return quest
