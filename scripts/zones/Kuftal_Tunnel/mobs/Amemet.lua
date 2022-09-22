---------------------------------
--  Area: Kuftal Tunnel
--  NM: Amemet
---------------------------------
require("scripts/globals/hunts")
---------------------------------
local entity = {}

local pathStart =
{
    {x = 102.61, y = 0.92, z = 1.60}
}

local pathA =
{
    {x = 90.06, y = -0.28, z = 12.24},
    {x = 67.60, y = -0.34, z = 12.42},
    {x = 54.61, y = -4.11, z = 16.89},
    {x = 25.03, y =  -9.28, z = 23.12},
    {x = 19.43, y = -7.95, z = 44.37},
    {x = 18.80, y = -6.63, z = 47.77},
    {x = 17.72, y = -5.14, z = 51.88},
    {x = 16.93, y = -3.95, z = 55.33},
    {x = 16.33, y = -3.09, z = 57.46},
    {x = 14.76, y = -1.78, z = 60.84},
    {x = 11.86, y = -0.60, z = 65.58},
    {x = -0.52, y = 0.00, z = 82.02}
}

local pathAb =
{
    {x = 3.06, y = 0.15, z = 125.56},
    {x = 40.12, y = 0.000, z = 158.89},
    {x = 60.35, y = -4.24, z = 143.23},
    {x = 79.86, y = -8.75, z = 139.89},
    {x = 85.86, y = -8.82, z = 138.11},
    {x = 91.87, y = -8.83, z = 142.52},
    {x = 101.60, y = -8.71, z = 143.17},
    {x = 100.62, y = -8.75, z = 78.86},
    {x = 108.29, y = -4.60, z = 54.26},
    {x = 118.98, y = 0.00, z = 38.12},
    {x = 102.61, y = 0.92, z = 1.60}
}

local pathB =
{
    {x = 109.49, y = 0.59, z = -0.07},
    {x = 124.47, y = 0.00, z = -42.08},
    {x = 91.93, y = -5.15, z = -58.24},
    {x = 66.46, y = -8.81, z = -62.91},
    {x = 60.86, y = -9.02, z = -73.80},
    {x = 57.09, y = -9.37, z = -96.88},
    {x = 38.39, y = -8.62, z = -98.74},
    {x = 15.73, y = -1.02, z = -94.88},
    {x = -0.65, y = 0.00, z = -84.13},
    {x = -40.24, y = 0.00, z = -38.35},
    {x = -44.36, y = 0.68, z = 13.98},
    {x = -31.28, y = -0.23, z = 48.64},
    {x = -0.52, y = 0.00, z = 82.02}
}

local pathBb =
{
    {x = 3.06, y = 0.15, z = 125.56},
    {x = 40.12, y = 0.000, z = 158.89},
    {x = 60.35, y = -4.24, z = 143.23},
    {x = 79.86, y = -8.75, z = 139.89},
    {x = 85.86, y = -8.82, z = 138.11},
    {x = 91.87, y = -8.83, z = 142.52},
    {x = 101.60, y = -8.71, z = 143.17},
    {x = 100.62, y = -8.75, z = 78.86},
    {x = 108.29, y = -4.60, z = 54.26},
    {x = 118.98, y = 0.00, z = 38.12},
    {x = 102.61, y = 0.92, z = 1.60}
}

local pathNodesB =
{
    102, -0.191, 3,
    109.49, 0.59, -0.07,
    124.47, 0.00, -42.08,
    91.93, -5.15, -58.24,
    66.46, -8.81, -62.91,
    60.86, -9.02, -73.80,
    57.09, -9.37, -96.88,
    38.39, -8.62, -98.74,
    15.73, -1.02, -94.88,
    -0.65, 0.00, -84.13,
    -40.24, 0.00, -38.35,
    -44.36, 0.68, 13.98,
    -31.28, -0.23, 48.64,
    -0.52, 0.00, 82.02,
    3.06, 0.15, 125.56,
    40.12, 0.000, 158.89,
    60.35, -4.24, 143.23,
    79.86, -8.75, 139.89,
    85.86, -8.82, 138.11,
    91.87, -8.83, 142.52,
    101.60, -8.71, 143.17,
    100.62, -8.75, 78.86,
    108.29, -4.60, 54.26,
    118.98, 0.00, 38.12,
    102.61, 0.92, 1.60,
    102, -0.191, 3,
    102, -0.191, 3
}


entity.onPath = function(mob)
    --Mob is on path node, let's check which path we need to route them to
    local currentPath = mob:getLocalVar("mobPath")
    local nextIndex = mob:getLocalVar("nextPatrolIndex")
    local reverseCheck = mob:getLocalVar("pathReverse")
    local pauseTime = mob:getLocalVar("pauseTime")
    if pauseTime < os.time() then
        if currentPath == 1 and reverseCheck == 0 then
            --Let's check if the mob is at one of the pre-determined pause points.
            if mob:atPoint({25.03, -9.28, 23.12}) or mob:atPoint({-0.52, 0.00, 82.02})
            or mob:atPoint({40.12, 0.000, 158.89}) or mob:atPoint({101.60, -8.71, 143.17}) then
                -- Pause check! Let's give it a 1 in 3 chance to pause.
                local pauseCheck = math.random(0,2)
                if pauseCheck == 2 then
                    local newPauseTime = math.random(15, 65) + os.time()
                    mob:setLocalVar("pauseTime", newPauseTime)
                    mob:setLocalVar("nextPatrolIndex", nextIndex + 1)
                    mob:setMobMod(xi.mobMod.NO_MOVE, 1)
                    return
                end
            end
            xi.path.patrol(mob, pathNodesA)
        elseif currentPath == 2 and reverseCheck == 0 then
            if mob:atPoint({57.09, -9.37, -96.88}) or mob:atPoint({-0.65, 0.00, -84.13})
            or mob:atPoint({-40.24, 0.00, -38.35}) or mob:atPoint({-44.36, 0.68, 13.98})
            or mob:atPoint({-0.52, 0.00, 82.02}) or mob:atPoint({40.12, 0.000, 158.89})
            or mob:atPoint({101.60, -8.71, 143.17}) then
                local pauseCheck = math.random(0,2)
                if pauseCheck == 2 then
                    local newPauseTime = math.random(15, 65) + os.time()
                    mob:setLocalVar("pauseTime", newPauseTime)
                    mob:setLocalVar("nextPatrolIndex", nextIndex + 1)
                    mob:setMobMod(xi.mobMod.NO_MOVE, 1)
                    return
                end
            end
            xi.path.patrol(mob, pathNodesB)
        elseif currentPath == 1 and reverseCheck == 1 then
            if mob:atPoint({25.03, -9.28, 23.12}) or mob:atPoint({-0.52, 0.00, 82.02})
            or mob:atPoint({40.12, 0.000, 158.89}) or mob:atPoint({101.60, -8.71, 143.17}) then
                local pauseCheck = math.random(0,2)
                if pauseCheck == 2 then
                    local newPauseTime = math.random(15, 65) + os.time()
                    mob:setLocalVar("pauseTime", newPauseTime)
                    mob:setLocalVar("nextPatrolIndex", nextIndex + 1)
                    mob:setMobMod(xi.mobMod.NO_MOVE, 1)
                    return
                end
            end
            xi.path.patrol(mob, xi.path.fromEnd(pathNodesA, 1))
        elseif currentPath == 2 and reverseCheck == 1 then
            if mob:atPoint({57.09, -9.37, -96.88}) or mob:atPoint({-0.65, 0.00, -84.13})
            or mob:atPoint({-40.24, 0.00, -38.35}) or mob:atPoint({-44.36, 0.68, 13.98})
            or mob:atPoint({-0.52, 0.00, 82.02}) or mob:atPoint({40.12, 0.000, 158.89})
            or mob:atPoint({101.60, -8.71, 143.17}) then
                local pauseCheck = math.random(0,2)
                if pauseCheck == 2 then
                    local newPauseTime = math.random(15, 65) + os.time()
                    mob:setLocalVar("pauseTime", newPauseTime)
                    mob:setLocalVar("nextPatrolIndex", nextIndex + 1)
                    mob:setMobMod(xi.mobMod.NO_MOVE, 1)
                    return
                end
            end
            xi.path.patrol(mob, xi.path.fromEnd(pathNodesB, 1))
        end
    else
        xi.path.pathToNearest(mob, pathNodesA)
    end
end

entity.onMobSpawn = function(mob)
    mob:setLocalVar("isPaused", 0)
    mob:setLocalVar("mobPath", 0)
    mob:pathThrough(pathStart, xi.path.flag.COORDS)
end

entity.onPath = function(mob)
    if not mob:isFollowingPath() then
        if mob:getLocalVar("isPaused") ~= 0 then
            local currentPath = mob:getLocalVar("mobPath")
            local reversePath = mob:getLocalVar("reversePath")
            local path = {}
            mob:setLocalVar("isPaused", 0)
            mob:clearPath()
            if reversePath == 0 then --forward path logic begin
                switch (currentPath): caseof
                {
                    [0] = function() --Path A
                        local pathRnd = math.random(0,3)
                        local reverseCheck = math.random(0,2)
                    end;
                    [1] = function() --Path Ab
                    end;
                    [2] = function() -- Path B
                        local pathRnd = math.random(0,3)
                        local reverseCheck = math.random(0,2)
                    end;
                    [3] = function() -- Path Bb
                    end;
                }
            else --reverse path logic begin
                switch (currentPath): caseof
                {
                    [0] = function() --Path A
                        local pathRnd = math.random(0,3)
                        local reverseCheck = math.random(0,2)
                    end;
                    [1] = function() --Path Ab
                    end;
                    [2] = function() -- Path B
                        local pathRnd = math.random(0,3)
                        local reverseCheck = math.random(0,2)
                    end;
                    [3] = function() -- Path Bb
                    end;
                }
            end
        else
            --Amemet is paused, he will wait
            --a random amount of times before resuming his path
            mob:clearPath()
            local x = mob:getXPos()
            local y = mob:getYPos()
            local z = mob:getZPos()
            local pauses = {}
            local count = math.random(0,6)
            for i = 0, count do
                local wait = math.random(1500,3000)
                pauses[i+1] = {
                x = x, y = y, z = z, wait = wait }
            end
            mob:timer(math.random(1500, 3000), function(mob)
                mob:pathThrough(pauses, xi.path.flag.COORDS)
                mob:setLocalVar("isPaused", 1)
            end)
        end
    end
end

entity.onMobFight = function(mob)
    --At 25% or less, Amemet receives regain.
    if mob:getHPP() <= 25 then
        mob:setMod(xi.mod.REGAIN, 10)
    end
end

entity.onMobDisengage = function (mob)
    mob:setMod(xi.mod.REGAIN, 0)
end

entity.onMobDeath = function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 418)
end

return entity
