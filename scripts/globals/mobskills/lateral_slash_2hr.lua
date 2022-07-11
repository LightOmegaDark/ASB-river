-----------------------------------
-- Lateral Slash
-- Dummy ability used for 2hr animation.
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/settings")
require("scripts/globals/msg")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    if mob:getPool() == 1507 then -- Guesh Urvan
        local power = 50
        local duration = 60
        local typeEffect = tpz.effect.COUNTERSTANCE
    
        skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration))
    
        return typeEffect
    else
        skill:setMsg(xi.msg.basic.NONE)
        return 0
    end
end

return mobskill_object
