-----------------------------------
--  ID: 15698
--  Sneaking Boots
-----------------------------------
require("scripts/settings/main")
require("scripts/globals/status")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    return 0
end

itemObject.onItemUse = function(target)
    target:delStatusEffect(xi.effect.SNEAK)
    target:addStatusEffect(xi.effect.SNEAK, 1, 0, math.floor(180 * xi.settings.SNEAK_INVIS_DURATION_MULTIPLIER))
end

return itemObject
