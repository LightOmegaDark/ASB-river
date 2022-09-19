-----------------------------------
-- A Job for the Consortium
-- Glenne - Southern Sandoria, !pos -122 -2 15 230
-- Aaveleon - West Ronfaure, !pos -431 -45 343 100
-----------------------------------
require('scripts/globals/interaction/quest')
require('scripts/globals/npc_util')
require('scripts/globals/quests')
require('scripts/globals/titles')
require('scripts/globals/items')
----------------------------------
local quest = Quest:new(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.A_JOB_FOR_THE_CONSORTIUM)

quest.reward =
{
    fame = 25,
    fameArea = xi.quest.fame_area.NORG,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == QUEST_AVAILABLE and
                player:getQuestStatus(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.THE_BRUGAIRE_CONSORTIUM) == QUEST_COMPLETED and
                player:hasKeyItem(xi.ki.TENSHODO_MEMBERS_CARD) and
                player:getFameLevel(xi.quest.fame_area.SANDORIA) >= 5 and
                player:getCharVar("AIRSHIP_BLOCK") < getMidnight()
        end,

        [xi.zone.PORT_SAN_DORIA] =
        {
            ['Portaure'] = quest:progressEvent(651),

            onEventFinish =
            {
                [651] = function(player, csid, option, npc)
                    if option == 1 then
                        npcUtil.giveKeyItem(player, xi.ki.BRUGAIRE_GOODS)
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

        [xi.zone.PORT_SAN_DORIA] =
        {
            ['Portaure'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(xi.ki.BRUGAIRE_GOODS) then
                        return quest:progressEvent(652) -- Additional Dialogue
                    else
                        return quest:progressEvent(1)
                    end
                end,
            },

            onEventFinish =
            {
                [1] = function(player, csid, option, npc)
                    quest:complete(player)
                end,
            },
        },

        [xi.zone.PORT_JEUNO] =
        {
            ['Haubijoux'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(xi.ki.BRUGAIRE_GOODS) then
                        if math.random() > 0.25 or (VanadielHour() > 6 and VanadielHour() < 18) then
                            quest:progressEvent(54)
                        else
                            quest:progressEvent(54, 1)
                        end
                    end
                end,
            },

            onEventFinish =
            {
                [54] = function(player, csid, option, npc)
                    if option == 1 then
                        player:delKeyItem(xi.ki.BRUGAIRE_GOODS)
                        player:setCharVar("AIRSHIP_BLOCK", getMidnight())
                        player:delQuest(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.A_JOB_FOR_THE_CONSORTIUM)
                    else
                        quest:setVar(player, 'Prog', 1)
                    end
                end,
            },
        },

        [xi.zone.LOWER_JEUNO] =
        {
            ['Yin_Pocanakhu'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(xi.ki.BRUGAIRE_GOODS) and quest:getVar(player, 'Prog') == 1 then
                        return quest:progressEvent(0)
                    -- Player didn't take airship. Package is broken!
                    elseif quest:getVar(player, 'Prog') == 0 then
                        return quest:progressEvent(1)
                    end
                end,
            },

            onEventFinish =
            {
                [0] = function(player, csid, option, npc)
                    player:delKeyItem(xi.ki.BRUGAIRE_GOODS)
                    quest:setVar(player, 'Prog', 2)
                end,
                [1] = function(player, csid, option, npc)
                    player:delKeyItem(xi.ki.BRUGAIRE_GOODS)
                    player:delQuest(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.A_JOB_FOR_THE_CONSORTIUM)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == QUEST_COMPLETED and
                player:getCharVar("AIRSHIP_BLOCK") < getMidnight()
        end,

        [xi.zone.PORT_SAN_DORIA] =
        {
            ['Portaure'] = quest:progressEvent(651),

            onEventFinish =
            {
                [651] = function(player, csid, option, npc)
                    if option == 1 then
                        player:delQuest(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.A_JOB_FOR_THE_CONSORTIUM)
                        npcUtil.giveKeyItem(player, xi.ki.BRUGAIRE_GOODS)
                        quest:begin(player)
                    end
                end,
            },
        },
    },
}

return quest
