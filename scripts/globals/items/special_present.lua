-----------------------------------
-- ID: 5269
-- Item: Special Present
-- Starlight Celebration Fame Reward
-----------------------------------
require("scripts/globals/status")
require('scripts/globals/npc_util')
require("scripts/globals/msg")
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target)
end

itemObject.onItemUse = function(target)
    local dreamHat = target:hasItem(15178)
    local dreamHatHQ = target:hasItem(15179)

    if dreamHat and not dreamHatHQ then
        npcUtil.giveItem(target, 15179)
    elseif dreamHatHQ then
        npcUtil.giveItem(target, 5622)
    end

    return 0
end

return itemObject
