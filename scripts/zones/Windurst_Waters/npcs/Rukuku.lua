-----------------------------------
-- Area: Windurst Waters
--  NPC: Rukuku
-- !pos 130 -6 160 238
-----------------------------------
require("scripts/settings/main")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
require("scripts/globals/titles")
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
