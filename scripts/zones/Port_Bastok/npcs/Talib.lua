-----------------------------------
-- Area: Port Bastok
--  NPC: Talib
-- Starts Quest: Beauty and the Galka
-- Starts & Finishes Quest: Shady Business
-----------------------------------
require("scripts/settings/main")
require("scripts/globals/keyitems")
require("scripts/globals/shop")
require("scripts/globals/quests")
local ID = require("scripts/zones/Port_Bastok/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 2 and option == 0 then
        player:addQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.BEAUTY_AND_THE_GALKA)
    elseif csid == 2 and option == 1 then
        player:setCharVar("BeautyAndTheGalkaDenied", 1)
    elseif csid == 3 then
        player:tradeComplete()
        player:addKeyItem(xi.ki.PALBOROUGH_MINES_LOGS)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.PALBOROUGH_MINES_LOGS)
    elseif csid == 90 then
        local ShadyBusiness = player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.SHADY_BUSINESS)

        if ShadyBusiness == QUEST_AVAILABLE then
            player:addQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.SHADY_BUSINESS)
        end
    elseif csid == 91 then
        local ShadyBusiness = player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.SHADY_BUSINESS)

        if ShadyBusiness == QUEST_ACCEPTED then
            player:addFame(xi.quest.fame_area.NORG, 100)
            player:completeQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.SHADY_BUSINESS)
        else
            player:addFame(xi.quest.fame_area.NORG, 80)
        end

        player:tradeComplete()
        player:addGil(xi.settings.GIL_RATE * 350)
        player:messageSpecial(ID.text.GIL_OBTAINED, xi.settings.GIL_RATE * 350)
    end

end

return entity
