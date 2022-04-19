-----------------------------------
-- Area: Bibiki Bay
--  NPC: ??? COP mission spawn Dalham
-- !pos
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local cop = player:getCurrentMission(xi.mission.log_id.COP)

    if (cop == xi.mission.id.cop.CALM_BEFORE_THE_STORM and not GetMobByID(ID.mob.DALHAM):isSpawned() and player:getCharVar("COP_Dalham_KILL") == 0) then
        SpawnMob(ID.mob.DALHAM):updateClaim(player)
    elseif (cop == xi.mission.id.cop.CALM_BEFORE_THE_STORM and player:getCharVar("COP_Dalham_KILL") == 1) then
        player:startEvent(41)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
