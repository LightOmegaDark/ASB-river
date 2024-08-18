-- --------------------------------------------------------
-- AirSkyBoat Database Conversion File
-- --------------------------------------------------------

-- Fire V (Removal of OOE Spell)
DELETE FROM `mob_spell_lists` WHERE spell_id = 148 AND spell_list_name = "Beastmen_BLM";
DELETE FROM `mob_spell_lists` WHERE spell_id = 148 AND spell_list_name = "Hecteyes";
DELETE FROM `mob_spell_lists` WHERE spell_id = 148 AND spell_list_name = "Ahriman";
DELETE FROM `mob_spell_lists` WHERE spell_id = 148 AND spell_list_name = "Elemental_Fire";
DELETE FROM `mob_spell_lists` WHERE spell_id = 148 AND spell_list_name = "Undead";
DELETE FROM `mob_spell_lists` WHERE spell_id = 148 AND spell_list_name = "MagicPot";
DELETE FROM `mob_spell_lists` WHERE spell_id = 148 AND spell_list_name = "Disaster_Idol_Firesday";

-- Blizzard V (Removal of OOE Spell)
DELETE FROM `mob_spell_lists` WHERE spell_id = 153 AND spell_list_name = "Beastmen_BLM";
DELETE FROM `mob_spell_lists` WHERE spell_id = 153 AND spell_list_name = "Elemental_Ice";
DELETE FROM `mob_spell_lists` WHERE spell_id = 153 AND spell_list_name = "Undead";
DELETE FROM `mob_spell_lists` WHERE spell_id = 153 AND spell_list_name = "MagicPot";
DELETE FROM `mob_spell_lists` WHERE spell_id = 153 AND spell_list_name = "Disaster_Idol_Iceday";

-- Aero V (Removal of OOE Spell)
DELETE FROM `mob_spell_lists` WHERE spell_id = 158 AND spell_list_name = "Beastmen_BLM";
DELETE FROM `mob_spell_lists` WHERE spell_id = 158 AND spell_list_name = "Hecteyes";
DELETE FROM `mob_spell_lists` WHERE spell_id = 158 AND spell_list_name = "Ahriman";
DELETE FROM `mob_spell_lists` WHERE spell_id = 158 AND spell_list_name = "Elemental_Air";
DELETE FROM `mob_spell_lists` WHERE spell_id = 158 AND spell_list_name = "Undead";
DELETE FROM `mob_spell_lists` WHERE spell_id = 158 AND spell_list_name = "MagicPot";
DELETE FROM `mob_spell_lists` WHERE spell_id = 158 AND spell_list_name = "Disaster_Idol_Windsday";

-- Stone V (Removal of OOE Spell)
DELETE FROM `mob_spell_lists` WHERE spell_id = 163 AND spell_list_name = "Beastmen_BLM";
DELETE FROM `mob_spell_lists` WHERE spell_id = 163 AND spell_list_name = "Worm";
DELETE FROM `mob_spell_lists` WHERE spell_id = 163 AND spell_list_name = "Elemental_Earth";
DELETE FROM `mob_spell_lists` WHERE spell_id = 163 AND spell_list_name = "Undead";
DELETE FROM `mob_spell_lists` WHERE spell_id = 163 AND spell_list_name = "MagicPot";
DELETE FROM `mob_spell_lists` WHERE spell_id = 163 AND spell_list_name = "Tzee_Xicu_Idol";
DELETE FROM `mob_spell_lists` WHERE spell_id = 163 AND spell_list_name = "Disaster_Idol_Earthsday";
DELETE FROM `mob_spell_lists` WHERE spell_id = 163 AND spell_list_name = "Ghrah_Earth";

-- Thunder V (Removal of OOE Spell)
DELETE FROM `mob_spell_lists` WHERE spell_id = 168 AND spell_list_name = "Beastmen_BLM";
DELETE FROM `mob_spell_lists` WHERE spell_id = 168 AND spell_list_name = "Hecteyes";
DELETE FROM `mob_spell_lists` WHERE spell_id = 168 AND spell_list_name = "Ahriman";
DELETE FROM `mob_spell_lists` WHERE spell_id = 168 AND spell_list_name = "Elemental_Thunder";
DELETE FROM `mob_spell_lists` WHERE spell_id = 168 AND spell_list_name = "Undead";
DELETE FROM `mob_spell_lists` WHERE spell_id = 168 AND spell_list_name = "MagicPot";
DELETE FROM `mob_spell_lists` WHERE spell_id = 168 AND spell_list_name = "Disaster_Idol_Lightningsday";

-- Water V (Removal of OOE Spell)
DELETE FROM `mob_spell_lists` WHERE spell_id = 173 AND spell_list_name = "Beastmen_BLM";
DELETE FROM `mob_spell_lists` WHERE spell_id = 173 AND spell_list_name = "Hecteyes";
DELETE FROM `mob_spell_lists` WHERE spell_id = 173 AND spell_list_name = "Elemental_Water";
DELETE FROM `mob_spell_lists` WHERE spell_id = 173 AND spell_list_name = "Undead";
DELETE FROM `mob_spell_lists` WHERE spell_id = 173 AND spell_list_name = "MagicPot";
DELETE FROM `mob_spell_lists` WHERE spell_id = 173 AND spell_list_name = "Disaster_Idol_Watersday";
DELETE FROM `mob_spell_lists` WHERE spell_id = 173 AND spell_list_name = "Ghrah_Water";

-- Stonega IV (Removal of OOE Spell)
DELETE FROM `mob_spell_lists` WHERE spell_id = 192 AND spell_list_name = "Animated_Staff";

-- Regen IV (Removal of OOE Spell)
DELETE FROM `mob_spell_lists` WHERE spell_id = 477 AND spell_list_name = "Beastmen_WHM";
DELETE FROM `mob_spell_lists` WHERE spell_id = 477 AND spell_list_name = "Elemental_Light";

-- Cure VI (Removal of OOE Spell)
DELETE FROM `mob_spell_lists` WHERE spell_id = 6 AND spell_list_name = "Beastmen_WHM";
DELETE FROM `mob_spell_lists` WHERE spell_id = 6 AND spell_list_name = "Elemental_Light";

-- Aspir II -- TODO (Look into Dyna Casting)
DELETE FROM `mob_spell_lists` WHERE spell_id = 248 AND spell_list_name = "Beastmen_BLM";
DELETE FROM `mob_spell_lists` WHERE spell_id = 248 AND spell_list_name = "Undead";
DELETE FROM `mob_spell_lists` WHERE spell_id = 248 AND spell_list_name = "MagicPot";

-- Foe Requiem VII (Removal of OOE Spell)
DELETE FROM `mob_spell_lists` WHERE spell_id = 374 AND spell_list_name = "Beastmen_BRD";

-- Horde Lullby II (Removal of OOE Spell)
DELETE FROM `mob_spell_lists` WHERE spell_id = 377 AND spell_list_name = "Beastmen_BRD";

-- Army's Paeon VI (Removal of OOE Spell)
DELETE FROM `mob_spell_lists` WHERE spell_id = 383 AND spell_list_name = "Beastmen_BRD";

-- Utsusemi: San (Removal of OOE Spell)
DELETE FROM `mob_spell_lists` WHERE spell_id = 340 and spell_list_name = "Beastmen_NIN";

-- Beastmen_WHM Level Changes (1)
UPDATE `mob_spell_lists` SET max_level = 255 WHERE spell_list_id = 1 AND spell_id = 24; -- dia_ii
UPDATE `mob_spell_lists` SET max_level = 255 WHERE spell_list_id = 1 AND spell_id = 30; -- banish_iii
UPDATE `mob_spell_lists` SET max_level = 255 WHERE spell_list_id = 1 AND spell_id = 34; -- diaga_ii
UPDATE `mob_spell_lists` SET max_level = 255 WHERE spell_list_id = 1 AND spell_id = 39; -- banishga_ii

-- Beastmen_RDM Level Changes (3)
UPDATE `mob_spell_lists` SET max_level = 255 WHERE spell_list_id = 3 AND spell_id = 34; -- diaga_ii

-- Beastmen_NIN Level Changes (7)
UPDATE `mob_spell_lists` SET max_level = 255 WHERE spell_list_id = 7 AND spell_id = 345; -- hojo_ni
UPDATE `mob_spell_lists` SET max_level = 255 WHERE spell_list_id = 7 AND spell_id = 348; -- kurayami_ni
UPDATE `mob_spell_lists` SET max_level = 255 WHERE spell_list_id = 7 AND spell_id = 351; -- dokumori_ni

-- Mammet (29)
UPDATE `mob_spell_lists` SET min_level = 50 WHERE spell_list_id = 29 AND spell_id = 175; -- firaga_ii
UPDATE `mob_spell_lists` SET min_level = 50 WHERE spell_list_id = 29 AND spell_id = 180; -- blizzaga_ii
UPDATE `mob_spell_lists` SET min_level = 50 WHERE spell_list_id = 29 AND spell_id = 185; -- aeroga_ii
UPDATE `mob_spell_lists` SET min_level = 50 WHERE spell_list_id = 29 AND spell_id = 190; -- stonega_ii
UPDATE `mob_spell_lists` SET min_level = 50 WHERE spell_list_id = 29 AND spell_id = 195; -- thundaga_ii
UPDATE `mob_spell_lists` SET min_level = 50 WHERE spell_list_id = 29 AND spell_id = 200; -- waterga_ii

-- Vrtra (57)
INSERT INTO `mob_spell_lists` VALUES ('Vrtra', 57, 232, 1, 255); -- bio_iii

-- Ouryu (109)
UPDATE `mob_spell_lists` SET max_level = 80 WHERE spell_list_id = 109 AND spell_id = 190; -- stonega_ii
UPDATE `mob_spell_lists` SET max_level = 80 WHERE spell_list_id = 109 AND spell_id = 357; -- slowga
INSERT INTO `mob_spell_lists` VALUES ('Ouryu', 109, 191, 80, 255); -- stonega_iii
INSERT INTO `mob_spell_lists` VALUES ('Ouryu', 109, 255, 80, 255); -- break
INSERT INTO `mob_spell_lists` VALUES ('Ouryu', 109, 365, 80, 255); -- breakga

-- Race Runner (133)
INSERT INTO `mob_spell_lists` VALUES ('Race_Runner', 133, 157, 1, 255); -- aero_iv

-- Diabolos_Waking_Dream (149)
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Waking_Dream', 149, 232, 1, 255); -- Bio III
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Waking_Dream', 149, 254, 1, 255); -- Blind
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Waking_Dream', 149, 260, 1, 255); -- Dispel
INSERT INTO `mob_spell_lists` VALUES ('Diabolos_Waking_Dream', 149, 361, 1, 255); -- Blindga

-- Raubahn (213)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,513,1,255); -- venon_shell (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,515,1,255); -- maelstrom
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,517,1,255); -- metallic_body (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,519,1,255); -- screwdriver (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,521,1,255); -- mp_drainkiss (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,522,1,255); -- death_ray (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,524,1,255); -- sandspin (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,527,1,255); -- smite_of_rage (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,529,1,255); -- bludgeon (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,530,1,255); -- refueling (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,531,1,255); -- ice_break (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,532,1,255); -- blitzstrahl (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,533,1,255); -- self_destruct (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,534,1,255); -- mysterious_light (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,535,1,255); -- cold_wave (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,536,1,255); -- poison_breath (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,537,1,255); -- stinking_gas (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,528,1,255); -- memento_mori (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,539,1,255); -- terror_touch (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,540,1,255); -- spinal_cleave (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,541,1,255); -- blood_saber (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,542,1,255); -- digest (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,543,1,255); -- mandibular_bite (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,544,1,255); -- cursed_sphere (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,545,1,255); -- sickle_slash (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,547,1,255); -- cocoon (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,548,1,255); -- filamented_hold (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,549,1,255); -- pollen (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,551,1,255); -- power_attack (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,554,1,255); -- death_scissors (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,555,1,255); -- magnetite_cloud (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,560,1,255); -- frenetic_rip (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,561,1,255); -- frightful_roar (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,563,1,255); -- hecatomb_wave (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,564,1,255); -- body_slam (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,565,1,255); -- radiant_breath (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,567,1,255); -- helldive (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,569,1,255); -- jet_stream (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,570,1,255); -- blood_drain (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,572,1,255); -- sound_blast (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,573,1,255); -- feather_tickle (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,574,1,255); -- feather_barrier (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,575,1,255); -- jettatura (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,576,1,255); -- yawn (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,577,1,255); -- foot_kick (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,578,1,255); -- wild_carrot (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,579,1,255); -- voracious_trunk (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,581,1,255); -- healing_breeze (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,582,1,255); -- chaotic_eye (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,584,1,255); -- sheep_song (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,587,1,255); -- claw_cyclone (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,589,1,255); -- dimensional_death (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,592,1,255); -- blank_gaze (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,593,1,255); -- magic_fruit (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,594,1,255); -- uppercut (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,595,1,255); -- 1000_needles (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,596,1,255); -- pinecone_bomb (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,597,1,255); -- sprout_smack (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,598,1,255); -- soporific (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,599,1,255); -- queasyshroom (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,603,1,255); -- wild_oats (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,604,1,255); -- bad_breath (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,605,1,255); -- geist_wall (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,606,1,255); -- awful_eye (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,608,1,255); -- frost_breath (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,610,1,255); -- infrasonics (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,618,1,255); -- blastbomb (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,620,1,255); -- battledance (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,621,1,255); -- sandspray (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,622,1,255); -- grand_slam (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,623,1,255); -- head_butt (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,626,1,255); -- bomb_toss (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,628,1,255); -- frypan (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,629,1,255); -- flying_hip_press (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,631,1,255); -- hydro_shot (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,632,1,255); -- diamondhide (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,633,1,255); -- enervation (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,634,1,255); -- light_of_penance (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,636,1,255); -- warmup (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,637,1,255); -- firespit (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,638,1,255); -- feather_storm (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,640,1,255); -- tail_slap (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,641,1,255); -- hysteric_barage (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,642,1,255); -- amplification (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,643,1,255); -- cannonball (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,647,1,255); -- zephyr_mantle (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,648,1,255); -- regurgitation (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,650,1,255); -- seedspray (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,651,1,255); -- corrosive_ooze (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,652,1,255); -- spiral_spin (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Raubahn',213,653,1,255); -- asuran_claws (1~255)

-- TRUST_Zied_II (419)
UPDATE `mob_spell_lists` SET spell_list_name = 'TRUST_Zied_II' WHERE spell_list_id = 419 AND spell_id = 252; -- stun

-- Shikaree_X (464)
UPDATE `mob_spell_lists` SET min_level = 12 WHERE spell_list_id = 464 AND spell_id = 338; -- utsusemi_ichi
INSERT INTO `mob_spell_lists` VALUES ('Shikaree_X', 464, 321, 70, 255); -- katon_ni
INSERT INTO `mob_spell_lists` VALUES ('Shikaree_X', 464, 324, 70, 255); -- hyoton_ni
INSERT INTO `mob_spell_lists` VALUES ('Shikaree_X', 464, 327, 70, 255); -- huton_ni
INSERT INTO `mob_spell_lists` VALUES ('Shikaree_X', 464, 330, 70, 255); -- doton_ni
INSERT INTO `mob_spell_lists` VALUES ('Shikaree_X', 464, 333, 70, 255); -- raiton_ni
INSERT INTO `mob_spell_lists` VALUES ('Shikaree_X', 464, 336, 70, 255); -- suiton_ichi
INSERT INTO `mob_spell_lists` VALUES ('Shikaree_X', 464, 339, 70, 255); -- utsusemi_ni
INSERT INTO `mob_spell_lists` VALUES ('Shikaree_X', 464, 350, 1, 255); -- dokumori_ichi

-- Shikaree_Y (465) (Higher level spells for quest battlefields)
INSERT INTO `mob_spell_lists` VALUES ('Shikaree_Y', 465, 145, 70, 255); -- fire ii
INSERT INTO `mob_spell_lists` VALUES ('Shikaree_Y', 465, 150, 70, 255); -- blizzard ii
INSERT INTO `mob_spell_lists` VALUES ('Shikaree_Y', 465, 155, 70, 255); -- aero ii
INSERT INTO `mob_spell_lists` VALUES ('Shikaree_Y', 465, 160, 70, 255); -- stone ii
INSERT INTO `mob_spell_lists` VALUES ('Shikaree_Y', 465, 165, 70, 255); -- thunder ii
INSERT INTO `mob_spell_lists` VALUES ('Shikaree_Y', 465, 170, 70, 255); -- water ii

-- Ixzdei_BLM (467)
INSERT INTO `mob_spell_lists` VALUES ('Ixzdei_BLM',467,4,26,255);   -- cure_iv (26~255)
INSERT INTO `mob_spell_lists` VALUES ('Ixzdei_BLM',467,144,26,255); -- fire (26~255)
INSERT INTO `mob_spell_lists` VALUES ('Ixzdei_BLM',467,149,34,255); -- blizzard (34~255)
INSERT INTO `mob_spell_lists` VALUES ('Ixzdei_BLM',467,154,18,255); -- aero (18~255)
INSERT INTO `mob_spell_lists` VALUES ('Ixzdei_BLM',467,159,2,255);  -- stone (2~255)
INSERT INTO `mob_spell_lists` VALUES ('Ixzdei_BLM',467,164,42,255); -- thunder (42~255)
INSERT INTO `mob_spell_lists` VALUES ('Ixzdei_BLM',467,169,10,255); -- water (10~255)

-- Ixzdei_RDM (468)
INSERT INTO `mob_spell_lists` VALUES ('Ixzdei_RDM',468,25,1,255);  -- dia_iii (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Ixzdei_RDM',468,34,1,255);  -- diaga_ii (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Ixzdei_RDM',468,59,1,255);  -- silence (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Ixzdei_RDM',468,108,1,255); -- regen (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Ixzdei_RDM',468,112,1,255); -- flash (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Ixzdei_RDM',468,216,1,255); -- gravity (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Ixzdei_RDM',468,221,1,255); -- poison_ii (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Ixzdei_RDM',468,232,1,255); -- bio_iii (1~255)

-- Slendlix_Spindlethumb (498)
UPDATE `mob_spell_lists` SET spell_list_name = 'Slendlix_Spindlethumb' WHERE spell_list_id = 498 AND spell_id = 3; -- cure_iii
INSERT INTO `mob_spell_lists` VALUES ('Slendlix_Spindlethumb', 498, 23, 1, 255); -- Slendlix_Spindlethumb
INSERT INTO `mob_spell_lists` VALUES ('Slendlix_Spindlethumb', 498, 33, 1, 255); -- Slendlix_Spindlethumb

-- Air Pot (501)
INSERT INTO `mob_spell_lists` VALUES ('Air_Pot',501,59,1,255);  -- silence (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Air_Pot',501,102,1,255); -- enaero (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Air_Pot',501,157,1,255); -- aero_iv (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Air_Pot',501,186,1,255); -- aeroga_iii (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Air_Pot',501,208,1,255); -- tornado (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Air_Pot',501,237,1,255); -- choke (1~255)

-- Earth Pot (502)
INSERT INTO `mob_spell_lists` VALUES ('Earth_Pot',502,56,1,255);   -- slow (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Earth_Pot',502,103,1,255); -- enstone (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Earth_Pot',502,162,1,255); -- stone_iv (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Earth_Pot',502,191,1,255); -- stonega_iii (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Earth_Pot',502,210,1,255); -- quake (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Earth_Pot',502,238,1,255); -- rasp (1~255)

-- Ice pot (503)
INSERT INTO `mob_spell_lists` VALUES ('Ice_Pot',503,58,1,255);   -- paralyze (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Ice_Pot',503,101,1,255); -- enblizzard (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Ice_Pot',503,152,1,255); -- blizzard_iv (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Ice_Pot',503,181,1,255); -- blizzaga_iii (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Ice_Pot',503,206,1,255); -- blizzaga_iii (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Ice_Pot',503,236,1,255); -- frost (1~255)

-- Water Pot (504)
INSERT INTO `mob_spell_lists` VALUES ('Water_Pot',504,105,1,255); -- enwater (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Water_Pot',504,172,1,255); -- water_iv (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Water_Pot',504,201,1,255); -- waterga_iii (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Water_Pot',504,214,1,255); -- flood (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Water_Pot',504,221,1,255); -- poison_ii (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Water_Pot',504,240,1,255);  -- drown (1~255)

-- Thunder Pot (505)
INSERT INTO `mob_spell_lists` VALUES ('Thunder_Pot',505,104,1,255); -- enthunder (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Thunder_Pot',505,167,1,255); -- thunder_iv (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Thunder_Pot',505,196,1,255); -- thundaga_iii (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Thunder_Pot',505,212,1,255); -- burst (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Thunder_Pot',505,239,1,255); -- shock (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Thunder_Pot',505,252,1,255); -- stun (1~255)

-- Fire Pot (506)
INSERT INTO `mob_spell_lists` VALUES ('Fire_Pot',506,100,1,255); -- enfire (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Fire_Pot',506,147,1,255); -- fire_iv (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Fire_Pot',506,176,1,255); -- firaga_iii (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Fire_Pot',506,204,1,255); -- flare (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Fire_Pot',506,235,1,255);  -- burn (1~255)

-- Bloody Coffin (507)
INSERT INTO `mob_spell_lists` VALUES ('Bloody_Coffin',507,34,1,255);   -- Diaga II (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Bloody_Coffin',507,56,1,255);   -- Slow (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Bloody_Coffin',507,57,1,255);   -- Haste (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Bloody_Coffin',507,58,1,255);   -- Paralyze (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Bloody_Coffin',507,105,1,255);  -- Enwater (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Bloody_Coffin',507,108,1,255);  -- Regen (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Bloody_Coffin',507,231,1,255);  -- Bio II (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Bloody_Coffin',507,250,1,255);  -- Ice Spikes (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Bloody_Coffin',507,254,1,255);  -- Blind (1~255)

-- Cemetery Cherry (508)
INSERT INTO `mob_spell_lists` VALUES ('Cemetery_Cherry',508,274,1,255); -- Sleepga II
INSERT INTO `mob_spell_lists` VALUES ('Cemetery_Cherry',508,356,1,255); -- Paralyga
INSERT INTO `mob_spell_lists` VALUES ('Cemetery_Cherry',508,366,1,255); -- Graviga

-- Gargoyle Magic (509)
INSERT INTO `mob_spell_lists` VALUES ('Gargoyle_Magic',509,59,1,255); -- Silence (1~255)

-- Gargoyle Physical (510)
INSERT INTO `mob_spell_lists` VALUES ('Gargoyle_Phys',510,251,1,255); -- Shock Spikes (1~255)

-- Dynamis
-- Era_Beastmen_BLM
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,144,13,22);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,145,38,47);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,146,62,67);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,147,73,85);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,149,17,27);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,150,42,53);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,151,64,68);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,152,74,88);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,154,9,18);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,155,34,44);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,156,59,66);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,157,72,82);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,159,1,10);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,160,26,35);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,161,51,60);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,162,68,73);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,164,21,46);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,165,46,55);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,166,66,70);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,167,75,92);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,169,5,12);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,170,30,40);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,171,55,61);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,172,70,78);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,174,28,35);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,175,53,60);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,176,69,90);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,179,32,39);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,180,57,62);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,181,71,255);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,184,23,31);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,185,48,56);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,186,67,71);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,189,15,22);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,190,40,47);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,191,63,67);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,194,36,43);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,195,61,65);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,196,73,255);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,199,19,27);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,200,44,52);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,201,65,255);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,204,60,255);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,206,50,255);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,208,52,255);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,210,54,255);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,212,56,255);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,214,58,255);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,220,3,17);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,221,43,64);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,225,24,71);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,226,72,255);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,230,10,34);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,231,35,59);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,232,60,255);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,235,24,255);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,236,22,255);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,237,20,255);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,238,18,255);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,239,16,255);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,240,27,255);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,245,12,255);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,247,25,82);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,249,10,255);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,252,45,255);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,253,20,40);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,254,4,255);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,258,7,255);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,259,41,255);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,273,31,55);
REPLACE INTO `mob_spell_lists` VALUES ('Era_Beastmen_BLM',5000,274,56,255);

-- Goublefaupe
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,1,3,13);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,2,14,25);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,3,26,48);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,4,48,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,23,1,30);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,24,31,59);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,25,60,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,33,15,54);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,34,55,70);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,35,71,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,43,7,26);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,44,27,46);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,45,47,62);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,46,63,76);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,47,80,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,48,17,36);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,49,37,56);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,50,57,67);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,51,68,86);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,52,87,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,53,23,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,54,34,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,55,12,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,56,13,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,57,48,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,58,6,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,59,18,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,100,24,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,101,22,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,102,20,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,103,18,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,104,16,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,105,27,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,108,21,75);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,110,80,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,144,19,49);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,145,50,70);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,146,71,85);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,147,86,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,149,24,54);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,150,55,72);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,151,73,88);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,152,89,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,154,14,44);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,155,45,68);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,156,69,82);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,157,83,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,159,4,34);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,160,35,64);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,161,65,76);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,162,77,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,164,29,59);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,165,60,74);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,166,75,91);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,167,89,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,169,9,39);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,170,40,66);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,171,67,88);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,172,80,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,216,21,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,220,5,45);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,221,46,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,230,10,35);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,231,36,70);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,232,71,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,253,25,45);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,254,8,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,258,11,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,259,46,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,260,32,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,112,32,255);
REPLACE INTO `mob_spell_lists` VALUES ('Goublefaupe',5001,97,32,255);

-- Quieitiel
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,144,13,22);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,145,38,47);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,146,62,67);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,147,73,85);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,149,17,27);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,150,42,53);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,151,64,68);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,152,74,88);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,154,9,18);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,155,34,44);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,156,59,66);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,157,72,82);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,159,1,10);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,160,26,35);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,161,51,60);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,162,68,73);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,164,21,46);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,165,46,55);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,166,66,70);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,167,75,92);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,169,5,12);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,170,30,40);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,171,55,61);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,172,70,78);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,174,28,35);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,175,53,60);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,176,69,90);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,179,32,39);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,180,57,62);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,181,71,255);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,184,23,31);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,185,48,56);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,186,67,71);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,189,15,22);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,190,40,47);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,191,63,67);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,194,36,43);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,195,61,65);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,196,73,255);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,199,19,27);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,200,44,52);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,201,65,255);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,204,60,255);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,206,50,255);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,208,52,255);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,210,54,255);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,212,56,255);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,214,58,255);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,220,3,17);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,221,43,64);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,225,24,71);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,226,72,255);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,230,10,34);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,231,35,59);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,232,60,255);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,235,24,255);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,236,22,255);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,237,20,255);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,238,18,255);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,239,16,255);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,240,27,255);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,245,12,255);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,247,25,82);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,248,83,255);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,249,10,255);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,252,45,255);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,253,20,40);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,254,4,255);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,258,7,255);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,259,41,255);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,273,31,55);
REPLACE INTO `mob_spell_lists` VALUES ('Quieitiel',5002,274,56,255);

-- Blackbeard (5021)
INSERT INTO `mob_spell_lists` VALUES('Blackbeard', 5021, 166, 1, 255); -- thunder iii
INSERT INTO `mob_spell_lists` VALUES('Blackbeard', 5021, 195, 1, 255); -- thundaga ii
INSERT INTO `mob_spell_lists` VALUES('Blackbeard', 5021, 201, 1, 255); -- waterga iii
INSERT INTO `mob_spell_lists` VALUES('Blackbeard', 5021, 206, 1, 255); -- freeze
INSERT INTO `mob_spell_lists` VALUES('Blackbeard', 5021, 212, 1, 255); -- burst
INSERT INTO `mob_spell_lists` VALUES('Blackbeard', 5021, 214, 1, 255); -- flood
INSERT INTO `mob_spell_lists` VALUES('Blackbeard', 5021, 250, 1, 255); -- ice spikes
INSERT INTO `mob_spell_lists` VALUES('Blackbeard', 5021, 252, 1, 255); -- stun
INSERT INTO `mob_spell_lists` VALUES('Blackbeard', 5021, 274, 1, 255); -- sleepga ii

-- Silverhook (5022)
INSERT INTO `mob_spell_lists` VALUES('Silverhook', 5022, 151, 1, 255); -- blizzard iii
INSERT INTO `mob_spell_lists` VALUES('Silverhook', 5022, 180, 1, 255); -- blizzaga ii
INSERT INTO `mob_spell_lists` VALUES('Silverhook', 5022, 201, 1, 255); -- waterga iii
INSERT INTO `mob_spell_lists` VALUES('Silverhook', 5022, 206, 1, 255); -- freeze
INSERT INTO `mob_spell_lists` VALUES('Silverhook', 5022, 212, 1, 255); -- burst
INSERT INTO `mob_spell_lists` VALUES('Silverhook', 5022, 214, 1, 255); -- flood
INSERT INTO `mob_spell_lists` VALUES('Silverhook', 5022, 250, 1, 255); -- ice spikes
INSERT INTO `mob_spell_lists` VALUES('Silverhook', 5022, 252, 1, 255); -- stun
INSERT INTO `mob_spell_lists` VALUES('Silverhook', 5022, 253, 1, 255); -- sleep
INSERT INTO `mob_spell_lists` VALUES('Silverhook', 5022, 274, 1, 255); -- sleepga ii

-- Aries (5023)
INSERT INTO `mob_spell_lists` VALUES('Kurrea', 5023, 54, 1, 255);  -- stoneskin (1~255)
INSERT INTO `mob_spell_lists` VALUES('Kurrea', 5023, 356, 1, 255); -- paralyga (1~255)

-- Jailer of Love (Light) (493)
INSERT INTO `mob_spell_lists` VALUES ('Jailer_of_Love_Light',5024,21,1,255); -- Holy (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Jailer_of_Love_Light',5024,30,1,255); -- Banish III (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Jailer_of_Love_Light',5024,35,1,255); -- Diaga III (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Jailer_of_Love_Light',5024,40,1,255); -- Banishga III (1~255)

-- Jailer of Love (Fire) (494)
INSERT INTO `mob_spell_lists` VALUES ('Jailer_of_Love_Fire',5025,147,1,255); -- Fire IV (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Jailer_of_Love_Fire',5025,176,1,255); -- Firaga III (1~255)

-- Jailer of Love (Ice) (495)
INSERT INTO `mob_spell_lists` VALUES ('Jailer_of_Love_Ice',5026,152,1,255); -- Blizzard IV (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Jailer_of_Love_Ice',5026,181,1,255); -- Blizzaga III (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Jailer_of_Love_Ice',5026,362,1,255); -- Bindga (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Jailer_of_Love_Ice',5026,356,1,255); -- Paralyga (1~255)

-- Jailer of Love (Wind) (496)
INSERT INTO `mob_spell_lists` VALUES ('Jailer_of_Love_Wind',5027,157,1,255); -- Aero IV (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Jailer_of_Love_Wind',5027,186,1,255); -- Aeroga III (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Jailer_of_Love_Wind',5027,359,1,255); -- Silencega (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Jailer_of_Love_Wind',5027,366,1,255); -- Graviga (1~255)

-- Jailer of Love (Earth) (497)
INSERT INTO `mob_spell_lists` VALUES ('Jailer_of_Love_Earth',5028,162,1,255); -- Stone IV (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Jailer_of_Love_Earth',5028,191,1,255); -- Stonega III (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Jailer_of_Love_Earth',5028,357,1,255); -- Slowga (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Jailer_of_Love_Earth',5028,365,1,255); -- Breakga (1~255)

-- Jailer of Love (Thunder )(498)
INSERT INTO `mob_spell_lists` VALUES ('Jailer_of_Love_Lightning',5029,167,1,255); -- Thunder IV (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Jailer_of_Love_Lightning',5029,196,1,255); -- Thundaga III (1~255)

-- Jailer of Love (Water) (499)
INSERT INTO `mob_spell_lists` VALUES('Jailer_of_Love_Water',5030,172,1,255); -- Water IV (1~255)
INSERT INTO `mob_spell_lists` VALUES('Jailer_of_Love_Water',5030,201,1,255); -- Waterga III (1~255)
INSERT INTO `mob_spell_lists` VALUES('Jailer_of_Love_Water',5030,226,1,255); -- Poisonga II (1~255)

-- Jailer of Love (Dark) (500)
INSERT INTO `mob_spell_lists` VALUES ('Jailer_of_Love_Dark',5031,232,1,255); -- Bio III (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Jailer_of_Love_Dark',5031,274,1,255); -- Sleepga II (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Jailer_of_Love_Dark',5031,360,1,255); -- Dispelga (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Jailer_of_Love_Dark',5031,361,1,255); -- Blindga (1~255)

-- Ullikummi (5032)
INSERT INTO `mob_spell_lists` VALUES('Ullikummi', 5032, 34, 1, 255); -- Diaga II
INSERT INTO `mob_spell_lists` VALUES('Ullikummi', 5032, 40, 1, 255); -- Banishga III
INSERT INTO `mob_spell_lists` VALUES('Ullikummi', 5032, 112, 1, 255); -- Flash

-- Toxic Tamlyn (5033)
INSERT INTO `mob_spell_lists` VALUES ('Toxic_Tamlyn',5033,231,1,255);

-- Bastet (5034)
INSERT INTO `mob_spell_lists` VALUES('Bastet', 5034, 165, 1, 255); -- thunder ii (1~255)
INSERT INTO `mob_spell_lists` VALUES('Bastet', 5034, 195, 1, 255); -- thundaga ii (1~255)
INSERT INTO `mob_spell_lists` VALUES('Bastet', 5034, 212, 1, 255); -- burst (1~255)
INSERT INTO `mob_spell_lists` VALUES('Bastet', 5034, 239, 1, 255); -- shock (1~255)
INSERT INTO `mob_spell_lists` VALUES('Bastet', 5034, 251, 1, 255); -- shock spikes (1~255)
INSERT INTO `mob_spell_lists` VALUES('Bastet', 5034, 252, 1, 255); -- stun (1~255)

-- Noble Mold (5035)
INSERT INTO `mob_spell_lists` VALUES('Noble_Mold', 5035, 55, 1, 255); -- aquaveil (1~255)
INSERT INTO `mob_spell_lists` VALUES('Noble_Mold', 5035, 105, 1, 255); -- enwater (1~255)
INSERT INTO `mob_spell_lists` VALUES('Noble_Mold', 5035, 170, 1, 255); -- water ii (1~255)
INSERT INTO `mob_spell_lists` VALUES('Noble_Mold', 5035, 200, 1, 255); -- waterga ii (1~255)
INSERT INTO `mob_spell_lists` VALUES('Noble_Mold', 5035, 221, 1, 255); -- poison ii (1~255)
INSERT INTO `mob_spell_lists` VALUES('Noble_Mold', 5035, 240, 1, 255); -- drown (1~255)

-- Sacrificial Goblet (5036)
INSERT INTO `mob_spell_lists` VALUES('Sacrificial_Goblet', 5036, 204, 1, 255); -- flare (1~255)
INSERT INTO `mob_spell_lists` VALUES('Sacrificial_Goblet', 5036, 206, 1, 255); -- freeze (1~255)
INSERT INTO `mob_spell_lists` VALUES('Sacrificial_Goblet', 5036, 208, 1, 255); -- tornado (1~255)
INSERT INTO `mob_spell_lists` VALUES('Sacrificial_Goblet', 5036, 210, 1, 255); -- quake (1~255)
INSERT INTO `mob_spell_lists` VALUES('Sacrificial_Goblet', 5036, 212, 1, 255); -- burst (1~255)
INSERT INTO `mob_spell_lists` VALUES('Sacrificial_Goblet', 5036, 214, 1, 255); -- flood (1~255)
INSERT INTO `mob_spell_lists` VALUES('Sacrificial_Goblet', 5036, 245, 1, 255); -- drain (1~255)
INSERT INTO `mob_spell_lists` VALUES('Sacrificial_Goblet', 5036, 247, 1, 255); -- aspir (1~255)
INSERT INTO `mob_spell_lists` VALUES('Sacrificial_Goblet', 5036, 226, 1, 255); -- poisonga ii (1~255)

-- Pyuu the Spatemaker (5037)
INSERT INTO `mob_spell_lists` VALUES('PyuuTheSpatemaker',5037,201,1,255); -- waterga iii (1~255)
INSERT INTO `mob_spell_lists` VALUES('PyuuTheSpatemaker',5037,172,1,255); -- water iv (1~255)

-- Mucoid Mass (5038)
INSERT INTO `mob_spell_lists` VALUES('Mucoid_Mass', 5038, 242, 1, 255); -- absorb-acc (1~255)

-- Geush Urvan (5039)
INSERT INTO `mob_spell_lists` VALUES('Geush_Urvan', 5039, 152, 1, 255); -- blizzard iv (1~255)
INSERT INTO `mob_spell_lists` VALUES('Geush_Urvan', 5039, 181, 1, 255); -- blizzaga iii (1~255)
INSERT INTO `mob_spell_lists` VALUES('Geush_Urvan', 5039, 356, 1, 255); -- paralyga (1~255)
INSERT INTO `mob_spell_lists` VALUES('Geush_Urvan', 5039, 362, 1, 255); -- bindga (1~255)

-- Donnergugi (5040)
INSERT INTO `mob_spell_lists` VALUES('Donnergugi', 5040, 161, 1, 255); -- stone iii (1~255)
INSERT INTO `mob_spell_lists` VALUES('Donnergugi', 5040, 190, 1, 255); -- stonega ii (1~255)
INSERT INTO `mob_spell_lists` VALUES('Donnergugi', 5040, 238, 1, 255); -- rasp (1~255)

-- Gration (5041)
INSERT INTO `mob_spell_lists` VALUES('Gration', 5041, 57, 1, 255);  -- haste (1~255)
INSERT INTO `mob_spell_lists` VALUES('Gration', 5041, 104, 1, 255); -- enthunder (1~255)
INSERT INTO `mob_spell_lists` VALUES('Gration', 5041, 167, 1, 255); -- thunder iv (1~255)
INSERT INTO `mob_spell_lists` VALUES('Gration', 5041, 196, 1, 255); -- thundaga iii (1~255)
INSERT INTO `mob_spell_lists` VALUES('Gration', 5041, 212, 1, 255); -- burst (1~255)
INSERT INTO `mob_spell_lists` VALUES('Gration', 5041, 251, 1, 255); -- shock spikes (1~255)

-- Amaltheia (5042)
INSERT INTO `mob_spell_lists` VALUES('Amaltheia', 5042, 5, 1, 255);  -- cure v (1~255)
INSERT INTO `mob_spell_lists` VALUES('Amaltheia', 5042, 31, 1, 255); -- banish iv (1~255)
INSERT INTO `mob_spell_lists` VALUES('Amaltheia', 5042, 40, 1, 255); -- banishga iii (1~255)

-- Kurrea (5043)
INSERT INTO `mob_spell_lists` VALUES('Kurrea', 5043, 157, 1, 255); -- aero iv (1~255)
INSERT INTO `mob_spell_lists` VALUES('Kurrea', 5043, 186, 1, 255); -- aeroga iii (1~255)
INSERT INTO `mob_spell_lists` VALUES('Kurrea', 5043, 208, 1, 255); -- tornado (1~255)
INSERT INTO `mob_spell_lists` VALUES('Kurrea', 5043, 359, 1, 255); -- silencega (1~255)
INSERT INTO `mob_spell_lists` VALUES('Kurrea', 5043, 366, 1, 255); -- graviga (1~255)

-- Caithleann (5044)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,24,31,59);   -- dia_ii (31~59)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,34,55,70);   -- diaga_ii (55~70)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,45,47,62);   -- protect_iii (47~62)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,50,57,67);   -- shell_iii (57~67)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,54,34,255);  -- stoneskin (34~255)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,55,12,255);  -- aquaveil (12~255)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,57,48,255);  -- haste (48~255)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,59,18,255);  -- silence (18~255)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,100,24,255); -- enfire (24~255)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,101,22,255); -- enblizzard (22~255)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,102,20,255); -- enaero (20~255)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,103,18,255); -- enstone (18~255)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,104,16,255); -- enthunder (16~255)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,105,27,255); -- enwater (27~255)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,108,21,75);  -- regen (21~75)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,216,21,255); -- gravity (21~255)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,221,46,255); -- poison_ii (46~255)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,231,36,70);  -- bio_ii (36~70)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,253,25,45);  -- sleep (25~45)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,258,11,255); -- bind (11~255)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,259,46,255); -- sleep_ii (46~255)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,260,32,255); -- dispel (32~255)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,321,40,72);  -- katon_ni (40~72)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,324,40,72);  -- hyoton_ni (40~72)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,327,40,72);  -- huton_ni (40~72)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,330,40,72);  -- doton_ni (40~72)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,333,40,72);  -- raiton_ni (40~72)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,336,40,72);  -- suiton_ni (40~72)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,339,37,72);  -- utsusemi_ni (37~72)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,341,30,64);  -- jubaku_ichi (30~64)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,345,48,75);  -- hojo_ni (48~75)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,348,44,72);  -- kurayami_ni (44~72)
INSERT INTO `mob_spell_lists` VALUES ('Caithleann',5044,351,56,74);  -- dokumori_ni (56~74)

-- Indich (5045)
INSERT INTO `mob_spell_lists` VALUES('Indich',5045,112,1,255); -- flash (1~255)
INSERT INTO `mob_spell_lists` VALUES('Indich',5045,376,1,255); -- horde_lullaby (1~255)
INSERT INTO `mob_spell_lists` VALUES('Indich',5045,463,1,255); -- foe_lullaby (1~255)

-- Pilwiz (5046)
INSERT INTO `mob_spell_lists` VALUES('Pilwiz', 5046, 190, 1, 255); -- Stonega II (1~255)

-- Generic Doll (5047)
INSERT INTO `mob_spell_lists` VALUES('Generic_Doll', 5047, 194, 1, 255); -- Thundaga (1~255)
INSERT INTO `mob_spell_lists` VALUES('Generic_Doll', 5047, 251, 1, 255); -- Shock Spikes (1~255)
INSERT INTO `mob_spell_lists` VALUES('Generic_Doll', 5047, 356, 1, 255); -- Paralyga (1~255)

-- Hazmat (5048)
INSERT INTO `mob_spell_lists` VALUES ('Hazmat',5048,204,1,255); -- flare (1~255)

-- Lii Jixa the Somnolist (5049)
INSERT INTO `mob_spell_lists` VALUES ('Lii_Jixa_the_Somnolist',5049,3,1,255);  -- cure_iii (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Lii_Jixa_the_Somnolist',5049,29,1,255); -- banish_ii (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Lii_Jixa_the_Somnolist',5049,98,1,255); -- repose (1~255)

-- Hamadryad (5050)
INSERT INTO `mob_spell_lists` VALUES('Hamadryad',5050,145,1,255); -- fire_ii (1~255)

-- Xolotl (5051)
INSERT INTO `mob_spell_lists` VALUES ('Xolotl',5051,147,1,255); -- fire_iv (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Xolotl',5051,152,1,255); -- blizzard_iv (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Xolotl',5051,167,1,255); -- thunder_iv (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Xolotl',5051,162,1,255); -- stone_iv (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Xolotl',5051,172,1,255); -- water_iv (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Xolotl',5051,157,1,255); -- aero_iv (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Xolotl',5051,181,1,255); -- blizzaga_iii (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Xolotl',5051,186,1,255); -- aeroga_iii (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Xolotl',5051,196,1,255); -- thundaga_iii (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Xolotl',5051,191,1,255); -- stonega_iii (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Xolotl',5051,201,1,255); -- waterga_iii (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Xolotl',5051,176,1,255); -- firaga_iii (1~255)

-- Zoredonite (5052)
INSERT INTO `mob_spell_lists` VALUES ('Zoredonite',5052,3,1,255);   -- cure_iii (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Zoredonite',5052,30,1,255);  -- banish_iii (1~255)
INSERT INTO `mob_spell_lists` VALUES ('Zoredonite',5052,112,1,255); -- flash (1~255)

-- Snow Devil (5053)
INSERT INTO `mob_spell_lists` VALUES('Snow_Devil', 5053,152,1,255); -- Blizzard IV (1~255)
INSERT INTO `mob_spell_lists` VALUES('Snow_Devil', 5053,181,1,255); -- Blizzaga III (1~255)
INSERT INTO `mob_spell_lists` VALUES('Snow_Devil', 5053,455,1,255); -- Ice Threnody (1~255)

-- Taru Taru Automaton (5054)
INSERT INTO `mob_spell_lists` VALUES('Tarutaru_Automaton',5054,204,1,255); -- Flare (1~255)
INSERT INTO `mob_spell_lists` VALUES('Tarutaru_Automaton',5054,206,1,255); -- Freeze (1~255)
INSERT INTO `mob_spell_lists` VALUES('Tarutaru_Automaton',5054,208,1,255); -- Tornado (1~255)
INSERT INTO `mob_spell_lists` VALUES('Tarutaru_Automaton',5054,210,1,255); -- Quake (1~255)
INSERT INTO `mob_spell_lists` VALUES('Tarutaru_Automaton',5054,212,1,255); -- Burst (1~255)
INSERT INTO `mob_spell_lists` VALUES('Tarutaru_Automaton',5054,214,1,255); -- Flood (1~255)

-- Hume Automaton (5055)
INSERT INTO `mob_spell_lists` VALUES('Hume_Automaton',5055,175,1,255); -- Firaga II (1~255)
INSERT INTO `mob_spell_lists` VALUES('Hume_Automaton',5055,180,1,255); -- Blizzaga II (1~255)
INSERT INTO `mob_spell_lists` VALUES('Hume_Automaton',5055,185,1,255); -- Aeroga II (1~255)
INSERT INTO `mob_spell_lists` VALUES('Hume_Automaton',5055,190,1,255); -- Stonega II (1~255)
INSERT INTO `mob_spell_lists` VALUES('Hume_Automaton',5055,195,1,255); -- Thundaga II (1~255)
INSERT INTO `mob_spell_lists` VALUES('Hume_Automaton',5055,200,1,255); -- Waterga II (1~255)

-- Ziryu (5056)
INSERT INTO `mob_spell_lists` VALUES ('Ziryu',5056,191,1,255);-- stonega_iii
INSERT INTO `mob_spell_lists` VALUES ('Ziryu',5056,210,1,255); -- Quake
INSERT INTO `mob_spell_lists` VALUES ('Ziryu',5056,54,1,255); -- Stoneskin

-- Koenigstiger (5057)
INSERT INTO `mob_spell_lists` VALUES ('Koenigstiger',5057,366,1,255);-- graviga

-- Moblin Wisewoman (5058)
INSERT INTO `mob_spell_lists` VALUES ('Moblin_Wisewoman',5058,57,1,255); -- Haste
INSERT INTO `mob_spell_lists` VALUES ('Moblin_Wisewoman',5058,108,1,255); -- Regen
INSERT INTO `mob_spell_lists` VALUES ('Moblin_Wisewoman',5058,259,1,255); -- Sleep II
INSERT INTO `mob_spell_lists` VALUES ('Moblin_Wisewoman',5058,260,1,255); -- Dispel

-- Moblin Clergyman (5059)
INSERT INTO `mob_spell_lists` VALUES ('Moblin_Clergyman',5059,4,1,255); -- Cure IV
INSERT INTO `mob_spell_lists` VALUES ('Moblin_Clergyman',5059,21,1,255); -- Holy
INSERT INTO `mob_spell_lists` VALUES ('Moblin_Clergyman',5059,45,1,255); -- Protect III
INSERT INTO `mob_spell_lists` VALUES ('Moblin_Clergyman',5059,143,1,255); -- Erase

-- Twilotak (5060)
INSERT INTO `mob_spell_lists` VALUES ('Twilotak',5060,144,1,255); -- Fire
INSERT INTO `mob_spell_lists` VALUES ('Twilotak',5060,149,1,255); -- Blizzard
INSERT INTO `mob_spell_lists` VALUES ('Twilotak',5060,154,1,255); -- Aero
INSERT INTO `mob_spell_lists` VALUES ('Twilotak',5060,160,1,255); -- Stone II
INSERT INTO `mob_spell_lists` VALUES ('Twilotak',5060,164,1,255); -- Thunder
INSERT INTO `mob_spell_lists` VALUES ('Twilotak',5060,169,1,255); -- Water
INSERT INTO `mob_spell_lists` VALUES ('Twilotak',5060,220,1,255); -- Poison
INSERT INTO `mob_spell_lists` VALUES ('Twilotak',5060,231,1,255); -- Bio II
INSERT INTO `mob_spell_lists` VALUES ('Twilotak',5060,245,1,255); -- Drain
INSERT INTO `mob_spell_lists` VALUES ('Twilotak',5060,247,1,255); -- Aspir
INSERT INTO `mob_spell_lists` VALUES ('Twilotak',5060,252,1,255); -- Stun
INSERT INTO `mob_spell_lists` VALUES ('Twilotak',5060,266,1,255); -- Absorb-STR
INSERT INTO `mob_spell_lists` VALUES ('Twilotak',5060,267,1,255); -- Absorb-DEX
INSERT INTO `mob_spell_lists` VALUES ('Twilotak',5060,268,1,255); -- Absorb-VIT
INSERT INTO `mob_spell_lists` VALUES ('Twilotak',5060,269,1,255); -- Absorb-AGI
INSERT INTO `mob_spell_lists` VALUES ('Twilotak',5060,270,1,255); -- Absorb-INT
INSERT INTO `mob_spell_lists` VALUES ('Twilotak',5060,271,1,255); -- Absorb-MND
INSERT INTO `mob_spell_lists` VALUES ('Twilotak',5060,272,1,255); -- Absorb-CHR

-- Steam Cleaner (5061)
INSERT INTO `mob_spell_lists` VALUES ('SteamCleaner',5061,196,1,255); -- Thundaga III
INSERT INTO `mob_spell_lists` VALUES ('SteamCleaner',5061,167,1,255); -- Thunder IV
INSERT INTO `mob_spell_lists` VALUES ('SteamCleaner',5061,239,1,255); -- Shock

-- Olla Pequena (5062)
INSERT INTO `mob_spell_lists` VALUES ('Olla_Pequena',5062,157,1,255); -- Aero_iv
INSERT INTO `mob_spell_lists` VALUES ('Olla_Pequena',5062,167,1,255); -- Thunder_iv
INSERT INTO `mob_spell_lists` VALUES ('Olla_Pequena',5062,176,1,255); -- Firaga_iii
INSERT INTO `mob_spell_lists` VALUES ('Olla_Pequena',5062,226,1,255); -- Poisonga_ii
INSERT INTO `mob_spell_lists` VALUES ('Olla_Pequena',5062,231,1,255); -- Bio_ii
INSERT INTO `mob_spell_lists` VALUES ('Olla_Pequena',5062,235,1,255); -- Burn
INSERT INTO `mob_spell_lists` VALUES ('Olla_Pequena',5062,236,1,255); -- Frost
INSERT INTO `mob_spell_lists` VALUES ('Olla_Pequena',5062,240,1,255); -- Drown
INSERT INTO `mob_spell_lists` VALUES ('Olla_Pequena',5062,245,1,255); -- Drain
INSERT INTO `mob_spell_lists` VALUES ('Olla_Pequena',5062,247,1,255); -- Aspir
INSERT INTO `mob_spell_lists` VALUES ('Olla_Pequena',5062,249,1,255); -- Blaze_spikes
INSERT INTO `mob_spell_lists` VALUES ('Olla_Pequena',5062,254,1,255); -- Blind
INSERT INTO `mob_spell_lists` VALUES ('Olla_Pequena',5062,258,1,255); -- Bind
INSERT INTO `mob_spell_lists` VALUES ('Olla_Pequena',5062,259,1,255); -- Sleep_ii

-- Olla Media (5063)
INSERT INTO `mob_spell_lists` VALUES ('Olla_Media',5063,232,1,255); -- Bio_iii
INSERT INTO `mob_spell_lists` VALUES ('Olla_Media',5063,245,1,255); -- Drain
INSERT INTO `mob_spell_lists` VALUES ('Olla_Media',5063,247,1,255); -- Aspir
INSERT INTO `mob_spell_lists` VALUES ('Olla_Media',5063,252,1,255); -- Stun
INSERT INTO `mob_spell_lists` VALUES ('Olla_Media',5063,260,1,255); -- Dispel
INSERT INTO `mob_spell_lists` VALUES ('Olla_Media',5063,269,1,255); -- Absorb-agi
INSERT INTO `mob_spell_lists` VALUES ('Olla_Media',5063,270,1,255); -- Absorb-int
INSERT INTO `mob_spell_lists` VALUES ('Olla_Media',5063,271,1,255); -- Absorb-mnd
INSERT INTO `mob_spell_lists` VALUES ('Olla_Media',5063,273,1,255); -- Sleepga
INSERT INTO `mob_spell_lists` VALUES ('Olla_Media',5063,274,1,255); -- Sleepga_ii

-- Olla Grande (5064)
INSERT INTO `mob_spell_lists` VALUES ('Olla_Grande',5064,21,1,255);  -- Holy
INSERT INTO `mob_spell_lists` VALUES ('Olla_Grande',5064,24,1,255);  -- Dia_ii
INSERT INTO `mob_spell_lists` VALUES ('Olla_Grande',5064,30,1,255);  -- Banish_iii
INSERT INTO `mob_spell_lists` VALUES ('Olla_Grande',5064,34,1,255);  -- Diaga_ii
INSERT INTO `mob_spell_lists` VALUES ('Olla_Grande',5064,40,1,255);  -- Banishga_iii
INSERT INTO `mob_spell_lists` VALUES ('Olla_Grande',5064,51,1,255);  -- Shell_iv
INSERT INTO `mob_spell_lists` VALUES ('Olla_Grande',5064,54,1,255);  -- Stoneskin
INSERT INTO `mob_spell_lists` VALUES ('Olla_Grande',5064,55,1,255);  -- Aquaveil
INSERT INTO `mob_spell_lists` VALUES ('Olla_Grande',5064,108,1,255); -- Regen
INSERT INTO `mob_spell_lists` VALUES ('Olla_Grande',5064,112,1,255); -- Flash

-- Old Professor Mariselle (5065)
INSERT INTO `mob_spell_lists` VALUES ('Old_Professor',5065,252,1,255); -- stun
INSERT INTO `mob_spell_lists` VALUES ('Old_Professor',5065,270,1,255); -- absorb-int
INSERT INTO `mob_spell_lists` VALUES ('Old_Professor',5065,259,1,255); -- sleep_ii
INSERT INTO `mob_spell_lists` VALUES ('Old_Professor',5065,245,1,255); -- drain
INSERT INTO `mob_spell_lists` VALUES ('Old_Professor',5065,258,1,255); -- bind
INSERT INTO `mob_spell_lists` VALUES ('Old_Professor',5065,274,1,255); -- sleepga_ii

-- Mariselles_Pupil (5066)
INSERT INTO `mob_spell_lists` VALUES ('Mariselles_Pupil',5066,216,1,255); -- gravity
INSERT INTO `mob_spell_lists` VALUES ('Mariselles_Pupil',5066,254,1,255); -- blind
INSERT INTO `mob_spell_lists` VALUES ('Mariselles_Pupil',5066,245,1,255); -- drain

-- Chekochuk (5067)
INSERT INTO `mob_spell_lists` VALUES ('Chekochuk',5067,146,1,255); -- Fire III
INSERT INTO `mob_spell_lists` VALUES ('Chekochuk',5067,156,1,255); -- Aero III
INSERT INTO `mob_spell_lists` VALUES ('Chekochuk',5067,171,1,255); -- Water III
INSERT INTO `mob_spell_lists` VALUES ('Chekochuk',5067,195,1,255); -- Thundaga II
INSERT INTO `mob_spell_lists` VALUES ('Chekochuk',5067,204,1,255); -- Flare
INSERT INTO `mob_spell_lists` VALUES ('Chekochuk',5067,210,1,255); -- Quake
INSERT INTO `mob_spell_lists` VALUES ('Chekochuk',5067,212,1,255); -- Burst
INSERT INTO `mob_spell_lists` VALUES ('Chekochuk',5067,214,1,255); -- Flood
INSERT INTO `mob_spell_lists` VALUES ('Chekochuk',5067,231,1,255); -- Bio II
INSERT INTO `mob_spell_lists` VALUES ('Chekochuk',5067,235,1,255); -- Burn
INSERT INTO `mob_spell_lists` VALUES ('Chekochuk',5067,236,1,255); -- Frost
INSERT INTO `mob_spell_lists` VALUES ('Chekochuk',5067,237,1,255); -- Choke
INSERT INTO `mob_spell_lists` VALUES ('Chekochuk',5067,240,1,255); -- Drown
INSERT INTO `mob_spell_lists` VALUES ('Chekochuk',5067,245,1,255); -- Drain
INSERT INTO `mob_spell_lists` VALUES ('Chekochuk',5067,247,1,255); -- Aspir
INSERT INTO `mob_spell_lists` VALUES ('Chekochuk',5067,249,1,255); -- Blaze Spikes
INSERT INTO `mob_spell_lists` VALUES ('Chekochuk',5067,252,1,255); -- Stun
INSERT INTO `mob_spell_lists` VALUES ('Chekochuk',5067,253,1,255); -- Sleep
INSERT INTO `mob_spell_lists` VALUES ('Chekochuk',5067,254,1,255); -- Blind
INSERT INTO `mob_spell_lists` VALUES ('Chekochuk',5067,258,1,255); -- Bind
INSERT INTO `mob_spell_lists` VALUES ('Chekochuk',5067,259,1,255); -- Sleep II
INSERT INTO `mob_spell_lists` VALUES ('Chekochuk',5067,273,1,255); -- Sleepga
INSERT INTO `mob_spell_lists` VALUES ('Chekochuk',5067,274,1,255); -- Sleepga II

-- Movamuq (5068)
INSERT INTO `mob_spell_lists` VALUES ('Movamuq',5068,5,1,255); -- Cure V
INSERT INTO `mob_spell_lists` VALUES ('Movamuq',5068,14,1,255); -- Poisona
INSERT INTO `mob_spell_lists` VALUES ('Movamuq',5068,15,1,255); -- Paralyna
INSERT INTO `mob_spell_lists` VALUES ('Movamuq',5068,21,1,255); -- Holy
INSERT INTO `mob_spell_lists` VALUES ('Movamuq',5068,24,1,255); -- Dia II
INSERT INTO `mob_spell_lists` VALUES ('Movamuq',5068,29,1,255); -- Banish II
INSERT INTO `mob_spell_lists` VALUES ('Movamuq',5068,34,1,255); -- Diaga II
INSERT INTO `mob_spell_lists` VALUES ('Movamuq',5068,39,1,255); -- Banishga II
INSERT INTO `mob_spell_lists` VALUES ('Movamuq',5068,45,1,255); -- Protect III
INSERT INTO `mob_spell_lists` VALUES ('Movamuq',5068,46,1,255); -- Protect IV
INSERT INTO `mob_spell_lists` VALUES ('Movamuq',5068,50,1,255); -- Shell III
INSERT INTO `mob_spell_lists` VALUES ('Movamuq',5068,53,1,255); -- Blink
INSERT INTO `mob_spell_lists` VALUES ('Movamuq',5068,54,1,255); -- Stoneskin
INSERT INTO `mob_spell_lists` VALUES ('Movamuq',5068,55,1,255); -- Aquaveil
INSERT INTO `mob_spell_lists` VALUES ('Movamuq',5068,56,1,255); -- Slow
INSERT INTO `mob_spell_lists` VALUES ('Movamuq',5068,57,1,255); -- Haste
INSERT INTO `mob_spell_lists` VALUES ('Movamuq',5068,58,1,255); -- Paralyze
INSERT INTO `mob_spell_lists` VALUES ('Movamuq',5068,59,1,255); -- Silence
INSERT INTO `mob_spell_lists` VALUES ('Movamuq',5068,112,1,255); -- Flash

-- Trikotrak (5069)
INSERT INTO `mob_spell_lists` VALUES ('Trikotrak',5069,4,1,255); -- Cure IV
INSERT INTO `mob_spell_lists` VALUES ('Trikotrak',5069,24,1,255); -- Dia II
INSERT INTO `mob_spell_lists` VALUES ('Trikotrak',5069,34,1,255); -- Diaga II
INSERT INTO `mob_spell_lists` VALUES ('Trikotrak',5069,50,1,255); -- Shell III
INSERT INTO `mob_spell_lists` VALUES ('Trikotrak',5069,53,1,255); -- Blink
INSERT INTO `mob_spell_lists` VALUES ('Trikotrak',5069,54,1,255); -- Stoneskin
INSERT INTO `mob_spell_lists` VALUES ('Trikotrak',5069,55,1,255); -- Aquaveil
INSERT INTO `mob_spell_lists` VALUES ('Trikotrak',5069,56,1,255); -- Slow
INSERT INTO `mob_spell_lists` VALUES ('Trikotrak',5069,57,1,255); -- Haste
INSERT INTO `mob_spell_lists` VALUES ('Trikotrak',5069,105,1,255); -- Enwater
INSERT INTO `mob_spell_lists` VALUES ('Trikotrak',5069,108,1,255); -- Regen
INSERT INTO `mob_spell_lists` VALUES ('Trikotrak',5069,145,1,255); -- Fire II
INSERT INTO `mob_spell_lists` VALUES ('Trikotrak',5069,150,1,255); -- Blizzard II
INSERT INTO `mob_spell_lists` VALUES ('Trikotrak',5069,155,1,255); -- Aero II
INSERT INTO `mob_spell_lists` VALUES ('Trikotrak',5069,160,1,255); -- Stone II
INSERT INTO `mob_spell_lists` VALUES ('Trikotrak',5069,165,1,255); -- Thunder II
INSERT INTO `mob_spell_lists` VALUES ('Trikotrak',5069,170,1,255); -- Water II
INSERT INTO `mob_spell_lists` VALUES ('Trikotrak',5069,216,1,255); -- Gravity
INSERT INTO `mob_spell_lists` VALUES ('Trikotrak',5069,221,1,255); -- Poison II
INSERT INTO `mob_spell_lists` VALUES ('Trikotrak',5069,231,1,255); -- Bio II
INSERT INTO `mob_spell_lists` VALUES ('Trikotrak',5069,253,1,255); -- Sleep
INSERT INTO `mob_spell_lists` VALUES ('Trikotrak',5069,254,1,255); -- Blind
INSERT INTO `mob_spell_lists` VALUES ('Trikotrak',5069,258,1,255); -- Bind
INSERT INTO `mob_spell_lists` VALUES ('Trikotrak',5069,259,1,255); -- Sleep II
INSERT INTO `mob_spell_lists` VALUES ('Trikotrak',5069,260,1,255); -- Dispel

-- Vaa_Huja_the_Erudite (5070)
INSERT INTO `mob_spell_lists` VALUES ('Vaa_Huja_the_Erudite',5070,145,1,255); -- fire_ii
INSERT INTO `mob_spell_lists` VALUES ('Vaa_Huja_the_Erudite',5070,150,1,255); -- blizzard_ii
INSERT INTO `mob_spell_lists` VALUES ('Vaa_Huja_the_Erudite',5070,180,1,255); -- blizzaga_ii
INSERT INTO `mob_spell_lists` VALUES ('Vaa_Huja_the_Erudite',5070,190,1,255); -- stonega_ii
INSERT INTO `mob_spell_lists` VALUES ('Vaa_Huja_the_Erudite',5070,194,1,255); -- thundaga
INSERT INTO `mob_spell_lists` VALUES ('Vaa_Huja_the_Erudite',5070,200,1,255); -- waterga_ii
INSERT INTO `mob_spell_lists` VALUES ('Vaa_Huja_the_Erudite',5070,231,1,255); -- bio_ii
INSERT INTO `mob_spell_lists` VALUES ('Vaa_Huja_the_Erudite',5070,252,1,255); -- stun
INSERT INTO `mob_spell_lists` VALUES ('Vaa_Huja_the_Erudite',5070,273,1,255); -- sleepga

-- Gerwitz's Soul (5071)
INSERT INTO `mob_spell_lists` VALUES ('Gerwitz_Soul',5071,175,1,255); -- firaga_ii
INSERT INTO `mob_spell_lists` VALUES ('Gerwitz_Soul',5071,180,1,255); -- blizzaga_ii
INSERT INTO `mob_spell_lists` VALUES ('Gerwitz_Soul',5071,185,1,255); -- aeroga_ii
INSERT INTO `mob_spell_lists` VALUES ('Gerwitz_Soul',5071,190,1,255); -- stonega_ii
INSERT INTO `mob_spell_lists` VALUES ('Gerwitz_Soul',5071,195,1,255); -- thundaga_ii
INSERT INTO `mob_spell_lists` VALUES ('Gerwitz_Soul',5071,200,1,255); -- waterga_ii
INSERT INTO `mob_spell_lists` VALUES ('Gerwitz_Soul',5071,206,1,255); -- freeze
INSERT INTO `mob_spell_lists` VALUES ('Gerwitz_Soul',5071,210,1,255); -- quake
INSERT INTO `mob_spell_lists` VALUES ('Gerwitz_Soul',5071,208,1,255); -- tornado
INSERT INTO `mob_spell_lists` VALUES ('Gerwitz_Soul',5071,250,1,255); -- ice_spikes
INSERT INTO `mob_spell_lists` VALUES ('Gerwitz_Soul',5071,253,1,255); -- sleep
INSERT INTO `mob_spell_lists` VALUES ('Gerwitz_Soul',5071,273,1,255); -- sleepga

-- Dabotz Ghost (5072)
INSERT INTO `mob_spell_lists` VALUES ('Dabotzs_Ghost',5072,190,1,255); -- stonega_ii
INSERT INTO `mob_spell_lists` VALUES ('Dabotzs_Ghost',5072,237,1,255); -- choke
INSERT INTO `mob_spell_lists` VALUES ('Dabotzs_Ghost',5072,240,1,255); -- drown
INSERT INTO `mob_spell_lists` VALUES ('Dabotzs_Ghost',5072,206,1,255); -- freeze
INSERT INTO `mob_spell_lists` VALUES ('Dabotzs_Ghost',5072,250,1,255); -- ice_spikes
INSERT INTO `mob_spell_lists` VALUES ('Dabotzs_Ghost',5072,161,1,255); -- stone_iii
INSERT INTO `mob_spell_lists` VALUES ('Dabotzs_Ghost',5072,259,1,255); -- sleep_ii
INSERT INTO `mob_spell_lists` VALUES ('Dabotzs_Ghost',5072,208,1,255); -- tornado
INSERT INTO `mob_spell_lists` VALUES ('Dabotzs_Ghost',5072,257,1,255); -- curse

-- Bugaboo (5073)
INSERT INTO `mob_spell_lists` VALUES ('Bugaboo',5073,191,1,255); -- stonega_iii
INSERT INTO `mob_spell_lists` VALUES ('Bugaboo',5073,204,1,255); -- flare
INSERT INTO `mob_spell_lists` VALUES ('Bugaboo',5073,206,1,255); -- freeze
INSERT INTO `mob_spell_lists` VALUES ('Bugaboo',5073,208,1,255); -- tornado
INSERT INTO `mob_spell_lists` VALUES ('Bugaboo',5073,210,1,255); -- quake
INSERT INTO `mob_spell_lists` VALUES ('Bugaboo',5073,212,1,255); -- burst
INSERT INTO `mob_spell_lists` VALUES ('Bugaboo',5073,214,1,255); -- flood
INSERT INTO `mob_spell_lists` VALUES ('Bugaboo',5073,230,1,255); -- bio
INSERT INTO `mob_spell_lists` VALUES ('Bugaboo',5073,240,1,255); -- drown
INSERT INTO `mob_spell_lists` VALUES ('Bugaboo',5073,245,1,255); -- drain
INSERT INTO `mob_spell_lists` VALUES ('Bugaboo',5073,250,1,255); -- ice_spikes
INSERT INTO `mob_spell_lists` VALUES ('Bugaboo',5073,273,1,255); -- sleepga

-- Ixzdei_BLM_start (467)
INSERT INTO `mob_spell_lists` VALUES ('Ixzdei_BLM_start',5074,4,26,255);   -- cure_iv (26~255)
INSERT INTO `mob_spell_lists` VALUES ('Ixzdei_BLM_start',5074,144,26,255); -- fire (26~255)
INSERT INTO `mob_spell_lists` VALUES ('Ixzdei_BLM_start',5074,149,34,255); -- blizzard (34~255)
INSERT INTO `mob_spell_lists` VALUES ('Ixzdei_BLM_start',5074,154,18,255); -- aero (18~255)
INSERT INTO `mob_spell_lists` VALUES ('Ixzdei_BLM_start',5074,159,2,255);  -- stone (2~255)
INSERT INTO `mob_spell_lists` VALUES ('Ixzdei_BLM_start',5074,164,42,255); -- thunder (42~255)
INSERT INTO `mob_spell_lists` VALUES ('Ixzdei_BLM_start',5074,169,10,255); -- water (10~255)

-- Nightmare Worm (Dynamis Tav)
INSERT INTO `mob_spell_lists` VALUES ('Nightmare_Worm',5075,192,1,255); -- Stonega IV
INSERT INTO `mob_spell_lists` VALUES ('Nightmare_Worm',5075,255,1,255); -- Break
INSERT INTO `mob_spell_lists` VALUES ('Nightmare_Worm',5075,163,1,255); -- Stone V
INSERT INTO `mob_spell_lists` VALUES ('Nightmare_Worm',5075,210,1,255); -- Quake
INSERT INTO `mob_spell_lists` VALUES ('Nightmare_Worm',5075,238,1,255); -- Rasp
INSERT INTO `mob_spell_lists` VALUES ('Nightmare_Worm',5075,54,1,255);  -- Stoneskin

-- Bukki (5076 The Die is Cast NM) (Dynamis Tav)
INSERT INTO `mob_spell_lists` VALUES ('Bukki',5076,146,62,72);  -- fire_iii (62~72)
INSERT INTO `mob_spell_lists` VALUES ('Bukki',5076,156,59,71);  -- aero_iii (59~71)
INSERT INTO `mob_spell_lists` VALUES ('Bukki',5076,166,66,74);  -- thunder_iii (66~74)
INSERT INTO `mob_spell_lists` VALUES ('Bukki',5076,171,55,66);  -- water_iii (55~66)
INSERT INTO `mob_spell_lists` VALUES ('Bukki',5076,245,12,255); -- drain (12~255)
INSERT INTO `mob_spell_lists` VALUES ('Bukki',5076,247,25,255); -- aspir (25~255)
INSERT INTO `mob_spell_lists` VALUES ('Bukki',5076,249,10,255); -- blaze_spikes (10~255)
INSERT INTO `mob_spell_lists` VALUES ('Bukki',5076,252,45,255); -- stun (45~255)
INSERT INTO `mob_spell_lists` VALUES ('Bukki',5076,254,4,255);  -- blind (4~255)
INSERT INTO `mob_spell_lists` VALUES ('Bukki',5076,258,7,255);  -- bind (7~255)
