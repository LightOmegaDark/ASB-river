-----------------------------------
-- Spell: Healing Breeze
-- Restores HP for party members within area of effect
-- Spell cost: 55 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 4
-- Stat Bonus: CHR+2, HP+10
-- Level: 16
-- Casting Time: 4.5 seconds
-- Recast Time: 15 seconds
-----------------------------------
-- Combos: Auto Regen
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.minCure = 60
    params.divisor0 = 0.6666
    params.constant0 = -45
    params.powerThreshold1 = 219
    params.divisor1 = 2
    params.constant1 = 65
    params.powerThreshold2 = 459
    params.divisor2 = 6.5
    params.constant2 = 144.6666

    if (power > 459) then
        divisor = 6.5
        constant = 144.6666
    elseif (power > 219) then
        divisor =  2
        constant = 65
    end

    local final = getCureFinal(caster, spell, getBaseCureOld(power, divisor, constant), minCure, true)
    local diff = (target:getMaxHP() - target:getHP())

    final = final + (final * (target:getMod(xi.mod.CURE_POTENCY_RCVD)/100))

    if (target:getAllegiance() == caster:getAllegiance() and (target:getObjType() == xi.objType.PC or target:getObjType() == xi.objType.MOB)) then
        --Applying server mods
        final = final * xi.settings.main.CURE_POWER
    end

    if (final > diff) then
        final = diff
    end

    target:addHP(final)
    target:wakeUp()
    caster:updateEnmityFromCure(target, final)
    spell:setMsg(xi.msg.basic.MAGIC_RECOVERS_HP)

    return final
end

return spellObject
