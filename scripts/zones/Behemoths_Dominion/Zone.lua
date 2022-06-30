-----------------------------------
-- Zone: Behemoths_Dominion (127)
-----------------------------------
local ID = require("scripts/zones/Behemoths_Dominion/IDs")
require("scripts/globals/settings")
require("scripts/globals/zone")
-----------------------------------
local zoneObject = {}

zone_object.onInitialize = function(zone)
    if (xi.settings.main.LandKingSystem_NQ ~= 1) then
        UpdateNMSpawnPoint(ID.mob.BEHEMOTH)
        GetMobByID(ID.mob.BEHEMOTH):setRespawnTime(900 + math.random(0, 6) * 1800)
    end
end

zoneObject.onConquestUpdate = function(zone, updatetype)
    xi.conq.onConquestUpdate(zone, updatetype)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(358.134, 24.806, -60.001, 123)
    end

    return cs
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option)
end

zoneObject.onEventFinish = function(player, csid, option)
end

return zoneObject
