-----------------------------------
-- Area: Upper Jeuno
--  NPC: Galmut's door
-- !pos -80 0 104 244
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 118 and option == 1 then
        player:addQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.A_CLOCK_MOST_DELICATE)
        player:setCharVar("aClockMostdelicateVar", 0)

    elseif csid == 119 then
        if option == 0 then
            player:setCharVar("aClockMostdelicateVar", 2)
        elseif option == 1 then
            player:addQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.A_CLOCK_MOST_DELICATE)
            player:setCharVar("aClockMostdelicateVar", 0)
        end

    elseif csid == 152 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 17083)
        else
            player:addQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.THE_CLOCKMASTER)
            player:addTitle(xi.title.TIMEKEEPER)
            player:addGil(1200)
            player:messageSpecial(ID.text.GIL_OBTAINED, 1200)
            player:addItem(17083)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 17083)
            player:addFame(xi.quest.fame_area.JEUNO, 30)
            player:completeQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.THE_CLOCKMASTER)
        end

    elseif csid == 202 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 12727)
        else
            player:addTitle(xi.title.PROFESSIONAL_LOAFER)
            player:delKeyItem(xi.ki.CLOCK_TOWER_OIL)
            player:addGil(1200)
            player:messageSpecial(ID.text.GIL_OBTAINED, 1200)
            player:addItem(12727)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 12727)
            player:addFame(xi.quest.fame_area.JEUNO, 30)
            player:completeQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.A_CLOCK_MOST_DELICATE)
            player:addQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.SAVE_THE_CLOCK_TOWER) -- Start next quest "Save the Clock Tower"
        end
    end
end

return entity
