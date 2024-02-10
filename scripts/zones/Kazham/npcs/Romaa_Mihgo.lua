-----------------------------------
-- Area: Kazham
--  NPC: Romaa Mihgo
-- Type: Standard NPC
-- !pos 29.000 -13.023 -176.500 250
-----------------------------------
require("scripts/globals/missions")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(263)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
