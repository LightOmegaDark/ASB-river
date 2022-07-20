-----------------------------------
-- Area: Davoi
--  Mob: Bilopdop
-- Involved in Quest: The First Meeting
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/keyitems")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 300)
end

entity.onMobDeath = function(mob, player, isKiller)
    local theFirstMeeting = player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.THE_FIRST_MEETING)
    local martialArtsScroll = player:hasKeyItem(xi.ki.SAN_DORIAN_MARTIAL_ARTS_SCROLL)

    if (theFirstMeeting == QUEST_ACCEPTED and martialArtsScroll == false) then
        player:incrementCharVar("theFirstMeetingKilledNM", 1)
    end
end

return entity
