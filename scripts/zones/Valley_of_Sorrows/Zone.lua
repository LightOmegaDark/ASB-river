-----------------------------------
-- Zone: Valley_of_Sorrows (128)
-----------------------------------
local ID = require("scripts/zones/Valley_of_Sorrows/IDs")
require("scripts/globals/conquest")
require("scripts/settings/main")
require("scripts/globals/zone")
-----------------------------------
local zoneObject = {}

zone_object.onInitialize = function(zone)
    if (xi.settings.LandKingSystem_NQ ~= 1) then
        UpdateNMSpawnPoint(ID.mob.ADAMANTOISE)
        GetMobByID(ID.mob.ADAMANTOISE):setRespawnTime(900 + math.random(0, 6) * 1800)
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
        player:setPos(45.25, -2.115, -140.562, 0)
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
