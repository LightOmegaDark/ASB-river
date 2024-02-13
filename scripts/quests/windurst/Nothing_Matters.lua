-----------------------------------
-- Nothing Matters
-----------------------------------
-- Log ID: 2, Quest ID: 79
-- Koru-Moru      : !pos -120 -6 124 239
-- Bonchacha      : !gotoid 17756196
-- Maan-Pokuun    : !gotoid 17756195
-- Yoran-Oran     : !pos -110 -14 203 239
-- Shantotto      : !pos 122 -2 112 239
-- Fuepepe        : !pos 161 -2 161 238
-- Acolyte Hostel : !gotoid 17752275
-----------------------------------
-- !addquest 2 79
-- !additem 4602
-- !additem 907
-----------------------------------
require('scripts/globals/interaction/quest')
require('scripts/globals/npc_util')
require('scripts/globals/quests')
require('scripts/globals/titles')
require('scripts/globals/zone')
-----------------------------------
local windurstWatersID  = require("scripts/zones/Windurst_Waters/IDs")
-----------------------------------

local quest = Quest:new(xi.quest.log_id.WINDURST, xi.quest.id.windurst.NOTHING_MATTERS)

quest.reward =
{
    title = xi.title.SEEKER_OF_TRUTH,
    gil = 10000
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == QUEST_AVAILABLE and
                player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.BLAST_FROM_THE_PAST) == QUEST_COMPLETED and
                player:getFameLevel(xi.quest.fame_area.WINDURST) >= 8
        end,

        [xi.zone.WINDURST_WALLS] =
        {
            ['Koru-Moru'] =
            {
                onTrigger = function(player, npc)
                    return quest:progressEvent(227) -- start quest
                end,
            },

            onEventFinish =
            {
                [227] = function(player, csid, option, npc)
                    if option == 0 then
                        quest:setVar(player, 'Prog', 1)
                        quest:begin(player)
                    end
                end
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == QUEST_ACCEPTED
        end,

        [xi.zone.WINDURST_WALLS] =
        {
            ['Koru-Moru'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') <= 3 then
                        return quest:event(228) -- reminder to find an alchemist
                    elseif
                        quest:getVar(player, 'Prog') == 4 and
                        player:hasKeyItem(xi.ki.THESIS_ON_ALCHEMY)
                    then
                        return quest:progressEvent(237) -- turn in paper, Koru-Moru asks adventurer to find lifeforce and power of death
                    elseif quest:getVar(player, 'Prog') == 5 then
                        return quest:event(238) -- reminder to find lifeforce and power of death
                    elseif quest:getVar(player, 'Prog') == 6 then
                        if os.time() > quest:getVar(player, "Wait") then
                            return quest:progressEvent(242) -- complete quest
                        else
                            return quest:event(241) -- impatient adventurer check before time gate
                        end
                    end
                end,

                onTrade = function(player, npc, trade)
                    if
                        npcUtil.tradeHasExactly(trade, { xi.items.WARM_EGG, xi.items.COLD_BONE }) and
                        quest:getVar(player, 'Prog') == 5
                    then
                        return quest:progressEvent(239, 0, xi.items.WARM_EGG, xi.items.COLD_BONE)
                    end
                end,
            },

            ['Bonchacha'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 1 then
                        return quest:event(229) -- optional dialogue
                    end
                end
            },

            ['Maan-Pokuun'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 1 then
                        return quest:event(230) -- optional dialogue
                    end
                end
            },

            ['Shantotto'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') <= 2 then
                        return quest:progressEvent(231) -- School of Magic student hint
                    end
                end,
            },

            ['Yoran-Oran'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 1 then
                        return quest:progressEvent(232) -- optional dialogue
                    end
                end
            },

            onEventFinish =
            {
                [231] = function(player, csid, option, npc)
                    if quest:getVar(player, 'Prog') == 1 then
                        quest:setVar(player, 'Prog', 2)
                    end
                end,

                [237] = function(player, csid, option, npc)
                    player:delKeyItem(xi.ki.THESIS_ON_ALCHEMY)
                    quest:setVar(player, 'Prog', 5)
                end,

                [239] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 6)
                    player:confirmTrade()
                    quest:setVar(player, "Wait", getMidnight())
                end,

                [242] = function(player, csid, option, npc)
                    quest:complete(player)
                end,
            },
        },

        [xi.zone.WINDURST_WATERS] =
        {
            ['Fuepepe'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 2 then
                        return quest:progressEvent(545) -- tells player to find Katzun-Nattzun at the Acolyte Hostel
                    elseif quest:getVar(player, 'Prog') == 3 then
                        return quest:progressEvent(546) -- reminds player to find Katzun-Nattzun at the Acolyte Hostel
                    end
                end
            },

            ['Moreno-Toeno'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 2 then
                        return quest:event(544) -- optional dialogue
                    end
                end
            },

            ['Pechiru-Mashiru'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 2 then
                        return quest:event(541) -- optional dialogue
                    end
                end
            },

            ['Door_Acolyte_Hostel'] = 
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 3 then
                        if npc:getID() == windurstWatersID.npc.ACOLYTE_HOSTEL_DOOR_OFFSET then
                            if not quest:isVarBitsSet(player, 'Doors', 1) then -- question set 1
                                return quest:progressEvent(804, 0, xi.ki.AIRSHIP_PASS, 500000, 0, 0, 0, 0, xi.ki.THESIS_ON_ALCHEMY) -- airship cost based on Derrick.lua for airship
                            end
                        elseif npc:getID() == windurstWatersID.npc.ACOLYTE_HOSTEL_DOOR_OFFSET + 1 then
                            if not quest:isVarBitsSet(player, 'Doors', 2) then -- question set 2
                                return quest:progressEvent(805, 0, 0, xi.items.APPLE_PIE, xi.items.WILLOW_FISHING_ROD, xi.items.WOOL_HAT, 0, 0, xi.ki.THESIS_ON_ALCHEMY)
                            end
                        elseif npc:getID() == windurstWatersID.npc.ACOLYTE_HOSTEL_DOOR_OFFSET + 2 then
                            if not quest:isVarBitsSet(player, 'Doors', 3) then -- question set 3
                                return quest:progressEvent(806, 0, 0, 0, 0, 0, 0, 0, xi.ki.THESIS_ON_ALCHEMY)
                            end
                        elseif npc:getID() == windurstWatersID.npc.ACOLYTE_HOSTEL_DOOR_OFFSET + 7 then
                            if not quest:isVarBitsSet(player, 'Doors', 4) then -- question set 4
                                return quest:progressEvent(811, 0, 0, 0, 0, 0, 0, 0, xi.ki.THESIS_ON_ALCHEMY)
                            end
                        elseif npc:getID() == windurstWatersID.npc.ACOLYTE_HOSTEL_DOOR_OFFSET + 8 then
                            if not quest:isVarBitsSet(player, 'Doors', 5) then -- question set 5
                                return quest:progressEvent(812, 0, 0, 0, 0, xi.items.CRYSTAL_BASS, 0, 0, xi.ki.THESIS_ON_ALCHEMY)
                            end
                        elseif npc:getID() == windurstWatersID.npc.ACOLYTE_HOSTEL_DOOR_OFFSET + 9 then
                            if not quest:isVarBitsSet(player, 'Doors', 6) then -- question set 6
                                return quest:progressEvent(813, 0, xi.items.BAG_OF_HERB_SEEDS, xi.items.AMARYLLIS, xi.items.CARNATION, xi.items.MARGUERITE, xi.items.FOUR_LEAF_MANDRAGORA_BUD, 0, xi.ki.THESIS_ON_ALCHEMY)
                            end
                        end

                        if npc:getID() == windurstWatersID.npc.ACOLYTE_HOSTEL_DOOR_OFFSET + 10 then
                            if
                                quest:isVarBitsSet(player, 'Doors', 1) and
                                quest:isVarBitsSet(player, 'Doors', 2) and
                                quest:isVarBitsSet(player, 'Doors', 3) and
                                quest:isVarBitsSet(player, 'Doors', 4) and
                                quest:isVarBitsSet(player, 'Doors', 5) and
                                quest:isVarBitsSet(player, 'Doors', 6) -- check all questions have been answered
                            then
                                if quest:getVar(player, 'correctProg') >= 4 then -- check at least 4 correct answers to progress
                                    if
                                        quest:getVar(player, 'correctProg') == 4 or
                                        quest:getVar(player, 'correctProg') == 5
                                    then
                                        return quest:progressCutscene(814, 0, 0, 0, 0, 0, 0, 0, xi.ki.THESIS_ON_ALCHEMY)
                                    elseif
                                        quest:getVar(player, 'correctProg') == 6 and -- if player has 6 correct they get additional reward
                                        player:getFreeSlotsCount() > 0 -- confirm player has inventory space for vile elixir
                                    then
                                        return quest:progressCutscene(814, 0, 0, 1, 0, 0, 0, 0, xi.ki.THESIS_ON_ALCHEMY) -- additional reward
                                    else
                                        player:messageSpecial(windurstWatersID.text.ITEM_CANNOT_BE_OBTAINED, xi.items.VILE_ELIXIR)
                                    end
                                else -- all questions have been answered but < 4 were correct
                                    quest:unsetVarBit(player, 'Doors', 1)
                                    quest:unsetVarBit(player, 'Doors', 2)
                                    quest:unsetVarBit(player, 'Doors', 3)
                                    quest:unsetVarBit(player, 'Doors', 4)
                                    quest:unsetVarBit(player, 'Doors', 5)
                                    quest:unsetVarBit(player, 'Doors', 6)
                                    quest:setVar(player, 'correctProg', 0)
                                end
                            end
                        end
                    end
                end
            },

            onEventFinish =
            {
                [545] = function(player, csid, option, npc)
                    if quest:getVar(player, 'Prog') == 2 then
                        quest:setVar(player, 'Prog', 3)
                        quest:setVar(player, 'correctProg', 0)
                    end
                end,

                [804] = function(player, csid, option, npc)
                    quest:setVarBit(player, 'Doors', 1)
                    if option == 100 then
                        quest:setVar(player, 'correctProg', quest:getVar(player, 'correctProg') + 1)
                    end
                end,

                [805] = function(player, csid, option, npc)
                    quest:setVarBit(player, 'Doors', 2)
                    if option == 100 then
                        quest:setVar(player, 'correctProg', quest:getVar(player, 'correctProg') + 1)
                    end
                end,

                [806] = function(player, csid, option, npc)
                    quest:setVarBit(player, 'Doors', 3)
                    if option == 100 then
                        quest:setVar(player, 'correctProg', quest:getVar(player, 'correctProg') + 1)
                    end
                end,

                [811] = function(player, csid, option, npc)
                    quest:setVarBit(player, 'Doors', 4)
                    if option == 100 then
                        quest:setVar(player, 'correctProg', quest:getVar(player, 'correctProg') + 1)
                    end
                end,

                [812] = function(player, csid, option, npc)
                    quest:setVarBit(player, 'Doors', 5)
                    if option == 100 then
                        quest:setVar(player, 'correctProg', quest:getVar(player, 'correctProg') + 1)
                    end
                end,

                [813] = function(player, csid, option, npc)
                    quest:setVarBit(player, 'Doors', 6)
                    if option == 100 then
                        quest:setVar(player, 'correctProg', quest:getVar(player, 'correctProg') + 1)
                    end
                end,

                [814] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, xi.ki.THESIS_ON_ALCHEMY)
                    quest:setVar(player, 'Prog', 4)
                    if quest:getVar(player, 'correctProg') == 6 then -- if player answered 6 correctly reward with vile elixir
                        npcUtil.giveItem(player, xi.items.VILE_ELIXIR)
                    end
                end,
            },
        }
    },
}

return quest
