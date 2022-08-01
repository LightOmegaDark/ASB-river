-----------------------------------
-- xi.effect.FOOTWORK
-----------------------------------
require("scripts/globals/jobpoints")
require("scripts/globals/status")
-----------------------------------
local effectObject = {}

effect_object.onEffectGain = function(target, effect)
    target:addMod(xi.mod.ATTP, 10)
end

effectObject.onEffectTick = function(target, effect)
end

effect_object.onEffectLose = function(target, effect)
    target:delMod(xi.mod.ATTP, 10)
end

return effectObject
