-- ---------------------------------------------------------------------------
--  Notes: Reverts mob levels to original 75 cap levels
-- Format: (groupid,poolid,zoneid,name,respawntime,spawntype,dropid,HP,MP,minLevel,maxLevel,allegiance)
-- ---------------------------------------------------------------------------

-- ------------------------------------------------------------
-- Add content_tag to zones
-- ------------------------------------------------------------
LOCK TABLE `mob_groups` WRITE;

ALTER TABLE `mob_groups`
    ADD COLUMN IF NOT EXISTS `content_tag` varchar(14) DEFAULT NULL AFTER `allegiance`;

UPDATE mob_groups SET content_tag='COP' WHERE zoneid = '1' OR zoneid = '2' OR zoneid = '3' OR zoneid = '4' OR zoneid = '5'
                  OR zoneid = '6'  OR zoneid = '7'  OR zoneid = '8'  OR zoneid = '7'  OR zoneid = '8'  OR zoneid = '9'  OR zoneid = '10'
                  OR zoneid = '11' OR zoneid = '12' OR zoneid = '13' OR zoneid = '16' OR zoneid = '17' OR zoneid = '18' OR zoneid = '19'
                  OR zoneid = '20' OR zoneid = '21' OR zoneid = '22' OR zoneid = '23' OR zoneid = '24' OR zoneid = '25' OR zoneid = '26'
                  OR zoneid = '27' OR zoneid = '28' OR zoneid = '29' OR zoneid = '30' OR zoneid = '31' OR zoneid = '32' OR zoneid = '33'
                  OR zoneid = '34' OR zoneid = '35' OR zoneid = '36' OR zoneid = '37' OR zoneid = '38';

UPDATE mob_groups SET content_tag='TOAU' WHERE zoneid = '46' OR zoneid = '47' OR zoneid = '48' OR zoneid = '49' OR zoneid = '50' OR zoneid = '51'
                  OR zoneid = '52' OR zoneid = '53' OR zoneid = '54' OR zoneid = '55' OR zoneid = '56' OR zoneid = '57' OR zoneid = '58' OR zoneid = '59'
                  OR zoneid = '60' OR zoneid = '61' OR zoneid = '62' OR zoneid = '63' OR zoneid = '64' OR zoneid = '65' OR zoneid = '66' OR zoneid = '67'
                  OR zoneid = '68' OR zoneid = '69' OR zoneid = '70' OR zoneid = '71' OR zoneid = '72' OR zoneid = '73' OR zoneid = '74' OR zoneid = '75'
                  OR zoneid = '76' OR zoneid = '77' OR zoneid = '78' OR zoneid = '79';

UPDATE mob_groups SET content_tag='WOTG' WHERE zoneid = '80' OR zoneid = '81' OR zoneid = '82' OR zoneid = '83' OR zoneid = '84' OR zoneid = '85'
                  OR zoneid = '86' OR zoneid = '87' OR zoneid = '88' OR zoneid = '89' OR zoneid = '90' OR zoneid = '91' OR zoneid = '92' OR zoneid = '93'
                  OR zoneid = '94' OR zoneid = '95' OR zoneid = '96' OR zoneid = '97' OR zoneid = '98' OR zoneid = '99' OR zoneid = '136' OR zoneid = '137'
                  OR zoneid = '138' OR zoneid = '155' OR zoneid = '156' OR zoneid = '164' OR zoneid = '171' OR zoneid = '175' OR zoneid = '182';

UPDATE mob_groups SET content_tag='ABYSSEA' WHERE zoneid = '15' OR zoneid = '45' OR zoneid = '132' OR zoneid = '215' OR zoneid = '216'
                  OR zoneid = '217' OR zoneid = '218' OR zoneid = '253' OR zoneid = '254' OR zoneid = '255' OR zoneid = '44'
                  OR zoneid = '183' OR zoneid = '287';

UPDATE mob_groups SET content_tag='SOA' WHERE zoneid = '258' OR zoneid = '259' OR zoneid = '260' OR zoneid = '261' OR zoneid = '262' OR zoneid = '263'
                  OR zoneid = '262' OR zoneid = '263' OR zoneid = '264' OR zoneid = '265' OR zoneid = '266' OR zoneid = '267' OR zoneid = '268' OR zoneid = '269'
                  OR zoneid = '270' OR zoneid = '271' OR zoneid = '272' OR zoneid = '273' OR zoneid = '274' OR zoneid = '275' OR zoneid = '276' OR zoneid = '277'
                  OR zoneid = '278' OR zoneid = '279' OR zoneid = '280' OR zoneid = '281' OR zoneid = '282' OR zoneid = '283' OR zoneid = '284' OR zoneid = '285'
                  OR zoneid = '286' OR zoneid = '287';

UPDATE mob_groups SET content_tag='ROV' WHERE zoneid = '288' OR zoneid = '289' OR zoneid = '290' OR zoneid = '291' OR zoneid = '292' OR zoneid = '293'
                  OR zoneid = '294' OR zoneid = '295' OR zoneid = '296' OR zoneid = '297' OR zoneid = '298';

UPDATE mob_groups SET content_tag='NEODYNA' WHERE zoneid = '39' OR zoneid = '40' OR zoneid = '41' OR zoneid = '42' OR zoneid = '134' OR zoneid = '135'
                  OR zoneid = '185' OR zoneid = '186' OR zoneid = '187' OR zoneid = '188';

-- ------------------------------------------------------------
-- Phanauet_Channel (Zone 1)
-- ------------------------------------------------------------
UPDATE mob_groups SET HP = 4000 WHERE groupid = 12 AND zoneid = 1; -- Vodyanoi

-- ------------------------------------------------------------
-- Carpenters_Landing (Zone 2)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Tempest_Tigon' AND groupid = '31' AND zoneid = '2';
UPDATE mob_groups set minLevel = 21 WHERE name = "Marsh_Funguar" and zoneid =2;
UPDATE mob_groups set minLevel = 24, maxLevel = 38 WHERE name = "Thunder_Elemental" and zoneid =2;
UPDATE mob_groups set minLevel = 24, maxLevel = 38 WHERE name = "Water_Elemental" and zoneid =2;

UPDATE mob_groups SET dropid = 481 WHERE groupid = 3 AND zoneid = 2; -- Clipper_fished
UPDATE mob_groups SET poolid = 20007 WHERE groupid = 7 AND zoneid = 2; -- Poison_Funguar
UPDATE mob_groups SET poolid = 20013 WHERE groupid = 17 AND zoneid = 2; -- Land_Pugil
UPDATE mob_groups SET dropid = 283 WHERE groupid = 23 AND zoneid = 2; -- Orcish_Serjeant
UPDATE mob_groups SET dropid = 6027 WHERE groupid = 27 AND zoneid = 2; -- Will-o-the-Wisp
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 31 AND zoneid = 2; -- Tempest_Tigon
UPDATE mob_groups SET dropid = 2318 WHERE groupid = 32 AND zoneid = 2; -- Diving_Beetle
UPDATE mob_groups SET HP = 5800 WHERE groupid = 42 AND zoneid = 2; -- Cryptonberry_Executor
UPDATE mob_groups SET HP = 4000 WHERE groupid = 43 AND zoneid = 2; -- Cryptonberry_Assassin
UPDATE mob_groups SET HP = 4000 WHERE groupid = 44 AND zoneid = 2; -- Cryptonberry_Assassin
UPDATE mob_groups SET HP = 4000 WHERE groupid = 45 AND zoneid = 2; -- Cryptonberry_Assassin

-- ------------------------------------------------------------
-- Bibiki_Bay (Zone 4)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Camelopard' AND groupid = '41' AND zoneid = '4';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Bight_Rarab' AND groupid = '40' AND zoneid = '4';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Hypnos_Eft' AND groupid = '44' AND zoneid = '4';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Shankha' AND groupid = '17' AND zoneid = '4';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Splacknuck' AND groupid = '37' AND zoneid = '4';
UPDATE mob_groups set maxLevel = 35 WHERE name = "Eft" and zoneid = 4;
UPDATE mob_groups set minLevel = 34 WHERE name = "Goblin_Shaman" and zoneid = 4;
UPDATE mob_groups set minLevel = 34 WHERE name = "Goblin_Pathfinder" and zoneid = 4;
UPDATE mob_groups set maxLevel = 38 WHERE name = "Island_Rarab" and zoneid = 4;
UPDATE mob_groups set minLevel = 36 WHERE name = "Jagil" and zoneid = 4;
UPDATE mob_groups set maxLevel = 40 WHERE name = "Kraken" and zoneid = 4;
UPDATE mob_groups set minLevel = 40, maxLevel = 42 WHERE name = "Lancet_Jagil" and zoneid = 4;
UPDATE mob_groups set minLevel = 67 WHERE name = "Goblins_Rarab" and zoneid =4 and groupid = 29;
UPDATE mob_groups set maxLevel = 78 WHERE name = "Teine_Sith" and zoneid = 4;
UPDATE mob_groups set maxLevel = 79 WHERE name = "Tartarus_Eft" and zoneid = 4;
UPDATE mob_groups set minLevel = 77, maxLevel = 79 WHERE name = "Hobgoblin_Blagger" and zoneid = 4;
UPDATE mob_groups set minLevel = 77, maxLevel = 79 WHERE name = "Hobgoblin_Toreador" and zoneid = 4;
UPDATE mob_groups set minLevel = 77, maxLevel = 79 WHERE name = "Hobgoblin_Physician" and zoneid = 4;
UPDATE mob_groups set minLevel = 77, maxLevel = 79 WHERE name = "Hobgoblin_Alastor" and zoneid = 4;
UPDATE mob_groups set minLevel = 80, maxLevel = 80 WHERE name = "Hobgoblin_Angler" and zoneid = 4;

UPDATE mob_groups SET dropid = 248 WHERE groupid = 3 AND zoneid = 4; -- Greater_Pugil_fished
UPDATE mob_groups SET HP = 3000 WHERE groupid = 18 AND zoneid = 4; -- Peerifool
UPDATE mob_groups SET dropid = 6027 WHERE groupid = 30 AND zoneid = 4; -- Teine_Sith
UPDATE mob_groups SET dropid = 2905 WHERE groupid = 36 AND zoneid = 4; -- Tartarus_Eft
UPDATE mob_groups SET minLevel = 50, maxLevel = 51 WHERE groupid = 46 AND zoneid = 4; -- Rohemolipaud
UPDATE mob_groups SET HP = 11000 WHERE groupid = 47 AND zoneid = 4; -- Dalham

-- Locus Mobs
UPDATE mob_groups SET content_tag='ROV' WHERE name='Locus_Bight_Rarab' AND groupid = '53' AND zoneid = '4';
UPDATE mob_groups SET content_tag='ROV' WHERE name='Locus_Camelopard' AND groupid = '54' AND zoneid = '4';
UPDATE mob_groups SET content_tag='ROV' WHERE name='Locus_Hypnos_Eft' AND groupid = '55' AND zoneid = '4';
UPDATE mob_groups SET content_tag='ROV' WHERE name='Locus_Ghost_Crab' AND groupid = '56' AND zoneid = '4';
UPDATE mob_groups SET content_tag='ROV' WHERE name='Locus_Fiddler_Crab' AND groupid = '57' AND zoneid = '4';

-- ------------------------------------------------------------
-- Uleguerand_Range (Zone 5)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Magnotaur' AND groupid = '39' AND zoneid = '5';
UPDATE mob_groups SET content_tag='SYNERGY' WHERE name='Skvader' AND groupid = '11' AND zoneid = '5';
UPDATE mob_groups SET content_tag='SYNERGY' WHERE name='Frost_Flambeau' AND groupid = '49' AND zoneid = '5';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Scowlenkos' AND groupid = '38' AND zoneid = '5';

UPDATE mob_groups set minLevel = 61 WHERE name = "Uleguerand_Tiger" and zoneid = 5;
UPDATE mob_groups set maxLevel = 68 WHERE name = "Demons_Elemental" and zoneid = 5;
UPDATE mob_groups set minLevel = 75, maxLevel = 77 WHERE name = "Dead_Demon" and zoneid = 5;
UPDATE mob_groups set minLevel = 75, maxLevel = 77 WHERE name = "Judicator_Demon" and zoneid = 5;
UPDATE mob_groups set minLevel = 75, maxLevel = 77 WHERE name = "Gore_Demon" and zoneid = 5;
UPDATE mob_groups set minLevel = 75, maxLevel = 77 WHERE name = "Stygian_Demon" and zoneid = 5;
UPDATE mob_groups set minLevel = 74 WHERE name = "Doom_Mage" and zoneid = 5;

UPDATE mob_groups SET dropid = 6006 WHERE groupid = 15 AND zoneid = 5; -- Snow_Maiden
UPDATE mob_groups SET HP = 13000 WHERE groupid = 16 AND zoneid = 5; -- Father_Frost
UPDATE mob_groups SET poolid = 20009 WHERE groupid = 18 AND zoneid = 5; -- Succubus_Bats
UPDATE mob_groups SET poolid = 20010 WHERE groupid = 29 AND zoneid = 5; -- Nightmare_Bats
UPDATE mob_groups SET MP = 100000 WHERE groupid = 40 AND zoneid = 5; -- Jormungand
UPDATE mob_groups SET HP = 9000 WHERE groupid = 44 AND zoneid = 5; -- Bonnacon
UPDATE mob_groups SET MP = 30000 WHERE groupid = 45 AND zoneid = 5; -- Geush_Urvan
UPDATE mob_groups SET HP = 8500 WHERE groupid = 46 AND zoneid = 5; -- White_Coney
UPDATE mob_groups SET HP = 8500 WHERE groupid = 47 AND zoneid = 5; -- Black_Coney
UPDATE mob_groups SET respawntime = 0, spawntype = 128, HP = 20000 WHERE groupid = 48 AND zoneid = 5; -- Mountain_Worm_NM

-- ------------------------------------------------------------
-- Bearclaw_Pinnacle (Zone 6)
-- ------------------------------------------------------------
UPDATE mob_groups SET minLevel = 80, maxLevel = 82 WHERE groupid = 2 AND zoneid = 6; -- Bearclaw_Rabbit
UPDATE mob_groups SET minLevel = 76, maxLevel = 77 WHERE groupid = 3 AND zoneid = 6; -- Bearclaw_Leveret
UPDATE mob_groups SET HP = 1750, minLevel = 77, maxLevel = 79 WHERE groupid = 4 AND zoneid = 6; -- Snow_Devil
UPDATE mob_groups SET HP = 5500, minLevel = 80, maxLevel = 82 WHERE groupid = 5 AND zoneid = 6; -- Eldertaur
UPDATE mob_groups SET HP = 5000, minLevel = 80, maxLevel = 82 WHERE groupid = 6 AND zoneid = 6; -- Mindertaur

-- ------------------------------------------------------------
-- Attohwa_Chasm (Zone 7)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Sekhmet' AND groupid = '12' AND zoneid = '7';
UPDATE mob_groups SET content_tag='SYNERGY' WHERE name='Sargas' AND groupid = '32' AND zoneid = '7';
UPDATE mob_groups set minLevel = 36, maxLevel = 39 WHERE name = "Goblin_Shaman" and zoneid = 7;
UPDATE mob_groups set minLevel = 41 WHERE name = "Air_Elemental" and zoneid =7 and groupid = 28;
UPDATE mob_groups set minLevel = 55, maxLevel = 55 WHERE name = "Lioumere" and zoneid = 7;

UPDATE mob_groups SET dropid = 6039 WHERE groupid = 7 AND zoneid = 7; -- Goblin_Pathfinder
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 12 AND zoneid = 7; -- Sekhmet
UPDATE mob_groups SET dropid = 1092 WHERE groupid = 18 AND zoneid = 7; -- Goblin_Poacher
UPDATE mob_groups SET dropid = 1540 WHERE groupid = 37 AND zoneid = 7; -- Tomb_Warrior
UPDATE mob_groups SET dropid = 1540 WHERE groupid = 38 AND zoneid = 7; -- Mummy
UPDATE mob_groups SET dropid = 1540 WHERE groupid = 39 AND zoneid = 7; -- Lich
UPDATE mob_groups SET spawntype = 32, HP = 8000 WHERE groupid = 41 AND zoneid = 7; -- Citipati
UPDATE mob_groups SET spawntype = 128, HP = 20000 WHERE groupid = 42 AND zoneid = 7; -- Xolotl
UPDATE mob_groups SET MP = 100000 WHERE groupid = 46 AND zoneid = 7; -- Tiamat

-- ------------------------------------------------------------
-- Boneyard_Gully (Zone 8)
-- ------------------------------------------------------------
UPDATE mob_groups SET HP = 11000, minLevel = 81, maxLevel = 81 WHERE groupid = 6 AND zoneid = 8; -- Tuchulcha
UPDATE mob_groups SET HP = 5000, minLevel = 79, maxLevel = 79 WHERE groupid = 7 AND zoneid = 8; -- Swift_Hunter
UPDATE mob_groups SET HP = 5000, minLevel = 79, maxLevel = 79 WHERE groupid = 8 AND zoneid = 8; -- Shrewd_Hunter
UPDATE mob_groups SET HP = 6000, minLevel = 79, maxLevel = 79 WHERE groupid = 9 AND zoneid = 8; -- Armored_Hunter
UPDATE mob_groups SET minLevel = 80, maxLevel = 80 WHERE groupid = 10 AND zoneid = 8; -- Race_Runner
UPDATE mob_groups SET HP = 11000 WHERE groupid = 11 AND zoneid = 8; -- Parata
UPDATE mob_groups SET HP = 9000, MP = 10000 WHERE groupid = 12 AND zoneid = 8; -- Bladmall
UPDATE mob_groups SET HP = 2000 WHERE groupid = 13 AND zoneid = 8; -- Nepionic_Parata
UPDATE mob_groups SET HP = 2000 WHERE groupid = 14 AND zoneid = 8; -- Nepionic_Bladmall
UPDATE mob_groups SET HP = 20000, MP = 5000, minLevel = 80, maxLevel = 80 WHERE groupid = 15 AND zoneid = 8; -- Gwyn_Ap_Knudd
UPDATE mob_groups SET HP = 900, minLevel = 70, maxLevel = 71 WHERE groupid = 16 AND zoneid = 8; -- Cadaver_Warrior
UPDATE mob_groups SET HP = 800, minLevel = 70, maxLevel = 71 WHERE groupid = 17 AND zoneid = 8; -- Cadaver_Witch
UPDATE mob_groups SET HP = 750, minLevel = 70, maxLevel = 71 WHERE groupid = 18 AND zoneid = 8; -- Erdgeist
UPDATE mob_groups SET HP = 3500, minLevel = 74, maxLevel = 75 WHERE groupid = 21 AND zoneid = 8; -- Shikaree_Z
UPDATE mob_groups SET HP = 3750, minLevel = 74, maxLevel = 75 WHERE groupid = 22 AND zoneid = 8; -- Shikaree_Y
UPDATE mob_groups SET HP = 3300, minLevel = 74, maxLevel = 75 WHERE groupid = 23 AND zoneid = 8; -- Shikaree_X
UPDATE mob_groups SET HP = 3500, minLevel = 74, maxLevel = 75 WHERE groupid = 24 AND zoneid = 8; -- Shikaree_Zs_Wyvern
UPDATE mob_groups SET HP = 3500, minLevel = 74, maxLevel = 75 WHERE groupid = 25 AND zoneid = 8; -- Shikaree_Xs_Rabbit

-- ------------------------------------------------------------
-- PsoXja (Zone 9)
-- ------------------------------------------------------------
UPDATE mob_groups set minLevel = 42, maxLevel = 46 WHERE name = "Gazer" and zoneid = 9;
UPDATE mob_groups set minLevel = 42, maxLevel = 48 WHERE name = "Diremite" and zoneid = 9;
UPDATE mob_groups set minLevel = 43, maxLevel = 50 WHERE name = "Snowball" and zoneid = 9;
UPDATE mob_groups set minLevel = 46, maxLevel = 50 WHERE name = "Vampire_Bat" and zoneid = 9;
UPDATE mob_groups set minLevel = 43, maxLevel = 47 WHERE name = "Maze_Lizard" and zoneid = 9;
UPDATE mob_groups set minLevel = 48, maxLevel = 55 WHERE name = "Tonberrys_Elemental" and zoneid = 9;
UPDATE mob_groups set minLevel = 53 WHERE name = "Labyrinth_Lizard" and zoneid = 9;
UPDATE mob_groups set minLevel = 53, maxLevel = 60 WHERE name = "Cryptonberry_Plaguer" and zoneid = 9;
UPDATE mob_groups set minLevel = 53, maxLevel = 60 WHERE name = "Cryptonberry_Cutter" and zoneid = 9;
UPDATE mob_groups set minLevel = 53, maxLevel = 60 WHERE name = "Cryptonberry_Harrier" and zoneid = 9;
UPDATE mob_groups set minLevel = 53, maxLevel = 60 WHERE name = "Cryptonberry_Stalker" and zoneid = 9;
UPDATE mob_groups set minLevel = 53, maxLevel = 58 WHERE name = "Blubber_Eyes" and zoneid = 9;
UPDATE mob_groups set minLevel = 56, maxLevel = 59 WHERE name = "Snoll" and zoneid = 9;
UPDATE mob_groups set maxLevel = 63 WHERE name = "Goblins_Bat" and zoneid = 9;
UPDATE mob_groups set maxLevel = 68 WHERE name = "Dire_Bat" and zoneid = 9;
UPDATE mob_groups set minLevel = 63, maxLevel = 68 WHERE name = "Snow_Lizard" and zoneid = 9;
UPDATE mob_groups set minLevel = 56, maxLevel = 59 WHERE name = "Snoll" and zoneid = 9;
UPDATE mob_groups set minLevel = 56, maxLevel = 59 WHERE name = "Snoll" and zoneid = 9;
UPDATE mob_groups set minLevel = 56, maxLevel = 59 WHERE name = "Snoll" and zoneid = 9;

UPDATE mob_groups SET dropid = 400 WHERE groupid = 17 AND zoneid = 9; -- Vampire_Bat
UPDATE mob_groups SET minLevel = 46 WHERE groupid = 18 AND zoneid = 9; -- Maze_Lizard
UPDATE mob_groups SET minLevel = 54, maxLevel = 55 WHERE groupid = 19 AND zoneid = 9; -- Blubber_Eyes
UPDATE mob_groups SET maxLevel = 56 WHERE groupid = 20 AND zoneid = 9; -- Cryptonberry_Plaguer
UPDATE mob_groups SET maxLevel = 56 WHERE groupid = 21 AND zoneid = 9; -- Cryptonberry_Cutter
UPDATE mob_groups SET minLevel = 56 WHERE groupid = 22 AND zoneid = 9; -- Camazotz
UPDATE mob_groups SET maxLevel = 56 WHERE groupid = 25 AND zoneid = 9; -- Cryptonberry_Harrier
UPDATE mob_groups SET maxLevel = 56 WHERE groupid = 27 AND zoneid = 9; -- Cryptonberry_Stalker
UPDATE mob_groups SET dropid = 6055 WHERE groupid = 29 AND zoneid = 9; -- Ice_Elemental
UPDATE mob_groups SET HP = 2000, maxLevel = 53 WHERE groupid = 47 AND zoneid = 9; -- Gargoyle-Iota
UPDATE mob_groups SET HP = 2000, maxLevel = 53 WHERE groupid = 48 AND zoneid = 9; -- Gargoyle-Kappa
UPDATE mob_groups SET HP = 2000, minLevel = 52 WHERE groupid = 49 AND zoneid = 9; -- Gargoyle-Lambda
UPDATE mob_groups SET HP = 2000, minLevel = 52, maxLevel = 53 WHERE groupid = 50 AND zoneid = 9; -- Gargoyle-Mu
UPDATE mob_groups SET respawntime = 960, spawntype = 0, dropid = 6056 WHERE groupid = 52 AND zoneid = 9; -- Treasure_Chest
UPDATE mob_groups SET dropid = 662 WHERE groupid = 59 AND zoneid = 9; -- Purgatory_Bat
UPDATE mob_groups SET respawntime = 960, spawntype = 0 WHERE groupid = 64 AND zoneid = 9; -- Archaic_Chest

-- ------------------------------------------------------------
-- The_Shrouded_Maw (Zone 10)
-- ------------------------------------------------------------
UPDATE mob_groups SET minLevel = 47, maxLevel = 48 WHERE groupid = 3 AND zoneid = 10; -- Pasuk

-- ------------------------------------------------------------
-- Oldton_Movalpolos (Zone 11)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Bugbear_Muscleman' AND groupid = '18' AND zoneid = '11';
UPDATE mob_groups set minLevel = 28, maxLevel = 31 WHERE name = "Goblins_Bat" and zoneid = 11 and groupid = 11;
UPDATE mob_groups set minLevel = 41, maxLevel = 42 WHERE name = "Goblin_Doorman" and zoneid = 11;
UPDATE mob_groups set minLevel = 41, maxLevel = 42 WHERE name = "Goblin_Oilman" and zoneid = 11;
UPDATE mob_groups set minLevel = 41, maxLevel = 42 WHERE name = "Goblin_Shovelman" and zoneid = 11;
UPDATE mob_groups set minLevel = 41, maxLevel = 42 WHERE name = "Goblin_Tollman" and zoneid = 11;
UPDATE mob_groups set minLevel = 41, maxLevel = 42 WHERE name = "Moblin_Coalman" and zoneid = 11;
UPDATE mob_groups set minLevel = 41, maxLevel = 42 WHERE name = "Moblin_Gasman" and zoneid = 11;
UPDATE mob_groups set minLevel = 41, maxLevel = 42 WHERE name = "Moblin_Pikeman" and zoneid = 11;
UPDATE mob_groups set minLevel = 41, maxLevel = 42 WHERE name = "Moblin_Repairman" and zoneid = 11;
UPDATE mob_groups set minLevel = 42, maxLevel = 45 WHERE name = "Bugbear_Bondman" and zoneid = 11;
UPDATE mob_groups set minLevel = 46 WHERE name = "Goblin_Freelance" and zoneid = 11;

UPDATE mob_groups SET dropid = 6044 WHERE groupid = 17 AND zoneid = 11; -- Earth_Elemental
UPDATE mob_groups SET poolid = 7071 WHERE groupid = 19 AND zoneid = 11; -- Stirge
UPDATE mob_groups SET HP = 6000 WHERE groupid = 35 AND zoneid = 11; -- Bugallug
UPDATE mob_groups SET HP = 10000, MP = 2500, minLevel = 80, maxLevel = 80 WHERE groupid = 38 AND zoneid = 11; -- Goblin_Preceptor

-- ------------------------------------------------------------
-- Newton_Movalpolos (Zone 12)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='SYNERGY' WHERE name='Sword_Sorcerer_Solisoq' AND groupid = '36' AND zoneid = '12';
UPDATE mob_groups set minLevel = 70, maxLevel = 80 WHERE name = "Earth_Elemental" and zoneid = 12;
UPDATE mob_groups set minLevel = 76, maxLevel = 78 WHERE name = "Goblin_Headman" and zoneid = 12;
UPDATE mob_groups set minLevel = 76, maxLevel = 78 WHERE name = "Goblin_Marksman" and zoneid = 12;
UPDATE mob_groups set minLevel = 76, maxLevel = 79 WHERE name = "Moblin_Engineman" and zoneid = 12;
UPDATE mob_groups set minLevel = 76, maxLevel = 79 WHERE name = "Moblin_Topsman" and zoneid = 12;

UPDATE mob_groups SET dropid = 6046 WHERE groupid = 14 AND zoneid = 12; -- Thunder_Elemental
UPDATE mob_groups SET poolid = 20010 WHERE groupid = 18 AND zoneid = 12; -- Nightmare_Bats
UPDATE mob_groups SET dropid = 6045 WHERE groupid = 35 AND zoneid = 12; -- Earth_Elemental

-- ------------------------------------------------------------
-- Mine_Shaft_2716 (Zone 13)
-- ------------------------------------------------------------
UPDATE mob_groups SET minlevel='45',maxlevel='45', HP='5800' WHERE name='Twilotak' AND groupid = '6' AND zoneid = '13';
UPDATE mob_groups SET minlevel='39',maxlevel='41' WHERE name='Moblin_Wisewoman' AND groupid = '7' AND zoneid = '13';
UPDATE mob_groups SET minlevel='39',maxlevel='41' WHERE name='Moblin_Clergyman' AND groupid = '8' AND zoneid = '13';

UPDATE mob_groups SET HP = 5000 WHERE groupid = 6 AND zoneid = 13; -- Twilotak
UPDATE mob_groups SET HP = 2200 WHERE groupid = 7 AND zoneid = 13; -- Moblin_Wisewoman
UPDATE mob_groups SET HP = 2200 WHERE groupid = 8 AND zoneid = 13; -- Moblin_Clergyman
UPDATE mob_groups SET HP = 10000, minLevel = 80, maxLevel = 81 WHERE groupid = 9 AND zoneid = 13; -- Bugboy
UPDATE mob_groups SET minLevel = 62, maxLevel = 62 WHERE groupid = 10 AND zoneid = 13; -- Moblin_Fantocciniman
UPDATE mob_groups SET HP = 3300, minLevel = 60, maxLevel = 60 WHERE groupid = 11 AND zoneid = 13; -- Fantoccini
UPDATE mob_groups SET HP = 500, minLevel = 58, maxLevel = 58 WHERE groupid = 12 AND zoneid = 13; -- Fantoccini_Monster
UPDATE mob_groups SET HP = 500, minLevel = 58, maxLevel = 58 WHERE groupid = 13 AND zoneid = 13; -- Fantoccini_Wyvern
UPDATE mob_groups SET HP = 500, minLevel = 58, maxLevel = 58 WHERE groupid = 14 AND zoneid = 13; -- Fantoccini_Avatar
UPDATE mob_groups SET HP = 500, minLevel = 58, maxLevel = 58 WHERE groupid = 15 AND zoneid = 13; -- Fantoccini_Automaton

-- ------------------------------------------------------------
-- Promyvion-Holla (Zone 16)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Idle_Wanderer' AND groupid = '3' AND zoneid = '16';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Livid_Seether' AND groupid = '22' AND zoneid = '16';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Woeful_Weeper' AND groupid = '23' AND zoneid = '16';
UPDATE mob_groups set minLevel = 20, maxLevel = 22 WHERE name = "Stray" and zoneid = 16 and groupid = 6;  -- Was 21-21
UPDATE mob_groups set minLevel = 23, maxLevel = 25 WHERE name = "Stray" and zoneid = 16 and groupid = 11; -- Was 23-24
UPDATE mob_groups set minLevel = 26, maxLevel = 27 WHERE name = "Stray" and zoneid = 16 and groupid = 16; -- Was 26-27
UPDATE mob_groups set minLevel = 22, maxLevel = 24 WHERE name = "Wanderer" and zoneid = 16 and groupid = 1;  -- Was 22-24
UPDATE mob_groups set minLevel = 26, maxLevel = 28 WHERE name = "Wanderer" and zoneid = 16 and groupid = 7;  -- Was 26-28
UPDATE mob_groups set minLevel = 29, maxLevel = 31 WHERE name = "Wanderer" and zoneid = 16 and groupid = 12; -- Was 29-31
UPDATE mob_groups set minLevel = 32, maxLevel = 34 WHERE name = "Wanderer" and zoneid = 16 and groupid = 19; -- Was 32-33
UPDATE mob_groups set minLevel = 24, maxLevel = 26 WHERE name = "Weeper" and zoneid = 16 and groupid = 2;  -- Was 24-26
UPDATE mob_groups set minLevel = 27, maxLevel = 30 WHERE name = "Weeper" and zoneid = 16 and groupid = 8;  -- Was 28-30
UPDATE mob_groups set minLevel = 31, maxLevel = 33 WHERE name = "Weeper" and zoneid = 16 and groupid = 13; -- Was 31-33
UPDATE mob_groups set minLevel = 34, maxLevel = 36 WHERE name = "Weeper" and zoneid = 16 and groupid = 17; -- Was 33-35
UPDATE mob_groups set minLevel = 31, maxLevel = 33 WHERE name = "Seether" and zoneid = 16 and groupid = 10; -- Was 30-32
UPDATE mob_groups set minLevel = 34, maxLevel = 36 WHERE name = "Seether" and zoneid = 16 and groupid = 14; -- Was 33-35
UPDATE mob_groups set minLevel = 37, maxLevel = 38 WHERE name = "Seether" and zoneid = 16 and groupid = 18; -- Was 35-37
UPDATE mob_groups set minLevel = 29, maxLevel = 32 WHERE name = "Thinker" and zoneid = 16 and groupid = 4;  -- Was 28-28
UPDATE mob_groups set minLevel = 33, maxLevel = 34 WHERE name = "Thinker" and zoneid = 16 and groupid = 9;  -- Was 33-34
UPDATE mob_groups set minLevel = 35, maxLevel = 37 WHERE name = "Thinker" and zoneid = 16 and groupid = 15; -- Was 35-37
UPDATE mob_groups set minLevel = 38, maxLevel = 40 WHERE name = "Thinker" and zoneid = 16 and groupid = 20; -- Was 37-39

UPDATE mob_groups SET HP = 2000 WHERE groupid = 5 AND zoneid = 16; -- Memory_Receptacle
UPDATE mob_groups SET MP = 50 WHERE groupid = 6 AND zoneid = 16; -- Stray
UPDATE mob_groups SET MP = 50 WHERE groupid = 11 AND zoneid = 16; -- Stray
UPDATE mob_groups SET MP = 50 WHERE groupid = 16 AND zoneid = 16; -- Stray
UPDATE mob_groups SET HP = 3000 WHERE groupid = 21 AND zoneid = 16; -- Cerebrator

-- ------------------------------------------------------------
-- Spire_of_Holla (Zone 17)
-- ------------------------------------------------------------
UPDATE mob_groups SET HP = 3800, minLevel = 37, maxLevel = 38 WHERE groupid = 2 AND zoneid = 17; -- Cogitator
UPDATE mob_groups SET HP = 750, minLevel = 27, maxLevel = 38 WHERE groupid = 3 AND zoneid = 17; -- Weeper

-- ------------------------------------------------------------
-- Promyvion-Dem (Zone 18)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Idle_Wanderer' AND groupid = '3' AND zoneid = '18';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Livid_Seether' AND groupid = '22' AND zoneid = '18';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Woeful_Weeper' AND groupid = '23' AND zoneid = '18';
UPDATE mob_groups set minLevel = 20, maxLevel = 22 WHERE name = "Stray" and zoneid = 18 and groupid = 6;  -- Was 20-21
UPDATE mob_groups set minLevel = 23, maxLevel = 25 WHERE name = "Stray" and zoneid = 18 and groupid = 11; -- Was 23-24
UPDATE mob_groups set minLevel = 26, maxLevel = 27 WHERE name = "Stray" and zoneid = 18 and groupid = 16; -- Was 26-28
UPDATE mob_groups set minLevel = 22, maxLevel = 24 WHERE name = "Wanderer" and zoneid = 18 and groupid = 1;  -- Was 22-24
UPDATE mob_groups set minLevel = 26, maxLevel = 28 WHERE name = "Wanderer" and zoneid = 18 and groupid = 8;  -- Was 26-28
UPDATE mob_groups set minLevel = 29, maxLevel = 31 WHERE name = "Wanderer" and zoneid = 18 and groupid = 12; -- Was 29-31
UPDATE mob_groups set minLevel = 32, maxLevel = 34 WHERE name = "Wanderer" and zoneid = 18 and groupid = 19; -- Was 31-33
UPDATE mob_groups set minLevel = 24, maxLevel = 26 WHERE name = "Weeper" and zoneid = 18 and groupid = 3;  -- Was 24-26
UPDATE mob_groups set minLevel = 27, maxLevel = 30 WHERE name = "Weeper" and zoneid = 18 and groupid = 7;  -- Was 28-30
UPDATE mob_groups set minLevel = 31, maxLevel = 33 WHERE name = "Weeper" and zoneid = 18 and groupid = 13; -- Was 31-33
UPDATE mob_groups set minLevel = 34, maxLevel = 36 WHERE name = "Weeper" and zoneid = 18 and groupid = 18; -- Was 33-35
UPDATE mob_groups set minLevel = 31, maxLevel = 33 WHERE name = "Seether" and zoneid = 18 and groupid = 9;  -- Was 30-32
UPDATE mob_groups set minLevel = 34, maxLevel = 36 WHERE name = "Seether" and zoneid = 18 and groupid = 14; -- Was 33-35
UPDATE mob_groups set minLevel = 37, maxLevel = 38 WHERE name = "Seether" and zoneid = 18 and groupid = 17; -- Was 35-37
UPDATE mob_groups set minLevel = 29, maxLevel = 32 WHERE name = "Gorger" and zoneid = 18 and groupid = 4;  -- Was 29-31
UPDATE mob_groups set minLevel = 33, maxLevel = 34 WHERE name = "Gorger" and zoneid = 18 and groupid = 10; -- Was 32-34
UPDATE mob_groups set minLevel = 35, maxLevel = 37 WHERE name = "Gorger" and zoneid = 18 and groupid = 15; -- Was 35-37
UPDATE mob_groups set minLevel = 38, maxLevel = 40 WHERE name = "Gorger" and zoneid = 18 and groupid = 20; -- Was 37-39

UPDATE mob_groups SET HP = 2000 WHERE groupid = 5 AND zoneid = 18; -- Memory_Receptacle
UPDATE mob_groups SET MP = 50 WHERE groupid = 6 AND zoneid = 18; -- Stray
UPDATE mob_groups SET MP = 50 WHERE groupid = 11 AND zoneid = 18; -- Stray
UPDATE mob_groups SET MP = 50 WHERE groupid = 16 AND zoneid = 18; -- Stray
UPDATE mob_groups SET HP = 3000 WHERE groupid = 21 AND zoneid = 18; -- Satiator

-- ------------------------------------------------------------
-- Spire_of_Dem (Zone 19)
-- ------------------------------------------------------------
UPDATE mob_groups SET HP = 3700, minLevel = 37, maxLevel = 38 WHERE groupid = 3 AND zoneid = 19; -- Ingester
UPDATE mob_groups SET HP = 750, minLevel = 27, maxLevel = 28 WHERE groupid = 4 AND zoneid = 19; -- Neoingester
UPDATE mob_groups SET HP = 750, minLevel = 27, maxLevel = 28 WHERE groupid = 5 AND zoneid = 19; -- Neogorger
UPDATE mob_groups SET HP = 750, minLevel = 27, maxLevel = 28 WHERE groupid = 6 AND zoneid = 19; -- Neosatiator
UPDATE mob_groups SET HP = 750, minLevel = 27, maxLevel = 28 WHERE groupid = 7 AND zoneid = 19; -- Wanderer

-- ------------------------------------------------------------
-- Promyvion-Mea (Zone 20)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Idle_Wanderer' AND groupid = '3' AND zoneid = '20';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Livid_Seether' AND groupid = '22' AND zoneid = '20';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Woeful_Weeper' AND groupid = '23' AND zoneid = '20';
UPDATE mob_groups set minLevel = 20, maxLevel = 22 WHERE name = "Stray" and zoneid = 20 and groupid = 6;  -- Was 21-21
UPDATE mob_groups set minLevel = 23, maxLevel = 25 WHERE name = "Stray" and zoneid = 20 and groupid = 11; -- Was 23-24
UPDATE mob_groups set minLevel = 26, maxLevel = 27 WHERE name = "Stray" and zoneid = 20 and groupid = 16; -- Was 26-27
UPDATE mob_groups set minLevel = 22, maxLevel = 24 WHERE name = "Wanderer" and zoneid = 20 and groupid = 1;  -- Was 22-28
UPDATE mob_groups set minLevel = 26, maxLevel = 28 WHERE name = "Wanderer" and zoneid = 20 and groupid = 7;  -- Was 26-28
UPDATE mob_groups set minLevel = 29, maxLevel = 31 WHERE name = "Wanderer" and zoneid = 20 and groupid = 12; -- Was 29-31
UPDATE mob_groups set minLevel = 32, maxLevel = 34 WHERE name = "Wanderer" and zoneid = 20 and groupid = 19; -- Was 31-33
UPDATE mob_groups set minLevel = 24, maxLevel = 26 WHERE name = "Weeper" and zoneid = 20 and groupid = 2;  -- Was 25-30
UPDATE mob_groups set minLevel = 27, maxLevel = 30 WHERE name = "Weeper" and zoneid = 20 and groupid = 8;  -- Was 28-30
UPDATE mob_groups set minLevel = 31, maxLevel = 33 WHERE name = "Weeper" and zoneid = 20 and groupid = 13; -- Was 31-33
UPDATE mob_groups set minLevel = 34, maxLevel = 36 WHERE name = "Weeper" and zoneid = 20 and groupid = 18; -- Was 33-35
UPDATE mob_groups set minLevel = 31, maxLevel = 33 WHERE name = "Seether" and zoneid = 20 and groupid = 9;  -- Was 30-32
UPDATE mob_groups set minLevel = 34, maxLevel = 36 WHERE name = "Seether" and zoneid = 20 and groupid = 14; -- Was 33-35
UPDATE mob_groups set minLevel = 37, maxLevel = 38 WHERE name = "Seether" and zoneid = 20 and groupid = 17; -- Was 35-37
UPDATE mob_groups set minLevel = 29, maxLevel = 32 WHERE name = "Craver" and zoneid = 20 and groupid = 4;  -- Was 29-31
UPDATE mob_groups set minLevel = 33, maxLevel = 34 WHERE name = "Craver" and zoneid = 20 and groupid = 10; -- Was 32-34
UPDATE mob_groups set minLevel = 35, maxLevel = 37 WHERE name = "Craver" and zoneid = 20 and groupid = 15; -- Was 35-36
UPDATE mob_groups set minLevel = 38, maxLevel = 40 WHERE name = "Craver" and zoneid = 20 and groupid = 20; -- Was 36-40

UPDATE mob_groups SET HP = 2000 WHERE groupid = 5 AND zoneid = 20; -- Memory_Receptacle
UPDATE mob_groups SET MP = 50 WHERE groupid = 6 AND zoneid = 20; -- Stray
UPDATE mob_groups SET MP = 50 WHERE groupid = 11 AND zoneid = 20; -- Stray
UPDATE mob_groups SET MP = 50 WHERE groupid = 16 AND zoneid = 20; -- Stray
UPDATE mob_groups SET HP = 3000 WHERE groupid = 21 AND zoneid = 20; -- Coveter

-- ------------------------------------------------------------
-- Spire_of_Mea (Zone 21)
-- ------------------------------------------------------------
UPDATE mob_groups SET HP = 3600, minLevel = 37, maxLevel = 38 WHERE groupid = 2 AND zoneid = 21; -- Envier
UPDATE mob_groups SET HP = 750, minLevel = 27, maxLevel = 28 WHERE groupid = 3 AND zoneid = 21; -- Seether

-- ------------------------------------------------------------
-- Promyvion-Vahzl (Zone 22)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Idle_Wanderer' AND groupid = '7' AND zoneid = '22';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Livid_Seether' AND groupid = '37' AND zoneid = '22';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Woeful_Weeper' AND groupid = '38' AND zoneid = '22';

UPDATE mob_groups SET minLevel = 46, maxLevel = 47 WHERE name = "Wanderer" and zoneid = 22 and groupid = 5;  -- Was 46-48
UPDATE mob_groups SET minLevel = 48, maxLevel = 49 WHERE name = "Wanderer" and zoneid = 22 and groupid = 14; -- Was 46-48
UPDATE mob_groups SET minLevel = 50, maxLevel = 51 WHERE name = "Wanderer" and zoneid = 22 and groupid = 20; -- Was 50-52
UPDATE mob_groups SET minLevel = 52, maxLevel = 53 WHERE name = "Wanderer" and zoneid = 22 and groupid = 28; -- Was 50-52

UPDATE mob_groups SET minLevel = 48, maxLevel = 49 WHERE name = "Weeper" and zoneid = 22 and groupid = 6;  -- Was 46-48
UPDATE mob_groups SET minLevel = 50, maxLevel = 51 WHERE name = "Weeper" and zoneid = 22 and groupid = 13; -- Was 46-48
UPDATE mob_groups SET minLevel = 52, maxLevel = 53 WHERE name = "Weeper" and zoneid = 22 and groupid = 21; -- Was 50-52
UPDATE mob_groups SET minLevel = 54, maxLevel = 55 WHERE name = "Weeper" and zoneid = 22 and groupid = 29; -- Was 50-52

UPDATE mob_groups SET minLevel = 54, maxLevel = 55 WHERE name = "Thinker" and zoneid = 22 and groupid = 8;  -- Was 52-54
UPDATE mob_groups SET minLevel = 56, maxLevel = 57 WHERE name = "Thinker" and zoneid = 22 and groupid = 16; -- Was 54-56
UPDATE mob_groups SET minLevel = 58, maxLevel = 59 WHERE name = "Thinker" and zoneid = 22 and groupid = 24; -- Was 56-58
UPDATE mob_groups SET minLevel = 60, maxLevel = 60 WHERE name = "Thinker" and zoneid = 22 and groupid = 32; -- Was 56-58

UPDATE mob_groups SET minLevel = 54, maxLevel = 55 WHERE name = "Gorger" and zoneid = 22 and groupid = 9 ; -- Was 52-54
UPDATE mob_groups SET minLevel = 56, maxLevel = 57 WHERE name = "Gorger" and zoneid = 22 and groupid = 17; -- Was 54-56
UPDATE mob_groups SET minLevel = 58, maxLevel = 59 WHERE name = "Gorger" and zoneid = 22 and groupid = 25; -- Was 56-58
UPDATE mob_groups SET minLevel = 60, maxLevel = 60 WHERE name = "Gorger" and zoneid = 22 and groupid = 33; -- Was 56-58

UPDATE mob_groups SET minLevel = 54, maxLevel = 55 WHERE name = "Craver" and zoneid = 22 and groupid = 10; -- Was 52-54
UPDATE mob_groups SET minLevel = 56, maxLevel = 57 WHERE name = "Craver" and zoneid = 22 and groupid = 18; -- Was 52-54
UPDATE mob_groups SET minLevel = 58, maxLevel = 59 WHERE name = "Craver" and zoneid = 22 and groupid = 26; -- Was 56-58
UPDATE mob_groups SET minLevel = 60, maxLevel = 60 WHERE name = "Craver" and zoneid = 22 and groupid = 34; -- Was 56-58

UPDATE mob_groups SET minLevel = 50, maxLevel = 52 WHERE name = "Seether" and zoneid = 22 and groupid = 15; -- Was 52-52
UPDATE mob_groups SET minLevel = 53, maxLevel = 55 WHERE name = "Seether" and zoneid = 22 and groupid = 22; -- Was 54-56
UPDATE mob_groups SET minLevel = 56, maxLevel = 57 WHERE name = "Seether" and zoneid = 22 and groupid = 30; -- Was 54-56

UPDATE mob_groups SET HP = 5000 WHERE groupid = 11 AND zoneid = 22; -- Memory_Receptacle
UPDATE mob_groups SET MP = 100 WHERE groupid = 12 AND zoneid = 22; -- Stray
UPDATE mob_groups SET MP = 100 WHERE groupid = 19 AND zoneid = 22; -- Stray
UPDATE mob_groups SET MP = 100 WHERE groupid = 27 AND zoneid = 22; -- Stray
UPDATE mob_groups SET MP = 100 WHERE groupid = 35 AND zoneid = 22; -- Stray

-- ------------------------------------------------------------
-- Spire_of_Vahzl (Zone 23)
-- ------------------------------------------------------------
UPDATE mob_groups SET HP = 1500, minLevel = 53, maxLevel = 53 WHERE groupid = 5 AND zoneid = 23; -- Contemplator
UPDATE mob_groups SET HP = 1500, minLevel = 53, maxLevel = 53 WHERE groupid = 6 AND zoneid = 23; -- Ingurgitator
UPDATE mob_groups SET HP = 1500, minLevel = 53, maxLevel = 53 WHERE groupid = 7 AND zoneid = 23; -- Repiner
UPDATE mob_groups SET HP = 500, minLevel = 53, maxLevel = 53 WHERE groupid = 8 AND zoneid = 23; -- Neoingurgitator
UPDATE mob_groups SET poolid = 20002, name = 'Memory_Receptacle_red', HP = 3000, minLevel = 53, maxLevel = 53 WHERE groupid = 9 AND zoneid = 23; -- Memory_Receptacle_red

INSERT INTO mob_groups (groupid, poolid, zoneid, name, respawntime, spawntype, dropid, HP, MP, minLevel, maxLevel, allegiance) VALUES (30, 20003, 23, 'Memory_Receptacle_blue', 0, 128, 0, 1500, 0, 53, 53, 0); -- Memory_Receptacle_blue
INSERT INTO mob_groups (groupid, poolid, zoneid, name, respawntime, spawntype, dropid, HP, MP, minLevel, maxLevel, allegiance) VALUES (31, 20004, 23, 'Memory_Receptacle_green', 0, 128, 0, 1500, 0, 53, 53, 0); -- Memory_Receptacle_green
INSERT INTO mob_groups (groupid, poolid, zoneid, name, respawntime, spawntype, dropid, HP, MP, minLevel, maxLevel, allegiance) VALUES (32, 20005, 23, 'Memory_Receptacle_teal', 0, 128, 0, 1500, 0, 53, 53, 0); -- Memory_Receptacle_teal
-- ------------------------------------------------------------
-- Lufaise_Meadows (Zone 24)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Flockbock' AND groupid = '32' AND zoneid = '24';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Sengann' AND groupid = '79' AND zoneid = '24';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Yal-un_Eke' AND groupid = '82' AND zoneid = '24';

UPDATE mob_groups SET minLevel = 80, maxLevel = 83 WHERE name = "Abraxas" and zoneid = 24;
    -- 79-82
UPDATE mob_groups SET minLevel = 79, maxLevel = 82 WHERE name = "Fomor_Ninja"       and zoneid = 24 and groupid = 33;
UPDATE mob_groups SET minLevel = 79, maxLevel = 82 WHERE name = "Fomor_Monk"        and zoneid = 24 and groupid = 34;
UPDATE mob_groups SET minLevel = 79, maxLevel = 82 WHERE name = "Fomor_Bard"        and zoneid = 24 and groupid = 36;
UPDATE mob_groups SET minLevel = 79, maxLevel = 82 WHERE name = "Fomor_Red_Mage"    and zoneid = 24 and groupid = 37;
UPDATE mob_groups SET minLevel = 79, maxLevel = 82 WHERE name = "Fomor_Samurai"     and zoneid = 24 and groupid = 38;
UPDATE mob_groups SET minLevel = 79, maxLevel = 82 WHERE name = "Fomor_Warrior"     and zoneid = 24 and groupid = 39;
UPDATE mob_groups SET minLevel = 79, maxLevel = 82 WHERE name = "Fomor_Paladin"     and zoneid = 24 and groupid = 41;
UPDATE mob_groups SET minLevel = 79, maxLevel = 82 WHERE name = "Fomor_Dragoon"     and zoneid = 24 and groupid = 42;
UPDATE mob_groups SET minLevel = 72, maxLevel = 74 WHERE name = "Fomors_Wyvern"     and zoneid = 24 and groupid = 43;
UPDATE mob_groups SET minLevel = 79, maxLevel = 82 WHERE name = "Fomor_Dark_Knight" and zoneid = 24 and groupid = 44;
UPDATE mob_groups SET minLevel = 79, maxLevel = 82 WHERE name = "Fomor_Black_Mage"  and zoneid = 24 and groupid = 45;
UPDATE mob_groups SET minLevel = 79, maxLevel = 82 WHERE name = "Fomor_Ranger"      and zoneid = 24 and groupid = 46;
UPDATE mob_groups SET minLevel = 79, maxLevel = 82 WHERE name = "Fomor_Summoner"    and zoneid = 24 and groupid = 47;
UPDATE mob_groups SET minLevel = 72, maxLevel = 74 WHERE name = "Fomors_Elemental"  and zoneid = 24 and groupid = 48;
UPDATE mob_groups SET minLevel = 79, maxLevel = 82 WHERE name = "Fomor_Beastmaster" and zoneid = 24 and groupid = 49;
UPDATE mob_groups SET minLevel = 72, maxLevel = 74 WHERE name = "Fomors_Bat"        and zoneid = 24 and groupid = 50;
    -- 52-54
UPDATE mob_groups SET minLevel = 52, maxLevel = 54 WHERE name = "Fomor_Thief" and zoneid = 24 and groupid = 61;
INSERT INTO `mob_groups` (`groupid`, `poolid`, `zoneid`, `name`, `respawntime`, `spawntype`, `dropid`, `HP`, `MP`, `minLevel`, `maxLevel`, `allegiance`) VALUES
-- 52-54
(90,1386,24,'Fomor_Ninja',330,1,867,0,0,52,54,0),       -- These are in prep for complete zone revamps
(91,6522,24,'Fomor_Monk',330,1,867,0,0,52,54,0),        -- These are in prep for complete zone revamps
(92,1390,24,'Fomor_Samurai',330,1,877,0,0,52,54,0),     -- These are in prep for complete zone revamps
    -- 42-44
(93,1397,24,'Fomor_Thief',330,1,885,0,0,42,44,0),       -- These are in prep for complete zone revamps
(94,1388,24,'Fomor_Ranger',330,1,0,0,0,42,44,0),        -- These are in prep for complete zone revamps
(95,1398,24,'Fomor_Warrior',330,1,888,0,0,42,44,0),     -- These are in prep for complete zone revamps
(96,1391,24,'Fomor_Summoner',330,1,880,0,0,42,44,0),    -- These are in prep for complete zone revamps
(97,1395,24,'Fomors_Elemental',0,128,0,0,0,34,36,0),    -- These are in prep for complete zone revamps
(98,6517,24,'Fomor_Beastmaster',330,1,858,0,0,42,44,0), -- These are in prep for complete zone revamps
(99,1393,24,'Fomors_Bat',0,128,0,0,0,34,36,0);          -- These are in prep for complete zone revamps

UPDATE mob_groups SET spawntype = 8 WHERE groupid = 15 AND zoneid = 24; -- Cluster
UPDATE mob_groups SET HP = 3400, minLevel = 45, maxLevel = 46 WHERE groupid = 20 AND zoneid = 24; -- Padfoot
UPDATE mob_groups SET dropid = 867 WHERE groupid = 33 AND zoneid = 24; -- Fomor_Ninja
UPDATE mob_groups SET dropid = 0 WHERE groupid = 46 AND zoneid = 24; -- Fomor_Ranger
UPDATE mob_groups SET spawntype = 8 WHERE groupid = 53 AND zoneid = 24; -- Atomic_Cluster
UPDATE mob_groups SET HP = 8600, minLevel = 55, maxLevel = 60 WHERE groupid = 65 AND zoneid = 24; -- Megalobugard
UPDATE mob_groups SET HP = 13000 WHERE groupid = 67 AND zoneid = 24; -- Colorful_Leshy
UPDATE mob_groups SET HP = 16000 WHERE groupid = 68 AND zoneid = 24; -- Defoliate_Leshy
UPDATE mob_groups SET HP = 2800 WHERE groupid = 69 AND zoneid = 24; -- Splinterspine_Grukjuk
UPDATE mob_groups SET HP = 1800, minLevel = 40, maxLevel = 41 WHERE groupid = 70 AND zoneid = 24; -- Blackbone_Frazdiz
UPDATE mob_groups SET minLevel = 40, maxLevel = 41 WHERE groupid = 71 AND zoneid = 24; -- Rainbringer_Yjatvot
UPDATE mob_groups SET HP = 2000, minLevel = 50, maxLevel = 51 WHERE groupid = 72 AND zoneid = 24; -- Baumesel
UPDATE mob_groups SET HP = 20000, MP = 20000 WHERE groupid = 73 AND zoneid = 24; -- Kurrea
UPDATE mob_groups SET dropid = 6011, minLevel = 57 WHERE groupid = 79 AND zoneid = 24; -- Sengann
UPDATE mob_groups SET dropid = 6012, minLevel = 52, maxLevel = 52 WHERE groupid = 82 AND zoneid = 24; -- Yal-un_Eke

-- ------------------------------------------------------------
-- Misareaux_Coast (Zone 25)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Goaftrap' AND groupid = '9' AND zoneid = '25';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Okyupete' AND groupid = '47' AND zoneid = '25';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Seaboard_Vulture' AND groupid = '26' AND zoneid = '25';

UPDATE mob_groups SET minLevel = 36, maxLevel = 38 WHERE name = "Fomor_Monk"        and zoneid = 25 and groupid = 10;
UPDATE mob_groups SET minLevel = 36, maxLevel = 38 WHERE name = "Fomor_Samurai"     and zoneid = 25 and groupid = 11;
UPDATE mob_groups SET minLevel = 36, maxLevel = 38 WHERE name = "Fomor_Warrior"     and zoneid = 25 and groupid = 12;
UPDATE mob_groups SET minLevel = 36, maxLevel = 38 WHERE name = "Fomor_Thief"       and zoneid = 24 and groupid = 13;
UPDATE mob_groups SET minLevel = 36, maxLevel = 38 WHERE name = "Fomor_Black_Mage"  and zoneid = 25 and groupid = 17;
UPDATE mob_groups SET minLevel = 36, maxLevel = 38 WHERE name = "Fomor_Ranger"      and zoneid = 25 and groupid = 18;
UPDATE mob_groups SET minLevel = 36, maxLevel = 38 WHERE name = "Fomor_Dark_Knight" and zoneid = 25 and groupid = 19;
UPDATE mob_groups SET minLevel = 36, maxLevel = 38 WHERE name = "Fomor_Ninja"       and zoneid = 25 and groupid = 20;
UPDATE mob_groups SET minLevel = 36, maxLevel = 38 WHERE name = "Fomor_Paladin"     and zoneid = 25 and groupid = 21;
UPDATE mob_groups SET minLevel = 36, maxLevel = 38 WHERE name = "Fomor_Bard"        and zoneid = 25 and groupid = 22;
    -- 49-51
INSERT INTO `mob_groups` (`groupid`, `poolid`, `zoneid`, `name`, `respawntime`, `spawntype`, `dropid`, `HP`, `MP`, `minLevel`, `maxLevel`, `allegiance`) VALUES
(71,1388,25,'Fomor_Ranger',330,1,0,0,0,49,51,0),        -- These are in prep for complete zone revamps
(72,1387,25,'Fomor_Paladin',330,1,855,0,0,49,51,0),     -- These are in prep for complete zone revamps
(73,1383,25,'Fomor_Dark_Knight',330,1,0,0,0,49,51,0),   -- These are in prep for complete zone revamps
(74,1397,25,'Fomor_Thief',330,1,0,0,0,49,51,0),         -- These are in prep for complete zone revamps
(75,1385,25,'Fomor_Monk',330,1,0,0,0,49,51,0),          -- These are in prep for complete zone revamps
(76,1386,25,'Fomor_Ninja',330,1,0,0,0,49,51,0),         -- These are in prep for complete zone revamps
(77,1380,25,'Fomor_Bard',330,1,855,0,0,35,37,0);        -- These are in prep for complete zone revamps
UPDATE mob_groups SET minLevel = 49, maxLevel = 51 WHERE name = "Fomor_Red_Mage"    and zoneid = 25 and groupid = 43;
UPDATE mob_groups SET minLevel = 49, maxLevel = 51 WHERE name = "Fomor_Dragoon"     and zoneid = 25 and groupid = 50;
UPDATE mob_groups SET minLevel = 41, maxLevel = 43 WHERE name = "Fomors_Wyvern"     and zoneid = 25 and groupid = 51;
UPDATE mob_groups SET minLevel = 49, maxLevel = 51 WHERE name = "Fomor_Summoner"    and zoneid = 25 and groupid = 44;
UPDATE mob_groups SET minLevel = 41, maxLevel = 43 WHERE name = "Fomors_Elemental"  and zoneid = 25 and groupid = 45;

UPDATE mob_groups SET spawntype = 8 WHERE groupid = 33 AND zoneid = 25; -- Atomic_Cluster
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 39 AND zoneid = 25; -- Odqan
UPDATE mob_groups SET HP = 5000 WHERE groupid = 42 AND zoneid = 25; -- Upyri
UPDATE mob_groups SET poolid = 20016 WHERE groupid = 46 AND zoneid = 25; -- Diatryma
UPDATE mob_groups SET HP = 3800 WHERE groupid = 55 AND zoneid = 25; -- Bloody_Coffin
UPDATE mob_groups SET HP = 8300 WHERE groupid = 56 AND zoneid = 25; -- Boggelmann
UPDATE mob_groups SET dropid = 0, MP = 25000 WHERE groupid = 58 AND zoneid = 25; -- Gration
UPDATE mob_groups SET HP = 9000, minLevel = 58 WHERE groupid = 59 AND zoneid = 25; -- Ziphius

-- ------------------------------------------------------------
-- Phomiuna_Aqueducts (Zone 27)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Aqueduct_Spider' AND groupid = '44' AND zoneid = '27';
UPDATE mob_groups SET minLevel = 41, maxLevel = 46 WHERE name = "Fomor_Ninja"       and zoneid = 27;
UPDATE mob_groups SET minLevel = 44, maxLevel = 48 WHERE name = "Fomor_Monk"        and zoneid = 27;
UPDATE mob_groups SET minLevel = 44, maxLevel = 48 WHERE name = "Fomor_Bard"        and zoneid = 27;
UPDATE mob_groups SET minLevel = 44, maxLevel = 48 WHERE name = "Fomor_Red_Mage"    and zoneid = 27;
UPDATE mob_groups SET minLevel = 44, maxLevel = 48 WHERE name = "Fomor_Samurai"     and zoneid = 27;
UPDATE mob_groups SET minLevel = 44, maxLevel = 48 WHERE name = "Fomor_Warrior"     and zoneid = 27;
UPDATE mob_groups SET minLevel = 44, maxLevel = 48 WHERE name = "Fomor_Paladin"     and zoneid = 27;
UPDATE mob_groups SET minLevel = 42, maxLevel = 46 WHERE name = "Fomor_Dragoon"     and zoneid = 27;
UPDATE mob_groups SET minLevel = 41, maxLevel = 46 WHERE name = "Fomors_Wyvern"     and zoneid = 27;
UPDATE mob_groups SET minLevel = 44, maxLevel = 46 WHERE name = "Fomor_Dark_Knight" and zoneid = 27;
UPDATE mob_groups SET minLevel = 45, maxLevel = 48 WHERE name = "Fomor_Black_Mage"  and zoneid = 27;
UPDATE mob_groups SET minLevel = 44, maxLevel = 48 WHERE name = "Fomor_Ranger"      and zoneid = 27;
UPDATE mob_groups SET minLevel = 44, maxLevel = 48 WHERE name = "Fomor_Summoner"    and zoneid = 27;
UPDATE mob_groups SET minLevel = 41, maxLevel = 46 WHERE name = "Fomors_Elemental"  and zoneid = 27;
UPDATE mob_groups SET minLevel = 41, maxLevel = 46 WHERE name = "Fomor_Beastmaster" and zoneid = 27;
UPDATE mob_groups SET minLevel = 41, maxLevel = 46 WHERE name = "Fomors_Bat"        and zoneid = 27;
UPDATE mob_groups SET minLevel = 44, maxLevel = 48 WHERE name = "Fomor_Thief"       and zoneid = 27;
UPDATE mob_groups SET minLevel = 50, maxLevel = 50 WHERE name = "Air_Elemental"     and zoneid = 27;

UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 29 AND zoneid = 27; -- Mahisha
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 40 AND zoneid = 27; -- Tres_Duendes
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 43 AND zoneid = 27; -- Eba

-- ------------------------------------------------------------
-- Sacrarium (Zone 28)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Aqueduct_Spider' AND groupid = '41' AND zoneid = '28';

UPDATE mob_groups SET poolid = 20008 WHERE groupid = 2 AND zoneid = 28; -- Greater_Gaylas
UPDATE mob_groups SET spawntype = 0, minLevel = 60, maxLevel = 60 WHERE groupid = 8 AND zoneid = 28; -- Elel
UPDATE mob_groups SET dropid = 218 WHERE groupid = 36 AND zoneid = 28; -- Luaith
UPDATE mob_groups SET dropid = 218 WHERE groupid = 37 AND zoneid = 28; -- Lobais
UPDATE mob_groups SET dropid = 218 WHERE groupid = 39 AND zoneid = 28; -- Caithleann
UPDATE mob_groups SET dropid = 218 WHERE groupid = 40 AND zoneid = 28; -- Indich

-- ------------------------------------------------------------
-- Riverne-Site_B01 (Zone 29)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Blazedrake' AND groupid = '9' AND zoneid = '29';

UPDATE mob_groups SET minLevel = 50, maxLevel = 53 WHERE name = "Pyrodrake" and zoneid = 29;
UPDATE mob_groups SET minLevel = 55, maxLevel = 57 WHERE name = "Strato_Hippogryph" and zoneid = 29;

UPDATE mob_groups SET HP = 5000 WHERE groupid = 11 AND zoneid = 29; -- Imdugud
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 12 AND zoneid = 29; -- Boroka
UPDATE mob_groups SET HP = 4000, maxLevel = 56 WHERE groupid = 13 AND zoneid = 29; -- Spell_Spitter_Spilospok
UPDATE mob_groups SET HP = 2000, minLevel = 52, maxLevel = 53 WHERE groupid = 14 AND zoneid = 29; -- Chemical_Cook_Chemachiq
UPDATE mob_groups SET MP = 2000, minLevel = 52, maxLevel = 53 WHERE groupid = 15 AND zoneid = 29; -- Book_Browser_Bokabraq
UPDATE mob_groups SET MP = 20000 WHERE groupid = 17 AND zoneid = 29; -- Bahamut
UPDATE mob_groups SET HP = 6000, MP = 15000, minLevel = 88, maxLevel = 88 WHERE groupid = 18 AND zoneid = 29; -- Ouryu
UPDATE mob_groups SET HP = 6500, MP = 15000, minLevel = 88, maxLevel = 88 WHERE groupid = 19 AND zoneid = 29; -- Tiamat
UPDATE mob_groups SET HP = 6500, MP = 15000, minLevel = 88, maxLevel = 88 WHERE groupid = 20 AND zoneid = 29; -- Jormungand
UPDATE mob_groups SET HP = 5500, MP = 15000, minLevel = 88, maxLevel = 88 WHERE groupid = 21 AND zoneid = 29; -- Vrtra
UPDATE mob_groups SET dropid = 0, HP = 5000, MP = 15000 WHERE groupid = 22 AND zoneid = 29; -- Ziryu
UPDATE mob_groups SET MP = 15000 WHERE groupid = 23 AND zoneid = 29; -- Water_Elemental
UPDATE mob_groups SET MP = 15000 WHERE groupid = 24 AND zoneid = 29; -- Earth_Elemental
UPDATE mob_groups SET minLevel = 78, maxLevel = 80 WHERE groupid = 25 AND zoneid = 29; -- Pey
UPDATE mob_groups SET MP = 15000, minLevel = 78, maxLevel = 80 WHERE groupid = 26 AND zoneid = 29; -- Iruci
UPDATE mob_groups SET MP = 15000, minLevel = 78, maxLevel = 80 WHERE groupid = 27 AND zoneid = 29; -- Airi

INSERT INTO mob_groups (groupid, poolid, zoneid, name, respawntime, spawntype, dropid, HP, MP, minLevel, maxLevel, allegiance) VALUES (28, 325, 29, 'Bahamutv2', 0, 128, 6026, 34000, 20000, 92, 92, 0); -- Bahamutv2

-- ------------------------------------------------------------
-- Riverne-Site_A01 (Zone 30)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Darner' AND groupid = '13' AND zoneid = '30';

UPDATE mob_groups SET respawntime = 0, spawntype = 128, HP = 1420 WHERE groupid = 12 AND zoneid = 30; -- Carmine_Dobsonfly
UPDATE mob_groups SET HP = 4000, MP = 10000 WHERE groupid = 15 AND zoneid = 30; -- Water_Elemental
UPDATE mob_groups SET HP = 4000, MP = 10000 WHERE groupid = 16 AND zoneid = 30; -- Earth_Elemental
UPDATE mob_groups SET poolid = 20000, MP = 20000, minLevel = 90, maxLevel = 90 WHERE groupid = 17 AND zoneid = 30; -- Ouryu
UPDATE mob_groups SET HP = 4000, MP = 10000 WHERE groupid = 18 AND zoneid = 30; -- Ziryu

-- ------------------------------------------------------------
-- Monarch_Linn (Zone 31)
-- ------------------------------------------------------------
UPDATE mob_groups SET minLevel = 45, maxLevel = 45 WHERE groupid = 3 AND zoneid = 31; -- Hamadryad
UPDATE mob_groups SET minLevel = 45, maxLevel = 45 WHERE groupid = 4 AND zoneid = 31; -- Razon
UPDATE mob_groups SET HP = 5000, minLevel = 57, maxLevel = 58 WHERE groupid = 5 AND zoneid = 31; -- Watch_Hippogryph
UPDATE mob_groups SET HP = 950, minLevel = 53, maxLevel = 54 WHERE groupid = 6 AND zoneid = 31; -- Guard_Hippogryph
UPDATE mob_groups SET minLevel = 58, maxLevel = 60 WHERE groupid = 7 AND zoneid = 31; -- Hotupuku

-- ------------------------------------------------------------
-- Sealions_Den (Zone 32)
-- ------------------------------------------------------------
UPDATE mob_groups SET minLevel = 55, maxLevel = 56 WHERE groupid = 1 AND zoneid = 32; -- Mammet-22_Zeta
UPDATE mob_groups SET minLevel = 70, maxLevel = 70 WHERE groupid = 4 AND zoneid = 32; -- Tenzen

-- ------------------------------------------------------------
-- AlTaieu (Zone 33)
-- ------------------------------------------------------------
UPDATE mob_groups SET minLevel = 70, maxLevel = 71 WHERE name = "Ulxzomit" and zoneid = 33 and groupid = 7; -- Mother is higher level
UPDATE mob_groups SET minLevel = 69, maxLevel = 71 WHERE name = "Aerns_Wynav" and zoneid = 33;
UPDATE mob_groups SET minLevel = 69, maxLevel = 71 WHERE name = "Aerns_Xzomit" and zoneid = 33;
UPDATE mob_groups SET minLevel = 69, maxLevel = 71 WHERE name = "Aerns_Elemental" and zoneid = 33;
UPDATE mob_groups SET minLevel = 75, maxLevel = 77 WHERE name = "Ulphuabo" and zoneid = 33;

UPDATE mob_groups SET respawntime = 960 WHERE groupid = 7 AND zoneid = 33; -- Ulxzomit
UPDATE mob_groups SET HP = 57000, MP = 25000 WHERE groupid = 53 AND zoneid = 33; -- Jailer_of_Love
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 61 AND zoneid = 33; -- Ulxzomit

INSERT INTO mob_groups (groupid, poolid, zoneid, name, respawntime, spawntype, dropid, HP, MP, minLevel, maxLevel, allegiance) VALUES (62, 20006, 33, 'Qnxzomit_jol', 0, 128, 0, 0, 0, 80, 80, 0); -- Qnxzomit_jol

-- ------------------------------------------------------------
-- Grand_Palace_of_HuXzoi (Zone 34)
-- ------------------------------------------------------------
UPDATE mob_groups SET minLevel = 74, maxLevel = 76 WHERE name = "Aerns_Elemental" and zoneid = 34;
UPDATE mob_groups SET minLevel = 74, maxLevel = 76 WHERE name = "Aerns_Wynav" and zoneid = 34;
UPDATE mob_groups SET minLevel = 74, maxLevel = 76 WHERE name = "Aerns_Euvhi" and zoneid = 34;

UPDATE mob_groups SET maxLevel = 77 WHERE groupid = 22 AND zoneid = 34; -- Ixghrah

-- ------------------------------------------------------------
-- The_Garden_of_RuHmet (Zone 35)
-- ------------------------------------------------------------
UPDATE mob_groups SET minLevel = 75, maxLevel = 78 WHERE name = "Aerns_Elemental" and zoneid = 35;
UPDATE mob_groups SET minLevel = 75, maxLevel = 78 WHERE name = "Aerns_Wynav" and zoneid = 35;
UPDATE mob_groups SET minLevel = 75, maxLevel = 78 WHERE name = "Aerns_Euvhi" and zoneid = 35;

UPDATE mob_groups SET HP = 9300 WHERE groupid = 28 AND zoneid = 35; -- Ixaern_drk
UPDATE mob_groups SET HP = 13570 WHERE groupid = 31 AND zoneid = 35; -- Ixaern_drg

-- ------------------------------------------------------------
-- Empyreal_Paradox (Zone 36)
-- ------------------------------------------------------------
UPDATE mob_groups SET MP = 2500 WHERE groupid = 3 AND zoneid = 36; -- Kamlanaut
UPDATE mob_groups SET MP = 3500 WHERE groupid = 4 AND zoneid = 36; -- Ealdnarche

-- ------------------------------------------------------------
-- Apollyon (Zone 38)
-- ------------------------------------------------------------
UPDATE mob_groups SET HP = 3450 WHERE groupid = 10 AND zoneid = 38; -- Armoury_Crate
UPDATE mob_groups SET HP = 1650 WHERE groupid = 54 AND zoneid = 38; -- Gunpod

-- ------------------------------------------------------------
-- Dynamis-Tavnazia (Zone 42)
-- ------------------------------------------------------------
UPDATE mob_groups SET HP = 6000 WHERE name = "Nightmare_Hornet" and zoneid = 42;
UPDATE mob_groups SET HP = 14000 WHERE name = "Nightmare_Bugard" and zoneid = 42;
UPDATE mob_groups SET HP = 7000 WHERE name = "Nightmare_Taurus" and zoneid = 42;
UPDATE mob_groups SET HP = 6000 WHERE name = "Nightmare_Makara" and zoneid = 42;
UPDATE mob_groups SET HP = 12000 WHERE name = "Nightmare_Worm" and zoneid = 42;
UPDATE mob_groups SET HP = 14000 WHERE name = "Nightmare_Antlion" and zoneid = 42;
UPDATE mob_groups SET HP = 6000 WHERE name = "Nightmare_Leech" and zoneid = 42;
UPDATE mob_groups SET HP = 6000 WHERE name = "Nightmare_Cluster" and zoneid = 42;
UPDATE mob_groups SET HP = 30000, MP = 5000 WHERE groupid = 1 and zoneid = 42; -- Diabolos_Spade
UPDATE mob_groups SET HP = 30000, MP = 5000 WHERE groupid = 2 and zoneid = 42; -- Diabolos_Heart
UPDATE mob_groups SET HP = 30000, MP = 5000 WHERE groupid = 3 and zoneid = 42; -- Diabolos_Diamond
UPDATE mob_groups SET HP = 30000, MP = 5000 WHERE groupid = 4 and zoneid = 42; -- Diabolos_Club
UPDATE mob_groups SET HP = 15000 WHERE name = "Diaboloss_Shard" and zoneid = 42; -- Diaboloss_Shard
INSERT INTO mob_groups (groupid, poolid, zoneid, name, respawntime, spawntype, dropid, HP, MP, minLevel, maxLevel, allegiance) VALUES (64, 20017, 42, 'Nightmare_Antlion', 600, 0, 1786, 5000, 0, 95, 97, 0); -- Nightmare_Antlion

-- ------------------------------------------------------------
-- Wajaom_Woodlands (Zone 51)
-- ------------------------------------------------------------
UPDATE mob_groups SET name = 'Chigoe', spawntype = 0 WHERE groupid = 6 AND zoneid = 51; -- Chigoe

-- ------------------------------------------------------------
-- Bhaflau_Thickets (Zone 52)
-- ------------------------------------------------------------
-- Locus Mobs
UPDATE mob_groups SET content_tag='ROV' WHERE name='Locus_Colibri' AND groupid = '52' AND zoneid = '52';
UPDATE mob_groups SET content_tag='ROV' WHERE name='Locus_Wivre' AND groupid = '53' AND zoneid = '52';

UPDATE mob_groups SET name = 'Chigoe', spawntype = 0 WHERE groupid = 18 AND zoneid = 52; -- Chigoe
UPDATE mob_groups SET minLevel = 79, maxLevel = 80 WHERE groupid = 33 AND zoneid = 52; -- Emergent_Elm
UPDATE mob_groups SET HP = 3000, minLevel = 60, maxLevel = 62 WHERE groupid = 46 AND zoneid = 52; -- Plague_Chigoe

-- ------------------------------------------------------------
-- Arrapago_Reef (Zone 54)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ROV' WHERE name='Nirgali' AND groupid = '40' AND zoneid = '54';
UPDATE mob_groups SET HP='12500', maxLevel='83' WHERE name='Bloody_Bones' AND groupid = '48' AND zoneid = '54';
UPDATE mob_groups SET content_tag='ROV' WHERE name='Nostokulshedra' AND groupid = '52' AND zoneid = '54';
UPDATE mob_groups SET content_tag='ROV' WHERE name='Dweomershell' AND groupid = '65' AND zoneid = '54';
UPDATE mob_groups SET HP='4000' WHERE name='Lamia_Exon' AND groupid = '84' AND zoneid = '54';

UPDATE mob_groups SET dropid = 1817 WHERE groupid = 65 AND zoneid = 54; -- Dweomershell

-- ------------------------------------------------------------
-- Ilrusi_Atoll (Zone 55)
-- ------------------------------------------------------------
UPDATE mob_groups SET HP = 4100, minLevel = 75, maxLevel = 77 WHERE groupid = 7 AND zoneid = 55; -- Carrion_Crab
UPDATE mob_groups SET HP = 4300, minLevel = 75, maxLevel = 77 WHERE groupid = 8 AND zoneid = 55; -- Carrion_Leech
UPDATE mob_groups SET HP = 4400, minLevel = 75, maxLevel = 77 WHERE groupid = 9 AND zoneid = 55; -- Carrion_Slime
UPDATE mob_groups SET HP = 4300, minLevel = 75, maxLevel = 77 WHERE groupid = 10 AND zoneid = 55; -- Carrion_Toad
UPDATE mob_groups SET HP = 6500, minLevel = 78 WHERE groupid = 11 AND zoneid = 55; -- Undead_Crab
UPDATE mob_groups SET HP = 6500, minLevel = 78 WHERE groupid = 12 AND zoneid = 55; -- Undead_Leech
UPDATE mob_groups SET HP = 6500, minLevel = 78 WHERE groupid = 13 AND zoneid = 55; -- Undead_Slime
UPDATE mob_groups SET HP = 6500, minLevel = 78 WHERE groupid = 14 AND zoneid = 55; -- Undead_Toad
UPDATE mob_groups SET minLevel = 78 WHERE groupid = 15 AND zoneid = 55; -- Carrion_Crab

-- ------------------------------------------------------------
-- Talacca_Cove (Zone 57)
-- ------------------------------------------------------------
UPDATE mob_groups SET HP = 2300 WHERE groupid = 10 AND zoneid = 57; -- Qultada

-- ------------------------------------------------------------
-- Mount_Zhayolm (Zone 61)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Sulphuric_Jagil' AND groupid = '9' AND zoneid = '61';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Orichalcumshell' AND groupid = '33' AND zoneid = '61';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Scoriaceous_Eruca' AND groupid = '35' AND zoneid = '61';
UPDATE mob_groups SET HP='10500', minlevel='79' WHERE name='Energetic_Eruca' AND groupid = '41' AND zoneid = '61';
UPDATE mob_groups SET respawntime='0' WHERE name='Garharlor_the_Unruly' AND groupid = '42' AND zoneid = '61';
UPDATE mob_groups SET respawntime='0' WHERE name='Garfurlar_the_Rabid' AND groupid = '43' AND zoneid = '61';
UPDATE mob_groups SET respawntime='0' WHERE name='Garhorlur_the_Brutal' AND groupid = '44' AND zoneid = '61';

UPDATE mob_groups SET spawntype = 128, dropid = 0 WHERE groupid = 28 AND zoneid = 61; -- Chary_Apkallu
UPDATE mob_groups SET HP = 15000 WHERE groupid = 42 AND zoneid = 61; -- Garharlor_the_Unruly
UPDATE mob_groups SET HP = 15000 WHERE groupid = 43 AND zoneid = 61; -- Garfurlar_the_Rabid
UPDATE mob_groups SET HP = 15000 WHERE groupid = 44 AND zoneid = 61; -- Garhorlur_the_Brutal

-- ------------------------------------------------------------
-- Halvung (Zone 62)
-- ------------------------------------------------------------
UPDATE mob_groups SET HP='4000' WHERE name='Hilltroll_Elite_Guard' AND groupid = '47' AND zoneid = '62';
UPDATE mob_groups SET HP='4000' WHERE name='Woodtroll_Elite_Guard' AND groupid = '48' AND zoneid = '62';

-- ------------------------------------------------------------
-- Lebros_Cavern (Zone 63)
-- ------------------------------------------------------------
UPDATE mob_groups SET HP = 10000, MP = 0, minLevel = 76, maxLevel = 78 WHERE groupid = 6 AND zoneid = 63; -- Broken_Troll_Soldier_pld
UPDATE mob_groups SET HP = 10000, minLevel = 76, maxLevel = 78 WHERE groupid = 7 AND zoneid = 63; -- Broken_Troll_Soldier_war
UPDATE mob_groups SET HP = 10000, MP = 0, minLevel = 76, maxLevel = 78 WHERE groupid = 8 AND zoneid = 63; -- Broken_Troll_Soldier_rdm
UPDATE mob_groups SET HP = 10000, minLevel = 76, maxLevel = 78 WHERE groupid = 9 AND zoneid = 63; -- Broken_Troll_Soldier_mnk

-- ------------------------------------------------------------
-- Navukgo_Execution_Chamber (Zone 64)
-- ------------------------------------------------------------
UPDATE mob_groups SET HP = 4000 WHERE groupid = 4 AND zoneid = 64; -- Immortal_Flan

-- ------------------------------------------------------------
-- Mamook (Zone 65)
-- ------------------------------------------------------------
UPDATE mob_groups SET HP='4000' WHERE name='Mamool_Ja_Chamberlain' AND groupid = '55' AND zoneid = '65';
UPDATE mob_groups SET HP='4000' WHERE name='Mamool_Ja_Palatine' AND groupid = '56' AND zoneid = '65';
UPDATE mob_groups SET HP='14000' WHERE name='Zizzy_Zillah' AND groupid = '20' AND zoneid = '65';

UPDATE mob_groups SET dropid = 1853 WHERE groupid = 46 AND zoneid = 65; -- Firedance_Magmaal_Ja

-- ------------------------------------------------------------
-- Halvung (Zone 62)
-- ------------------------------------------------------------
UPDATE mob_groups SET HP='12500' WHERE name='Big_Bomb' AND groupid = '29' AND zoneid = '62';

-- ------------------------------------------------------------
-- Mamool_Ja_Training_Grounds (Zone 66)
-- ------------------------------------------------------------
UPDATE mob_groups SET HP='3000', minLevel='70', maxLevel='70' WHERE name='Mamool_Ja_Recruit' AND groupid = '14' AND zoneid = '66';
UPDATE mob_groups SET HP='3500', minLevel='77', maxLevel='78' WHERE name='Mamool_Ja_Trainer' AND groupid = '15' AND zoneid = '66';

UPDATE mob_groups SET HP = 3000, minLevel = 70, maxLevel = 70 WHERE groupid = 14 AND zoneid = 66; -- Mamool_Ja_Recruit
UPDATE mob_groups SET HP = 3500 WHERE groupid = 15 AND zoneid = 66; -- Mamool_Ja_Trainer

-- ------------------------------------------------------------
-- Jade_Sepulcher (Zone 67)
-- ------------------------------------------------------------
UPDATE mob_groups SET HP = 2300, MP = 1200, minLevel = 70, maxLevel = 70 WHERE groupid = 3 AND zoneid = 67; -- Raubahn

-- ------------------------------------------------------------
-- Aydeewa_Subterrane (Zone 68)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Mycohopper' AND groupid = '16' AND zoneid = '68';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Slime_Eater' AND groupid = '24' AND zoneid = '68';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Deforester' AND groupid = '18' AND zoneid = '68';

-- ------------------------------------------------------------
-- Leujaoam_Sanctum (Zone 69)
-- ------------------------------------------------------------
UPDATE mob_groups SET minLevel = 80, maxLevel = 82 WHERE groupid = 2 AND zoneid = 69; -- Qiqirn_Miner
UPDATE mob_groups SET HP = 1500, minLevel = 73, maxLevel = 73 WHERE groupid = 3 AND zoneid = 69; -- Mineral_Eater

-- ------------------------------------------------------------
-- Alzadaal_Undersea_Ruins (Zone 72)
-- ------------------------------------------------------------
-- Apex mobs for this zone are not captured yet, treat this as a placeholder
-- UPDATE mob_groups SET content_tag='ROV' WHERE name='Apex_Archaic_Cog' AND groupid = '??' AND zoneid = '72';
-- UPDATE mob_groups SET content_tag='ROV' WHERE name='Apex_Archaic_Cogs' AND groupid = '??' AND zoneid = '72';

-- ------------------------------------------------------------
-- Nyzul_Isle (Zone 77)
-- ------------------------------------------------------------
UPDATE mob_groups SET HP = 51200 WHERE groupid = 120 AND zoneid = 77; -- Simurgh
UPDATE mob_groups SET HP = 5000 WHERE groupid = 197 AND zoneid = 77; -- Serra
UPDATE mob_groups SET HP = 35000 WHERE groupid = 255 AND zoneid = 77; -- King_Arthro

-- ------------------------------------------------------------
-- Caedarva_Mire (Zone 79)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Slough_Skua' AND groupid = '28' AND zoneid = '79';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Vauxia_Fly' AND groupid = '45' AND zoneid = '79';

-- ASB Section (Offset by 100 to avoid merge conflicts)
INSERT INTO `mob_groups` (`groupid`, `poolid`, `zoneid`, `name`, `respawntime`, `spawntype`, `dropid`, `HP`, `MP`, `minLevel`, `maxLevel`, `allegiance`) VALUES
(100,714,79,'Peallaidh_Chigoe',0,0,466,350,0,70,71,0),
(101,714,79,'Karakul_Chigoe',0,0,466,50,0,62,66,0);

UPDATE mob_groups SET HP = 13500, minLevel = 74 WHERE groupid = 51 AND zoneid = 79; -- Peallaidh

-- ------------------------------------------------------------
-- East_Ronfaure_[S] (Zone 81)
-- ------------------------------------------------------------
UPDATE mob_groups SET dropid = 0 WHERE groupid = 41 AND zoneid = 81; -- Dark_Ixion
UPDATE mob_groups SET HP = 3500 WHERE groupid = 86 AND zoneid = 81; -- Poisonhand_Gnadgad

-- ------------------------------------------------------------
-- Jugner_Forest_[S] (Zone 82)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Gnoletrap' AND groupid = '31' AND zoneid = '82';
UPDATE mob_groups SET dropid = 0 WHERE groupid = 45 AND zoneid = 82; -- Dark_Ixion

-- ------------------------------------------------------------
-- Vunkerl_Inlet_[S] (Zone 83)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Duriumshell' AND groupid = '5' AND zoneid = '83';
UPDATE mob_groups SET HP = 6000 WHERE groupid = 88 AND zoneid = 83; -- Three-eyed_Prozpuz

-- ------------------------------------------------------------
-- Batallia_Downs_[S] (Zone 84)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Tsetse_Fly' AND groupid = '24' AND zoneid = '84';
UPDATE mob_groups SET dropid = 0 WHERE groupid = 38 AND zoneid = 84; -- Dark_Ixion

-- ------------------------------------------------------------
-- North_Gustaberg_[S] (Zone 88)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Drachenlizard' AND groupid = '44' AND zoneid = '88';
UPDATE mob_groups SET dropid = 0 WHERE groupid = 27 AND zoneid = 88; -- Olgoi-Khorkhoi

-- ------------------------------------------------------------
-- Grauberg_[S] (Zone 89)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Feyweald_Sapling' AND groupid = '16' AND zoneid = '89';
UPDATE mob_groups SET dropid = 0 WHERE groupid = 52 AND zoneid = 89; -- Dark_Ixion

-- ------------------------------------------------------------
-- Rolanberry_Fields_[S] (Zone 91)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Champion_Crawler' AND groupid = '29' AND zoneid = '91';
UPDATE mob_groups SET dropid = 0 WHERE groupid = 49 AND zoneid = 91; -- Dark_Ixion

-- ------------------------------------------------------------
-- West_Sarutabaruta_[S] (Zone 95)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Hispid_Rarab' AND groupid = '21' AND zoneid = '95';
UPDATE mob_groups SET dropid = 0 WHERE groupid = 41 AND zoneid = 95; -- Dark_Ixion

-- ------------------------------------------------------------
-- Fort_Karugo-Narugo_[S] (Zone 96)
-- ------------------------------------------------------------
UPDATE mob_groups SET spawntype = 128, dropid = 0 WHERE groupid = 13 AND zoneid = 96; -- Emela-ntouka
UPDATE mob_groups SET dropid = 0 WHERE groupid = 28 AND zoneid = 96; -- Dark_Ixion

-- ------------------------------------------------------------
-- Meriphataud_Mountains_[S] (Zone 97)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Condor' AND groupid = '34' AND zoneid = '97';
UPDATE mob_groups SET dropid = 202 WHERE groupid = 31 AND zoneid = 97; -- Axe_Beak

-- ------------------------------------------------------------
-- Sauromugue_Champaign_[S] (Zone 98)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Gouger_Beetle' AND groupid = '8' AND zoneid = '98';

-- ------------------------------------------------------------
-- West_Ronfaure (Zone 100)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Amanita' AND groupid = '16' AND zoneid = '100';

UPDATE mob_groups SET minLevel = 1, maxLevel = 5 WHERE name = "Carrion_Worm"   and zoneid = 100;
UPDATE mob_groups SET minLevel = 1, maxLevel = 5 WHERE name = "Forest_Hare"   and zoneid = 100;
UPDATE mob_groups SET minLevel = 3, maxLevel = 6 WHERE name = "Scarab_Beetle"   and zoneid = 100;

UPDATE mob_groups SET dropid = 481 WHERE groupid = 1 AND zoneid = 100; -- Tree_Crab
UPDATE mob_groups SET dropid = 481 WHERE groupid = 2 AND zoneid = 100; -- Limicoline_Crab
UPDATE mob_groups SET dropid = 481 WHERE groupid = 4 AND zoneid = 100; -- Vermivorous_Crab
UPDATE mob_groups SET dropid = 481 WHERE groupid = 5 AND zoneid = 100; -- Passage_Crab
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 16 AND zoneid = 100; -- Amanita

-- ------------------------------------------------------------
-- East_Ronfaure (Zone 101)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Rambukk' AND groupid = '20' AND zoneid = '101';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Yilbegan' AND groupid = '45' AND zoneid = '101';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Krabkatoa' AND groupid = '46' AND zoneid = '101';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Yacumama' AND groupid = '47' AND zoneid = '101';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Capricornus' AND groupid = '48' AND zoneid = '101';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Quagmire_Pugil' AND groupid = '49' AND zoneid = '101';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Sunderclaw' AND groupid = '50' AND zoneid = '101';

UPDATE mob_groups SET minLevel = 1, maxLevel = 5 WHERE name = "Carrion_Worm"   and zoneid = 101;
UPDATE mob_groups SET minLevel = 1, maxLevel = 5 WHERE name = "Forest_Hare"   and zoneid = 101;
UPDATE mob_groups SET minLevel = 3, maxLevel = 6 WHERE name = "Scarab_Beetle"   and zoneid = 101;

-- ------------------------------------------------------------
-- La_Theine_Plateau (Zone 102)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Slumbering_Samwell' AND groupid = '37' AND zoneid = '102';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Yilbegan' AND groupid = '49' AND zoneid = '102';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Dawon' AND groupid = '50' AND zoneid = '102';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Tammuz' AND groupid = '51' AND zoneid = '102';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Chesma' AND groupid = '52' AND zoneid = '102';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Void_Hare' AND groupid = '53' AND zoneid = '102';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Prickly_Sheep' AND groupid = '54' AND zoneid = '102';

UPDATE mob_groups SET dropid = 6027 WHERE groupid = 26 AND zoneid = 102; -- Grenade
UPDATE mob_groups SET dropid = 6029 WHERE groupid = 28 AND zoneid = 102; -- Goblin_Tinkerer
UPDATE mob_groups SET dropid = 6029 WHERE groupid = 29 AND zoneid = 102; -- Goblin_Butcher
UPDATE mob_groups SET dropid = 82 WHERE groupid = 38 AND zoneid = 102; -- Plague_Bats

-- ------------------------------------------------------------
-- Valkurm_Dunes (Zone 103)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Metal_Shears' AND groupid = '17' AND zoneid = '103';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Hippomaritimus' AND groupid = '29' AND zoneid = '103';

UPDATE mob_groups SET minLevel = 15, maxLevel = 18 WHERE name = "Hill_Lizard"   and zoneid = 103;

UPDATE mob_groups SET dropid = 1017 WHERE groupid = 7 AND zoneid = 103; -- Goblin_Ambusher
UPDATE mob_groups SET dropid = 6029 WHERE groupid = 8 AND zoneid = 103; -- Goblin_Butcher
UPDATE mob_groups SET dropid = 82 WHERE groupid = 9 AND zoneid = 103; -- Night_Bats
UPDATE mob_groups SET dropid = 6029 WHERE groupid = 13 AND zoneid = 103; -- Goblin_Tinkerer
UPDATE mob_groups SET dropid = 6027 WHERE groupid = 15 AND zoneid = 103; -- Will-o-the-Wisp
UPDATE mob_groups SET HP = 6800 WHERE groupid = 34 AND zoneid = 103; -- Marchelute
UPDATE mob_groups SET HP = 2500 WHERE groupid = 35 AND zoneid = 103; -- Doman
UPDATE mob_groups SET HP = 2500 WHERE groupid = 36 AND zoneid = 103; -- Onryo
UPDATE mob_groups SET HP = 500, minLevel = 20, maxLevel = 20 WHERE groupid = 66 AND zoneid = 103; -- Houu_the_Shoalwader
UPDATE mob_groups SET HP = 450 WHERE groupid = 67 AND zoneid = 103; -- Beach_Monk
UPDATE mob_groups SET HP = 450 WHERE groupid = 68 AND zoneid = 103; -- Heike_Crab

-- ------------------------------------------------------------
-- Jugner_Forest (Zone 104)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Supplespine_Mujwuj' AND groupid = '41' AND zoneid = '104';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Sappy_Sycamore' AND groupid = '43' AND zoneid = '104';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Yilbegan' AND groupid = '73' AND zoneid = '104';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Krabkatoa' AND groupid = '74' AND zoneid = '104';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Yacumama' AND groupid = '75' AND zoneid = '104';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Capricornus' AND groupid = '76' AND zoneid = '104';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Quagmire_Pugil' AND groupid = '77' AND zoneid = '104';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Sunderclaw' AND groupid = '78' AND zoneid = '104';

UPDATE mob_groups SET dropid = 6037 WHERE groupid = 6 AND zoneid = 104; -- Knight_Crab
UPDATE mob_groups SET dropid = 427 WHERE groupid = 14 AND zoneid = 104; -- Screamer
UPDATE mob_groups SET dropid = 6029 WHERE groupid = 29 AND zoneid = 104; -- Goblin_Tinkerer
UPDATE mob_groups SET dropid = 6029 WHERE groupid = 31 AND zoneid = 104; -- Goblin_Butcher
UPDATE mob_groups SET HP = 3000, minLevel = 38, maxLevel = 38 WHERE groupid = 63 AND zoneid = 104; -- Giollemitte_B_Feroun
UPDATE mob_groups SET HP = 2000, minLevel = 35, maxLevel = 35 WHERE groupid = 64 AND zoneid = 104; -- Skeleton_Esquire

-- ------------------------------------------------------------
-- Batallia_Downs (Zone 105)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Skirling_Liger' AND groupid = '25' AND zoneid = '105';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Eyegouger' AND groupid = '38' AND zoneid = '105';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Prankster_Maverix' AND groupid = '40' AND zoneid = '105';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Yilbegan' AND groupid = '50' AND zoneid = '105';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Verthandi' AND groupid = '51' AND zoneid = '105';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Urd' AND groupid = '52' AND zoneid = '105';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Skuld' AND groupid = '53' AND zoneid = '105';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Aither' AND groupid = '54' AND zoneid = '105';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Deorc' AND groupid = '55' AND zoneid = '105';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Eorthe' AND groupid = '56' AND zoneid = '105';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Puretos' AND groupid = '57' AND zoneid = '105';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Pruina' AND groupid = '58' AND zoneid = '105';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Beorht' AND groupid = '59' AND zoneid = '105';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Thunor' AND groupid = '60' AND zoneid = '105';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Lacus' AND groupid = '61' AND zoneid = '105';

UPDATE mob_groups SET minLevel = 30, maxLevel = 36 WHERE name = "Goblin_Furrier" and zoneid = 105;
UPDATE mob_groups SET minLevel = 30, maxLevel = 36 WHERE name = "Goblin_Pathfinder" and zoneid = 105;
UPDATE mob_groups SET minLevel = 30, maxLevel = 36 WHERE name = "Goblin_Shaman" and zoneid = 105;
UPDATE mob_groups SET minLevel = 30, maxLevel = 36 WHERE name = "Goblin_Smithy" and zoneid = 105;
UPDATE mob_groups SET minLevel = 28, maxLevel = 30 WHERE name = "Greater_Pugil_fished" and zoneid = 105;
UPDATE mob_groups SET minLevel = 33, maxLevel = 35 WHERE name = "Kraken_fished" and zoneid = 105;

UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 6 AND zoneid = 105; -- Weeping_Willow
UPDATE mob_groups SET dropid = 1879 WHERE groupid = 27 AND zoneid = 105; -- Orcish_Impaler
UPDATE mob_groups SET HP = 6200 WHERE groupid = 43 AND zoneid = 105; -- Sturmtiger
UPDATE mob_groups SET HP = 1000, MP = 0 WHERE groupid = 46 AND zoneid = 105; -- Badshah

-- ------------------------------------------------------------
-- North_Gustaberg (Zone 106)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Bedrock_Barry' AND groupid = '26' AND zoneid = '106';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Yilbegan' AND groupid = '42' AND zoneid = '106';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Blobdingnag' AND groupid = '43' AND zoneid = '106';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Septic_Boil' AND groupid = '44' AND zoneid = '106';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Shoggoth' AND groupid = '45' AND zoneid = '106';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Lamprey_Lord' AND groupid = '46' AND zoneid = '106';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Ground_Guzzler' AND groupid = '47' AND zoneid = '106';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Globster' AND groupid = '48' AND zoneid = '106';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Yilbegan' AND groupid = '42' AND zoneid = '106';

UPDATE mob_groups SET minLevel = 2, maxLevel = 5 WHERE name = "Maneating_Hornet"     and zoneid = 106;
UPDATE mob_groups SET minLevel = 2, maxLevel = 5 WHERE name = "Stone_Eater"     and zoneid = 106;
UPDATE mob_groups SET minLevel = 2, maxLevel = 6 WHERE name = "Vulture"     and zoneid = 106;
UPDATE mob_groups SET minLevel = 2, maxLevel = 4 WHERE name = "Sand_Crab"     and zoneid = 106;

UPDATE mob_groups SET dropid = 484 WHERE groupid = 1 AND zoneid = 106; -- Stone_Crab
UPDATE mob_groups SET dropid = 481 WHERE groupid = 2 AND zoneid = 106; -- Sand_Crab
UPDATE mob_groups SET dropid = 2339 WHERE groupid = 10 AND zoneid = 106; -- Stone_Eater
UPDATE mob_groups SET dropid = 1958 WHERE groupid = 11 AND zoneid = 106; -- Ornery_Sheep
UPDATE mob_groups SET dropid = 1185 WHERE groupid = 15 AND zoneid = 106; -- Goblin_Weaver
UPDATE mob_groups SET dropid = 2120 WHERE groupid = 19 AND zoneid = 106; -- Rock_Lizard
UPDATE mob_groups SET dropid = 2604 WHERE groupid = 20 AND zoneid = 106; -- Walking_Sapling
UPDATE mob_groups SET dropid = 2595 WHERE groupid = 21 AND zoneid = 106; -- Vulture
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 26 AND zoneid = 106; -- Bedrock_Barry
UPDATE mob_groups SET HP = 8300 WHERE groupid = 34 AND zoneid = 106; -- Gambilox_Wanderling

-- ------------------------------------------------------------
-- South_Gustaberg (Zone 107)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Tococo' AND groupid = '28' AND zoneid = '107';

UPDATE mob_groups SET minLevel = 2, maxLevel = 6 WHERE name = "Vulture"     and zoneid = 107;
UPDATE mob_groups SET minLevel = 5, maxLevel = 6 WHERE name = "Land_Crab"   and zoneid = 107;
UPDATE mob_groups SET minLevel = 2, maxLevel = 4 WHERE name = "Sand_Crab"   and zoneid = 107;

-- ------------------------------------------------------------
-- Konschtat_Highlands (Zone 108)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Ghillie_Dhu' AND groupid = '8' AND zoneid = '108';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Highlander_lizard' AND groupid = '26' AND zoneid = '108';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Yilbegan' AND groupid = '38' AND zoneid = '108';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Dawon' AND groupid = '39' AND zoneid = '108';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Tammuz' AND groupid = '40' AND zoneid = '108';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Chesma' AND groupid = '41' AND zoneid = '108';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Void_Hare' AND groupid = '42' AND zoneid = '108';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Prickly_Sheep' AND groupid = '43' AND zoneid = '108';

UPDATE mob_groups SET minLevel = 7, maxLevel = 10 WHERE name = "Huge_Wasp"   and zoneid = 107;
UPDATE mob_groups SET minLevel = 7, maxLevel = 10 WHERE name = "Strolling_Sapling"   and zoneid = 107;
UPDATE mob_groups SET minLevel = 11, maxLevel = 13 WHERE name = "Mad_Sheep"   and zoneid = 107;

UPDATE mob_groups SET dropid = 1017 WHERE groupid = 5 AND zoneid = 108; -- Goblin_Ambusher
UPDATE mob_groups SET dropid = 6029 WHERE groupid = 7 AND zoneid = 108; -- Goblin_Butcher
UPDATE mob_groups SET dropid = 6029 WHERE groupid = 24 AND zoneid = 108; -- Goblin_Tinkerer
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 26 AND zoneid = 108; -- Highlander_Lizard
UPDATE mob_groups SET HP = 1600 WHERE groupid = 33 AND zoneid = 108; -- Forger

-- ------------------------------------------------------------
-- Pashhow_Marshlands (Zone 109)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='NiZho_Bladebender' AND groupid = '28' AND zoneid = '109';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Toxic_Tamlyn' AND groupid = '38' AND zoneid = '109';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Yilbegan' AND groupid = '65' AND zoneid = '109';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Blobdingnag' AND groupid = '66' AND zoneid = '109';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Septic_Boil' AND groupid = '67' AND zoneid = '109';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Shoggoth' AND groupid = '68' AND zoneid = '109';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Lamprey_Lord' AND groupid = '69' AND zoneid = '109';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Ground_Guzzler' AND groupid = '70' AND zoneid = '109';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Globster' AND groupid = '71' AND zoneid = '109';

UPDATE mob_groups SET minLevel = 19, maxLevel = 22 WHERE name = "Thread_Leech"   and zoneid = 109;
UPDATE mob_groups SET minLevel = 16, maxLevel = 26 WHERE name = "Ghoul_war"   and zoneid = 109;
UPDATE mob_groups SET minLevel = 20, maxLevel = 23 WHERE name = "Snipper"   and zoneid = 109;

UPDATE mob_groups SET dropid = 895 WHERE groupid = 1 AND zoneid = 109; -- Swamp_Leech
UPDATE mob_groups SET HP = 1000 WHERE groupid = 29 AND zoneid = 109; -- Jolly_Green
UPDATE mob_groups SET dropid = 6029 WHERE groupid = 33 AND zoneid = 109; -- Goblin_Tinkerer
UPDATE mob_groups SET dropid = 6029 WHERE groupid = 35 AND zoneid = 109; -- Goblin_Butcher
UPDATE mob_groups SET dropid = 6015, HP = 3400, MP = 4000, maxLevel = 45 WHERE groupid = 38 AND zoneid = 109; -- Toxic_Tamlyn
UPDATE mob_groups SET HP = 875 WHERE groupid = 39 AND zoneid = 109; -- Bloodpool_Vorax


INSERT INTO mob_groups (groupid, poolid, zoneid, name, respawntime, spawntype, dropid, HP, MP, minLevel, maxLevel, allegiance) VALUES (80, 2986, 109, 'Onyx_Quadav', 0, 128, 1864, 0, 0, 16, 20, 0); -- Onyx_Quadav
INSERT INTO mob_groups (groupid, poolid, zoneid, name, respawntime, spawntype, dropid, HP, MP, minLevel, maxLevel, allegiance) VALUES (81, 525, 109, 'Brass_Quadav', 0, 128, 350, 0, 0, 20, 26, 0); -- Brass_Quadav

-- ------------------------------------------------------------
-- Rolanberry_Fields (Zone 110)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Ravenous_Crawler' AND groupid = '36' AND zoneid = '110';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Eldritch_Edge' AND groupid = '38' AND zoneid = '110';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Yilbegan' AND groupid = '45' AND zoneid = '110';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Verthandi' AND groupid = '46' AND zoneid = '110';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Urd' AND groupid = '47' AND zoneid = '110';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Skuld' AND groupid = '48' AND zoneid = '110';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Aither' AND groupid = '49' AND zoneid = '110';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Deorc' AND groupid = '50' AND zoneid = '110';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Eorthe' AND groupid = '51' AND zoneid = '110';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Puretos' AND groupid = '52' AND zoneid = '110';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Pruina' AND groupid = '53' AND zoneid = '110';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Beorht' AND groupid = '54' AND zoneid = '110';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Thunor' AND groupid = '55' AND zoneid = '110';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Lacus' AND groupid = '56' AND zoneid = '110';

UPDATE mob_groups SET minLevel = 28, maxLevel = 30 WHERE name = "Greater_Pugil_fished"   and zoneid = 110;
UPDATE mob_groups SET minLevel = 31, maxLevel = 33 WHERE name = "Big_Leech"   and zoneid = 110;

UPDATE mob_groups SET dropid = 1328 WHERE groupid = 8 AND zoneid = 110; -- Moon_Bat
UPDATE mob_groups SET dropid = 512 WHERE groupid = 12 AND zoneid = 110; -- Copper_Quadav
UPDATE mob_groups SET dropid = 512 WHERE groupid = 13 AND zoneid = 110; -- Bronze_Quadav
UPDATE mob_groups SET dropid = 512 WHERE groupid = 15 AND zoneid = 110; -- Silver_Quadav
UPDATE mob_groups SET dropid = 1159 WHERE groupid = 28 AND zoneid = 110; -- Goblin_Smithy
UPDATE mob_groups SET HP = 2000 WHERE groupid = 31 AND zoneid = 110; -- Black_Triple_Stars
UPDATE mob_groups SET dropid = 343 WHERE groupid = 32 AND zoneid = 110; -- Poison_Leech
UPDATE mob_groups SET minLevel = 50, maxLevel = 50 WHERE groupid = 36 AND zoneid = 110; -- Ravenous_Crawler
UPDATE mob_groups SET HP = 1520 WHERE groupid = 39 AND zoneid = 110; -- Drooling_Daisy

-- ------------------------------------------------------------
-- Beaucedine_Glacier (Zone 111)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Humbaba' AND groupid = '32' AND zoneid = '111';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Calcabrina' AND groupid = '33' AND zoneid = '111';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Yilbegan' AND groupid = '52' AND zoneid = '111';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Lord_Ruthven' AND groupid = '53' AND zoneid = '111';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Feuerunke' AND groupid = '54' AND zoneid = '111';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Erebus' AND groupid = '55' AND zoneid = '111';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Gjenganger' AND groupid = '56' AND zoneid = '111';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Gorehound' AND groupid = '57' AND zoneid = '111';

UPDATE mob_groups SET minLevel = 35, maxLevel = 40 WHERE name = "Ghast_war"  and zoneid = 111;
UPDATE mob_groups SET minLevel = 35, maxLevel = 40 WHERE name = "Ghast_blm"  and zoneid = 111;
UPDATE mob_groups SET minLevel = 38, maxLevel = 40 WHERE name = "Apsaras"  and zoneid = 111;
UPDATE mob_groups SET minLevel = 41, maxLevel = 42 WHERE name = "Morgawr"  and zoneid = 111;

UPDATE mob_groups SET dropid = 1127 WHERE groupid = 7 AND zoneid = 111; -- Goblin_Pathfinder
UPDATE mob_groups SET HP = 2600 WHERE groupid = 24 AND zoneid = 111; -- Nue
UPDATE mob_groups SET dropid = 6053 WHERE groupid = 25 AND zoneid = 111; -- Goblin_Poacher
UPDATE mob_groups SET HP = 3800 WHERE groupid = 30 AND zoneid = 111; -- Kirata
UPDATE mob_groups SET HP = 6900 WHERE groupid = 31 AND zoneid = 111; -- Gargantua

-- ------------------------------------------------------------
-- Xarcabard (Zone 112)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Barbaric_Weapon' AND groupid = '11' AND zoneid = '112';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Duke_Focalor' AND groupid = '21' AND zoneid = '112';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Timeworn_Warrior' AND groupid = '12' AND zoneid = '112';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Yilbegan' AND groupid = '48' AND zoneid = '112';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Lord_Ruthven' AND groupid = '49' AND zoneid = '112';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Feuerunke' AND groupid = '50' AND zoneid = '112';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Erebus' AND groupid = '51' AND zoneid = '112';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Gjenganger' AND groupid = '52' AND zoneid = '112';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Gorehound' AND groupid = '53' AND zoneid = '112';

UPDATE mob_groups SET minLevel = 38, maxLevel = 40 WHERE name = "Gigass_Tiger"  and zoneid = 112 and groupid = 17;

UPDATE mob_groups SET respawntime = 1800 WHERE groupid = 5 AND zoneid = 112; -- Shadow_Dragon
UPDATE mob_groups SET HP = 19000 WHERE groupid = 6 AND zoneid = 112; -- Biast
UPDATE mob_groups SET HP = 4500 WHERE groupid = 21 AND zoneid = 112; -- Duke_Focalor
UPDATE mob_groups SET HP = 6700 WHERE groupid = 24 AND zoneid = 112; -- Shadow_Eye
UPDATE mob_groups SET HP = 3200 WHERE groupid = 25 AND zoneid = 112; -- Chaos_Elemental
UPDATE mob_groups SET HP = 28675, minLevel = 58, maxLevel = 58 WHERE groupid = 26 AND zoneid = 112; -- Boreal_Hound
UPDATE mob_groups SET HP = 6750, minLevel = 58, maxLevel = 58 WHERE groupid = 27 AND zoneid = 112; -- Boreal_Coeurl
UPDATE mob_groups SET HP = 15400, minLevel = 58, maxLevel = 58 WHERE groupid = 28 AND zoneid = 112; -- Boreal_Tiger
UPDATE mob_groups SET HP = 22000 WHERE groupid = 29 AND zoneid = 112; -- Koenigstiger

-- ------------------------------------------------------------
-- Cape_Teriggan (Zone 113)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Killer_Jonny' AND groupid = '20' AND zoneid = '113';
UPDATE mob_groups SET content_tag='SYNERGY' WHERE name='Tegmine' AND groupid = '23' AND zoneid = '113';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Zmey_Gorynych' AND groupid = '24' AND zoneid = '113';

-- ------------------------------------------------------------
-- Eastern_Altepa_Desert (Zone 114)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Donnergugi' AND groupid = '16' AND zoneid = '114';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Nandi' AND groupid = '34' AND zoneid = '114';
UPDATE mob_groups SET content_tag='SYNERGY' WHERE name='Sabotender_Corrido' AND groupid = '25' AND zoneid = '114';

UPDATE mob_groups SET minLevel = 40, maxLevel = 41 WHERE name = "Makara_fished"  and zoneid = 114;
UPDATE mob_groups SET minLevel = 42, maxLevel = 45 WHERE name = "Bigclaw_fished" and zoneid = 114;

UPDATE mob_groups SET maxLevel = 57 WHERE groupid = 27 AND zoneid = 114; -- Centurio_XII-I
UPDATE mob_groups SET dropid = 1145 WHERE groupid = 28 AND zoneid = 114; -- Goblin_Poacher
UPDATE mob_groups SET HP = 4400 WHERE groupid = 29 AND zoneid = 114; -- Dune_Widow
UPDATE mob_groups SET dropid = 1145 WHERE groupid = 31 AND zoneid = 114; -- Goblin_Trader
UPDATE mob_groups SET HP = 5000 WHERE groupid = 37 AND zoneid = 114; -- Decurio_I-III
UPDATE mob_groups SET HP = 2800 WHERE groupid = 38 AND zoneid = 114; -- Tsuchigumo
UPDATE mob_groups SET HP = 10000 WHERE groupid = 52 AND zoneid = 114; -- Cactrot_Rapido

INSERT INTO mob_groups (groupid, poolid, zoneid, name, respawntime, spawntype, dropid, HP, MP, minLevel, maxLevel, allegiance) VALUES (64, 189, 114, 'Antican_Speculator', 0, 128, 138, 0, 0, 44, 49, 0); -- Antican_Speculator
INSERT INTO mob_groups (groupid, poolid, zoneid, name, respawntime, spawntype, dropid, HP, MP, minLevel, maxLevel, allegiance) VALUES (65, 170, 114, 'Antican_Decurio', 0, 128, 119, 0, 0, 44, 49, 0); -- Antican_Decurio

-- ------------------------------------------------------------
-- West_Sarutabaruta (Zone 115)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Numbing_Norman' AND groupid = '27' AND zoneid = '115';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Yilbegan' AND groupid = '36' AND zoneid = '115';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Orcus' AND groupid = '37' AND zoneid = '115';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Farruca_Fly' AND groupid = '38' AND zoneid = '115';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Jyeshtha' AND groupid = '39' AND zoneid = '115';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Rummager_Beetle' AND groupid = '40' AND zoneid = '115';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Raker_Bee' AND groupid = '41' AND zoneid = '115';

UPDATE mob_groups SET minLevel = 4, maxLevel = 8 WHERE name = "Yagudo_Initiate" and zoneid = 115;
UPDATE mob_groups SET minLevel = 4, maxLevel = 8 WHERE name = "Yagudo_Acolyte" and zoneid = 115;
UPDATE mob_groups SET minLevel = 4, maxLevel = 8 WHERE name = "Yagudo_Scribe" and zoneid = 115;
UPDATE mob_groups SET minLevel = 6, maxLevel = 8 WHERE name = "Crawler" and zoneid = 115 and groupid = 22;

UPDATE mob_groups SET dropid = 2597 WHERE groupid = 4 AND zoneid = 115; -- Mugger_Crab
UPDATE mob_groups SET minLevel = 5 WHERE groupid = 16 AND zoneid = 115; -- Yagudo_Initiate
UPDATE mob_groups SET minLevel = 5 WHERE groupid = 17 AND zoneid = 115; -- Yagudo_Acolyte
UPDATE mob_groups SET minLevel = 5 WHERE groupid = 18 AND zoneid = 115; -- Yagudo_Scribe

-- ------------------------------------------------------------
-- East_Sarutabaruta (Zone 116)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Duke_Decapod' AND groupid = '25' AND zoneid = '116';

UPDATE mob_groups SET minLevel = 1, maxLevel = 5 WHERE name = "Savanna_Rarab" and zoneid = 116;
UPDATE mob_groups SET minLevel = 3, maxLevel = 8 WHERE name = "Yagudo_Initiate" and zoneid = 116;
UPDATE mob_groups SET minLevel = 3, maxLevel = 8 WHERE name = "Yagudo_Acolyte" and zoneid = 116;
UPDATE mob_groups SET minLevel = 3, maxLevel = 8 WHERE name = "Yagudo_Scribe" and zoneid = 116;
UPDATE mob_groups SET minLevel = 7, maxLevel = 8 WHERE name = "Pug_Pugil_fished" and zoneid = 116;

-- ------------------------------------------------------------
-- Tahrongi_Canyon (Zone 117)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Habrok' AND groupid = '8' AND zoneid = '117';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Herbage_Hunter' AND groupid = '30' AND zoneid = '117';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Yilbegan' AND groupid = '36' AND zoneid = '117';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Dawon' AND groupid = '37' AND zoneid = '117';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Tammuz' AND groupid = '38' AND zoneid = '117';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Chesma' AND groupid = '39' AND zoneid = '117';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Void_Hare' AND groupid = '40' AND zoneid = '117';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Prickly_Sheep' AND groupid = '41' AND zoneid = '117';

UPDATE mob_groups SET minLevel = 5, maxLevel = 7  WHERE name = "Yagudos_Elemental"  and zoneid = 117;
UPDATE mob_groups SET minLevel = 7, maxLevel = 10 WHERE name = "Canyon_Rarab"       and zoneid = 117;
UPDATE mob_groups SET minLevel = 7, maxLevel = 10 WHERE name = "Strolling_Sapling"  and zoneid = 117;
UPDATE mob_groups SET minLevel = 8, maxLevel = 10 WHERE name = "Killer_Bee"         and zoneid = 117;
UPDATE mob_groups SET minLevel = 8, maxLevel = 10 WHERE name = "Barghest"           and zoneid = 117;

UPDATE mob_groups SET dropid = 6029 WHERE groupid = 14 AND zoneid = 117; -- Goblin_Tinkerer
UPDATE mob_groups SET dropid = 6029 WHERE groupid = 15 AND zoneid = 117; -- Goblin_Butcher
UPDATE mob_groups SET dropid = 6027 WHERE groupid = 28 AND zoneid = 117; -- Grenade

-- ------------------------------------------------------------
-- Buburimu_Peninsula (Zone 118)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Wake_Warder_Wanda' AND groupid = '22' AND zoneid = '118';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Backoo' AND groupid = '55' AND zoneid = '118';

UPDATE mob_groups SET minLevel = 15, maxLevel = 18 WHERE name = "Sylvestre"       and zoneid = 118;
UPDATE mob_groups SET minLevel = 20, maxLevel = 10 WHERE name = "Snipper"         and zoneid = 118;
UPDATE mob_groups SET minLevel = 20, maxLevel = 23 WHERE name = "Snipper_fished"  and zoneid = 118;
UPDATE mob_groups SET minLevel = 24, maxLevel = 26 WHERE name = "Clipper_fished"  and zoneid = 118;
UPDATE mob_groups SET minLevel = 24, maxLevel = 26 WHERE name = "Shoal_Pugil_fished"  and zoneid = 118;
UPDATE mob_groups SET minLevel = 20, maxLevel = 23 WHERE name = "Zu"  and zoneid = 118;
UPDATE mob_groups SET minLevel = 20, maxLevel = 23 WHERE name = "Bull_Dhalmel"  and zoneid = 118;

UPDATE mob_groups SET maxLevel = 23 WHERE groupid = 8 AND zoneid = 118; -- Zu
UPDATE mob_groups SET dropid = 6029 WHERE groupid = 10 AND zoneid = 118; -- Goblin_Tinkerer
UPDATE mob_groups SET dropid = 6029 WHERE groupid = 11 AND zoneid = 118; -- Goblin_Butcher
UPDATE mob_groups SET dropid = 6027 WHERE groupid = 14 AND zoneid = 118; -- Will-o-the-Wisp
UPDATE mob_groups SET maxLevel = 23 WHERE groupid = 16 AND zoneid = 118; -- Bull_Dhalmel

-- ------------------------------------------------------------
-- Meriphataud_Mountains (Zone 119)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Chonchon' AND groupid = '19' AND zoneid = '119';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Naa_Zeku_the_Unwaiting' AND groupid = '29' AND zoneid = '119';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Patripatan' AND groupid = '37' AND zoneid = '119';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Yilbegan' AND groupid = '64' AND zoneid = '119';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Orcus' AND groupid = '65' AND zoneid = '119';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Farruca_Fly' AND groupid = '66' AND zoneid = '119';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Jyeshtha' AND groupid = '67' AND zoneid = '119';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Rummager_Beetle' AND groupid = '68' AND zoneid = '119';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Raker_Bee' AND groupid = '69' AND zoneid = '119';

UPDATE mob_groups SET minLevel = 20, maxLevel = 23 WHERE name = "Yagudos_Elemental"  and zoneid = 119 and groupid = 23;
UPDATE mob_groups SET minLevel = 22, maxLevel = 25 WHERE name = "Coeurl"  and zoneid = 119;

UPDATE mob_groups SET dropid = 43 WHERE groupid = 2 AND zoneid = 119; -- Jubjub
UPDATE mob_groups SET dropid = 82 WHERE groupid = 4 AND zoneid = 119; -- Night_Bats
UPDATE mob_groups SET dropid = 19 WHERE groupid = 5 AND zoneid = 119; -- Black_Bat
UPDATE mob_groups SET dropid = 6027 WHERE groupid = 6 AND zoneid = 119; -- Will-o-the-Wisp
UPDATE mob_groups SET dropid = 6029 WHERE groupid = 14 AND zoneid = 119; -- Goblin_Tinkerer
UPDATE mob_groups SET dropid = 6029 WHERE groupid = 16 AND zoneid = 119; -- Goblin_Butcher
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 19 AND zoneid = 119; -- Chonchon
UPDATE mob_groups SET dropid = 600 WHERE groupid = 20 AND zoneid = 119; -- Raptor
UPDATE mob_groups SET HP = 950 WHERE groupid = 30 AND zoneid = 119; -- Daggerclaw_Dracos
UPDATE mob_groups SET HP = 1500 WHERE groupid = 37 AND zoneid = 119; -- Patripatan
INSERT INTO mob_groups (groupid, poolid, zoneid, name, respawntime, spawntype, dropid, HP, MP, minLevel, maxLevel, allegiance) VALUES (78, 4459, 119, 'Yagudo_Votary', 0, 128, 2774, 0, 0, 21, 25, 0); -- Yagudo_Votary
INSERT INTO mob_groups (groupid, poolid, zoneid, name, respawntime, spawntype, dropid, HP, MP, minLevel, maxLevel, allegiance) VALUES (79, 4456, 119, 'Yagudo_Theologist', 0, 128, 2770, 0, 0, 21, 25, 0); -- Yagudo_Theologist

-- ------------------------------------------------------------
-- Sauromugue_Champaign (Zone 120)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Bashe' AND groupid = '68' AND zoneid = '120';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Thunderclaw_Thuban' AND groupid = '33' AND zoneid = '120';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Blighting_Brand' AND groupid = '38' AND zoneid = '120';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Yilbegan' AND groupid = '46' AND zoneid = '120';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Verthandi' AND groupid = '47' AND zoneid = '120';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Urd' AND groupid = '48' AND zoneid = '120';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Skuld' AND groupid = '49' AND zoneid = '120';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Aither' AND groupid = '50' AND zoneid = '120';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Deorc' AND groupid = '51' AND zoneid = '120';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Eorthe' AND groupid = '52' AND zoneid = '120';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Puretos' AND groupid = '53' AND zoneid = '120';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Pruina' AND groupid = '54' AND zoneid = '120';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Beorht' AND groupid = '55' AND zoneid = '120';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Thunor' AND groupid = '56' AND zoneid = '120';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Lacus' AND groupid = '57' AND zoneid = '120';

UPDATE mob_groups SET minLevel = 23, maxLevel = 25 WHERE name = "Goblins_Beetle"  and zoneid = 120;
UPDATE mob_groups SET minLevel = 23, maxLevel = 25 WHERE name = "Yagudos_Elemental"  and zoneid = 120;
UPDATE mob_groups SET minLevel = 20, maxLevel = 23 WHERE name = "Midnight_Wings"  and zoneid = 120;
UPDATE mob_groups SET minLevel = 30, maxLevel = 34 WHERE name = "Cutter_fished"  and zoneid = 120;
UPDATE mob_groups SET minLevel = 35, maxLevel = 38 WHERE name = "Kraken_fished"  and zoneid = 120;

UPDATE mob_groups SET dropid = 2771 WHERE groupid = 10 AND zoneid = 120; -- Yagudo_Votary
UPDATE mob_groups SET HP = 4000 WHERE groupid = 34 AND zoneid = 120; -- Deadly_Dodo
UPDATE mob_groups SET HP = 5500 WHERE groupid = 42 AND zoneid = 120; -- Climbpix_Highrise

-- ------------------------------------------------------------
-- The_Sanctuary_of_ZiTah (Zone 121)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Elusive_Edwin' AND groupid = '15' AND zoneid = '121';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Huwasi' AND groupid = '20' AND zoneid = '121';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Bastet' AND groupid = '34' AND zoneid = '121';
UPDATE mob_groups SET content_tag='VOIDWATCH' WHERE name='Grwnan' AND groupid = '58' AND zoneid = '121';

UPDATE mob_groups SET minLevel = 38, maxLevel = 41 WHERE name = "Bigclaw_fished"  and zoneid = 121;
UPDATE mob_groups SET minLevel = 42, maxLevel = 45 WHERE name = "Apsaras"  and zoneid = 121;

UPDATE mob_groups SET HP = 2000 WHERE groupid = 5 AND zoneid = 121; -- Guardian_Treant
UPDATE mob_groups SET dropid = 386 WHERE groupid = 9 AND zoneid = 121; -- Ancient_Bat
UPDATE mob_groups SET spawntype = 3 WHERE groupid = 17 AND zoneid = 121; -- Revenant
UPDATE mob_groups SET HP = 7000 WHERE groupid = 20 AND zoneid = 121; -- Huwasi
UPDATE mob_groups SET HP = 6200 WHERE groupid = 22 AND zoneid = 121; -- Keeper_of_Halidom
UPDATE mob_groups SET spawntype = 3 WHERE groupid = 29 AND zoneid = 121; -- Hell_Hound
UPDATE mob_groups SET spawntype = 3, dropid = 815 WHERE groupid = 32 AND zoneid = 121; -- Rot_Prowler
UPDATE mob_groups SET spawntype = 3 WHERE groupid = 33 AND zoneid = 121; -- Lost_Soul_blm
UPDATE mob_groups SET respawntime = 14400, dropid = 6004, HP = 5000, maxLevel = 63 WHERE groupid = 34 AND zoneid = 121; -- Bastet
UPDATE mob_groups SET HP = 4500 WHERE groupid = 36 AND zoneid = 121; -- Noble_Mold

-- ------------------------------------------------------------
-- RoMaeve (Zone 122)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Rogue_Receptacle' AND groupid = '15' AND zoneid = '122';
UPDATE mob_groups SET content_tag='SYNERGY' WHERE name='Martinet' AND groupid = '12' AND zoneid = '122';
UPDATE mob_groups SET content_tag='SYNERGY' WHERE name='Nargun' AND groupid = '16' AND zoneid = '122';

UPDATE mob_groups SET HP = 0 WHERE groupid = 11 AND zoneid = 122; -- Infernal_Weapon
UPDATE mob_groups SET dropid = 6005 WHERE groupid = 16 AND zoneid = 122; -- Nargun
UPDATE mob_groups SET HP = 9600 WHERE groupid = 17 AND zoneid = 122; -- Eldhrimnir
UPDATE mob_groups SET respawntime = 0, spawntype = 128, HP = 11000 WHERE groupid = 18 AND zoneid = 122; -- Shikigami_Weapon

-- ------------------------------------------------------------
-- Yuhtunga_Jungle (Zone 123)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Koropokkur' AND groupid = '9' AND zoneid = '123';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Pyuu_the_Spatemaker' AND groupid = '25' AND zoneid = '123';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Bayawak' AND groupid = '30' AND zoneid = '123';

UPDATE mob_groups SET minLevel = 30, maxLevel = 33 WHERE name = "Yuhtunga_Mandragora"  and zoneid = 123;
UPDATE mob_groups SET minLevel = 47, maxLevel = 49 WHERE name = "Bloodsucker_fished"  and zoneid = 123;

UPDATE mob_groups SET dropid = 6053 WHERE groupid = 14 AND zoneid = 123; -- Goblin_Poacher
UPDATE mob_groups SET HP = 4500 WHERE groupid = 19 AND zoneid = 123; -- Mischievous_Micholas
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 24 AND zoneid = 123; -- Meww_the_Turtlerider
UPDATE mob_groups SET dropid = 3258, HP = 9000, MP = 10000 WHERE groupid = 25 AND zoneid = 123; -- Pyuu_the_Spatemaker
UPDATE mob_groups SET dropid = 3233, HP = 7000, minLevel = 67, maxLevel = 70 WHERE groupid = 30 AND zoneid = 123; -- Bayawak

INSERT INTO mob_groups (groupid, poolid, zoneid, name, respawntime, spawntype, dropid, HP, MP, minLevel, maxLevel, allegiance) VALUES (59, 833, 123, 'Creek_Sahagin', 0, 128, 532, 0, 0, 34, 38, 0); -- Creek_Sahagin
INSERT INTO mob_groups (groupid, poolid, zoneid, name, respawntime, spawntype, dropid, HP, MP, minLevel, maxLevel, allegiance) VALUES (60, 3788, 123, 'Stream_Sahagin', 0, 128, 2344, 0, 0, 34, 38, 0); -- Stream_Sahagin

-- ------------------------------------------------------------
-- Yhoator_Jungle (Zone 124)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Powderer_Penny' AND groupid = '25' AND zoneid = '124';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Acolnahuacatl' AND groupid = '27' AND zoneid = '124';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Hoar-knuckled_Rimberry' AND groupid = '32' AND zoneid = '124';

UPDATE mob_groups SET minLevel = 36, maxLevel = 38 WHERE name = "Vepar"  and zoneid = 124;
UPDATE mob_groups SET minLevel = 39, maxLevel = 41 WHERE name = "Makara_fished"  and zoneid = 124;

UPDATE mob_groups SET dropid = 1127 WHERE groupid = 8 AND zoneid = 124; -- Goblin_Pathfinder
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 12 AND zoneid = 124; -- Anemone
UPDATE mob_groups SET dropid = 1027 WHERE groupid = 17 AND zoneid = 124; -- Goblin_Trader
UPDATE mob_groups SET HP = 7500 WHERE groupid = 20 AND zoneid = 124; -- Woodland_Sage
UPDATE mob_groups SET dropid = 6053 WHERE groupid = 26 AND zoneid = 124; -- Goblin_Poacher
UPDATE mob_groups SET HP = 7500 WHERE groupid = 41 AND zoneid = 124; -- Kappa_Akuso
UPDATE mob_groups SET HP = 5200 WHERE groupid = 42 AND zoneid = 124; -- Kappa_Bonze
UPDATE mob_groups SET HP = 6300 WHERE groupid = 43 AND zoneid = 124; -- Kappa_Biwa
UPDATE mob_groups SET HP = 7000 WHERE groupid = 62 AND zoneid = 124; -- Edacious_Opo-opo

INSERT INTO mob_groups (groupid, poolid, zoneid, name, respawntime, spawntype, dropid, HP, MP, minLevel, maxLevel, allegiance) VALUES (65, 3958, 124, 'Tonberry_Hexer', 0, 128, 2437, 0, 0, 45, 49, 0); -- Tonberry_Hexer
INSERT INTO mob_groups (groupid, poolid, zoneid, name, respawntime, spawntype, dropid, HP, MP, minLevel, maxLevel, allegiance) VALUES (66, 3956, 124, 'Tonberry_Harasser', 0, 128, 2435, 0, 0, 45, 49, 0); -- Tonberry_Harasser

-- ------------------------------------------------------------
-- Western_Altepa_Desert (Zone 125)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Calchas' AND groupid = '23' AND zoneid = '125';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Dahu' AND groupid = '37' AND zoneid = '125';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Picolaton' AND groupid = '38' AND zoneid = '125';

UPDATE mob_groups SET minLevel = 45, maxLevel = 47 WHERE name = "Bigclaw_fished"  and zoneid = 125;
UPDATE mob_groups SET minLevel = 50, maxLevel = 52 WHERE name = "Razorjaw_Pugil_fished"  and zoneid = 125;

UPDATE mob_groups SET HP = 6000, minLevel = 56, maxLevel = 59 WHERE groupid = 24 AND zoneid = 125; -- Cactuar_Cantautor
UPDATE mob_groups SET dropid = 6050 WHERE groupid = 28 AND zoneid = 125; -- Goblin_Bouncer
UPDATE mob_groups SET dropid = 1093 WHERE groupid = 30 AND zoneid = 125; -- Goblin_Hunter
UPDATE mob_groups SET dropid = 6007, HP = 5800 WHERE groupid = 37 AND zoneid = 125; -- Dahu
UPDATE mob_groups SET HP = 6800 WHERE groupid = 38 AND zoneid = 125; -- Picolaton

-- ------------------------------------------------------------
-- Qufim_Island (Zone 126)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Slippery_Sucker' AND groupid = '23' AND zoneid = '126';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Qoofim' AND groupid = '28' AND zoneid = '126';
UPDATE mob_groups SET content_tag='SYNERGY' WHERE name='Atkorkamuy' AND groupid = '25' AND zoneid = '126';

UPDATE mob_groups SET minLevel = 21, maxLevel = 23 WHERE name = "Gigass_Leech"  and zoneid = 126 and groupid = 15;
UPDATE mob_groups SET minLevel = 28, maxLevel = 30 WHERE name = "Giant_Ranger"  and zoneid = 126;
UPDATE mob_groups SET minLevel = 28, maxLevel = 30 WHERE name = "Giant_Ascetic"  and zoneid = 126;
UPDATE mob_groups SET minLevel = 28, maxLevel = 30 WHERE name = "Giant_Trapper"  and zoneid = 126;
UPDATE mob_groups SET minLevel = 28, maxLevel = 30 WHERE name = "Giant_Hunter"  and zoneid = 126;

UPDATE mob_groups SET dropid = 82 WHERE groupid = 6 AND zoneid = 126; -- Seeker_Bats
UPDATE mob_groups SET dropid = 82 WHERE groupid = 10 AND zoneid = 126; -- Dark_Bats
UPDATE mob_groups SET dropid = 461 WHERE groupid = 11 AND zoneid = 126; -- Glow_Bat
UPDATE mob_groups SET respawntime = 7200, spawntype = 0, dropid = 6008, HP = 10000 WHERE groupid = 25 AND zoneid = 126; -- Atkorkamuy
UPDATE mob_groups SET HP = 2000 WHERE groupid = 27 AND zoneid = 126; -- Trickster_Kinetix
UPDATE mob_groups SET dropid = 461 WHERE groupid = 29 AND zoneid = 126; -- Ancient_Bat
UPDATE mob_groups SET respawntime = 0, spawntype = 128, HP = 2700 WHERE groupid = 47 AND zoneid = 126; -- Dosetsu_Tree

-- ------------------------------------------------------------
-- Behemoths_Dominion (Zone 127)
-- ------------------------------------------------------------
UPDATE mob_groups SET HP = 50000 WHERE groupid = 9 AND zoneid = 127; -- Behemoth
UPDATE mob_groups SET HP = 90000, MP = 100000 WHERE groupid = 10 AND zoneid = 127; -- King_Behemoth
UPDATE mob_groups SET HP = 4000 WHERE groupid = 11 AND zoneid = 127; -- Picklix_Longindex
UPDATE mob_groups SET HP = 4000 WHERE groupid = 12 AND zoneid = 127; -- Moxnix_Nightgoggle
UPDATE mob_groups SET HP = 4000 WHERE groupid = 13 AND zoneid = 127; -- Doglix_Muttsnout

-- ------------------------------------------------------------
-- Valley_of_Sorrows (Zone 128)
-- ------------------------------------------------------------
UPDATE mob_groups SET HP = 10000 WHERE groupid = 6 AND zoneid = 128; -- Adamantoise
UPDATE mob_groups SET HP = 13000 WHERE groupid = 7 AND zoneid = 128; -- Aspidochelone

-- ------------------------------------------------------------
-- RuAun_Gardens (Zone 130)
-- ------------------------------------------------------------
UPDATE mob_groups SET MP = 15000 WHERE groupid = 15 AND zoneid = 130; -- Genbu
UPDATE mob_groups SET MP = 15000 WHERE groupid = 16 AND zoneid = 130; -- Seiryu
UPDATE mob_groups SET HP = 23500, MP = 15000 WHERE groupid = 17 AND zoneid = 130; -- Byakko
UPDATE mob_groups SET HP = 26400, MP = 15000 WHERE groupid = 18 AND zoneid = 130; -- Suzaku

-- ------------------------------------------------------------
-- Abyssea-La_Theine (Zone 132)
-- ------------------------------------------------------------
UPDATE mob_groups SET HP = 0 WHERE groupid = 2 AND zoneid = 132; -- Nahn
UPDATE mob_groups SET HP = 0, minLevel = 85, maxLevel = 85 WHERE groupid = 3 AND zoneid = 132; -- Karkinos
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 4 AND zoneid = 132; -- Veld_Clionid
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 5 AND zoneid = 132; -- Ephemeral_Clionid
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 6 AND zoneid = 132; -- Gigadaphnia
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 7 AND zoneid = 132; -- Ephemeral_Limule
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 8 AND zoneid = 132; -- Plateau_Hare
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 9 AND zoneid = 132; -- Angler_Tiger
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 10 AND zoneid = 132; -- Geier
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 11 AND zoneid = 132; -- Great_Wasp
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 12 AND zoneid = 132; -- Psychopomp
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 13 AND zoneid = 132; -- Bathyal_Gigas
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 14 AND zoneid = 132; -- Hadal_Gigas
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 15 AND zoneid = 132; -- Demersal_Gigas
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 16 AND zoneid = 132; -- Black_Merino
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 17 AND zoneid = 132; -- Luison
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 18 AND zoneid = 132; -- Cankercap
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 19 AND zoneid = 132; -- Pasture_Funguar
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 20 AND zoneid = 132; -- Plateau_Glider
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 21 AND zoneid = 132; -- Farfadet
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 22 AND zoneid = 132; -- Poroggo_Seducteur
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 23 AND zoneid = 132; -- Crapaudy
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 24 AND zoneid = 132; -- Crepuscule_Puk
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 25 AND zoneid = 132; -- Brae_Opo-Opo
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 26 AND zoneid = 132; -- Hammering_Ram
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 27 AND zoneid = 132; -- Irate_Sheep
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 28 AND zoneid = 132; -- Rock_Grinder
UPDATE mob_groups SET respawntime = 0, spawntype = 128, HP = 0 WHERE groupid = 29 AND zoneid = 132; -- Dozing_Dorian
UPDATE mob_groups SET HP = 0 WHERE groupid = 30 AND zoneid = 132; -- Trudging_Thomas
UPDATE mob_groups SET HP = 0 WHERE groupid = 31 AND zoneid = 132; -- Megantereon
UPDATE mob_groups SET HP = 0 WHERE groupid = 32 AND zoneid = 132; -- Adamastor
UPDATE mob_groups SET HP = 0 WHERE groupid = 33 AND zoneid = 132; -- Pantagruel
UPDATE mob_groups SET HP = 0 WHERE groupid = 34 AND zoneid = 132; -- Grandgousier
UPDATE mob_groups SET HP = 0 WHERE groupid = 35 AND zoneid = 132; -- La_Theine_Liege
UPDATE mob_groups SET HP = 0, minLevel = 90, maxLevel = 90 WHERE groupid = 36 AND zoneid = 132; -- Baba_Yaga
UPDATE mob_groups SET HP = 0 WHERE groupid = 37 AND zoneid = 132; -- Nguruvilu
UPDATE mob_groups SET HP = 0 WHERE groupid = 38 AND zoneid = 132; -- Poroggo_Dom_Juan
UPDATE mob_groups SET HP = 0 WHERE groupid = 40 AND zoneid = 132; -- Lugarhoo
UPDATE mob_groups SET HP = 59000 WHERE groupid = 41 AND zoneid = 132; -- Briareus
UPDATE mob_groups SET HP = 0 WHERE groupid = 42 AND zoneid = 132; -- Carabosse
UPDATE mob_groups SET HP = 0 WHERE groupid = 43 AND zoneid = 132; -- Hadhayosh
UPDATE mob_groups SET respawntime = 0, spawntype = 128, HP = 0 WHERE groupid = 44 AND zoneid = 132; -- Mangy-tailed_Marvin
UPDATE mob_groups SET respawntime = 0, spawntype = 128, HP = 0 WHERE groupid = 45 AND zoneid = 132; -- Megamaw_Mikey
UPDATE mob_groups SET respawntime = 0, spawntype = 128, HP = 0 WHERE groupid = 46 AND zoneid = 132; -- Chasmic_Hornet
UPDATE mob_groups SET respawntime = 0, spawntype = 128, HP = 0 WHERE groupid = 47 AND zoneid = 132; -- Piasa
UPDATE mob_groups SET respawntime = 0, spawntype = 128, HP = 0 WHERE groupid = 48 AND zoneid = 132; -- Keesha_Poppo
UPDATE mob_groups SET respawntime = 0, spawntype = 128, HP = 0 WHERE groupid = 49 AND zoneid = 132; -- Irrlicht
UPDATE mob_groups SET respawntime = 0, spawntype = 128, HP = 0 WHERE groupid = 50 AND zoneid = 132; -- Ovni
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 52 AND zoneid = 132; -- Akash
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 53 AND zoneid = 132; -- Gigadaphnia
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 54 AND zoneid = 132; -- Veld_Clionid

-- ------------------------------------------------------------
-- Dynamis-Beaucedine (Zone 134)
-- ------------------------------------------------------------
UPDATE mob_groups SET HP = 17000, MP = 17000 WHERE groupid = 6 AND zoneid = 134; -- Goublefaupe
UPDATE mob_groups SET HP = 17000, MP = 17000 WHERE groupid = 7 AND zoneid = 134; -- Quiebitiel
UPDATE mob_groups SET HP = 17000 WHERE groupid = 8 AND zoneid = 134; -- Mildaunegeux
UPDATE mob_groups SET HP = 17000, MP = 17000 WHERE groupid = 9 AND zoneid = 134; -- Velosareon
UPDATE mob_groups SET HP = 17000 WHERE groupid = 10 AND zoneid = 134; -- Dagourmarche
UPDATE mob_groups SET HP = 4900 WHERE groupid = 19 AND zoneid = 134; -- Vanguard_Vindicator
UPDATE mob_groups SET HP = 3600 WHERE groupid = 20 AND zoneid = 134; -- Vanguard_Protector
UPDATE mob_groups SET HP = 5800 WHERE groupid = 21 AND zoneid = 134; -- Vanguard_Beasttender
UPDATE mob_groups SET HP = 5700 WHERE groupid = 25 AND zoneid = 134; -- Vanguard_Militant
UPDATE mob_groups SET HP = 4600 WHERE groupid = 26 AND zoneid = 134; -- Vanguard_Drakekeeper
UPDATE mob_groups SET HP = 5000 WHERE groupid = 27 AND zoneid = 134; -- Vanguards_Wyvern
UPDATE mob_groups SET HP = 3500 WHERE groupid = 29 AND zoneid = 134; -- Vanguard_Constable
UPDATE mob_groups SET HP = 4800 WHERE groupid = 30 AND zoneid = 134; -- Vanguard_Defender
UPDATE mob_groups SET HP = 4800 WHERE groupid = 31 AND zoneid = 134; -- Vanguard_Hatamoto
UPDATE mob_groups SET HP = 4100 WHERE groupid = 32 AND zoneid = 134; -- Vanguard_Kusa
UPDATE mob_groups SET HP = 3900 WHERE groupid = 34 AND zoneid = 134; -- Vanguard_Mason
UPDATE mob_groups SET HP = 2800 WHERE groupid = 35 AND zoneid = 134; -- Vanguard_Undertaker
UPDATE mob_groups SET HP = 2300 WHERE groupid = 36 AND zoneid = 134; -- Vanguards_Avatar
UPDATE mob_groups SET HP = 4650 WHERE groupid = 38 AND zoneid = 134; -- Vanguard_Vigilante
UPDATE mob_groups SET HP = 3000 WHERE groupid = 42 AND zoneid = 134; -- Vanguard_Thaumaturge
UPDATE mob_groups SET HP = 5500 WHERE groupid = 45 AND zoneid = 134; -- Vanguards_Wyvern
UPDATE mob_groups SET HP = 3750 WHERE groupid = 49 AND zoneid = 134; -- Vanguards_Scorpion
UPDATE mob_groups SET HP = 3000 WHERE groupid = 54 AND zoneid = 134; -- Vanguards_Avatar
UPDATE mob_groups SET HP = 6200 WHERE groupid = 57 AND zoneid = 134; -- Vanguard_Trooper
UPDATE mob_groups SET HP = 6000 WHERE groupid = 58 AND zoneid = 134; -- Vanguard_Neckchopper
UPDATE mob_groups SET HP = 6300 WHERE groupid = 59 AND zoneid = 134; -- Vanguard_Footsoldier
UPDATE mob_groups SET HP = 4900 WHERE groupid = 61 AND zoneid = 134; -- Vanguard_Vexer
UPDATE mob_groups SET HP = 4500 WHERE groupid = 62 AND zoneid = 134; -- Vanguard_Backstabber
UPDATE mob_groups SET HP = 7200 WHERE groupid = 64 AND zoneid = 134; -- Vanguard_Grappler
UPDATE mob_groups SET HP = 6200 WHERE groupid = 66 AND zoneid = 134; -- Vanguard_Gutslasher
UPDATE mob_groups SET HP = 4600 WHERE groupid = 67 AND zoneid = 134; -- Vanguard_Amputator
UPDATE mob_groups SET HP = 6200 WHERE groupid = 69 AND zoneid = 134; -- Vanguard_Impaler
UPDATE mob_groups SET HP = 5200 WHERE groupid = 70 AND zoneid = 134; -- Vanguard_Predator
UPDATE mob_groups SET HP = 4100 WHERE groupid = 72 AND zoneid = 134; -- Vanguard_Dollmaster
UPDATE mob_groups SET HP = 4200 WHERE groupid = 75 AND zoneid = 134; -- Vanguard_Mesmerizer
UPDATE mob_groups SET HP = 6100 WHERE groupid = 76 AND zoneid = 134; -- Vanguard_Hawker
UPDATE mob_groups SET HP = 3500 WHERE groupid = 77 AND zoneid = 134; -- Vanguards_Hecteyes
UPDATE mob_groups SET HP = 5400 WHERE groupid = 78 AND zoneid = 134; -- Vanguard_Pillager
UPDATE mob_groups SET HP = 5200 WHERE groupid = 81 AND zoneid = 134; -- Vanguard_Bugler
UPDATE mob_groups SET HP = 4000 WHERE groupid = 86 AND zoneid = 134; -- Vanguards_Hecteyes
UPDATE mob_groups SET HP = 6700 WHERE groupid = 91 AND zoneid = 134; -- Vanguard_Sentinel
UPDATE mob_groups SET HP = 5000 WHERE groupid = 92 AND zoneid = 134; -- Vanguard_Assassin
UPDATE mob_groups SET HP = 5880 WHERE groupid = 93 AND zoneid = 134; -- Vanguard_Skirmisher
UPDATE mob_groups SET HP = 4500 WHERE groupid = 95 AND zoneid = 134; -- Vanguard_Visionary
UPDATE mob_groups SET HP = 4900 WHERE groupid = 96 AND zoneid = 134; -- Vanguard_Liberator
UPDATE mob_groups SET HP = 5500 WHERE groupid = 98 AND zoneid = 134; -- Vanguard_Exemplar
UPDATE mob_groups SET HP = 5600 WHERE groupid = 99 AND zoneid = 134; -- Vanguard_Ogresoother
UPDATE mob_groups SET HP = 3200 WHERE groupid = 100 AND zoneid = 134; -- Vanguards_Crow
UPDATE mob_groups SET HP = 4400 WHERE groupid = 101 AND zoneid = 134; -- Vanguard_Priest
UPDATE mob_groups SET HP = 5600 WHERE groupid = 103 AND zoneid = 134; -- Vanguard_Inciter
UPDATE mob_groups SET HP = 4800 WHERE groupid = 104 AND zoneid = 134; -- Vanguard_Chanter
UPDATE mob_groups SET HP = 3800 WHERE groupid = 105 AND zoneid = 134; -- Vanguard_Prelate
UPDATE mob_groups SET HP = 5700 WHERE groupid = 108 AND zoneid = 134; -- Vanguard_Partisan
UPDATE mob_groups SET HP = 4800 WHERE groupid = 111 AND zoneid = 134; -- Vanguard_Salvager
UPDATE mob_groups SET HP = 3700 WHERE groupid = 112 AND zoneid = 134; -- Vanguard_Oracle
UPDATE mob_groups SET HP = 3700 WHERE groupid = 117 AND zoneid = 134; -- Vanguards_Crow
UPDATE mob_groups SET HP = 5700 WHERE groupid = 118 AND zoneid = 134; -- Vanguard_Persecutor
UPDATE mob_groups SET HP = 5400 WHERE groupid = 125 AND zoneid = 134; -- Vanguard_Smithy
UPDATE mob_groups SET HP = 6200 WHERE groupid = 126 AND zoneid = 134; -- Vanguard_Pitfighter
UPDATE mob_groups SET HP = 3400 WHERE groupid = 127 AND zoneid = 134; -- Vanguard_Shaman
UPDATE mob_groups SET HP = 5100 WHERE groupid = 129 AND zoneid = 134; -- Vanguard_Pathfinder
UPDATE mob_groups SET HP = 3500 WHERE groupid = 130 AND zoneid = 134; -- Vanguards_Slime
UPDATE mob_groups SET HP = 4500 WHERE groupid = 131 AND zoneid = 134; -- Vanguard_Maestro
UPDATE mob_groups SET HP = 4500 WHERE groupid = 132 AND zoneid = 134; -- Vanguard_Welldigger
UPDATE mob_groups SET HP = 5100 WHERE groupid = 133 AND zoneid = 134; -- Vanguard_Armorer
UPDATE mob_groups SET HP = 4300 WHERE groupid = 134 AND zoneid = 134; -- Vanguard_Ambusher
UPDATE mob_groups SET HP = 3300 WHERE groupid = 135 AND zoneid = 134; -- Vanguard_Necromancer
UPDATE mob_groups SET HP = 5500 WHERE groupid = 137 AND zoneid = 134; -- Vanguard_Ronin
UPDATE mob_groups SET HP = 4600 WHERE groupid = 138 AND zoneid = 134; -- Vanguard_Hitman
UPDATE mob_groups SET HP = 5100 WHERE groupid = 140 AND zoneid = 134; -- Vanguard_Dragontamer
UPDATE mob_groups SET HP = 3900 WHERE groupid = 141 AND zoneid = 134; -- Vanguard_Alchemist
UPDATE mob_groups SET HP = 5100 WHERE groupid = 147 AND zoneid = 134; -- Vanguard_Tinkerer
UPDATE mob_groups SET HP = 3900 WHERE groupid = 152 AND zoneid = 134; -- Vanguards_Slime
UPDATE mob_groups SET HP = 2600 WHERE groupid = 163 AND zoneid = 134; -- Vanguard_Eye

-- ------------------------------------------------------------
-- Castle_Zvahl_Baileys_[S] (Zone 138)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Soulsearer_Demon' AND groupid = '37' AND zoneid = '138';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Woebringer_Demon' AND groupid = '39' AND zoneid = '138';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Foredoomer_Demon' AND groupid = '40' AND zoneid = '138';

UPDATE mob_groups SET dropid = 1349 WHERE groupid = 21 AND zoneid = 138; -- Star_Ruby_Quadav

-- ------------------------------------------------------------
-- Horlais_Peak (Zone 139)
-- ------------------------------------------------------------
UPDATE mob_groups SET HP = 1500, minLevel = 35, maxLevel = 35 WHERE groupid = 14 AND zoneid = 139; -- Pilwiz
UPDATE mob_groups SET HP = 1300, minLevel = 35, maxLevel = 35 WHERE groupid = 15 AND zoneid = 139; -- Bisan
UPDATE mob_groups SET minLevel = 28, maxLevel = 29 WHERE groupid = 17 AND zoneid = 139; -- Houndfly
UPDATE mob_groups SET minLevel = 42, maxLevel = 43 WHERE groupid = 21 AND zoneid = 139; -- Compound_Eyes
UPDATE mob_groups SET HP = 5600, minLevel = 62, maxLevel = 64 WHERE groupid = 23 AND zoneid = 139; -- Armsmaster_Dekbuk
UPDATE mob_groups SET HP = 3600, minLevel = 62, maxLevel = 64 WHERE groupid = 24 AND zoneid = 139; -- Longarmed_Gottditt
UPDATE mob_groups SET HP = 3500, minLevel = 62, maxLevel = 64 WHERE groupid = 25 AND zoneid = 139; -- Keeneyed_Aufwuf
UPDATE mob_groups SET HP = 3500, minLevel = 62, maxLevel = 64 WHERE groupid = 26 AND zoneid = 139; -- Invulnerable_Mazzgozz
UPDATE mob_groups SET HP = 3500, minLevel = 62, maxLevel = 64 WHERE groupid = 27 AND zoneid = 139; -- Undefeatable_Sappdapp
UPDATE mob_groups SET HP = 3500, minLevel = 62, maxLevel = 64 WHERE groupid = 28 AND zoneid = 139; -- Minds-eyed_Klugwug
UPDATE mob_groups SET MP = 20000 WHERE groupid = 29 AND zoneid = 139; -- Chlevnik
UPDATE mob_groups SET minLevel = 56, maxLevel = 57 WHERE groupid = 30 AND zoneid = 139; -- Gerjis
UPDATE mob_groups SET HP = 9500, minLevel = 74 WHERE groupid = 32 AND zoneid = 139; -- Dragonian_Berzerker
UPDATE mob_groups SET HP = 7200, minLevel = 74 WHERE groupid = 33 AND zoneid = 139; -- Dragonian_Minstrel
UPDATE mob_groups SET HP = 14000, minLevel = 80, maxLevel = 80 WHERE groupid = 34 AND zoneid = 139; -- Aries

-- ------------------------------------------------------------
-- Fort_Ghelsba (Zone 140)
-- ------------------------------------------------------------
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 21 AND zoneid = 140; -- Orcish_Barricader
UPDATE mob_groups SET dropid = 1940 WHERE groupid = 22 AND zoneid = 140; -- Orcish_Stonechucker
UPDATE mob_groups SET minLevel = 40, maxLevel = 40 WHERE groupid = 26 AND zoneid = 140; -- Cyranuce_M_Cutauleon
UPDATE mob_groups SET minLevel = 21, maxLevel = 21 WHERE groupid = 27 AND zoneid = 140; -- Colo-colo
UPDATE mob_groups SET HP = 750, minLevel = 19, maxLevel = 19 WHERE groupid = 28 AND zoneid = 140; -- Furies
UPDATE mob_groups SET HP = 1300, minLevel = 33, maxLevel = 35 WHERE groupid = 29 AND zoneid = 140; -- Kalamainu
UPDATE mob_groups SET HP = 1500, minLevel = 33, maxLevel = 35 WHERE groupid = 30 AND zoneid = 140; -- Kilioa
UPDATE mob_groups SET minLevel = 31, maxLevel = 33 WHERE groupid = 31 AND zoneid = 140; -- Toadpillow
UPDATE mob_groups SET minLevel = 31, maxLevel = 33 WHERE groupid = 32 AND zoneid = 140; -- Toadsquab
UPDATE mob_groups SET minLevel = 31, maxLevel = 33 WHERE groupid = 33 AND zoneid = 140; -- Toadbolster
UPDATE mob_groups SET minLevel = 31, maxLevel = 33 WHERE groupid = 34 AND zoneid = 140; -- Toadcushion
UPDATE mob_groups SET minLevel = 32, maxLevel = 32 WHERE groupid = 35 AND zoneid = 140; -- Carrion_Dragon

-- ------------------------------------------------------------
-- Fort_Ghelsba (Zone 141)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Kegpaunch_Doshgnosh' AND groupid = '20' AND zoneid = '141';

UPDATE mob_groups SET minLevel = 21, maxLevel = 21 WHERE name = "Orcish_Cursemaker"  and zoneid = 141;
UPDATE mob_groups SET minLevel = 21, maxLevel = 21 WHERE name = "Orcish_Fighter"  and zoneid = 141;
UPDATE mob_groups SET minLevel = 21, maxLevel = 21 WHERE name = "Orcish_Serjeant"  and zoneid = 141;

UPDATE mob_groups SET dropid = 461 WHERE groupid = 9 AND zoneid = 141; -- Cheiroptera
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 17 AND zoneid = 141; -- Orcish_Panzer
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 20 AND zoneid = 141; -- Kegpaunch_Doshgnosh

-- ------------------------------------------------------------
-- Palborough_Mines (Zone 143)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='QuVho_Deathhurler' AND groupid = '10' AND zoneid = '143';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='BeHya_Hundredwall' AND groupid = '22' AND zoneid = '143';

UPDATE mob_groups SET dropid = 6017 WHERE groupid = 7 AND zoneid = 143; -- Amber_Quadav
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 10 AND zoneid = 143; -- QuVho_Deathhurler
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 24 AND zoneid = 143; -- NoMho_Crimsonarmor

-- ------------------------------------------------------------
-- Waughroon_Shrine (Zone 144)
-- ------------------------------------------------------------
UPDATE mob_groups SET HP = 6000 WHERE groupid = 7 AND zoneid = 144; -- Gaki
UPDATE mob_groups SET HP = 7500 WHERE groupid = 8 AND zoneid = 144; -- Rasetsu
UPDATE mob_groups SET HP = 3000 WHERE groupid = 9 AND zoneid = 144; -- Onki
UPDATE mob_groups SET minLevel = 33, maxLevel = 35 WHERE groupid = 18 AND zoneid = 144; -- Macha
UPDATE mob_groups SET minLevel = 33, maxLevel = 35 WHERE groupid = 20 AND zoneid = 144; -- Metsanneitsyt
UPDATE mob_groups SET HP = 4800, MP = 300, minLevel = 45, maxLevel = 45 WHERE groupid = 24 AND zoneid = 144; -- Queen_Jelly
UPDATE mob_groups SET HP = 600, MP = 300, minLevel = 41, maxLevel = 43 WHERE groupid = 25 AND zoneid = 144; -- Princess_Jelly
UPDATE mob_groups SET minLevel = 55, maxLevel = 55 WHERE groupid = 26 AND zoneid = 144; -- Time_Bomb
UPDATE mob_groups SET minLevel = 56, maxLevel = 57 WHERE groupid = 34 AND zoneid = 144; -- The_Waughroon_Kid
UPDATE mob_groups SET HP = 13000, minLevel = 80, maxLevel = 80 WHERE groupid = 36 AND zoneid = 144; -- Osschaart
UPDATE mob_groups SET minLevel = 73, maxLevel = 73 WHERE groupid = 41 AND zoneid = 144; -- Platoon_Scorpion
UPDATE mob_groups SET minLevel = 77, maxLevel = 78 WHERE groupid = 42 AND zoneid = 144; -- Titanis_Max
UPDATE mob_groups SET minLevel = 77, maxLevel = 78 WHERE groupid = 43 AND zoneid = 144; -- Titanis_Jax
UPDATE mob_groups SET minLevel = 77, maxLevel = 78 WHERE groupid = 44 AND zoneid = 144; -- Titanis_Xax
UPDATE mob_groups SET minLevel = 77, maxLevel = 78 WHERE groupid = 45 AND zoneid = 144; -- Titanis_Dax

-- ------------------------------------------------------------
-- Giddeus (Zone 145)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Quu_Xijo_the_Illusory' AND groupid = '20' AND zoneid = '145';

UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 20 AND zoneid = 145; -- Quu_Xijo_the_Illusory
UPDATE mob_groups SET HP = 3750 WHERE groupid = 27 AND zoneid = 145; -- Vaa_Huja_the_Erudite

-- ------------------------------------------------------------
-- Balgas_Dais (Zone 146)
-- ------------------------------------------------------------
UPDATE mob_groups SET minLevel = 23, maxLevel = 23 WHERE groupid = 13 AND zoneid = 146; -- Prune
UPDATE mob_groups SET minLevel = 23, maxLevel = 23 WHERE groupid = 14 AND zoneid = 146; -- Pepper
UPDATE mob_groups SET minLevel = 23, maxLevel = 23 WHERE groupid = 15 AND zoneid = 146; -- Phoedme
UPDATE mob_groups SET minLevel = 32 WHERE groupid = 16 AND zoneid = 146; -- Bitoso
UPDATE mob_groups SET minLevel = 33, maxLevel = 35 WHERE groupid = 17 AND zoneid = 146; -- Nenaunir
UPDATE mob_groups SET maxLevel = 41 WHERE groupid = 21 AND zoneid = 146; -- Opo-opo_Monarch
UPDATE mob_groups SET maxLevel = 41 WHERE groupid = 22 AND zoneid = 146; -- Opo-opo_Heir
UPDATE mob_groups SET minLevel = 38, maxLevel = 39 WHERE groupid = 23 AND zoneid = 146; -- Myrmidon_Spo-spo
UPDATE mob_groups SET minLevel = 38, maxLevel = 39 WHERE groupid = 24 AND zoneid = 146; -- Myrmidon_Apu-apu
UPDATE mob_groups SET minLevel = 38, maxLevel = 39 WHERE groupid = 25 AND zoneid = 146; -- Myrmidon_Epa-epa
UPDATE mob_groups SET HP = 5500, minLevel = 62, maxLevel = 64 WHERE groupid = 29 AND zoneid = 146; -- Voo_Tolu_the_Ghostfist
UPDATE mob_groups SET HP = 4500, minLevel = 62, maxLevel = 64 WHERE groupid = 30 AND zoneid = 146; -- Cuu_Doko_the_Blizzard
UPDATE mob_groups SET HP = 5000, minLevel = 62, maxLevel = 64 WHERE groupid = 31 AND zoneid = 146; -- Zuu_Xowu_the_Darksmoke
UPDATE mob_groups SET HP = 5000, minLevel = 62, maxLevel = 64 WHERE groupid = 32 AND zoneid = 146; -- Gii_Jaha_the_Raucous
UPDATE mob_groups SET HP = 5500, minLevel = 62, maxLevel = 64 WHERE groupid = 33 AND zoneid = 146; -- Aa_Nawu_the_Thunderblade
UPDATE mob_groups SET HP = 4500, minLevel = 62, maxLevel = 64 WHERE groupid = 34 AND zoneid = 146; -- Yoo_Mihi_the_Haze
UPDATE mob_groups SET minLevel = 85, maxLevel = 85 WHERE groupid = 35 AND zoneid = 146; -- Wyrm
UPDATE mob_groups SET minLevel = 55, maxLevel = 55 WHERE groupid = 36 AND zoneid = 146; -- Dromiceiomimus
UPDATE mob_groups SET MP = 5000, minLevel = 65, maxLevel = 67 WHERE groupid = 37 AND zoneid = 146; -- Macan_Gadangan
UPDATE mob_groups SET HP = 11500, maxLevel = 76 WHERE groupid = 38 AND zoneid = 146; -- Gilagoge_Tlugvi
UPDATE mob_groups SET HP = 9000, maxLevel = 76 WHERE groupid = 39 AND zoneid = 146; -- Goga_Tlugvi
UPDATE mob_groups SET HP = 7500, maxLevel = 76 WHERE groupid = 40 AND zoneid = 146; -- Ulagohvsdi_Tlugvi
UPDATE mob_groups SET HP = 8500, maxLevel = 76 WHERE groupid = 41 AND zoneid = 146; -- Gola_Tlugvi
UPDATE mob_groups SET HP = 9000, MP = 3000, minLevel = 79, maxLevel = 79 WHERE groupid = 42 AND zoneid = 146; -- King_of_Cups
UPDATE mob_groups SET HP = 9000, MP = 3000, minLevel = 79, maxLevel = 79 WHERE groupid = 43 AND zoneid = 146; -- King_of_Batons
UPDATE mob_groups SET HP = 9000, MP = 3000, minLevel = 79, maxLevel = 79 WHERE groupid = 44 AND zoneid = 146; -- King_of_Swords
UPDATE mob_groups SET HP = 9000, MP = 3000, minLevel = 79, maxLevel = 79 WHERE groupid = 45 AND zoneid = 146; -- King_of_Coins
UPDATE mob_groups SET HP = 5000, MP = 3000 WHERE groupid = 46 AND zoneid = 146; -- Queen_of_Cups
UPDATE mob_groups SET HP = 5000, MP = 3000 WHERE groupid = 47 AND zoneid = 146; -- Queen_of_Batons
UPDATE mob_groups SET minLevel = 78, maxLevel = 79 WHERE groupid = 48 AND zoneid = 146; -- Giant_Moa

-- ------------------------------------------------------------
-- Beadeaux (Zone 147)
-- ------------------------------------------------------------
UPDATE mob_groups SET poolid = 20013 WHERE groupid = 3 AND zoneid = 147; -- Land_Pugil
UPDATE mob_groups SET HP = 1100 WHERE groupid = 5 AND zoneid = 147; -- BiGho_Headtaker
UPDATE mob_groups SET HP = 1300 WHERE groupid = 13 AND zoneid = 147; -- GeDha_Evileye
UPDATE mob_groups SET HP = 1300 WHERE groupid = 17 AND zoneid = 147; -- GoBhu_Gascon
UPDATE mob_groups SET dropid = 6030 WHERE groupid = 20 AND zoneid = 147; -- Iron_Quadav
UPDATE mob_groups SET dropid = 6031 WHERE groupid = 27 AND zoneid = 147; -- Steel_Quadav
UPDATE mob_groups SET HP = 1500, maxLevel = 44 WHERE groupid = 38 AND zoneid = 147; -- Magnes_Quadav
UPDATE mob_groups SET HP = 2200, maxLevel = 44 WHERE groupid = 39 AND zoneid = 147; -- Nickel_Quadav

-- ------------------------------------------------------------
-- Qulun_Dome (Zone 148)
-- ------------------------------------------------------------
UPDATE mob_groups SET dropid = 6033 WHERE groupid = 2 AND zoneid = 148; -- Darksteel_Quadav
UPDATE mob_groups SET minLevel = 71, maxLevel = 73 WHERE groupid = 5 AND zoneid = 148; -- Ruby_Quadav

-- ------------------------------------------------------------
-- Davoi (Zone 149)
-- ------------------------------------------------------------
UPDATE mob_groups SET dropid = 6034 WHERE groupid = 39 AND zoneid = 149; -- Davoi_Mush
UPDATE mob_groups SET HP = 6800 WHERE groupid = 43 AND zoneid = 149; -- Gavotvut
UPDATE mob_groups SET HP = 4000 WHERE groupid = 44 AND zoneid = 149; -- Barakbok
UPDATE mob_groups SET HP = 10500 WHERE groupid = 45 AND zoneid = 149; -- Bilopdop
UPDATE mob_groups SET HP = 6000 WHERE groupid = 46 AND zoneid = 149; -- Deloknok
UPDATE mob_groups SET HP = 7800 WHERE groupid = 47 AND zoneid = 149; -- Purpleflash_Brukdok
UPDATE mob_groups SET HP = 7500 WHERE groupid = 48 AND zoneid = 149; -- One-eyed_Gwajboj
UPDATE mob_groups SET HP = 6000 WHERE groupid = 49 AND zoneid = 149; -- Three-eyed_Prozpuz

-- ------------------------------------------------------------
-- Monastic_Cavern (Zone 150)
-- ------------------------------------------------------------
UPDATE mob_groups SET dropid = 1875 WHERE groupid = 1 AND zoneid = 150; -- Orcish_Bowshooter
UPDATE mob_groups SET dropid = 1911 WHERE groupid = 3 AND zoneid = 150; -- Orcish_Gladiator
UPDATE mob_groups SET dropid = 1944 WHERE groupid = 4 AND zoneid = 150; -- Orcish_Trooper
UPDATE mob_groups SET dropid = 1945 WHERE groupid = 5 AND zoneid = 150; -- Orcish_Veteran
UPDATE mob_groups SET dropid = 1954 WHERE groupid = 7 AND zoneid = 150; -- Orcish_Zerker
UPDATE mob_groups SET HP = 7000 WHERE groupid = 16 AND zoneid = 150; -- Orcish_Overlord
UPDATE mob_groups SET HP = 60000 WHERE groupid = 17 AND zoneid = 150; -- Overlord_Bakgodek
UPDATE mob_groups SET HP = 4000 WHERE groupid = 18 AND zoneid = 150; -- Bugaboo

-- ------------------------------------------------------------
-- Castle_Oztroja (Zone 151)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Saa_Doyi_the_Fervid' AND groupid = '5' AND zoneid = '151';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Lii_Jixa_the_Somnolist' AND groupid = '21' AND zoneid = '151';

UPDATE mob_groups SET minLevel = 23, maxLevel = 27 WHERE name = "Yagudo_Theologist"  and zoneid = 151;
UPDATE mob_groups SET minLevel = 22, maxLevel = 28 WHERE name = "Yagudo_Priest"  and zoneid = 151;
UPDATE mob_groups SET minLevel = 44, maxLevel = 48 WHERE name = "Yagudo_Lutenist"  and zoneid = 151;
UPDATE mob_groups SET minLevel = 52, maxLevel = 56 WHERE name = "Yagudo_Sentinel"  and zoneid = 151;
UPDATE mob_groups SET minLevel = 55, maxLevel = 59 WHERE name = "Yagudo_Abbot"  and zoneid = 151;
UPDATE mob_groups SET minLevel = 70, maxLevel = 72 WHERE name = "Yagudo_Flagellant"  and zoneid = 151 and groupid = 44;
UPDATE mob_groups SET minLevel = 70, maxLevel = 72 WHERE name = "Yagudo_Prelate"  and zoneid = 151 and groupid = 45;
UPDATE mob_groups SET minLevel = 70, maxLevel = 72 WHERE name = "Yagudo_Conductor"  and zoneid = 151 and groupid = 46;

UPDATE mob_groups SET HP = 2300 WHERE groupid = 5 AND zoneid = 151; -- Saa_Doyi_the_Fervid
UPDATE mob_groups SET HP = 4500 WHERE groupid = 21 AND zoneid = 151; -- Lii_Jixa_the_Somnolist
UPDATE mob_groups SET HP = 3100 WHERE groupid = 28 AND zoneid = 151; -- Yaa_Haqa_the_Profane
UPDATE mob_groups SET HP = 50000 WHERE groupid = 39 AND zoneid = 151; -- Tzee_Xicu_the_Manifest
UPDATE mob_groups SET HP = 2500 WHERE groupid = 41 AND zoneid = 151; -- Odontotyrannus

-- ------------------------------------------------------------
-- The_Boyahda_Tree (Zone 153)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Mourning_Crawler' AND groupid = '25' AND zoneid = '153';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Snaggletooth_Peapuk' AND groupid = '26' AND zoneid = '153';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Viseclaw' AND groupid = '27' AND zoneid = '153';

UPDATE mob_groups SET minLevel = 75, maxLevel = 78 WHERE name = "Bark_Tarantula"  and zoneid = 153;

UPDATE mob_groups SET HP = 4000 WHERE groupid = 7 AND zoneid = 153; -- Ellyllon
UPDATE mob_groups SET dropid = 399 WHERE groupid = 11 AND zoneid = 153; -- Old_Goobbue
UPDATE mob_groups SET HP = 5800 WHERE groupid = 14 AND zoneid = 153; -- Aquarius
UPDATE mob_groups SET dropid = 6047 WHERE groupid = 19 AND zoneid = 153; -- Korrigan
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 28 AND zoneid = 153; -- Ancient_Goobbue
UPDATE mob_groups SET dropid = 462 WHERE groupid = 29 AND zoneid = 153; -- Boyahda_Sapling

-- ------------------------------------------------------------
-- Dragons_Aery (Zone 154)
-- ------------------------------------------------------------
UPDATE mob_groups SET minLevel = 76, maxLevel = 79 WHERE name = "Demonic_Rose"  and zoneid = 151;

-- ------------------------------------------------------------
-- Castle_Zvahl_Keep_[S] (Zone 155)
-- ------------------------------------------------------------
UPDATE mob_groups SET dropid = 1665 WHERE groupid = 13 AND zoneid = 155; -- Meteor_Quadav

-- ------------------------------------------------------------
-- Middle_Delkfutts_Tower (Zone 157)
-- ------------------------------------------------------------
UPDATE mob_groups SET dropid = 19 WHERE groupid = 2 AND zoneid = 157; -- Stirge
UPDATE mob_groups SET dropid = 964 WHERE groupid = 9 AND zoneid = 157; -- Giant_Guard
UPDATE mob_groups SET dropid = 964 WHERE groupid = 10 AND zoneid = 157; -- Giant_Sentry
UPDATE mob_groups SET dropid = 968 WHERE groupid = 12 AND zoneid = 157; -- Giant_Lobber
UPDATE mob_groups SET HP = 1750 WHERE groupid = 13 AND zoneid = 157; -- Eurytos
UPDATE mob_groups SET HP = 2500 WHERE groupid = 19 AND zoneid = 157; -- Rhoitos
UPDATE mob_groups SET dropid = 6048 WHERE groupid = 20 AND zoneid = 157; -- Thunder_Elemental
UPDATE mob_groups SET dropid = 6049 WHERE groupid = 21 AND zoneid = 157; -- Light_Elemental
UPDATE mob_groups SET dropid = 1221 WHERE groupid = 23 AND zoneid = 157; -- Big_Bat
UPDATE mob_groups SET HP = 2100 WHERE groupid = 30 AND zoneid = 157; -- Ophion
UPDATE mob_groups SET HP = 6000 WHERE groupid = 34 AND zoneid = 157; -- Gerwitzs_Scythe
UPDATE mob_groups SET HP = 2500 WHERE groupid = 35 AND zoneid = 157; -- Scythe_Victim_war
UPDATE mob_groups SET HP = 2500 WHERE groupid = 36 AND zoneid = 157; -- Scythe_Victim_blm

-- ------------------------------------------------------------
-- Upper_Delkfutts_Tower (Zone 158)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Autarch' AND groupid = '25' AND zoneid = '158';

UPDATE mob_groups SET dropid = 6048 WHERE groupid = 7 AND zoneid = 158; -- Thunder_Elemental
UPDATE mob_groups SET dropid = 6049 WHERE groupid = 8 AND zoneid = 158; -- Light_Elemental
UPDATE mob_groups SET dropid = 415 WHERE groupid = 12 AND zoneid = 158; -- Demonic_Doll
UPDATE mob_groups SET dropid = 918 WHERE groupid = 16 AND zoneid = 158; -- Dire_Bat
UPDATE mob_groups SET dropid = 918 WHERE groupid = 23 AND zoneid = 158; -- Incubus_Bats

-- ------------------------------------------------------------
-- Temple_of_Uggalepih (Zone 159)
-- ------------------------------------------------------------
UPDATE mob_groups SET minLevel = 61, maxLevel = 67 WHERE name = "Tonberry_Dismayer"  and zoneid = 159;
UPDATE mob_groups SET minLevel = 61, maxLevel = 67 WHERE name = "Tonberry_Maledictor"  and zoneid = 159;
UPDATE mob_groups SET minLevel = 61, maxLevel = 67 WHERE name = "Tonberry_Pursuer"  and zoneid = 159;
UPDATE mob_groups SET minLevel = 61, maxLevel = 67 WHERE name = "Tonberry_Stabber"  and zoneid = 159;

UPDATE mob_groups SET HP = 19500 WHERE groupid = 5 AND zoneid = 159; -- Trompe_LOeil
UPDATE mob_groups SET dropid = 6061 WHERE groupid = 12 AND zoneid = 159; -- Temple_Guardian
UPDATE mob_groups SET HP = 6700 WHERE groupid = 21 AND zoneid = 159; -- Sozu_Sarberry
UPDATE mob_groups SET respawntime = 720 WHERE groupid = 26 AND zoneid = 159; -- Manipulator
UPDATE mob_groups SET HP = 3500 WHERE groupid = 31 AND zoneid = 159; -- Tonberry_Kinq
UPDATE mob_groups SET HP = 7000 WHERE groupid = 35 AND zoneid = 159; -- Flauros
UPDATE mob_groups SET HP = 7000 WHERE groupid = 36 AND zoneid = 159; -- Sozu_Rogberry
UPDATE mob_groups SET dropid = 6062 WHERE groupid = 38 AND zoneid = 159; -- Water_Elemental

-- ------------------------------------------------------------
-- Den_of_Rancor (Zone 160)
-- ------------------------------------------------------------
UPDATE mob_groups SET minLevel = 53, maxLevel = 55 WHERE name = "Tonberrys_Elemental"  and zoneid = 160;
UPDATE mob_groups SET minLevel = 62, maxLevel = 72 WHERE name = "Tonberry_Imprecator"  and zoneid = 160;
UPDATE mob_groups SET minLevel = 62, maxLevel = 72 WHERE name = "Tonberry_Trailer"  and zoneid = 160;
UPDATE mob_groups SET minLevel = 66, maxLevel = 72 WHERE name = "Tonberry_Beleaguerer"  and zoneid = 160;
UPDATE mob_groups SET minLevel = 75, maxLevel = 78 WHERE name = "Doom_Toad"  and zoneid = 160;
UPDATE mob_groups SET minLevel = 75, maxLevel = 78 WHERE name = "Tormentor"  and zoneid = 160;
UPDATE mob_groups SET minLevel = 64, maxLevel = 67 WHERE name = "Mousse"  and zoneid = 160;
UPDATE mob_groups SET minLevel = 63, maxLevel = 70 WHERE name = "Mousse_fished"  and zoneid = 160;
UPDATE mob_groups SET minLevel = 65, maxLevel = 68 WHERE name = "Succubus_Bats"  and zoneid = 160;

UPDATE mob_groups SET dropid = 1226 WHERE groupid = 8 AND zoneid = 160; -- Dire_Bat
UPDATE mob_groups SET dropid = 6058 WHERE groupid = 9 AND zoneid = 160; -- Fire_Elemental
UPDATE mob_groups SET respawntime = 0, spawntype = 32, HP = 6800 WHERE groupid = 11 AND zoneid = 160; -- Sozu_Bliberry
UPDATE mob_groups SET HP = 7200 WHERE groupid = 12 AND zoneid = 160; -- Celeste-eyed_Tozberry
UPDATE mob_groups SET HP = 8650 WHERE groupid = 17 AND zoneid = 160; -- Friar_Rush
UPDATE mob_groups SET HP = 18000 WHERE groupid = 19 AND zoneid = 160; -- Carmine-tailed_Janberry
UPDATE mob_groups SET HP = 7200 WHERE groupid = 25 AND zoneid = 160; -- Bistre-hearted_Malberry
UPDATE mob_groups SET dropid = 6059 WHERE groupid = 26 AND zoneid = 160; -- Water_Elemental
UPDATE mob_groups SET MP = 50000 WHERE groupid = 36 AND zoneid = 160; -- Hakutaku

-- ------------------------------------------------------------
-- Castle_Zvahl_Baileys (Zone 161)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Likho' AND groupid = '7' AND zoneid = '161';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Marquis_Naberius' AND groupid = '36' AND zoneid = '161';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Marquis_Sabnock' AND groupid = '37' AND zoneid = '161';

UPDATE mob_groups SET minLevel = 48, maxLevel = 50 WHERE name = "Demons_Elemental"  and zoneid = 161 and groupid = 18;
UPDATE mob_groups SET minLevel = 59, maxLevel = 61 WHERE name = "Demons_Elemental"  and zoneid = 161 and groupid = 54;

UPDATE mob_groups SET dropid = 1876 WHERE groupid = 11 AND zoneid = 161; -- Goblin_Robber
UPDATE mob_groups SET dropid = 6031 WHERE groupid = 19 AND zoneid = 161; -- Elder_Quadav
UPDATE mob_groups SET dropid = 6031 WHERE groupid = 20 AND zoneid = 161; -- Iron_Quadav
UPDATE mob_groups SET dropid = 6063 WHERE groupid = 21 AND zoneid = 161; -- Spinel_Quadav
UPDATE mob_groups SET HP = 4000 WHERE groupid = 44 AND zoneid = 161; -- Marquis_Amon
UPDATE mob_groups SET HP = 4000, minLevel = 52, maxLevel = 52 WHERE groupid = 50 AND zoneid = 161; -- Marquis_Andrealphus
UPDATE mob_groups SET HP = 1000, minLevel = 48, maxLevel = 49 WHERE groupid = 51 AND zoneid = 161; -- Demon_Banneret
UPDATE mob_groups SET HP = 1000, minLevel = 48, maxLevel = 49 WHERE groupid = 52 AND zoneid = 161; -- Demon_Secretary

-- ------------------------------------------------------------
-- Castle_Zvahl_Keep (Zone 162)
-- ------------------------------------------------------------
UPDATE mob_groups SET minLevel = 45, maxLevel = 47 WHERE name = "Demons_Elemental"  and zoneid = 162;

UPDATE mob_groups SET dropid = 1876 WHERE groupid = 10 AND zoneid = 162; -- Goblin_Robber
UPDATE mob_groups SET dropid = 6052 WHERE groupid = 11 AND zoneid = 162; -- Goblin_Reaper
UPDATE mob_groups SET dropid = 6066 WHERE groupid = 13 AND zoneid = 162; -- Goblin_Bouncer
UPDATE mob_groups SET dropid = 6065 WHERE groupid = 20 AND zoneid = 162; -- Orcish_Predator
UPDATE mob_groups SET dropid = 1955 WHERE groupid = 21 AND zoneid = 162; -- Orcish_Zerker
UPDATE mob_groups SET dropid = 6067 WHERE groupid = 22 AND zoneid = 162; -- Orcish_Warchief
UPDATE mob_groups SET dropid = 6031 WHERE groupid = 24 AND zoneid = 162; -- Iron_Quadav
UPDATE mob_groups SET dropid = 6063 WHERE groupid = 25 AND zoneid = 162; -- Spinel_Quadav
UPDATE mob_groups SET dropid = 6067 WHERE groupid = 27 AND zoneid = 162; -- Steel_Quadav
UPDATE mob_groups SET dropid = 6064 WHERE groupid = 29 AND zoneid = 162; -- Gold_Quadav
UPDATE mob_groups SET dropid = 2755 WHERE groupid = 34 AND zoneid = 162; -- Yagudo_Prior
UPDATE mob_groups SET HP = 7500 WHERE groupid = 41 AND zoneid = 162; -- Count_Bifrons
UPDATE mob_groups SET HP = 6600 WHERE groupid = 42 AND zoneid = 162; -- Viscount_Morax

-- ------------------------------------------------------------
-- Sacrificial_Chamber (Zone 163)
-- ------------------------------------------------------------
UPDATE mob_groups SET minLevel = 63 WHERE groupid = 6 AND zoneid = 163; -- Sable-tongued_Gonberry
UPDATE mob_groups SET minLevel = 63 WHERE groupid = 7 AND zoneid = 163; -- Virid-faced_Shanberry
UPDATE mob_groups SET minLevel = 63 WHERE groupid = 8 AND zoneid = 163; -- Cyaneous-toed_Yallberry
UPDATE mob_groups SET minLevel = 63 WHERE groupid = 9 AND zoneid = 163; -- Vermilion-eared_Noberry
UPDATE mob_groups SET minLevel = 63, maxLevel = 65 WHERE groupid = 10 AND zoneid = 163; -- Qull_the_Fallstopper
UPDATE mob_groups SET minLevel = 63, maxLevel = 65 WHERE groupid = 11 AND zoneid = 163; -- Rauu_the_Whaleswooner
UPDATE mob_groups SET minLevel = 63, maxLevel = 65 WHERE groupid = 12 AND zoneid = 163; -- Hyohh_the_Conchblower
UPDATE mob_groups SET minLevel = 63, maxLevel = 65 WHERE groupid = 13 AND zoneid = 163; -- Pevv_the_Riverleaper

-- ------------------------------------------------------------
-- Throne_Room (Zone 165)
-- ------------------------------------------------------------
UPDATE mob_groups SET MP = 10000 WHERE groupid = 1 AND zoneid = 165; -- Shadow_Lord_1
UPDATE mob_groups SET MP = 4000 WHERE groupid = 2 AND zoneid = 165; -- Shadow_Lord_2
UPDATE mob_groups SET HP = 7750, MP = 3000 WHERE groupid = 3 AND zoneid = 165; -- Zeid
UPDATE mob_groups SET HP = 7750, MP = 3000 WHERE groupid = 4 AND zoneid = 165; -- Zeid
UPDATE mob_groups SET HP = 500 WHERE groupid = 5 AND zoneid = 165; -- Shadow_of_Rage
UPDATE mob_groups SET minLevel = 63, maxLevel = 65 WHERE groupid = 6 AND zoneid = 165; -- Grand_Marquis_Chomiel
UPDATE mob_groups SET minLevel = 63, maxLevel = 65 WHERE groupid = 7 AND zoneid = 165; -- Duke_Amduscias
UPDATE mob_groups SET minLevel = 63, maxLevel = 65 WHERE groupid = 8 AND zoneid = 165; -- Count_Andromalius
UPDATE mob_groups SET minLevel = 63, maxLevel = 65 WHERE groupid = 9 AND zoneid = 165; -- Duke_Dantalian

-- ------------------------------------------------------------
-- Ranguemont_Pass (Zone 166)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Hovering_Oculus' AND groupid = '20' AND zoneid = '166';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Bilesucker' AND groupid = '21' AND zoneid = '166';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Goblin_Hoodoo' AND groupid = '22' AND zoneid = '166';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Goblin_Artificer' AND groupid = '23' AND zoneid = '166';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Goblin_Tanner' AND groupid = '24' AND zoneid = '166';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Goblin_Chaser' AND groupid = '25' AND zoneid = '166';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Goblins_Bats' AND groupid = '26' AND zoneid = '166';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Gloom_Eye' AND groupid = '13' AND zoneid = '166';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Mucoid_Mass' AND groupid = '19' AND zoneid = '166';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Hyakume' AND groupid = '31' AND zoneid = '166';

UPDATE mob_groups SET minLevel = 25, maxLevel = 27 WHERE name = "Goblins_Bats"  and zoneid = 166;
INSERT INTO `mob_groups` (`groupid`, `poolid`, `zoneid`, `name`, `respawntime`, `spawntype`, `dropid`, `HP`, `MP`, `minLevel`, `maxLevel`, `allegiance`) VALUES
(41,1665,166,'Goblin_Furrier',960,0,1071,0,0,32,36,0),      -- These are in prep for complete zone revamps
(42,1694,166,'Goblin_Pathfinder',960,0,1131,0,0,32,36,0),   -- These are in prep for complete zone revamps
(43,1710,166,'Goblin_Shaman',960,0,1152,0,0,32,36,0),       -- These are in prep for complete zone revamps
(44,1715,166,'Goblin_Smithy',960,0,1163,0,0,32,36,0),       -- These are in prep for complete zone revamps
(45,6606,166,'Floating_Eye',960,0,850,0,0,34,36,0);         -- These are in prep for complete zone revamps

UPDATE mob_groups SET HP = 9000 WHERE groupid = 15 AND zoneid = 166; -- Taisaijin
UPDATE mob_groups SET HP = 3500 WHERE groupid = 19 AND zoneid = 166; -- Mucoid_Mass
UPDATE mob_groups SET HP = 3200 WHERE groupid = 28 AND zoneid = 166; -- Tros
UPDATE mob_groups SET dropid = 6009, HP = 3000, minLevel = 45, maxLevel = 48 WHERE groupid = 31 AND zoneid = 166; -- Hyakume

-- ------------------------------------------------------------
-- Bostaunieux_Oubliette (Zone 167)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Blind_Bat' AND groupid = '15' AND zoneid = '167';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Panna_Cotta' AND groupid = '16' AND zoneid = '167';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Nachtmahr' AND groupid = '17' AND zoneid = '167';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Dabilla' AND groupid = '18' AND zoneid = '167';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Wurdalak' AND groupid = '19' AND zoneid = '167';

UPDATE mob_groups SET minLevel = 52, maxLevel = 58 WHERE name = "Bloodsucker_fished"  and zoneid = 167;

UPDATE mob_groups SET HP = 11500 WHERE groupid = 11 AND zoneid = 167; -- Sewer_Syrup

-- ------------------------------------------------------------
-- Chamber_of_Oracles (Zone 168)
-- ------------------------------------------------------------
UPDATE mob_groups SET dropid = 0, HP = 8000 WHERE groupid = 1 AND zoneid = 168; -- Centurio_V-III
UPDATE mob_groups SET minLevel = 63, maxLevel = 65 WHERE groupid = 8 AND zoneid = 168; -- Secutor_XI-XXXII
UPDATE mob_groups SET minLevel = 63, maxLevel = 65 WHERE groupid = 9 AND zoneid = 168; -- Retiarius_XI-XIX
UPDATE mob_groups SET minLevel = 63, maxLevel = 65 WHERE groupid = 10 AND zoneid = 168; -- Hoplomachus_XI-XXVI
UPDATE mob_groups SET minLevel = 63, maxLevel = 65 WHERE groupid = 11 AND zoneid = 168; -- Centurio_XI-I
UPDATE mob_groups SET minLevel = 78, maxLevel = 79 WHERE groupid = 12 AND zoneid = 168; -- Sabotender_Campeon
UPDATE mob_groups SET minLevel = 78, maxLevel = 79 WHERE groupid = 13 AND zoneid = 168; -- Sabotender_Amante
UPDATE mob_groups SET HP = 6200 WHERE groupid = 14 AND zoneid = 168; -- Radiant_Wyvern
UPDATE mob_groups SET HP = 6200 WHERE groupid = 15 AND zoneid = 168; -- Blizzard_Wyvern
UPDATE mob_groups SET HP = 6200 WHERE groupid = 16 AND zoneid = 168; -- Lightning_Wyvern
UPDATE mob_groups SET HP = 6200, minLevel = 76, maxLevel = 77 WHERE groupid = 17 AND zoneid = 168; -- Chaos_Wyvern
UPDATE mob_groups SET HP = 20000, minLevel = 80, maxLevel = 80 WHERE groupid = 18 AND zoneid = 168; -- Purson

-- ------------------------------------------------------------
-- Toraimarai_Canal (Zone 169)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Brazen_Bones' AND groupid = '40' AND zoneid = '169';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Blackwater_Pugil' AND groupid = '24' AND zoneid = '169';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Plunderer_Crab' AND groupid = '25' AND zoneid = '169';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Deviling_Bats' AND groupid = '28' AND zoneid = '169';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Sodden_Bones' AND groupid = '29' AND zoneid = '169';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Drowned_Bones' AND groupid = '30' AND zoneid = '169';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Starborer' AND groupid = '31' AND zoneid = '169';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Rapier_Scorpion' AND groupid = '32' AND zoneid = '169';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Poroggo_Excavator' AND groupid = '35' AND zoneid = '169';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Flume_Toad' AND groupid = '36' AND zoneid = '169';
UPDATE mob_groups SET content_tag='SYNERGY' WHERE name='Canal_Moocher' AND groupid = '21' AND zoneid = '169';
UPDATE mob_groups SET content_tag='SYNERGY' WHERE name='Konjac' AND groupid = '27' AND zoneid = '169';

INSERT INTO `mob_groups` (`groupid`, `poolid`, `zoneid`, `name`, `respawntime`, `spawntype`, `dropid`, `HP`, `MP`, `minLevel`, `maxLevel`, `allegiance`) VALUES (50,871,169,'Cutlass_Scorpion',960,0,551,0,0,64,66,0); -- These are in prep for complete zone revamps
INSERT INTO `mob_groups` (`groupid`, `poolid`, `zoneid`, `name`, `respawntime`, `spawntype`, `dropid`, `HP`, `MP`, `minLevel`, `maxLevel`, `allegiance`) VALUES (51,3803,169,'Canal_Pugil',960,0,2033,0,0,57,59,0); -- These are in prep for complete zone revamps
UPDATE mob_groups SET minLevel = 45, maxLevel = 47 WHERE name = "Bigclaw_fished"  and zoneid = 169;
UPDATE mob_groups SET minLevel = 59, maxLevel = 61 WHERE name = "Bloodsucker_fished"  and zoneid = 169;
UPDATE mob_groups SET minLevel = 65, maxLevel = 67 WHERE name = "Mousse_fished"  and zoneid = 169;

UPDATE mob_groups SET dropid = 6020 WHERE groupid = 7 AND zoneid = 169; -- Hell_Bat
UPDATE mob_groups SET dropid = 6021 WHERE groupid = 12 AND zoneid = 169; -- Bloodsucker
UPDATE mob_groups SET HP = 3000 WHERE groupid = 14 AND zoneid = 169; -- Magic_Sludge

-- ------------------------------------------------------------
-- Full_Moon_Fountain (Zone 170)
-- ------------------------------------------------------------
UPDATE mob_groups SET HP = 14600 WHERE groupid = 1 AND zoneid = 170; -- Fenrir_Prime
UPDATE mob_groups SET dropid = 0, HP = 20000, maxLevel = 80 WHERE groupid = 8 AND zoneid = 170; -- Carbuncle_Prime
UPDATE mob_groups SET HP = 5000, maxLevel = 80 WHERE groupid = 9 AND zoneid = 170; -- Ifrit_Prime
UPDATE mob_groups SET HP = 5000, maxLevel = 80 WHERE groupid = 10 AND zoneid = 170; -- Shiva_Prime
UPDATE mob_groups SET HP = 5000, maxLevel = 80 WHERE groupid = 11 AND zoneid = 170; -- Garuda_Prime
UPDATE mob_groups SET HP = 5000, maxLevel = 80 WHERE groupid = 12 AND zoneid = 170; -- Titan_Prime
UPDATE mob_groups SET HP = 5000, maxLevel = 80 WHERE groupid = 13 AND zoneid = 170; -- Ramuh_Prime
UPDATE mob_groups SET HP = 5000, maxLevel = 80 WHERE groupid = 14 AND zoneid = 170; -- Leviathan_Prime
UPDATE mob_groups SET HP = 600 WHERE groupid = 33 AND zoneid = 170; -- Ajido-Marujido

-- ------------------------------------------------------------
-- Crawlers_Nest_[S] (Zone 171)
-- ------------------------------------------------------------
-- The below should be treated as placeholders until the zones are captured
-- Apex Mobs
-- UPDATE mob_groups SET content_tag='ROV' WHERE name='Apex_Nest_Elytra' AND groupid = '??' AND zoneid = '171';
-- UPDATE mob_groups SET content_tag='ROV' WHERE name='Apex_Blazer_Elytra' AND groupid = '??' AND zoneid = '171';
-- UPDATE mob_groups SET content_tag='ROV' WHERE name='Apex_Helm_Elytra' AND groupid = '??' AND zoneid = '171';
-- UPDATE mob_groups SET content_tag='ROV' WHERE name='Apex_Doom_Scorpion' AND groupid = '??' AND zoneid = '171';
-- UPDATE mob_groups SET content_tag='ROV' WHERE name='Apex_Lugcrawler_Hunter' AND groupid = '??' AND zoneid = '171';
-- UPDATE mob_groups SET content_tag='ROV' WHERE name='Apex_Hornfly' AND groupid = '??' AND zoneid = '171';
-- UPDATE mob_groups SET content_tag='ROV' WHERE name='Apex_Dragonfly' AND groupid = '??' AND zoneid = '171';
-- UPDATE mob_groups SET content_tag='ROV' WHERE name='Apex_Lugcrawler' AND groupid = '??' AND zoneid = '171';
-- UPDATE mob_groups SET content_tag='ROV' WHERE name='Apex_Worker_Lugcrawler' AND groupid = '??' AND zoneid = '171';
-- UPDATE mob_groups SET content_tag='ROV' WHERE name='Apex_Soldier_Lugcrawler' AND groupid = '??' AND zoneid = '171';
-- UPDATE mob_groups SET content_tag='ROV' WHERE name='Apex_Rumble_Lugcrawler' AND groupid = '??' AND zoneid = '171';
-- UPDATE mob_groups SET content_tag='ROV' WHERE name='Apex_Knight_Lugcrawler' AND groupid = '??' AND zoneid = '171';
-- UPDATE mob_groups SET content_tag='ROV' WHERE name='Apex_Mycelar' AND groupid = '??' AND zoneid = '171';
-- UPDATE mob_groups SET content_tag='ROV' WHERE name='Apex_Fire_Elemental' AND groupid = '??' AND zoneid = '171';
-- UPDATE mob_groups SET content_tag='ROV' WHERE name='Apex_Water_Elemental' AND groupid = '??' AND zoneid = '171';

-- Locus Mobs
-- UPDATE mob_groups SET content_tag='ROV' WHERE name='Locus_Nest_Elytra' AND groupid = '??' AND zoneid = '171';
-- UPDATE mob_groups SET content_tag='ROV' WHERE name='Locus_Blazer_Elytra' AND groupid = '??' AND zoneid = '171';
-- UPDATE mob_groups SET content_tag='ROV' WHERE name='Locus_Hornfly' AND groupid = '??' AND zoneid = '171';
-- UPDATE mob_groups SET content_tag='ROV' WHERE name='Locus_Dragonfly' AND groupid = '??' AND zoneid = '171';
-- UPDATE mob_groups SET content_tag='ROV' WHERE name='Locus_Lugcrawler' AND groupid = '??' AND zoneid = '171';
-- UPDATE mob_groups SET content_tag='ROV' WHERE name='Locus_Worker_Lugcrawler' AND groupid = '??' AND zoneid = '171';
-- UPDATE mob_groups SET content_tag='ROV' WHERE name='Locus_Soldier_Lugcrawler' AND groupid = '??' AND zoneid = '171';

-- ------------------------------------------------------------
-- Zeruhn_Mines (Zone 172)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Burrower_Worm' AND groupid = '2' AND zoneid = '172';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Colliery_Bat' AND groupid = '3' AND zoneid = '172';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Soot_Crab' AND groupid = '4' AND zoneid = '172';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Veindigger_Leech' AND groupid = '6' AND zoneid = '172';
UPDATE mob_groups SET dropid = 6016 WHERE groupid = 4 AND zoneid = 172; -- Soot_Crab

INSERT INTO `mob_groups` (`groupid`, `poolid`, `zoneid`, `name`, `respawntime`, `spawntype`, `dropid`, `HP`, `MP`, `minLevel`, `maxLevel`, `allegiance`) VALUES
(20,4053,172,'Tunnel_Worm',330,0,2501,0,0,1,3,0), -- These are in prep for complete zone revamps
(21,2763,172, 'Mouse_Bat',330,0,1747,0,0,2,4,0),  -- These are in prep for complete zone revamps
(22,2385,172,'Leech',330,0,963,0,0,3,5,0);        -- These are in prep for complete zone revamps

-- ------------------------------------------------------------
-- Korroloka_Tunnel (Zone 173)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Lacerator' AND groupid = '18' AND zoneid = '173';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Spool_Leech' AND groupid = '19' AND zoneid = '173';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Thoon' AND groupid = '27' AND zoneid = '173';
UPDATE mob_groups SET dropid = 567 WHERE name='Jelly' AND zoneid = 173;

UPDATE mob_groups SET minLevel = 30, maxLevel = 33 WHERE name = "Greater_Pugil"  and zoneid = 173;
UPDATE mob_groups SET poolid = 20012 WHERE groupid = 4 AND zoneid = 173; -- Land_Worm
UPDATE mob_groups SET respawntime = 792, spawntype = 0 WHERE groupid = 12 AND zoneid = 173; -- Greater_Pugil
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 27 AND zoneid = 173; -- Thoon
UPDATE mob_groups SET HP = 1000 WHERE groupid = 28 AND zoneid = 173; -- Korroloka_Leech

INSERT INTO `mob_groups` (`groupid`, `poolid`, `zoneid`, `name`, `respawntime`, `spawntype`, `dropid`, `HP`, `MP`, `minLevel`, `maxLevel`, `allegiance`) VALUES (40,3500,173,'Scimitar_Scorpion',480,0,6040,0,0,34,37,0); -- These are in prep for complete zone revamps

-- ------------------------------------------------------------
-- Kuftal_Tunnel (Zone 174)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Kuftal_Delver' AND groupid = '22' AND zoneid = '174';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Machairodus' AND groupid = '19' AND zoneid = '174';

UPDATE mob_groups SET minLevel = 68, maxLevel = 70 WHERE name = "Fire_Elemental"  and zoneid = 174;
UPDATE mob_groups SET HP = 12000 WHERE groupid = 16 AND zoneid = 174; -- Amemet
UPDATE mob_groups SET respawntime = 960 WHERE groupid = 19 AND zoneid = 174; -- Greater_Cockatrice

-- ------------------------------------------------------------
-- The_Eldieme_Necropolis_[S] (Zone 175)
-- ------------------------------------------------------------
UPDATE mob_groups SET HP = 750 WHERE groupid = 53 AND zoneid = 175; -- One-eyed_Gwajboj

-- ------------------------------------------------------------
-- Sea_Serpent_Grotto (Zone 176)
-- ------------------------------------------------------------
UPDATE mob_groups SET HP = 2500 WHERE groupid = 14 AND zoneid = 176; -- Namtar
UPDATE mob_groups SET HP = 4300 WHERE groupid = 20 AND zoneid = 176; -- Fyuu_the_Seabellow
UPDATE mob_groups SET HP = 4400 WHERE groupid = 23 AND zoneid = 176; -- Seww_the_Squidlimbed
UPDATE mob_groups SET dropid = 6057 WHERE groupid = 27 AND zoneid = 176; -- Thunder_Elemental
UPDATE mob_groups SET HP = 3700 WHERE groupid = 46 AND zoneid = 176; -- Novv_the_Whitehearted
UPDATE mob_groups SET respawntime = 960 WHERE groupid = 49 AND zoneid = 176; -- Devil_Manta
UPDATE mob_groups SET HP = 35000 WHERE groupid = 51 AND zoneid = 176; -- Charybdis

INSERT INTO mob_groups (groupid, poolid, zoneid, name, respawntime, spawntype, dropid, HP, MP, minLevel, maxLevel, allegiance) VALUES (66, 1018, 176, 'Devil_Manta', 0, 128, 645, 0, 0, 66, 69, 0); -- Devil_Manta

-- ------------------------------------------------------------
-- VeLugannon_Palace (Zone 177)
-- ------------------------------------------------------------
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 16 AND zoneid = 177; -- Zipacna

-- ------------------------------------------------------------
-- The_Shrine_of_RuAvitau (Zone 178)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Baelfyr' AND groupid = '19' AND zoneid = '178';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Gefyrst' AND groupid = '20' AND zoneid = '178';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Ungeweder' AND groupid = '21' AND zoneid = '178';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Byrgen' AND groupid = '22' AND zoneid = '178';

UPDATE mob_groups SET minLevel = 72, maxLevel = 73 WHERE name = "Water_Elemental"  and zoneid = 178;

UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 6 AND zoneid = 178; -- Faust
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 9 AND zoneid = 178; -- Mother_Globe
UPDATE mob_groups SET MP = 50000 WHERE groupid = 27 AND zoneid = 178; -- Kirin
UPDATE mob_groups SET MP = 15000, minLevel = 82 WHERE groupid = 28 AND zoneid = 178; -- Genbu_pet
UPDATE mob_groups SET MP = 15000, minLevel = 82 WHERE groupid = 29 AND zoneid = 178; -- Seiryu_pet
UPDATE mob_groups SET MP = 15000, minLevel = 82 WHERE groupid = 30 AND zoneid = 178; -- Byakko_pet
UPDATE mob_groups SET MP = 15000, minLevel = 82 WHERE groupid = 31 AND zoneid = 178; -- Suzaku_pet
UPDATE mob_groups SET minLevel = 80, maxLevel = 81 WHERE groupid = 32 AND zoneid = 178; -- Kirins_Avatar

-- ------------------------------------------------------------
-- Stellar_Fulcrum (Zone 179)
-- ------------------------------------------------------------
UPDATE mob_groups SET HP = 12000 WHERE groupid = 1 AND zoneid = 179; -- Kamlanaut

-- ------------------------------------------------------------
-- LaLoff_Amphitheater (Zone 180)
-- ------------------------------------------------------------
UPDATE mob_groups SET MP = 10000 WHERE groupid = 5 AND zoneid = 180; -- Ark_Angel_EV
UPDATE mob_groups SET MP = 10000 WHERE groupid = 6 AND zoneid = 180; -- Ark_Angel_TT

-- ------------------------------------------------------------
-- Lower_Delkfutts_Tower (Zone 184)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Tyrant' AND groupid = '14' AND zoneid = '184';

UPDATE mob_groups SET dropid = 964 WHERE groupid = 2 AND zoneid = 184; -- Giant_Gatekeeper
UPDATE mob_groups SET dropid = 964 WHERE groupid = 3 AND zoneid = 184; -- Giant_Guard
UPDATE mob_groups SET dropid = 0964 WHERE groupid = 4 AND zoneid = 184; -- Giant_Sentry
UPDATE mob_groups SET dropid = 968 WHERE groupid = 6 AND zoneid = 184; -- Giant_Lobber
UPDATE mob_groups SET dropid = 82 WHERE groupid = 7 AND zoneid = 184; -- Seeker_Bats
UPDATE mob_groups SET dropid = 6038 WHERE groupid = 10 AND zoneid = 184; -- Goblin_Mugger
UPDATE mob_groups SET dropid = 1107 WHERE groupid = 11 AND zoneid = 184; -- Goblin_Leecher
UPDATE mob_groups SET dropid = 1083 WHERE groupid = 12 AND zoneid = 184; -- Goblin_Gambler
UPDATE mob_groups SET HP = 3000 WHERE groupid = 14 AND zoneid = 184; -- Tyrant
UPDATE mob_groups SET dropid = 980 WHERE groupid = 15 AND zoneid = 184; -- Gigas_Hallwatcher
UPDATE mob_groups SET dropid = 980 WHERE groupid = 16 AND zoneid = 184; -- Gigas_Punisher
UPDATE mob_groups SET dropid = 980 WHERE groupid = 17 AND zoneid = 184; -- Gigas_Butcher
UPDATE mob_groups SET dropid = 980 WHERE groupid = 19 AND zoneid = 184; -- Gigas_Sculptor
UPDATE mob_groups SET dropid = 6048 WHERE groupid = 20 AND zoneid = 184; -- Thunder_Elemental
UPDATE mob_groups SET dropid = 6049 WHERE groupid = 21 AND zoneid = 184; -- Light_Elemental

-- ------------------------------------------------------------
-- King_Ranperres_Tomb (Zone 190)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Ogre_Bat' AND groupid = '27' AND zoneid = '190';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Bonnet_Beetle' AND groupid = '36' AND zoneid = '190';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Gwyllgi' AND groupid = '17' AND zoneid = '190';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Ankou' AND groupid = '21' AND zoneid = '190';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Barbastelle' AND groupid = '22' AND zoneid = '190';

UPDATE mob_groups SET spawntype = 0 WHERE name = "Nachzehrer_war"  and zoneid = 190;
UPDATE mob_groups SET spawntype = 0 WHERE name = "Nachzehrer_blm"  and zoneid = 190;

UPDATE mob_groups SET respawntime = 540 WHERE groupid = 8 AND zoneid = 190; -- Spook
UPDATE mob_groups SET spawntype = 1 WHERE groupid = 16 AND zoneid = 190; -- Nachzehrer_war
UPDATE mob_groups SET dropid = 6018 WHERE groupid = 20 AND zoneid = 190; -- Plague_Bats
UPDATE mob_groups SET MP = 100000, minLevel = 95, maxLevel = 95 WHERE groupid = 37 AND zoneid = 190; -- Vrtra

INSERT INTO `mob_groups` (`groupid`, `poolid`, `zoneid`, `name`, `respawntime`, `spawntype`, `dropid`, `HP`, `MP`, `minLevel`, `maxLevel`, `allegiance`) VALUES
(60,3946,190,'Tomb_Worm',660,0,429,0,0,60,62,0),        -- These are in prep for complete zone revamps
(61,6456,190,'Dire_Bat',660,0,6041,0, 0,62,64,0),       -- These are in prep for complete zone revamps
(62,871,190,'Cutlass_Scorpion',660,0,6042,0,0,63,65,0), -- These are in prep for complete zone revamps
(63,244,190,'Armet_Beetle',660,0,169,0,0,64,66,0),      -- These are in prep for complete zone revamps
(64,20015,190,'Thousand_Eyes',960,0,2402,0,0,60,62,0),  -- These are in prep for complete zone revamps
(65,1898,190,'Hati',960,0,1278,0,0,77,79,0),            -- These are in prep for complete zone revamps
(66,20014,190,'Lemures',960,0,1506,0,0,80,80,0);        -- These are in prep for complete zone revamps

-- Locus Mobs
UPDATE mob_groups SET content_tag='ROV' WHERE name='Locus_Tomb_Worm' AND groupid = '26' AND zoneid = '190';
UPDATE mob_groups SET content_tag='ROV' WHERE name='Locus_Dire_Bat' AND groupid = '27' AND zoneid = '190';
UPDATE mob_groups SET content_tag='ROV' WHERE name='Locus_Cutlass_Scorpion' AND groupid = '28' AND zoneid = '190';
UPDATE mob_groups SET content_tag='ROV' WHERE name='Locus_Thousand_Eyes' AND groupid = '29' AND zoneid = '190';
UPDATE mob_groups SET content_tag='ROV' WHERE name='Locus_Lemures' AND groupid = '33' AND zoneid = '190';
UPDATE mob_groups SET content_tag='ROV' WHERE name='Locus_Armet_Beetle' AND groupid = '36' AND zoneid = '190';
UPDATE mob_groups SET content_tag='ROV' WHERE name='Locus_Hati' AND groupid = '48' AND zoneid = '190';
UPDATE mob_groups SET content_tag='ROV' WHERE name='Locus_Spartoi_Sorcerer' AND groupid = '50' AND zoneid = '190';
UPDATE mob_groups SET content_tag='ROV' WHERE name='Locus_Spartoi_Warrior' AND groupid = '49' AND zoneid = '190';

-- ------------------------------------------------------------
-- Dangruf_Wadi (Zone 191)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Goblin_Brigand' AND groupid = '19' AND zoneid = '191';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Goblin_Headsman' AND groupid = '20' AND zoneid = '191';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Goblin_Healer' AND groupid = '21' AND zoneid = '191';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Witchetty_Grub' AND groupid = '22' AND zoneid = '191';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Couloir_Leech' AND groupid = '23' AND zoneid = '191';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Prim_Pika' AND groupid = '24' AND zoneid = '191';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Natty_Gibbon' AND groupid = '25' AND zoneid = '191';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Trimmer' AND groupid = '26' AND zoneid = '191';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Fume_Lizard' AND groupid = '27' AND zoneid = '191';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Goblin_Conjurer' AND groupid = '28' AND zoneid = '191';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Goblin_Bladesmith' AND groupid = '29' AND zoneid = '191';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Goblin_Bushwhacker' AND groupid = '30' AND zoneid = '191';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Teporingo' AND groupid = '10' AND zoneid = '191';

INSERT INTO `mob_groups` (`groupid`, `poolid`, `zoneid`, `name`, `respawntime`, `spawntype`, `dropid`, `HP`, `MP`, `minLevel`, `maxLevel`, `allegiance`) VALUES
(40,3772,191,'Stickpin',330,0,6043,0,0,7,9,0),           -- These are in prep for complete zone revamps
(41,1527,191,'Giant_Grub',330,0,2341,0,0,9,12,0),       -- These are in prep for complete zone revamps
(42,1666,191,'Goblin_Gambler',330,0,1119,0,0,21,23,0),  -- These are in prep for complete zone revamps
(43,1683,191,'Goblin_Leecher',330,0,1107,0,0,21,23,0),  -- These are in prep for complete zone revamps
(44,1690,191,'Goblin_Mugger',330,0,1117,0,0,21,23,0),   -- These are in prep for complete zone revamps
(45,5733,191,'Snipper',330,0,2283,0,0,16,20,0);         -- These are in prep for complete zone revamps
UPDATE mob_groups SET minLevel = 15, maxLevel = 17 WHERE name = "Wadi_Leech_fished"  and zoneid = 191;
UPDATE mob_groups SET minLevel = 80, maxLevel = 80 WHERE name = "Lemures"  and zoneid = 190;

-- ------------------------------------------------------------
-- Inner_Horutoto_Ruins (Zone 192)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Troika_Bats' AND groupid = '6' AND zoneid = '192';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Deathwatch_Beetle' AND groupid = '7' AND zoneid = '192';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Goblin_Flesher' AND groupid = '8' AND zoneid = '192';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Goblin_Metallurgist' AND groupid = '9' AND zoneid = '192';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Goblin_Lurcher' AND groupid = '10' AND zoneid = '192';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Skinnymalinks' AND groupid = '11' AND zoneid = '192';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Skinnymajinx' AND groupid = '12' AND zoneid = '192';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Covin_Bat' AND groupid = '13' AND zoneid = '192';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Goblin_Trailblazer' AND groupid = '14' AND zoneid = '192';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Nocuous_Weapon' AND groupid = '25' AND zoneid = '192';

UPDATE mob_groups SET respawntime = 900 WHERE groupid = 2 AND zoneid = 192; -- Goblin_Thug
UPDATE mob_groups SET respawntime = 900 WHERE groupid = 4 AND zoneid = 192; -- Goblin_Weaver
UPDATE mob_groups SET name = 'Magicked_Bones_war', respawntime = 480, spawntype = 0, dropid = 6023 WHERE groupid = 5 AND zoneid = 192; -- Magicked_Bones_war
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 16 AND zoneid = 192; -- Maltha
UPDATE mob_groups SET dropid = 6027 WHERE groupid = 23 AND zoneid = 192; -- Will-o-the-Wisp
UPDATE mob_groups SET dropid = 2638 WHERE groupid = 27 AND zoneid = 192; -- Wendigo_blm

INSERT INTO `mob_groups` (`groupid`, `poolid`, `zoneid`, `name`, `respawntime`, `spawntype`, `dropid`, `HP`, `MP`, `minLevel`, `maxLevel`, `allegiance`) VALUES
(42,1635,192,'Goblin_Ambusher',330,0,1018,0,0,14,18,0),  -- These are in prep for complete zone revamps
(43,1643,192,'Goblin_Butcher',330,0,1035,0,0,14,18,0),   -- These are in prep for complete zone revamps
(44,1738,192,'Goblin_Tinkerer',330,0,1035,0,0,14,18,0),  -- These are in prep for complete zone revamps
(45,382,192,'Beady_Beetle',330,0,250,0,0,11,16,0),       -- These are in prep for complete zone revamps
(46,373,192,'Bat_Battalion',330,0,241,0,0,12,15,0);      -- These are in prep for complete zone revamps

-- ------------------------------------------------------------
-- Ordelles_Caves (Zone 193)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Buds_Bunny' AND groupid = '18' AND zoneid = '193';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Bilis_Leech' AND groupid = '19' AND zoneid = '193';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Swagger_Spruce' AND groupid = '24' AND zoneid = '193';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Targe_Beetle' AND groupid = '25' AND zoneid = '193';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Donggu' AND groupid = '14' AND zoneid = '193';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Agar_Agar' AND groupid = '23' AND zoneid = '193';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Bombast' AND groupid = '44' AND zoneid = '193';

UPDATE mob_groups SET minLevel = 21, maxLevel = 22, dropid = 79 WHERE name = "Thread_Leech_fished"  and zoneid = 193;
UPDATE mob_groups SET minLevel = 27, maxLevel = 29 WHERE name = "Poison_Leech_fished"  and zoneid = 193;

UPDATE mob_groups SET dropid = 2397 WHERE groupid = 6 AND zoneid = 193; -- Snipper
UPDATE mob_groups SET dropid = 1035 WHERE groupid = 8 AND zoneid = 193; -- Goblin_Tinkerer
UPDATE mob_groups SET dropid = 1035 WHERE groupid = 9 AND zoneid = 193; -- Goblin_Butcher
UPDATE mob_groups SET dropid = 6027 WHERE groupid = 27 AND zoneid = 193; -- Will-o-the-Wisp
UPDATE mob_groups SET dropid = 2397 WHERE groupid = 28 AND zoneid = 193; -- Clipper
UPDATE mob_groups SET HP = 7600 WHERE groupid = 46 AND zoneid = 193; -- Gerwitzs_Axe
UPDATE mob_groups SET HP = 5000 WHERE groupid = 47 AND zoneid = 193; -- Gerwitzs_Sword
UPDATE mob_groups SET HP = 5000 WHERE groupid = 48 AND zoneid = 193; -- Gerwitzs_Soul
UPDATE mob_groups SET HP = 1200, minLevel = 30, maxLevel = 30 WHERE groupid = 49 AND zoneid = 193; -- Necroplasm
UPDATE mob_groups SET dropid = 79 WHERE groupid = 54 AND zoneid = 193; -- Thread_Leech

-- ------------------------------------------------------------
-- Outer_Horutoto_Ruins (Zone 194)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Fetor_Bats' AND groupid = '8' AND zoneid = '194';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Fuligo' AND groupid = '9' AND zoneid = '194';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Thorn_Bat' AND groupid = '14' AND zoneid = '194';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Desmodont' AND groupid = '5' AND zoneid = '194';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Legalox_Heftyhind' AND groupid = '7' AND zoneid = '194';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Ah_Puch' AND groupid = '13' AND zoneid = '194';

UPDATE mob_groups SET dropid = 1240 WHERE groupid = 8 AND zoneid = 194; -- Fetor_Bats
UPDATE mob_groups SET dropid = 1845 WHERE groupid = 9 AND zoneid = 194; -- Fuligo
UPDATE mob_groups SET dropid = 6028 WHERE groupid = 12 AND zoneid = 194; -- Combat
UPDATE mob_groups SET dropid = 19 WHERE groupid = 14 AND zoneid = 194; -- Thorn_Bat
UPDATE mob_groups SET dropid = 6022 WHERE groupid = 52 AND zoneid = 194; -- Balloon

-- ------------------------------------------------------------
-- The_Eldieme_Necropolis (Zone 195)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Hellbound_Warrior' AND groupid = '15' AND zoneid = '195';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Hellbound_Warlock' AND groupid = '16' AND zoneid = '195';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Nekros_Hound' AND groupid = '32' AND zoneid = '195';
UPDATE mob_groups SET content_tag='COP' WHERE name='Namorodo' AND groupid = '56' AND zoneid = '195';

UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 19 AND zoneid = 195; -- Anemone
UPDATE mob_groups SET dropid = 6036 WHERE groupid = 37 AND zoneid = 195; -- Azer
UPDATE mob_groups SET HP = 8000 WHERE groupid = 48 AND zoneid = 195; -- Yum_Kimil
UPDATE mob_groups SET HP = 6000 WHERE groupid = 49 AND zoneid = 195; -- Dog_Guardian
UPDATE mob_groups SET HP = 5800 WHERE groupid = 50 AND zoneid = 195; -- Owl_Guardian
UPDATE mob_groups SET minLevel = 34, maxLevel = 34 WHERE groupid = 56 AND zoneid = 195; -- Namorodo

-- ------------------------------------------------------------
-- Gusgen_Mines (Zone 196)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Accursed_Soldier' AND groupid = '23' AND zoneid = '196';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Accursed_Sorcerer' AND groupid = '24' AND zoneid = '196';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Madfly' AND groupid = '25' AND zoneid = '196';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Rockmill' AND groupid = '26' AND zoneid = '196';

UPDATE mob_groups SET minLevel = 25, maxLevel = 27 WHERE name = "Greater_Pugil_fished"  and zoneid = 196;
UPDATE mob_groups SET minLevel = 20, maxLevel = 24 WHERE name = "Ghoul_war"  and zoneid = 196;
UPDATE mob_groups SET minLevel = 23, maxLevel = 27 WHERE name = "Ghoul_blm"  and zoneid = 196;

UPDATE mob_groups SET dropid = 1725 WHERE groupid = 26 AND zoneid = 196; -- Rockmill
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 32 AND zoneid = 196; -- Juggler_Hecatomb
UPDATE mob_groups SET HP = 6000 WHERE groupid = 39 AND zoneid = 196; -- Wandering_Ghost
UPDATE mob_groups SET HP = 700, minLevel = 28, maxLevel = 28 WHERE groupid = 40 AND zoneid = 196; -- Pudding

-- ------------------------------------------------------------
-- Crawlers_Nest (Zone 197)
-- ------------------------------------------------------------
UPDATE mob_groups SET minLevel='47',maxLevel='49' WHERE name='King_Crawler' AND groupid = '16' AND zoneid = '197'; -- Renamer: Soldier Crawler
UPDATE mob_groups SET minLevel='55',maxLevel='57',content_tag='ABYSSEA' WHERE name='Vespo' AND groupid = '17' AND zoneid = '197';
UPDATE mob_groups SET minLevel='50',maxLevel='53' WHERE name='Dancing_Jewel' AND groupid = '18' AND zoneid = '197';-- Renamer: Hornfly
UPDATE mob_groups SET minLevel='51',maxLevel='54',content_tag='ABYSSEA' WHERE name='Olid_Funguar' AND groupid = '19' AND zoneid = '197';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Dynast_Beetle' AND groupid = '23' AND zoneid = '197';
UPDATE mob_groups SET content_tag='SYNERGY' WHERE name='Aqrabuamelu' AND groupid = '36' AND zoneid = '197';

UPDATE mob_groups SET dropid = 585 WHERE groupid = 17 AND zoneid = 197; -- Vespo
UPDATE mob_groups SET dropid = 2310 WHERE groupid = 18 AND zoneid = 197; -- Dancing_Jewel
UPDATE mob_groups SET dropid = 6032 WHERE groupid = 28 AND zoneid = 197; -- Witch_Hazel
UPDATE mob_groups SET HP = 10000, MP = 10000 WHERE groupid = 33 AND zoneid = 197; -- Demonic_Tiphia
UPDATE mob_groups SET respawntime = 0, spawntype = 128, minLevel = 70, maxLevel = 73 WHERE groupid = 36 AND zoneid = 197; -- Aqrabuamelu

-- ------------------------------------------------------------
-- Maze_of_Shakhrami (Zone 198)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Bleeder_Leech' AND groupid = '18' AND zoneid = '198';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Chaser_Bats' AND groupid = '21' AND zoneid = '198';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Crypterpillar' AND groupid = '22' AND zoneid = '198';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Warren_Bat' AND groupid = '23' AND zoneid = '198';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Trembler_Tabitha' AND groupid = '9' AND zoneid = '198';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Gloombound_Lurker' AND groupid = '26' AND zoneid = '198';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Lesath' AND groupid = '31' AND zoneid = '198';

UPDATE mob_groups SET minLevel = 31, maxLevel = 34 WHERE name = "Goblin_Shaman"  and zoneid = 198;

UPDATE mob_groups SET dropid = 6038 WHERE groupid = 11 AND zoneid = 198; -- Goblin_Mugger
UPDATE mob_groups SET dropid = 79 WHERE groupid = 18 AND zoneid = 198; -- Bleeder_Leech
UPDATE mob_groups SET dropid = 244 WHERE groupid = 21 AND zoneid = 198; -- Chaser_Bats
UPDATE mob_groups SET dropid = 19 WHERE groupid = 23 AND zoneid = 198; -- Warren_Bat
UPDATE mob_groups SET dropid = 19 WHERE groupid = 24 AND zoneid = 198; -- Ancient_Bat
UPDATE mob_groups SET dropid = 244 WHERE groupid = 25 AND zoneid = 198; -- Seeker_Bats
UPDATE mob_groups SET HP = 650, minLevel = 26, maxLevel = 26 WHERE groupid = 40 AND zoneid = 198; -- Wyrmfly

-- ------------------------------------------------------------
-- Garlaige_Citadel (Zone 200)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Fortalice_Bats' AND groupid = '15' AND zoneid = '200';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Kaboom' AND groupid = '29' AND zoneid = '200';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Warden_Beetle' AND groupid = '35' AND zoneid = '200';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Donjon_Bat' AND groupid = '40' AND zoneid = '200';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Hazmat' AND groupid = '17' AND zoneid = '200';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Hovering_Hotpot' AND groupid = '34' AND zoneid = '200';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Frogamander' AND groupid = '39' AND zoneid = '200';

UPDATE mob_groups SET HP = 8000 WHERE groupid = 13 AND zoneid = 200; -- Old_Two-Wings
UPDATE mob_groups SET HP = 9000 WHERE groupid = 14 AND zoneid = 200; -- Skewer_Sam
UPDATE mob_groups SET dropid = 1240 WHERE groupid = 15 AND zoneid = 200; -- Fortalice_Bats
UPDATE mob_groups SET dropid = 6027 WHERE groupid = 29 AND zoneid = 200; -- Kaboom
UPDATE mob_groups SET HP = 8500 WHERE groupid = 37 AND zoneid = 200; -- Guardian_Statue
UPDATE mob_groups SET dropid = 19 WHERE groupid = 40 AND zoneid = 200; -- Donjon_Bat

INSERT INTO mob_groups (groupid, poolid, zoneid, name, respawntime, spawntype, dropid, HP, MP, minLevel, maxLevel, allegiance) VALUES (49, 20011, 200, 'Wanzo-Unzozo', 0, 128, 0, 0, 0, 45, 45, 0); -- Wanzo-Unzozo

-- ------------------------------------------------------------
-- Cloister_of_Gales (Zone 201)
-- ------------------------------------------------------------
UPDATE mob_groups SET poolid = 1473 WHERE groupid = 1 AND zoneid = 201; -- Garuda_Prime_TBW
UPDATE mob_groups SET HP = 28000 WHERE groupid = 4 AND zoneid = 201; -- Garuda_Prime_WTB
UPDATE mob_groups SET HP = 3000 WHERE groupid = 5 AND zoneid = 201; -- Air_Elemental

-- ------------------------------------------------------------
-- Cloister_of_Storms (Zone 202)
-- ------------------------------------------------------------
UPDATE mob_groups SET poolid = 3317 WHERE groupid = 1 AND zoneid = 202; -- Ramuh_Prime_TBL
UPDATE mob_groups SET HP = 27000 WHERE groupid = 5 AND zoneid = 202; -- Ramuh_Prime_WTB
UPDATE mob_groups SET HP = 3000 WHERE groupid = 6 AND zoneid = 202; -- Thunder_Elemental

-- ------------------------------------------------------------
-- Cloister_of_Frost (Zone 203)
-- ------------------------------------------------------------
UPDATE mob_groups SET poolid = 3607 WHERE groupid = 1 AND zoneid = 203; -- Shiva_Prime_TBI
UPDATE mob_groups SET HP = 18000 WHERE groupid = 4 AND zoneid = 203; -- Shiva_Prime_WTB
UPDATE mob_groups SET HP = 3000 WHERE groupid = 5 AND zoneid = 203; -- Ice_Elemental

-- ------------------------------------------------------------
-- FeiYin (Zone 204)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Wekufe' AND groupid = '16' AND zoneid = '204';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Sentient_Carafe' AND groupid = '17' AND zoneid = '204';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Balayang' AND groupid = '18' AND zoneid = '204';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Mind_Hoarder' AND groupid = '11' AND zoneid = '204';
UPDATE mob_groups SET content_tag='WOTG' WHERE name='Sluagh' AND groupid = '5' AND zoneid = '204';
UPDATE mob_groups SET content_tag='SYNERGY' WHERE name='Jenglot' AND groupid = '7' AND zoneid = '204';

UPDATE mob_groups SET minLevel = 52, maxLevel = 54 WHERE name = "Camazotz"  and zoneid = 204;
UPDATE mob_groups SET dropid = 1226 WHERE groupid = 4 AND zoneid = 204; -- Vampire_Bat
UPDATE mob_groups SET dropid = 6014, minLevel = 78 WHERE groupid = 5 AND zoneid = 204; -- Sluagh
UPDATE mob_groups SET HP = 16000 WHERE groupid = 6 AND zoneid = 204; -- Altedour_I_Tavnazia
UPDATE mob_groups SET dropid = 6013 WHERE groupid = 7 AND zoneid = 204; -- Jenglot
UPDATE mob_groups SET HP = 8500 WHERE groupid = 9 AND zoneid = 204; -- Miser_Murphy
UPDATE mob_groups SET dropid = 6054 WHERE groupid = 22 AND zoneid = 204; -- Camazotz
UPDATE mob_groups SET HP = 3400 WHERE groupid = 36 AND zoneid = 204; -- Eastern_Shadow
UPDATE mob_groups SET HP = 6750 WHERE groupid = 38 AND zoneid = 204; -- Dabotzs_Ghost
UPDATE mob_groups SET HP = 43500 WHERE groupid = 39 AND zoneid = 204; -- Capricious_Cassie

-- ------------------------------------------------------------
-- Ifrits_Cauldron (Zone 205)
-- ------------------------------------------------------------
UPDATE mob_groups SET minLevel = 60, maxLevel = 63 WHERE name = "Dire_Bat"  and zoneid = 205;

UPDATE mob_groups SET dropid = 6060 WHERE groupid = 5 AND zoneid = 205; -- Dire_Bat
UPDATE mob_groups SET HP = 7500 WHERE groupid = 17 AND zoneid = 205; -- Foreseer_Oramix
UPDATE mob_groups SET HP = 30000 WHERE groupid = 22 AND zoneid = 205; -- Vouivre
UPDATE mob_groups SET HP = 60000 WHERE groupid = 23 AND zoneid = 205; -- Ash_Dragon

-- ------------------------------------------------------------
-- QuBia_Arena (Zone 206)
-- ------------------------------------------------------------
UPDATE mob_groups SET HP = 900, minLevel = 28, maxLevel = 29 WHERE groupid = 15 AND zoneid = 206; -- Gladiatorial_Weapon
UPDATE mob_groups SET minLevel = 31, maxLevel = 33 WHERE groupid = 16 AND zoneid = 206; -- Capelthwaite
UPDATE mob_groups SET minLevel = 31, maxLevel = 33 WHERE groupid = 17 AND zoneid = 206; -- Freybug
UPDATE mob_groups SET minLevel = 31, maxLevel = 33 WHERE groupid = 18 AND zoneid = 206; -- Rongeur_Dos
UPDATE mob_groups SET minLevel = 31, maxLevel = 33 WHERE groupid = 19 AND zoneid = 206; -- Guytrash
UPDATE mob_groups SET minLevel = 45, maxLevel = 45 WHERE groupid = 20 AND zoneid = 206; -- Doll_Factory
UPDATE mob_groups SET minLevel = 41, maxLevel = 43 WHERE groupid = 21 AND zoneid = 206; -- Generic_Doll
UPDATE mob_groups SET minLevel = 41, maxLevel = 43 WHERE groupid = 22 AND zoneid = 206; -- Ghul-I-Beaban_DRK
UPDATE mob_groups SET minLevel = 41, maxLevel = 43 WHERE groupid = 23 AND zoneid = 206; -- Ghul-I-Beaban_BLM
UPDATE mob_groups SET minLevel = 53, maxLevel = 55 WHERE groupid = 24 AND zoneid = 206; -- Fire_Golem
UPDATE mob_groups SET minLevel = 53, maxLevel = 55 WHERE groupid = 25 AND zoneid = 206; -- Water_Golem
UPDATE mob_groups SET minLevel = 55, maxLevel = 55 WHERE groupid = 26 AND zoneid = 206; -- Wind_Golem
UPDATE mob_groups SET minLevel = 53, maxLevel = 55 WHERE groupid = 27 AND zoneid = 206; -- Earth_Golem
UPDATE mob_groups SET HP = 4800, minLevel = 62, maxLevel = 64 WHERE groupid = 28 AND zoneid = 206; -- Nephiyl_Rampartbreacher
UPDATE mob_groups SET HP = 6900, minLevel = 62, maxLevel = 64 WHERE groupid = 29 AND zoneid = 206; -- Nephiyl_Keepcollapser
UPDATE mob_groups SET HP = 8800, minLevel = 62, maxLevel = 64 WHERE groupid = 30 AND zoneid = 206; -- Nephiyl_Moatfiller
UPDATE mob_groups SET HP = 4000, minLevel = 62, maxLevel = 64 WHERE groupid = 31 AND zoneid = 206; -- Nephiyl_Pinnacletosser
UPDATE mob_groups SET HP = 4800, minLevel = 62, maxLevel = 64 WHERE groupid = 32 AND zoneid = 206; -- Vaicoliaux_B_DAurphe
UPDATE mob_groups SET HP = 5100, minLevel = 62, maxLevel = 64 WHERE groupid = 33 AND zoneid = 206; -- Maldaramet_B_DAurphe
UPDATE mob_groups SET HP = 5600, minLevel = 62, maxLevel = 64 WHERE groupid = 34 AND zoneid = 206; -- Disfaurit_B_DAurphe
UPDATE mob_groups SET HP = 3700, minLevel = 62, maxLevel = 64 WHERE groupid = 35 AND zoneid = 206; -- Jeumouque_B_DAurphe
UPDATE mob_groups SET minLevel = 52, maxLevel = 52 WHERE groupid = 36 AND zoneid = 206; -- Chahnameeds_Stomach
UPDATE mob_groups SET minLevel = 48 WHERE groupid = 37 AND zoneid = 206; -- Chahnameeds_Intestines
UPDATE mob_groups SET minLevel = 48 WHERE groupid = 38 AND zoneid = 206; -- Chahnameeds_Liver
UPDATE mob_groups SET minLevel = 53, maxLevel = 55 WHERE groupid = 39 AND zoneid = 206; -- Chahnameed
UPDATE mob_groups SET minLevel = 66, maxLevel = 67 WHERE groupid = 40 AND zoneid = 206; -- Annihilated_Anthony
UPDATE mob_groups SET minLevel = 66, maxLevel = 67 WHERE groupid = 41 AND zoneid = 206; -- Shredded_Samson
UPDATE mob_groups SET minLevel = 66, maxLevel = 67 WHERE groupid = 42 AND zoneid = 206; -- Mauled_Murdock
UPDATE mob_groups SET minLevel = 66, maxLevel = 67 WHERE groupid = 43 AND zoneid = 206; -- Punctured_Percy
UPDATE mob_groups SET minLevel = 78, maxLevel = 79 WHERE groupid = 44 AND zoneid = 206; -- Anansi
UPDATE mob_groups SET maxLevel = 76 WHERE groupid = 45 AND zoneid = 206; -- Son_of_Anansi
UPDATE mob_groups SET HP = 9500 WHERE groupid = 46 AND zoneid = 206; -- Fire_Pot
UPDATE mob_groups SET HP = 9500 WHERE groupid = 47 AND zoneid = 206; -- Ice_Pot
UPDATE mob_groups SET HP = 9500 WHERE groupid = 48 AND zoneid = 206; -- Air_Pot
UPDATE mob_groups SET HP = 9500 WHERE groupid = 49 AND zoneid = 206; -- Earth_Pot
UPDATE mob_groups SET HP = 9500 WHERE groupid = 50 AND zoneid = 206; -- Thunder_Pot
UPDATE mob_groups SET HP = 9500 WHERE groupid = 51 AND zoneid = 206; -- Water_Pot
UPDATE mob_groups SET HP = 4500, minLevel = 70, maxLevel = 70 WHERE groupid = 53 AND zoneid = 206; -- Hell_Fly
UPDATE mob_groups SET minLevel = 61, maxLevel = 63 WHERE groupid = 65 AND zoneid = 206; -- Nephiyl_Rampartbreacher
UPDATE mob_groups SET minLevel = 61, maxLevel = 63 WHERE groupid = 66 AND zoneid = 206; -- Nephiyl_Keepcollapser
UPDATE mob_groups SET minLevel = 61, maxLevel = 63 WHERE groupid = 67 AND zoneid = 206; -- Nephiyl_Moatfiller
UPDATE mob_groups SET minLevel = 61, maxLevel = 63 WHERE groupid = 68 AND zoneid = 206; -- Nephiyl_Pinnacletosser
UPDATE mob_groups SET minLevel = 61, maxLevel = 63 WHERE groupid = 69 AND zoneid = 206; -- Vaicoliaux_B_DAurphe
UPDATE mob_groups SET minLevel = 61, maxLevel = 63 WHERE groupid = 70 AND zoneid = 206; -- Maldaramet_B_DAurphe
UPDATE mob_groups SET minLevel = 61, maxLevel = 63 WHERE groupid = 71 AND zoneid = 206; -- Disfaurit_B_DAurphe
UPDATE mob_groups SET minLevel = 61, maxLevel = 63 WHERE groupid = 72 AND zoneid = 206; -- Jeumouque_B_DAurphe

-- ------------------------------------------------------------
-- Cloister_of_Flames (Zone 207)
-- ------------------------------------------------------------
UPDATE mob_groups SET poolid = 2050 WHERE groupid = 1 AND zoneid = 207; -- Ifrit_Prime_TBF
UPDATE mob_groups SET HP = 27000 WHERE groupid = 3 AND zoneid = 207; -- Ifrit_Prime_WTB
UPDATE mob_groups SET HP = 3000 WHERE groupid = 4 AND zoneid = 207; -- Fire_Elemental

-- ------------------------------------------------------------
-- Quicksand_Caves (Zone 208)
-- ------------------------------------------------------------
UPDATE mob_groups SET minLevel = 65, maxLevel = 68 WHERE name = "Sand_Tarantula"  and zoneid = 208;

UPDATE mob_groups SET minLevel = 57, maxLevel = 58 WHERE groupid = 15 AND zoneid = 208; -- Sagittarius_X-XIII
UPDATE mob_groups SET respawntime = 0, spawntype = 128 WHERE groupid = 34 AND zoneid = 208; -- Antican_Consul
UPDATE mob_groups SET respawntime = 0, spawntype = 128, HP = 12400 WHERE groupid = 37 AND zoneid = 208; -- Proconsul_XII
UPDATE mob_groups SET dropid = 6051 WHERE groupid = 39 AND zoneid = 208; -- Sabotender_Bailaor

-- ------------------------------------------------------------
-- Cloister_of_Tremors (Zone 209)
-- ------------------------------------------------------------
UPDATE mob_groups SET poolid = 3931 WHERE groupid = 1 AND zoneid = 209; -- Titan_Prime_TBE
UPDATE mob_groups SET HP = 24000 WHERE groupid = 4 AND zoneid = 209; -- Titan_Prime_WTB
UPDATE mob_groups SET HP = 3000 WHERE groupid = 5 AND zoneid = 209; -- Earth_Elemental

-- ------------------------------------------------------------
-- GM_Home (Zone 210)
-- ------------------------------------------------------------
UPDATE mob_groups SET poolid = 20001 WHERE groupid = 1 AND zoneid = 210; -- Garrison_20
UPDATE mob_groups SET poolid = 20001 WHERE groupid = 2 AND zoneid = 210; -- Garrison_30
UPDATE mob_groups SET poolid = 20001 WHERE groupid = 3 AND zoneid = 210; -- Garrison_40
UPDATE mob_groups SET poolid = 20001 WHERE groupid = 4 AND zoneid = 210; -- Garrison_50
UPDATE mob_groups SET poolid = 20001 WHERE groupid = 5 AND zoneid = 210; -- Garrison_75

-- ------------------------------------------------------------
-- Cloister_of_Tides (Zone 211)
-- ------------------------------------------------------------
UPDATE mob_groups SET poolid = 2402 WHERE groupid = 1 AND zoneid = 211; -- Leviathan_Prime_TBW
UPDATE mob_groups SET HP = 27000 WHERE groupid = 3 AND zoneid = 211; -- Leviathan_Prime_WTB
UPDATE mob_groups SET HP = 3000 WHERE groupid = 4 AND zoneid = 211; -- Water_Elemental

-- ------------------------------------------------------------
-- Gustav_Tunnel (Zone 212)
-- ------------------------------------------------------------
UPDATE mob_groups SET spawntype='128',content_tag='ABYSSEA' WHERE name='Boulder_Eater' AND groupid = '31' AND zoneid = '212';
UPDATE mob_groups SET spawntype='128',content_tag='ABYSSEA' WHERE name='Pygmytoise' AND groupid = '32' AND zoneid = '212';

UPDATE mob_groups SET dropid = 1180 WHERE groupid = 3 AND zoneid = 212; -- Goblin_Robber
UPDATE mob_groups SET dropid = 1202 WHERE groupid = 5 AND zoneid = 212; -- Labyrinth_Leech
UPDATE mob_groups SET dropid = 6052 WHERE groupid = 8 AND zoneid = 212; -- Goblin_Reaper
UPDATE mob_groups SET dropid = 629 WHERE groupid = 30 AND zoneid = 212; -- Antares
UPDATE mob_groups SET HP = 6400 WHERE groupid = 31 AND zoneid = 212; -- Taxim

-- ------------------------------------------------------------
-- Labyrinth_of_Onzozo (Zone 213)
-- ------------------------------------------------------------
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Babaulas' AND groupid = '31' AND zoneid = '213';
UPDATE mob_groups SET content_tag='ABYSSEA' WHERE name='Boribaba' AND groupid = '32' AND zoneid = '213';

UPDATE mob_groups SET dropid = 1876 WHERE groupid = 2 AND zoneid = 213; -- Goblin_Robber
UPDATE mob_groups SET MP = 10000 WHERE groupid = 16 AND zoneid = 213; -- Lord_of_Onzozo

-- ------------------------------------------------------------
-- Ship_bound_for_Selbina_Pirates (Zone 227)
-- ------------------------------------------------------------
UPDATE mob_groups SET respawntime = 300 WHERE groupid = 10 AND zoneid = 227; -- Crossbones_blm
UPDATE mob_groups SET respawntime = 300 WHERE groupid = 11 AND zoneid = 227; -- Crossbones_war
UPDATE mob_groups SET respawntime = 300 WHERE groupid = 12 AND zoneid = 227; -- Ship_Wight
UPDATE mob_groups SET HP = 9000, MP = 4500, maxLevel = 70 WHERE groupid = 13 AND zoneid = 227; -- Blackbeard

-- ------------------------------------------------------------
-- Ship_bound_for_Mhaura_Pirates (Zone 228)
-- ------------------------------------------------------------
UPDATE mob_groups SET HP = 9000, MP = 4500, minLevel = 67 WHERE groupid = 13 AND zoneid = 228; -- Silverhook

UNLOCK TABLES;
