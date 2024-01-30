-- --------------------------------------------------------
-- AirSkyBoat Database Conversion File
-- --------------------------------------------------------

-- Adds Level Restriction back into the zones
UPDATE `zone_settings` SET restriction = 30 WHERE `name` = "Promyvion-Holla";
UPDATE `zone_settings` SET restriction = 30 WHERE `name` = "Promyvion-Dem";
UPDATE `zone_settings` SET restriction = 30 WHERE `name` = "Promyvion-Mea";
UPDATE `zone_settings` SET restriction = 50 WHERE `name` = "Promyvion-Vahzl";
UPDATE `zone_settings` SET restriction = 40 WHERE `name` = "Phomiuna_Aqueducts";
UPDATE `zone_settings` SET restriction = 50 WHERE `name` = "Sacrarium";
UPDATE `zone_settings` SET restriction = 50 WHERE `name` = "Riverne-Site_B01";
UPDATE `zone_settings` SET restriction = 40 WHERE `name` = "Riverne-Site_A01";

-- Remove mount flag from zones that cannot have Chocobos prior to mounts being added
-- This will subtract the bitwise 4 from the misc column only if the bitwise exists
UPDATE `zone_settings` SET `misc` = `misc` & ~4 WHERE `zoneid` IN (5, 7, 24, 25, 111, 112, 113, 122, 126, 127, 128) AND (`misc` & 4) <> 0;

-- Dynamis Zones
UPDATE `zone_settings` SET `misc` = `misc` | 256 WHERE `name` LIKE "Dynamis%" AND `name` NOT LIKE "Dynamis_%_[D]" AND ((`misc` & 256) = 0); -- Adds zonewide loot pool if it does not have it
UPDATE `zone_settings` SET `misc` = `misc` & ~8 WHERE (name = "Dynamis-San_dOria" OR name = "Dynamis-Windurst" OR name = "Dynamis-Bastok" OR name = "Dynamis-Jeuno" OR name = "Dynamis-Tavnazia") AND (`misc` & 8) = 8;
