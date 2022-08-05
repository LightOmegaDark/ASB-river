-----------------------------------------
-- ID: 17622
-- Item: Buccaneer's Knife
-- Additional Effect: Water damage when facing brigandish blade.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/weaponskills")
-----------------------------------
local item_object = {}

item_object.onAdditionalEffect = function(player, target, damage)
    if target:getPool() == 531 and player:getEquipID(xi.slot.MAIN) == xi.items.BUCCANEERS_KNIFE then
        local chance = 90

        if math.random(100) <= chance then
            target:setMod(xi.mod.DMG, 0)
            target:setLocalVar("killable", 1)
            local finalDMG = math.random(40, 60)
            if finalDMG > 0 then
                finalDMG = target:magicDmgTaken(finalDMG)
                finalDMG = utils.clamp(finalDMG, 0, 99999)
                target:takeDamage(finalDMG, player, xi.attackType.MAGICAL, xi.damageType.WATER)
                if target:hasStatusEffect(xi.effect.PHYSICAL_SHIELD) then
                    target:setUnkillable(false)
                end
                return xi.subEffect.WATER_DAMAGE, xi.msg.basic.ADD_EFFECT_DMG, finalDMG
            end
        end
    end

    return 0, 0, 0
end

return item_object