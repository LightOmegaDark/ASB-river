-----------------------------------
-- Area: Western Adoulin
--  NPC: Kongramm
-- Type: Standard NPC, Mission NPC, and Quest NPC
--  Involved with Mission: 'A Curse From The Past'
--  Involved with Quests: 'A Certain Substitute Patrolman' and 'Transporting'
-- !pos 61 32 138 256
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/keyitems")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local SOA_Mission = player:getCurrentMission(xi.mission.log_id.SOA)
    local ACSP = player:getQuestStatus(xi.quest.log_id.ADOULIN, xi.quest.id.adoulin.A_CERTAIN_SUBSTITUTE_PATROLMAN)
    local Transporting = player:getQuestStatus(xi.quest.log_id.ADOULIN, xi.quest.id.adoulin.TRANSPORTING)

    if ((SOA_Mission == xi.mission.id.soa.A_CURSE_FROM_THE_PAST) and (not player:hasKeyItem(xi.ki.PIECE_OF_A_STONE_WALL))) then
        if (player:getCharVar("SOA_ACFTP_Kongramm") < 1) then
            -- Gives hint for SOA Mission: 'A Curse From the Past'
            player:startEvent(148)
        else
            -- Reminds player of hint for SOA Mission: 'A Curse From the Past'
            player:startEvent(149)
        end
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 148 then
        -- Gave hint for SOA Mission: 'A Curse From the Past'
        player:setCharVar("SOA_ACFTP_Kongramm", 1)
    end
end

return entity
