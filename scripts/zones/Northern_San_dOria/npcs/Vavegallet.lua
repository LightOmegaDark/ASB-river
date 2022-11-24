-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Vavegallet
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if xi.events.starlightCelebration.isStarlightEnabled() ~= 0 then
        xi.events.starlightCelebration.merryMakersNPCDeliverOnTrigger(player, npc)
    else
        player:startEvent(673)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
