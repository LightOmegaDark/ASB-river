-----------------------------------
-- Example Item Lua
-- Use tuna sushi as an example
-----------------------------------
local m = Module:new("item_luas")

m:addOverride("xi.globals.items.plate_of_fatty_tuna_sushi.onEffectGain", function(target, effect)
    -- Apply the logic for what the item does
    target:addMod(xi.mod.HP, 20)
    target:addMod(xi.mod.DEX, 5)
    target:addMod(xi.mod.CHR, 5)
    target:addMod(xi.mod.FOOD_ACCP, 15)
    target:addMod(xi.mod.FOOD_ACC_CAP, 55)
    target:addPetMod(xi.mod.HP, 20)
    target:addPetMod(xi.mod.DEX, 3)
    target:addPetMod(xi.mod.CHR, 5)
    target:addPetMod(xi.mod.FOOD_ACCP, 12)
    target:addPetMod(xi.mod.FOOD_ACC_CAP, 25)
end)

m:addOverride("xi.globals.items.plate_of_fatty_tuna_sushi.onEffectLose", function(target, effect)
    target:delMod(xi.mod.HP, 20)
    target:delMod(xi.mod.DEX, 5)
    target:delMod(xi.mod.CHR, 5)
    target:delMod(xi.mod.FOOD_ACCP, 15)
    target:delMod(xi.mod.FOOD_ACC_CAP, 55)
    target:delPetMod(xi.mod.HP, 20)
    target:delPetMod(xi.mod.DEX, 3)
    target:delPetMod(xi.mod.CHR, 5)
    target:delPetMod(xi.mod.FOOD_ACCP, 12)
    target:delPetMod(xi.mod.FOOD_ACC_CAP, 25)
end)
