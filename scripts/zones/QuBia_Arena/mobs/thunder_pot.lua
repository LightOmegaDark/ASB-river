-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Thunder Pot
-- KSNM: E-vase-ive Action
-----------------------------------
require("scripts/globals/status")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(xi.mod.SILENCERES, 95)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(xi.mobMod.MAGIC_COOL, 30)

    if VanadielDayOfTheWeek() == xi.day.LIGHTNINGDAY then
        mob:addMod(xi.mod.MATT, 400)
        mob:setMod(xi.mod.REGEN, 50)
    end
end

entity.onMobEngaged = function(mob)
    local pot = mob:getID()
    for i = 1, 5 do
        DespawnMob(pot-i)
    end
    DespawnMob(pot+1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.STUN)
end

entity.onMobDeath = function(mob, player, isKiller)
end

return entity
