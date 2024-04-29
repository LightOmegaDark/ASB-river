-----------------------------------
-- General Lua Example
-- Allows hot-reloading of custom code
-----------------------------------
xi = xi or {}
xi.customName = xi.customName or {}

-- Define your logic in a global function so it can be hot-reloaded
xi.customName.functionName = function(arg1) -- <--- Global Function
    -- Custom Code
end

local m = Module:new('module_name')

-- addOverride functions do NOT get hot-reloaded.
-- Since you are calling the global function when this triggers anything you put inside the global function will hot-reload
-- This allows us to hot-reload our custom code
m:addOverride('xi.globals.items.plate_of_fatty_tuna_sushi.onEffectGain', function(arg1, arg2)
    super(arg1, arg2) -- This gets used when you need the original contents of the function to be called. If you are overriding the entire function and do not need to run the original contents then you do not need this

    -- Go find the global function you want to call
    xi.customName.functionName(arg1)
end)

return m
