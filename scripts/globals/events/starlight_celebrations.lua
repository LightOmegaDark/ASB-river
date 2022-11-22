-----------------------------------
-- Starlight Celebrations
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/npc_util")
------------------------------------

function isStarlightEnabled()
    local option = 0
    local month = tonumber(os.date("%m"))
    local day = tonumber(os.date("%d"))

    if ((month == 12 and day >= 16) or xi.settings.main.STARLIGHT_YEAR_ROUND) then -- According to wiki Startlight Festival is December 16 - December 31.
        if (xi.settings.main.STARLIGHT_2007 == 1) then
            option = 1
        end
    end

    return option
end

--------------------------------
-- For the Children Sub-Quest --
--------------------------------
function onStarlightSmilebringersTrade(player, trade, npc)
    local zone = player:getZoneName()
    local ID = zones[player:getZoneID()]
    local contentEnabled = isStarlightEnabled()
    local item = trade:getItemId()

    ------------------
    -- 2007 Edition --
    ------------------
    if (contentEnabled == 1) then
        ----------------------
        -- Presents Allowed --
        ----------------------
        local gifts_table =
        {
            1742, -- Present for Kiddies
            1743, -- Present for Kiddies
            1744, -- Present for Kiddies
            1745, -- Present for Kiddies
            4215, -- Popstar
            4216, -- Brilliant Snow
            4217, -- Sparkling Hand
            4218, -- Air Rider
            4167, -- Cracker
            4168, -- Twinkle Shower
            4169, -- Little Comet
        }

        local presents_table =
        {
            1742,
            1743,
            1744,
            1745,
        }
        ---------------
        -- Hat Check --
        ---------------
        local head = player:getEquipID(xi.slot.HEAD)

        for itemInList = 1, #gifts_table do
            if (item == gifts_table[itemInList] and (head == 15179 or head == 15178) and (item == presents_table[itemInList]) and (player:getFameLevel(xi.quest.fame_area.HOLIDAY) < 9)) then
                player:showText(npc, ID.text.GIFT_THANK_YOU)
                player:messageSpecial(ID.text.BARRELS_JOY_TO_CHILDREN)
                player:addFame(xi.quest.fame_area.HOLIDAY, 64)
                player:tradeComplete()
            elseif (item == gifts_table[itemInList] and (head == 15179 or head == 15178) and (player:getFameLevel(xi.quest.fame_area.HOLIDAY) < 9)) then
                player:showText(npc, ID.text.GIFT_THANK_YOU)
                player:messageSpecial(ID.text.JOY_TO_CHILDREN)
                player:addFame(xi.quest.fame_area.HOLIDAY, 32)
                player:tradeComplete()
            elseif ((item == gifts_table[itemInList]) and (head == 15179 or head == 15178) and (player:getFameLevel(xi.quest.fame_area.HOLIDAY) >= 9)) then
                player:showText(npc, ID.text.ONLY_TWO_HANDS)
            end
        end
    end
end

--------------------------------
-- Gifts for NPCs Sub-Quest --
--------------------------------

function npcGiftsMoogleOnTrigger(player)
    if isStarlightEnabled ~= 0 then
        local startedQuest = player:getLocalVar("[StarlightNPCGifts]Started")
        local hasCompleted = player:getCharVar("[StarlightNPCGifts]Completed")
        if startedQuest ~= 0 then
            local delivered = player:getLocalVar("[StarlightNPCGifts]Delivered")
            if delivered == 15 then
                player:startEvent(32702)
            else
                player:startEvent(32701, delivered)
            end
        else
            if hasCompleted == VanadielDayOfTheWeek() then
                player:startEvent(32700)
            else
                player:startEvent(32703)
            end
        end
    end
end

function npcGiftsMoogleOnFinish(player, id, csid, option)
    if csid == 32703 and option == 1 then
        player:setLocalVar("[StarlightNPCGifts]Started", 1)
        player:setLocalVar("[StarlightNPCGifts]Delivered", 0)
        player:setLocalVar("[StarlightNPCGifts]Npc1", 0)
        player:setLocalVar("[StarlightNPCGifts]Npc2", 0)
        player:setLocalVar("[StarlightNPCGifts]Npc3", 0)
        player:setLocalVar("[StarlightNPCGifts]Npc4", 0)
    elseif csid == 32702 then
        local hasToken = player:hasKeyItem(xi.keyItem.SNOW_THEMED_GIFT_TOKEN)
        local gift_table =
        {
            5622,   -- Candy Cane
            5621,   -- Candy Ring
        }
        local fireworks_table =
        {
            4215, -- Popstar
            4216, -- Brilliant Snow
            4217, -- Sparkling Hand
            4218, -- Air Rider
            4167, -- Cracker
            4168, -- Twinkle Shower
            4169, -- Little Comet
        }
        if hasToken == true then
            npcUtil.giveItem(player, gift_table[math.random(1,2)])
        else
            player:addKeyItem(xi.keyItem.SNOW_THEMED_GIFT_TOKEN)
            player:messageSpecial(id.text.KEYITEM_OBTAINED, xi.keyItem.SNOW_THEMED_GIFT_TOKEN)
        end
        npcUtil.giveItem(player, { { fireworks_table[math.random(1,7)], 10 } })
        player:setLocalVar("[StarlightNPCGifts]Started", 0)
        player:setCharVar("[StarlightNPCGifts]Completed", VanadielDayOfTheWeek())
    end
end

function npcGiftsNpcOnTrigger(player, eventid)
    if eventid == 1 then
        if player:getLocalVar("[StarlightNPCGifts]Started") == 1 then
            if player:getLocalVar("[StarlightNPCGifts]Npc1") ~= 1 then
                local npc2 = player:getLocalVar("[StarlightNPCGifts]Npc2")
                local npc3 = player:getLocalVar("[StarlightNPCGifts]Npc3")
                local npc4 = player:getLocalVar("[StarlightNPCGifts]Npc4")
                local delivered = 0
                if npc2 == 1 then
                    delivered = 3
                    if npc3 == 1 then
                        delivered = 7
                        if npc4 == 1 then
                            delivered = 15
                        end
                    end
                elseif npc3 == 1 then
                    delivered = 5
                    if npc4 == 1 then
                        delivered = 14
                    end
                elseif npc4 == 1 then
                    delivered = 9
                else
                    delivered = 1
                end
                player:startEvent(32693)
                player:setLocalVar("[StarlightNPCGifts]Npc1", 1)
                player:setLocalVar("[StarlightNPCGifts]Delivered", delivered)

                return
            end
        end
    elseif eventid == 2 then
        if player:getLocalVar("[StarlightNPCGifts]Started") == 1 then
            if player:getLocalVar("[StarlightNPCGifts]Npc2") ~= 1 then
                local npc1 = player:getLocalVar("[StarlightNPCGifts]Npc1")
                local npc3 = player:getLocalVar("[StarlightNPCGifts]Npc3")
                local npc4 = player:getLocalVar("[StarlightNPCGifts]Npc4")
                local delivered = 0
                if npc1 == 1 then
                    delivered = 3
                    if npc3 == 1 then
                        delivered = 7
                        if npc4 == 1 then
                            delivered = 15
                        end
                    end
                elseif npc3 == 1 then
                    delivered = 6
                    if npc4 == 1 then
                        delivered = 14
                    end
                elseif npc4 == 1 then
                    delivered = 10
                else
                    delivered = 2
                end
                player:startEvent(32692)
                player:setLocalVar("[StarlightNPCGifts]Npc2", 1)
                player:setLocalVar("[StarlightNPCGifts]Delivered", delivered)

                return
            end
        end
    elseif eventid == 3 then
        if player:getLocalVar("[StarlightNPCGifts]Started") == 1 then
            if player:getLocalVar("[StarlightNPCGifts]Npc3") ~= 1 then
                local npc1 = player:getLocalVar("[StarlightNPCGifts]Npc1")
                local npc2 = player:getLocalVar("[StarlightNPCGifts]Npc2")
                local npc4 = player:getLocalVar("[StarlightNPCGifts]Npc4")
                local delivered = 0
                if npc1 == 1 then
                    delivered = 5
                    if npc2 == 1 then
                        delivered = 7
                        if npc4 == 1 then
                            delivered = 15
                        end
                    end
                elseif npc2 == 1 then
                    delivered = 6
                    if npc4 == 1 then
                        delivered = 14
                    end
                elseif npc4 == 1 then
                    delivered = 12
                else
                    delivered = 4
                end
                player:startEvent(32691)
                player:setLocalVar("[StarlightNPCGifts]Npc3", 1)
                player:setLocalVar("[StarlightNPCGifts]Delivered", delivered)

                return
            end
        end
    elseif eventid == 4 then
        if player:getLocalVar("[StarlightNPCGifts]Started") == 1 then
            if player:getLocalVar("[StarlightNPCGifts]Npc4") ~= 1 then
                local npc1 = player:getLocalVar("[StarlightNPCGifts]Npc1")
                local npc2 = player:getLocalVar("[StarlightNPCGifts]Npc2")
                local npc3 = player:getLocalVar("[StarlightNPCGifts]Npc3")
                local delivered = 0
                if npc1 == 1 then
                    delivered = 9
                    if npc2 == 1 then
                        delivered = 11
                        if npc3 == 1 then
                            delivered = 15
                        end
                    end
                elseif npc2 == 1 then
                    delivered = 10
                    if npc3 == 1 then
                        delivered = 14
                    end
                elseif npc3 == 1 then
                    delivered = 12
                else
                    delivered = 8
                end
                player:startEvent(32690)
                player:setLocalVar("[StarlightNPCGifts]Npc4", 1)
                player:setLocalVar("[StarlightNPCGifts]Delivered", delivered)

                return
            end
        end
    end
end

--------------------------------
-- Token Redemption Sub-Quest --
--------------------------------

function tokenMoogleOnTrigger(player)
    local startedTokens = player:getCharVar("[StarlightTokens]Started")
    if startedTokens ~= 0 then
        local snowToken = player:hasKeyItem(xi.keyItem.SNOW_THEMED_GIFT_TOKEN)
        local bellToken = player:hasKeyItem(xi.keyItem.BELL_THEMED_GIFT_TOKEN)
        local starToken = player:hasKeyItem(xi.keyItem.STAR_THEMED_GIFT_TOKEN)

        if (snowToken == true and bellToken == true and starToken == true) then
            player:startEvent(32705)
        else
            if snowToken then
                player:startEvent(32704, xi.keyItem.SNOW_THEMED_GIFT_TOKEN)
            elseif bellToken then
                player:startEvent(32704, xi.keyItem.BELL_THEMED_GIFT_TOKEN)
            elseif starToken then
                player:startEvent(32704, xi.keyItem.STAR_THEMED_GIFT_TOKEN)
            else
                player:startEvent(32706)
            end
        end

    else
        player:startEvent(32706)
    end
end

function tokenMoogleOnFinish(player, id, csid, option)
    if csid == 32706 then
        player:setCharVar("[StarlightTokens]Started", 1)
    elseif csid == 32704 or (csid == 32705 and option ~= 1) then -- snow, bell, star
        local invAvailable = player:getFreeSlotsCount()
        local snowToken = player:hasKeyItem(xi.keyItem.SNOW_THEMED_GIFT_TOKEN)
        local bellToken = player:hasKeyItem(xi.keyItem.BELL_THEMED_GIFT_TOKEN)
        local starToken = player:hasKeyItem(xi.keyItem.STAR_THEMED_GIFT_TOKEN)
        local reward = 0
        local reward_table = {}
        local gifts_table =
            {
                SNOW_TOKEN =
                {
                    5552,   -- Black Pudding
                    18863,  -- Dream Bell
                    5542,   -- Gateau Aux Fraises
                    5616,   -- Lebkuchen House
                    5622,   -- Candy Cane
                    5621,   -- Candy Ring
                    177,    -- Snowman Miner
                    115,    -- Bastokan Tree
                },
                BELL_TOKEN =
                {
                    5552,   -- Black Pudding
                    5621,   -- Candy Ring
                    18863,  -- Dream Bell
                    15752,  -- Dream Boots
                    15753,  -- Dream Boots +1
                    5620,   -- Roast Turkey
                    178,    -- Snowman Mage
                    116,    -- Windurstian Tree
                },
                STAR_TOKEN =
                {
                    5550,   -- Buche au Chocolat
                    5622,   -- Candy Cane
                    5621,   -- Candy Ring
                    18863,  -- Dream Bell
                    14519,  -- Dream Robe
                    14520,  -- Dream Robe +1
                    5542,   -- Gateau Aux Fraises
                    5620,   -- Roast Turkey
                    176,    -- Snowman Knight
                    86,     -- San d'Orian Tree
                },
                RARE_ITEMS =
                {
                    18863,  -- Dream Bell
                    14519,  -- Dream Robe
                    14520,  -- Dream Robe +1
                    15752,  -- Dream Boots
                    15753,  -- Dream Boots +1
                    176,    -- Snowman Knight
                    177,    -- Snowman Miner
                    178,    -- Snowman Mage
                    86,     -- San d'Orian Tree
                    115,    -- Bastokan Tree
                    116,    -- Windurstian Tree
                }
            }

        if invAvailable ~= 0 then
            if snowToken then
                player:delKeyItem(xi.keyItem.SNOW_THEMED_GIFT_TOKEN)
                reward_table = gifts_table.SNOW_TOKEN
            elseif bellToken then
                player:delKeyItem(xi.keyItem.BELL_THEMED_GIFT_TOKEN)
                reward_table = gifts_table.BELL_TOKEN
            elseif starToken then
                player:delKeyItem(xi.keyItem.STAR_THEMED_GIFT_TOKEN)
                reward_table = gifts_table.STAR_TOKEN
            end
        else
            player:messageSpecial(id.text.DEFAULT_CANNOT_BE_OBTAINED)
            return
        end

        local count = #reward_table

        while count ~= 0 do
            local picked = reward_table[math.random(1, #reward_table)]
            if player:hasItem(picked) == false then
                reward = picked
                count = 0
                npcUtil.giveItem(player, reward)
            else
                if (picked > 178 and picked < 14519) then -- checks if reward is a food item
                    reward = picked
                    count = 0
                    npcUtil.giveItem(player, reward)
                else
                    table.remove(reward_table, picked) -- removes ra/ex items that player already has
                    count = count - 1
                end
            end
        end

    elseif (csid == 32705 and option == 1) then
        local hasNQ = player:hasItem(18863)
        local hasHQ = player:hasItem(18864)
        local invAvailable = player:getFreeSlotsCount()

        if invAvailable ~= 0 then
            if hasHQ then
                npcUtil.giveItem(player, { 5620, 5621, 5622 })
            elseif hasNQ then
                npcUtil.giveItem(player, 18864)
            else
                npcUtil.giveItem(player, 18863)
            end
            player:delKeyItem(xi.keyItem.SNOW_THEMED_GIFT_TOKEN)
            player:delKeyItem(xi.keyItem.BELL_THEMED_GIFT_TOKEN)
            player:delKeyItem(xi.keyItem.STAR_THEMED_GIFT_TOKEN)
        else
            player:messageSpecial(id.text.DEFAULT_CANNOT_BE_OBTAINED)
            return
        end
    end
end

-------------------------------------
-- Smilebringer Bootcamp Sub-Quest --
-------------------------------------

function smileBringerSergeantOnTrigger(player, npc)
    local elapsedTime = (os.time() - player:getLocalVar("bootCampStarted"))
    local playerPoint = player:getLocalVar("playerBCCP")
    local completedDay = player:getCharVar("dayOfCompletedRace")
    local currentDay = VanadielDayOfTheWeek()
    local gil = player:getGil()
    local hasTree = player:hasItem(138)
    local recordHolderID = npc:getLocalVar("recordHolderID")
    local recordHolderName = ""
    local recordTime = 0
    local entry = 600
    local qualifyingTime = 540

    if recordHolderID ~= 0 then
        recordHolderName = GetPlayerByID(recordHolderID):getName()
        recordTime = npc:getLocalVar("recordTime")
    else
        recordHolderName = "Smilebringer"
        recordTime = 270
    end

    if completedDay ~= currentDay then
        if (gil >= 600) then
            if playerPoint ~= 0 then
                if playerPoint == 10 then
                    if (elapsedTime >= 540) then
                        player:startEvent(7011, elapsedTime, 10, 0, 35, 240, 17695260, 600, 0)
                    elseif (elapsedTime > recordTime and elapsedTime <= 540) then -- qualifying time
                        if hasTree == true then
                            player:startEvent(7005, elapsedTime, 5622, 0, 44519, -412436, 28, 1, 1)
                        else
                            player:startEvent(7005, elapsedTime, 138, 0, 44519, -412436, 28, 1, 1)
                        end
                    elseif (elapsedTime < recordTime) then -- new record
                        if hasTree == true then
                            player:startEvent(7005, elapsedTime, 5622, 0, 44519, -412436, 28, 1, 5)
                        else
                            player:startEvent(7005, elapsedTime, 138, 0, 44519, -412436, 28, 1, 5)
                        end
                        npc:setLocalVar("recordHolderID", player:getID())
                        npc:setLocalVar("recordTime", elapsedTime)
                    end
                else
                    player:startEvent(7004)
                end
            else
                player:startEventString(7001, recordHolderName, recordHolderName, recordHolderName, recordHolderName, 0, 0, 0, 1, recordTime, qualifyingTime, entry, 386)
            end
        else
            player:startEventString(7001, recordHolderName, recordHolderName, recordHolderName, recordHolderName, 0, 0, 0, 0, recordTime, qualifyingTime, entry, 386)
        end
    else
        player:startEventString(7001, recordHolderName, recordHolderName, recordHolderName, recordHolderName, 0, 1, 0, 0, recordTime, qualifyingTime, entry, 386)
    end
end

function smileBringerSergeantOnFinish(player, npc, id, csid, option)
    if csid == 7001 and option == 2 then
        local zoneid = player:getZoneID()
        player:delGil(600)
        player:showText(npc, id.text.SMILEBRINGER_START)
        player:setLocalVar("bootCampStarted", os.time())
        player:setLocalVar("playerBCCP", 1)
        toggleSmileHelpers(zoneid)
    elseif csid == 7005 then
        local hasItem = player:hasItem(138)
        if hasItem == true then
            player:resetLocalVars()
            player:setCharVar("dayOfCompletedRace", VanadielDayOfTheWeek())
            npcUtil.giveItem(player, 5622, {silent = true})
            if not player:hasKeyItem(xi.keyItem.BELL_THEMED_GIFT_TOKEN) then
                player:addKeyItem(xi.keyItem.BELL_THEMED_GIFT_TOKEN)
                player:messageSpecial(id.text.KEYITEM_OBTAINED, xi.keyItem.BELL_THEMED_GIFT_TOKEN)
            end
        else
            player:resetLocalVars()
            player:setCharVar("dayOfCompletedRace", VanadielDayOfTheWeek())
            npcUtil.giveItem(player, 138, {silent = true})
        end
    elseif csid == 7011 then
        player:resetLocalVars()
    end
end

function smileHelperTrigger(player, npc, id)
    local npcID = tostring(npc:getID())
    local playerTime = player:getLocalVar("bootCampStarted")
    local playerPoint = player:getLocalVar("playerBCCP")
    local npcPoint = player:getLocalVar("Checkpoint" .. npcID)
    local missedFlee = player:getLocalVar("missedFlee")
    local seconds = math.fmod(os.time() - playerTime, 60)
    local minutes = math.floor((os.time() - playerTime) / 60)

    if playerTime ~= 0 then
        if playerPoint ~= 0 then
            if (npcPoint == 0 and playerPoint ~= 10) then
                player:setLocalVar("playerBCCP", playerPoint + 1)
                player:setLocalVar("Checkpoint" .. npcID, 1)
                if player:getStatusEffect(xi.effect.FLEE) ~= nil or playerPoint == 0 or missedFlee == 0 then
                    player:setLocalVar("missedFlee", 0)
                    player:showText(npc, id.text.SMILEHELPER_CHECKPOINT_2, 0, playerPoint, minutes, seconds)
                    player:addStatusEffect(xi.effect.FLEE, 100, 0, 30)
                else
                    local rnd = math.random(0, 1)
                    if rnd ~= 3 then
                        player:setLocalVar("missedFlee", 1)
                        player:showText(npc, id.text.SMILEHELPER_CHECKPOINT_1, 0, playerPoint, minutes, seconds)
                    else
                        player:setLocalVar("missedFlee", 0)
                        player:showText(npc, id.text.SMILEHELPER_CHECKPOINT_2, 0, playerPoint, minutes, seconds)
                        player:addStatusEffect(xi.effect.FLEE, 100, 0, 30)
                    end
                end
            elseif playerPoint == 10 then
                player:showText(npc, id.text.SMILEHELPER_POINTS_CLEARED)
                player:addStatusEffect(xi.effect.FLEE, 100, 0, 30)
            elseif npcPoint ~= 0 then
                player:showText(npc, id.text.SMILEHELPER_ALREADY_VISITED, 0, playerPoint, minutes, seconds)
            end
        end
    else
        player:showText(npc, ID.text.SMILEHELPER_IDLE)
    end
end

----------------------------------------------------------------
-- Apply Zone Decorations, Vendors, and Additional Event NPCs --
----------------------------------------------------------------
function applyStarlightDecorations(zoneid)
    if isStarlightEnabled() ~= 0 then
        local decoration = zones[zoneid].npc.STARLIGHT_DECORATIONS
        if decoration then
            for id, decoration in pairs(decoration) do
                local npc = GetNPCByID(id)
                if npc then
                    npc:setStatus(xi.status.NORMAL)
                    --local npcstatus = npc:getStatus()
                end
            end
        end
    end
end

function toggleSmileHelpers(zoneid)
    if isStarlightEnabled() ~= 0 then
        local smileHelper = zones[zoneid].npc.SMILE_HELPERS
        if smileHelper then
            for id, smileHelper in pairs(smileHelper) do
                local npc = GetNPCByID(id)
                if npc then
                    npc:setStatus(xi.status.NORMAL)
                    npc:setLocalVar("depopTime", (os.clock() + 3600))
                end
            end
        end
    end
end

function resetSmileHelpers(zoneid)
    if isStarlightEnabled() ~= 0 then
        local smileHelper = zones[zoneid].npc.SMILE_HELPERS
        if smileHelper then
            for id, smileHelper in pairs(smileHelper) do
                local npc = GetNPCByID(id)
                local depopTime = npc:getLocalVar("depopTime")
                if depopTime < os.clock() then
                    npc:setStatus(xi.status.DISAPPEAR)
                end
            end
        end
    end
end

----------------------------------
-- Goblin Merrymakers Sub-Quest --
----------------------------------

local merryMakersBastok =
{
    [17739906] =
    {
        { x = -276.000, y = -12.020, z = -89.000, wait = 0 },
        { x = -266.000, y = -12.020, z = -86.000, wait = 0 },
        { x = -258.000, y = -12.020, z = -79.000, wait = 0 },
        { x = -255.000, y = -12.020, z = -68.000, wait = 0 },
        { x = -258.000, y = -12.020, z = -57.000, wait = 0 },
        { x = -265.000, y = -12.020, z = -49.000, wait = 0 },
        { x = -276.000, y = -12.020, z = -47.000, wait = 0 },
        { x = -324.000, y = -12.000, z = -33.000, wait = 0 },
        { x = -307.000, y = -15.013, z = -46.000, wait = 0 },
        { x = -322.000, y = -12.000, z = -53.000, wait = 0 },
        { x = -319.000, y = -15.000, z = -66.000, wait = 0 },
        { x = -322.000, y = -15.000, z = -83.000, wait = 0 },
        { x = -297.000, y = -15.000, z = -87.000, wait = 0 },
    },
    [17739907] =
    {
        { x = -266.000, y = -12.020, z = -86.000, wait = 0 },
        { x = -258.000, y = -12.020, z = -79.000, wait = 0 },
        { x = -255.000, y = -12.020, z = -68.000, wait = 0 },
        { x = -258.000, y = -12.020, z = -57.000, wait = 0 },
        { x = -265.000, y = -12.020, z = -49.000, wait = 0 },
        { x = -276.000, y = -12.020, z = -47.000, wait = 0 },
        { x = -287.000, y = -12.020, z = -49.000, wait = 0 },
        { x = -294.000, y = -12.020, z = -57.000, wait = 0 },
        { x = -297.000, y = -12.020, z = -68.000, wait = 0 },
        { x = -295.000, y = -12.020, z = -78.000, wait = 0 },
        { x = -281.000, y = -12.000, z = -97.000, wait = 0 },
        { x = -280.000, y = -12.000, z = -106.000, wait = 0 },
        { x = -294.000, y = -12.000, z = -115.000, wait = 0 },
        { x = -343.000, y = -10.000, z = -163.000, wait = 0 },
        { x = -294.000, y = -12.000, z = -115.000, wait = 0 },
        { x = -280.000, y = -10.000, z = -106.000, wait = 0 },
        { x = -281.000, y = -12.000, z = -97.000, wait = 0 },
    },
    [17739908] =
    {
        { x = -258.000, y = -12.020, z = -79.000, wait = 0 },
        { x = -255.000, y = -12.020, z = -68.000, wait = 0 },
        { x = -258.000, y = -12.020, z = -57.000, wait = 0 },
        { x = -265.000, y = -12.020, z = -49.000, wait = 0 },
        { x = -276.000, y = -12.020, z = -47.000, wait = 0 },
        { x = -287.000, y = -12.020, z = -49.000, wait = 0 },
        { x = -294.000, y = -12.020, z = -57.000, wait = 0 },
        { x = -297.000, y = -12.020, z = -68.000, wait = 0 },
        { x = -295.000, y = -12.020, z = -78.000, wait = 0 },
        { x = -286.000, y = -12.020, z = -86.000, wait = 0 },
        { x = -281.000, y = -12.000, z = -97.000, wait = 0 },
        { x = -280.000, y = -12.000, z = -106.000, wait = 0 },
        { x = -249.000, y = -12.000, z = -121.000, wait = 0 },
        { x = -237.000, y = -12.000, z = -120.000, wait = 0 },
        { x = -198.000, y = -12.000, z = -95.000, wait = 0 },
        { x = -196.000, y = -12.000, z = -72.000, wait = 0 },
        { x = -242.000, y = -12.000, z = -73.000, wait = 0 },
        { x = -242.000, y = -12.000, z = -58.000, wait = 0 },
        { x = -249.000, y = -12.000, z = -58.000, wait = 0 },
    },
    [17739909] =
    {
        { x = -255.000, y = -12.020, z = -68.000, wait = 0 },
        { x = -258.000, y = -12.020, z = -57.000, wait = 0 },
        { x = -265.000, y = -12.020, z = -49.000, wait = 0 },
        { x = -276.000, y = -12.020, z = -47.000, wait = 0 },
        { x = -287.000, y = -12.020, z = -49.000, wait = 0 },
        { x = -294.000, y = -12.020, z = -57.000, wait = 0 },
        { x = -297.000, y = -12.020, z = -68.000, wait = 0 },
        { x = -295.000, y = -12.020, z = -78.000, wait = 0 },
        { x = -286.000, y = -12.020, z = -86.000, wait = 0 },
        { x = -276.000, y = -12.020, z = -89.000, wait = 0 },
        { x = -266.000, y = -12.020, z = -86.000, wait = 0 },
        { x = -258.000, y = -12.020, z = -79.000, wait = 0 },
        { x = -243.000, y = -12.000, z = -32.000, wait = 0 },
        { x = -200.000, y = -12.020, z = -31.000, wait = 0 },
        { x = -200.000, y = -12.020, z = 32.000, wait = 0 },
        { x = -241.000, y = -12.020, z = 32.000, wait = 0 },
        { x = -249.000, y = -12.020, z = 34.000, wait = 0 },
        { x = -253.000, y = -12.020, z = 41.000, wait = 0 },
        { x = -252.000, y = -12.020, z = 51.000, wait = 0 },
        { x = -239.000, y = -12.020, z = 52.000, wait = 0 },
        { x = -233.000, y = -12.020, z = 65.000, wait = 0 },
        { x = -209.000, y = -12.020, z = 65.000, wait = 0 },
        { x = -198.000, y = -12.020, z = 61.000, wait = 0 },
        { x = -189.000, y = -12.020, z = 60.000, wait = 0 },
        { x = -190.000, y = -12.020, z = 87.000, wait = 0 },
        { x = -210.000, y = -12.020, z = 87.000, wait = 0 },
        { x = -224.000, y = -12.020, z = 79.000, wait = 0 },
        { x = -251.000, y = -12.020, z = 79.000, wait = 0 },
        { x = -253.000, y = -12.020, z = 41.000, wait = 0 },
        { x = -249.000, y = -12.020, z = 34.000, wait = 0 },
        { x = -241.000, y = -12.020, z = 32.000, wait = 0 },
        { x = -200.000, y = -12.020, z = 32.000, wait = 0 },
        { x = -200.000, y = -12.020, z = -31.000, wait = 0 },
        { x = -243.000, y = -12.000, z = -32.000, wait = 0 },
    },
    [17739910] =
    {
        { x = -258.000, y = -12.020, z = -57.000, wait = 0 },
        { x = -243.000, y = -12.000, z = -58.000, wait = 0 },
        { x = -242.000, y = -12.000, z = -74.000, wait = 0 },
        { x = -198.000, y = -12.000, z = -72.000, wait = 0 },
        { x = -172.000, y = -12.000, z = -77.000, wait = 0 },
        { x = -128.000, y = -12.000, z = -97.000, wait = 0 },
        { x = -69.000, y = -12.000, z = -97.000, wait = 0 },
        { x = -53.000, y = -12.000, z = -82.000, wait = 0 },
        { x = -57.000, y = -12.000, z = -61.000, wait = 0 },
        { x = -53.000, y = -12.000, z = -82.000, wait = 0 },
        { x = -69.000, y = -12.000, z = -97.000, wait = 0 },
        { x = -128.000, y = -12.000, z = -97.000, wait = 0 },
        { x = -172.000, y = -12.000, z = -77.000, wait = 0 },
        { x = -198.000, y = -12.000, z = -71.000, wait = 0 },
        { x = -242.000, y = -12.000, z = -74.000, wait = 0 },
        { x = -243.000, y = -12.000, z = -58.000, wait = 0 },
        { x = -258.000, y = -12.020, z = -57.000, wait = 0 },
        { x = -265.000, y = -12.020, z = -49.000, wait = 0 },
        { x = -276.000, y = -12.020, z = -47.000, wait = 0 },
        { x = -287.000, y = -12.020, z = -49.000, wait = 0 },
        { x = -294.000, y = -12.020, z = -57.000, wait = 0 },
        { x = -297.000, y = -12.020, z = -68.000, wait = 0 },
        { x = -295.000, y = -12.020, z = -78.000, wait = 0 },
        { x = -286.000, y = -12.020, z = -86.000, wait = 0 },
        { x = -276.000, y = -12.020, z = -89.000, wait = 0 },
        { x = -266.000, y = -12.020, z = -86.000, wait = 0 },
        { x = -258.000, y = -12.020, z = -79.000, wait = 0 },
        { x = -255.000, y = -12.020, z = -68.000, wait = 0 },
    },
    [17739911] =
    {
        { x = -265.000, y = -12.020, z = -49.000, wait = 0 },
        { x = -276.000, y = -12.020, z = -47.000, wait = 0 },
        { x = -287.000, y = -12.020, z = -49.000, wait = 0 },
        { x = -294.000, y = -12.020, z = -57.000, wait = 0 },
        { x = -297.000, y = -12.020, z = -68.000, wait = 0 },
        { x = -295.000, y = -12.020, z = -78.000, wait = 0 },
        { x = -286.000, y = -12.020, z = -86.000, wait = 0 },
        { x = -276.000, y = -12.020, z = -89.000, wait = 0 },
        { x = -279.000, y = -12.000, z = -97.000, wait = 0 },
        { x = -279.000, y = -12.000, z = -108.000, wait = 0 },
        { x = -264.000, y = -12.000, z = -116.000, wait = 0 },
        { x = -249.000, y = -12.000, z = -121.000, wait = 0 },
        { x = -235.000, y = -12.000, z = -120.000, wait = 0 },
        { x = -205.000, y = -12.000, z = -105.000, wait = 0 },
        { x = -201.000, y = -12.000, z = -119.000, wait = 0 },
        { x = -200.000, y = -12.000, z = -145.000, wait = 0 },
        { x = -185.000, y = -12.000, z = -138.000, wait = 0 },
        { x = -173.000, y = -12.000, z = -124.000, wait = 0 },
        { x = -141.000, y = -12.000, z = -137.000, wait = 0 },
        { x = -123.000, y = -12.000, z = -144.000, wait = 0 },
        { x = -110.000, y = -12.000, z = -144.000, wait = 0 },
        { x = -108.000, y = -12.000, z = -120.000, wait = 0 },
        { x = -127.000, y = -12.000, z = -117.000, wait = 0 },
        { x = -168.000, y = -12.000, z = -97.500, wait = 0 },
        { x = -175.000, y = -12.000, z = -94.000, wait = 0 },
        { x = -189.000, y = -12.000, z = -93.000, wait = 0 },
        { x = -224.000, y = -12.000, z = -115.000, wait = 0 },
        { x = -238.000, y = -12.000, z = -121.000, wait = 0 },
        { x = -262.000, y = -12.000, z = -117.000, wait = 0 },
        { x = -279.000, y = -12.000, z = -108.000, wait = 0 },
        { x = -279.000, y = -12.000, z = -97.000, wait = 0 },
        { x = -276.000, y = -12.020, z = -89.000, wait = 0 },
        { x = -266.000, y = -12.020, z = -86.000, wait = 0 },
        { x = -258.000, y = -12.020, z = -79.000, wait = 0 },
        { x = -255.000, y = -12.020, z = -68.000, wait = 0 },
        { x = -258.000, y = -12.020, z = -57.000, wait = 0 },
    },
    [17739912] =
    {
        { x = -276.000, y = -12.020, z = -47.000, wait = 0 },
        { x = -287.000, y = -12.020, z = -49.000, wait = 0 },
        { x = -294.000, y = -12.020, z = -57.000, wait = 0 },
        { x = -297.000, y = -12.020, z = -68.000, wait = 0 },
        { x = -295.000, y = -12.020, z = -78.000, wait = 0 },
        { x = -286.000, y = -12.020, z = -86.000, wait = 0 },
        { x = -276.000, y = -12.020, z = -89.000, wait = 4000 },
        { x = -266.000, y = -12.020, z = -86.000, wait = 0 },
        { x = -258.000, y = -12.020, z = -79.000, wait = 0 },
        { x = -255.000, y = -12.020, z = -68.000, wait = 0 },
        { x = -243.000, y = -12.000, z = -32.000, wait = 0 },
        { x = -200.000, y = -12.020, z = -31.000, wait = 0 },
        { x = -200.000, y = -12.020, z = 32.000, wait = 0 },
        { x = -241.000, y = -12.020, z = 32.000, wait = 0 },
        { x = -249.000, y = -12.020, z = 34.000, wait = 0 },
        { x = -253.000, y = -12.020, z = 41.000, wait = 0 },
        { x = -252.000, y = -12.020, z = 51.000, wait = 0 },
        { x = -239.000, y = -12.020, z = 52.000, wait = 0 },
        { x = -233.000, y = -12.020, z = 65.000, wait = 0 },
        { x = -209.000, y = -12.020, z = 65.000, wait = 0 },
        { x = -198.000, y = -12.020, z = 61.000, wait = 0 },
        { x = -189.000, y = -12.020, z = 60.000, wait = 0 },
        { x = -190.000, y = -12.020, z = 87.000, wait = 0 },
        { x = -210.000, y = -12.020, z = 87.000, wait = 0 },
        { x = -224.000, y = -12.020, z = 79.000, wait = 0 },
        { x = -251.000, y = -12.020, z = 79.000, wait = 0 },
        { x = -253.000, y = -12.020, z = 41.000, wait = 0 },
        { x = -249.000, y = -12.020, z = 34.000, wait = 0 },
        { x = -241.000, y = -12.020, z = 32.000, wait = 0 },
        { x = -200.000, y = -12.020, z = 32.000, wait = 0 },
        { x = -200.000, y = -12.020, z = -31.000, wait = 0 },
        { x = -243.000, y = -12.000, z = -32.000, wait = 0 },
    },
    [17739913] =
    {
        { x = -287.000, y = -12.020, z = -49.000, wait = 0 },
        { x = -294.000, y = -12.020, z = -57.000, wait = 0 },
        { x = -297.000, y = -12.020, z = -68.000, wait = 0 },
        { x = -295.000, y = -12.020, z = -78.000, wait = 0 },
        { x = -286.000, y = -12.020, z = -86.000, wait = 0 },
        { x = -280.000, y = -12.000, z = -106.000, wait = 0 },
        { x = -292.000, y = -12.000, z = -113.000, wait = 4000 },
        { x = -328.000, y = -12.000, z = -147.000, wait = 0 },
        { x = -311.000, y = -16.000, z = -164.000, wait = 0 },
        { x = -328.000, y = -16.000, z = -147.000, wait = 0 },
        { x = -292.000, y = -12.000, z = -113.000, wait = 0 },
        { x = -280.000, y = -12.000, z = -106.000, wait = 0 },
        { x = -276.000, y = -12.020, z = -89.000, wait = 0 },
        { x = -266.000, y = -12.020, z = -86.000, wait = 0 },
        { x = -258.000, y = -12.020, z = -79.000, wait = 0 },
        { x = -255.000, y = -12.020, z = -68.000, wait = 0 },
        { x = -258.000, y = -12.020, z = -57.000, wait = 0 },
        { x = -265.000, y = -12.020, z = -49.000, wait = 0 },
        { x = -276.000, y = -12.020, z = -47.000, wait = 0 },

    },
    [17739914] =
    {
        { x = -294.000, y = -12.020, z = -57.000, wait = 0 },
        { x = -297.000, y = -12.020, z = -68.000, wait = 0 },
        { x = -295.000, y = -12.020, z = -78.000, wait = 0 },
        { x = -286.000, y = -12.020, z = -86.000, wait = 0 },
        { x = -276.000, y = -12.020, z = -89.000, wait = 0 },
        { x = -266.000, y = -12.020, z = -86.000, wait = 0 },
        { x = -258.000, y = -12.020, z = -79.000, wait = 4000 },
        { x = -255.000, y = -12.020, z = -68.000, wait = 0 },
        { x = -243.000, y = -12.000, z = -32.000, wait = 0 },
        { x = -178.000, y = -12.000, z = -30.000, wait = 0 },
        { x = -243.000, y = -12.000, z = -32.000, wait = 0 },
        { x = -287.000, y = -12.020, z = -49.000, wait = 0 },
    },
    [17739915] =
    {
        { x = -297.000, y = -12.020, z = -68.000, wait = 0 },
        { x = -295.000, y = -12.020, z = -78.000, wait = 0 },
        { x = -286.000, y = -12.020, z = -86.000, wait = 0 },
        { x = -279.000, y = -12.000, z = -108.000, wait = 0 },
        { x = -264.000, y = -12.000, z = -116.000, wait = 0 },
        { x = -249.000, y = -12.000, z = -121.000, wait = 0 },
        { x = -235.000, y = -12.000, z = -120.000, wait = 0 },
        { x = -205.000, y = -12.000, z = -105.000, wait = 0 },
        { x = -201.000, y = -12.000, z = -119.000, wait = 0 },
        { x = -200.000, y = -12.000, z = -145.000, wait = 0 },
        { x = -202.000, y = -12.000, z = -180.000, wait = 0 },
        { x = -200.000, y = -12.000, z = -145.000, wait = 0 },
        { x = -201.000, y = -12.000, z = -119.000, wait = 0 },
        { x = -205.000, y = -12.000, z = -105.000, wait = 0 },
        { x = -235.000, y = -12.000, z = -120.000, wait = 0 },
        { x = -249.000, y = -12.000, z = -121.000, wait = 0 },
        { x = -264.000, y = -12.000, z = -116.000, wait = 0 },
        { x = -279.000, y = -12.000, z = -108.000, wait = 0 },
        { x = -276.000, y = -12.020, z = -89.000, wait = 0 },
        { x = -266.000, y = -12.020, z = -86.000, wait = 0 },
        { x = -258.000, y = -12.020, z = -79.000, wait = 0 },
        { x = -255.000, y = -12.020, z = -68.000, wait = 0 },
        { x = -258.000, y = -12.020, z = -57.000, wait = 0 },
        { x = -265.000, y = -12.020, z = -49.000, wait = 0 },
        { x = -276.000, y = -12.020, z = -47.000, wait = 0 },
        { x = -287.000, y = -12.020, z = -49.000, wait = 0 },
        { x = -294.000, y = -12.020, z = -57.000, wait = 0 },
    },
}

local merryMakersSandoria =
{
    [17723615] = -- 1st position
    {
        { x = 0.046, y = 0.000, z = 20.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 20.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 34.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 46.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 58.000, wait = 0 },
        { x = 0.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 58.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 20.000, wait = 0 },
        { x = 0.046, y = 0.000, z = 20.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 20.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 40.000, wait = 0 },
        { x = 50.000, y = 0.000, z = 40.000, wait = 0 },
        { x = 102.000, y = 0.000, z = 95.000, wait = 0 },
        { x = 50.000, y = 0.000, z = 40.000, wait = 0 },
        { x = 100.000, y = 0.000, z = -8.000, wait = 0 },
        { x = 50.000, y = 0.000, z = 40.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 40.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 46.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 58.000, wait = 0 },
        { x = 0.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 58.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 46.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 34.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 20.000, wait = 0 },
    },
    [17723616] = -- 2nd position
    {
        { x = 18.000, y = 0.000, z = 20.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 34.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 46.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 58.000, wait = 0 },
        { x = 0.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 58.000, wait = 0 },
        { x = -21.000, y = 0.000, z = 53.000, wait = 0 },
        { x = -29.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -82.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -88.000, y = 0.000, z = 64.000, wait = 0 },
        { x = -98.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -112.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -152.000, y = 0.000, z = 102.000, wait = 0 },
        { x = -151.000, y = 0.000, z = 126.000, wait = 0 },
        { x = -175.000, y = 0.000, z = 140.000, wait = 0 },
        { x = -175.000, y = 0.000, z = 177.000, wait = 0 },
        { x = -168.000, y = 0.000, z = 188.000, wait = 0 },
        { x = -168.000, y = 0.000, z = 210.000, wait = 0 },
        { x = -128.000, y = 0.000, z = 209.000, wait = 0 },
        { x = -116.000, y = 0.000, z = 198.000, wait = 0 },
        { x = -128.000, y = 0.000, z = 185.000, wait = 0 },
        { x = -123.000, y = 0.000, z = 180.000, wait = 0 },
        { x = -124.000, y = 0.000, z = 140.000, wait = 0 },
        { x = -138.000, y = 0.000, z = 127.000, wait = 0 },
        { x = -151.000, y = 0.000, z = 126.000, wait = 0 },
        { x = -152.000, y = 0.000, z = 102.000, wait = 0 },
        { x = -112.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -98.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -88.000, y = 0.000, z = 64.000, wait = 0 },
        { x = -82.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -29.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -21.000, y = 0.000, z = 53.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 46.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 34.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 20.000, wait = 0 },
        { x = 0.046, y = 0.000, z = 20.000, wait = 0 },
    },
    [17723617] = -- 3rd position
    {
        { x = 18.000, y = 0.000, z = 34.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 46.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 58.000, wait = 0 },
        { x = 0.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 58.000, wait = 0 },
        { x = -21.000, y = 0.000, z = 53.000, wait = 0 },
        { x = -29.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -82.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -88.000, y = 0.000, z = 64.000, wait = 0 },
        { x = -98.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -112.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -152.000, y = 0.000, z = 102.000, wait = 0 },
        { x = -151.000, y = 0.000, z = 126.000, wait = 0 },
        { x = -142.000, y = 0.000, z = 135.000, wait = 0 },
        { x = -132.000, y = 0.000, z = 146.000, wait = 0 },
        { x = -133.000, y = 0.000, z = 177.000, wait = 0 },
        { x = -144.000, y = 0.000, z = 189.000, wait = 0 },
        { x = -131.000, y = 0.000, z = 215.000, wait = 0 },
        { x = -130.000, y = 0.000, z = 253.000, wait = 0 },
        { x = -155.000, y = 0.000, z = 261.000, wait = 0 },
        { x = -165.000, y = 0.000, z = 270.000, wait = 0 },
        { x = -155.000, y = 0.000, z = 261.000, wait = 0 },
        { x = -130.000, y = 0.000, z = 253.000, wait = 0 },
        { x = -131.000, y = 0.000, z = 215.000, wait = 0 },
        { x = -144.000, y = 0.000, z = 189.000, wait = 0 },
        { x = -133.000, y = 0.000, z = 177.000, wait = 0 },
        { x = -132.000, y = 0.000, z = 146.000, wait = 0 },
        { x = -142.000, y = 0.000, z = 135.000, wait = 0 },
        { x = -151.000, y = 0.000, z = 126.000, wait = 0 },
        { x = -152.000, y = 0.000, z = 102.000, wait = 0 },
        { x = -112.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -98.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -88.000, y = 0.000, z = 64.000, wait = 0 },
        { x = -82.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -29.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -21.000, y = 0.000, z = 53.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 46.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 34.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 20.000, wait = 0 },
        { x = 0.046, y = 0.000, z = 20.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 20.000, wait = 0 },
    },
    [17723618] = -- 4th posision
    {
        { x = 18.000, y = 0.000, z = 46.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 58.000, wait = 0 },
        { x = 0.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 58.000, wait = 0 },
        { x = -21.000, y = 0.000, z = 53.000, wait = 0 },
        { x = -29.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -82.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -88.000, y = 0.000, z = 64.000, wait = 0 },
        { x = -98.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -112.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -152.000, y = 0.000, z = 102.000, wait = 0 },
        { x = -151.000, y = 0.000, z = 126.000, wait = 0 },
        { x = -175.000, y = 0.000, z = 136.000, wait = 0 },
        { x = -176.000, y = 0.000, z = 146.000, wait = 0 },
        { x = -175.000, y = 0.000, z = 177.000, wait = 0 },
        { x = -168.000, y = 0.000, z = 186.000, wait = 0 },
        { x = -167.000, y = 0.000, z = 226.000, wait = 0 },
        { x = -172.000, y = 0.000, z = 232.000, wait = 0 },
        { x = -173.000, y = 0.000, z = 257.000, wait = 0 },
        { x = -151.000, y = 0.000, z = 278.000, wait = 0 },
        { x = -162.000, y = 0.000, z = 268.000, wait = 0 },
        { x = -167.000, y = 0.000, z = 273.000, wait = 0 },
        { x = -172.000, y = 0.000, z = 268.000, wait = 0 },
        { x = -167.000, y = 0.000, z = 273.000, wait = 0 },
        { x = -162.000, y = 0.000, z = 268.000, wait = 0 },
        { x = -151.000, y = 0.000, z = 278.000, wait = 0 },
        { x = -173.000, y = 0.000, z = 257.000, wait = 0 },
        { x = -172.000, y = 0.000, z = 232.000, wait = 0 },
        { x = -167.000, y = 0.000, z = 226.000, wait = 0 },
        { x = -168.000, y = 0.000, z = 186.000, wait = 0 },
        { x = -175.000, y = 0.000, z = 177.000, wait = 0 },
        { x = -176.000, y = 0.000, z = 146.000, wait = 0 },
        { x = -175.000, y = 0.000, z = 136.000, wait = 0 },
        { x = -151.000, y = 0.000, z = 126.000, wait = 0 },
        { x = -152.000, y = 0.000, z = 102.000, wait = 0 },
        { x = -112.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -98.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -88.000, y = 0.000, z = 64.000, wait = 0 },
        { x = -82.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -29.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -21.000, y = 0.000, z = 53.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 46.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 34.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 20.000, wait = 0 },
        { x = 0.046, y = 0.000, z = 20.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 20.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 34.000, wait = 0 },
    },
    [17723619] = -- 5th position
    {
        { x = 18.000, y = 0.000, z = 58.000, wait = 0 },
        { x = 0.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 58.000, wait = 0 },
        { x = -21.000, y = 0.000, z = 53.000, wait = 0 },
        { x = -29.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -82.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -88.000, y = 0.000, z = 64.000, wait = 0 },
        { x = -98.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -112.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -152.000, y = 0.000, z = 102.000, wait = 0 },
        { x = -151.000, y = 0.000, z = 126.000, wait = 0 },
        { x = -134.000, y = 0.000, z = 129.000, wait = 0 },
        { x = -123.000, y = 0.000, z = 140.000, wait = 0 },
        { x = -124.000, y = 0.000, z = 180.000, wait = 0 },
        { x = -133.000, y = 0.000, z = 187.000, wait = 0 },
        { x = -167.000, y = 0.000, z = 188.000, wait = 0 },
        { x = -175.000, y = 0.000, z = 177.000, wait = 0 },
        { x = -176.000, y = 0.000, z = 142.000, wait = 0 },
        { x = -152.000, y = 0.000, z = 126.000, wait = 0 },
        { x = -152.000, y = 0.000, z = 102.000, wait = 0 },
        { x = -112.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -98.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -88.000, y = 0.000, z = 64.000, wait = 0 },
        { x = -82.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -29.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -21.000, y = 0.000, z = 53.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 46.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 34.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 20.000, wait = 0 },
        { x = 0.046, y = 0.000, z = 20.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 20.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 34.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 46.000, wait = 0 },
    },
    [17723620] = -- 6th position
    {
        { x = 0.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 58.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 46.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 34.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 20.000, wait = 0 },
        { x = 0.046, y = 0.000, z = 20.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 20.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 34.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 46.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 58.000, wait = 0 },
        { x = 0.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 58.000, wait = 0 },
        { x = -21.000, y = 0.000, z = 53.000, wait = 0 },
        { x = -29.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -82.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -88.000, y = 0.000, z = 64.000, wait = 0 },
        { x = -98.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -112.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -150.000, y = 0.000, z = 102.000, wait = 0 },
        { x = -178.000, y = 0.000, z = 102.000, wait = 0 },
        { x = -179.000, y = 0.000, z = 76.000, wait = 0 },
        { x = -239.000, y = 0.000, z = 74.000, wait = 0 },
        { x = -230.000, y = 0.000, z = 50.000, wait = 0 },
        { x = -238.000, y = 0.000, z = 16.000, wait = 0 },
        { x = -223.000, y = 0.000, z = 15.000, wait = 0 },
        { x = -230.000, y = 0.000, z = 50.000, wait = 0 },
        { x = -239.000, y = 0.000, z = 74.000, wait = 0 },
        { x = -179.000, y = 0.000, z = 76.000, wait = 0 },
        { x = -178.000, y = 0.000, z = 102.000, wait = 0 },
        { x = -159.000, y = 0.000, z = 102.000, wait = 0 },
        { x = -112.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -98.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -88.000, y = 0.000, z = 64.000, wait = 0 },
        { x = -82.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -29.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -21.000, y = 0.000, z = 53.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 46.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 34.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 20.000, wait = 0 },
        { x = 0.046, y = 0.000, z = 20.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 20.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 34.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 46.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 58.000, wait = 0 },
    },
    [17723621] = -- 7th position
    {
        { x = -18.000, y = 0.000, z = 58.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 46.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 34.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 20.000, wait = 0 },
        { x = 0.046, y = 0.000, z = 20.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 20.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 34.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 46.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 58.000, wait = 0 },
        { x = 0.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 58.000, wait = 0 },
        { x = -21.000, y = 0.000, z = 53.000, wait = 0 },
        { x = -29.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -82.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -88.000, y = 0.000, z = 64.000, wait = 0 },
        { x = -98.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -112.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -150.000, y = 0.000, z = 102.000, wait = 0 },
        { x = -178.000, y = 0.000, z = 102.000, wait = 0 },
        { x = -179.000, y = 0.000, z = 76.000, wait = 0 },
        { x = -239.000, y = 0.000, z = 74.000, wait = 0 },
        { x = -230.000, y = 0.000, z = 50.000, wait = 0 },
        { x = -238.000, y = 0.000, z = 16.000, wait = 0 },
        { x = -223.000, y = 0.000, z = 15.000, wait = 0 },
        { x = -230.000, y = 0.000, z = 50.000, wait = 0 },
        { x = -239.000, y = 0.000, z = 74.000, wait = 0 },
        { x = -179.000, y = 0.000, z = 76.000, wait = 0 },
        { x = -178.000, y = 0.000, z = 102.000, wait = 0 },
        { x = -159.000, y = 0.000, z = 102.000, wait = 0 },
        { x = -112.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -98.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -88.000, y = 0.000, z = 64.000, wait = 0 },
        { x = -82.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -29.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -21.000, y = 0.000, z = 53.000, wait = 0 },
    },
    [17723622] = -- 8th position
    {
        { x = -18.000, y = 0.000, z = 46.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 34.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 20.000, wait = 0 },
        { x = 0.046, y = 0.000, z = 20.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 20.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 40.000, wait = 0 },
        { x = 50.000, y = 0.000, z = 40.000, wait = 0 },
        { x = 102.000, y = 0.000, z = 95.000, wait = 0 },
        { x = 50.000, y = 0.000, z = 40.000, wait = 0 },
        { x = 100.000, y = 0.000, z = -8.000, wait = 0 },
        { x = 50.000, y = 0.000, z = 40.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 40.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 46.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 58.000, wait = 0 },
        { x = 0.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 58.000, wait = 0 },
    },
    [17723623] = -- 9th position
    {
        { x = -18.000, y = 0.000, z = 34.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 20.000, wait = 0 },
        { x = 0.046, y = 0.000, z = 20.000, wait = 0 },
        { x = 0.046, y = 0.000, z = -20.000, wait = 0 },
        { x = 0.046, y = 0.000, z = -15.000, wait = 0 },
        { x = -17.000, y = 0.000, z = -15.000, wait = 0 },
        { x = 0.046, y = 0.000, z = -15.000, wait = 0 },
        { x = 0.046, y = 0.000, z = -20.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 20.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 40.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 58.000, wait = 0 },
        { x = 0.000, y = 0.000, z = 60.000, wait = 0 },
        { x = 0.000, y = 0.000, z = 96.000, wait = 0 },
        { x = 0.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 58.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 46.000, wait = 0 },
    },
    [17723624] = -- 10th position
    {
        { x = -18.000, y = 0.000, z = 20.000, wait = 0 },
        { x = 0.046, y = 0.000, z = 20.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 20.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 40.000, wait = 0 },
        { x = 50.000, y = 0.000, z = 40.000, wait = 0 },
        { x = 102.000, y = 0.000, z = 95.000, wait = 0 },
        { x = 50.000, y = 0.000, z = 40.000, wait = 0 },
        { x = 100.000, y = 0.000, z = -8.000, wait = 0 },
        { x = 50.000, y = 0.000, z = 40.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 40.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 46.000, wait = 0 },
        { x = 18.000, y = 0.000, z = 58.000, wait = 0 },
        { x = 0.000, y = 0.000, z = 60.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 58.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 46.000, wait = 0 },
        { x = -18.000, y = 0.000, z = 34.000, wait = 0 },
    },
}

local merryMakersWindurst =
{
    [17752302] =
    {
        { x = -13.000, y = -11.000, z = 38.000, wait = 0 },
        { x = -7.000, y = -2.000, z = 38.000, wait = 0 },
        { x = -7.000, y = -11.000, z = 7.000, wait = 0 },
        { x = -8.000, y = -11.000, z = -23.000, wait = 0 },
        { x = -43.000, y = -11.000, z = -60.000, wait = 0 },
        { x = -44.000, y = -11.000, z = -73.000, wait = 0 },
        { x = -36.000, y = -11.000, z = -90.000, wait = 0 },
        { x = -36.000, y = -11.000, z = -103.000, wait = 0 },
        { x = -51.000, y = -11.000, z = -119.000, wait = 0 },
        { x = -52.000, y = -11.000, z = -164.000, wait = 0 },
        { x = -63.000, y = -11.000, z = -168.000, wait = 0 },
        { x = -71.000, y = -11.000, z = -170.000, wait = 0 },
        { x = -84.000, y = -11.000, z = -162.000, wait = 0 },
        { x = -113.000, y = -11.000, z = -163.000, wait = 0 },
        { x = -145.000, y = -11.000, z = -179.000, wait = 0 },
        { x = -172.000, y = -11.000, z = -180.000, wait = 0 },
        { x = -191.000, y = -11.000, z = -170.000, wait = 0 },
        { x = -202.000, y = -11.000, z = -174.000, wait = 0 },
        { x = -209.000, y = -11.000, z = -166.000, wait = 0 },
        { x = -220.000, y = -11.000, z = -143.000, wait = 0 },
        { x = -202.000, y = -11.000, z = -96.000, wait = 0 },
        { x = -200.000, y = -11.000, z = -81.000, wait = 0 },
        { x = -201.000, y = -11.000, z = -72.000, wait = 0 },
        { x = -200.000, y = -11.000, z = -81.000, wait = 0 },
        { x = -202.000, y = -11.000, z = -96.000, wait = 0 },
        { x = -220.000, y = -11.000, z = -143.000, wait = 0 },
        { x = -209.000, y = -11.000, z = -166.000, wait = 0 },
        { x = -202.000, y = -11.000, z = -174.000, wait = 0 },
        { x = -191.000, y = -11.000, z = -170.000, wait = 0 },
        { x = -172.000, y = -11.000, z = -180.000, wait = 0 },
        { x = -145.000, y = -11.000, z = -179.000, wait = 0 },
        { x = -113.000, y = -11.000, z = -163.000, wait = 0 },
        { x = -84.000, y = -11.000, z = -162.000, wait = 0 },
        { x = -71.000, y = -11.000, z = -170.000, wait = 0 },
        { x = -63.000, y = -11.000, z = -168.000, wait = 0 },
        { x = -52.000, y = -11.000, z = -164.000, wait = 0 },
        { x = -51.000, y = -11.000, z = -119.000, wait = 0 },
        { x = -36.000, y = -11.000, z = -103.000, wait = 0 },
        { x = -36.000, y = -11.000, z = -90.000, wait = 0 },
        { x = -44.000, y = -11.000, z = -73.000, wait = 0 },
        { x = -43.000, y = -11.000, z = -60.000, wait = 0 },
        { x = -8.000, y = -11.000, z = -23.000, wait = 0 },
        { x = -7.000, y = -11.000, z = 7.000, wait = 0 },
        { x = -7.000, y = -11.000, z = 38.000, wait = 0 },
        { x = -2.000, y = -11.000, z = 47.000, wait = 0 },
        { x = -4.000, y = -11.000, z = 86.000, wait = 0 },
        { x = -37.000, y = -11.000, z = 84.000, wait = 0 },
        { x = -39.000, y = -11.000, z = 38.000, wait = 0 },
        { x = -13.000, y = -11.000, z = 38.000, wait = 0 },
    },
    [17752303] =
    {
        { x = -32.000, y = -11.000, z = 40.000, wait = 0 },
        { x = -13.000, y = -11.000, z = 38.000, wait = 0 },
        { x = -7.000, y = -2.000, z = 38.000, wait = 0 },
        { x = -7.000, y = -2.000, z = 7.000, wait = 0 },
        { x = -8.000, y = -11.000, z = -23.000, wait = 0 },
        { x = -43.000, y = -11.000, z = -60.000, wait = 0 },
        { x = -44.000, y = -11.000, z = -73.000, wait = 0 },
        { x = -36.000, y = -11.000, z = -90.000, wait = 0 },
        { x = -36.000, y = -11.000, z = -103.000, wait = 0 },
        { x = -30.000, y = -11.000, z = -107.000, wait = 0 },
        { x = -5.000, y = -5.000, z = -133.000, wait = 0 },
        { x = -2.000, y = -5.000, z = -180.000, wait = 0 },
        { x = 62.000, y = -5.000, z = -180.000, wait = 0 },
        { x = 76.000, y = -5.000, z = -167.000, wait = 0 },
        { x = 62.000, y = -5.000, z = -180.000, wait = 0 },
        { x = -4.000, y = -5.000, z = -180.000, wait = 0 },
        { x = -2.000, y = -5.000, z = -180.000, wait = 0 },
        { x = -1.500, y = -5.000, z = -207.000, wait = 0 },
        { x = 26.000, y = -11.000, z = -207.000, wait = 0 },
        { x = 25.000, y = -11.000, z = -195.000, wait = 0 },
        { x = 16.000, y = -11.000, z = -194.000, wait = 0 },
        { x = 16.000, y = -11.000, z = -170.000, wait = 0 },
        { x = 8.500, y = -11.000, z = -163.000, wait = 0 },
        { x = 16.000, y = -11.000, z = -170.000, wait = 0 },
        { x = 16.000, y = -11.000, z = -194.000, wait = 0 },
        { x = 25.000, y = -11.000, z = -195.000, wait = 0 },
        { x = 26.000, y = -11.000, z = -207.000, wait = 0 },
        { x = -1.500, y = -11.000, z = -207.000, wait = 0 },
        { x = -4.000, y = -11.000, z = -180.000, wait = 0 },
        { x = -3.700, y = -11.000, z = -155.000, wait = 0 },
        { x = -5.000, y = -11.000, z = -133.000, wait = 0 },
        { x = -30.000, y = -11.000, z = -107.000, wait = 0 },
        { x = -36.000, y = -11.000, z = -103.000, wait = 0 },
        { x = -36.000, y = -11.000, z = -90.000, wait = 0 },
        { x = -44.000, y = -11.000, z = -73.000, wait = 0 },
        { x = -43.000, y = -11.000, z = -60.000, wait = 0 },
        { x = -8.000, y = -11.000, z = -23.000, wait = 0 },
        { x = -7.000, y = -11.000, z = 7.000, wait = 0 },
        { x = -7.000, y = -11.000, z = 38.000, wait = 0 },
        { x = -2.000, y = -11.000, z = 47.000, wait = 0 },
        { x = -4.000, y = -11.000, z = 86.000, wait = 0 },
        { x = -37.000, y = -11.000, z = 84.000, wait = 0 },
        { x = -39.000, y = -11.000, z = 38.000, wait = 0 },
    },
    [17752304] =
    {
        { x = -57.000, y = -11.000, z = 41.000, wait = 0 },
        { x = -32.000, y = -11.000, z = 40.000, wait = 0 },
        { x = -32.112, y = -11.000, z = 8.000, wait = 0 },
        { x = -42.000, y = -11.000, z = 1.000, wait = 0 },
        { x = -78.000, y = -11.000, z = 15.500, wait = 0 },
        { x = -80.400, y = -11.000, z = 10.000, wait = 0 },
        { x = -69.000, y = -11.000, z = 5.000, wait = 0 },
        { x = -80.400, y = -11.000, z = 10.000, wait = 0 },
        { x = -78.000, y = -11.000, z = 15.500, wait = 0 },
        { x = -98.000, y = -11.000, z = 24.500, wait = 0 },
        { x = -108.000, y = -11.000, z = 44.500, wait = 0 },
        { x = -102.000, y = -11.000, z = 52.500, wait = 0 },
        { x = -80.000, y = -11.000, z = 63.500, wait = 0 },
        { x = -82.000, y = -11.000, z = 87.500, wait = 0 },
        { x = -67.000, y = -11.000, z = 88.000, wait = 0 },
        { x = -66.500, y = -11.000, z = 115.000, wait = 0 },
        { x = -57.000, y = -11.000, z = 115.000, wait = 0 },
        { x = -57.000, y = -11.000, z = 105.000, wait = 0 },
        { x = -30.000, y = -11.000, z = 104.700, wait = 0 },
        { x = -22.500, y = -11.000, z = 98.000, wait = 0 },
        { x = -30.000, y = -11.000, z = 104.700, wait = 0 },
        { x = -57.000, y = -11.000, z = 105.000, wait = 0 },
        { x = -57.000, y = -11.000, z = 115.000, wait = 0 },
        { x = -66.500, y = -11.000, z = 115.000, wait = 0 },
        { x = -67.000, y = -11.000, z = 88.000, wait = 0 },
        { x = -58.000, y = -11.000, z = 86.000, wait = 0 },
        { x = -40.000, y = -5.000, z = 86.000, wait = 0 },
        { x = -40.000, y = -5.000, z = 160.000, wait = 0 },
        { x = -43.000, y = -11.000, z = 173.000, wait = 0 },
        { x = -49.000, y = -11.000, z = 185.000, wait = 0 },
        { x = -40.000, y = -11.000, z = 205.000, wait = 0 },
        { x = -39.000, y = -11.000, z = 222.000, wait = 0 },
        { x = -40.000, y = -11.000, z = 205.000, wait = 0 },
        { x = -49.000, y = -11.000, z = 185.000, wait = 0 },
        { x = -43.000, y = -11.000, z = 173.000, wait = 0 },
        { x = -40.000, y = -5.000, z = 160.000, wait = 0 },
        { x = -40.000, y = -5.000, z = 86.000, wait = 0 },
        { x = -22.000, y = -11.000, z = 86.000, wait = 0 },
        { x = -2.000, y = -11.000, z = 87.000, wait = 0 },
        { x = -2.300, y = -11.000, z = 38.000, wait = 0 },
    },
    [17752305] =
    {
        { x = -78.000, y = -11.000, z = 63.000, wait = 0 },
        { x = -57.000, y = -11.000, z = 41.000, wait = 0 },
        { x = -32.000, y = -11.000, z = 40.000, wait = 0 },
        { x = -13.000, y = -11.000, z = 38.000, wait = 0 },
        { x = -7.000, y = -2.000, z = 38.000, wait = 0 },
        { x = -7.000, y = -2.000, z = 7.000, wait = 0 },
        { x = -8.000, y = -11.000, z = -23.000, wait = 0 },
        { x = -43.000, y = -11.000, z = -60.000, wait = 0 },
        { x = -44.000, y = -11.000, z = -73.000, wait = 0 },
        { x = -36.000, y = -11.000, z = -90.000, wait = 0 },
        { x = -36.000, y = -11.000, z = -103.000, wait = 0 },
        { x = -51.000, y = -11.000, z = -119.000, wait = 0 },
        { x = -52.000, y = -11.000, z = -164.000, wait = 0 },
        { x = -63.000, y = -11.000, z = -168.000, wait = 0 },
        { x = -71.000, y = -11.000, z = -170.000, wait = 0 },
        { x = -84.000, y = -11.000, z = -162.000, wait = 0 },
        { x = -113.000, y = -11.000, z = -163.000, wait = 0 },
        { x = -145.000, y = -11.000, z = -179.000, wait = 0 },
        { x = -172.000, y = -11.000, z = -180.000, wait = 0 },
        { x = -191.000, y = -11.000, z = -170.000, wait = 0 },
        { x = -202.000, y = -11.000, z = -174.000, wait = 0 },
        { x = -212.000, y = -11.000, z = -196.000, wait = 0 },
        { x = -218.000, y = -11.000, z = -214.000, wait = 0 },
        { x = -220.000, y = -11.000, z = -235.000, wait = 0 },
        { x = -239.000, y = -11.000, z = -248.000, wait = 0 },
        { x = -240.000, y = -11.000, z = -295.000, wait = 0 },
        { x = -239.000, y = -11.000, z = -248.000, wait = 0 },
        { x = -220.000, y = -11.000, z = -235.000, wait = 0 },
        { x = -218.000, y = -11.000, z = -214.000, wait = 0 },
        { x = -212.000, y = -11.000, z = -196.000, wait = 0 },
        { x = -202.000, y = -11.000, z = -174.000, wait = 0 },
        { x = -191.000, y = -11.000, z = -170.000, wait = 0 },
        { x = -172.000, y = -11.000, z = -180.000, wait = 0 },
        { x = -145.000, y = -11.000, z = -179.000, wait = 0 },
        { x = -113.000, y = -11.000, z = -163.000, wait = 0 },
        { x = -84.000, y = -11.000, z = -162.000, wait = 0 },
        { x = -71.000, y = -11.000, z = -170.000, wait = 0 },
        { x = -63.000, y = -11.000, z = -168.000, wait = 0 },
        { x = -52.000, y = -11.000, z = -164.000, wait = 0 },
        { x = -51.000, y = -11.000, z = -119.000, wait = 0 },
        { x = -36.000, y = -11.000, z = -103.000, wait = 0 },
        { x = -36.000, y = -11.000, z = -90.000, wait = 0 },
        { x = -44.000, y = -11.000, z = -73.000, wait = 0 },
        { x = -43.000, y = -11.000, z = -60.000, wait = 0 },
        { x = -8.000, y = -11.000, z = -23.000, wait = 0 },
        { x = -7.000, y = -2.000, z = 7.000, wait = 0 },
        { x = -7.000, y = -2.000, z = 38.000, wait = 0 },
        { x = -13.000, y = -11.000, z = 38.000, wait = 0 },
        { x = -32.000, y = -11.000, z = 40.000, wait = 0 },
        { x = -57.000, y = -11.000, z = 41.000, wait = 0 },
    },
    [17752306] =
    {
        { x = -80.000, y = -11.000, z = 87.000, wait = 0 },
        { x = -58.000, y = -11.000, z = 86.000, wait = 0 },
        { x = -54.000, y = -11.000, z = 66.000, wait = 0 },
        { x = -40.000, y = -11.000, z = 61.000, wait = 0 },
        { x = -27.000, y = -11.000, z = 67.000, wait = 0 },
        { x = -22.000, y = -11.000, z = 86.000, wait = 0 },
        { x = -2.500, y = -11.000, z = 86.800, wait = 0 },
        { x = -1.700, y = -2.000, z = 50.000, wait = 0 },
        { x = 33.000, y = -2.000, z = 49.500, wait = 0 },
        { x = 57.000, y = -2.000, z = 41.000, wait = 0 },
        { x = 74.000, y = -3.000, z = 27.000, wait = 0 },
        { x = 83.000, y = -3.000, z = 28.000, wait = 0 },
        { x = 121.000, y = -2.000, z = 49.000, wait = 0 },
        { x = 106.000, y = -3.000, z = 70.000, wait = 0 },
        { x = 112.000, y = -3.000, z = 85.000, wait = 0 },
        { x = 123.000, y = -3.000, z = 93.500, wait = 0 },
        { x = 124.000, y = -3.000, z = 112.000, wait = 0 },
        { x = 147.000, y = -3.000, z = 135.000, wait = 0 },
        { x = 147.500, y = -3.000, z = 158.000, wait = 0 },
        { x = 148.000, y = 0.000, z = 186.000, wait = 0 },
        { x = 147.000, y = -3.000, z = 209.000, wait = 0 },
        { x = 111.000, y = -3.000, z = 211.000, wait = 0 },
        { x = 99.000, y = -3.000, z = 199.000, wait = 0 },
        { x = 99.000, y = -3.000, z = 171.000, wait = 0 },
        { x = 117.000, y = -3.000, z = 171.000, wait = 0 },
        { x = 118.500, y = -3.000, z = 185.000, wait = 0 },
        { x = 148.000, y = 0.000, z = 186.000, wait = 0 },
        { x = 147.500, y = -3.000, z = 158.000, wait = 0 },
        { x = 147.000, y = -3.000, z = 135.000, wait = 0 },
        { x = 124.000, y = -3.000, z = 112.000, wait = 0 },
        { x = 123.000, y = -3.000, z = 93.500, wait = 0 },
        { x = 112.000, y = -3.000, z = 85.000, wait = 0 },
        { x = 106.000, y = -3.000, z = 70.000, wait = 0 },
        { x = 121.000, y = -2.000, z = 49.000, wait = 0 },
        { x = 83.000, y = -3.000, z = 28.000, wait = 0 },
        { x = 74.000, y = -3.000, z = 27.000, wait = 0 },
        { x = 57.000, y = -2.000, z = 41.000, wait = 0 },
        { x = 33.000, y = -2.000, z = 49.500, wait = 0 },
        { x = -1.700, y = -2.000, z = 50.000, wait = 0 },
        { x = -2.500, y = -2.000, z = 37.000, wait = 0 },
        { x = -32.000, y = -11.000, z = 40.000, wait = 0 },
        { x = -57.000, y = -11.000, z = 41.000, wait = 0 },
        { x = -78.000, y = -11.000, z = 63.000, wait = 0 },
    },
    [17752307] =
    {
        { x = -58.000, y = -11.000, z = 86.000, wait = 0 },
        { x = -54.000, y = -11.000, z = 66.000, wait = 0 },
        { x = -40.000, y = -11.000, z = 61.000, wait = 0 },
        { x = -27.000, y = -11.000, z = 67.000, wait = 0 },
        { x = -22.000, y = -11.000, z = 86.000, wait = 0 },
        { x = -2.500, y = -11.000, z = 86.800, wait = 0 },
        { x = -1.700, y = -2.000, z = 50.000, wait = 0 },
        { x = 33.000, y = -2.000, z = 49.500, wait = 0 },
        { x = 57.000, y = -2.000, z = 41.000, wait = 0 },
        { x = 74.000, y = -3.000, z = 27.000, wait = 0 },
        { x = 83.000, y = -3.000, z = 28.000, wait = 0 },
        { x = 121.000, y = -2.000, z = 49.000, wait = 0 },
        { x = 106.000, y = -3.000, z = 70.000, wait = 0 },
        { x = 112.000, y = -3.000, z = 85.000, wait = 0 },
        { x = 123.000, y = -3.000, z = 93.500, wait = 0 },
        { x = 124.000, y = -3.000, z = 112.000, wait = 0 },
        { x = 147.000, y = -3.000, z = 135.000, wait = 0 },
        { x = 147.500, y = -3.000, z = 158.000, wait = 0 },
        { x = 148.000, y = 0.000, z = 186.000, wait = 0 },
        { x = 147.000, y = -3.000, z = 209.000, wait = 0 },
        { x = 155.000, y = -8.000, z = 211.000, wait = 0 },
        { x = 155.400, y = -8.000, z = 257.000, wait = 0 },
        { x = 179.000, y = -8.000, z = 256.000, wait = 0 },
        { x = 178.000, y = -8.000, z = 237.000, wait = 0 },
        { x = 177.000, y = -3.000, z = 213.000, wait = 0 },
        { x = 155.000, y = -8.000, z = 211.000, wait = 0 },
        { x = 147.000, y = -3.000, z = 209.000, wait = 0 },
        { x = 148.000, y = 0.000, z = 186.000, wait = 0 },
        { x = 147.500, y = -3.000, z = 158.000, wait = 0 },
        { x = 147.000, y = -3.000, z = 135.000, wait = 0 },
        { x = 124.000, y = -3.000, z = 112.000, wait = 0 },
        { x = 123.000, y = -3.000, z = 93.500, wait = 0 },
        { x = 112.000, y = -3.000, z = 85.000, wait = 0 },
        { x = 106.000, y = -3.000, z = 70.000, wait = 0 },
        { x = 121.000, y = -2.000, z = 49.000, wait = 0 },
        { x = 83.000, y = -3.000, z = 28.000, wait = 0 },
        { x = 74.000, y = -3.000, z = 27.000, wait = 0 },
        { x = 57.000, y = -2.000, z = 41.000, wait = 0 },
        { x = 33.000, y = -2.000, z = 49.500, wait = 0 },
        { x = -1.700, y = -2.000, z = 50.000, wait = 0 },
        { x = -2.500, y = -2.000, z = 37.000, wait = 0 },
        { x = -32.000, y = -11.000, z = 40.000, wait = 0 },
        { x = -57.000, y = -11.000, z = 41.000, wait = 0 },
        { x = -78.000, y = -11.000, z = 63.000, wait = 0 },
        { x = -80.000, y = -11.000, z = 87.000, wait = 0 },
    },
    [17752308] =
    {
        { x = -54.000, y = -11.000, z = 66.000, wait = 0 },
        { x = -40.000, y = -11.000, z = 61.000, wait = 0 },
        { x = -27.000, y = -11.000, z = 67.000, wait = 0 },
        { x = -22.000, y = -11.000, z = 86.000, wait = 0 },
        { x = -2.500, y = -11.000, z = 86.800, wait = 0 },
        { x = -2.500, y = -2.000, z = 37.000, wait = 0 },
        { x = -32.000, y = -3.000, z = 40.000, wait = 0 },
        { x = -32.100, y = -3.000, z = 7.000, wait = 0 },
        { x = -44.000, y = -4.000, z = 2.000, wait = 0 },
        { x = -99.000, y = -4.000, z = 25.000, wait = 0 },
        { x = -105.000, y = -4.000, z = 40.000, wait = 0 },
        { x = -114.000, y = -4.000, z = 45.000, wait = 0 },
        { x = -114.500, y = -4.000, z = 48.000, wait = 0 },
        { x = -78.000, y = -11.000, z = 63.000, wait = 0 },
        { x = -80.000, y = -11.000, z = 87.000, wait = 0 },
        { x = -58.000, y = -11.000, z = 86.000, wait = 0 },
    },
    [17752309] =
    {
        { x = -40.000, y = -11.000, z = 61.000, wait = 0 },
        { x = -27.000, y = -11.000, z = 67.000, wait = 0 },
        { x = -22.000, y = -11.000, z = 86.000, wait = 0 },
        { x = -2.500, y = -11.000, z = 86.800, wait = 0 },
        { x = -2.500, y = -2.000, z = 37.000, wait = 0 },
        { x = -32.000, y = -3.000, z = 40.000, wait = 0 },
        { x = -57.000, y = -11.000, z = 41.000, wait = 0 },
        { x = -78.000, y = -11.000, z = 63.000, wait = 0 },
        { x = -80.000, y = -11.000, z = 87.000, wait = 0 },
        { x = -58.000, y = -11.000, z = 86.000, wait = 0 },
        { x = -40.000, y = -5.000, z = 86.000, wait = 0 },
        { x = -40.000, y = -5.000, z = 160.000, wait = 0 },
        { x = -43.000, y = -11.000, z = 173.000, wait = 0 },
        { x = -49.000, y = -11.000, z = 185.000, wait = 0 },
        { x = -40.000, y = -11.000, z = 205.000, wait = 0 },
        { x = -39.000, y = -11.000, z = 222.000, wait = 0 },
        { x = -40.000, y = -11.000, z = 205.000, wait = 0 },
        { x = -49.000, y = -11.000, z = 185.000, wait = 0 },
        { x = -43.000, y = -11.000, z = 173.000, wait = 0 },
        { x = -40.000, y = -5.000, z = 160.000, wait = 0 },
        { x = -40.000, y = -5.000, z = 86.000, wait = 0 },
        { x = -22.000, y = -11.000, z = 86.000, wait = 0 },
        { x = -2.000, y = -11.000, z = 87.000, wait = 0 },
        { x = -2.300, y = -11.000, z = 38.000, wait = 0 },
        { x = -32.000, y = -3.000, z = 40.000, wait = 0 },
        { x = -57.000, y = -11.000, z = 41.000, wait = 0 },
        { x = -78.000, y = -11.000, z = 63.000, wait = 0 },
        { x = -80.000, y = -11.000, z = 87.000, wait = 0 },
        { x = -58.000, y = -11.000, z = 86.000, wait = 0 },
        { x = -54.000, y = -11.000, z = 66.000, wait = 0 },
    },
    [17752310] =
    {
        { x = -27.000, y = -11.000, z = 67.000, wait = 0 },
        { x = -22.000, y = -11.000, z = 86.000, wait = 0 },
        { x = -2.500, y = -11.000, z = 86.800, wait = 0 },
        { x = -2.500, y = -2.000, z = 37.000, wait = 0 },
        { x = -32.000, y = -3.000, z = 40.000, wait = 0 },
        { x = -57.000, y = -11.000, z = 41.000, wait = 0 },
        { x = -78.000, y = -11.000, z = 63.000, wait = 0 },
        { x = -80.000, y = -11.000, z = 87.000, wait = 0 },
        { x = -58.000, y = -11.000, z = 86.000, wait = 0 },
        { x = -40.000, y = -5.000, z = 86.000, wait = 0 },
        { x = -40.000, y = -5.000, z = 160.000, wait = 0 },
        { x = -43.000, y = -11.000, z = 173.000, wait = 0 },
        { x = -49.000, y = -11.000, z = 185.000, wait = 0 },
        { x = -40.000, y = -11.000, z = 205.000, wait = 0 },
        { x = -39.000, y = -11.000, z = 222.000, wait = 0 },
        { x = -40.000, y = -11.000, z = 205.000, wait = 0 },
        { x = -49.000, y = -11.000, z = 185.000, wait = 0 },
        { x = -43.000, y = -11.000, z = 173.000, wait = 0 },
        { x = -40.000, y = -5.000, z = 160.000, wait = 0 },
        { x = -40.000, y = -5.000, z = 86.000, wait = 0 },
        { x = -22.000, y = -11.000, z = 86.000, wait = 0 },
        { x = -2.000, y = -11.000, z = 87.000, wait = 0 },
        { x = -2.300, y = -11.000, z = 38.000, wait = 0 },
        { x = -32.000, y = -3.000, z = 40.000, wait = 0 },
        { x = -57.000, y = -11.000, z = 41.000, wait = 0 },
        { x = -78.000, y = -11.000, z = 63.000, wait = 0 },
        { x = -80.000, y = -11.000, z = 87.000, wait = 0 },
        { x = -58.000, y = -11.000, z = 86.000, wait = 0 },
        { x = -54.000, y = -11.000, z = 66.000, wait = 0 },
        { x = -40.000, y = -11.000, z = 61.000, wait = 0 },
    },
    [17752311] =
    {
        { x = -22.000, y = -11.000, z = 86.000, wait = 0 },
        { x = -2.500, y = -11.000, z = 86.800, wait = 0 },
        { x = -1.700, y = -2.000, z = 50.000, wait = 0 },
        { x = 33.000, y = -2.000, z = 49.500, wait = 0 },
        { x = 57.000, y = -2.000, z = 41.000, wait = 0 },
        { x = 74.000, y = -3.000, z = 27.000, wait = 0 },
        { x = 83.000, y = -3.000, z = 28.000, wait = 0 },
        { x = 121.000, y = -2.000, z = 49.000, wait = 0 },
        { x = 106.000, y = -3.000, z = 70.000, wait = 0 },
        { x = 112.000, y = -3.000, z = 85.000, wait = 0 },
        { x = 123.000, y = -3.000, z = 93.500, wait = 0 },
        { x = 124.000, y = -3.000, z = 112.000, wait = 0 },
        { x = 147.000, y = -3.000, z = 135.000, wait = 0 },
        { x = 147.500, y = -3.000, z = 158.000, wait = 0 },
        { x = 148.000, y = 0.000, z = 186.000, wait = 0 },
        { x = 147.000, y = -3.000, z = 209.000, wait = 0 },
        { x = 111.000, y = -3.000, z = 211.000, wait = 0 },
        { x = 99.000, y = -3.000, z = 199.000, wait = 0 },
        { x = 99.000, y = -3.000, z = 171.000, wait = 0 },
        { x = 117.000, y = -3.000, z = 171.000, wait = 0 },
        { x = 118.500, y = -3.000, z = 185.000, wait = 0 },
        { x = 148.000, y = 0.000, z = 186.000, wait = 0 },
        { x = 147.500, y = -3.000, z = 158.000, wait = 0 },
        { x = 147.000, y = -3.000, z = 135.000, wait = 0 },
        { x = 124.000, y = -3.000, z = 112.000, wait = 0 },
        { x = 123.000, y = -3.000, z = 93.500, wait = 0 },
        { x = 112.000, y = -3.000, z = 85.000, wait = 0 },
        { x = 106.000, y = -3.000, z = 70.000, wait = 0 },
        { x = 121.000, y = -2.000, z = 49.000, wait = 0 },
        { x = 83.000, y = -3.000, z = 28.000, wait = 0 },
        { x = 74.000, y = -3.000, z = 27.000, wait = 0 },
        { x = 57.000, y = -2.000, z = 41.000, wait = 0 },
        { x = 33.000, y = -2.000, z = 49.500, wait = 0 },
        { x = -1.700, y = -2.000, z = 50.000, wait = 0 },
        { x = -2.500, y = -2.000, z = 37.000, wait = 0 },
        { x = -32.000, y = -11.000, z = 40.000, wait = 0 },
        { x = -40.000, y = -11.000, z = 40.000, wait = 0 },
        { x = -40.000, y = -11.000, z = 61.000, wait = 0 },
        { x = -27.000, y = -11.000, z = 67.000, wait = 0 },
    },
}

local merryMakersNPCs =
{
    Bastok_Markets =
    {
        17739830,   -- Lame Deer
        17739831,   -- Epione
        17739829,   -- Pavel
        17739833,   -- Tancredi
        17739837,   -- Red Canyon
        17739839,   -- Anguysh
    },
    Northern_SandOria =
    {
        17723393,   -- Nonterene
        17723510,   -- Mevaloud
        17723513,   -- Giaunne
        17723403,   -- Elesca
        17723492,   -- Antonian
        17723397,   -- Guilerme
        17723398,   -- Bacherume
        17723413,   -- Malfine
        17723518,   -- Fantarviont
        17723529,   -- Mulaujeant
    },
    Windurst_Waters =
    {
        17752205,   -- Shatoto
        17752204,   -- Ajen-Myoojen
        17752104,   -- Baehu-Faehu
        17752163,   -- Karuru
        17752589,   -- Isanie
        17752192,   -- Buchi Kohmrijah
        17752102,   -- Maqu Molpih
        17752185,   -- Queo-Paeo
        17752195,   -- Sahgi Konchumih
        17752112,   -- Leepe-Hoppe
    },
    Receive_Event_IDs =
    {
        4889,
        4887,
        4881,
        4885,
        4891,
        4883,
    },
    Send_Event_IDs =
    {
        4862,
        4859,
        4850,
        4856,
        4865,
        4853,
    }
}

function getMerrymakerNPCIDs(zoneid)
    npc_table = {}
    if isStarlightEnabled ~= 0 then
        if zoneid == 231 then
            npc_table = merryMakersNPCs.Northern_SandOria
            return npc_table
        elseif zoneid == 235 then
            npc_table = merryMakersNPCs.Bastok_Markets
            return npc_table
        elseif zoneid == 238 then
            npc_table = merryMakersNPCs.Windurst_Waters
            return npc_table
        end
    end
end

function getMerrymakerPathing(npcid, zoneid)
    pathNodes = {}
    if isStarlightEnabled() ~= 0 then
        if zoneid == 231 then
            pathNodes = merryMakersSandoria[npcid]
            return pathNodes
        elseif zoneid == 235 then
            pathNodes = merryMakersBastok[npcid]
            return pathNodes
        elseif zoneid == 238 then
            pathNodes = merryMakersWindurst[npcid]
            return pathNodes
        end
    end
end

function merryMakersGoblinOnSpawn(npc)
    npc:initNpcAi()
    local npcID = npc:getID()
    local pathNodes = getMerrymakerPathing(npcID, npc:getZoneID())
    npc:setPos(xi.path.first(pathNodes))
    npc:pathThrough(pathNodes, xi.path.flag.PATROL)
end

function merryMakersGoblinOnPathPoint(npc, id)
    local rnd = math.random(1, 30)
    if rnd == 20 then
        npc:showText(npc, id.text.MERRYMAKER_TOY)
    end
end

function merryMakersGoblinOnTrigger(player, npc)
    local hasTrust = player:getLocalVar("[StarlightMerryMakers]GoblinTrust")
    local hasPresent = player:getLocalVar("[StarlightMerryMakers]HasPresent")
    if hasTrust == npc:getID() then
        local loseTrust = math.random(0,3)
        if loseTrust ~= 0 then
            if loseTrust == 1 then
                player:startEvent(4713)
            elseif loseTrust == 2 then
                player:startEvent(4718)
            elseif loseTrust == 3 then
                if hasPresent == 0 then
                    player:startEvent(4711)
                else
                    player:startEvent(4712)
                end
            end
        else
            player:setLocalVar("[StarlightMerryMakers]GoblinTrust", 0)
            player:startEvent(4712)
        end
    else
        player:startEvent(4712)
    end
end

function merryMakersGoblinOnFinish(player, csid, option)
    if csid == 4711 then
        local bluePresent = player:hasKeyItem(xi.keyItem.BLUE_PRESENT)
        -- local present_table =
        -- {
        --     2056,  --xi.keyItem.RED_PRESENT,
        --     2058,  --xi.keyItem.GREEN_PRESENT,
        --     2057,  --xi.keyItem.BLUE_PRESENT,
        -- }

        -- local count = 0
        -- local reward = 0

        -- while count ~= 0 do
        --     local picked = present_table[math.random(1, #present_table)]
        --     if player:hasKeyItem(picked) == false then
        --         reward = picked
        --         count = 0
        --     else
        --         table.remove(present_table, picked) -- removes present KIs that player already has
        --         count = count - 1
        --     end
        -- end
        if not bluePresent then
            player:addKeyItem(xi.keyItem.BLUE_PRESENT)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.keyItem.BLUE_PRESENT)
            player:setLocalVar("[StarlightMerryMakers]GoblinTrust", 0)
            player:setLocalVar("[StarlightMerryMakers]HasPresent", 1)
        end
    end
end

function merryMakersGoblinOnTrade(player, npc, trade)
    local item = trade:getItemId()
    if item == 4495 then
        player:setLocalVar("[StarlightMerryMakers]GoblinTrust", npc:getID())
        player:tradeComplete()
        player:showText(npc, ID.text.MERRYMAKER_TRADE)
    else
        player:showText(npc, ID.text.MERRYMAKER_BLECH)
    end
end

function merryMakersMoogleOnTrigger(player, npc)
    local questStatus = player:getLocalVar("[StarlightMerryMakers]Started")
    local cleared = player:getLocalVar("[StarlightMerryMakers]Cleared")
    local confirmed = player:getLocalVar("[StarlightMerryMakers]Confirmed")
    local delivered = player:getLocalVar("[StarlightMerryMakers]Delivered")
    if questStatus ~= 0 then
        if cleared ~= 0 then
            player:startEvent(4702)
        elseif delivered ~= 0 then
            local sender = player:getLocalVar("[StarlightMerryMakers]Sender")
            local npcName = GetNPCByID(sender):getName()
            if string.find(npcName, "%_") ~= 0 then
                npcName = string.gsub(npcName, "%_", " ")
            end
            player:startEventString(4705, npcName)
        elseif confirmed ~= 0 then
            local sender = player:getLocalVar("[StarlightMerryMakers]Sender")
            local npcName = GetNPCByID(sender):getName()
            if string.find(npcName, "%_") ~= 0 then
                npcName = string.gsub(npcName, "%_", " ")
            end
            player:startEventString(4704, npcName)
        else
            local red_present = player:hasKeyItem(xi.keyItem.RED_PRESENT)
            local green_present = player:hasKeyItem(xi.keyItem.GREEN_PRESENT)
            local blue_present = player:hasKeyItem(xi.keyItem.BLUE_PRESENT)

            local npc_table = getMerrymakerNPCIDs(npc:getZoneID())

            if (red_present or green_present or blue_present) then
                local rnd = math.random(1,6)
                local giftNpcID = npc_table[rnd]
                local giftNpc = GetNPCByID(giftNpcID):getName()
                if string.find(giftNpc, "%_") ~= 0 then
                    giftNpc = string.gsub(giftNpc, "%_", " ")
                end
                player:startEventString(4701, giftNpc)
                player:setLocalVar("[StarlightMerryMakers]Sender", giftNpcID)
                player:setLocalVar("[StarlightMerryMakers]SenderID", rnd)
            else
                player:startEvent(4703, 2)
            end
        end
    else
        player:startEvent(4700)
        player:setLocalVar("[StarlightMerryMakers]Started", 1)
    end
end

function merryMakersMoogleOnFinish(player, id, csid, option)
    if csid == 4702 then
        local dreamPants = player:hasItem(11967)
        local dreamTrousers = player:hasItem(11965)
        local dreamPantsHQ = player:hasItem(11968)
        local dreamTrousersHQ = player:hasItem(11966)
        local starToken = player:hasKeyItem(xi.keyItem.STAR_THEMED_GIFT_TOKEN)

        local gender = player:getGender()

        if gender == 0 then
            if not dreamPants then
                npcUtil.giveItem(player, 11967)
            elseif (dreamPants and not dreamPantsHQ) then
                npcUtil.giveItem(player, 11968)
            elseif (dreamPantsHQ and starToken) then
                npcUtil.giveItem(player, 5622)
            else
                player:addKeyItem(xi.keyItem.STAR_THEMED_GIFT_TOKEN)
                player:messageSpecial(id.text.KEYITEM_OBTAINED, xi.keyItem.STAR_THEMED_GIFT_TOKEN)
            end
        else
            if not dreamTrousers then
                npcUtil.giveItem(player, 11965)
            elseif (dreamTrousers and not dreamTrousersHQ) then
                npcUtil.giveItem(player, 11966)
            elseif (dreamTrousersHQ and starToken) then
                npcUtil.giveItem(player, 5621)
            else
                player:addKeyItem(xi.keyItem.STAR_THEMED_GIFT_TOKEN)
                player:messageSpecial(id.text.KEYITEM_OBTAINED, xi.keyItem.STAR_THEMED_GIFT_TOKEN)
            end
        end
        player:setLocalVar("[StarlightMerryMakers]Cleared", 0)
    end
end

function merryMakersNPCDeliverOnTrigger(player, npc, defaultAction)
    if isStarlightEnabled() ~= 0 then
        local npcID = npc:getID()
        local sender = player:getLocalVar("[StarlightMerryMakers]Sender")
        local confirmed = player:getLocalVar("[StarlightMerryMakers]Confirmed")
        local delivered = player:getLocalVar("[StarlightMerryMakers]Delivered")

        if delivered ~= 0 then
            player:showText(npc, 14002)
            player:setLocalVar("[StarlightMerryMakers]Sender", 0)
            player:setLocalVar("[StarlightMerryMakers]Confirmed", 0)
            player:setLocalVar("[StarlightMerryMakers]Delivered", 0)
            player:setLocalVar("[StarlightMerryMakers]Cleared", 1)
        elseif confirmed ~= 0 then
            local npcName = GetNPCByID(sender):getName()
            local event_pos = player:getLocalVar("[StarlightMerryMakers]ConfirmedID")
            local event_table = merryMakersNPCs.Receive_Event_IDs[event_pos]
            local red_present = player:hasKeyItem(xi.keyItem.RED_PRESENT)
            local green_present = player:hasKeyItem(xi.keyItem.GREEN_PRESENT)
            local blue_present = player:hasKeyItem(xi.keyItem.BLUE_PRESENT)

            if string.find(npcName, "%_") ~= 0 then
                npcName = string.gsub(npcName, "%_", " ")
            end

            player:startEventString(event_table, npcName)
            player:setLocalVar("[StarlightMerryMakers]Confirmed", 0)
            player:setLocalVar("[StarlightMerryMakers]Delivered", npc:getID())

            if red_present then
                player:delKeyItem(xi.keyItem.RED_PRESENT)
            elseif green_present then
                player:delKeyItem(xi.keyItem.GREEN_PRESENT)
            elseif blue_present then
                player:delKeyItem(xi.keyItem.BLUE_PRESENT)
            end
            player:setLocalVar("[StarlightMerryMakers]HasPresent", 0)
        else
            if player:getLocalVar("[StarlightMerryMakers]Sender") == npcID then
                local eventID = player:getLocalVar("[StarlightMerryMakers]SenderID")
                local npc_table = getMerrymakerNPCIDs(npc:getZoneID())
                local event_table = merryMakersNPCs.Send_Event_IDs
                local receiver = 0
                local receiveID = 0
                local count = #npc_table
                while count ~= 0 do
                    local rnd = math.random(1, #npc_table)
                    local picked = npc_table[rnd]
                    if picked ~= npcID then
                        receiver = picked
                        count = 0
                        receiveID = rnd
                    else
                        table.remove(npc_table, picked) -- removes this NPC's ID from table
                        count = count - 1
                    end
                end
                local npcName = GetNPCByID(receiver):getName()

                if string.find(npcName, "%_") ~= 0 then
                    npcName = string.gsub(npcName, "%_", " ")
                end
                player:startEvent(event_table[eventID], npcName)
                player:setLocalVar("[StarlightMerryMakers]Confirmed", receiver)
                player:setLocalVar("[StarlightMerryMakers]ConfirmedID", receiveID)
            else
                player:startEvent(defaultAction)
            end
        end
    end
end
