-----------------------------------
-- Area: Sealion's Den
--  NPC: Sueleen
-- !pos 612 132 774 32
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:getCurrentMission(xi.mission.log_id.COP) > xi.mission.id.cop.THE_WARRIOR_S_PATH then
        player:startEvent(12)
    elseif player:getCurrentMission(xi.mission.log_id.COP) == xi.mission.id.cop.FLAMES_IN_THE_DARKNESS and player:getCharVar("PromathiaStatus") == 1 then
        player:startEvent(16)
    elseif player:getCurrentMission(xi.mission.log_id.COP) == xi.mission.id.cop.CALM_BEFORE_THE_STORM and player:hasKeyItem(xi.ki.LETTERS_FROM_ULMIA_AND_PRISHE) then
        player:startEvent(17)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
