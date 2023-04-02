-----------------------------------
-- Area: Windurst Walls
--  NPC: Koru-Moru
-- Starts & Ends Quest: Star Struck
-- Involved in Quest: Making the Grade, Riding on the Clouds
-- !pos -120 -6 124 239
-----------------------------------
local ID = require("scripts/zones/Windurst_Walls/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/titles")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local count = trade:getItemCount()

    if trade:hasItemQty(829, 1) and count == 1 and trade:getGil() == 0 then
        if player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.THE_ROOT_OF_THE_PROBLEM) == QUEST_ACCEPTED then
            player:startEvent(349)
            player:tradeComplete()
            player:setCharVar("rootProblem", 2)
        end
    end
end

entity.onTrigger = function(player, npc)
    local rootProblem = player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.THE_ROOT_OF_THE_PROBLEM)
    local thePuppetMaster = player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.THE_PUPPET_MASTER)
    local carbuncleDebacle = player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.CARBUNCLE_DEBACLE)
    local carbuncleDebacleProgress = player:getCharVar("CarbuncleDebacleProgress")

    -----------------------------------
    -- Carbuncle Debacle
    if
        carbuncleDebacle == QUEST_ACCEPTED and
        carbuncleDebacleProgress == 1 or
        carbuncleDebacleProgress == 2
    then
        player:startEvent(416) -- go and see Ripapa
    elseif carbuncleDebacle == QUEST_ACCEPTED and carbuncleDebacleProgress == 4 then
        player:startEvent(417) -- now go and see Agado-Pugado
    elseif carbuncleDebacle == QUEST_ACCEPTED and carbuncleDebacleProgress == 5 then
        player:startEvent(418) -- Uran-Mafran must be stopped
    elseif carbuncleDebacle == QUEST_ACCEPTED and carbuncleDebacleProgress == 7 then
        player:startEvent(419) -- ending cs
    elseif
        carbuncleDebacle == QUEST_COMPLETED
    then
        player:startEvent(420) -- new cs after all 3 SMN AFs done
    -----------------------------------
    elseif rootProblem == QUEST_ACCEPTED and player:getCharVar("rootProblem") == 1 then
        player:startEvent(348, 0, 829)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 416 then
        player:setCharVar("CarbuncleDebacleProgress", 2)
    elseif csid == 417 then
        player:setCharVar("CarbuncleDebacleProgress", 5)
        player:addKeyItem(xi.ki.DAZE_BREAKER_CHARM)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.DAZE_BREAKER_CHARM)
    elseif csid == 419 then
        if player:getFreeSlotsCount() ~= 0 then
            player:addItem(12520) -- Evoker's Horn
            player:messageSpecial(ID.text.ITEM_OBTAINED, 12520)
            player:addTitle(xi.title.PARAGON_OF_SUMMONER_EXCELLENCE)
            player:completeQuest(xi.quest.log_id.WINDURST, xi.quest.id.windurst.CARBUNCLE_DEBACLE)
            player:addFame(xi.quest.fame_area.WINDURST, 60)
            player:setCharVar("CarbuncleDebacleProgress", 0)
            player:needToZone(true)
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 12520)
        end
    end
end

return entity
