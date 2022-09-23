-----------------------------------
-- Petals for Parelbriaux
-----------------------------------
-- Log ID: 4, Quest ID: 74
-- Parelbriaux : !pos
-- Chemioue    : !pos
-- Ondieulix   : !pos
-----------------------------------
require('scripts/globals/items')
require('scripts/globals/keyitems')
require('scripts/globals/npc_util')
require('scripts/globals/quests')
require('scripts/globals/titles')
require('scripts/globals/zone')
require('scripts/globals/interaction/quest')
-----------------------------------
local ID = require("scripts/zones/Lufaise_Meadows/IDs")
-----------------------------------
local quest = Quest:new(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.A_BITTER_PAST)

quest.reward =
{
    item = xi.items.POWERFUL_ROPE,
    title = xi.title.PUTRID_PURVEYOR_OF_PUNGENT_PETALS,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == QUEST_AVAILABLE and
            player:getCurrentMission(xi.mission.log_id.COP) > xi.mission.id.cop.DARKNESS_NAMED
        end,

        [xi.zone.TAVNAZIAN_SAFEHOLD] =
        {
            ['Chemioue'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 0 then
                        return quest:progressEvent(000)
                    end
                end,
            },

            ['Parelbriaux'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 1 then
                        return quest:progressEvent(111)
                    end
                end,
            },

            ['Ondieulix'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 2 then
                        return quest:progressEvent(222)
                    end
                end,
            },

            onEventFinish =
            {
                [000] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 1)
                end,
                [111] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 2)
                end,
                [222] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        }
    },

    {
        check = function(player, status, vars)
            return status == QUEST_ACCEPTED
        end,

        [xi.zone.TAVNAZIAN_SAFEHOLD] =
        {
            ['Chemioue'] =
            {
                onTrigger = function(player, npc)
                end,
            },

            ['Parelbriaux'] =
            {
                onTrigger = function(player, npc)
                end,
            },

            ['Ondieulix'] =
            {
                onTrigger = function(player, npc)
                end,
            },

            onEventFinish =
            {
                [152] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 1)
                end,
            },
        },

        [xi.zone.LUFAISE_MEADOWS] =
        {
            ['qm'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 2 and npcUtil.popFromQM(player, npc, ID.mob.BITTER_PAST_MOBS, {claim = true, hide = 0}) then
                        return quest:messageText(ID.text.SENSE_OF_FOREBODING)

                    elseif not player:hasKeyItem(xi.ki.TINY_WRISTLET) then
                        player:addKeyItem(xi.ki.TINY_WRISTLET)
                        return quest:messageText(ID.text.KEYITEM_OBTAINED)
                    end
                end,
            },

            ['Baumesel'] =
            {
                onMobDeath = function(mob, player)
                    if quest:getVar(player, 'Prog') == 2 then
                        quest:setVar(player, 'Prog', 3)
                    end
                end,
            },
        },
    },
}

return quest