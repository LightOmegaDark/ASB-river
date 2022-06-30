-----------------------------------
-- Area: Bastok Mines
--  NPC: Deidogg
-- !pos -13 7 29 234
-----------------------------------
local ID = require("scripts/zones/Bastok_Mines/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/status")
require("scripts/globals/utils")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 161 then
        player:addQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.THE_TALEKEEPER_S_TRUTH)
        player:setCharVar("theTalekeeperTruthCS", 3)
    elseif csid == 162 then
        player:tradeComplete()
        player:setCharVar("theTalekeeperTruthCS", 4)
    elseif csid == 164 then
        player:tradeComplete()
        player:setCharVar("theTalekeeperTruthCS", 5)
        player:setCharVar("theTalekeeperTruth_timer", VanadielDayOfTheYear())
    elseif csid == 165 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 14089) -- Fighter's Calligae
        else
            player:addItem(14089)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 14089) -- Fighter's Calligae
            player:setCharVar("theTalekeeperTruthCS", 0)
            player:setCharVar("theTalekeeperTruth_timer", 0)
            player:setCharVar("DeidoggWait1DayForAF3", VanadielDayOfTheYear())
            player:needToZone(true)
            player:addFame(xi.quest.fame_area.BASTOK, 40)
            player:completeQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.THE_TALEKEEPER_S_TRUTH)
        end
    elseif csid == 172 then
        player:tradeComplete()
        player:addQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.THE_TALEKEEPER_S_GIFT)
        player:setCharVar("theTalekeeperGiftCS", 3)
    elseif csid == 504 then
        player:setCharVar("WildcatBastok", utils.mask.setBit(player:getCharVar("WildcatBastok"), 18, true))
    end
end

return entity
