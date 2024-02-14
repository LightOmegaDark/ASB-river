-----------------------------------
-- Area: Maze of Shakhrami
--  NPC: Rockwell
-- Quest: Your Crystal Ball
-- !pos -18 -13 181 198
-----------------------------------
local ID = require("scripts/zones/Maze_of_Shakhrami/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.YOUR_CRYSTAL_BALL) == QUEST_ACCEPTED then
        if npcUtil.tradeHasExactly(trade, { { xi.items.AHRIMAN_LENS, 1 } }) then
            if player:getCharVar("QuestYourCrystalBall_prog") > os.time() then
                player:messageSpecial(ID.text.CANNOT_SUBERMGE, xi.items.AHRIMAN_LENS)
            elseif player:getCharVar("QuestYourCrystalBall_prog") == 0 then -- don't initiate submerge if previous one hasn't been collected
                player:confirmTrade()
                player:setCharVar("QuestYourCrystalBall_prog", getMidnight())
                player:messageSpecial(ID.text.SUBMERGE, xi.items.AHRIMAN_LENS)
            end
        elseif npcUtil.tradeHas(trade, xi.items.AHRIMAN_LENS) then
            player:messageSpecial(ID.text.CANNOT_SUBERMGE, xi.items.AHRIMAN_LENS)
        end
    end
end

entity.onTrigger = function(player, npc)
    if
        player:getQuestStatus(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.YOUR_CRYSTAL_BALL) == QUEST_ACCEPTED and
        player:getCharVar("QuestYourCrystalBall_prog") ~= 0
    then
        if player:getCharVar("QuestYourCrystalBall_prog") < os.time() then
            player:startEvent(52):progress()
        elseif player:getCharVar("QuestYourCrystalBall_prog") > os.time() then
            player:messageSpecial(ID.text.NOT_READY, 0, xi.items.DIVINATION_SPHERE):progress()
        end
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 52 then
        npcUtil.giveItem(player, xi.items.DIVINATION_SPHERE)
        player:setCharVar("QuestYourCrystalBall_prog", 0)
    end
end

return entity
