-----------------------------------
-- Poison Sting
-- Induces poison
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
    local typeEffect = xi.effect.POISON
    local subEffect  = xi.effect.BIND

    skill:setMsg(xi.mobskills.mobStatusEffectMove(mob, target, typeEffect, 5, 3, 90))
    skill:setMsg(xi.mobskills.mobStatusEffectMove(mob, target, subEffect, 1, 0, 30))

    return typeEffect, subEffect
end

return mobskillObject
