-----------------------------------
-- Beauty and the Galka
-----------------------------------
-- !addquest 1 1
-- 
-----------------------------------
require('scripts/globals/interaction/quest')
require("scripts/globals/items")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require('scripts/globals/quests')
require('scripts/globals/zone')

local portBastokIDs = require("scripts/zones/Port_Bastok/IDs")
-----------------------------------
local quest = Quest:new(xi.quest.log_id.BASTOK, xi.quest.id.bastok.BEAUTY_AND_THE_GALKA)

quest.reward =
{
    fame = 75,
    fameArea = xi.quest.fame_area.BASTOK,
    item = xi.items.BRONZE_KNIFE
}

quest.sections =
{
    -- Quest Acceptance 1
    {
        check = function(player, status, vars)
            return status == QUEST_AVAILABLE
        end,

        [xi.zone.PORT_BASTOK] =
        {
            ['Talib'] = quest:progressEvent(2),

            onEventFinish =
            {
                [2] = function(player, csid, option, npc)
                    if option == 1 then
                        quest:setVar(player, 'Denied', 1)
                        return
                    end
                    quest:begin(player)
                end,
            },
        },
    },

    -- Quest Acceptance 1a
    {
        check = function(player, status, vars)
            return
                status == QUEST_AVAILABLE and
                quest:getVar(player, 'Denied') == 1
        end,

        [xi.zone.BASTOK_MINES] =
        {
            ['Parraggoh'] = quest:progressEvent(7),

            onEventFinish =
            {
                [7] = function(player, csid, option, npc)
                    if option == 0 then
                        quest:begin(player)
                    end
                end,
            },
        },
    },

    -- Quest Giver after Accepted
    {
        check = function(player, status, vars)
            return status == QUEST_ACCEPTED
        end,

        [xi.zone.PORT_BASTOK] =
        {
            ['Talib'] =
            {
                onTrigger = quest:event(4),

                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, { { xi.items.CHUNK_OF_ZINC_ORE, 1 } }) then
                        return quest:progressEvent(3)
                    end
                end
            },

            onEventFinish =
            {
                [3] = function(player, csid, option, npc)
                    player:tradeComplete()
                    local palLogs = xi.ki.PALBOROUGH_MINES_LOGS
                    player:addKeyItem(palLogs)
                    quest:messageSpecial(portBastokIDs.text.KEYITEM_OBTAINED, palLogs)
                end,
            },
        }
    },

    -- Quest Complete
    {
        check = function(player, status, vars)
            return status == QUEST_ACCEPTED
        end,

        [xi.zone.BASTOK_MINES] =
        {
            ['Parraggoh'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(xi.ki.PALBOROUGH_MINES_LOGS) then
                        return quest:progressEvent(10)
                    end

                    if math.random(1, 2) == 1 then
                        return quest:event(8)
                    end
                    return quest:event(9)
                end
            },

            onEventFinish =
            {
                [10] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:tradeComplete()
                        player:delKeyItem(xi.ki.PALBOROUGH_MINES_LOGS)
                        quest:setVar(player, 'Denied', 0)
                    end
                end
            }
        }
    },

    -- After Quest Complete
    {
        check = function(player, status, vars)
            return status == QUEST_COMPLETED
        end,

        [xi.zone.BASTOK_MINES] =
        {
            ['Parraggoh'] = quest:event(12)
        }
    },
}

return quest
