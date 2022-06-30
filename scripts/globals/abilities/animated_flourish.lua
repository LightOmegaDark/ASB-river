-----------------------------------
-- Ability: Animated Flourish
-- Provokes the target. Requires at least one, but uses two Finishing Moves.
-- Obtained: Dancer Level 20
-- Finishing Moves Used: 1-2
-- Recast Time: 00:30
-----------------------------------
require("scripts/globals/jobpoints")
require("scripts/settings/main")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return xi.job_utils.dancer.checkAnimatedFlourishAbility(player, target, ability)
end

abilityObject.onUseAbility = function(player, target, ability)
    return xi.job_utils.dancer.useAnimatedFlourishAbility(player, target, ability)
end

return abilityObject
