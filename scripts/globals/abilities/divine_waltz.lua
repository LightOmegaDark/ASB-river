-----------------------------------
-- Ability: Divine Waltz
-- Heals party members within area of effect.
-- Obtained: Dancer Level 25
-- TP Required: 40%
-- Recast Time: 00:13
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return xi.job_utils.dancer.checkWaltzAbility(player, target, ability)
end

ability_object.onUseAbility = function(player, target, ability)
    -- Only remove TP if the player doesn't have Trance, and only deduct once instead of for each target.
    if (player:getID() == target:getID() and player:hasStatusEffect(xi.effect.TRANCE) == false) then
        player:delTP(400)
    end

    -- Grabbing variables.
    local vit = target:getStat(xi.mod.VIT)
    local chr = player:getStat(xi.mod.CHR)
    local mjob = player:getMainJob() --19 for DNC main.
    local sjob = player:getSubJob()
    local cure = 0

    -- Performing sj mj check.
    if mjob == xi.job.DNC then
        cure = (vit+chr)*0.25+60
    end

    if sjob == xi.job.DNC then
        cure = (vit+chr)*0.125+60
    end

    -- Apply waltz modifiers
    cure = math.floor(cure * (1.0 + (player:getMod(xi.mod.WALTZ_POTENTCY)/100)))

    -- Cap the final amount to max HP.
    if ((target:getMaxHP() - target:getHP()) < cure) then
        cure = (target:getMaxHP() - target:getHP())
    end

    -- Applying server mods
    cure = cure * xi.settings.main.CURE_POWER

    target:restoreHP(cure)
    target:wakeUp()
    player:updateEnmityFromCure(target, cure)

    return cure
end

return abilityObject
