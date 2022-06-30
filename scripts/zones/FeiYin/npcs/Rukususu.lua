-----------------------------------
-- Area: Fei'Yin
--  NPC: Rukususu
-- !pos -194.133 -0.986 191.077 204
-----------------------------------
require("scripts/globals/quests")
require("scripts/settings/main")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/missions")
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
