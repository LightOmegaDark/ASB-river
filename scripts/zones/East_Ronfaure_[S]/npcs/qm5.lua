-----------------------------------
-- Area: East Ronfaure [S]
--  NPC: qm5 "???"
-- Involved in Quests: Steamed Rams
-- !pos 380.015 -26.5 -22.525
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 3) then
        player:addKeyItem(xi.ki.OXIDIZED_PLATE)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.OXIDIZED_PLATE)
    end
end

return entity
