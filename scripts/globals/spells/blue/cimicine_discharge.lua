-----------------------------------
-- Spell: Cimicine Discharge
-- Reduces the attack speed of enemies within range
-- Spell cost: 32 MP
-- Monster Type: Vermin
-- Spell Type: Magical (Earth)
-- Blue Magic Points: 3
-- Stat Bonus: DEX+1, AGI+2
-- Level: 78
-- Casting Time: 3 seconds
-- Recast Time: 20 seconds
-----------------------------------
-- Combos: Magic Burst Bonus
-----------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.diff = nil
    params.attribute = xi.mod.INT
    params.skillType = xi.skill.BLUE_MAGIC
    params.bonus = 0
    params.effect = nil
    local resist = xi.magic.applyResistance(caster, target, spell, params)

    return xi.spells.blue.useEnfeeblingSpell(caster, target, spell, params, power, tick, duration, resistThreshold, isGaze, isConal)
end

return spellObject
