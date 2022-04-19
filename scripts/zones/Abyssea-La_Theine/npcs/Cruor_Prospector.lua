-----------------------------------
-- Area: Abyssea - La Theine
--  NPC: Cruor Prospector
-- Type: Cruor NPC
-- !pos 132.000 -75.856 -822.000 15
-----------------------------------
require("scripts/globals/abyssea")
require("scripts/globals/keyitems")
require("scripts/globals/status")
require("scripts/globals/settings")
-----------------------------------
local entity = {}

local itemType = xi.abyssea.itemType

local localProspectorItems =
{
    [itemType.ITEM] = xi.abyssea.visionsCruorProspectorItems,

    [itemType.TEMP] =
    {-- Sel      Item                          Cost, Qty
        [ 1] = { xi.items.LUCID_POTION_I,             80 },
        [ 2] = { xi.items.LUCID_ETHER_I,              80 },
        [ 3] = { xi.items.BOTTLE_OF_CATHOLICON,       80 },
        [ 4] = { xi.items.DUSTY_ELIXIR,              120 },
        [ 5] = { xi.items.TUBE_OF_CLEAR_SALVE_I,     120 },
        [ 6] = { xi.items.BOTTLE_OF_STALWARTS_TONIC, 150 },
        [ 7] = { xi.items.BOTTLE_OF_ASCETICS_TONIC,  150 },
        [ 8] = { xi.items.BOTTLE_OF_CHAMPIONS_TONIC, 150 },
        [ 9] = { xi.items.LUCID_POTION_II,           200 },
        [10] = { xi.items.LUCID_ETHER_II,            200 },
        [11] = { xi.items.LUCID_ELIXIR_I,            300 },
        [12] = { xi.items.FLASK_OF_HEALING_POWDER,   300 },
        [13] = { xi.items.PINCH_OF_MANA_POWDER,      300 },
        [14] = { xi.items.TUBE_OF_HEALING_SALVE_I,   300 },
        [15] = { xi.items.BOTTLE_OF_VICARS_DRINK,    300 },
        [16] = { xi.items.TUBE_OF_CLEAR_SALVE_II,    300 },
        [17] = { xi.items.PRIMEVAL_BREW,         2000000 },
    },

    [itemType.KEYITEM] =
    {
    --  Sel     Item                                Cost
        [1] = { xi.ki.MAP_OF_ABYSSEA_LA_THEINE,     3500 },
        [2] = { xi.ki.IVORY_ABYSSITE_OF_SOJOURN,    6000 },
        [3] = { xi.ki.IVORY_ABYSSITE_OF_CONFLUENCE, 4800 },
        [4] = { xi.ki.IVORY_ABYSSITE_OF_EXPERTISE,  4800 },
        [5] = { xi.ki.CLEAR_DEMILUNE_ABYSSITE,       300 },
    },

    [itemType.ENHANCEMENT] = xi.abyssea.visionsCruorProspectorBuffs,
}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.abyssea.visionsCruorProspectorOnTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    xi.abyssea.visionsCruorProspectorOnEventFinish(player, csid, option, localProspectorItems)
end

return entity
