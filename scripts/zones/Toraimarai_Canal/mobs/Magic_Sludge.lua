-----------------------------------
-- Area: Toraimarai Canal
--   NM: Magic Sludge
-- Involved in Quest: The Root of the Problem
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 300)
    mob:addMod(xi.mod.UDMGPHYS, -75)
    mob:addMod(xi.mod.UDMGRANGE, -75)
    mob:addMod(xi.mod.UDMGMAGIC, -75)
	mob:addMod(xi.mod.UDMGBREATH, -75)
end

entity.onMobDeath = function(mob, player, isKiller)
    player:setCharVar("rootProblem", 3)
end

return entity
