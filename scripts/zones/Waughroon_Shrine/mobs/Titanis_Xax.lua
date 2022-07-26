-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Titanis Xax
-- KSNM: Prehistoric Pigeons
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------
local entity = {}

local function powerUp(mob)
    mob:addMod(xi.mod.DELAY, -250)
    mob:addMod(xi.mod.SLEEPRES, 50)
    mob:addMod(xi.mod.BINDRES, 50)
    mob:addMod(xi.mod.LULLABYRES, 50)
    mob:addMod(xi.mod.ATT, 50)
    mob:addMod(xi.mod.DEF, 50)
    mob:addMod(xi.mod.MDEF, 25)
    mob:addMod(xi.mod.MEVA, 25)
    mob:addMod(xi.mod.EVA, 25)
    mob:addMod(xi.mod.ACC, 25)
end

entity.onMobSpawn = function(mob)
    xi.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = xi.jsa.SOUL_VOICE, cooldown = 200, hpp = 95},
        },
    })
    mob:addListener("TAKE_DAMAGE", "TITANIS_TAKE_DAMAGE", function(mobArg, amount, attacker, attackType, damageType)
        if amount < mobArg:getHP() then
            local id = mobArg:getID()

            if GetMobByID(id + 1):isAlive() then
                powerUp(GetMobByID(id + 1))
            end

            for i = 1, 2 do
                if GetMobByID(id - i):isAlive() then
                    powerUp(GetMobByID(id - i))
                end
            end
        end
    end)
end

entity.onMobDeath = function(mob, player, isKiller)
end

return entity
