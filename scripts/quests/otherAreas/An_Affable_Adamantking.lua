-----------------------------------
-- An Affable Adamantking
-----------------------------------
-- Log ID: 4, Quest ID: 107
-- Beadeaux Zone     : !pos -45 24 60 147
-- Peshi Yohnts      : !pos -6 -6 -145 241
-- Beastmen's Banner : !pos 10 25 -50 148
-----------------------------------
-- !addquest 4 107
-- !addItem 885 -- Turtle Shell
-- !addItem 1637 -- Bugard Leather
-- !addItem 15201 -- Quadav Barbut
-----------------------------------
require('scripts/globals/interaction/quest')
require('scripts/globals/npc_util')
require('scripts/globals/quests')
require('scripts/globals/titles')
require('scripts/globals/zone')
-----------------------------------
local qulunDomeID  = require("scripts/zones/Qulun_Dome/IDs")
local windurstWoodsID  = require("scripts/zones/Windurst_Woods/IDs")
-----------------------------------

local quest = Quest:new(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.AN_AFFABLE_ADAMANTKING)

quest.reward =
{
    title = xi.title.BRONZE_QUADAV,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == QUEST_AVAILABLE and
                player:getQuestStatus(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.A_GENEROUS_GENERAL) ~= QUEST_ACCEPTED and
                player:getQuestStatus(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.AN_UNDERSTANDING_OVERLORD) ~= QUEST_ACCEPTED and
                player:getQuestStatus(xi.quest.log_id.OTHER_AREAS, xi.quest.id.otherAreas.A_MORAL_MANIFEST) ~= QUEST_ACCEPTED and
                player:getVar("BstHeadGearQuest_Conquest") < getConquestTally() and
                not player:hasItem(xi.items.DAVHUS_BARBUT) and
                player:getMainLvl() >= 60
        end,

        [xi.zone.QULUN_DOME] =
        {
            onZoneIn =
            {
                function(player, prevZone)
                    local pos = player:getPos()
                    if 
                        pos.x >= 0 and
                        pos.y >= 20 and
                        pos.z >= 55 and
                        pos.x <= 6 and
                        pos.y <= 25 and
                        pos.z <= 65
                    then
                        return 60
                    end
                end,
            },

            onEventFinish =
            {
                [60] = function(player, csid, option, npc)
                    if option == 0 then
                        quest:setVar(player, 'Prog', 1)
                        quest:begin(player)
                    elseif option == 1 then
                        player:setVar("BstHeadGearQuest_Conquest", getConquestTally()) -- if player declines they must wait until next conquest tally
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == QUEST_ACCEPTED
        end,

        [xi.zone.WINDURST_WOODS] =
        {
            ["Peshi_Yohnts"] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 1 then
                        return quest:progressEvent(710) -- tells player what items are needed
                    elseif quest:getVar(player, 'Prog') == 2 then
                        return quest:progressEvent(711) -- reminder to get bugard leather and turtle shell or cancel quest
                    elseif 
                        quest:getVar(player, 'Prog') >= 3 and
                        quest:getVar(player, 'partsWait') ~= 0 -- player is currently waiting for parts
                    then
                        if
                            quest:getVar(player, 'partsWait') < os.time() and
                            not quest:getMustZone(player)
                        then
                            return quest:progressEvent(715) -- ready to go
                        else
                            return quest:progressEvent(713) -- player must wait till vana midnight and zone
                        end
                    elseif quest:getVar(player, 'Prog') == 4 then
                        return quest:progressEvent(714) -- Get another part for 100000 gil or give up
                    end
                end,

                onTrade = function(player, npc, trade)
                    if
                        npcUtil.tradeHas(trade, { { xi.items.SQUARE_OF_BUGARD_LEATHER, 1 }, { xi.items.TURTLE_SHELL, 1 } }) and
                        trade:getGil() == 10000 and
                        trade:getItemCount() == 3 and
                        quest:getVar(player, 'Prog') == 2
                    then
                        return quest:progressEvent(712)
                    end
                end,
            },

            onEventFinish =
            {
                [710] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 2) -- both options return 0
                end,

                [711] = function(player, csid, option, npc)
                    if option == 100 then
                        player:messageSpecial(zones[player:getZoneID()].text.QUEST_CANCELLED)
                        quest:setVar(player, 'Prog', 0)
                        player:delQuest(quest.areaId, quest.questId)
                        player:setVar("BstHeadGearQuest_Conquest", 0) -- player can accept other headgear quests upon cancelling
                    end
                end,

                [712] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 3)
                    quest:setVar(player, 'partsWait', getVanaMidnight())
                    player:confirmTrade()
                    player:delGil(10000)
                    quest:setMustZone(player)
                end,

                [714] = function(player, csid, option, npc)
                    if option == 0 then
                        if player:getGil() > 100000 then
                            quest:setVar(player, 'partsWait', getVanaMidnight())
                            player:delGil(100000)
                            quest:setMustZone(player)
                        else
                            player:messageSpecial(windurstWoodsID.text.NOT_HAVE_ENOUGH_GIL)
                        end
                    elseif option == 100 then
                        player:messageSpecial(zones[player:getZoneID()].text.QUEST_CANCELLED)
                        quest:setVar(player, 'Prog', 0)
                        player:delQuest(quest.areaId, quest.questId)
                        player:setVar("BstHeadGearQuest_Conquest", 0) -- player can accept other headgear quests upon cancelling
                    end
                end,

                [715] = function(player, csid, option, npc)
                    if 
                        player:getFreeSlotsCount() > 0 and
                        not player:hasItem(xi.items.QUADAV_PARTS)
                    then
                        if quest:getVar(player, 'Prog') == 3 then
                            quest:setVar(player, 'Prog', 4) -- only progress if current prog is 3
                        end

                        quest:setVar(player, 'partsWait', 0)
                        npcUtil.giveItem(player, xi.items.QUADAV_PARTS)
                    else
                        player:messageSpecial(windurstWoodsID.text.ITEM_CANNOT_BE_OBTAINED, xi.items.QUADAV_PARTS)
                    end
                end,
            },
        },

        [xi.zone.QULUN_DOME] =
        {
            onZoneIn =
            {
                function(player, prevZone)
                    local pos = player:getPos()
                    if 
                        pos.x >= 0 and
                        pos.y >= 20 and
                        pos.z >= 55 and
                        pos.x <= 6 and
                        pos.y <= 25 and
                        pos.z <= 65 and
                        quest:getVar(player, 'Prog') == 4 and
                        player:hasEquipped(xi.items.QUADAV_BARBUT)
                    then
                        return 61 -- Give player seeker bats ki to plant
                    end
                end,
            },

            ["Beastmens_Banner"] =
            {
                onTrigger = function(player, npc)
                    if
                        player:hasEquipped(xi.items.QUADAV_BARBUT) and
                        player:hasKeyItem(xi.ki.ORCISH_SEEKER_BATS)
                    then
                        return quest:progressEvent(62) -- trigger fight
                    elseif quest:getVar(player, 'Prog') == 6 then
                        return quest:progressEvent(63) -- congratulate player on fight
                    end
                end,

                onTrade = function(player, npc, trade)
                    if
                        npcUtil.tradeHasExactly(trade, { xi.items.QUADAV_BARBUT }) and
                        quest:getVar(player, 'Prog') == 7
                    then
                        return quest:progressEvent(64) -- reward player with Da'Vhu's Barbut
                    end
                end,
            },

            ['Diamond_Quadav'] =
            {
                onMobDeath = function(mob, player, optParams)
                    if
                        GetMobByID(qulunDomeID.mob.AFFABLE_ADAMANTKING_OFFSET):isDead() -- defeating the Diamond Quadav despawns others
                    then
                        for i = qulunDomeID.mob.AFFABLE_ADAMANTKING_OFFSET + 1, qulunDomeID.mob.AFFABLE_ADAMANTKING_OFFSET + 6 do
                            DespawnMob(i)
                        end

                        quest:setVar(player, 'Prog', 6)
                    end
                end,
            },

            onEventFinish =
            {
                [61] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, xi.ki.ORCISH_SEEKER_BATS)
                    quest:setVar(player, 'Prog', 5)
                end,

                [62] = function(player, csid, option, npc)
                    npcUtil.popFromQM(player, npc, {
                        qulunDomeID.mob.AFFABLE_ADAMANTKING_OFFSET,
                        qulunDomeID.mob.AFFABLE_ADAMANTKING_OFFSET + 1,
                        qulunDomeID.mob.AFFABLE_ADAMANTKING_OFFSET + 2,
                        qulunDomeID.mob.AFFABLE_ADAMANTKING_OFFSET + 3,
                        qulunDomeID.mob.AFFABLE_ADAMANTKING_OFFSET + 4,
                        qulunDomeID.mob.AFFABLE_ADAMANTKING_OFFSET + 5,
                        qulunDomeID.mob.AFFABLE_ADAMANTKING_OFFSET + 6,
                    }, { claim = true, hide = 0 })
                    player:delKeyItem(xi.ki.ORCISH_SEEKER_BATS)
                end,

                [63] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 7)
                end,

                [64] = function(player, csid, option, npc)
                    if player:getFreeSlotsCount() > 0 then
                        player:confirmTrade()
                        npcUtil.giveItem(player, xi.items.DAVHUS_BARBUT)
                        player:setCharVar('affableZone', 1)
                        player:setVar("BstHeadGearQuest_Conquest", getConquestTally())
                        quest:complete(player) -- quest is marked complete, additional reward upon zoning w/ CS
                    else
                        player:messageSpecial(qulunDomeID.text.ITEM_CANNOT_BE_OBTAINED, xi.items.DAVHUS_BARBUT)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == QUEST_COMPLETED
        end,

        [xi.zone.QULUN_DOME] =
        {
            onZoneIn =
            {
                function(player, prevZone)
                    if
                        pos.x >= 0 and
                        pos.y >= 20 and
                        pos.z >= 55 and
                        pos.x <= 6 and
                        pos.y <= 25 and
                        pos.z <= 65 and
                        player:getCharVar('affableZone') == 1 and
                        player:hasEquipped(xi.items.DAVHUS_BARBUT)
                    then
                        return 65
                    end
                end,
            },

            onEventFinish =
            {
                [65] = function(player, csid, option, npc)
                    if player:getFreeSlotsCount() > 0 then
                        npcUtil.giveItem(player, xi.items.GOLD_BEASTCOIN)
                        player:setCharVar('affableZone', 0)
                    else
                        player:messageSpecial(qulunDomeID.text.ITEM_CANNOT_BE_OBTAINED, xi.items.GOLD_BEASTCOIN)
                    end
                end,
            }
        },
    },
}

return quest
