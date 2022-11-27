-----------------------------------
-- Water Way to Go
-----------------------------------
-- !addquest 2 16
-- Ohbiru-Dohbiru : !pos 23 -5 -193 238
-- Giddeus Spring : !pos -258 -2 -249 145
-----------------------------------
require('scripts/globals/interaction/quest')
require('scripts/globals/items')
require('scripts/globals/keyitems')
require('scripts/globals/npc_util')
require('scripts/globals/quests')
require('scripts/globals/status')
require('scripts/globals/zone')
-----------------------------------

local quest = Quest:new(xi.quest.log_id.WINDURST, xi.quest.id.windurst.TORAIMARAI_TURMOIL)

quest.reward =
{
    gil  = 4500,
    fame = 50,
    fameArea = xi.quest.fame_area.WINDURST,
    title = xi.title.CERTIFIED_RHINOSTERY_VENTURER
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == QUEST_AVAILABLE and
                player:hasCompletedQuest(xi.quest.log_id.WINDURST, xi.quest.id.windurst.BLUE_RIBBON_BLUES) and
                player:getFameLevel(xi.quest.fame_area.WINDURST) >= 6 and
                not quest:getMustZone(player)
        end,

        [xi.zone.WINDURST_WATERS] =
        {
            ['Ohbiru-Dohbiru'] = quest:progressEvent(785, 4500, xi.keyItem.RHINOSTERY_CERTIFICATE, xi.items.STARMITE_SHELL),

            onEventFinish =
            {
                [785] = function(player, csid, option, npc)
                    if
                        option == 1
                    then
                        quest:begin(player)
                        npcUtil.giveKeyItem(player, xi.ki.RHINOSTERY_CERTIFICATE)
                    end
                end,
            },
        },
    },

    {
        --turn in / repeat logic
        check = function(player, status, vars)
            return status ~= QUEST_AVAILABLE
        end,

        [xi.zone.WINDURST_WATERS] =
        {
            ['Ohbiru-Dohbiru'] =
            {
                onTrigger = function(player, npc)
                    status = player:getQuestStatus(quest.areaId, quest.questId)
                    if
                        status == QUEST_COMPLETED
                    then
                        return quest:progressEvent(795, 4500, 0, xi.items.STARMITE_SHELL) --dialog for repeat
                    elseif
                        status == QUEST_ACCEPTED
                    then
                        return quest:progressEvent(786, 4500, xi.keyItem.RHINOSTERY_CERTIFICATE, xi.items.STARMITE_SHELL) -- Reminder text.
                    end
                end,
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, { { xi.items.STARMITE_SHELL, 3 } }) then
                        return quest:progressEvent(791)
                    end
                end,
            },

            onEventFinish =
            {
                [791] = function(player, csid, option, npc)
                    player:confirmTrade()
                    -- From previous implementation, award 100 fame (50 + 50) on first completion,
                    -- and 50 fame for any subsequent trade.
                    if player:getQuestStatus(quest.areaId, quest.questId) == QUEST_ACCEPTED then
                        player:addFame(xi.quest.fame_area.WINDURST, 50)
                    end
                    quest:complete(player)
                end,
            },
        },
    },
}

return quest
