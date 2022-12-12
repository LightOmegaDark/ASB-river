-----------------------------------
-- Baleful Gaze
-- Description: Petrifies opponents with a gaze attack.
-- Type: Gaze
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Single gaze
-- Notes: Nightmare Cockatrice extends this to a fan-shaped AOE.
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
    skill:setMsg(xi.mobskills.mobGazeMove(mob, target, xi.effect.PETRIFICATION, 1, 0, math.random(60, 120)))

    return xi.effect.PETRIFICATION
end

return mobskillObject
