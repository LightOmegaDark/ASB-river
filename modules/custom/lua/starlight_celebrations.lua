-----------------------------------
-- Starlight Festival Dynamic Mobs and More
-----------------------------------
require("modules/module_utils")
require("scripts/zones/Southern_San_dOria/Zone")
require("scripts/zones/Northern_San_dOria/Zone")
require("scripts/zones/Bastok_Mines/Zone")
require("scripts/zones/Bastok_Markets/Zone")
require("scripts/zones/Port_Bastok/Zone")
require("scripts/zones/Windurst_Waters/Zone")
require("scripts/zones/Windurst_Walls/Zone")
require("scripts/zones/Port_Windurst/Zone")
require("scripts/zones/Windurst_Woods/Zone")
require("scripts/zones/Lower_Jeuno/Zone")
-----------------------------------

local m = Module:new("starlight_festival")

local onTriggerMoogle = function(player, npc)
    if npc:getID() == 17737984 then
        local stock =
        {
            4215,     40,
            4216,     40,
            4217,     25,
            4218,     100,
            4167,     8,
            4168,     25,
            4169,     25,
        }
        player:PrintToPlayer("Welcome, kupo!", 0, npc:getPacketName())
        xi.shop.general(player, stock)
    elseif npc:getID() == 17737986 then
        local stock =
        {
            4394,     10,
            4495,     50,
            15178,    3000,
        }
        player:PrintToPlayer("Welcome, kupo!", 0, npc:getPacketName())
        xi.shop.general(player, stock)
    end
end

m:addOverride("xi.zones.Northern_San_dOria.Zone.onInitialize", function(zone)

    super(zone)

    local starlight_moogle1 = zone:insertDynamicEntity({
        objType = xi.objType.NPC,
        name = "Moogle",
        look = "0x0000520000000000000000000000000000000000",
        x = -221.336,
        y = 7.999,
        z = 80.698,
        rotation = 1,
        widescan = 1,
    })

    local starlight_moogle2 = zone:insertDynamicEntity({
        objType = xi.objType.NPC,
        name = "Moogle",
        look = "0x0000520000000000000000000000000000000000",
        x = -224.346,
        y = 7.999,
        z = 80.698,
        rotation = 1,
        widescan = 1,
    })

    local nsEventStall = zone:insertDynamicEntity({
        objType = xi.objType.NPC,
        name = "blank",
        look = "0x0000140500000000000000000000000000000000",
        x = -222.863,
        y = 7.999,
        z = 80.730,
        rotation = 0,
        widescan = 0,
    })

    nsEventStall:setUntargetable(true)
    nsEventStall:hideName(true)

end)

m:addOverride("xi.zones.Bastok_Mines.Zone.onInitialize", function(zone)

    super(zone)

    local starlight_moogle3 = zone:insertDynamicEntity({
        objType = xi.objType.NPC,
        name = "Moogle",
        look = "0x0000520000000000000000000000000000000000",
        x = -39.500,
        y = 0.000,
        z = -82.000,
        rotation = 0,
        widescan = 1,

        onTrigger = onTriggerMoogle
    })

    local bmEventStall = zone:insertDynamicEntity({
        objType = xi.objType.NPC,
        name = "blank",
        look = "0x00000F0500000000000000000000000000000000",
        x = -40.000,
        y = 0.000,
        z = -80.000,
        rotation = 0,
        widescan = 0,
    })

    bmEventStall:setUntargetable(true)
    bmEventStall:hideName(true)

end)

m:addOverride("xi.zones.Bastok_Mines.Zone.onInitialize", function(zone)

    super(zone)

    local starlight_moogle4 = zone:insertDynamicEntity({
        objType = xi.objType.NPC,
        name = "Moogle",
        look = "0x0000520000000000000000000000000000000000",
        x = -39.500,
        y = 0.000,
        z = -78.000,
        rotation = 0,
        widescan = 1,

        onTrigger = onTriggerMoogle
    })

end)

m:addOverride("xi.zones.Windurst_Waters.Zone.onInitialize", function(zone)

    super(zone)

    local starlight_moogle5 = zone:insertDynamicEntity({
        objType = xi.objType.NPC,
        name = "Moogle",
        look = "0x0000520000000000000000000000000000000000",
        x = -12.140,
        y = -1.000,
        z = 28.499,
        rotation = 0,
        widescan = 1,
    })

    local starlight_moogle6 = zone:insertDynamicEntity({
        objType = xi.objType.NPC,
        name = "Moogle",
        look = "0x0000520000000000000000000000000000000000",
        x = -12.140,
        y = -1.000,
        z = 25.609,
        rotation = 0,
        widescan = 1,
    })

    local wwEventStall = zone:insertDynamicEntity({
        objType = xi.objType.NPC,
        name = "blank",
        look = "0x0000160500000000000000000000000000000000",
        x = -12.033,
        y = -1.000,
        z = 27.040,
        rotation = 0,
        widescan = 0,
    })

    wwEventStall:setUntargetable(true)
    wwEventStall:hideName(true)

end)

m:addOverride("xi.zones.Lower_Jeuno.Zone.onInitialize", function(zone)

    super(zone)

    local jeunoBigTree1 = zone:insertDynamicEntity({
        objType = xi.objType.NPC,
        name = "blank",
        look = 1241,
        x = -16.1250,
        y = 0.8397,
        z = 5.4297,
        rotation = 53,
        widescan = 0,
    })

    local jeunoBanners1 = zone:insertDynamicEntity({
        objType = xi.objType.NPC,
        name = "blank",
        look = 1243,
        x = 6.3376,
        y = 1.9000,
        z = 23.6949,
        rotation = 85,
        widescan = 0,
    })

    local jeunoTree1 = zone:insertDynamicEntity({
        objType = xi.objType.NPC,
        name = "blank",
        look = 766,
        x = -6.8849,
        y = -0.1000,
        z = -15.2041,
        rotation = 0,
        widescan = 0,
    })

    local jeunoTree2 = zone:insertDynamicEntity({
        objType = xi.objType.NPC,
        name = "blank",
        look = 766,
        x = -18.3405,
        y = -0.1000,
        z = -35.6283,
        rotation = 0,
        widescan = 0,
    })

    local jeunoTree3 = zone:insertDynamicEntity({
        objType = xi.objType.NPC,
        name = "blank",
        look = 766,
        x = -28.0633,
        y = -0.1000,
        z = -55.2038,
        rotation = 0,
        widescan = 0,
    })

    local jeunoTree4 = zone:insertDynamicEntity({
        objType = xi.objType.NPC,
        name = "blank",
        look = 766,
        x = -69.7005,
        y = -0.1000,
        z = -127.3172,
        rotation = 0,
        widescan = 0,
    })

    local jeunoTree5 = zone:insertDynamicEntity({
        objType = xi.objType.NPC,
        name = "blank",
        look = 766,
        x = -86.1038,
        y = -0.1000,
        z = -143.9980,
        rotation = 0,
        widescan = 0,
    })

    local jeunoTree6 = zone:insertDynamicEntity({
        objType = xi.objType.NPC,
        name = "blank",
        look = 766,
        x = -92.3048,
        y = -0.1000,
        z = -155.1194,
        rotation = 0,
        widescan = 0,
    })

    local jeunoTree7 = zone:insertDynamicEntity({
        objType = xi.objType.NPC,
        name = "blank",
        look = 766,
        x = -90.9425,
        y = -0.1000,
        z = -160.1327,
        rotation = 0,
        widescan = 0,
    })

    local jeunoTree8 = zone:insertDynamicEntity({
        objType = xi.objType.NPC,
        name = "blank",
        look = 766,
        x = -94.2040,
        y = -0.1000,
        z = -184.0553,
        rotation = 0,
        widescan = 0,
    })

    local jeunoTree9 = zone:insertDynamicEntity({
        objType = xi.objType.NPC,
        name = "blank",
        look = 766,
        x = -53.2500,
        y = -6.000,
        z = -114.3925,
        rotation = 0,
        widescan = 0,
    })

    jeunoBigTree1:setNpcFlags(0x00000200)
    jeunoBanners1:setNpcFlags(0x00000200)
    jeunoTree1:setNpcFlags(0x00000200)
    jeunoTree2:setNpcFlags(0x00000200)
    jeunoTree3:setNpcFlags(0x00000200)
    jeunoTree4:setNpcFlags(0x00000200)
    jeunoTree5:setNpcFlags(0x00000200)
    jeunoTree6:setNpcFlags(0x00000200)
    jeunoTree7:setNpcFlags(0x00000200)
    jeunoTree8:setNpcFlags(0x00000200)
    jeunoTree9:setNpcFlags(0x00000200)

end)

m:addOverride("xi.zones.GM_Home.Zone.onInitialize", function(zone)

    -- Call the zone's original function for onInitialize
    super(zone)

    -- Insert NPC into zone
    local horro = zone:insertDynamicEntity({

        -- NPC or MOB
        objtype = xi.objType.NPC,

        -- The name visible to players
        -- NOTE: Even if you plan on making the name invisible, we're using it internally for lookups
        --     : So populate it with something unique-ish even if you aren't going to use it.
        --     : You can then hide the name with entity:hideName(true)
        -- NOTE: This name CAN include spaces and underscores.
        name = "Horro",

        -- You can use regular model ids (See documentation/model_ids.txt, or play around with !costume)
        look = 2430,

        -- You can also use the raw packet look information (as a string), as seen in npc_list and mob_pools
        -- look = "0x0100020500101120003000400050006000700000",

        -- Set the position using in-game x, y and z
        x = 5.000,
        y = 0.000,
        z = 0.000,

        -- Rotation is scaled 0-255, with 0 being East
        rotation = 128,

        -- Overriding widescan is only available to NPCs.
        widescan = 1,

        -- onTrade and onTrigger can be hooked up to your dynamic entity,
        -- just like with regular entities. You can also omit these.
        onTrade = function(player, npc, trade)
            -- NOTE: We have to use getPacketName, because the regular name is modified and being used
            --     : for internal lookups
            player:PrintToPlayer("No, thanks!", 0, npc:getPacketName())
        end,

        -- The entity will not be "triggerable" unless you populate onTrigger
        onTrigger = function(player, npc)
            -- NOTE: We have to use getPacketName, because the regular name is modified and being used
            --     : for internal lookups
            player:PrintToPlayer("Welcome to GM Home!", 0, npc:getPacketName())
        end,
    })

    -- Use the mob object however you like
    -- horro:getID() etc.
    -- We're not doing anything with it, so ignore this object
    utils.unused(horro)

    -- You could also just not capture the object
    -- zone:insertDynamicEntity({ ...
end)

return m
