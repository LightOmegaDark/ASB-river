-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Pradiulot
-- Involved in Quest: Unforgiven
-- !pos -20.814 -22 8.399 26
-----------------------------------
local ID = require("scripts/zones/Tavnazian_Safehold/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local unforgiven = player:getQuestStatus(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.UNFORGIVEN)

    if  unforgiven == QUEST_COMPLETED and
        player:getCharVar("Unforgiven_Last_CS") == 1
        then
            player:startEvent(206) -- Dialogue after completing quest (optional)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 206 then
        player:setCharVar("Unforgiven_Last_CS", 0)
    end
end

return entity
