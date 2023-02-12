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
    ACCEPTED1 = "This path will be long and difficult. It will take an iron will to see it through",
    ACCEPTED2 = "You have become an Ironman.",
    RETIRE_WARNING = "Warning: You will no longer be an Ironman or eligible for Ironman rewards. This cannot be undone.",
    RETIRE = "You are no longer an Ironman.",
}

-- TODO: Add pagination
local ironmanRewards = {
    REWARD_LV_18 = { lv = 18, id = xi.items.RABBIT_HIDE, desc = "Rabbit Hide" },
    REWARD_LV_30 = { lv = 30, id = xi.items.WILD_ONION, desc = "Wild Onion" },
    REWARD_LV_50 = { lv = 50, id = xi.items.XIPHOS, desc = "Xiphos" },
}

m:loadSettings(ironmanDialog)
m:loadSettings(ironmanRewards)

local menu  = {}

local delaySendMenu = function(player, menuNext)
    menu = menuNext
    player:timer(50, function(playerArg)
        playerArg:customMenu(menu)
    end)
end

local function setIronmanRewards(player)
    local options = {}
    local playerLevel = player:getMainLvl()
    for _, v in pairs(ironmanRewards) do
        if playerLevel >= v.lv then
            table.insert(options, {
                string.format("(%d) %s", v.lv, v.desc), function(playerArg)
                    npcUtil.giveItem(playerArg, v.id)
                end
            })
        end
    end
    return options
end

local MENU_REWARD = {
    title = ironmanDialog.MENU_REWARD.TITLE,
    options = {},
}

local MENU_RETIRE = {
    title = ironmanDialog.MENU_RETIRE.TITLE,
    options = {
        {
            ironmanDialog.MENU_RETIRE.AGREE,
            function(player)
                player:PrintToPlayer(ironmanDialog.RETIRE, xi.msg.channel.SYSTEM_3)
                player:setVar(CHAR_RESTRICTION, 0)
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
                player:setVar(CHAR_INTERACTED, 1)
                player:setVar(CHAR_RESTRICTION, 255)
                player:PrintToPlayer(ironmanDialog.ACCEPTED1, xi.msg.channel.NS_SAY)
                player:PrintToPlayer(ironmanDialog.ACCEPTED2, xi.msg.channel.SYSTEM_3)
            end,
        },
        {
            ironmanDialog.MENU_ACCEPT.DECLINE,
            function(player)
                player:PrintToPlayer(ironmanDialog.MENU_ACCEPT.EXIT, xi.msg.channel.NS_SAY)
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
            player:PrintToPlayer(ironmanDialog.PREVENTED, xi.msg.channel.NS_SAY, npc:getPacketName())
        end
    end
end

local IRONMAN_NPC = {
    Bastok_Markets = {
        name = "Robin",
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
        name = "Robinette",
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
        name = "Robina",
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
