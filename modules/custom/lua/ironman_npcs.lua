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

local function menuRewards(player, npc)
    local menuReward = {
        title = ironmanDialog.MENU_REWARD.TITLE,
        options = {},
    }
    menuReward.options = setIronmanRewards(player)
    player:customMenu(menuReward)
end

local function menuRetire(player, npc)
    player:PrintToPlayer(ironmanDialog.RETIRE_WARNING, xi.msg.channel.SYSTEM_3)
    player:customMenu({
        title = ironmanDialog.MENU_RETIRE.TITLE,
        options = {
            {
                ironmanDialog.MENU_RETIRE.AGREE,
                function(playerArg, npc)
                    playerArg:PrintToPlayer(ironmanDialog.RETIRED, xi.msg.channel.SYSTEM_3)
                    playerArg:setVar(CHAR_RESTRICTION, 0)
                end
            },
            { ironmanDialog.MENU_RETIRE.DECLINE, function() end },
        }
    })
end

local function menuCurrent(player, npc)
    player:customMenu({
        title = ironmanDialog.MENU_CURRENT.TITLE,
        options = {
            { ironmanDialog.MENU_CURRENT.REWARDS, menuRewards },
            { ironmanDialog.MENU_CURRENT.RETIRE, menuRetire },
            { ironmanDialog.MENU_CURRENT.NOTHING, function() end }
        }
    })
end

local function menuAccept(player, npc)
    player:PrintToPlayer(ironmanDialog.WARNING1, xi.msg.channel.SYSTEM_3)
    player:PrintToPlayer(ironmanDialog.WARNING2, xi.msg.channel.SYSTEM_3)
    player:customMenu({
        title = ironmanDialog.MENU_ACCEPT.TITLE,
        options = {
            {
                ironmanDialog.MENU_ACCEPT.AGREE,
                function(playerArg, npc)
                    playerArg:setVar(CHAR_INTERACTED, 1)
                    playerArg:setVar(CHAR_RESTRICTION, 255)
                    playerArg:PrintToPlayer(ironmanDialog.ACCEPTED1, xi.msg.channel.NS_SAY, npc:getPacketName())
                    playerArg:PrintToPlayer(ironmanDialog.ACCEPTED2, xi.msg.channel.SYSTEM_3)
                end
            },
            {
                ironmanDialog.MENU_ACCEPT.DECLINE,
                function(playerArg, npc)
                    playerArg:PrintToPlayer(ironmanDialog.MENU_ACCEPT.EXIT, xi.msg.channel.NS_SAY, npc:getPacketName())
                end
            }
        }
    })
end

local function ironmanOnTrigger(player, npc)
    if player:getVar(CHAR_RESTRICTION) ~= 0 then
        menuCurrent(player, npc)
    else
        if player:getVar(CHAR_INTERACTED) == 0 then
            menuAccept(player, npc)
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

m:addOverride("xi.zones.Bastok_Markets.Zone.onInitialize", function(zone)
    super(zone)
    local horro = zone:insertDynamicEntity(IRONMAN_NPC["Bastok_Markets"])
    utils.unused(horro)
end)

m:addOverride("xi.zones.Port_San_dOria.Zone.onInitialize", function(zone)
    super(zone)
    local horro = zone:insertDynamicEntity(IRONMAN_NPC["Port_San_dOria"])
    utils.unused(horro)
end)

m:addOverride("xi.zones.Windurst_Walls.Zone.onInitialize", function(zone)
    super(zone)
    local horro = zone:insertDynamicEntity(IRONMAN_NPC["Windurst_Walls"])
    utils.unused(horro)
end)

return m
