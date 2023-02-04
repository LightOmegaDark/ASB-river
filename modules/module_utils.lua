-----------------------------------
-- Module helpers
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/utils")
-----------------------------------

-- Global, for use in C++
function applyOverride(base_table, name, func, fullname, filename)
    local old = base_table[name]

    if old == nil then
        if xi.settings.logging.DEBUG_MODULES then
            print(string.format("Inserting empty function to override for: %s (%s)", fullname, filename))
        end
        old = function() end -- Insert empty function
    end

    local thisenv = getfenv(old)

    local env = { super = old }
    setmetatable(env, { __index = thisenv })

    setfenv(func, env)
    base_table[name] = func
end

-- Override Object
Override = {}
Override.__index = Override

function Override:new(target_func_str, new_func)
    local obj = {}
    setmetatable(obj, self)

    obj.name = target_func_str
    obj.func = new_func

    return obj
end

-- Module Object
Module = {}
Module.__index = Module

function Module:new(name)
    if name == nil or string.len(name) < 5 then
        printf("Invalid module name: %s", name)
    end

    local obj = {}
    setmetatable(obj, self)

    obj.name = name
    obj.overrides = {}
    obj.enabled = false

    return obj
end

function Module:setEnabled(isEnabled)
    self.enabled = isEnabled
end

function Module:addOverride(target_func_str, func)
    local override = Override:new(target_func_str, func)
    table.insert(self.overrides, override)
end

-- Load associated module settings into a provided table
function Module:loadSettings(tbl)
    if not xi.settings[self.name] then
        return
    end

    for k, v in pairs(tbl) do
        if type(v) == "table" then
            for k2, v2 in pairs(v) do
                if xi.settings[self.name][k] and xi.settings[self.name][k][k2] then
                    tbl[k][k2] = xi.settings[self.name][k][k2]
                end
            end
        else
            if xi.settings[self.name][k] then
                tbl[k] = xi.settings[self.name][k]
            end
        end
    end

end
