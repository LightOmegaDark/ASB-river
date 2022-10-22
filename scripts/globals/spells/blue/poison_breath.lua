-----------------------------------
-- Spell: Poison Breath
-- Deals water damage to enemies within a fan-shaped area originating from the caster. Additional effect: Poison
-- Spell cost: 22 MP
-- Monster Type: Undead
-- Spell Type: Magical (Water)
-- Blue Magic Points: 1
-- Stat Bonus: MND+1
-- Level: 22
-- Casting Time: 3 seconds
-- Recast Time: 19.5 seconds
-- Magic Bursts on: Reverberation, Distortion, and Darkness
-- Combos: Clear Mind
-----------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.UNDEAD
    params.attackType = xi.attackType.BREATH
    params.damageType = xi.damageType.WATER
    params.diff = 0 -- no stat increases magic accuracy
    params.skillType = xi.skill.BLUE_MAGIC
    params.bonus = 1.0
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    params.multiplier = multi
    params.tMultiplier = 1.5
    params.duppercap = 69
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.3
    params.chr_wsc = 0.0
    local resist = xi.magic.applyResistance(caster, target, spell, params)
    local casterHP = caster:getHP()
    local casterLvl = caster:getMainLvl()
    local damage = (casterHP / 10) + (casterLvl / 1.25)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    local results = xi.spells.blue.useBreathSpell(caster, target, spell, params, true)
    local damage = results[1]
    local resist = results[2]

    if resist >= 0.5 then
        target:addStatusEffect(xi.effect.POISON, 4, 0, 60 * resist)
    end

    return damage
end

return spellObject
