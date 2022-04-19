-----------------------------------
-- Area: Western Adoulin
--  NPC: Dangueubert
-- Involved with Quest: 'A Certain Substitute Patrolman'
-- !pos 5 0 -136 256
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local SOA_Mission = player:getCurrentMission(xi.mission.log_id.SOA)
    local ACSP = player:getQuestStatus(xi.quest.log_id.ADOULIN, xi.quest.id.adoulin.A_CERTAIN_SUBSTITUTE_PATROLMAN)

    if (SOA_Mission >= xi.mission.id.soa.LIFE_ON_THE_FRONTIER) then
        if ((ACSP == QUEST_ACCEPTED) and (player:getCharVar("ACSP_NPCs_Visited") == 6)) then
            -- Progresses Quest: 'A Certain Substitute Patrolman'
            player:startEvent(2558)
        else
            -- Standard dialogue
            player:startEvent(546, 0, 1)
        end
    else
        -- Dialogue prior to joining colonization effort
        player:startEvent(546)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
