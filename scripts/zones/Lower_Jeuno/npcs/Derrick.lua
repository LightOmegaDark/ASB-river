-----------------------------------
-- Area: Lower Jeuno
--  NPC: Derrick
-- Involved in Quests and finish : Save the Clock Tower
-- !pos -32 -1 -7 245
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/keyitems")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if not player:hasKeyItem(xi.ki.AIRSHIP_PASS) then
        player:startEvent(230, 12)
    else
        player:startEvent(230, 14)
    end
end

entity.onEventUpdate = function(player, csid, option)
    if csid == 230 and option == 10 then
        if player:delGil(500000) then
            player:addKeyItem(xi.ki.AIRSHIP_PASS)
            player:updateEvent(0, 1)
        else
            player:updateEvent(0, 0)
        end
    end
end

entity.onEventFinish = function(player, csid, option)
    if csid == 230 and option == 10 then
        if player:hasKeyItem(xi.ki.AIRSHIP_PASS) then
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.AIRSHIP_PASS)
        end
    elseif csid == 230 and option == 20 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 555)
        else
            player:addItem(555)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 555)
            player:setCharVar("saveTheClockTowerVar", 1)
            player:setCharVar("saveTheClockTowerNPCz1", 0)
            player:setCharVar("saveTheClockTowerNPCz2", 0)
        end
    elseif csid == 230 and option == 30 then
        if player:hasItem(555) == true then
            player:messageSpecial(ID.text.ITEM_OBTAINED, 555)
            player:setCharVar("saveTheClockTowerVar", 1)
            player:setCharVar("saveTheClockTowerNPCz1", 0)
            player:setCharVar("saveTheClockTowerNPCz2", 0)
        else
            if player:getFreeSlotsCount() == 0 then
                player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 555)
            else
                player:addItem(555)
                player:messageSpecial(ID.text.ITEM_OBTAINED, 555)
                player:setCharVar("saveTheClockTowerVar", 1)
                player:setCharVar("saveTheClockTowerNPCz1", 0)
                player:setCharVar("saveTheClockTowerNPCz2", 0)
            end
        end
    elseif csid == 231 then
        player:setCharVar("saveTheClockTowerVar", 0)
        player:setCharVar("saveTheClockTowerNPCz1", 0)
        player:setCharVar("saveTheClockTowerNPCz2", 0)
        player:addTitle(xi.title.CLOCK_TOWER_PRESERVATIONIST)
        player:addFame(xi.quest.fame_area.JEUNO, 30)
        player:tradeComplete()
        player:completeQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.SAVE_THE_CLOCK_TOWER)
    end
end

return entity
