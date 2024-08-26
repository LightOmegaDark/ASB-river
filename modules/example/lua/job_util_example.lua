-----------------------------------
-- Example Job Util Lua
-- Use Monk as an example
-----------------------------------
local m = Module:new("job_util_monk")

-- Override the function you want to change
m:addOverride("xi.globals.abilities.focus.onUseAbility", function(player, target, ability)
    local power = 20 + player:getMod(xi.mod.FOCUS_EFFECT)

    player:addStatusEffect(xi.effect.FOCUS, power, 0, 180) -- Changes duration from 120 to 180
end)

return m
