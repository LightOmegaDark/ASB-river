-----------------------------------
-- Area: Bastok Mines
--  NPC: Roh Latteh
-----------------------------------
require("scripts/globals/settings")
local ID = require("scripts/zones/Bastok_Mines/IDs")
require("scripts/globals/events/starlight_celebrations")
-----------------------------------

local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.events.starlightCelebration.onStarlightSmilebringersTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 95 then
        player:addKeyItem(xi.ki.LETTER_FROM_ROH_LATTEH)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.LETTER_FROM_ROH_LATTEH)
        player:setCharVar("MomTheAdventurer_Event", 2)
        player:tradeComplete()
    elseif csid == 96 then
        if player:getFreeSlotsCount() > 0 then
            player:completeQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.THE_SIGNPOST_MARKS_THE_SPOT)
            player:delKeyItem(xi.ki.PAINTING_OF_A_WINDMILL)
            player:addTitle(xi.title.TREASURE_SCAVENGER)
            player:addFame(xi.quest.fame_area.BASTOK, 50)
            player:addItem(12601)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 12601) -- Linen Robe
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 12601)
        end
    end
end

return entity
