-----------------------------------
-- The Call of the Sea
-----------------------------------
-- Log ID: 4, Quest ID: 67
-- Equette       !pos 0 -22 -17
-- Leporaitceau  !pos 74 -24 5
-- Anteurephiaux !pos 74 -24 5
-- ???           !pos
-----------------------------------
require('scripts/globals/items')
require('scripts/globals/moghouse')
require('scripts/globals/quests')
require('scripts/globals/status')
require('scripts/globals/zone')
require('scripts/globals/interaction/quest')
-----------------------------------
local ID = require("scripts/zones/Misareaux_Coast/IDs")
-----------------------------------
local quest = Quest:new(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.THE_CALL_OF_THE_SEA)

quest.reward =
{
    item = xi.items.MEMENTO_MUFFLER,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == QUEST_AVAILABLE
        end,

        [xi.zone.TAVNAZIAN_SAFEHOLD] =
        {
            ['Equette'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Stage') == 0 then
                        return quest:progressEvent(170)
                    end
                end,
            },

            ['Leporaitceau'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Option') == 0 then
                        return quest:progressEvent(171)
                    end
                end,
            },

            ['Anteurephiaux'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 2 then
                        return quest:progressEvent(172)
                    end
                end,
            },

            onEventFinish =
            {
                -- Equette
                [170] = function(player, csid, option, npc)
                    quest:incrementVar(player, 'Prog', 1)
                    quest:setVar(player, 'Stage', 1)
                end,
                -- Leporaitceau
                [171] = function(player, csid, option, npc)
                    quest:incrementVar(player, 'Prog', 1)
                    quest:setVar(player, 'Option', 1)
                end,
                -- Anteurephiaux
                [172] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == QUEST_ACCEPTED
        end,

        [xi.zone.TAVNAZIAN_SAFEHOLD] =
        {
            ['Equette'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 4 and player:hasKeyItem(xi.ki.WHISPERING_CONCH) then
                        return quest:progressEvent(174)
                    end
                end,
            },

            ['Anteurephiaux'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 3 and player:hasKeyItem(xi.ki.WHISPERING_CONCH) then
                        return quest:progressEvent(173)
                    end
                end,
            },

            onEventFinish =
            {
                -- Equette
                [174] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(xi.ki.WHISPERING_CONCH)
                    end
                end,
                -- Anteurephiaux
                [173] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 4)
                end,
            },
        },

        [xi.zone.MISAREAUX_COAST] =
        {
            ['qm_bloody_coffin'] =
            {
                onTrigger = function(player, npc)
                    if
                        quest:getVar(player, 'Prog') == 2 and
                        npcUtil.popFromQM(player, npc, ID.mob.BLOODY_COFFING, {claim = true, hide = 0})
                    then
                        return quest:message(ID.text.FOUL_STENCH)
                    elseif quest:getVar(player, 'Prog') == 3 and not player:hasKeyItem(xi.ki.WHISPERING_CONCH) then
                        return npcUtil.giveKeyItem(player, xi.ki.WHISPERING_CONCH)
                    end
                end,
            },

            ['Bloody_Coffin'] =
            {
                onMobDeath = function(mob, player, isKiller, firstCall)
                    if quest:getVar(player, 'Prog') == 2 then
                        quest:setVar(player, 'Prog', 3)
                    end
                end,
            },

            onEventFinish =
            {
                -- Equette
                [170] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(xi.ki.WHISPERING_CONCH)
                    end
                end,
            },
        },
    },
}

return quest
