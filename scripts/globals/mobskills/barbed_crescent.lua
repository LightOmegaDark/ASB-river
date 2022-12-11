-----------------------------------
-- Barbed Crescent
-- Slashing damage varies with TP. Additional effect: Accuracy Down.
-- Area of Effect is centered around caster.
-- The Additional Effect: Accuracy Down may not always process.
-- Duration: Two minutes
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
    local numhits = 1
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, 1, 1, xi.mobskills.physicalTpBonus.DMG_VARIES, 1.5, 2, 2.5)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded)

    local typeEffect = xi.effect.ACCURACY_DOWN
    local typeEffectTwo = xi.effect.BLINDNESS
    xi.mobskills.mobStatusEffectMove(mob, target, typeEffectTwo, 15, 3, 120)
    xi.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 100, 0, 120)

    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)
    return dmg
end

return mobskillObject
