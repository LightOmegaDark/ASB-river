-----------------------------------
-- Zone: Dynamis-San_dOria
-----------------------------------
local ID = require('scripts/zones/Dynamis-San_dOria/IDs')
require('scripts/globals/conquest')
require('scripts/globals/dynamis')
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    xi.dynamis.zoneOnInitialize(zone)
end

zone_object.onZoneTick = function(zone)
end

zone_object.onConquestUpdate = function(zone, updatetype)
    xi.conq.onConquestUpdate(zone, updatetype)
end

zoneObject.onZoneIn = function(player, prevZone)
    return xi.dynamis.zoneOnZoneIn(player, prevZone)
end

zone_object.onZoneTick = function(zone)
end

zone_object.onRegionEnter = function(player, region)
end

zoneObject.onEventUpdate = function(player, csid, option)
end

zoneObject.onEventFinish = function(player, csid, option)
    xi.dynamis.zoneOnEventFinish(player, csid, option)
end

return zoneObject
