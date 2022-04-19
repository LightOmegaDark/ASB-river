-----------------------------------
-- Area: Jugner Forest (S)
--  NPC: ???
-- Type: Quest NPC
-- !pos 68 -0.5 324 82
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 201 then
        player:setCharVar("ClawsOfGriffonProg", 2)
    elseif csid == 202 then
        SpawnMob(ID.mob.FINGERFILCHER_DRADZAD):updateClaim(player)
    elseif csid == 203 then
        npcUtil.completeQuest(player, xi.quest.log_id.CRYSTAL_WAR, xi.quest.id.crystalWar.CLAWS_OF_THE_GRIFFON, {item=813, var={"ClawsOfGriffonProg", "FingerfilcherKilled"}})
    end
end

return entity
