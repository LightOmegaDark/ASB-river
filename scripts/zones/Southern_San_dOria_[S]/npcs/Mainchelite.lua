-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Mainchelite
-- !pos -16 1 -30 80
-- Todo: medal loss from nation switching. Since there is no rank-up yet, this isn't so important for now.
-----------------------------------
require("scripts/settings/main")
require("scripts/globals/keyitems")
require("scripts/globals/titles")
require("scripts/globals/quests")
require("scripts/globals/missions")
local ID = require("scripts/zones/Southern_San_dOria_[S]/IDs")
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
