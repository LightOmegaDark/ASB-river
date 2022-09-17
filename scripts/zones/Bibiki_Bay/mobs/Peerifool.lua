-----------------------------------
-- Area: Bibiki Bay
--  mob: Peerifool
--  Quest: One Good Deed?
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.SLEEP, {chance = 100})
end

entity.onMobDeath = function(mob, player, isKiller)
    local party = player:getParty()
    if #party > 1 then
        for _, v in ipairs(party) do
            if player:getZone() == v:getZone() and v:getQuestStatus(2, 92) == QUEST_ACCEPTED then
                v:setCharVar("Quest[2][92]Prog", 1)
            end
        end
    else
        player:setCharVar("Quest[2][92]Prog", 1)
    end
end

return entity
