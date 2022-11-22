-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Taurette
-- Involved in Quests: Riding on the Clouds
-- !pos -159 0 91 231
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs")
require("scripts/globals/events/starlight_celebrations")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if isStarlightEnabled() ~= 0 then
        onStarlightSmilebringersTrade(player, trade, npc)
    end
end

entity.onTrigger = function(player, npc)
    player:startEvent(664)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
