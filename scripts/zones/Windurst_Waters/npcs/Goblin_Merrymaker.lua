-----------------------------------
-- Area: Windurst Waters
--  NPC: Goblin Merrymaker
-- Type: Starlight Festival Event NPCs
-- Multiple locations
-----------------------------------
local ID = require("scripts/zones/Windurst_Waters/IDs")
require("scripts/globals/events/starlight_celebrations")
-----------------------------------

local entity = {}

entity.onSpawn = function(npc)
    xi.events.starlightCelebration.merryMakersGoblinOnSpawn(npc)
end

entity.onTrade = function(player, npc, trade)
    xi.events.starlightCelebration.merryMakersGoblinOnTrade(player, npc, trade)
end

entity.onPathPoint = function(npc)
    xi.events.starlightCelebration.merryMakersGoblinOnPathPoint(npc, ID)
end

entity.onTrigger = function(player, npc)
    xi.events.starlightCelebration.merryMakersGoblinOnTrigger(player, npc)
end

entity.onPathComplete = function(npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    xi.events.starlightCelebration.merryMakersGoblinOnFinish(player, csid, option)
end

return entity
