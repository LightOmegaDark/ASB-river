-----------------------------------
-- Area: Bastok Markets
--  NPC: Salimah
-- !pos -31.687 -6.824 -73.282 235
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/titles")
local ID = require("scripts/zones/Bastok_Markets/IDs")
require("scripts/settings/main")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)

    local Gourmet = player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.GOURMET)

    if (csid == 200) then
        if (Gourmet == QUEST_AVAILABLE) then
            player:addQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.GOURMET)
        end
    elseif (csid ~= 121) then
        player:tradeComplete()
        if (Gourmet == QUEST_ACCEPTED) then
            player:completeQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.GOURMET)
        end

        local gil=350
        local fame=120
        if (csid == 201) then
            gil=200
        elseif (csid == 203) then
            gil=100
            fame=60
        end

        player:addGil(gil * xi.settings.GIL_RATE)
        player:messageSpecial(ID.text.GIL_OBTAINED, gil * xi.settings.GIL_RATE)
        player:addFame(xi.quest.fame_area.BASTOK, fame)
        player:addTitle(xi.title.MOMMYS_HELPER)
        player:needToZone(true)
    end
end

return entity
