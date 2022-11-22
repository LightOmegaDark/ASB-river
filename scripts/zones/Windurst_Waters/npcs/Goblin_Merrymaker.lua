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
    merryMakersGoblinOnSpawn(npc)
end

entity.onTrade = function(player, npc, trade)
    merryMakersGoblinOnTrade(player, npc, trade)
end

entity.onPathPoint = function(npc)
    merryMakersGoblinOnPathPoint(npc, ID)
end

entity.onTrigger = function(player, npc)
    merryMakersGoblinOnTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    merryMakersGoblinOnFinish(player, csid, option)
end

return entity
