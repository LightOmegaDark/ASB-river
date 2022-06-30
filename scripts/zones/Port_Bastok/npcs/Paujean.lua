-----------------------------------
-- Area: Port Bastok
--  NPC: Paujean
-- !pos -93.738 4.649 34.373 236
-----------------------------------
local ID = require("scripts/zones/Port_Bastok/IDs")
require("scripts/settings/main")
require("scripts/globals/quests")
require("scripts/globals/titles")
require("scripts/globals/utils")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local SilenceOfTheRams = player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.SILENCE_OF_THE_RAMS)
    local WildcatBastok = player:getCharVar("WildcatBastok")

    if (player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.LURE_OF_THE_WILDCAT) == QUEST_ACCEPTED and not utils.mask.getBit(WildcatBastok, 2)) then
        player:startEvent(355)
    elseif (SilenceOfTheRams == QUEST_AVAILABLE and player:getFameLevel(xi.quest.fame_area.NORG) >= 2) then
        player:startEvent(195)
    elseif (SilenceOfTheRams == QUEST_ACCEPTED) then
        player:showText(npc, ID.text.PAUJEAN_DIALOG_1)
    else
        player:startEvent(25)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
