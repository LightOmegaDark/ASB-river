-----------------------------------
-- Area: Upper Jeuno
--  NPC: Collet
-- !pos -44 0 107 244
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local aClockMostdelicate = player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.A_CLOCK_MOST_DELICATE)
    if
        player:getFameLevel(xi.quest.fame_area.JEUNO) >= 5 and
        aClockMostdelicate == QUEST_AVAILABLE and
        player:getCharVar("aClockMostdelicateVar") == 0
    then
        player:startEvent(112)
    elseif player:getCharVar("saveTheClockTowerVar") >= 1 then
        player:startEvent(164)
    elseif player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.THE_CLOCKMASTER) == QUEST_COMPLETED then
        player:startEvent(163)
    else
        player:startEvent(114)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
