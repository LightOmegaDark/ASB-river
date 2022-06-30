-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Kuu Mohzolhi
-- Starts and Finishes Quest: Growing Flowers
-- !pos -123 0 80 231
-----------------------------------
require("scripts/settings/main")
require("scripts/globals/quests")
local ID = require("scripts/zones/Northern_San_dOria/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)

    if csid == 605 and option == 1002 then
        player:tradeComplete()
        player:completeQuest(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.GROWING_FLOWERS)
        player:addFame(xi.quest.fame_area.SANDORIA, 120)
        player:setMoghouseFlag(1)
        player:messageSpecial(ID.text.MOGHOUSE_EXIT)
    elseif csid == 605 and option == 1 then
        player:tradeComplete()
        player:addQuest(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.GROWING_FLOWERS)
    end
end

return entity
