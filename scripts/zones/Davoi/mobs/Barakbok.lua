-----------------------------------
-- Area: Davoi
--  Mob: Barakbok
-- Involved in Quest: The Doorman
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/quests")
require("scripts/globals/settings")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 300)
end

entity.onMobDeath = function(mob, player, isKiller)
    if (player:getCharVar("theDoormanMyMob") == 1) then
        player:incrementCharVar("theDoormanKilledNM", 1)
    end
end

return entity
