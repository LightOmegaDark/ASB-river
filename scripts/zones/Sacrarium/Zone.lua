-----------------------------------
-- Zone: Sacrarium (28)
-----------------------------------
local ID = require('scripts/zones/Sacrarium/IDs')
require('scripts/globals/conquest')
require('scripts/globals/treasure')
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    -- randomize Old Prof. Mariselle's spawn location
    GetNPCByID(ID.npc.QM_MARISELLE_OFFSET + math.random(0, 5)):setLocalVar("hasProfessorMariselle", 1)

    -- FFXI wiki claims 4hours and 10mins game time for movement in Sacrarium
    GetNPCByID(ID.npc.QM_TAVNAZIAN_COOKBOOK):addPeriodicTrigger(0, 250, 0)

    xi.treasure.initZone(zone)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(-219.996, -18.587, 82.795, 64)
    end

    return cs
end

zoneObject.afterZoneIn = function(player)
end

zoneObject.onConquestUpdate = function(zone, updatetype, influence, owner, ranking, isConquestAlliance)
    xi.conq.onConquestUpdate(zone, updatetype, influence, owner, ranking, isConquestAlliance)
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onGameDay = function()
    -- change 18 labyrinth doors depending on in-game day (0 = open, 1 = closed)
    local labyrinthDoorsByDay =
    {
        [xi.day.FIRESDAY]     = { 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0 },
        [xi.day.EARTHSDAY]    = { 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0 },
        [xi.day.WATERSDAY]    = { 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1 },
        [xi.day.WINDSDAY]     = { 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0 },
        [xi.day.ICEDAY]       = { 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0 },
        [xi.day.LIGHTNINGDAY] = { 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0 },
        [xi.day.LIGHTSDAY]    = { 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1 },
        [xi.day.DARKSDAY]     = { 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0 },
    }

    local doors = labyrinthDoorsByDay[VanadielDayOfTheWeek()]
    for i = 0, 17 do
        GetNPCByID(ID.npc.LABYRINTH_OFFSET + i):setAnimation(xi.anim.OPEN_DOOR + doors[i + 1])
    end
end

zoneObject.onEventUpdate = function(player, csid, option)
end

zoneObject.onEventFinish = function(player, csid, option)
end

zoneObject.onZoneWeatherChange = function(weather)
    local zone = GetZone(xi.zone.SACRARIUM)
    -- Sets flag to check for Elel Spawn
    if
        weather == xi.weather.GLOOM or
        weather == xi.weather.DARKNESS
    then
        zone:setLocalVar("NeedToCheckElel", 1)
    else
        zone:setLocalVar("NeedToCheckElel", 0)
    end
end

zoneObject.onZoneTick = function(zone)
    local elelre = GetServerVariable("\\[SPAWN\\]" .. tostring(ID.mob.ELEL))
    if zone:getLocalVar("NeedToCheckElel") == 1 then
        -- Do not spawn mob unless the following checks pass:
        -- 1: GLOOM or DARKNESS Weather
        -- 2: Game Time between 20:00 to 4:00
        if os.time() > elelre then
            local weather = zone:getWeather()
            local elel = GetMobByID(ID.mob.ELEL)
            if
                not elel:isSpawned() and
                (weather == xi.weather.GLOOM or
                weather == xi.weather.DARKNESS) and
                (VanadielHour() < 4 or
                VanadielHour() >= 20)
            then
                -- Checks Passed, Spawn Elel
                zone:setLocalVar("NeedToCheckElel", 0)
                DisallowRespawn(ID.mob.ELEL, false)
                SpawnMob(ID.mob.ELEL)
            end
        end
    end
end

return zoneObject
