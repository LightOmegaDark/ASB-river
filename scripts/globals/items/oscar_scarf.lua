-- ID: 13182
-- Item: Oscar Scarf
-- Item Effect: Enchantment: Slightly Bad Breath (inflicts Bind, Paralyze, and Silence on an enemy)
-- Duration: Instant
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
    local result = 0
    return result
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 300, 4485)
end