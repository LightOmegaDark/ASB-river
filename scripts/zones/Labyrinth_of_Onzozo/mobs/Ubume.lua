-----------------------------------
-- Area: Labyrinth of Onzozo
--   NM: Ubume
-- Involved in Quest: Yomi Okuri
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 300)
    mob:setMobMod(xi.mobMod.DOUBLE_ATTACK, 10)
end

entity.onMobDeath = function(mob, player, isKiller)
end

return entity
