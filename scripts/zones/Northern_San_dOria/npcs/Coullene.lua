-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Coullene
-- Type: Involved in Quest (Flyers for Regine)
-- !pos 146.420 0.000 127.601 231
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs")
require("scripts/quests/flyers_for_regine")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    quests.ffr.onTrade(player, npc, trade, 5) -- FLYERS FOR REGINE
end

entity.onTrigger = function(player, npc)
    if xi.events.starlightCelebration.isStarlightEnabled() ~= 0 then
        xi.events.starlightCelebration.merryMakersNPCDeliverOnTrigger(player, npc)
    else
        player:showText(npc, ID.text.COULLENE_DIALOG)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
