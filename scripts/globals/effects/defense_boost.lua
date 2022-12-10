-----------------------------------
-- xi.effect.DEFENSE_BOOST
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.DEFP, effect:getPower())

    if target:isInDynamis() then
        target:addMod(xi.mod.UDMGPHYS, -9000)
    end

end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.DEFP, effect:getPower())

    if target:isInDynamis() then
        target:delMod(xi.mod.UDMGPHYS, -9000)
    end
end

return effectObject
