-----------------------------------
-- Area: Port Bastok
--  NPC: Klaas
-- Standard Info NPC
-- TODO: Event logic, values
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    -- if xi.settings.main.ENABLE_CHRISTMAS == 1 then
    --     player:startEvent(415)
    -- else
    --     player:startEvent(387)
    -- end
end

entity.onEventUpdate = function(player, csid, option)
    -- 96, 4192, 8288, 12384, 16480, 20576, 24672, 28768, 32864, 36960
    -- print(option)
    -- if csid == 415 and option == 32 then
    --     player:updateEvent(415, player:getGil(), option)
    -- elseif csid == 415 and option == 64 then
    --     player:delGil(10)
    --     player:updateEvent(415, 1, 1, 1)
    -- elseif csid == 415 and option == 96 then
    --     player:updateEvent(415, 1, 8288)
    -- end
end

entity.onEventFinish = function(player, csid, option)
end

return entity

-- csid, startOption, chestOption, option,

-- 1 1st chest
-- 2 2nd chest
-- 3 1st and 2nd chest
-- 4 3rd chest
-- 5 1st and 3rd chest
-- 6 2nd and 3rd chest
-- 7 glitched
-- 8 4th chest
-- 16 5th chest