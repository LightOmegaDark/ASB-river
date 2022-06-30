-----------------------------------
-- Area: Buburimu Peninsula
--  NPC: Song Runes
-- !pos -244 16 -280 118
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/titles")
require("scripts/globals/quests")
local ID = require("scripts/zones/Buburimu_Peninsula/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 0 then
        player:setCharVar("TheOldMonument_Event", 3)
    elseif csid == 2 then
        player:tradeComplete()
        player:messageSpecial(ID.text.SONG_RUNES_WRITING, 917)
        player:addItem(POETIC_PARCHMENT, 1)
        player:messageSpecial(ID.text.ITEM_OBTAINED, POETIC_PARCHMENT)
        player:completeQuest(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.THE_OLD_MONUMENT)
        player:addTitle(xi.title.RESEARCHER_OF_CLASSICS)
        player:addFame(xi.quest.fame_area.BASTOK, 10)
        player:addFame(xi.quest.fame_area.SANDORIA, 10)
        player:addFame(xi.quest.fame_area.WINDURST, 10)
    end
end

return entity
