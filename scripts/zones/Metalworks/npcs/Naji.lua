-----------------------------------
-- Area: Metalworks
--  NPC: Naji
-- !pos 64 -14 -4 237
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/globals/npc_util")
local ID = require("scripts/zones/Metalworks/IDs");
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 750 then
        if (player:getFreeSlotsCount(0) >= 1) then
            player:addItem(16678)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 16678) -- Razor Axe
            player:delKeyItem(xi.ki.YASINS_SWORD)
            player:setCharVar("theDoormanCS", 0)
            player:addFame(xi.quest.fame_area.BASTOK, 30)
            player:completeQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.THE_DOORMAN)
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 16678) -- Razor Axe
        end
    end
end

return entity
