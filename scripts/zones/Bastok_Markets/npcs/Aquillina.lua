-----------------------------------
-- Area: Bastok Markets
--  NPC: Aquillina
-- !pos -97 -5 -81 235
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 217 then
        player:addQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.A_FLASH_IN_THE_PAN)
    elseif csid == 219 then
        local fame = player:hasCompletedQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.A_FLASH_IN_THE_PAN) and 8 or 75
        if npcUtil.completeQuest(player, xi.quest.log_id.BASTOK, xi.quest.id.bastok.A_FLASH_IN_THE_PAN, {gil=100, fame=fame}) then
            player:confirmTrade()
            GetNPCByID(ID.npc.AQUILLINA):setLocalVar("FlashInThePan", os.time() + 900)
        end
    end
end

return entity
