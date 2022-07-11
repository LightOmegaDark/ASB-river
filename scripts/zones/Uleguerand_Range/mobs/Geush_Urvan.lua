-----------------------------------
-- Area: Uleguerand Range
--   NM: Father Frost
-----------------------------------
local ID = require("scripts/zones/Uleguerand_Range/IDs")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:SetMobSkillAttack(1460) -- replace melee attack with special auto attack
    mob:setMod(xi.mod.REGAIN, 100)
    mob:setMod(xi.mod.MOVE, 12)
end

entity.onMobSpawn = function(mob)
    mob:setLocalVar("counterTime", os.time() + 120)
end

entity.onMobFight = function(mob, target)
    local counterTime = mob:getLocalVar("counterTime")
    if os.time() > counterTime then
        mob:useMobAbility(603) -- Counterstance with 2hr dust cloud
        mob:setLocalVar("counterTime", os.time() + math.random(120, 240)) -- 2hrs every 2 to 4 min
    end
end

entity.onMobDeath = function(mob, player, isKiller)
end

entity.onMobDespawn = function(mob)
    if os.time() < mob:getLocalVar("timeToGrow") then
        DisallowRespawn(ID.mob.FATHER_FROST, true)
        DisallowRespawn(ID.mob.MAIDEN_PH, false)
        GetMobByID(ID.mob.MAIDEN_PH):setRespawnTime(GetMobRespawnTime(ID.mob.MAIDEN_PH))
    end
end

return entity
