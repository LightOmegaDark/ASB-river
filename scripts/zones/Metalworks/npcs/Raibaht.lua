-----------------------------------
-- Area: Metalworks
--  NPC: Raibaht
-- !pos -27 -10 -1 237
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)

    if (csid == 510 and option == 0) then
        player:setCharVar("TheUsual_Event", 1)
    elseif (csid == 751) then
        player:addQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.DARK_LEGACY)
        player:setCharVar("darkLegacyCS", 1)
    elseif (csid == 755) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 16798) -- Raven Scythe
        else
            player:delKeyItem(xi.ki.DARKSTEEL_FORMULA)
            player:addItem(16798)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 16798) -- Raven Scythe
            player:setCharVar("darkLegacyCS", 0)
            player:addFame(xi.quest.fame_area.BASTOK, 20)
            player:completeQuest(xi.quest.log_id.BASTOK, xi.quest.id.bastok.DARK_LEGACY)
        end
    elseif (csid == 933) then
        player:setCharVar("WildcatBastok", utils.mask.setBit(player:getCharVar("WildcatBastok"), 5, true))
    end

end

return entity
