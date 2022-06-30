-----------------------------------
-- Area: Windurst Walls (239)
--  NPC: Shantotto
-- !pos 122 -2 112 239
-----------------------------------
local ID = require("scripts/zones/Windurst_Walls/IDs")
require("scripts/globals/keyitems")
require("scripts/settings/main")
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local wildcatWindurst = player:getCharVar("WildcatWindurst")

    if (player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.LURE_OF_THE_WILDCAT) == QUEST_ACCEPTED and not utils.mask.getBit(WildcatWindurst, 6)) then
        player:startEvent(498)
    elseif (player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.CLASS_REUNION) == QUEST_ACCEPTED and
        player:getCharVar("ClassReunionProgress") == 3) then
        player:startEvent(409) -- she mentions that Sunny-Pabonny left for San d'Oria

        -----------------------------------
        -- Curses Foiled Again!
    elseif (foiledAgain == QUEST_AVAILABLE) then
        player:startEvent(171, 0, 0, 0, 0, 0, 0, 928, 880)
    elseif (foiledAgain == QUEST_ACCEPTED) then
        player:startEvent(172, 0, 0, 0, 0, 0, 0, 928, 880)
    elseif (foiledAgain == QUEST_COMPLETED and CFA2 == QUEST_AVAILABLE and CFAtimer == 0) then
        local cDay = VanadielDayOfTheYear()
        local cYear = VanadielYear()
        local dFinished = player:getCharVar("CursesFoiledAgainDay")
        local yFinished = player:getCharVar("CursesFoiledAgainYear")

        if (cDay == dFinished and cYear == yFinished) then
            player:startEvent(174)
        elseif (cDay == dFinished + 1 and cYear == yFinished) then
            player:startEvent(178)
        elseif ((cDay >= dFinished + 2 and cYear == yFinished) or (cYear > yFinished)) then
            player:startEvent(179)
        end

        -- Curses, Foiled...Again!?
    elseif (foiledAgain == QUEST_COMPLETED and CFA2 == QUEST_AVAILABLE and player:getFameLevel(xi.quest.fame_area.WINDURST) >= 2 and
        player:getMainLvl() >= 5 and CFAtimer == 1) then
        player:startEvent(180, 0, 0, 0, 0, 928, 880, 17316, 940) -- Quest Start
    elseif (CFA2 == QUEST_ACCEPTED) then
        player:startEvent(181, 0, 0, 0, 0, 0, 0, 17316, 940) -- Reminder dialog

        -- Curses, Foiled A-Golem!?
    elseif (CFA2 == QUEST_COMPLETED and FoiledAGolem == QUEST_AVAILABLE and player:getFameLevel(xi.quest.fame_area.WINDURST) >= 4 and
        player:getMainLvl() >= 10) then
        player:startEvent(340) -- quest start
    elseif (golemdelivery == 1) then
        player:startEvent(342) -- finish
    elseif (FoiledAGolem == QUEST_ACCEPTED) then
        player:startEvent(341) -- reminder dialog

        -- Trust
        -- TODO: Wiki's aren't clear on the exact conditions for this event, assuming it's the final nation "extreme" trust
    elseif
        player:hasSpell(898) and -- Kupipi
        player:hasSpell(901) and -- Nanaa Mihgo
        player:hasSpell(903) and -- Volker
        player:hasSpell(904) and -- Ajido-Marujido
        player:hasSpell(905) and -- Trion
        not player:hasSpell(896) -- NOT Shantotto
    then
        player:startEvent(498)
    elseif
        player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.CLASS_REUNION) == QUEST_ACCEPTED and
        player:getCharVar("ClassReunionProgress") == 3
    then
        player:startEvent(409) -- she mentions that Sunny-Pabonny left for San d'Oria
    end
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 173) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 17081)
        else
            player:tradeComplete()
            player:setCharVar("CursesFoiledAgainDay", VanadielDayOfTheYear())
            player:setCharVar("CursesFoiledAgainYear", VanadielYear())
            player:addFame(xi.quest.fame_area.WINDURST, 80)
            player:addItem(17081)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 17081)
            player:completeQuest(xi.quest.log_id.WINDURST, xi.quest.id.windurst.CURSES_FOILED_AGAIN_1)
        end
    elseif (csid == 171 and option ~= 1) then
        player:addQuest(xi.quest.log_id.WINDURST, xi.quest.id.windurst.CURSES_FOILED_AGAIN_1)

    elseif (csid == 179) then
        player:setCharVar("CursesFoiledAgainDayFinished", 0)
        player:setCharVar("CursesFoiledAgainYearFinished", 0)
        player:setCharVar("CursesFoiledAgainDay", 0)
        player:setCharVar("CursesFoiledAgainYear", 0)
        player:setCharVar("CursesFoiledAgain", 1) -- Used to acknowledge that the two days have passed, Use this to initiate next quest
        player:needToZone(true)

    elseif (csid == 180 and option == 3) then
        player:setCharVar("CursesFoiledAgain", 0)
        player:addQuest(xi.quest.log_id.WINDURST, xi.quest.id.windurst.CURSES_FOILED_AGAIN_2)
        player:setTitle(xi.title.TARUTARU_MURDER_SUSPECT)

    elseif (csid == 183) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 17116)
        else
            player:tradeComplete()
            player:setTitle(xi.title.HEXER_VEXER)
            player:addItem(17116)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 17116)
            player:completeQuest(xi.quest.log_id.WINDURST, xi.quest.id.windurst.CURSES_FOILED_AGAIN_2)
            player:needToZone(true)
            player:addFame(xi.quest.fame_area.WINDURST, 90)
        end

    elseif (csid == 340) then
        if (option == 1) then
            player:addQuest(xi.quest.log_id.WINDURST, xi.quest.id.windurst.CURSES_FOILED_A_GOLEM)
        else
            player:setTitle(xi.title.TOTAL_LOSER)
        end

    elseif (csid == 342) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 4870)
        else
            player:completeQuest(xi.quest.log_id.WINDURST, xi.quest.id.windurst.CURSES_FOILED_A_GOLEM)
            player:setCharVar("foiledagolemdeliverycomplete", 0)
            player:addItem(4870)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 4870)
            player:setTitle(xi.title.DOCTOR_SHANTOTTOS_FLAVOR_OF_THE_MONTH)
            player:addFame(xi.quest.fame_area.WINDURST, 120)
        end
    elseif (csid == 409) then
        player:setCharVar("ClassReunionProgress", 4)
    elseif csid == 498 then
        player:setCharVar("WildcatWindurst", utils.mask.setBit(player:getCharVar("WildcatWindurst"), 6, true))
    end
end

return entity
