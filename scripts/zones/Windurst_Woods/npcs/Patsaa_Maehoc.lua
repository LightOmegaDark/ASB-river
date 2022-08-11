-----------------------------------
-- Area: Windurst Woods
--  NPC: Patsaa Maehoc
-- Working 100%
-----------------------------------
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}

local pathNodes =
{
    0.665, -4.250, 53.641,
    0.665, -4.250, 53.641,
    0.665, -4.250, 53.641,
    0.665, -4.250, 53.641,
    -5.685, -4.250, 53.831,
    -10.590, -4.250, 53.978,
    -12.900, -4.250, 54.047,
    -12.900, -4.250, 54.047,
    -12.900, -4.250, 54.047,
    -12.900, -4.250, 54.047,
    -10.590, -4.250, 53.978,
    -5.685, -4.250, 53.831,
}

entity.onSpawn = function(npc)
    npc:initNpcAi()
    npc:setPos(xi.path.first(pathNodes))
    npc:pathThrough(pathNodes, xi.path.flag.PATROL)
end

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(427)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
