-----------------------------------
-- Area: Balga's Dais
--  Mob: Gola Tlugvi
-- KSNM: Seasons Greetings
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(xi.mobMod.SUPERLINK, 0)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.ABSORB_TP)
end

entity.onMobWeaponSkill = function(target, mob, skill)
    if skill:getID() == 695 then
        GetMobByID(mob:getID()-3):updateEnmity(target)
    end
end

entity.onMobDeath = function(mob, player, isKiller)
end

return entity
