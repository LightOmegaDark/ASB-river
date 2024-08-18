-- --------------------------------------------------------
-- AirSkyBoat Database Conversion File
-- --------------------------------------------------------

UPDATE `abilities` SET meritModID = 1222 WHERE abilityId = 68; -- super_jump
UPDATE `abilities` SET recastTime = 15 WHERE abilityId = 229; -- pianissimo
UPDATE `abilities` SET addType = 0, content_tag = NULL WHERE abilityId = 316; -- perpetuance
UPDATE `abilities` SET animation = 0 WHERE abilityId = 382; -- relinquish
UPDATE `abilities` SET content_tag = 'SOA' WHERE abilityId = 393; -- spirit_bond
UPDATE `abilities` SET content_tag = 'SOA' WHERE abilityId = 394; -- majesty
UPDATE `abilities` SET animation = 6 WHERE abilityId = 512; -- healing_ruby
UPDATE `abilities` SET animation = 11 WHERE abilityId = 513; -- poison_nails
UPDATE `abilities` SET animation = 44 WHERE abilityId = 514; -- shining_ruby
UPDATE `abilities` SET animation = 62 WHERE abilityId = 515; -- glittering_ruby
UPDATE `abilities` SET animation = 108 WHERE abilityId = 516; -- meteorite
UPDATE `abilities` SET animation = 124 WHERE abilityId = 517; -- healing_ruby_ii
UPDATE `abilities` SET animation = 0 WHERE abilityId = 518; -- searing_light
UPDATE `abilities` SET animation = 8 WHERE abilityId = 576; -- barracuda_dive
UPDATE `abilities` SET animation = 24 WHERE abilityId = 577; -- water_ii
UPDATE `abilities` SET animation = 49 WHERE abilityId = 578; -- tail_whip
UPDATE `abilities` SET validTarget = 1, animation = 99 WHERE abilityId = 579; -- spring_water
UPDATE `abilities` SET animation = 48 WHERE abilityId = 580; -- slowga
UPDATE `abilities` SET animation = 118 WHERE abilityId = 581; -- water_iv
UPDATE `abilities` SET animation = 164 WHERE abilityId = 582; -- spinning_dive
UPDATE `abilities` SET animation = 182 WHERE abilityId = 583; -- grand_fall
UPDATE `abilities` SET animation = 0 WHERE abilityId = 584; -- tidal_wave
UPDATE `abilities` SET job = 15, validTarget = 4, recastTime = 60, recastId = 173, animation = 0, `range` = 18.0, isAOE = 1, CE = 1, VE = 60, addType = 2 WHERE abilityId = 664; -- ruinous_omen
UPDATE `abilities` SET name = '1000_needles' WHERE abilityId = 699; -- 1000_needles
UPDATE `abilities` SET name = 'power_attack_beetle' WHERE abilityId = 707; -- power_attack_beetle
UPDATE `abilities` SET name = 'sand_blast' WHERE abilityId = 714; -- sand_blast
UPDATE `abilities` SET name = 'sand_pit' WHERE abilityId = 715; -- sand_pit
UPDATE `abilities` SET animationTime = 2001 WHERE abilityId = 765; -- sweeping_gouge
UPDATE `abilities` SET castTime = 1 WHERE abilityId = 766; -- zealous_snort
UPDATE `abilities` SET castTime = 1 WHERE abilityId = 768; -- tickling_tendrils
UPDATE `abilities` SET job = 9, level = 25, validTarget = 257, recastTime = 1, recastId = 102, animation = 0, `range` = 19.0 WHERE abilityId = 773; -- pacifying_ruby
