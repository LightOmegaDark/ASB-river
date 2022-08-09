-----------------------------------
-- Area: Bearclaw Pinnacle
-- Mob: Snoll Tzar
-- ENM: When Hell Freezes Over
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
local entity = {}

local controlBombs =
{
    {16801818, 16801821},
    {16801826, 16801829},
    {16801832, 16801835},
}

entity.onMobSpawn = function(mob)
    mob:setMod(xi.mod.SLEEPRES, 75)
    mob:setMod(xi.mod.LULLABYRES, 75)
    mob:setLocalVar("mobsDead", 0)

    for bf = 1, 3 do
        for i = 1, 2 do
            if mob:getID() == controlBombs[bf][i] then
                mob:setLocalVar("controlBombID", controlBombs[bf][i])
                mob:setLocalVar("adds", math.random(0,2))
                if mob:getLocalVar("wave") == 0 then
                    mob:setLocalVar("adds", 2)
                end

                for y = 1, mob:getLocalVar("adds") do
                    SpawnMob(mob:getID() + y)
                end
                break
            end
        end
    end
end

entity.onMobDeath = function(mob, player, isKiller)
    if isKiller then
        mob:setLocalVar("mobsDead", mob:getLocalVar("mobsDead") + 1)
        if
            mob:getLocalVar("mobsDead") >= mob:getLocalVar("adds") + 1 and
            mob:getLocalVar("wave") < 4
        then
            mob:setLocalVar("wave", mob:getLocalVar("wave") + 1)
            local bfNum = mob:getBattlefield():getArea()
            if mob:getLocalVar("controlBombID") == controlBombs[bfNum][1] then
                SpawnMob(controlBombs[bfNum][2])
            else
                SpawnMob(controlBombs[bfNum][1])
            end
        end
    end
end

return entity
