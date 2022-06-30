-----------------------------------
-- Area: Bastok Mines
--  NPC: Gerbaum
-- Starts & Finishes Repeatable Quest: Minesweeper
-----------------------------------
local ID = require("scripts/zones/Bastok_Mines/IDs")
require("scripts/globals/titles")
require("scripts/globals/quests")
require("scripts/globals/settings")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local rand = math.random(1, 2)

    if rand == 1 then
        player:startEvent(22)
    else
        player:startEvent(23)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    local MineSweep = player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.MINESWEEPER)

    if csid == 108 then
        if MineSweep == 0 then
            player:addQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.MINESWEEPER)
        end

    elseif csid == 109 then
        if MineSweep == 1 then
            player:completeQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.MINESWEEPER)
            player:addFame(xi.quest.fame_area.BASTOK, 75)
            player:addTitle(xi.title.ZERUHN_SWEEPER)
        else
            player:addFame(xi.quest.fame_area.BASTOK, 8)
        end
        player:addGil(xi.settings.main.GIL_RATE * 150)
        player:messageSpecial(ID.text.GIL_OBTAINED, xi.settings.main.GIL_RATE * 150)
    end
end

return entity
