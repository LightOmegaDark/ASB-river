-----------------------------------
-- Spell: Venom Shell
-- Poisons enemies within range and gradually reduces their HP
-- Spell cost: 86 MP
-- Monster Type: Aquans
-- Spell Type: Magical (Water)
-- Blue Magic Points: 3
-- Stat Bonus: MND+2
-- Level: 42
-- Casting Time: 3 seconds
-- Recast Time: 45 seconds
-- Magic Bursts on: Reverberation, Distortion, and Darkness
-- Combos: Clear Mind
-----------------------------------
require("scripts/globals/bluemagic")
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
    params.diff = nil
    params.attribute = xi.mod.INT
    params.skillType = xi.skill.BLUE_MAGIC
    params.bonus = 0
    params.effect = typeEffect
    local resist = xi.magic.applyResistanceEffect(caster, target, spell, params)
    local duration = 180 * resist
    local power = 6
    local tick = 0
    local duration = 60
    local resistThreshold = 0.5
    local isGaze = false
    local isConal = false

    return xi.spells.blue.useEnfeeblingSpell(caster, target, spell, params, power, tick, duration, resistThreshold, isGaze, isConal)
end

return spellObject
