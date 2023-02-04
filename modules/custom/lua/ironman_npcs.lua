-----------------------------------
-- Ironman NPCs
-- For use with ironman_mode.cpp module
-----------------------------------
require("modules/module_utils")
require('scripts/globals/items')
require("scripts/zones/Bastok_Markets/Zone")
-----------------------------------
local m = Module:new("ironman_npcs")
local CHAR_RESTRICTION = "CHAR_RESTRICTION"
local CHAR_INTERACTED = "CHAR_INTERACTED"

local rewards = {
    { lv = 18, id = xi.items.RABBIT_HIDE, desc = "(Lv18) Rabbit Hide" },
    { lv = 30, id = xi.items.XIPHOS, desc = "(Lv30) Xiphos" },
}

local function setIronmanRewards(player)
    local options = {}
    local playerLevel = player:getMainLvl()
    for _, v in pairs(rewards) do
        if playerLevel >= v.lv then
            table.insert(options, {
                v.desc, function(playerArg)
                    npcUtil.giveItem(player, v.id)
                end
            })
        end
    end
    return options
end

local menuReward = {
    title = "Choose an Ironman reward:",
    options = {},
}

local function ironmanOnTrigger(player, npc)
    if player:getVar(CHAR_RESTRICTION) ~= 0 then
        menuReward.options = setIronmanRewards(player)
        player:customMenu(menuReward)
    else
        if player:getVar(CHAR_INTERACTED) == 0 then
            player:PrintToPlayer("You are about to become an Ironman.", xi.msg.channel.SYSTEM_3)
            player:PrintToPlayer("Your character will no longer be able to party with regular adventurers, trade, or use the Auction House or Delivery Box.", xi.msg.channel.SYSTEM_3)
            player:customMenu({
                title = "Will you take the path alone?",
                options = {
                    {
                        "Become an Ironman",
                        function(playerArg, npc)
                            playerArg:setVar(CHAR_INTERACTED, 1)
                            playerArg:setVar(CHAR_RESTRICTION, 255)
                            playerArg:PrintToPlayer("This path will be long and difficult. It will take an iron will to see it through. Glory awaits you, adventurer.", xi.msg.channel.NS_SAY, npc:getPacketName())
                            playerArg:PrintToPlayer("You have become an Ironman.", xi.msg.channel.SYSTEM_3)
                        end
                    },
                    {
                        "Walk away",
                        function(playerArg, npc)
                            playerArg:PrintToPlayer("You've taken the easy road, adventurer. Disappointing.", xi.msg.channel.NS_SAY, npc:getPacketName())
                        end
                    }
                }
            })
        else
            player:PrintToPlayer("It's too late, adventurer. You've already taken another path.", xi.msg.channel.NS_SAY, npc:getPacketName())
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
