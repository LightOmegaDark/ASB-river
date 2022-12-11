-----------------------------------
-- Area: Upper Jeuno
--  NPC: Collet
-- !pos -44 0 107 244
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.THE_CLOCKMASTER) == QUEST_COMPLETED then
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
