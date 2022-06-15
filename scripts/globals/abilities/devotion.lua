-----------------------------------
-- Ability: Devotion
-- Sacrifices HP to grant a party member the same amount in MP.
-- Obtained: White Mage Level 75
-- Recast Time: 0:10:00
-- Duration: Instant
-- Target: Party member, cannot target self.
-----------------------------------
require("scripts/globals/job_utils/white_mage")
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return xi.job_utils.white_mage.checkDevotion(player, target, ability)
end

ability_object.onUseAbility = function(player, target, ability)
    -- Plus 5 percent mp recovers per extra devotion merit
    local meritBonus = player:getMerit(xi.merit.DEVOTION) - 5
    local mpPercent  = (25 + meritBonus) / 100
    local damageHP   = math.floor(player:getHP() * 0.25)

    -- If stoneskin is present, it should absorb damage
    damageHP = utils.stoneskin(player, damageHP)

    local healMP = player:getHP() * mpPercent
    healMP = utils.clamp(healMP, 0, target:getMaxMP() - target:getMP())

    damageHP = utils.stoneskin(player, damageHP)
    player:delHP(damageHP)
    target:addMP(healMP)

    return healMP
end

return abilityObject
