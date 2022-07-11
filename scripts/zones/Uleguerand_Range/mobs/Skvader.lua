-----------------------------------
-- Area: Uleguerand Range
--   NM: Skvader
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(xi.mod.DOUBLE_ATTACK, 20)
    automaton:addListener("MAGIC_STATE_EXIT", "SKVADER_MAGIC_EXIT", function(pet, spell)
        if spell:getID() == 40 then
            mob:resetEnmity(target)
        end
    end)
end

entity.onMobDeath = function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 321)
    mob:removeListener("SKVADER_MAGIC_EXIT")
end

return entity
