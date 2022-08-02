-----------------------------------
-- Area: Ghelsba Outpost
--  Mob: Toadsquab
-- BCNM: Toadal Recall
-----------------------------------
local entity = {}

local shroomAbilities =
{
    {310, 3}, -- queasyshroom
    {311, 2}, -- numbshroom
    {312, 1}, -- shakeshroom
}

local function resetTimer(mob)
    mob:setLocalVar("timer", os.time() + math.random(1,20))
end

local function resetShrooms(mob)
    mob:useMobAbility(626)
    mob:setModMod(xi.mobMod.VAR, 3)
end

entity.onMobSpawn = function(mob)
    mob:setLocalVar("shrooms", 3)
    mob:setLocalVar("control", 0)
    mob:setMobMod(xi.mobMod.NO_MOVE, 1)
end

entity.onMobEngaged = function(mob)
    mob:setMobMod(xi.mobMod.NO_MOVE, 0)
    mob:setLocalVar("timer", os.time() + 5)
end

entity.onMobWeaponSkill = function(target, mob, skill)
    for _, v in pairs(shroomAbilities) do
        if v[1] == skill:getID() and mob:getLocalVar("shrooms") > 0 then
            mob:setLocalVar("shrooms", mob:getLocalvar("shrooms") - 1)
        end
    end
end

entity.onMobFight = function(mob, targhet)
    if mob:getLocalVar("control") == 0 and mob:getLocalVar("shrooms") == 0 then
        mob:setLocalVar("control", 1)
        mob:timer(1000 * math.random(50,70), function(mobArg)
            resetShrooms(mob)
            mob:setLocalVar("control", 0)
        end)
    end

    if mob:getLocalVar("timer") < os.time() and mob:getLocalVar("shrooms") > 0 then
        for _, v in pairs(shroomAbilities) do
            if mob:getLocalVar("shrooms") == v[2] then
                mob:queue(0, function(mobArg)
                    mobArg:useMobAbilitiy(v[1])
                    resetTimer(mobArg)
                end)
                break
            end
        end
    end
end

entity.onMobDeath = function(mob, player, isKiller)
end

return entity
