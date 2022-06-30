-----------------------------------
-- Flame Breath
-----------------------------------
require("scripts/settings/main")
require("scripts/globals/status")
require("scripts/globals/mobskills")
require("scripts/globals/ability")
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(pet, target, skill, action)
    return xi.job_utils.dragoon.useDamageBreath(pet, target, skill, action, xi.damageType.FIRE)
end

return abilityObject
