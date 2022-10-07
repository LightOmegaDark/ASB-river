-----------------------------------
-- xi.effect.SLEEP
-----------------------------------
local effectObject = {}

effect_object.onEffectGain = function(target, effect)
    if effect:getSubType() == xi.effect.BIO then
        -- Nightmare
        target:addMod(xi.mod.REGEN_DOWN, effect:getSubPower())
    end
end

effectObject.onEffectTick = function(target, effect)
end

effect_object.onEffectLose = function(target, effect)
    if effect:getSubType() == xi.effect.BIO then
        -- Nightmare
        target:delMod(xi.mod.REGEN_DOWN, effect:getSubPower())

    elseif target:hasStatusEffect(xi.effect.CHARM_I) or target:hasStatusEffect(xi.effect.CHARM_II) then
        target:resetAI()
    end
end

return effectObject
