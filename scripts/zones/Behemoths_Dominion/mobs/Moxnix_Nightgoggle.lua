-----------------------------------
-- Area: Behemoth's Dominion
--   NM: Moxnix Nightgoggle
-- Involved in Quest: The Talekeeper's Gift
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 300)
end

entity.onMobSpawn = function(mob)
    mob:setMod(xi.mod.STORETP, 500)
end

entity.onMobFight = function(mob, target)
    if mob:getHPP() <= 25 then 
        mob:setMod(xi.mod.STORETP, 1000)
    end
end

entity.onMobDeath = function(mob, player, isKiller)
    if player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.THE_TALEKEEPER_S_GIFT) == QUEST_ACCEPTED then
        player:incrementCharVar("theTalekeepersGiftKilledNM", 1)
    end
end

return entity
