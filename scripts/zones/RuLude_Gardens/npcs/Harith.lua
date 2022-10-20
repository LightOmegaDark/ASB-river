-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Harith
-- !pos -4.349 1 134.014 243
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if
        player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.EMPTY_MEMORIES) == QUEST_AVAILABLE and
        (player:getCurrentMission(xi.mission.log_id.COP) >= xi.mission.id.cop.THE_MOTHERCRYSTALS or
         player:getCharVar("Mission[6][118]Option") > 0)
    then
        player:addQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.EMPTY_MEMORIES)
        player:startEvent(113)

    elseif player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.EMPTY_MEMORIES) >= QUEST_ACCEPTED then
        player:startEvent(114)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 110 or csid == 109 then
        local objecttrade = player:getCharVar("harithreward")

        if player:hasItem(objecttrade) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, objecttrade)
        else
            player:tradeComplete()
            player:addItem(objecttrade)
            player:messageSpecial(ID.text.ITEM_OBTAINED, objecttrade)
            player:setCharVar("harithreward", 0)

            if player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.EMPTY_MEMORIES) == QUEST_ACCEPTED then
                player:addFame(xi.quest.fame_area.JEUNO, 30)
                player:completeQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.EMPTY_MEMORIES)
            else
                player:addFame(xi.quest.fame_area.JEUNO, 5)
            end
        end
    end
end

return entity
