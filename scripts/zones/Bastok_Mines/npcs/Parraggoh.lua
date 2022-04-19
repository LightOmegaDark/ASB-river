-----------------------------------
-- Area: Bastok Mines
--  NPC: Parraggoh
-- Finishes Quest: Beauty and the Galka
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 7 and option == 0 then
        player:addQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.BEAUTY_AND_THE_GALKA)
    elseif csid == 10 then
        if player:getFreeSlotsCount() >= 1 then
            player:completeQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.BEAUTY_AND_THE_GALKA)
            player:setCharVar("BeautyAndTheGalkaDenied", 0)
            player:delKeyItem(xi.ki.PALBOROUGH_MINES_LOGS)
            player:addFame(xi.quest.fame_area.BASTOK, 75)
            player:addItem(16465)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 16465)
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 16465)
        end
    end
end

return entity
