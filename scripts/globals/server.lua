-----------------------------------
require("scripts/settings/main")
-----------------------------------

xi = xi or {}
xi.server = xi.server or {}

xi.server.onServerStart = function()
    xi.events.handler.checkSeasonalEvents()
end

xi.server.onJSTMidnight = function()
    xi.events.handler.checkSeasonalEvents()
end

xi.server.onTimeServerTick = function()
end

return xi.server
