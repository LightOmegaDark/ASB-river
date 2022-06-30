-----------------------------------
-- Area: Upper Jeuno
--  NPC: Baudin
-- !pos -75 0 80 244
-----------------------------------
local ID = require("scripts/zones/Upper_Jeuno/IDs")
require("scripts/globals/settings")
require("scripts/globals/titles")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 177 then
        player:addCharVar("saveTheClockTowerVar", 1)
        player:addCharVar("saveTheClockTowerNPCz2", 32)
    elseif csid == 105 then
        player:setCharVar("saveMySisterVar", 3)
    elseif csid == 107 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 17041)
        else
            player:addTitle(xi.title.EXORCIST_IN_TRAINING)
            player:addGil(xi.settings.main.GIL_RATE*3000)
            player:messageSpecial(ID.text.GIL_OBTAINED, xi.settings.main.GIL_RATE*3000)
            player:addItem(17041)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 17041)
            player:tradeComplete()
            player:addFame(xi.quest.fame_area.JEUNO, 30)
            player:completeQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.SAVE_MY_SISTER)
        end
    end
end

return entity
