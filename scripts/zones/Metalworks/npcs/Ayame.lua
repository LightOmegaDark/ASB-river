-----------------------------------
-- Area: Metalworks
--  NPC: Ayame
-- !pos 133 -19 34 237
-----------------------------------
local ID = require("scripts/zones/Metalworks/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/magic")
require("scripts/globals/missions")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/utils")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
