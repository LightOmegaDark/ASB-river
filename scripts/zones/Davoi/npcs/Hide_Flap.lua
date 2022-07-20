-----------------------------------
-- Area: Davoi
--  NPC: Hide Flap
-- Involved in Quest: The Doorman, The First Meeting
-- !pos 293 3 -213 149 (WAR)(K-9)
-- !pos -124 3 -43 149 (MNK)(F-7)
-----------------------------------
local ID = require("scripts/zones/Davoi/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local offset = npc:getID() - ID.npc.HIDE_FLAP_OFFSET

    -- THE DOORMAN
    if offset == 0 and player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.THE_DOORMAN) == QUEST_ACCEPTED and not player:hasKeyItem(xi.ki.SWORD_GRIP_MATERIAL) then
        if player:getCharVar("theDoormanKilledNM") >= 2 then
            npcUtil.giveKeyItem(player, xi.ki.SWORD_GRIP_MATERIAL)
            player:setCharVar("theDoormanMyMob", 0)
            player:setCharVar("theDoormanKilledNM", 0)
        elseif not GetMobByID(ID.mob.GAVOTVUT):isSpawned() and not GetMobByID(ID.mob.BARAKBOK):isSpawned() then
            player:setCharVar("theDoormanMyMob", 1)
            player:setCharVar("theDoormanKilledNM", 0)
        local positions =
        {
            {323.445, 4.000, -197.995},
            {302.553, 3.652, -208.581},
            {291.634, 3.867, -215.906},
            {269.859, 4.250, -219.676},
            {289.027, 4.115, -248.795},
            {289.035, 4.113, -248.821},
            {266.254, 4.083, -249.498},
            {239.518, 4.000, -245.442},
            {235.876, 3.815, -236.766},
        }
        local newPosition = npcUtil.pickNewPosition(npc:getID(), positions, true)
        npcUtil.queueMove(npc, newPosition)
        
        end

    -- THE FIRST MEETING
    elseif offset == 1 and player:getQuestStatus(xi.quest.log_id.BASTOK, xi.quest.id.bastok.THE_FIRST_MEETING) == QUEST_ACCEPTED and not player:hasKeyItem(xi.ki.SAN_DORIAN_MARTIAL_ARTS_SCROLL) then
        if player:getCharVar("theFirstMeetingKilledNM") >= 2 then
            npcUtil.giveKeyItem(player, xi.ki.SAN_DORIAN_MARTIAL_ARTS_SCROLL)
            player:setCharVar("theFirstMeetingMyMob", 0)
            player:setCharVar("theFirstMeetingKilledNM", 0)
        elseif not GetMobByID(ID.mob.BILOPDOP):isSpawned() and not GetMobByID(ID.mob.DELOKNOK):isSpawned() then
            npcUtil.popFromQM(player, npc, {ID.mob.BILOPDOP, ID.mob.DELOKNOK},{radius=0, claim=true, hide = 1})
            player:setCharVar("theFirstMeetingMyMob", 1)
            player:setCharVar("theFirstMeetingKilledNM", 0)
        local positions =
        {
            {-124.271, 3.859, -43.068},
            {-99.385, 4.250, -30.218},
            {-86.881, 4.080, -45.571},
            {-81.069, 4.000, -33.513},
            {-140.662, 4.250, -8.857},
            {-153.489, 4.179, -7.416},
            {-127.327, 4.250, -20.934},
            {-112.145, 4.250, -34.847},
        }
        local newPosition = npcUtil.pickNewPosition(npc:getID(), positions, true)
        npcUtil.queueMove(npc, newPosition)

        end

    -- DEFAULT DIALOG
    else
        player:messageSpecial(ID.text.YOU_SEE_NOTHING)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
