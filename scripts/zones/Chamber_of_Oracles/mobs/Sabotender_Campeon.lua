-----------------------------------
-- Area: Chamber of Oracles
--  Mob: Sabotender Campeon
-- KSNM: Cactuar Suave
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}

local destinations =
{
    {
        {  0,100,-240}, -- center
        {  0,100,-250}, -- front
        {-10,100,-240}, -- left
        { 10,100,-240}, -- right
        {  0,100,-239}, -- back
    },
    {
        {  1,0,  1}, -- center
        {  1,0,-11}, -- front
        {-11,0,  1}, -- left
        { 11,0,  1}, -- right
        {  1,0, 10}, -- back
    },
    {
        {  0,-100,240}, -- center
        {  0,-100,230}, -- front
        {-10,-100,240}, -- left
        { 10,-100,240}, -- right
        {  0,-100,249}, -- back
    },
}

-- local function reachedDestination(mob, bfNum, destination)
--     local current = mob:getPos()
--     local offset = 0.1

--     local x = current.x - destinations[bfNum][destination][1]
--     local y = current.y - destinations[bfNum][destination][2]
--     local z = current.z - destinations[bfNum][destination][3]

--     if
--     x <= offset and
--     y <= offset and
--     z <= offset then
--         return true
--     else
--         return false
--     end
-- end

local function resetTimer(mob)
    mob:setLocalVar("timer", os.time() + math.random(40,55))
end

local function runAway(mob, bfNum, destination)
    if mob:getLocalVar("timer") < os.time() then
        resetTimer(mob)
        return
    end

    local target = destinations[bfNum][destination]
    mob:pathThrough(target, xi.path.flag.NONE)

    mob:queue(0, function(mobArg)
        destination = math.random(1,5)
        runAway(mob,bfNum, destination)
    end)
end

entity.onMobSpawn = function(mob)
    mob:setMod(xi.mod.REGEN, 50)
    mob:setMod(xi.mod.SLEEPRES, 90)
    mob:setSpeed(50)
end

entity.onMobEngaged = function(mob)
    resetTimer(mob)
end

entity.onMobFight = function(mob, target)
    local bfNum = mob:getBattlefield():getArea()

    if mob:getLocalVar("timer") < os.time() then
        print("time to run!")
        local destination = math.random(1,5)
        resetTimer(mob)
        runAway(mob, bfNum, destination)
    end
end

entity.onMobDeath = function(mob, player, isKiller)
end

return entity
