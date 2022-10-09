-----------------------------------
-- xi.effect.WEIGHT
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effectObject = {}

effect_object.onEffectGain = function(target, effect)
    target:setSpeed(target:getSpeed() - effect:getPower())
    target:addMod(xi.mod.EVA, -10)
end

effectObject.onEffectTick = function(target, effect)
end

effect_object.onEffectLose = function(target, effect)
    target:setSpeed(target:getSpeed() + effect:getPower())
    target:delMod(xi.mod.EVA, -10)
end

return effectObject
