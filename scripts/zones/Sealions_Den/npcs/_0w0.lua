-----------------------------------
-- Area: Sealion's Den
--  NPC: Iron Gate
-- !pos 612 132 774 32
-----------------------------------
require("scripts/globals/bcnm")
local ID = require("scripts/zones/Sealions_Den/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.bcnm.onTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if xi.bcnm.onTrigger(player, npc) then
        return
    elseif player:getCurrentMission(xi.mission.log_id.COP) > xi.mission.id.cop.THE_WARRIOR_S_PATH then
        player:startEvent(12)
    else
        player:messageSpecial(ID.text.IRON_GATE_LOCKED)
    end
end

entity.onEventUpdate = function(player, csid, option, extras)
    xi.bcnm.onEventUpdate(player, csid, option, extras)
end

entity.onEventFinish = function(player, csid, option)
    xi.bcnm.onEventFinish(player, csid, option)
end

return entity
