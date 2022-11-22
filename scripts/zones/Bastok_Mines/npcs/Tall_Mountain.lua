-----------------------------------
-- Area: Bastok Mines
--  NPC: Tall Mountain
-- Involved in Quest: Stamp Hunt
-- Finish Mission: Bastok 6-1
-- !pos 71 7 -7 234
-----------------------------------
require("scripts/globals/events/starlight_celebrations")
-----------------------------------

local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if isStarlightEnabled() ~= 0 then
        npcGiftsNpcOnTrigger(player, 1)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
