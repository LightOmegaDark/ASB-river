-----------------------------------
-- Area: Port Bastok
--  NPC: Corann
-- Start & Finishes Quest: The Quadav's Curse
-----------------------------------
require("scripts/globals/quests")
require("scripts/settings/main")
local ID = require("scripts/zones/Port_Bastok/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)

    if csid == 80 then
        player:addQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.THE_QUADAV_S_CURSE)
    elseif csid == 81 then
        player:tradeComplete()
        player:completeQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.THE_QUADAV_S_CURSE)
        player:addFame(xi.quest.fame_area.BASTOK, 120)
        player:addItem(12832)
        player:messageSpecial(ID.text.ITEM_OBTAINED, 12832)
    end

end

return entity
