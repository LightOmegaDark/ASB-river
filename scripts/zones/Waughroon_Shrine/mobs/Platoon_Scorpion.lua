-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Platoon Scorpion
-- BCNM: Operation Desert Swarm
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local entity = {}

local ID = require("scripts/zones/Waughroon_Shrine/IDs")

local mimicDistance  =   15
local selfBindChance = 0.25
local selfStunChance = 0.25

entity.onMobSpawn = function(mob)
    mob:setLocalVar("wildRagePower", 1)
    mob:addListener("WEAPONSKILL_STATE_ENTER", "SCORPION_MIMIC_START", function(mobArg, skillID)
        if mobArg:getLocalVar("mimicControl") ~= 1 then
            local bf = mobArg:getBattlefield():getArea()

            for _, allyID in ipairs(ID.operationDesertSwarm[bf]) do
                local mimic = GetMobByID(allyID)
                local dist = mobArg:checkDistance(mimic)

                if mobArg:getID() ~= allyID and mimic:isAlive() and mimic ~= nil then
                    mimic:setLocalVar("mimicControl", 1)

                    if dist < mimicDistance then
                        if skillID == 354 then
                            mimic:useMobAbility(354, mimic:getTarget())
                        elseif skillID == 355 then
                            mimic:useMobAbility(355, mimic:getTarget())
                        end
                    end
                end
            end
        end
    end)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "SCORPION_MIMIC_STOP", function(mobArg, skillID)
        mobArg:setLocalVar("mimicControl", 0)

        -- Wild Rage
        if skillID == 354 and math.random() <= selfStunChance then
            mobArg:showText(mob,ID.text.SCORPION_IS_STUNNED)
            mobArg:addStatusEffect(xi.effect.STUN,0,0,10)
        -- Earth Pounder
        elseif skillID == 355 and math.random() <= selfBindChance then
            mobArg:showText(mob,ID.text.SCORPION_IS_BOUND)
            mobArg:addStatusEffect(xi.effect.BIND,0,0,10)
        end
    end)
end

entity.onMobDeath = function(mob, player, isKiller)
    if mob:getLocalVar("deathControl") == 0 then
        mob:setLocalVar("deathControl", 1)
        local bf = mob:getBattlefield():getArea()

        for _, allyID in ipairs(ID.operationDesertSwarm[bf]) do
            local scorpion = GetMobByID(allyID)

            if allyID ~= mob:getID() and scorpion:isAlive() then
                scorpion:setLocalVar("wildRagePower", GetMobByID(allyID):getLocalVar("wildRagePower") + 1 )
            end
        end
    end
end

return entity
