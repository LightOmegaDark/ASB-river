-----------------------------------
-- Ability: Curing Waltz III
-- Heals HP to target player.
-- Obtained: Dancer Level 45
-- TP Required: 50%
-- Recast Time: 00:10
-----------------------------------
require('scripts/globals/job_utils/dancer')
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return xi.job_utils.dancer.checkWaltzAbility(player, target, ability)
end

ability_object.onUseAbility = function(player, target, ability)
    -- Only remove TP if the player doesn't have Trance.
    if not player:hasStatusEffect(xi.effect.TRANCE) then
        player:delTP(500)
    end

    --Grabbing variables.
    local vit = target:getStat(xi.mod.VIT)
    local chr = player:getStat(xi.mod.CHR)
    local mjob = player:getMainJob() --19 for DNC main.
    local cure = 0



    --Performing mj check.
    if mjob == xi.job.DNC then
        cure = (vit+chr)*0.75+270
    else
        cure = (vit+chr)*0.375+270
    end

    -- apply waltz modifiers
    cure = math.floor(cure * (1.0 + (player:getMod(xi.mod.WALTZ_POTENTCY)/100)))

    --Reducing TP.

    --Applying server mods
    cure = cure * xi.settings.CURE_POWER

    --Cap the final amount to max HP.
    if ((target:getMaxHP() - target:getHP()) < cure) then
        cure = (target:getMaxHP() - target:getHP())
    end

    --Do it
    target:restoreHP(cure)
    target:wakeUp()
    player:updateEnmityFromCure(target, cure)

    return cure

end

return abilityObject
