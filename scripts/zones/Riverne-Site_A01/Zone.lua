-----------------------------------
-- Zone: Riverne-Site_A01
-----------------------------------
local ID = require("scripts/zones/Riverne-Site_A01/IDs")
require("scripts/globals/conquest")
require("scripts/settings/main")
require("scripts/globals/status")
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
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
        player:setPos(732.55, -32.5, -506.544, 90)
    end

    return cs
end

zone_object.afterZoneIn = function(player)
    if xi.settings.ENABLE_COP_ZONE_CAP == 1 then -- ZONE WIDE LEVEL RESTRICTION
        player:addStatusEffect(xi.effect.LEVEL_RESTRICTION, 40, 0, 0) -- LV40 cap
    end
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option)
end

zoneObject.onEventFinish = function(player, csid, option)
end

return zoneObject
