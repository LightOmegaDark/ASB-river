-----------------------------------
-- Area: Eastern Altepa Desert
--  NPC: Lokpix
-- Starts Quest "Open Sesame"
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 20 and option == 1) then
        player:addQuest(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.OPEN_SESAME)
    elseif (csid == 22) then
        player:tradeComplete()
        player:addKeyItem(xi.ki.LOADSTONE)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.LOADSTONE)
        player:addFame(xi.quest.fame_area.SELBINA_RABAO, 30)
        player:completeQuest(xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.OPEN_SESAME)
    end

end

return entity
