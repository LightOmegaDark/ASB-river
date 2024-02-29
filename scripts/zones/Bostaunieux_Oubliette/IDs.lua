-----------------------------------
-- Area: Bostaunieux_Oubliette
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[xi.zone.BOSTAUNIEUX_OUBLIETTE] =
{
    text =
    {
        CONQUEST_BASE                 = 0,     -- Tallying conquest results...
        ITEM_CANNOT_BE_OBTAINED       = 6543,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                 = 6549,  -- Obtained: <item>.
        GIL_OBTAINED                  = 6550,  -- Obtained <number> gil.
        KEYITEM_OBTAINED              = 6552,  -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY       = 6563,  -- There is nothing out of the ordinary here.
        FELLOW_MESSAGE_OFFSET         = 6578,  -- I'm ready. I suppose.
        CARRIED_OVER_POINTS           = 7160,  -- You have carried over <number> login point[/s].
        LOGIN_CAMPAIGN_UNDERWAY       = 7161,  -- The [/January/February/March/April/May/June/July/August/September/October/November/December] <number> Login Campaign is currently underway!
        LOGIN_NUMBER                  = 7162,  -- In celebration of your most recent login (login no. <number>), we have provided you with <number> points! You currently have a total of <number> points.
        MEMBERS_LEVELS_ARE_RESTRICTED = 7182,  -- Your party is unable to participate because certain members' levels are restricted.
        FISHING_MESSAGE_OFFSET        = 7220,  -- You can't fish here.
        CHUMIA_DIALOG                 = 7320,  -- Welcome to Bostaunieux Oubliette...
        SEEMS_LOCKED                  = 7322,  -- It seems to be locked.
        SPIRAL_HELL_LEARNED           = 7429,  -- You have learned the weapon skill Spiral Hell!
        SENSE_OMINOUS_PRESENCE        = 7430,  -- You sense an ominous presence...
        ITEMS_ITEMS_LA_LA             = 7433,  -- You can hear a strange voice... Items, items, la la la la la
        GOBLIN_SLIPPED_AWAY           = 7439,  -- The Goblin slipped away when you were not looking...
        REGIME_REGISTERED             = 9544,  -- New training regime registered!
        PLAYER_OBTAINS_ITEM           = 10596, -- <name> obtains <item>!
        UNABLE_TO_OBTAIN_ITEM         = 10597, -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM      = 10598, -- <name> obtains the temporary item: <item>!
        ALREADY_POSSESS_TEMP          = 10599, -- You already possess that temporary item.
        NO_COMBINATION                = 10604, -- You were unable to enter a combination.
        LEARNS_SPELL                  = 10628, -- <name> learns <spell>!
        UNCANNY_SENSATION             = 10630, -- You are assaulted by an uncanny sensation.
        COMMON_SENSE_SURVIVAL         = 10637, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
        UNITY_WANTED_BATTLE_INTERACT  = 10701, -- Those who have accepted % must pay # Unity accolades to participate. The content for this Wanted battle is #. [Ready to begin?/You do not have the appropriate object set, so your rewards will be limited.]
    },
    mob =
    {
        SEWER_SYRUP_PH          =
        {
            [17461305] = 17461307, -- -19.000 1.000 -173.000
            [17461306] = 17461307, -- -20.000 1.000 -148.000
        },
        SHII_PH                 =
        {
            [17461308] = 17461315, -- 18.3006 0 -131.5690
            [17461309] = 17461315, -- 13.6767 0 -143.4924
            [17461310] = 17461315, -- 25.3819 0 -144.8448
        },
        ARIOCH_PH               =
        {
            [17461423] = 17461433, -- 185.5569 0.25 -30.129
            [17461424] = 17461433, -- 207.9469 0.27 -24.612
            [17461425] = 17461433, -- 214.6572 0.25 -42.176
            [17461426] = 17461433, -- 198.9731 0.25 -55.557
        },
        MANES_PH                =
        {
            [17461470] = 17461471,
            [17461476] = 17461471,
        },
        DREXERION_THE_CONDEMNED = 17461338,
        PHANDURON_THE_CONDEMNED = 17461343,
        BLOODSUCKER             = 17461478,
        BODACH                  = 17461479,
        MANES                   = 17461471,
        SHII                    = 17461315,
    },
    npc =
    {
        TRAPDOOR =
        {
            17461534,
            17461535,
            17461536,
            17461537,
            17461538,
            17461539,
            17461540,
            17461541,
            17461542,
            17461543,
            17461544,
            17461545,
            17461546,
            17461547,
            17461548,
            17461549,
            17461550,
            17461551,
            17461552,
            17461553,
            17461554,
            17461555,
            17461556,
            17461557,
            17461558,
        },
    },
}

return zones[xi.zone.BOSTAUNIEUX_OUBLIETTE]
