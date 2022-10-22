-----------------------------------
-- Ability: Desperate Flourish
-- Weighs down a target with a low rate of success. Requires one Finishing Move.
-- Obtained: Dancer Level 30
-- Finishing Moves Used: 1
-- Recast Time: 00:20
-- Duration: ??
-----------------------------------
require("scripts/globals/jobpoints")
require("scripts/globals/weaponskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return xi.job_utils.dancer.checkDesperateFlourishAbility(player, target, ability)
end

abilityObject.onUseAbility = function(player, target, ability, action)

    local isSneakValid = player:hasStatusEffect(xi.effect.SNEAK_ATTACK)
    if (isSneakValid and not player:isBehind(target)) then
        isSneakValid = false
    end

    local hitrate = getHitRate(player, target, true, player:getJobPointLevel(xi.jp.FLOURISH_I_EFFECT))

    if (math.random() <= hitrate or isSneakValid) then

        local spell = GetSpell(216)
        local params = {}
        params.diff = 0
        params.skillType = player:getWeaponSkillType(xi.slot.MAIN)
        params.bonus = 50 - target:getMod(xi.mod.STUNRES)
        local resist = xi.magic.applyResistance(player, target, spell, params)

        if resist > 0.25 then
            target:delStatusEffectSilent(xi.effect.WEIGHT)
            target:addStatusEffect(xi.effect.WEIGHT, 50, 0, 60 * resist)
        else
            ability:setMsg(xi.msg.basic.JA_DAMAGE)
        end
        ability:setMsg(xi.msg.basic.JA_ENFEEB_IS)
        action:setAnimation(target:getID(), getFlourishAnimation(player:getWeaponSkillType(xi.slot.MAIN)))
        action:speceffect(target:getID(), 2)
        return xi.effect.WEIGHT
    else
        ability:setMsg(xi.msg.basic.JA_MISS)
        return 0
    end
end

return abilityObject
