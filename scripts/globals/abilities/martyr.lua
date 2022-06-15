-----------------------------------
-- Ability: Martyr
-- Sacrifices HP to heal a party member double the amount.
-- Obtained: White Mage Level 75
-- Recast Time: 0:10:00
-- Duration: Instant
-- Target: Party member, cannot target self.
-----------------------------------
require("scripts/globals/job_utils/white_mage")
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return xi.job_utils.white_mage.checkMartyr(player, target, ability)
end

ability_object.onUseAbility = function(player, target, ability)
    -- Plus 5 percent hp recovers per extra martyr merit
    local meritBonus = player:getMerit(xi.merit.MARTYR) - 5

    local hpPercent = (200 + meritBonus) / 100

    local damageHP = math.floor(player:getHP() * 0.25)

    --We need to capture this here because the base damage is the basis for the heal
    local healHP = damageHP * hpPercent
    healHP = utils.clamp(healHP, 0, target:getMaxHP() - target:getHP())

    -- If stoneskin is present, it should absorb damage
    damageHP = utils.stoneskin(player, damageHP)
    player:delHP(damageHP)
    target:addHP(healHP)

    return healHP
end

return abilityObject
