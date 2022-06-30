-----------------------------------
-- Area: Port Bastok
--  NPC: Qiji
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)

    local ForevertoHold = player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.FOREVER_TO_HOLD)

    if (player:getFameLevel(xi.quest.fame_area.BASTOK) >= 2 and ForevertoHold == QUEST_AVAILABLE) then
        player:startEvent(123)
    elseif (ForevertoHold == QUEST_ACCEPTED and player:getCharVar("ForevertoHold_Event") == 3) then
        player:startEvent(126)
    else
        player:startEvent(33)
    end

end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)

    if (csid == 123) then
        player:addQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.FOREVER_TO_HOLD)
        player:setCharVar("ForevertoHold_Event", 1)
    elseif (csid == 126) then
        player:addTitle(xi.title.QIJIS_FRIEND)
        player:addGil(xi.settings.main.GIL_RATE * 300)
        player:messageSpecial(ID.text.GIL_OBTAINED, xi.settings.main.GIL_RATE * 300)
        player:addFame(xi.quest.fame_area.BASTOK, 80)
        player:completeQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.FOREVER_TO_HOLD)
    end

end

return entity
