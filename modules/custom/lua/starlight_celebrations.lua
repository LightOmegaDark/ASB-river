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

return m
