require('modules/module_utils')

local m = Module:new('qm6')
-- QM6 Arrapago Reef
m:addOverride('xi.zones.Arrapago_Reef.npcs.qm6.onTrade', function(player, npc, trade) -- removes trade functions for COR_AF2_Navigating_the_Unfriendly_Seas
end)
m:addOverride('xi.zones.Arrapago_Reef.npcs.qm6.onTrigger', function(player, npc, trade) -- removes trigger functions for COR_AF2_Navigating_the_Unfriendly_Seas
end)

return m
