require('modules/module_utils')
local m = Module:new('Leypoint')
-- Leypoint Wajaom Woodlands
m:addOverride('xi.zones.Wajaom_Woodlands.npcs.Leypoint.onTrade', function(player, npc, trade) -- removes trade functions for COR_AF2_Navigating_the_Unfriendly_Seas
end)
m:addOverride('xi.zones.Wajaom_Woodlands.npcs.Leypoint.onTrigger', function(player, npc, trade) -- removes trade functions for COR_AF2_Navigating_the_Unfriendly_Seas
end)

return m
