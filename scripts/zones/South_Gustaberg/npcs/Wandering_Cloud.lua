-----------------------------------
-- Area: South Gustaberg
--  NPC: Wandering Cloud
-- Type: Smilebringers Bootcamp Sergeant
-- !pos 179.934 0.264 -185.454
-----------------------------------
local ID = require("scripts/zones/South_Gustaberg/IDs")
require("scripts/globals/events/starlight_celebrations")
require("scripts/globals/utils")
require('scripts/globals/npc_util')
-----------------------------------

local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if isStarlightEnabled ~= 0 then
        smileBringerSergeantOnTrigger(player, npc)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    local npc = GetNPCByID(ID.npc.STARLIGHT_DECORATIONS[17216217])
    if isStarlightEnabled ~= 0 then
        smileBringerSergeantOnFinish(player, npc, ID, csid, option)
    end
end

return entity
