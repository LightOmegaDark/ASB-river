-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Annihilated Anthony
-- BCNM: Celery
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setMod(xi.mod.MEVA, -250)
end

entity.onMobEngaged = function(mob, target)
    local mobId = mob:getID()
    DespawnMob(mobId + 1)
    DespawnMob(mobId + 2)
    DespawnMob(mobId + 3)
end

entity.onMobDeath = function(mob, player, isKiller)
end

return entity
