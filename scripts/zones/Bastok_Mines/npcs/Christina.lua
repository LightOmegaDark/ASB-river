-----------------------------------
-- Area: Bastok Mines
--  NPC: Christina
-- Type: Special Event Coordinator
-- !pos 23.703 -1 -86.034 234
-----------------------------------
local ID = require("scripts/zones/Bastok_Mines/IDs")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/npc_util")
require("scripts/globals/teleports")
require("scripts/globals/events/starlight_celebrations")
------------------------------------

local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(32741)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
