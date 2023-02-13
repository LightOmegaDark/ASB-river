-----------------------------------
-- Ironman NPCs
-- For use with ironman_mode.cpp module
-----------------------------------
require("modules/module_utils")
require('scripts/globals/items')
-----------------------------------
local m = Module:new("ironman")
local CHAR_RESTRICTION = "CHAR_RESTRICTION"
local CHAR_INTERACTED = "CHAR_INTERACTED"
local IRONMAN_MENU_PAGE = "IRONMAN_MENU_PAGE"

local ironmanNPC = {
    Bastok_Markets = "Robin",
    Port_San_dOria = "Robinette",
    Windurst_Walls = "Robina",
}

local ironmanDialog = {
    WARNING1 = "You are about to become an Ironman.",
    WARNING2 = "Your character will no longer be able to party with regular adventurers, trade, or use the Auction House or Delivery Box.",
    MENU_ACCEPT = {
        TITLE = "Will you take the path alone?",
        AGREE = "Become an Ironman",
        DECLINE = "Walk away",
        EXIT = "You've taken the easy road, adventurer. Disappointing.",
    },
    MENU_REWARD = {
        TITLE = "Choose an Ironman reward:",
    },
    MENU_CURRENT = {
        TITLE = "How goes your journey?",
        REWARDS = "Collect a reward",
        RETIRE = "Retire from Ironman",
        NOTHING = "Nothing",
    },
    MENU_RETIRE = {
        TITLE = "Are you absolutely sure?",
        AGREE = "Yes",
        DECLINE = "No",
    },
    PREVENTED = "It's too late, adventurer. You've already taken another path.",
    ACCEPTED1 = "This path will be long and difficult. It will take an iron will to see it through. Now hold still...",
    ACCEPTED2 = "You have become an Ironman.",
    RETIRE_WARNING = "Warning: You will no longer be an Ironman or eligible for Ironman rewards. This cannot be undone.",
    RETIRE = "You are no longer an Ironman.",
}

local ironmanSettings = {
    IRONMAN_FLAG = 0x00002000,
    IRONMAN_STATUS_ADD_ANIM = 892,
    IRONMAN_STATUS_DEL_ANIM = 901,
}

local ironmanRewards = {
    REWARD_LV_18 = { lv = 18, id = xi.items.RED_CHIP, desc = "Red Chip" },
    REWARD_LV_30 = { lv = 30, id = xi.items.BLUE_CHIP, desc = "Blue Chip" },
    REWARD_LV_40 = { lv = 40, id = xi.items.YELLOW_CHIP, desc = "Yellow Chip" },
    REWARD_LV_50 = { lv = 50, id = xi.items.GREEN_CHIP, desc = "Green Chip" },
    REWARD_LV_60 = { lv = 60, id = xi.items.CLEAR_CHIP, desc = "Clear Chip" },
    REWARD_LV_65 = { lv = 65, id = xi.items.PURPLE_CHIP, desc = "Purple Chip" },
    REWARD_LV_70 = { lv = 70, id = xi.items.WHITE_CHIP, desc = "White Chip" },
    REWARD_LV_75 = { lv = 75, id = xi.items.BLACK_CHIP, desc = "Black Chip" },
}

local sortedRewards = {}
local menu  = {}

local i = 1
for _, v in pairs(ironmanRewards) do
    sortedRewards[i] = v
    i = i + 1
end

table.sort(sortedRewards, function (a, b) return a.lv < b.lv end)

m:loadSettings(ironmanDialog)
m:loadSettings(ironmanSettings)
m:loadSettings(ironmanRewards)

local menu  = {}

local delaySendMenu = function(player, menuNext)
    menu = menuNext
    player:timer(50, function(playerArg)
        playerArg:customMenu(menu)
    end)
end

local MENU_REWARD = {
    title = ironmanDialog.MENU_REWARD.TITLE,
    options = {},
}

local function setIronmanRewards(player)
    local options = {}
    local page = player:getLocalVar(IRONMAN_MENU_PAGE)
    local playerLevel = player:getMainLvl()
    local itemsBefore = (page - 1) * 3
    for i = 1, 3 do
        local item = sortedRewards[itemsBefore + i]
        if item == nil then
            break
        end

        if playerLevel >= item.lv then
            table.insert(options, {
                string.format("(%d) %s", item.lv, item.desc), function(playerArg)
                    npcUtil.giveItem(playerArg, item.id)
                end
            })
        end
    end

    if sortedRewards[itemsBefore + 4] ~= nil then
        table.insert(options, {
            "Next Page",
            function()
                local page = player:getLocalVar(IRONMAN_MENU_PAGE, 1)
                player:setLocalVar(IRONMAN_MENU_PAGE, page + 1)
                MENU_REWARD.options = setIronmanRewards(player)
                delaySendMenu(player, MENU_REWARD)
            end
        })
    end

    return options
end

local function delIronmanStatus(player)
    player:setVar(CHAR_RESTRICTION, 0)
    player:PrintToPlayer(ironmanDialog.RETIRE, xi.msg.channel.SYSTEM_3)

    if player:checkNameFlags(ironmanSettings.IRONMAN_FLAG) then
        player:setFlag(ironmanSettings.IRONMAN_FLAG)
    end
end

local function addIronmanStatus(player)
    player:setVar(CHAR_INTERACTED, 1)
    player:setVar(CHAR_RESTRICTION, 255)
    player:PrintToPlayer(ironmanDialog.ACCEPTED2, xi.msg.channel.SYSTEM_3)

    if not player:checkNameFlags(ironmanSettings.IRONMAN_FLAG) then
        player:setFlag(ironmanSettings.IRONMAN_FLAG)
    end
end

local function changeIronmanStatus(player, anim, func)
    local zone = player:getZone()
    local npcName = ironmanNPC[zone:getName()]
    local npcEntity = zone:queryEntitiesByName(string.format("DE_%s", npcName))

    --- If entity found, play animation then apply status change
    if npcEntity and npcEntity[1] then
        npcEntity[1]:independentAnimation(player, anim, 0)
        player:timer(2000, func)
    else
        -- Otherwise, skip animation and apply change anyway
        func()
    end
end

local MENU_RETIRE = {
    title = ironmanDialog.MENU_RETIRE.TITLE,
    options = {
        {
            ironmanDialog.MENU_RETIRE.AGREE,
            function(player)
                changeIronmanStatus(player, ironmanSettings.IRONMAN_STATUS_DEL_ANIM, delIronmanStatus)
            end,
        },
        {
            ironmanDialog.MENU_RETIRE.DECLINE,
            function() end,
        },
    },
}

local MENU_CURRENT = {
    title = ironmanDialog.MENU_CURRENT.TITLE,
    options = {
        {
            ironmanDialog.MENU_CURRENT.REWARDS,
            function(player)
                player:setLocalVar(IRONMAN_MENU_PAGE, 1)
                MENU_REWARD.options = setIronmanRewards(player)
                delaySendMenu(player, MENU_REWARD)
            end,
        },
        {
            ironmanDialog.MENU_CURRENT.RETIRE,
            function(player)
                player:PrintToPlayer(ironmanDialog.RETIRE_WARNING, xi.msg.channel.SYSTEM_3)
                delaySendMenu(player, MENU_RETIRE)
            end,
        },
        {
            ironmanDialog.MENU_CURRENT.NOTHING,
            function() end,
        },
    },
}

local MENU_ACCEPT = {
    title = ironmanDialog.MENU_ACCEPT.TITLE,
    options = {
        {
            ironmanDialog.MENU_ACCEPT.AGREE,
            function(player)
                local npcName = ironmanNPC[player:getZoneName()]
                player:PrintToPlayer(string.format("%s : %s", npcName, ironmanDialog.ACCEPTED1), xi.msg.channel.NS_SAY, npcName)
                changeIronmanStatus(player, ironmanSettings.IRONMAN_STATUS_ADD_ANIM, addIronmanStatus)
            end,
        },
        {
            ironmanDialog.MENU_ACCEPT.DECLINE,
            function(player)
                local npcName = ironmanNPC[player:getZoneName()]
                player:PrintToPlayer(string.format("%s : %s", npcName, ironmanDialog.MENU_ACCEPT.EXIT), xi.msg.channel.NS_SAY, npcName)
            end,
        },
    },
}

local function ironmanOnTrigger(player, npc)
    if player:getVar(CHAR_RESTRICTION) ~= 0 then
        delaySendMenu(player, MENU_CURRENT)
    else
        if player:getVar(CHAR_INTERACTED) == 0 then
            player:PrintToPlayer(ironmanDialog.WARNING1, xi.msg.channel.SYSTEM_3)
            player:PrintToPlayer(ironmanDialog.WARNING2, xi.msg.channel.SYSTEM_3)
            delaySendMenu(player, MENU_ACCEPT)
        else
            player:PrintToPlayer(string.format("%s : %s", npc:getPacketName(), ironmanDialog.PREVENTED), xi.msg.channel.NS_SAY, npc:getPacketName())
        end
    end
end

local IRONMAN_NPC = {
    Bastok_Markets = {
        name = ironmanNPC.Bastok_Markets,
        objtype = xi.objType.NPC,
        look = 113,
        x = -197.5,
        y = -4.0,
        z = 79.7293,
        rotation = 0,
        widescan = 1,
        onTrigger = ironmanOnTrigger,
    },
    Port_San_dOria = {
        name = ironmanNPC.Port_San_dOria,
        objtype = xi.objType.NPC,
        look = 158,
        x = -58.5,
        y = -4.5,
        z = -42.5,
        rotation = 160,
        widescan = 1,
        onTrigger = ironmanOnTrigger,
    },
    Windurst_Walls = {
        name = ironmanNPC.Windurst_Walls,
        objtype = xi.objType.NPC,
        look = 165,
        x = 118.9,
        y = -11,
        z = 172,
        rotation = 96,
        widescan = 1,
        onTrigger = ironmanOnTrigger,
    }
}

-- Bastok Markets (Robin)
-- !pos -192.5 -4 80 235
m:addOverride("xi.zones.Bastok_Markets.Zone.onInitialize", function(zone)
    super(zone)
    local horro = zone:insertDynamicEntity(IRONMAN_NPC["Bastok_Markets"])
    utils.unused(horro)
end)

-- Port San d'Oria (Robinette)
-- !pos -60 -4.5 -39 232
m:addOverride("xi.zones.Port_San_dOria.Zone.onInitialize", function(zone)
    super(zone)
    local horro = zone:insertDynamicEntity(IRONMAN_NPC["Port_San_dOria"])
    utils.unused(horro)
end)

-- Windurst Walls (Robina)
-- !pos 114.5 -11 171 239
m:addOverride("xi.zones.Windurst_Walls.Zone.onInitialize", function(zone)
    super(zone)
    local horro = zone:insertDynamicEntity(IRONMAN_NPC["Windurst_Walls"])
    utils.unused(horro)
end)

return m
