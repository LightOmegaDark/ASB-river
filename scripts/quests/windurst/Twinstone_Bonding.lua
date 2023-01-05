-----------------------------------
-- Twinstone Bonding
-----------------------------------
-- !addquest 2 53
-- Sigismund : !pos -110 -9 80 206
-----------------------------------
require('scripts/globals/interaction/quest')
require("scripts/globals/items")
require("scripts/globals/npc_util")
require('scripts/globals/quests')
require('scripts/globals/titles')
require('scripts/globals/zone')

-----------------------------------
local quest = Quest:new(xi.quest.log_id.WINDURST, xi.quest.id.windurst.TWINSTONE_BONDING)

quest.reward = {}

local function checkTrade(player, trade)
    if
        quest:getVar(player, 'Prog') == 1 and
        not player:needToZone() and
        npcUtil.tradeHasExactly(trade, { { xi.items.TWINSTONE_EARRING, 1 } })
    then
        return quest:progressEvent(490)
    end
end

local function checkAndcompleteQuest(player)
    if quest:complete(player) then
        player:confirmTrade()
        player:needToZone(true)
    end
end

quest.sections =
{
    -- Quest Acceptance
    {
        check = function(player, status, vars)
            return
                player:getFameLevel(xi.quest.fame_area.WINDURST) >= 2 and
                status == QUEST_AVAILABLE
        end,

        [xi.zone.WINDURST_WOODS] =
        {
            ['Gioh_Ajihri'] = quest:progressEvent(487, 0, xi.items.TWINSTONE_EARRING),

            onEventFinish =
            {
                [487] = function(player, csid, option, npc)
                    quest:begin(player)
                    quest:setVar(player, 'Prog', 1)
                end,
            },
        },
    },

    -- Quest Initial Completion
    {
        check = function(player, status, vars)
            return status == QUEST_ACCEPTED
        end,

        [xi.zone.WINDURST_WOODS] =
        {
            ['Gioh_Ajihri'] =
            {
                onTrigger = function(player, npc)
                    return quest:progressEvent(488, 0, xi.items.TWINSTONE_EARRING)
                end,

                onTrade = function(player, npc, trade)
                    return checkTrade(player, trade)
                end
            },

            onEventFinish =
            {
                [488] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 1)
                end,

                [490] = function(player, csid, option, npc)
                    player:messageSpecial(7251)
                    quest.reward =
                    {
                        fame = 80,
                        fameArea = xi.quest.fame_area.WINDURST,
                        item = xi.items.WRAPPED_BOW,
                        title = xi.title.BOND_FIXER
                    }
                    checkAndcompleteQuest(player)
                end
            },
        },
    },

    -- Quest Repeat Completion
    {
        check = function(player, status, vars)
            return status == QUEST_COMPLETED
        end,

        [xi.zone.WINDURST_WOODS] =
        {
            ['Gioh_Ajihri'] =
            {
                onTrigger = function(player, npc)
                    local item = xi.items.TWINSTONE_EARRING
                    if player:needToZone() then
                        return quest:event(491, 0, item)
                    end
                    return quest:progressEvent(488, 0, item)
                end,

                onTrade = function(player, npc, trade)
                    return checkTrade(player, trade)
                end
            },

            onEventFinish =
            {
                [488] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 1)
                end,

                [490] = function(player, csid, option, npc)
                    player:messageSpecial(6649)
                    quest.reward =
                    {
                        fame = 10,
                        fameArea = xi.quest.fame_area.WINDURST,
                        gil = 900 * xi.settings.main.GIL_RATE
                    }
                    checkAndcompleteQuest(player)
                end
            },
        }
    },
}

return quest
