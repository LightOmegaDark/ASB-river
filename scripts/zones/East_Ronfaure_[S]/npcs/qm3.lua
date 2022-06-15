-----------------------------------
-- Area: East Ronfaure [S]
--  NPC: qm3 "???"
-- Involved in Quests: Steamed Rams
-- !pos 312.821 -30.495 -67.15
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 1) then
        player:addKeyItem(xi.ki.CHARRED_PROPELLER)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.CHARRED_PROPELLER)
    end
end

return entity
