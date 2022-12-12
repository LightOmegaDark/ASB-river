-----------------------------------
-- Spider Web
-- Entangles all targets in an area of effect.
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
    local typeEffect = xi.effect.SLOW
    local power = 5000

    skill:setMsg(xi.mobskills.mobStatusEffectMove(mob, target, typeEffect, power, 0, math.random(120, 180)))

    return typeEffect
end

return mobskillObject
