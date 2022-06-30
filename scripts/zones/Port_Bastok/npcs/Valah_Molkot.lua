-----------------------------------
-- Area: Port Bastok
--  NPC: Valah Molkot
-- !pos 59 8 -221 236
-----------------------------------
require("scripts/settings/main")
require("scripts/globals/quests")
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

    if csid == 160 and option == 2002 then
        player:tradeComplete()
        player:completeQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.A_LADY_S_HEART)
        player:addFame(xi.quest.fame_area.BASTOK, 120)
        player:setMoghouseFlag(2)
        player:messageSpecial(ID.text.MOGHOUSE_EXIT)
    elseif csid == 160 and option == 1 then
        player:tradeComplete()
        player:addQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.A_LADY_S_HEART)
    end
end

return entity
