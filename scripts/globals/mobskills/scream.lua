-----------------------------------
-- Scream
-- 15' Reduces MND of players in area of effect.
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local typeEffect = xi.effect.MND_DOWN
    local power = target:getStat(xi.mod.MND) * 0.25
    skill:setMsg(xi.mobskills.mobStatusEffectMove(mob, target, typeEffect, power, 3, 120))

    return typeEffect
end

return mobskillObject
