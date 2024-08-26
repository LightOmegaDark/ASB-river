-----------------------------------
-- Area: Area
--  Mob: mobName
-----------------------------------
local m = Module:new("area_mobName")

m:addOverride("xi.zones.area.mobs.mobName.onMobInitialize", function(mob)
    super(mob) -- This gets used when you need the original contents of the function to be called. If you are overriding the entire function and do not need to run the original contents then you do not need this
    -- New Code
end)

m:addOverride("xi.zones.area.mobs.mobName.onMobFight", function(mob, target)
    super(mob) -- This gets used when you need the original contents of the function to be called. If you are overriding the entire function and do not need to run the original contents then you do not need this
    -- New Code
end)

m:addOverride("xi.zones.area.mobs.mobName.onMobDespawn", function(mob, player, optParams)
    super(mob) -- This gets used when you need the original contents of the function to be called. If you are overriding the entire function and do not need to run the original contents then you do not need this
    -- New Code
end)

m:addOverride("xi.zones.area.mobs.mobName.onMobDeath", function(mob, player, optParams)
    super(mob) -- This gets used when you need the original contents of the function to be called. If you are overriding the entire function and do not need to run the original contents then you do not need this
    -- New Code
end)

return m
