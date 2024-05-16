require('modules/module_utils')

local m = Module:new('Leleroon')
-- Leleroon NASHMAU
xi.module.addOverride('xi.zones.Nashmau.npcs.Leleroon.onTrade', function(player, npc, trade) -- removes trade functions for COR_AF2_Navigating_the_Unfriendly_Seas
end)

return m
