-----------------------------------
-- Tuning In
-----------------------------------
-- Log ID: 2, Quest ID: 90
-- Leepe-Hoppe : !pos 13 -9 -197 238
-----------------------------------
-- !addquest 2 90
-- !additem 1696
-- !additem 1697
-- !additem 1698
-----------------------------------
require('scripts/globals/interaction/quest')
require('scripts/globals/npc_util')
require('scripts/globals/quests')
require('scripts/globals/titles')
require('scripts/globals/zone')
-----------------------------------

local quest = Quest:new(xi.quest.log_id.WINDURST, xi.quest.id.windurst.TUNING_IN)

quest.reward =
{
    title    = xi.title.FINE_TUNER,
    gil      = 4000,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == QUEST_AVAILABLE and
                player:getFameLevel(xi.quest.fame_area.WINDURST) >= 4 and
                (player:getCurrentMission(xi.mission.log_id.COP) >= xi.mission.id.cop.DISTANT_BELIEFS or player:hasCompletedMission(xi.mission.log_id.COP, xi.mission.id.cop.THE_LAST_VERSE))
        end,

        [xi.zone.WINDURST_WATERS] =
        {
            ['Leepe-Hoppe'] = 
            {
                onTrigger = function(player, npc)
                    return quest:progressEvent(884, 0, xi.items.MAGICKED_STEEL, xi.items.SPRUCE_LUMBER, xi.items.EXTRA_FINE_FILE)
                end,
            },
            
            onEventFinish =
            {
                [884] = function(player, csid, option, npc)
                    quest:begin(player)
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
                    -- Reminder to bring Magicked Steel Ingot, Spruce Lumber, Extra-fine File
                    return quest:event(885, 0, xi.items.MAGICKED_STEEL, xi.items.SPRUCE_LUMBER, xi.items.EXTRA_FINE_FILE)
                end,

                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, { xi.items.MAGICKED_STEEL, xi.items.SPRUCE_LUMBER, xi.items.EXTRA_FINE_FILE }) then
                        return quest:progressEvent(886)
                    end
                end,
            },

            onEventFinish =
            {
                [886] = function(player, csid, option, npc)
                    player:setCharVar("tuningIn_date", getMidnight())
                    player:confirmTrade()
                    quest:complete(player)
                end,
            },
        },
    },
}

return quest
