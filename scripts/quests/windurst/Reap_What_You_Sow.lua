-----------------------------------
-- Reap What You sow
-----------------------------------
-- !addquest 2 29
-- Mashuu-Ajuu 130 -5 167
-----------------------------------
require('scripts/globals/items')
require('scripts/globals/quests')
require('scripts/globals/interaction/quest')
-----------------------------------
local ID = require('scripts/zones/Windurst_Waters/IDs')
-----------------------------------

local quest = Quest:new(xi.quest.log_id.WINDURST, xi.quest.id.windurst.REAP_WHAT_YOU_SOW)

quest.reward =
{
    gil = 700,
    fame = 75,
    fameArea = xi.quest.fame_area.WINDURST,
    item = xi.items.STATIONERY_SET
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == QUEST_AVAILABLE
        end,

        [xi.zone.WINDURST_WATERS] =
        {
            ['Mashuu-Ajuu'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:getFameLevel(xi.quest.fame_area.WINDURST) >= 4 and
                        player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.LET_SLEEPING_DOGS_LIE) ~= QUEST_COMPLETED and
                        not player:needToZone()
                    then
                        return quest:event(483)
                    end
                    return quest:progressEvent(463, 0, xi.items.SOBBING_FUNGUS, xi.items.BAG_OF_HERB_SEEDS)
                end,
            },

            onEventFinish =
            {
                [463] = function(player, csid, option, npc)
                    if npcUtil.giveItem(player, xi.items.BAG_OF_HERB_SEEDS) and option == 3 then
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
            ['Mashuu-Ajuu'] =
            {
                onTrigger = function(player, npc)
                    local rand = math.random()

                    if rand > 0.5 then
                        return quest:event(464, 0, xi.items.SOBBING_FUNGUS, xi.items.BAG_OF_HERB_SEEDS)
                    else
                        return quest:event(476)
                    end
                end,

                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, xi.items.SOBBING_FUNGUS) then
                        return quest:progressEvent(475, 500, 131)
                    elseif npcUtil.tradeHasExactly(trade, xi.items.DEATHBALL) then
                        return quest:progressEvent(477, 700)
                    end
                end,
            },

            onEventFinish =
            {
                -- 475 is a Sobbing Fungus turn-in, which allows for repeat turn-ins.
                [475] = function(player, csid, option, npc)
                    if quest:getVar(player, 'Prog') == 1 then
                        player:confirmTrade()
                        player:addGil(500)
                        return
                    end

                    if npcUtil.giveItem(player, xi.items.STATIONERY_SET) then
                        player:confirmTrade()
                        player:addGil(500)
                        quest:setVar(player, 'Prog', 1)
                    end
                end,

                -- 477 is a Deathball turn-in which officially completes the quest and stops the repeat turn-in capability
                [477] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },
    },
}

return quest
