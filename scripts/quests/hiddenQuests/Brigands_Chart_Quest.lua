---------------------------------------------
-- Brigand's Chart Quest
---------------------------------------------
-- Log ID: N/A
-- ??? (H-10) : 17261187
-- !gotoname : qm1
-- !pos : -87.1540 20.4049 -336.4050 0
---------------------------------------------
require('scripts/globals/zone')
require('scripts/globals/quests')
require('scripts/globals/npc_util')
require('scripts/globals/interaction/hidden_quest')
---------------------------------------------
local ID = require('scripts/zones/Buburimu_Peninsula/IDs')
---------------------------------------------
local quest = HiddenQuest:new('BrigChartQuest')
local progTrackingVar    = 'Prog'
local etuiOwnerIDVar     = 'ownerID'
local etuiCatchableVar   = 'catchable'
local etuiLootedVar      = 'looted'
local penguinRingDropped = 'ringDropped'

local messageTimeOffset = 30000 -- 30 seconds

local jadeEtuiIDs =
{
    ID.npc.JADE_ETUI_01,
    ID.npc.JADE_ETUI_02,
    ID.npc.JADE_ETUI_03,
    ID.npc.JADE_ETUI_04,
    ID.npc.JADE_ETUI_05,
}

local jadeEtuiLoot =
{
    mainPool =
    {
        xi.items.DWARF_PUGIL,
        xi.items.COPY_OF_LINES_AND_SPACE,
        xi.items.SKY_POT,
        xi.items.BLUE_PITCHER,
        xi.items.WOODEN_FLOWERPOT,
        xi.items.BEASTCOIN,
        xi.items.SILVER_BEASTCOIN,
        xi.items.MYTHRIL_BEASTCOIN,
        xi.items.GOLD_BEASTCOIN,
        xi.items.PLATINUM_BEASTCOIN,
        xi.items.ONE_BYNE_BILL,
        xi.items.ORDELLE_BRONZEPIECE,
        xi.items.TUKUKU_WHITESHELL,
        xi.items.MYTHRIL_SWORD,
        xi.items.RUSTY_CAP,
        xi.items.RUSTY_LEGGINGS,
        xi.items.RUSTY_SUBLIGAR,
        65535,                              -- 500 Gil
    }

    -- Additional Loot:
    -- xi.items.PENGUIN_RING    -- Special roll done for this for the 4th and 5th Jade Etui only. Only one can drop.
    -- xi.items.YELLOW_GLOBE    -- 3 of these are rewarded with the penguin ring
}

local despawnEtui = function(chest)
    chest:setLocalVar(etuiCatchableVar, 0)
    chest:setLocalVar(etuiOwnerIDVar, 0)
    chest:setLocalVar(etuiLootedVar, 0)
    chest:setAnimationSub(16)
    chest:setNpcFlags(3203)
    chest:setStatus(xi.status.DISAPPEAR)
    chest:entityAnimationPacket('kesu')
    chest:setUntargetable(false)
end

local chooseEtuiLoot = function(chest, player)
    local etuiID = chest:getID()

    local lootIndex = math.random(1, #jadeEtuiLoot.mainPool)
    local selectedLoot = jadeEtuiLoot.mainPool[lootIndex]

    if etuiID >= jadeEtuiIDs[4] then
        local ringChance = 30
        if etuiID >= jadeEtuiIDs[5] then
            ringChance = ringChance * 2
        end

        if
            player:getLocalVar(penguinRingDropped) == 0 and
            math.random(1, 100) < ringChance
        then
            player:setLocalVar(penguinRingDropped, 1)
            selectedLoot = xi.items.PENGUIN_RING
        end
    end

    return selectedLoot
end

quest.sections =
{
    {
        check = function(player, status, vars)
            return true
        end,

        -- Chest Model ids = {965, 966, 967, 968, 969} Blue, Brown w/Gold, Brown w/Silver, Red, Gold
        [xi.zone.BUBURIMU_PENINSULA] =
        {
            ['qm1'] =
            {
                onTrade = function(player, npc, trade)
                    if player:checkSoloPartyAlliance() == 2 then
                        player:messageSpecial(ID.text.ALLIANCE_NOT_ALLOWED, 0)
                    else
                        if
                            npc:getStatus() == xi.status.NORMAL and
                            npcUtil.tradeHasExactly(trade, xi.items.BRIGANDS_CHART) and
                            quest:getVar(player, progTrackingVar) == 0
                        then
                            player:messageSpecial(ID.text.QM1_RETURN_BRIGANDS_CHART, xi.items.BRIGANDS_CHART)
                            return quest:event(902, 8102, 7600, 8603, 0000, 7600, 0000)
                        end
                    end
                end,
            },
            ['Jade_Etui'] =
            {
                onTrigger = function(player, npc)
                    -- Only the one who fished this chest up can open
                    if
                        player:getID() == npc:getLocalVar(etuiOwnerIDVar) and
                        npc:getLocalVar(etuiLootedVar) == 0
                    then
                        -- Play the open animation
                        npc:setAnimationSub(1)
                        npc:setStatus(xi.status.UPDATE)
                        npc:setUntargetable(true)
                        npc:setLocalVar(etuiLootedVar, 1)

                        local lootID = chooseEtuiLoot(npc, player)
                        if lootID == xi.items.PENGUIN_RING then -- Received the Penguin Ring! Include 3 Yellow Globes
                            player:addTreasure(xi.items.YELLOW_GLOBE, npc)
                            player:addTreasure(xi.items.YELLOW_GLOBE, npc)
                            player:addTreasure(xi.items.YELLOW_GLOBE, npc)

                            player:addTreasure(lootID, npc)
                        elseif lootID == 65535 then -- Received Gil
                            npcUtil.giveCurrency(player, 'gil', 500)
                        else
                            player:addTreasure(lootID, npc)
                        end

                        -- Schedule for despawn
                        npc:timer(15 * 1000, function(npcArg)
                            despawnEtui(npcArg)
                        end)
                    end
                end,
            },

            onEventFinish =
            {
                [902] = function(player, csid, option, npc)
                    if option == 0 then
                        player:confirmTrade()

                        local shimmering = GetNPCByID(ID.npc.BRIGAND_CHART_SHIMMERING_POINT)
                        local bcHume = GetNPCByID(ID.npc.BRIGAND_CHART_HUME)

                        bcHume:setAnimation(xi.animation.NONE)
                        npc:setStatus(xi.status.DISAPPEAR)

                        -- Only the trading player gets the Level restriction status. They are also the only one who can open Jade Etuis.
                        player:delStatusEffectsByFlag(xi.effectFlag.DISPELABLE)
                        quest:setVar(player, progTrackingVar, 1)
                        player:addStatusEffect(xi.effect.LEVEL_RESTRICTION, 20, 0 , 0, 0, 0)
                        local effect = player:getStatusEffect(xi.effect.LEVEL_RESTRICTION)
                        effect:setFlag(effect:getFlag() + xi.effectFlag.ON_ZONE)

                        -- Make sure the special quest Puffer Pugil is catchable
                        local questPugil = GetMobByID(ID.mob.PUFFER_PUGIL)
                        if questPugil ~= nil then
                            questPugil:setLocalVar(etuiCatchableVar, 1)
                        end

                        -- Ensure the Jade Etuis are catcable
                        for _, etuiID in pairs(jadeEtuiIDs) do
                            local curEtui = GetNPCByID(etuiID)
                            if curEtui ~= nil then
                                curEtui:setLocalVar(etuiCatchableVar, 1)
                            end
                        end

                        local party = player:getParty()
                        for _, member in pairs(party) do
                            member:changeMusic(0, 136)
                            member:changeMusic(1, 136)
                            member:changeMusic(2, 136)
                            member:changeMusic(3, 136)
                            member:changeMusic(7, 136)
                        end

                        bcHume:setStatus(xi.status.NORMAL)
                        shimmering:setStatus(xi.status.NORMAL)-- Doesn't seem to show sometimes?

                        -- Need to use the qm1 npc for showing text because the Hume has a blank name and needs a ???
                        bcHume:timer(3000, function(hume)-- 3 seconds
                            npc:showText(npc, ID.text.BC_MY_RING, xi.items.PENGUIN_RING) -- My Penguin Ring...
                        end)

                        bcHume:timer(messageTimeOffset * 2, function(hume)
                            npc:showText(npc, ID.text.BC_MY_RING + 1) -- What can I do...?
                        end)

                        bcHume:timer(messageTimeOffset * 3, function(hume)
                            npc:showText(npc, ID.text.BC_MY_RING + 2) -- I worked so hard to get it...
                        end)

                        bcHume:timer(messageTimeOffset * 4, function(hume)
                            npc:showText(npc, ID.text.BC_MY_RING + 3) -- I must have it back...
                        end)

                        bcHume:timer(messageTimeOffset * 5, function(hume)
                            npc:showText(npc, ID.text.BC_MY_RING + 4) -- I thought I could make my parents proud... Why can't I do such a simple thing!?
                        end)

                        -- Show 10 second warning
                        bcHume:timer((messageTimeOffset * 6) - 10000, function(hume)
                            npc:showText(npc, ID.text.BC_MY_RING + 5) -- I-I'm... fading... I can't go on much longer... Could this be the end?
                        end)

                        bcHume:timer(messageTimeOffset * 6, function(hume)
                            npc:showText(npc, ID.text.BC_MY_RING + 6) -- It can't be... Nooo!!!
                            hume:setStatus(xi.status.DISAPPEAR)
                        end)

                        npc:timer(messageTimeOffset * 6, function(npcArg)
                            -- Perform cleanup
                            npcArg:setStatus(xi.status.NORMAL)
                            shimmering:setStatus(xi.status.DISAPPEAR)

                            if questPugil ~= nil then
                                questPugil:setLocalVar(etuiCatchableVar, 0)
                            end

                            for _, etuiID in pairs(jadeEtuiIDs) do
                                local curEtui = GetNPCByID(etuiID)
                                if curEtui ~= nil then
                                    despawnEtui(curEtui)
                                end
                            end

                            for _, member in pairs(party) do
                                if member:hasStatusEffect(xi.effect.LEVEL_RESTRICTION) then
                                    member:delStatusEffect(xi.effect.LEVEL_RESTRICTION)
                                end

                                member:changeMusic(0, 0)
                                member:changeMusic(1, 0)
                                member:changeMusic(2, 101)
                                member:changeMusic(3, 102)
                                member:changeMusic(7, 129)

                                quest:setVar(member, progTrackingVar, 0)
                            end
                        end)
                    else
                        player:tradeComplete(false)
                    end
                end,
            },
        },
    },
}

return quest
