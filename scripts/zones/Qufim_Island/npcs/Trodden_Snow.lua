-----------------------------------
-- Area: Qufim Island
--  NPC: Trodden Snow
-- Mission: ASA - THAT_WHICH_CURDLES_BLOOD
-- Mission: ASA - SUGAR_COATED_DIRECTIVE
-- !pos -19 -17 104 126
-----------------------------------
local ID = require("scripts/zones/Qufim_Island/IDs")
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    -- Trade Enfeebling Kit
    if player:getCurrentMission(xi.mission.log_id.ASA) == xi.mission.id.asa.THAT_WHICH_CURDLES_BLOOD then
        local item = 0
        local asaStatus = player:getCharVar("ASA_Status")

        -- TODO: Other Enfeebling Kits
        if asaStatus == 0 then
            item = 2779
        else
            printf("Error: Unknown ASA Status Encountered <%u>", asaStatus)
        end

        if npcUtil.tradeHas(trade, item) then
            player:startEvent(44)
        end
    end
end

entity.onTrigger = function(player, npc)
    --ASA 4 CS: Triggers With At Least 3 Counterseals.
    if player:getCurrentMission(xi.mission.log_id.ASA) == xi.mission.id.asa.SUGAR_COATED_DIRECTIVE then
        local completedSeals =
            (player:hasKeyItem(xi.ki.AMBER_COUNTERSEAL)    and 1 or 0) +
            (player:hasKeyItem(xi.ki.AZURE_COUNTERSEAL)    and 1 or 0) +
            (player:hasKeyItem(xi.ki.CERULEAN_COUNTERSEAL) and 1 or 0) +
            (player:hasKeyItem(xi.ki.EMERALD_COUNTERSEAL)  and 1 or 0) +
            (player:hasKeyItem(xi.ki.SCARLET_COUNTERSEAL)  and 1 or 0) +
            (player:hasKeyItem(xi.ki.VIOLET_COUNTERSEAL)   and 1 or 0)

        if completedSeals >= 3 then
            player:setCharVar("ASA_Status", completedSeals)
            player:startEvent(45)
        end
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
