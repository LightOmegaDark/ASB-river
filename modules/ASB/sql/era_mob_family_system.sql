--
-- Era values for certain mob families
--

LOCK TABLES `mob_family_system` WRITE;

-- STILL NEED TO CHECK IF THESE ARE DUPLICATED--
-- Promys
REPLACE INTO `mob_family_system` VALUES (78,  'Craver', 49, 'Craver', 12, 'Empty', 0.00, 40, 120, 90, 1, 3, 1, 3, 6, 6, 5, 1, 3, 1, 3, 0, 258, 0);
REPLACE INTO `mob_family_system` VALUES (137, 'Gorger', 81, 'Gorger', 12, 'Empty', 0.00, 40, 112, 90, 1, 3, 2, 3, 6, 6, 5, 1, 3, 1, 3, 0, 258, 0);
REPLACE INTO `mob_family_system` VALUES (138, 'Gorger', 81, 'Gorger', 12, 'Empty', 1.00, 40, 112, 90, 1, 3, 2, 3, 6, 6, 5, 1, 3, 1, 3, 0, 258, 0);
REPLACE INTO `mob_family_system` VALUES (181, 'MemoryReceptacle', 0, 'undefined', 12, 'Empty', 2.00, 0, 200, 0, 1, 3, 5, 4, 2, 2, 5, 1, 3, 1, 3, 0, 2, 0);
REPLACE INTO `mob_family_system` VALUES (220, 'Seether', 130, 'Seether', 12, 'Empty', 1.00, 50, 117, 90, 1, 3, 2, 4, 6, 6, 5, 1, 3, 1, 3, 0, 258, 0);
REPLACE INTO `mob_family_system` VALUES (241, 'Thinker', 136, 'Thinker', 12, 'Empty', 1.00, 50, 132, 90, 1, 3, 2, 4, 6, 6, 5, 1, 3, 1, 3, 0, 258, 0);
REPLACE INTO `mob_family_system` VALUES (255, 'Wanderer', 145, 'Wanderer', 12, 'Empty', 0.00, 40, 110, 90, 1, 3, 5, 5, 6, 6, 5, 1, 3, 1, 3, 0, 258, 0);
REPLACE INTO `mob_family_system` VALUES (256, 'Weeper', 146, 'Weeper', 12, 'Empty', 0.00, 50, 110, 90, 2, 2, 5, 5, 6, 6, 5, 1, 3, 1, 3, 0, 258, 0);
REPLACE INTO `mob_family_system` VALUES (499, 'Wanderer-Stray', 145, 'Wanderer', 12, 'Empty', 0.00, 40, 20, 90, 1, 3, 5, 5, 6, 6, 5, 1, 3, 1, 3, 0, 2, 0);

REPLACE INTO `mob_family_system` VALUES (379,'Pet-Carbuncle'    ,13,'Carbuncle' ,5,'Avatar',0.00,40,100,120,4,4,4,4,4,4,4,2,3,1,3,0,41,0);
REPLACE INTO `mob_family_system` VALUES (380,'Pet-Diabolos'     ,14,'Diabolos'  ,5,'Avatar',0.00,40,100,120,4,4,4,4,4,4,4,2,3,1,3,0,41,0);
REPLACE INTO `mob_family_system` VALUES (381,'Pet-Fenrir'       ,15,'Fenrir'    ,5,'Avatar',1.00,40,100,120,4,4,4,4,4,4,4,2,3,1,3,0,41,0);
REPLACE INTO `mob_family_system` VALUES (382,'Pet-Garuda'       ,16,'Garuda'    ,5,'Avatar',0.00,40,100,120,4,4,4,4,4,4,4,2,3,1,3,0,41,0);
REPLACE INTO `mob_family_system` VALUES (383,'Pet-Ifrit'        ,17,'Ifrit'     ,5,'Avatar',0.00,40,100,120,4,4,4,4,4,4,4,2,3,1,3,0,41,0);
REPLACE INTO `mob_family_system` VALUES (384,'Pet-Leviathan'    ,19,'Leviathan' ,5,'Avatar',0.00,40,100,120,4,4,4,4,4,4,4,2,3,1,3,0,41,0);
REPLACE INTO `mob_family_system` VALUES (385,'Pet-Odin'         ,20,'Odin'      ,5,'Avatar',2.00,40,100,120,4,4,4,4,4,4,4,2,3,1,3,0,41,0);
REPLACE INTO `mob_family_system` VALUES (386,'Pet-Ramuh'        ,21,'Ramuh'     ,5,'Avatar',0.00,40,100,120,4,4,4,4,4,4,4,2,3,1,3,0,41,0);
REPLACE INTO `mob_family_system` VALUES (387,'Pet-Shiva'        ,22,'Shiva'     ,5,'Avatar',0.00,40,100,120,4,4,4,4,4,4,4,2,3,1,3,0,41,0);
REPLACE INTO `mob_family_system` VALUES (388,'Pet-Titan'        ,23,'Titan'     ,5,'Avatar',1.00,40,100,120,4,4,4,4,4,4,4,2,3,1,3,0,41,0);
REPLACE INTO `mob_family_system` VALUES (389,'Pet-Alexander'    ,12,'Alexander' ,5,'Avatar',4.00,40,100,120,4,4,4,4,4,4,4,2,3,1,3,0,41,0);

UPDATE mob_family_system SET Element = 0 WHERE familyID = 1; -- Acrolith
UPDATE mob_family_system SET Element = 4 WHERE familyID = 2; -- Adamantoise
UPDATE mob_family_system SET Element = 0 WHERE familyID = 3; -- Aern
UPDATE mob_family_system SET Element = 8 WHERE familyID = 4; -- Ahriman
UPDATE mob_family_system SET Element = 0 WHERE familyID = 5; -- Amoeban
UPDATE mob_family_system SET Element = 0 WHERE familyID = 6; -- Amphiptere
UPDATE mob_family_system SET Element = 0 WHERE familyID = 7; -- AnimatedWeapon-Archery
UPDATE mob_family_system SET Element = 0 WHERE familyID = 8; -- AnimatedWeapon-Axe
UPDATE mob_family_system SET Element = 0 WHERE familyID = 9; -- AnimatedWeapon-Club
UPDATE mob_family_system SET Element = 0 WHERE familyID = 11; -- AnimatedWeapon-Dagger
UPDATE mob_family_system SET Element = 0 WHERE familyID = 12; -- AnimatedWeapon-Greataxe
UPDATE mob_family_system SET Element = 0 WHERE familyID = 13; -- AnimatedWeapon-Greatkatana
UPDATE mob_family_system SET Element = 0 WHERE familyID = 14; -- AnimatedWeapon-Greatsword
UPDATE mob_family_system SET Element = 0 WHERE familyID = 15; -- AnimatedWeapon-Handtohand
UPDATE mob_family_system SET Element = 0 WHERE familyID = 16; -- AnimatedWeapon-Instrument
UPDATE mob_family_system SET Element = 0 WHERE familyID = 17; -- AnimatedWeapon-Katana
UPDATE mob_family_system SET Element = 0 WHERE familyID = 18; -- AnimatedWeapon-Marksmanship
UPDATE mob_family_system SET Element = 0 WHERE familyID = 19; -- AnimatedWeapon-Polearm
UPDATE mob_family_system SET Element = 0 WHERE familyID = 20; -- AnimatedWeapon-Scythe
UPDATE mob_family_system SET Element = 0 WHERE familyID = 21; -- AnimatedWeapon-Shield
UPDATE mob_family_system SET Element = 0 WHERE familyID = 23; -- AnimatedWeapon-Staff
UPDATE mob_family_system SET Element = 0 WHERE familyID = 24; -- AnimatedWeapon-Sword
UPDATE mob_family_system SET Element = 8 WHERE familyID = 25; -- Antica
UPDATE mob_family_system SET Element = 8 WHERE familyID = 26; -- Antlion
UPDATE mob_family_system SET Element = 6 WHERE familyID = 27; -- Apkallu
UPDATE mob_family_system SET Element = 0 WHERE familyID = 28; -- Automaton-Harlequin
UPDATE mob_family_system SET Element = 0 WHERE familyID = 29; -- Automaton-Sharpshot
UPDATE mob_family_system SET Element = 0 WHERE familyID = 30; -- Automaton-Stormwaker
UPDATE mob_family_system SET Element = 0 WHERE familyID = 31; -- Automaton-Valoredge
UPDATE mob_family_system SET Element = 0 WHERE familyID = 32; -- Avatar-Atomos
UPDATE mob_family_system SET Element = 0 WHERE familyID = 33; -- Avatar-Alexander
UPDATE mob_family_system SET Element = 0 WHERE familyID = 34; -- Avatar-Carbuncle
UPDATE mob_family_system SET Element = 0 WHERE familyID = 35; -- Avatar-Diabolos
UPDATE mob_family_system SET Element = 0 WHERE familyID = 36; -- Avatar-Fenrir
UPDATE mob_family_system SET Element = 0 WHERE familyID = 37; -- Avatar-Garuda
UPDATE mob_family_system SET Element = 0 WHERE familyID = 38; -- Avatar-Ifrit
UPDATE mob_family_system SET Element = 0 WHERE familyID = 39; -- Monoceros
UPDATE mob_family_system SET Element = 0 WHERE familyID = 40; -- Avatar-Leviathan
UPDATE mob_family_system SET Element = 0 WHERE familyID = 41; -- Avatar-Odin
UPDATE mob_family_system SET Element = 0 WHERE familyID = 42; -- Avatar-Odin
UPDATE mob_family_system SET Element = 0 WHERE familyID = 43; -- Avatar-Ramuh
UPDATE mob_family_system SET Element = 0 WHERE familyID = 44; -- Avatar-Shiva
UPDATE mob_family_system SET Element = 0 WHERE familyID = 45; -- Avatar-Titan
UPDATE mob_family_system SET Element = 3 WHERE familyID = 46; -- Bat
UPDATE mob_family_system SET Element = 3 WHERE familyID = 47; -- Bat_Trio
UPDATE mob_family_system SET Element = 3 WHERE familyID = 48; -- Bee
UPDATE mob_family_system SET Element = 4 WHERE familyID = 49; -- Beetle
UPDATE mob_family_system SET Element = 6 WHERE familyID = 51; -- Behemoth
UPDATE mob_family_system SET `INT` = 3, `CHR` = 3, Element = 2 WHERE familyID = 52; -- Bhoot
UPDATE mob_family_system SET Element = 0 WHERE familyID = 53; -- Grimoire
UPDATE mob_family_system SET Element = 0 WHERE familyID = 54; -- Biotechnological
UPDATE mob_family_system SET Element = 1 WHERE familyID = 55; -- Bird
UPDATE mob_family_system SET `INT` = 5, `MND` = 4, `CHR` = 3, Element = 1 WHERE familyID = 56; -- Bomb
UPDATE mob_family_system SET Element = 2 WHERE familyID = 57; -- Buffalo
UPDATE mob_family_system SET Element = 1 WHERE familyID = 58; -- Bugard
UPDATE mob_family_system SET Element = 5 WHERE familyID = 59; -- Bugbear
UPDATE mob_family_system SET Element = 0 WHERE familyID = 60; -- CaitSith
UPDATE mob_family_system SET `INT` = 4, `MND` = 4, Element = 7 WHERE familyID = 61; -- Cardian
UPDATE mob_family_system SET Element = 1 WHERE familyID = 62; -- Cerberus
UPDATE mob_family_system SET Element = 0 WHERE familyID = 63; -- Chariot
UPDATE mob_family_system SET Element = 4 WHERE familyID = 64; -- Chigoe
UPDATE mob_family_system SET Element = 0 WHERE familyID = 65; -- Clionid
UPDATE mob_family_system SET Element = 6 WHERE familyID = 66; -- Slime-Clot
UPDATE mob_family_system SET Element = 6 WHERE familyID = 67; -- Slime-GlutinousClot
UPDATE mob_family_system SET Element = 1 WHERE familyID = 68; -- Cluster
UPDATE mob_family_system SET Element = 1 WHERE familyID = 69; -- Cluster
UPDATE mob_family_system SET DEF = 3, Element = 4 WHERE familyID = 70; -- Cockatrice
UPDATE mob_family_system SET Element = 5 WHERE familyID = 71; -- Coeurl
UPDATE mob_family_system SET Element = 3 WHERE familyID = 72; -- Colibri
UPDATE mob_family_system SET Element = 8 WHERE familyID = 73; -- Corpselights
UPDATE mob_family_system SET Element = 8 WHERE familyID = 74; -- Corse
UPDATE mob_family_system SET Element = 6 WHERE familyID = 75; -- Crab
UPDATE mob_family_system SET Element = 6 WHERE familyID = 76; -- Crab
UPDATE mob_family_system SET Element = 6 WHERE familyID = 77; -- Crab
UPDATE mob_family_system SET `STR` = 4, `INT` = 3, `MND` = 4, `CHR` = 7, Element = 0 WHERE familyID = 78; -- Craver
UPDATE mob_family_system SET Element = 4 WHERE familyID = 79; -- Crawler
UPDATE mob_family_system SET Element = 4 WHERE familyID = 80; -- Dhalmel
UPDATE mob_family_system SET Element = 3 WHERE familyID = 81; -- Diremite
UPDATE mob_family_system SET Element = 1 WHERE familyID = 82; -- Djinn
UPDATE mob_family_system SET Element = 2 WHERE familyID = 83; -- Doll
UPDATE mob_family_system SET Element = 2 WHERE familyID = 84; -- Doll
UPDATE mob_family_system SET Element = 2 WHERE familyID = 85; -- Doll
UPDATE mob_family_system SET Element = 8 WHERE familyID = 86; -- Doomed
UPDATE mob_family_system SET Element = 8 WHERE familyID = 87; -- Dragon
UPDATE mob_family_system SET `INT` = 4, `CHR` = 3, Element = 8 WHERE familyID = 88; -- Draugar
UPDATE mob_family_system SET `INT` = 4, `CHR` = 3, Element = 8 WHERE familyID = 89; -- Draugar
UPDATE mob_family_system SET Element = 0 WHERE familyID = 90; -- Dvergr
UPDATE mob_family_system SET Element = 0 WHERE familyID = 91; -- Dvergr_Skull
UPDATE mob_family_system SET Element = 0 WHERE familyID = 92; -- DynamisStatue-Goblin
UPDATE mob_family_system SET Element = 0 WHERE familyID = 93; -- DynamisStatue-Orc
UPDATE mob_family_system SET Element = 0 WHERE familyID = 94; -- DynamisStatue-Quadav
UPDATE mob_family_system SET Element = 0 WHERE familyID = 95; -- DynamisStatue-Yagudo
UPDATE mob_family_system SET Element = 5 WHERE familyID = 97; -- Lizard-Ice
UPDATE mob_family_system SET Element = 1 WHERE familyID = 98; -- Eft
UPDATE mob_family_system SET Element = 3 WHERE familyID = 99; -- Elemental-Air
UPDATE mob_family_system SET Element = 8 WHERE familyID = 100; -- Elemental-Dark
UPDATE mob_family_system SET Element = 4 WHERE familyID = 101; -- Elemental-Earth
UPDATE mob_family_system SET Element = 1 WHERE familyID = 102; -- Elemental-Fire
UPDATE mob_family_system SET Element = 2 WHERE familyID = 103; -- Elemental-Ice
UPDATE mob_family_system SET Element = 7 WHERE familyID = 104; -- Elemental-Light
UPDATE mob_family_system SET Element = 5 WHERE familyID = 105; -- Elemental-Lightning
UPDATE mob_family_system SET Element = 6 WHERE familyID = 106; -- Elemental-Water
UPDATE mob_family_system SET Element = 1 WHERE familyID = 107; -- Eruca
UPDATE mob_family_system SET Element = 1 WHERE familyID = 108; -- Eruca
UPDATE mob_family_system SET Element = 0 WHERE familyID = 109; -- Euvhi
UPDATE mob_family_system SET `INT` = 1, `MND` = 4, `CHR` = 2, Element = 3 WHERE familyID = 110; -- Evil_Weapon
UPDATE mob_family_system SET Element = 6 WHERE familyID = 112; -- Flan
UPDATE mob_family_system SET Element = 3 WHERE familyID = 113; -- Fly
UPDATE mob_family_system SET Element = 3 WHERE familyID = 114; -- Flytrap
UPDATE mob_family_system SET Element = 8 WHERE familyID = 115; -- Fomor
UPDATE mob_family_system SET Element = 8 WHERE familyID = 116; -- Funguar
UPDATE mob_family_system SET Element = 8 WHERE familyID = 117; -- Gargouille
UPDATE mob_family_system SET Element = 2 WHERE familyID = 118; -- Gargouille
UPDATE mob_family_system SET Element = 0 WHERE familyID = 119; -- Gear
UPDATE mob_family_system SET Element = 0 WHERE familyID = 120; -- Gear
UPDATE mob_family_system SET `INT` = 3, `CHR` = 3, Element = 2 WHERE familyID = 121; -- Ghost
UPDATE mob_family_system SET Element = 7 WHERE familyID = 122; -- Ghrah
UPDATE mob_family_system SET Element = 7 WHERE familyID = 123; -- Ghrah
UPDATE mob_family_system SET Element = 7 WHERE familyID = 124; -- Ghrah
UPDATE mob_family_system SET Element = 7 WHERE familyID = 125; -- Greater_Bird
UPDATE mob_family_system SET Element = 2 WHERE familyID = 126; -- Gigas
UPDATE mob_family_system SET Element = 2 WHERE familyID = 127; -- Gigas
UPDATE mob_family_system SET Element = 2 WHERE familyID = 128; -- Gigas
UPDATE mob_family_system SET Element = 2 WHERE familyID = 129; -- Gigas
UPDATE mob_family_system SET Element = 2 WHERE familyID = 130; -- Gigas
UPDATE mob_family_system SET Element = 8 WHERE familyID = 131; -- Gnat
UPDATE mob_family_system SET Element = 8 WHERE familyID = 132; -- Gnole
UPDATE mob_family_system SET Element = 1 WHERE familyID = 133; -- Goblin
UPDATE mob_family_system SET Element = 0 WHERE familyID = 134; -- God
UPDATE mob_family_system SET Element = 7 WHERE familyID = 135; -- Golem
UPDATE mob_family_system SET Element = 6 WHERE familyID = 136; -- Goobbue
UPDATE mob_family_system SET `STR` = 4, `INT` = 2, `MND` = 4, `CHR` = 4, Element = 0 WHERE familyID = 137; -- Gorger
UPDATE mob_family_system SET `STR` = 4, `INT` = 2, `MND` = 4, `CHR` = 4, Element = 0 WHERE familyID = 138; -- Gorger
UPDATE mob_family_system SET Element = 8 WHERE familyID = 139; -- Hecteyes
UPDATE mob_family_system SET Element = 7 WHERE familyID = 140; -- Hippogryph
UPDATE mob_family_system SET Element = 7 WHERE familyID = 141; -- Hippogryph-High_Res
UPDATE mob_family_system SET `CHR` = 3, Element = 8 WHERE familyID = 142; -- Hound
UPDATE mob_family_system SET `CHR` = 3, Element = 8 WHERE familyID = 143; -- Hound
UPDATE mob_family_system SET `MND` = 4, `CHR` = 5, Element = 0 WHERE familyID = 144; -- Hpemde
UPDATE mob_family_system SET Element = 0 WHERE familyID = 145; -- Humanoid-Elvaan
UPDATE mob_family_system SET Element = 0 WHERE familyID = 146; -- Humanoid-Galka
UPDATE mob_family_system SET Element = 0 WHERE familyID = 147; -- Humanoid-Galka
UPDATE mob_family_system SET Element = 0 WHERE familyID = 148; -- Humanoid-Galka
UPDATE mob_family_system SET Element = 0 WHERE familyID = 149; -- Humanoid-Hume
UPDATE mob_family_system SET Element = 0 WHERE familyID = 150; -- Humanoid-Hume
UPDATE mob_family_system SET Element = 0 WHERE familyID = 151; -- Humanoid-Mithra
UPDATE mob_family_system SET Element = 0 WHERE familyID = 152; -- Humanoid-Mithra
UPDATE mob_family_system SET Element = 0 WHERE familyID = 153; -- Humanoid-Tarutaru
UPDATE mob_family_system SET Element = 0 WHERE familyID = 154; -- Humanoid-Tarutaru
UPDATE mob_family_system SET Element = 0 WHERE familyID = 155; -- HybridElemental-Air
UPDATE mob_family_system SET Element = 0 WHERE familyID = 156; -- HybridElemental-Dark
UPDATE mob_family_system SET Element = 0 WHERE familyID = 157; -- HybridElemental-Earth
UPDATE mob_family_system SET Element = 0 WHERE familyID = 158; -- HybridElemental-Fire
UPDATE mob_family_system SET Element = 0 WHERE familyID = 159; -- HybridElemental-Ice
UPDATE mob_family_system SET Element = 0 WHERE familyID = 160; -- HybridElemental-Light
UPDATE mob_family_system SET Element = 0 WHERE familyID = 161; -- HybridElemental-Lightning
UPDATE mob_family_system SET Element = 0 WHERE familyID = 162; -- HybridElemental-Water
UPDATE mob_family_system SET Element = 6 WHERE familyID = 163; -- Hydra
UPDATE mob_family_system SET Element = 6 WHERE familyID = 164; -- Hydra
UPDATE mob_family_system SET `INT` = 3, `MND` = 7, `CHR` = 3, Element = 8 WHERE familyID = 165; -- Imp
UPDATE mob_family_system SET `INT` = 3, `MND` = 7, `CHR` = 3, Element = 8 WHERE familyID = 166; -- Imp
UPDATE mob_family_system SET Element = 4 WHERE familyID = 167; -- Karakul
UPDATE mob_family_system SET Element = 5 WHERE familyID = 168; -- Khimaira
UPDATE mob_family_system SET Element = 8 WHERE familyID = 169; -- Kindred
UPDATE mob_family_system SET Element = 3 WHERE familyID = 170; -- Ladybug
UPDATE mob_family_system SET Element = 8 WHERE familyID = 171; -- Lamiae
UPDATE mob_family_system SET Element = 6 WHERE familyID = 172; -- Leech
UPDATE mob_family_system SET Element = 0 WHERE familyID = 173; -- Limule
UPDATE mob_family_system SET Element = 1 WHERE familyID = 174; -- Lizard
UPDATE mob_family_system SET Element = 7 WHERE familyID = 175; -- Magic_Pot
UPDATE mob_family_system SET Element = 3 WHERE familyID = 176; -- Mamool_Ja
UPDATE mob_family_system SET Element = 3 WHERE familyID = 177; -- Mamool_Ja-Knight
UPDATE mob_family_system SET Element = 4 WHERE familyID = 178; -- Mandragora
UPDATE mob_family_system SET Element = 3 WHERE familyID = 179; -- Manticore
UPDATE mob_family_system SET Element = 4 WHERE familyID = 180; -- Marid
UPDATE mob_family_system SET Element = 0, detects = 2 WHERE familyID = 181; -- MemoryReceptacle
UPDATE mob_family_system SET Element = 6 WHERE familyID = 182; -- Merrow
UPDATE mob_family_system SET Element = 7 WHERE familyID = 183; -- Mimic
UPDATE mob_family_system SET Element = 5 WHERE familyID = 184; -- Moblin
UPDATE mob_family_system SET Element = 0 WHERE familyID = 185; -- Moogle
UPDATE mob_family_system SET Element = 4 WHERE familyID = 186; -- Morbol
UPDATE mob_family_system SET Element = 0 WHERE familyID = 187; -- Murex
UPDATE mob_family_system SET Element = 5 WHERE familyID = 188; -- Opo-opo
UPDATE mob_family_system SET Element = 1 WHERE familyID = 189; -- Orc
UPDATE mob_family_system SET Element = 1 WHERE familyID = 190; -- Orc-Warmachine
UPDATE mob_family_system SET Element = 6 WHERE familyID = 191; -- Orobon
UPDATE mob_family_system SET Element = 6 WHERE familyID = 192; -- Peiste
UPDATE mob_family_system SET `STR` = 2, `DEX` = 4, `MND` = 4, DEF = 2, EVA = 2, Element = 0 WHERE familyID = 193; -- Wyvern-Pet
UPDATE mob_family_system SET Element = 0 WHERE familyID = 194; -- Phuabo
UPDATE mob_family_system SET Element = 3 WHERE familyID = 195; -- Pixie
UPDATE mob_family_system SET Element = 6 WHERE familyID = 196; -- Poroggo
UPDATE mob_family_system SET Element = 6 WHERE familyID = 197; -- Pugil
UPDATE mob_family_system SET Element = 3 WHERE familyID = 198; -- Puk
UPDATE mob_family_system SET Element = 4 WHERE familyID = 199; -- Qiqirn
UPDATE mob_family_system SET Element = 6 WHERE familyID = 200; -- Quadav
UPDATE mob_family_system SET Element = 6 WHERE familyID = 201; -- Quadav
UPDATE mob_family_system SET Element = 6 WHERE familyID = 202; -- Quadav
UPDATE mob_family_system SET Element = 8 WHERE familyID = 203; -- Qutrub
UPDATE mob_family_system SET Element = 8 WHERE familyID = 204; -- Qutrub
UPDATE mob_family_system SET Element = 8 WHERE familyID = 205; -- Qutrub
UPDATE mob_family_system SET Element = 4 WHERE familyID = 206; -- Rabbit
UPDATE mob_family_system SET Element = 4 WHERE familyID = 207; -- Rafflesia
UPDATE mob_family_system SET Element = 4 WHERE familyID = 208; -- Ram
UPDATE mob_family_system SET Element = 5 WHERE familyID = 209; -- Rampart
UPDATE mob_family_system SET Element = 1 WHERE familyID = 210; -- Raptor
UPDATE mob_family_system SET Element = 2 WHERE familyID = 211; -- Ruszor
UPDATE mob_family_system SET Element = 6 WHERE familyID = 212; -- Sabotender
UPDATE mob_family_system SET Element = 6 WHERE familyID = 213; -- Sahagin
UPDATE mob_family_system SET Element = 4 WHERE familyID = 214; -- Sandworm
UPDATE mob_family_system SET Element = 4 WHERE familyID = 215; -- Sandworm
UPDATE mob_family_system SET Element = 4 WHERE familyID = 216; -- Sapling
UPDATE mob_family_system SET Element = 4 WHERE familyID = 217; -- Scorpion
UPDATE mob_family_system SET Element = 6 WHERE familyID = 218; -- Sea_Monk
UPDATE mob_family_system SET Element = 6 WHERE familyID = 219; -- Sea_Monk
UPDATE mob_family_system SET `STR` = 2, `INT` = 2, `MND` = 4, `CHR` = 4, Element = 0 WHERE familyID = 220; -- Seether
UPDATE mob_family_system SET Element = 8 WHERE familyID = 221; -- Shadow
UPDATE mob_family_system SET Element = 8 WHERE familyID = 222; -- Shadow
UPDATE mob_family_system SET Element = 8 WHERE familyID = 223; -- Shadow
UPDATE mob_family_system SET superFamily = 'Demon', Element = 8 WHERE familyID = 224; -- ShadowLord
UPDATE mob_family_system SET superFamily = 'Demon', Element = 8 WHERE familyID = 225; -- ShadowLord
UPDATE mob_family_system SET Element = 4 WHERE familyID = 226; -- Sheep
UPDATE mob_family_system SET `INT` = 4, `CHR` = 3, Element = 4 WHERE familyID = 227; -- Skeleton
UPDATE mob_family_system SET Element = 6 WHERE familyID = 228; -- Slime
UPDATE mob_family_system SET Element = 6 WHERE familyID = 229; -- Slime
UPDATE mob_family_system SET Element = 6 WHERE familyID = 230; -- Slime
UPDATE mob_family_system SET Element = 6 WHERE familyID = 231; -- Slug
UPDATE mob_family_system SET Element = 2 WHERE familyID = 232; -- Snoll
UPDATE mob_family_system SET Element = 6 WHERE familyID = 233; -- Soulflayer
UPDATE mob_family_system SET Element = 5 WHERE familyID = 234; -- Spheroid
UPDATE mob_family_system SET Element = 4 WHERE familyID = 235; -- Spider
UPDATE mob_family_system SET Element = 0 WHERE familyID = 236; -- Structure
UPDATE mob_family_system SET Element = 0 WHERE familyID = 237; -- Structure
UPDATE mob_family_system SET Element = 0 WHERE familyID = 238; -- Structure
UPDATE mob_family_system SET Element = 0 WHERE familyID = 239; -- Structure
UPDATE mob_family_system SET Element = 8 WHERE familyID = 240; -- Tauri
UPDATE mob_family_system SET `STR` = 4, `INT` = 2, `MND` = 4, `CHR` = 7, Element = 0 WHERE familyID = 241; -- Thinker
UPDATE mob_family_system SET Element = 5 WHERE familyID = 242; -- Tiger
UPDATE mob_family_system SET Element = 7 WHERE familyID = 243; -- Tonberry
UPDATE mob_family_system SET Element = 7 WHERE familyID = 244; -- Tonberry
UPDATE mob_family_system SET Element = 4 WHERE familyID = 245; -- Treant
UPDATE mob_family_system SET Element = 1 WHERE familyID = 246; -- Troll
UPDATE mob_family_system SET Element = 0 WHERE familyID = 247; -- Tubes
UPDATE mob_family_system SET Element = 0 WHERE familyID = 248; -- Turret-Orc
UPDATE mob_family_system SET Element = 0 WHERE familyID = 249; -- Turret-Quadav
UPDATE mob_family_system SET Element = 0 WHERE familyID = 250; -- Turret-Yagudo
UPDATE mob_family_system SET Element = 6 WHERE familyID = 251; -- Uragnite
UPDATE mob_family_system SET Element = 8 WHERE familyID = 252; -- Vampyr
UPDATE mob_family_system SET Element = 1 WHERE familyID = 253; -- Wamoura
UPDATE mob_family_system SET Element = 1 WHERE familyID = 254; -- Wamouracampa
UPDATE mob_family_system SET `STR` = 4, `INT` = 4, `MND` = 2, `CHR` = 4, Element = 0 WHERE familyID = 255; -- Wanderer
UPDATE mob_family_system SET `STR` = 4, `INT` = 4, `MND` = 2, `CHR` = 3, Element = 0 WHERE familyID = 256; -- Weeper
UPDATE mob_family_system SET Element = 4 WHERE familyID = 257; -- Wivre
UPDATE mob_family_system SET HP = 120, Element = 4 WHERE familyID = 258; -- Worm
UPDATE mob_family_system SET Element = 3 WHERE familyID = 259; -- Wyrm-Ouryu
UPDATE mob_family_system SET `STR` = 2, `MND` = 2, Element = 1 WHERE familyID = 260; -- Wyrm-Fafnir
UPDATE mob_family_system SET Element = 2 WHERE familyID = 261; -- Wyrm-Cynoprosopi
UPDATE mob_family_system SET Element = 1 WHERE familyID = 262; -- Wyrm
UPDATE mob_family_system SET Element = 1 WHERE familyID = 263; -- Wyrm-Nidhogg
UPDATE mob_family_system SET Element = 1 WHERE familyID = 264; -- Wyrm
UPDATE mob_family_system SET Element = 2 WHERE familyID = 265; -- Wyvern-Simorg
UPDATE mob_family_system SET `INT` = 2, `MND` = 5, `CHR` = 5, Element = 3 WHERE familyID = 266; -- Wyvern
UPDATE mob_family_system SET Element = 7 WHERE familyID = 267; -- Wyvern-Guivre
UPDATE mob_family_system SET Element = 8 WHERE familyID = 268; -- Wyvern-Undead
UPDATE mob_family_system SET Element = 0 WHERE familyID = 269; -- Xzomit
UPDATE mob_family_system SET Element = 3 WHERE familyID = 270; -- Yagudo
UPDATE mob_family_system SET EVA = 5, Element = 0 WHERE familyID = 271; -- Yovra
UPDATE mob_family_system SET Element = 0 WHERE familyID = 272; -- Zdei
UPDATE mob_family_system SET Element = 4 WHERE familyID = 273; -- Scorpion-Serket
UPDATE mob_family_system SET Element = 4 WHERE familyID = 274; -- Scorpion-KingV
UPDATE mob_family_system SET Element = 4 WHERE familyID = 275; -- Adamantoise-Mini
UPDATE mob_family_system SET HP = 120, Element = 4 WHERE familyID = 276; -- Worm-BigWorm
UPDATE mob_family_system SET Element = 6 WHERE familyID = 277; -- Adamantoise-Genbu
UPDATE mob_family_system SET Element = 7 WHERE familyID = 278; -- Wyvern-Seiryu
UPDATE mob_family_system SET Element = 5 WHERE familyID = 279; -- Tiger-Byakko
UPDATE mob_family_system SET Element = 7 WHERE familyID = 280; -- Greater_Bird-Suzaku
UPDATE mob_family_system SET Element = 3 WHERE familyID = 281; -- Manticore-Kirin
UPDATE mob_family_system SET Element = 7 WHERE familyID = 282; -- Kuluu-Grav_iton
UPDATE mob_family_system SET Element = 8 WHERE familyID = 284; -- Vampyr
UPDATE mob_family_system SET Element = 3 WHERE familyID = 285; -- Mamool_Ja
UPDATE mob_family_system SET Element = 3 WHERE familyID = 286; -- Puk-Vulpangue
UPDATE mob_family_system SET Element = 3 WHERE familyID = 287; -- Colibri-Chamrosh
UPDATE mob_family_system SET Element = 4 WHERE familyID = 288; -- Qiqirn-Cheese_Hoarder
UPDATE mob_family_system SET Element = 1 WHERE familyID = 289; -- Wamouracampa-BrassBorer
UPDATE mob_family_system SET Element = 6 WHERE familyID = 290; -- Slime-Claret
UPDATE mob_family_system SET Element = 0 WHERE familyID = 291; -- Ob
UPDATE mob_family_system SET Element = 8 WHERE familyID = 292; -- Velionis
UPDATE mob_family_system SET Element = 4 WHERE familyID = 293; -- Chigoe-Chigre
UPDATE mob_family_system SET Element = 6 WHERE familyID = 294; -- Apkallu-Small
UPDATE mob_family_system SET Element = 4 WHERE familyID = 295; -- IrizIma
UPDATE mob_family_system SET Element = 4 WHERE familyID = 296; -- Morbol-LividrootAmoo
UPDATE mob_family_system SET Element = 6 WHERE familyID = 297; -- Poroggo-IririSamariri
UPDATE mob_family_system SET Element = 8 WHERE familyID = 298; -- Dragon-Anantaboga
UPDATE mob_family_system SET Element = 6 WHERE familyID = 299; -- Botuli
UPDATE mob_family_system SET Element = 1 WHERE familyID = 300; -- Bomb-Reacton
UPDATE mob_family_system SET Element = 8 WHERE familyID = 301; -- Imp-Verdelet
UPDATE mob_family_system SET Element = 0 WHERE familyID = 302; -- Acrolith-Wulgaru
UPDATE mob_family_system SET Element = 8 WHERE familyID = 303; -- ZareehklTheJu
UPDATE mob_family_system SET Element = 0 WHERE familyID = 304; -- Gear-ArmedGears
UPDATE mob_family_system SET Element = 3 WHERE familyID = 305; -- Mamool_Ja-GotohZhaTheRe
UPDATE mob_family_system SET Element = 4 WHERE familyID = 306; -- Wivre-Dea
UPDATE mob_family_system SET Element = 1 WHERE familyID = 307; -- Wamoura-Achamoth
UPDATE mob_family_system SET Element = 1 WHERE familyID = 308; -- Troll-Khromasoul
UPDATE mob_family_system SET Element = 8 WHERE familyID = 309; -- Nosferatu
UPDATE mob_family_system SET Element = 8 WHERE familyID = 310; -- ExperimentalLa
UPDATE mob_family_system SET Element = 6 WHERE familyID = 311; -- Soulflayer-MahjlaefThePai
UPDATE mob_family_system SET Element = 6 WHERE familyID = 312; -- Orobon-Nuhn
UPDATE mob_family_system SET Element = 6 WHERE familyID = 313; -- Hydra-Tinnin
UPDATE mob_family_system SET Element = 1 WHERE familyID = 314; -- Cerberus-Sarameya
UPDATE mob_family_system SET Element = 5 WHERE familyID = 315; -- Khimaira-Tyger
UPDATE mob_family_system SET Element = 0 WHERE familyID = 316; -- Dvergr-Pandemonium
UPDATE mob_family_system SET Element = 0 WHERE familyID = 319; -- Avatar-Shiva
UPDATE mob_family_system SET Element = 0 WHERE familyID = 320; -- Avatar-Ramuh
UPDATE mob_family_system SET Element = 0 WHERE familyID = 321; -- Avatar-Titan
UPDATE mob_family_system SET Element = 0 WHERE familyID = 322; -- Avatar-Ifrit
UPDATE mob_family_system SET Element = 0 WHERE familyID = 323; -- Avatar-Leviathan
UPDATE mob_family_system SET Element = 0 WHERE familyID = 324; -- Avatar-Garuda
UPDATE mob_family_system SET Element = 0 WHERE familyID = 325; -- Avatar-Fenrir
UPDATE mob_family_system SET Element = 1 WHERE familyID = 326; -- Troll-Gurfurlur
UPDATE mob_family_system SET Element = 1 WHERE familyID = 327; -- Goblin
UPDATE mob_family_system SET Element = 2 WHERE familyID = 328; -- Gigas
UPDATE mob_family_system SET Element = 0 WHERE familyID = 329; -- AbsoluteVirtue
UPDATE mob_family_system SET Element = 6 WHERE familyID = 330; -- Adamantoise-PetGenbu
UPDATE mob_family_system SET Element = 7 WHERE familyID = 331; -- Wyvern-PetSeiryu
UPDATE mob_family_system SET Element = 5 WHERE familyID = 332; -- Tiger-PetByakko
UPDATE mob_family_system SET Element = 7 WHERE familyID = 333; -- Greater_Bird-PetSuzaku
UPDATE mob_family_system SET Element = 1 WHERE familyID = 334; -- Orc-NM
UPDATE mob_family_system SET `STR` = 3, `DEX` = 3, VIT = 3, `AGI` = 3, `INT` = 3, `MND` = 3, `CHR` = 3, Element = 0 WHERE familyID = 335; -- Maat
UPDATE mob_family_system SET Element = 7 WHERE familyID = 336; -- Tonberry-ZM4
UPDATE mob_family_system SET Element = 6 WHERE familyID = 337; -- Quadav-NM
UPDATE mob_family_system SET Element = 3 WHERE familyID = 338; -- Twitherym
UPDATE mob_family_system SET Element = 4 WHERE familyID = 339; -- Chapuli
UPDATE mob_family_system SET Element = 4 WHERE familyID = 340; -- Mantid
UPDATE mob_family_system SET Element = 4 WHERE familyID = 341; -- Blossom
UPDATE mob_family_system SET Element = 8 WHERE familyID = 342; -- Velkk
UPDATE mob_family_system SET Element = 5 WHERE familyID = 343; -- Heartwing
UPDATE mob_family_system SET Element = 6 WHERE familyID = 344; -- Cracklaw
UPDATE mob_family_system SET Element = 6 WHERE familyID = 345; -- Acuex
UPDATE mob_family_system SET Element = 4 WHERE familyID = 346; -- Obstacle-Knotted_Root
UPDATE mob_family_system SET Element = 7 WHERE familyID = 347; -- Marolith
UPDATE mob_family_system SET Element = 4 WHERE familyID = 348; -- Matamata
UPDATE mob_family_system SET Element = 4 WHERE familyID = 349; -- Geyser
UPDATE mob_family_system SET Element = 7 WHERE familyID = 350; -- Iron_Giant
UPDATE mob_family_system SET Element = 0 WHERE familyID = 351; -- Zilart
UPDATE mob_family_system SET Element = 0 WHERE familyID = 352; -- ArkAngel-EV
UPDATE mob_family_system SET Element = 0 WHERE familyID = 353; -- ArkAngel-GK
UPDATE mob_family_system SET Element = 0 WHERE familyID = 354; -- ArkAngel-HM
UPDATE mob_family_system SET Element = 0 WHERE familyID = 355; -- ArkAngel-MR
UPDATE mob_family_system SET Element = 0 WHERE familyID = 356; -- ArkAngel-TT
UPDATE mob_family_system SET Element = 8 WHERE familyID = 357; -- Antlion-Ambush
UPDATE mob_family_system SET Element = 8 WHERE familyID = 358; -- Kindred
UPDATE mob_family_system SET Element = 8 WHERE familyID = 359; -- Fomor
UPDATE mob_family_system SET Element = 3 WHERE familyID = 360; -- Yagudo-NM
UPDATE mob_family_system SET Element = 8 WHERE familyID = 361; -- DynamisLord
UPDATE mob_family_system SET Element = 6 WHERE familyID = 362; -- Sabotender-Florido
UPDATE mob_family_system SET Element = 0 WHERE familyID = 363; -- Automaton_Harlequin
UPDATE mob_family_system SET Element = 0 WHERE familyID = 364; -- Automaton_Valoredge
UPDATE mob_family_system SET Element = 0 WHERE familyID = 365; -- Automaton_Sharpshot
UPDATE mob_family_system SET Element = 0 WHERE familyID = 366; -- Automaton_Stormwaker
UPDATE mob_family_system SET Element = 2, detects = 289 WHERE familyID = 367; -- Doll-Faust
UPDATE mob_family_system SET Element = 2 WHERE familyID = 368; -- Doll-Despot
UPDATE mob_family_system SET Element = 6 WHERE familyID = 369; -- Leech
UPDATE mob_family_system SET Element = 4 WHERE familyID = 371; -- Marid
UPDATE mob_family_system SET Element = 6 WHERE familyID = 372; -- Crab
UPDATE mob_family_system SET Element = 5 WHERE familyID = 373; -- Goblin-Armored
UPDATE mob_family_system SET Element = 3 WHERE familyID = 374; -- Fly-DUP
UPDATE mob_family_system SET Element = 3 WHERE familyID = 375; -- Fly-Uncharmable
UPDATE mob_family_system SET Element = 1 WHERE familyID = 376; -- Raptor
UPDATE mob_family_system SET Element = 1 WHERE familyID = 377; -- Raptor
UPDATE mob_family_system SET Element = 0 WHERE familyID = 378; -- Avatar-Diabolos
UPDATE mob_family_system SET `STR` = 4, `DEX` = 4, VIT = 4, `AGI` = 4, `INT` = 4, `MND` = 4, `CHR` = 4, ATT = 2, Element = 0 WHERE familyID = 379; -- Pet-Carbuncle
UPDATE mob_family_system SET `STR` = 4, `DEX` = 4, VIT = 4, `AGI` = 4, `INT` = 4, `MND` = 4, `CHR` = 4, ATT = 2, Element = 0 WHERE familyID = 380; -- Pet-Diabolos
UPDATE mob_family_system SET `STR` = 4, `DEX` = 4, VIT = 4, `AGI` = 4, `INT` = 4, `MND` = 4, `CHR` = 4, ATT = 2, Element = 0 WHERE familyID = 381; -- Pet-Fenrir
UPDATE mob_family_system SET `STR` = 4, `DEX` = 4, VIT = 4, `AGI` = 4, `INT` = 4, `MND` = 4, `CHR` = 4, ATT = 2, Element = 0 WHERE familyID = 382; -- Pet-Garuda
UPDATE mob_family_system SET `STR` = 4, `DEX` = 4, VIT = 4, `AGI` = 4, `INT` = 4, `MND` = 4, `CHR` = 4, ATT = 2, Element = 0 WHERE familyID = 383; -- Pet-Ifrit
UPDATE mob_family_system SET `STR` = 4, `DEX` = 4, VIT = 4, `AGI` = 4, `INT` = 4, `MND` = 4, `CHR` = 4, ATT = 2, Element = 0 WHERE familyID = 384; -- Pet-Leviathan
UPDATE mob_family_system SET `STR` = 4, `DEX` = 4, VIT = 4, `AGI` = 4, `INT` = 4, `MND` = 4, `CHR` = 4, ATT = 2, Element = 0 WHERE familyID = 385; -- Pet-Odin
UPDATE mob_family_system SET `STR` = 4, `DEX` = 4, VIT = 4, `AGI` = 4, `INT` = 4, `MND` = 4, `CHR` = 4, ATT = 2, Element = 0 WHERE familyID = 386; -- Pet-Ramuh
UPDATE mob_family_system SET `STR` = 4, `DEX` = 4, VIT = 4, `AGI` = 4, `INT` = 4, `MND` = 4, `CHR` = 4, ATT = 2, Element = 0 WHERE familyID = 387; -- Pet-Shiva
UPDATE mob_family_system SET `STR` = 4, `DEX` = 4, VIT = 4, `AGI` = 4, `INT` = 4, `MND` = 4, `CHR` = 4, ATT = 2, Element = 0 WHERE familyID = 388; -- Pet-Titan
UPDATE mob_family_system SET `STR` = 4, `DEX` = 4, VIT = 4, `AGI` = 4, `INT` = 4, `MND` = 4, `CHR` = 4, ATT = 2, Element = 0 WHERE familyID = 389; -- Pet-Alexander
UPDATE mob_family_system SET Element = 3 WHERE familyID = 390; -- Ladybug-DUP
UPDATE mob_family_system SET Element = 8 WHERE familyID = 391; -- Wyrm-Vrtra
UPDATE mob_family_system SET Element = 5 WHERE familyID = 392; -- Wyrm-Jormungand
UPDATE mob_family_system SET Element = 1 WHERE familyID = 393; -- Wyrm-Tiamat
UPDATE mob_family_system SET Element = 0 WHERE familyID = 394; -- Humanoid-Hume
UPDATE mob_family_system SET Element = 2 WHERE familyID = 395; -- Doll-Calcabrina
UPDATE mob_family_system SET Element = 4 WHERE familyID = 396; -- Worm-Bedrock_Barry
UPDATE mob_family_system SET Element = 6 WHERE familyID = 397; -- Quadav-Qu_Vho_Deathhurler
UPDATE mob_family_system SET Element = 4 WHERE familyID = 398; -- Sheep-Slumbering_Samwell
UPDATE mob_family_system SET Element = 8 WHERE familyID = 399; -- Demon-Duke_Focalor
UPDATE mob_family_system SET Element = 6 WHERE familyID = 400; -- Crab-Tegmine
UPDATE mob_family_system SET Element = 2 WHERE familyID = 401; -- Doll-Martinet
UPDATE mob_family_system SET Element = 4 WHERE familyID = 402; -- Scorpion-Aqrabuamelu
UPDATE mob_family_system SET Element = 2 WHERE familyID = 403; -- Doll-Autarch
UPDATE mob_family_system SET Element = 4 WHERE familyID = 404; -- Rabbit-Cure
UPDATE mob_family_system SET Element = 4 WHERE familyID = 406; -- Mandragora-Seed_Mandra
UPDATE mob_family_system SET Element = 1 WHERE familyID = 407; -- Orc-Seed
UPDATE mob_family_system SET Element = 6 WHERE familyID = 408; -- Quadav-Seed
UPDATE mob_family_system SET Element = 3 WHERE familyID = 409; -- Yagudo-Seed
UPDATE mob_family_system SET Element = 1 WHERE familyID = 410; -- Goblin-Seed
UPDATE mob_family_system SET Element = 8 WHERE familyID = 435; -- Giant_Gnat
UPDATE mob_family_system SET Element = 8 WHERE familyID = 436; -- Gnat-Bloodlapper
UPDATE mob_family_system SET Element = 4 WHERE familyID = 437; -- Sapling-Ghillie_Dhu
UPDATE mob_family_system SET Element = 1 WHERE familyID = 438; -- Lizard-Highlander
UPDATE mob_family_system SET Element = 0 WHERE familyID = 444; -- Larzos
UPDATE mob_family_system SET Element = 0 WHERE familyID = 445; -- Portia
UPDATE mob_family_system SET Element = 0 WHERE familyID = 446; -- Ragelise
UPDATE mob_family_system SET Element = 2 WHERE familyID = 447; -- Dullahan
UPDATE mob_family_system SET Element = 3 WHERE familyID = 448; -- Fluturini
UPDATE mob_family_system SET Element = 3 WHERE familyID = 449; -- Bahamut
UPDATE mob_family_system SET Element = 0 WHERE familyID = 450; -- Caturae
UPDATE mob_family_system SET Element = 6 WHERE familyID = 451; -- Pteraketos
UPDATE mob_family_system SET Element = 6 WHERE familyID = 452; -- Rockfin
UPDATE mob_family_system SET Element = 4 WHERE familyID = 453; -- Rafflesia-Belladona
UPDATE mob_family_system SET Element = 1 WHERE familyID = 454; -- Tulfaire
UPDATE mob_family_system SET Element = 3 WHERE familyID = 455; -- Leafkin
UPDATE mob_family_system SET Element = 3 WHERE familyID = 456; -- Bztavian-Colkhab
UPDATE mob_family_system SET Element = 5 WHERE familyID = 457; -- Cehuetzi-Kumhau
UPDATE mob_family_system SET Element = 5 WHERE familyID = 458; -- Raaz
UPDATE mob_family_system SET Element = 5 WHERE familyID = 459; -- Yztarg
UPDATE mob_family_system SET Element = 1 WHERE familyID = 460; -- Waktza
UPDATE mob_family_system SET Element = 4 WHERE familyID = 461; -- Gabbrath
UPDATE mob_family_system SET Element = 1 WHERE familyID = 462; -- Wrong-Provenance_watcher
UPDATE mob_family_system SET Element = 3 WHERE familyID = 463; -- Panopt
UPDATE mob_family_system SET Element = 4 WHERE familyID = 464; -- Snapweed
UPDATE mob_family_system SET Element = 4 WHERE familyID = 465; -- Yumcax
UPDATE mob_family_system SET Element = 8 WHERE familyID = 467; -- Gallu
UPDATE mob_family_system SET Element = 0 WHERE familyID = 468; -- Umbril
UPDATE mob_family_system SET Element = 8 WHERE familyID = 469; -- Lamiae-Medusa
UPDATE mob_family_system SET Element = 3 WHERE familyID = 470; -- Zilant-Yilbegan
UPDATE mob_family_system SET Element = 7 WHERE familyID = 471; -- Harpeia
UPDATE mob_family_system SET Element = 2 WHERE familyID = 472; -- Naraka
UPDATE mob_family_system SET Element = 0 WHERE familyID = 473; -- Lady_Lilith
UPDATE mob_family_system SET Element = 8 WHERE familyID = 474; -- Lilith_Ascendant
UPDATE mob_family_system SET Element = 7 WHERE familyID = 475; -- Shinryu
UPDATE mob_family_system SET Element = 0 WHERE familyID = 476; -- Prishe
UPDATE mob_family_system SET Element = 0 WHERE familyID = 477; -- Selh\'teus
UPDATE mob_family_system SET Element = 0 WHERE familyID = 478; -- God
UPDATE mob_family_system SET mobradius = 6.0, speed = 60, Element = 6 WHERE familyID = 479; -- Behemoth-KB
UPDATE mob_family_system SET Element = 0 WHERE familyID = 480; -- Zeid
UPDATE mob_family_system SET Element = 0 WHERE familyID = 481; -- Ajido-Marujido
UPDATE mob_family_system SET Element = 0 WHERE familyID = 482; -- Volker
UPDATE mob_family_system SET Element = 0 WHERE familyID = 483; -- Trion
UPDATE mob_family_system SET Element = 0 WHERE familyID = 484; -- Lilisette
UPDATE mob_family_system SET Element = 0 WHERE familyID = 485; -- Hadesv1
UPDATE mob_family_system SET Element = 0 WHERE familyID = 486; -- Arciela
UPDATE mob_family_system SET Element = 0 WHERE familyID = 487; -- Hadesv2
UPDATE mob_family_system SET Element = 0 WHERE familyID = 488; -- Theodor
UPDATE mob_family_system SET Element = 5 WHERE familyID = 489; -- Darrcuiln
UPDATE mob_family_system SET Element = 0 WHERE familyID = 490; -- Plovid
UPDATE mob_family_system SET Element = 0 WHERE familyID = 491; -- Morimar
UPDATE mob_family_system SET Element = 0 WHERE familyID = 492; -- Defiant-Balamor
UPDATE mob_family_system SET Element = 0 WHERE familyID = 493; -- Macuil-Ashrakk
UPDATE mob_family_system SET Element = 5 WHERE familyID = 494; -- Coeurl-Sekhmet
UPDATE mob_family_system SET Element = 0 WHERE familyID = 495; -- Astral_Flow_Pet
UPDATE mob_family_system SET Element = 4 WHERE familyID = 496; -- Mandragora-Chaneque
UPDATE mob_family_system SET Element = 0 WHERE familyID = 497; -- Cloud_of_Darkness
UPDATE mob_family_system SET Element = 2 WHERE familyID = 498; -- Doll
UPDATE mob_family_system SET Element = 0 WHERE familyID = 499; -- Wanderer-Stray
UPDATE mob_family_system SET Element = 7 WHERE familyID = 500; -- Golem-Mokkurkalfi
UPDATE mob_family_system SET Element = 2 WHERE familyID = 501; -- Doll-Nio_A-Nio_Hum
UPDATE mob_family_system SET Element = 3 WHERE familyID = 502; -- Evil_Weapon-Shikigami
UPDATE mob_family_system SET Element = 0 WHERE familyID = 503; -- Mammet
UPDATE mob_family_system SET Element = 0 WHERE familyID = 504; -- Luopan
UPDATE mob_family_system SET Element = 4 WHERE familyID = 505; -- Fungi
UPDATE mob_family_system SET Element = 5 WHERE familyID = 506; -- Meeble
UPDATE mob_family_system SET Element = 0 WHERE familyID = 507; -- Quasilumin
UPDATE mob_family_system SET Element = 0 WHERE familyID = 411; -- Pet-Siren
INSERT INTO mob_family_system (familyID, family, superFamilyID, superFamily, ecosystemID, ecosystem, mobradius, speed, HP, MP, `STR`, `DEX`, VIT, `AGI`, `INT`, `MND`, `CHR`, ATT, DEF, ACC, EVA, Element, detects, charmable) VALUES (800, 'MemoryReceptacleENM', 0, 'undefined', 12, 'Empty', 2, 40, 200, 0, 1, 3, 5, 4, 2, 2, 5, 1, 3, 1, 3, 0, 256, 0); -- MemoryReceptacleENM
INSERT INTO mob_family_system (familyID, family, superFamilyID, superFamily, ecosystemID, ecosystem, mobradius, speed, HP, MP, `STR`, `DEX`, VIT, `AGI`, `INT`, `MND`, `CHR`, ATT, DEF, ACC, EVA, Element, detects, charmable) VALUES (801, 'Annihilated_Anthony', 28, 'Ghost', 19, 'Undead', 1, 40, 104, 140, 6, 3, 4, 4, 1, 5, 4, 1, 3, 1, 3, 2, 6, 0); -- Annihilated_Anthony
INSERT INTO mob_family_system (familyID, family, superFamilyID, superFamily, ecosystemID, ecosystem, mobradius, speed, HP, MP, `STR`, `DEX`, VIT, `AGI`, `INT`, `MND`, `CHR`, ATT, DEF, ACC, EVA, Element, detects, charmable) VALUES (802, 'Shredded_Samson', 28, 'Ghost', 19, 'Undead', 1, 40, 104, 140, 6, 3, 4, 4, 1, 5, 4, 1, 3, 1, 3, 2, 6, 0); -- Shredded_Samson
INSERT INTO mob_family_system (familyID, family, superFamilyID, superFamily, ecosystemID, ecosystem, mobradius, speed, HP, MP, `STR`, `DEX`, VIT, `AGI`, `INT`, `MND`, `CHR`, ATT, DEF, ACC, EVA, Element, detects, charmable) VALUES (803, 'Punctured_Percy', 28, 'Ghost', 19, 'Undead', 1, 40, 104, 140, 6, 3, 4, 4, 1, 5, 4, 1, 3, 1, 3, 2, 6, 0); -- Punctured_Percy
INSERT INTO mob_family_system (familyID, family, superFamilyID, superFamily, ecosystemID, ecosystem, mobradius, speed, HP, MP, `STR`, `DEX`, VIT, `AGI`, `INT`, `MND`, `CHR`, ATT, DEF, ACC, EVA, Element, detects, charmable) VALUES (804, 'Mauled_Murdock', 28, 'Ghost', 19, 'Undead', 1, 40, 104, 140, 6, 3, 4, 4, 1, 5, 4, 1, 3, 1, 3, 2, 6, 0); -- Mauled_Murdock
INSERT INTO mob_family_system (familyID, family, superFamilyID, superFamily, ecosystemID, ecosystem, mobradius, speed, HP, MP, `STR`, `DEX`, VIT, `AGI`, `INT`, `MND`, `CHR`, ATT, DEF, ACC, EVA, Element, detects, charmable) VALUES (805, 'Cockatrice_Ziz', 43, 'Cockatrice', 8, 'Bird', 1, 40, 118, 140, 4, 5, 3, 4, 4, 4, 4, 1, 3, 1, 5, 4, 1, 0); -- Cockatrice_Ziz

UNLOCK TABLES;
