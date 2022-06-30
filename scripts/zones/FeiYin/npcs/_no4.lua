-----------------------------------
-- Area: Fei'Yin
--  NPC: Cermet Door (triggers Rukususu dialog)
-- !pos -183 0 190 204
--     Involved in Quests: Curses, Foiled A-Golem!?, SMN AF2: Class Reunion, SMN AF3: Carbuncle Debacle
--    Involved in Missions: Windurst 5-1/7-2/8-2
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/settings")
local ID = require("scripts/zones/FeiYin/IDs")
require("scripts/globals/keyitems")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
