-----------------------------------
-- Area: Port Bastok
--  NPC: Romilda
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)

    local pFame = player:getFameLevel(xi.quest.fame_area.BASTOK)
    local ForevertoHold = player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.FOREVER_TO_HOLD)
    local TilldeathdousPart = player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.TILL_DEATH_DO_US_PART)

    if (pFame >= 3 and ForevertoHold == QUEST_COMPLETED and TilldeathdousPart == QUEST_AVAILABLE and player:getCharVar("ForevertoHold_Event") == 3) then
        player:startEvent(128)
    else
        player:startEvent(34)
    end

end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)

    if (csid == 128) then
        player:addQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.TILL_DEATH_DO_US_PART)
    elseif (csid == 129) then
        player:addTitle(xi.title.QIJIS_RIVAL)
        player:addGil(xi.settings.main.GIL_RATE * 2000)
        player:messageSpecial(ID.text.GIL_OBTAINED, xi.settings.main.GIL_RATE * 2000)
        player:addFame(xi.quest.fame_area.BASTOK, 160)
        player:completeQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.TILL_DEATH_DO_US_PART)
    end

end

return entity
