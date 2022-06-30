-----------------------------------
-- Area: Port Bastok
--  NPC: Alib-Mufalib
-- Type: Warp NPC
-- !pos 116.080 7.372 -31.820 236
-----------------------------------
require("scripts/globals/teleports")
require("scripts/globals/missions")
require("scripts/settings/main")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if (trade:getGil() == 300 and trade:getItemCount() == 1 and player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.LURE_OF_THE_WILDCAT) == QUEST_COMPLETED and player:getCurrentMission(xi.mission.log_id.TOAU) > xi.mission.id.toau.IMMORTAL_SENTRIES) then
        -- Needs a check for at least traded an invitation card to Naja Salaheem
        player:startEvent(379)
    end
end

entity.onTrigger = function(player, npc)
    local lureBastok = player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.LURE_OF_THE_WILDCAT)
    local wildcatBastok = player:getCharVar("WildcatBastok")
    if (lureBastok ~= 2 and xi.settings.ENABLE_TOAU == 1) then
        if (lureBastok == 0) then
            player:startEvent(357)
        else
            if (WildcatBastok == 0) then
                player:startEvent(358)
            elseif utils.mask.isFull(WildcatBastok, 20) then
                player:startEvent(360)
            else
                player:startEvent(359)
            end
        end
    elseif (player:getCurrentMission(xi.mission.log_id.TOAU) >= xi.mission.id.toau.PRESIDENT_SALAHEEM) then
        player:startEvent(378)
    else
        player:startEvent(361)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 357) then
        player:addQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.LURE_OF_THE_WILDCAT)
        player:setCharVar("WildcatBastok", 0)
        player:addKeyItem(xi.ki.BLUE_SENTINEL_BADGE)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.BLUE_SENTINEL_BADGE)
    elseif (csid == 360) then
        player:completeQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.LURE_OF_THE_WILDCAT)
        player:addFame(xi.quest.fame_area.BASTOK, 150)
        player:setCharVar("WildcatBastok", 0)
        player:delKeyItem(xi.ki.BLUE_SENTINEL_BADGE)
        player:addKeyItem(xi.ki.BLUE_INVITATION_CARD)
        player:messageSpecial(ID.text.KEYITEM_LOST, xi.ki.BLUE_SENTINEL_BADGE)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.BLUE_INVITATION_CARD)
    elseif (csid == 379) then
        player:tradeComplete()
        xi.teleport.to(player, xi.teleport.id.WHITEGATE)
    end
end

return entity
