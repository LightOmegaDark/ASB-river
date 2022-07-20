-----------------------------------
-- Area: Castle Oztroja (151)
--   NM: Huu Xalmo the Savage
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/quests")
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 300)
end

entity.onMobSpawn = function(mob)
    mob:setMod(xi.mod.PARALYZERESTRAIT, 75)
    mob:setMod(xi.mod.COUNTER, 30)
end 

entity.onMobDeath = function(mob, player, isKiller)
end

return entity
