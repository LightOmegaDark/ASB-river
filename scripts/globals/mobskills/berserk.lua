-----------------------------------
-- Berserk
-- Berserk Ability.
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
    local typeEffect = xi.effect.BERSERK
    local power = (116 / 256) * 100

    if
        mob:getFamily() == 83 or
        mob:getFamily() == 84 or
        mob:getFamily() == 85 or
        mob:getFamily() == 498
    then
        power = 33
    end

    skill:setMsg(xi.mobskills.mobBuffMove(mob, typeEffect, power, 0, 120))
    return typeEffect
end

return mobskillObject
