-----------------------------------
-- Area: Carpenters' Landing
--   NM: Cryptonberry Assassin
-- !pos 120.615 -5.457 -390.133 2
-----------------------------------
local ID = require("scripts/zones/Carpenters_Landing/IDs")
mixins = { require("scripts/mixins/job_special") }
-----------------------------------
local entity = {}

local cryptonberrySpecials =
{
    [xi.job.SMN] = xi.jsa.ASTRAL_FLOW,
    [xi.job.BLM] = xi.jsa.MANAFONT,
    [xi.job.THF] = xi.jsa.PERFECT_DODGE,
}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 180) -- 3 minutes
end

entity.onMobSpawn = function(mob)
    xi.mix.jobSpecial.config(mob, {
        specials =
        {
            {
                id = cryptonberrySpecials[mob:getMainJob()],
                begCode = function(mobArg)
                    mobArg:messageText(mobArg, ID.text.CRYPTONBERRY_ASSASSIN_2HR)
                end,
            },
        },
    })
end

entity.onMobEngaged = function(mob, target)
end

entity.onMobRoam = function(mob)
end

entity.onMobDeath = function(mob, player, isKiller)
    if player:getCurrentMission(xi.mission.log_id.COP) == xi.mission.id.cop.CALM_BEFORE_THE_STORM and player:getCharVar("Cryptonberry_Executor_KILL") < 2 then
        local offset = mob:getID() - ID.mob.CRYPTONBERRY_EXECUTOR
        player:setCharVar(string.format("Cryptonberry_Assassins-%i_KILL", offset), 1)
    end
end

return entity
