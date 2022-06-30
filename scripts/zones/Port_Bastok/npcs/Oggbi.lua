-----------------------------------
-- Area: Port Bastok (236)
--  NPC: Oggbi
-- !pos -159 -7 5 236
-----------------------------------
local ID = require("scripts/zones/Port_Bastok/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 231) then
        player:addQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.GHOSTS_OF_THE_PAST)
    elseif (csid == 232) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 17478) -- Beat Cesti
        else
            player:tradeComplete()
            player:addItem(17478)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 17478) -- Beat Cesti
            player:needToZone(true)
            player:addFame(xi.quest.fame_area.BASTOK, 20)
            player:completeQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.GHOSTS_OF_THE_PAST)
        end
    elseif (csid == 233) then
        player:addQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.THE_FIRST_MEETING)
    elseif (csid == 234) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 14090) -- Temple Gaiters
        else
            player:delKeyItem(xi.ki.LETTER_FROM_DALZAKK)
            player:delKeyItem(xi.ki.SAN_DORIAN_MARTIAL_ARTS_SCROLL)
            player:addItem(14090)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 14090) -- Temple Gaiters
            player:addFame(xi.quest.fame_area.BASTOK, 40)
            player:completeQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.THE_FIRST_MEETING)
        end
    end
end

return entity
