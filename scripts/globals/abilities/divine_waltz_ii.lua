-----------------------------------
-- Ability: Divine Waltz II
-- Restores the HP of all party members within a small radius.
-- Obtained: Dancer Level 78
-- TP Required: 80%
-- Recast Time: 00:20
-----------------------------------
require('scripts/globals/job_utils/dancer')
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return xi.job_utils.dancer.checkWaltzAbility(player, target, ability)
end

ability_object.onUseAbility = function(player, target, ability)
    -- Only remove TP if the player doesn't have Trance, and only deduct once instead of for each target.
    if (player:getID() == target:getID() and player:hasStatusEffect(xi.effect.TRANCE) == false) then
        player:delTP(800)
    end

    -- Grabbing variables.
    local vit = target:getStat(xi.mod.VIT)
    local chr = player:getStat(xi.mod.CHR)
    local mjob = player:getMainJob() --19 for DNC main.
    local sjob = player:getSubJob()
    local cure = 0

    -- Performing sj mj check.
    if mjob == xi.job.DNC then
        cure = (vit+chr)*0.75+270
    end

    if sjob == xi.job.DNC then
        cure = (vit+chr)*0.175+270
    end

    -- Apply waltz modifiers
    cure = math.floor(cure * (1.0 + (player:getMod(xi.mod.WALTZ_POTENTCY)/100)))

    -- Cap the final amount to max HP.
    if ((target:getMaxHP() - target:getHP()) < cure) then
        cure = (target:getMaxHP() - target:getHP())
    end

    -- Applying server mods
    cure = cure * xi.settings.CURE_POWER

    target:restoreHP(cure)
    target:wakeUp()
    player:updateEnmityFromCure(target, cure)

    return cure
end

return abilityObject
