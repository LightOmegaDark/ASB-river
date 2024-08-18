-- --------------------------------------------------------
-- AirSkyBoat Database Conversion File
-- --------------------------------------------------------

-- Ready
UPDATE `abilities_charges` SET chargeTime = 60, meritModID = 902 WHERE recastId = 102; -- Chartime and Merit ID fix
