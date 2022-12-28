-----------------------------------
-- To Catch A Falling Star
-----------------------------------
-- !addquest 2 53
-- Sigismund : !pos -110 -9 80 206
-----------------------------------
require('scripts/globals/interaction/quest')
require("scripts/globals/items")
require("scripts/globals/npc_util")
require('scripts/globals/quests')
require('scripts/globals/zone')

local westSaruMessages = require("scripts/zones/West_Sarutabaruta/IDs").text
-----------------------------------
local prog = "Prog"

local quest = Quest:new(xi.quest.log_id.WINDURST, xi.quest.id.windurst.TO_CATCH_A_FALLING_STAR)

quest.reward =
{
    fame = 75,
    fameArea = xi.quest.fame_area.WINDURST,
    item = xi.items.FISH_SCALE_SHIELD
}

quest.sections =
{
    -- Quest Acceptance
    {
        check = function(player, status, vars)
           return status == QUEST_AVAILABLE
        end,

        [xi.zone.PORT_WINDURST] =
        {
            ['Sigismund'] = quest:progressEvent(196, 0, xi.items.STARFALL_TEAR),

            onEventFinish =
            {
                [196] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    -- Supporting Character dialogue after Accepted
    {
        check  = function(player, status, vars)
            return status == QUEST_ACCEPTED
        end,

        [xi.zone.PORT_WINDURST] =
        {
            ['Tohopka'] = quest:progressEvent(198, 0, xi.items.STARFALL_TEAR, xi.items.HANDFUL_OF_PUGIL_SCALES)
        }
    },

    -- Twinkle Tree in West Saru.
    {
        check = function(player, status, vars)
            return status == QUEST_ACCEPTED
        end,

        [xi.zone.WEST_SARUTABARUTA] =
        {
            ['Twinkle_Tree'] =
            {
                onTrigger = function(player, npc)
                    if VanadielHour() <= 3 then
                        player:messageSpecial(westSaruMessages.FROST_DEPOSIT_TWINKLES)
                        player:messageSpecial(westSaruMessages.MELT_BARE_HANDS)
                        return
                    end
                    player:messageSpecial(westSaruMessages.NOTHING_OUT_OF_ORDINARY)
                end,

                onTrade = function(player, npc, trade)
                    if VanadielHour() > 3 then
                        player:messageSpecial(westSaruMessages.NOTHING_OUT_OF_ORDINARY)
                        return
                    end

                    if npcUtil.tradeHas(trade, xi.items.HANDFUL_OF_PUGIL_SCALES) then
                        player:messageSpecial(westSaruMessages.FROST_DEPOSIT_TWINKLES)
                        player:messageSpecial(westSaruMessages.MELT_BARE_HANDS)
                        if npcUtil.giveItem(player, xi.items.STARFALL_TEAR) then
                            player:confirmTrade()
                            if(quest:getVar(player, prog) == 0) then
                                quest:setVar(player, prog, 1)
                            end
                        end
                    end
                end
            }
        }
    },

    -- Quest Complete
    {
        check = function(player, status, vars)
            return status == QUEST_ACCEPTED
        end,

        [xi.zone.PORT_WINDURST] =
        {
            ['Sigismund'] =
            {
                onTrigger = function(player, npc)
                    player:startEvent(197, 0, xi.items.STARFALL_TEAR)
                end,

                onTrade = function(player, npc, trade)
                    if
                    npcUtil.tradeHasExactly(trade, {{ xi.items.STARFALL_TEAR, 1}}) then
                        player:startEvent(199)
                    end
                end
            },

            onEventFinish =
            {
                [199] = function(player, csid, option, npc)
                    player:tradeComplete()
                    quest:complete(player)
                    quest:setVar(player, prog, 2)
                end
            }
        }
    },

    -- After Quest Complete
    {
        check = function(player, status, vars)
            return
                status == QUEST_COMPLETED and
                vars[prog] > 0
        end,

        [xi.zone.PORT_WINDURST] =
        {
            ['Sigismund'] =
            {
                onTrigger = function(player, npc)
                    player:startEvent(200)
                end
            },

            onEventFinish =
            {
                [200] = function(player, csid, option, npc)
                    quest:setVar(player, prog, 0)
                end
            }
        }
    },
}

return quest