-----------------------------------
-- Area: Windurst Walls
-- NPC: Ojha Rhawash
-- Starts and Finishes Quest: Flower Child
-- !pos -209 0 -134 239
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 10000 and option == 3002 then
        player:tradeComplete()
        player:completeQuest(xi.quest.log_id.WINDURST, xi.quest.id.windurst.FLOWER_CHILD)
        player:addFame(xi.quest.fame_area.WINDURST, 120)
        player:setMoghouseFlag(4)
        player:messageSpecial(ID.text.MOGHOUSE_EXIT)
    elseif csid == 10000 and option == 1 then
        player:tradeComplete()
        player:addQuest(xi.quest.log_id.WINDURST, xi.quest.id.windurst.FLOWER_CHILD)
    end
end

return entity
