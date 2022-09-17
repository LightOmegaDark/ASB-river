-----------------------------------
-- Area: Oldton Movalpolos
--  Mob: Bugallug
-- Note: NM for quest: A Question of Faith
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob)
    -- Immediately uses Bionic Boost and Heavy Whisk
    mob:useMobAbility(359)
    mob:queue(2000, function(mobArg)
        mobArg:useMobAbility(358)
    end)
end

entity.onMobDeath = function(mob, player, isKiller)
    local party = player:getParty()
    if #party > 1 then
        for _, v in ipairs(party) do
            if player:getZone() == v:getZone() and v:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.A_QUESTION_OF_FAITH) == QUEST_ACCEPTED then
                v:setCharVar("Quest[1][77]Prog", 1)
            end
        end
    else
        player:setCharVar("Quest[1][77]Prog", 1)
    end
end

return entity
