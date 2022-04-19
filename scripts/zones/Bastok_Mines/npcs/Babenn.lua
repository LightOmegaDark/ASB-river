-----------------------------------
-- Area: Bastok Mines
--  NPC: Babenn
-- !pos 73 -1 34 234
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 45 then
        if player:getFreeSlotsCount() > 1 then
            player:setCharVar("EleventhsHour", 0)
            player:delKeyItem(xi.ki.OLD_TOOLBOX)
            player:addTitle(xi.title.PURSUER_OF_THE_TRUTH)
            player:addItem(16629)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 16629)
            player:addFame(xi.quest.fame_area.BASTOK, 30)
            player:completeQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.THE_ELEVENTH_S_HOUR)
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 16629)
        end
    end
end

return entity
