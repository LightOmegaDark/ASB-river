-----------------------------------
-- Starlight Celebrations
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/npc_util")
------------------------------------

function isStarlightEnabled()
    local option = 0
    local month = tonumber(os.date("%m"))
    local day = tonumber(os.date("%d"))
    if ((month == 12 and day >= 16) or xi.settings.main.STARLIGHT_YEAR_ROUND) then -- According to wiki Startlight Festival is December 16 - December 31.
        if (xi.settings.main.STARLIGHT_2007 == 1) then
            option = 1
        end
    end

    return option
end

----------------------------------------------------------------
-- Apply Zone Decorations, Vendors, and Additional Event NPCs --
----------------------------------------------------------------
function applyStarlightDecorations(zoneid)
    if isStarlightEnabled() ~= 0 then
        local decoration = zones[zoneid].npc.STARLIGHT_DECORATIONS
        if decoration then
            for id, decoration in pairs(decoration) do
                local npc = GetNPCByID(id)
                if npc then
                    npc:setStatus(xi.status.NORMAL)
                    local npcstatus = npc:getStatus()
                end
            end
        end
    end
end
