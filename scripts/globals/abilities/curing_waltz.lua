-----------------------------------
-- Ability: Curing Waltz
-- Heals HP to target player.
-- Obtained: Dancer Level 15
-- TP Required: 20%
-- Recast Time: 00:06
-----------------------------------
require("scripts/settings/main")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return xi.job_utils.dancer.checkWaltzAbility(player, target, ability)
end

ability_object.onUseAbility = function(player, target, ability)
    -- Only remove TP if the player doesn't have Trance.
    if not player:hasStatusEffect(xi.effect.TRANCE) then
        player:delTP(200)
    end

    --Grabbing variables.
    local vit = target:getStat(xi.mod.VIT)
    local chr = player:getStat(xi.mod.CHR)
    local mjob = player:getMainJob() --19 for DNC main.
    local sjob = player:getSubJob()
    local cure = 0



    --Performing sj mj check.
    if mjob == xi.job.DNC then
        cure = (vit+chr)*0.25+60
    end

    if sjob == xi.job.DNC then
        cure = (vit+chr)*0.125+60
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
