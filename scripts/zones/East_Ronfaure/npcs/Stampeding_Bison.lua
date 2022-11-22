----------------------------------
-- Area: East Ronfaure
--  NPC: Stampeding Bison
-- Type: Smilebringers Bootcamp Sergeant
-- !pos 79.690 -59.999 236.672
-----------------------------------
local ID = require("scripts/zones/East_Ronfaure/IDs")
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
    local npc = GetNPCByID(ID.npc.STARLIGHT_DECORATIONS[17191562])
    if isStarlightEnabled ~= 0 then
        smileBringerSergeantOnFinish(player, npc, ID, csid, option)
    end
end

return entity
