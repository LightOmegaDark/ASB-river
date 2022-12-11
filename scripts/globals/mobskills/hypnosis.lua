-----------------------------------
-- Slumber Powder
-- 10' Conal sleep
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
    local typeEffect = xi.effect.SLEEP_I

    skill:setMsg(xi.mobskills.mobGazeMove(mob, target, typeEffect, 1, 0, math.random(45, 60)))

    return typeEffect
end

return mobskillObject
