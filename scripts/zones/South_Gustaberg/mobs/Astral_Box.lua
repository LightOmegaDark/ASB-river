-----------------------------------
-- Area: South Gustaberg
--  Mob: Astral Box
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
local entity = {}

local sizeChange = function(mob, target)
    mob:setUnkillable(true)
    mob:setUntargetable(true)
    mob:setAnimation(2)
    mob:timer(1400, function(mobArg)
        mobArg:stun(2000)
        mobArg:setAnimation(0)
        mobArg:setHPP(mobArg:getMaxHP() - 40)
        mobArg:setHP(mobArg:getMaxHP())
        mobArg:setModelId(2331)
        mobArg:setUntargetable(false)
        mobArg:setUnkillable(false)
    end )
    mob:setLocalVar("small",1)
end

entity.onMobSpawn = function(mob)
    mob:setMobMod(xi.mobMod.NO_MOVE, 1)
end

entity.onMobEngage = function(mob, target)
end

entity.onMobFight = function(mob, target)
    if mob:getHP() < 30 then
        if mob:getHP() < 10 then
            local smallCheck = mob:getLocalVar("small")
            if smallCheck == 0 then
                local rnd = math.random(1,10)
                print(rnd)
                if rnd == 10 then
                    sizeChange(mob, target)
                    target:disengage()
                end
            end
        end
    end
end

entity.onMobDeath = function(mob, player, optParams)
    if mob:getLocalVar("small") ~= 0 then
        print("token give/check")
    end
    mob:resetLocalVars()
end

entity.onMobDespawn = function(mob)
    mob:setModelId(2330)
end

return entity
