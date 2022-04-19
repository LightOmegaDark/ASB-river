-----------------------------------
-- Area: Metalworks
--  NPC: Baldric
-- !pos -50.858 1.777 -31.141 237
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)

    if (player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.STARDUST) == QUEST_AVAILABLE and player:getFameLevel(xi.quest.fame_area.BASTOK) >= 2) then
        player:startEvent(554)
    else
        player:startEvent(552)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
