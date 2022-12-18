-----------------------------------
-- Area: Bastok Mines
--  NPC: Gumbah
-- !pos 52 0 -36 234
-----------------------------------
require("scripts/globals/settings")
local ID = require("scripts/zones/Bastok_Mines/IDs")
require("scripts/globals/events/starlight_celebrations")
-----------------------------------

local entity = {}

entity.onTrade = function(player, npc, trade)
    if xi.events.starlightCelebration.isStarlightEnabled() ~= 0 then
        if xi.events.starlightCelebration.onStarlightSmilebringersTrade(player, trade, npc) then
            return
        end
    end
end

entity.onTrigger = function(player, npc)
    local bladeDarkness = player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.BLADE_OF_DARKNESS)

    --DARK KNIGHT QUEST
    if
        player:getMainLvl() >= xi.settings.main.ADVANCED_JOB_LEVEL and
        bladeDarkness == QUEST_AVAILABLE
    then
        player:startEvent(99)

    elseif
        bladeDarkness == QUEST_COMPLETED and
        player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.BLADE_OF_DEATH) == QUEST_AVAILABLE
    then
        player:startEvent(130)
    end
end

entity.onEventFinish = function(player, csid, option)
end

return entity
