-----------------------------------
-- Area: Windurst Waters
--  NPC: Pulykiki
-- Working 100%
-----------------------------------
require("scripts/globals/settings")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if xi.events.starlightCelebration.isStarlightEnabled() ~= 0 then
        xi.events.starlightCelebration.merryMakersNPCDeliverOnTrigger(player, npc)
    else
        player:startEvent(511)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
