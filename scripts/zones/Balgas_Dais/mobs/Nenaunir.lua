-----------------------------------
-- Area: Balga's Dais
--  Mob: Nenaunir
-- BCNM: Harem Scarem
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setMod(xi.mod.SLEEPRES, 100)
    mob:setMod(xi.mod.LULLABYRES, 100)
    mob:setMod(xi.mod.SILENCERES, 100)
end

entity.onMobDeath = function(mob, player, isKiller)
end

return entity
