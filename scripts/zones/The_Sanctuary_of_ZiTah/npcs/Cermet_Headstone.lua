-----------------------------------
-- Area: The Sanctuary of Zi'Tah
--  NPC: Cermet Headstone
-- Involved in Mission: ZM5 Headstone Pilgrimage (Light Headstone)
-- !pos 235 0 280 121
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    -- SOUL SEARCHING
    if csid == 202 then
        npcUtil.completeQuest(player, xi.quest.log_id.OUTLANDS, xi.quest.id.outlands.SOUL_SEARCHING, {item = 13416, title = xi.title.GUIDER_OF_SOULS_TO_THE_SANCTUARY})
    end
end

return entity
