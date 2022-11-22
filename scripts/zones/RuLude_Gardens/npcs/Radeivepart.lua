-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Radeivepart
-- !pos 5 9 -39 243
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local northward = player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.NORTHWARD)

    if player:getFameLevel(xi.quest.fame_area.JEUNO) >= 4 and northward == QUEST_AVAILABLE then
        player:startEvent(159, 1, 0, 0, 0, 0, 0, 8)
    elseif northward == QUEST_ACCEPTED then
        player:startEvent(159, 2, 0, 0, 0, 0, 0, 8)
    elseif northward == QUEST_COMPLETED then
        player:startEvent(159, 3, 0, 0, 0, 0, 0, 8)
    else
        -- Standard dialogue
        player:startEvent(159)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 160 then
        player:addCharVar("saveTheClockTowerVar", 1)
        player:addCharVar("saveTheClockTowerNPCz1", 1)
    elseif csid == 159 and option == 1 then
        player:addQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.NORTHWARD)
    elseif csid == 61 then
        player:completeQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.NORTHWARD)
        player:addTitle(xi.title.ENVOY_TO_THE_NORTH)
        if (player:hasKeyItem(xi.ki.MAP_OF_CASTLE_ZVAHL) == false) then
            player:addKeyItem(xi.ki.MAP_OF_CASTLE_ZVAHL)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.MAP_OF_CASTLE_ZVAHL)
        end

        player:addFame(xi.quest.fame_area.JEUNO, 30)
        player:tradeComplete()
    end
end

return entity
