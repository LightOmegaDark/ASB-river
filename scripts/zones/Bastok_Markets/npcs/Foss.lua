-----------------------------------
-- Area: Bastok Markets
--  NPC: Foss
-- !pos -283 -12 -37 235
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 271 and option == 0) then
        player:addQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.BUCKETS_OF_GOLD)
    elseif (csid == 272) then
        local fame = player:hasCompletedQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.BUCKETS_OF_GOLD) and 8 or 75
        if (npcUtil.completeQuest(player, xi.quest.log_id.BASTOK, xi.quest.id.bastok.BUCKETS_OF_GOLD, {title=xi.title.BUCKET_FISHER, gil=300, fame=fame})) then
            player:confirmTrade()
        end
    end
end

return entity
