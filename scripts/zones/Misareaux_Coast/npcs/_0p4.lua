-----------------------------------
-- Area: Misareaux Coast
--  NPC: Storage Compartment
--  COP spawn Boggelmann.
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local cop = player:getCurrentMission(xi.mission.log_id.COP)

    if (cop == xi.mission.id.cop.CALM_BEFORE_THE_STORM and not GetMobByID(ID.mob.BOGGELMANN):isSpawned() and player:getCharVar("COP_Boggelmann_KILL") == 0) then
        SpawnMob(ID.mob.BOGGELMANN):updateClaim(player)
    elseif (cop == xi.mission.id.cop.CALM_BEFORE_THE_STORM and player:getCharVar("COP_Boggelmann_KILL") == 1) then
        player:startEvent(13)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
