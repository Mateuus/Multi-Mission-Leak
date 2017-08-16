/*
*    ARRAY FORMAT:
*        0: STRING (Classname)
*        1: STRING (Display Name, leave as "" for default)
*        2: SCALAR (Price)
*        4: ARRAY (This is for limiting items to certain things)
*            0: Variable to read from
*            1: Variable Value Type (SCALAR / BOOL / EQUAL)
*            2: What to compare to (-1 = Check Disabled)
*
*   Clothing classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Equipment
*   Backpacks/remaining classnames can be found here (TIP: Search page for "pack"): https://community.bistudio.com/wiki/Arma_3_CfgVehicles_EMPTY
*
*/
class Clothing {
    class bruce {
        title = "STR_Shops_C_Bruce";
        license = "";
        side = "civ";
        uniforms[] = {
            { "NONE", "Nichts", 0, { "", "", -1 } },
			{ "U_I_C_Soldier_Bandit_4_F", "", 200, { "", "", -1 } },
			{ "U_I_C_Soldier_Bandit_5_F", "", 200, { "", "", -1 } },
			{ "U_I_C_Soldier_Bandit_1_F", "", 200, { "", "", -1 } },
			{ "U_I_C_Soldier_Bandit_3_F", "", 200, { "", "", -1 } },
			{ "U_I_C_Soldier_Bandit_2_F", "", 200, { "", "", -1 } },		
			{ "U_C_Man_casual_2_F", "", 200, { "", "", -1 } },
			{ "U_C_Man_casual_3_F", "", 200, { "", "", -1 } },
			{ "U_C_Man_casual_1_F", "", 200, { "", "", -1 } },
			{ "U_C_Man_casual_5_F", "", 200, { "", "", -1 } },
			{ "U_C_Man_casual_4_F", "", 200, { "", "", -1 } },
			{ "U_C_Man_casual_6_F", "", 200, { "", "", -1 } },
			{ "U_C_man_sport_3_F", "", 200, { "", "", -1 } },
			{ "U_C_man_sport_2_F", "", 200, { "", "", -1 } },		
			{ "U_C_man_sport_1_F", "", 200, { "", "", -1 } },			
			{ "U_C_Poor_1", "Arbeiter (blau)", 200, { "", "", -1 } },
			{ "U_IG_Guerilla2_3", "Zivilist (blau-beige)", 800, { "", "", -1 } },
			{ "U_IG_Guerilla2_2", "Zivilist (grün-kariert)", 800, { "", "", -1 } },
			{ "U_IG_Guerilla3_1", "Lederjacke", 125, { "", "", -1 } },
			{ "U_C_HunterBody_grn", "Jagdoutfit", 150, { "", "", -1 } },		
			{ "U_C_Poloshirt_stripped", "T-Shirt", 20, { "", "", -1 } },
			{ "U_C_Poloshirt_blue", "T-Shirt (blau)", 20, { "", "", -1 } },
			{ "U_C_Poloshirt_salmon", "T-Shirt (lachs)", 20, { "", "", -1 } },
			{ "U_C_Poloshirt_redwhite", "T-Shirt (rot-weiß)", 20, { "", "", -1 } },
			{ "U_C_Poloshirt_tricolour", "T-Shirt (Trikolore)", 20, { "", "", -1 } },
			{ "U_C_Poloshirt_burgundy", "T-Shirt (wein-kariert)", 20, { "", "", -1 } },
			{ "U_Competitor", "Polohemd (ION)", 600, { "", "", -1 } },
			{ "U_Marshal", "Polohemd (Weiß)", 600, { "", "", -1 } },
			{ "U_OrestesBody", "Surfer", 860, { "", "", -1 } },
			{ "U_NikosAgedBody", "Hemd mit Krawatte", 15000, { "", "", -1 } },
			{ "U_NikosBody", "Zuhälter", 800, { "", "", -1 } },
			{ "U_C_WorkerCoveralls", "Arbeitsoverall", 800, { "", "", -1 } },
			{ "U_C_Scientist", "Wissenschaftleroverall", 800, { "", "", -1 } },
			{ "U_B_Wetsuit", "Neoprenanzug (NATO)", 10000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Nichts", 0, { "", "", -1 } },
			{ "H_Bandanna_blu", "Bandana (blau)", 120, { "", "", -1 } },
			{ "H_Bandanna_cbr", "Bandana (Coyote)", 120, { "", "", -1 } },
			{ "H_Bandanna_gry", "Bandana (schwarz)", 120, { "", "", -1 } },
			{ "H_Bandanna_khk", "Bandana (khaki)", 120, { "", "", -1 } },
			{ "H_Bandanna_sgg", "Bandana (graugrün)", 120, { "", "", -1 } },
			{ "H_Bandanna_sand", "Bandana (sand)", 120, { "", "", -1 } },
			{ "H_Bandanna_surfer", "Bandana (blau gemustert)", 120, { "", "", -1 } },
			{ "H_Bandanna_surfer_blk", "Bandana (schwarz gemustert)", 120, { "", "", -1 } },
			{ "H_Bandanna_surfer_grn", "Bandana (grün gemustert)", 120, { "", "", -1 } },
			{ "H_Booniehat_grn", "Boonie Hat (grün)", 160, { "", "", -1 } },
			{ "H_Booniehat_tan", "Boonie Hat (hellbraun)", 160, { "", "", -1 } },			
			{ "H_Booniehat_khk", "Boonie Hat (khaki)", 160, { "", "", -1 } },
			{ "H_Booniehat_oli", "Boonie Hat (oliv)", 160, { "", "", -1 } },
			{ "H_Hat_blue", "Hut (blau kariert)", 180, { "", "", -1 } },
			{ "H_Hat_brown", "Hut (braun)", 180, { "", "", -1 } },
			{ "H_Hat_camo", "Hut (Tarn)", 180, { "", "", -1 } },
			{ "H_Hat_grey", "Hut (grau)", 180, { "", "", -1 } },		
			{ "H_Hat_checker", "Hut (schwarz-weiss)", 180, { "", "", -1 } },
			{ "H_Hat_tan", "Hut (hellbraun)", 180, { "", "", -1 } },
			{ "H_Cap_grn_BI", "Cap (Bohemia)", 160, { "", "", -1 } },
			{ "H_Cap_blk_CMMG", "Cap (CMMG)", 160, { "", "", -1 } },
			{ "H_Cap_grn", "Cap (grün)", 160, { "", "", -1 } },
			{ "H_Cap_tan", "Cap (hellbraun)", 160, { "", "", -1 } },
			{ "H_Cap_blk_ION", "Cap (ION)", 160, { "", "", -1 } },
			{ "H_Cap_blu", "Cap (Jeans)", 160, { "", "", -1 } },
			{ "H_Cap_oli", "Cap (oliv)", 160, { "", "", -1 } },
			{ "H_Cap_red", "Cap (rot)", 160, { "", "", -1 } },
			{ "H_Cap_blk", "Cap (schwarz)", 160, { "", "", -1 } },
			{ "H_Cap_khaki_specops_UK", "Cap (UK)", 160, { "", "", -1 } },
			{ "H_Cap_usblack", "Cap (US schwarz)", 160, { "", "", -1 } },
			{ "H_StrawHat", "Strohhut (hell)", 140, { "", "", -1 } },
			{ "H_StrawHat_dark", "Strohhut (dunkel)", 140, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Nichts", 0, { "", "", -1 } },
			{ "G_Shades_Blue", "Sonnenbrille (blau)", 20, { "", "", -1 } },
			{ "G_Shades_Green", "Sonnenbrille (grün)", 20, { "", "", -1 } },
			{ "G_Shades_Red", "Sonnenbrille (rot)", 20, { "", "", -1 } },
			{ "G_Shades_Black", "Sonnenbrille (schwarz)", 20, { "", "", -1 } },
			{ "G_Aviator", "Fliegerbrille", 20, { "", "", -1 } },
			{ "G_Squares", "Designerbrille", 40, { "", "", -1 } },
			{ "G_Spectacles", "Hornbrille", 20, { "", "", -1 } },
			{ "G_Spectacles_Tinted", "Getönte Brille", 20, { "", "", -1 } },
			{ "G_Lady_Blue", "Damensonnenbrille (Eis)", 20, { "", "", -1 } },
			{ "G_Lady_Red", "Damensonnenbrille (Feuer)", 20, { "", "", -1 } },
			{ "G_Lady_Mirror", "Damensonnenbrille (Iridium)",20, { "", "", -1 } },
			{ "G_Lady_Dark", "Damensonnenbrille (Meer)", 20, { "", "", -1 } },	
			{ "G_Diving", "Taucherbrille", 1000, { "", "", -1 } },			
			{ "G_Sport_Red", "Sportbrille (Feuerrot)", 40, { "", "", -1 } },			
			{ "G_Sport_Greenblack", "Sportbrille (grünschwarz)", 40, { "", "", -1 } },
			{ "G_Sport_Checkered", "Sportbrille (Karo)", 40, { "", "", -1 } },			
			{ "G_Sport_Blackyellow", "Sportbrille (schwarzgelb)", 40, { "", "", -1 } },
			{ "G_Sport_Blackred", "Sportbrille (Vulkan)", 40, { "", "", -1 } },
			{ "G_Sport_BlackWhite", "Sportbrille (weißschwarz)", 40, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Nichts", 0, { "", "", -1 } },
			{ "V_RebreatherB", "Tauchgerät (NATO)", 5000, { "", "", -1 } },
            { "V_Rangemaster_belt", "", 5000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Nichts", 0, { "", "", -1 } },
			{ "B_AssaultPack_cbr", "Angriffspack (Coyote)", 760, { "", "", -1 } },
			{ "B_AssaultPack_sgg", "Angriffspack (graugrün)", 760, { "", "", -1 } },
			{ "B_AssaultPack_rgr", "Angriffspack (grün)", 760, { "", "", -1 } },
			{ "B_AssaultPack_khk", "Angriffspack (khaki)", 760, { "", "", -1 } },
			{ "B_FieldPack_cbr", "Feldpack (Coyote)", 1500, { "", "", -1 } },
			{ "B_FieldPack_khk", "Feldpack (khaki)", 1500, { "", "", -1 } },
			{ "B_FieldPack_oli", "Feldpack (oliv)", 1500, { "", "", -1 } },
			{ "B_TacticalPack_oli", "Westpak (oliv)", 2000, { "", "", -1 } },
			{ "B_OutdoorPack_tan", "Westpak (sand)", 2000, { "", "", -1 } },
			{ "B_Kitbag_cbr", "Seesack (Coyote)", 2500, { "", "", -1 } },
			{ "B_Kitbag_sgg", "Seesack (giftgrün)", 2500, { "", "", -1 } },
			{ "B_ViperLightHarness_khk_F", "", 6000, { "", "", -1 } },
			{ "B_ViperLightHarness_oli_F", "", 6000, { "", "", -1 } },
			{ "B_ViperHarness_khk_F", "", 7000, { "", "", -1 } },
			{ "B_ViperHarness_oli_F", "", 7000, { "", "", -1 } },
			{ "B_Carryall_khk", "Großer Rucksack (khaki)", 5000, { "", "", -1 } },
			{ "B_Carryall_oli", "Großer Rucksack (oliv)", 5000, { "", "", -1 } },
			{ "B_Parachute", "Fallschirm", 5000, { "", "", -1 } }
        };
    };
	
    class fbi {
        title = "STR_Shops_C_fbi";
        license = "fbi";
        side = "cop";
        uniforms[] = {
            { "NONE", "Nichts", 0, { "", "", -1 } },
			{ "U_I_C_Soldier_Bandit_4_F", "", 200, { "", "", -1 } },
			{ "U_I_C_Soldier_Bandit_5_F", "", 200, { "", "", -1 } },
			{ "U_I_C_Soldier_Bandit_1_F", "", 200, { "", "", -1 } },
			{ "U_I_C_Soldier_Bandit_3_F", "", 200, { "", "", -1 } },
			{ "U_I_C_Soldier_Bandit_2_F", "", 200, { "", "", -1 } },		
			{ "U_C_Man_casual_2_F", "", 200, { "", "", -1 } },
			{ "U_C_Man_casual_3_F", "", 200, { "", "", -1 } },
			{ "U_C_Man_casual_1_F", "", 200, { "", "", -1 } },
			{ "U_C_Man_casual_5_F", "", 200, { "", "", -1 } },
			{ "U_C_Man_casual_4_F", "", 200, { "", "", -1 } },
			{ "U_C_Man_casual_6_F", "", 200, { "", "", -1 } },
			{ "U_C_man_sport_3_F", "", 200, { "", "", -1 } },
			{ "U_C_man_sport_2_F", "", 200, { "", "", -1 } },		
			{ "U_C_man_sport_1_F", "", 200, { "", "", -1 } },			
			{ "U_C_Poor_1", "Arbeiter (blau)", 200, { "", "", -1 } },
			{ "U_IG_Guerilla2_3", "Zivilist (blau-beige)", 800, { "", "", -1 } },
			{ "U_IG_Guerilla2_2", "Zivilist (grün-kariert)", 800, { "", "", -1 } },
			{ "U_IG_Guerilla3_1", "Lederjacke", 125, { "", "", -1 } },
			{ "U_C_HunterBody_grn", "Jagdoutfit", 150, { "", "", -1 } },		
			{ "U_C_Poloshirt_stripped", "T-Shirt", 20, { "", "", -1 } },
			{ "U_C_Poloshirt_blue", "T-Shirt (blau)", 20, { "", "", -1 } },
			{ "U_C_Poloshirt_salmon", "T-Shirt (lachs)", 20, { "", "", -1 } },
			{ "U_C_Poloshirt_redwhite", "T-Shirt (rot-weiß)", 20, { "", "", -1 } },
			{ "U_C_Poloshirt_tricolour", "T-Shirt (Trikolore)", 20, { "", "", -1 } },
			{ "U_C_Poloshirt_burgundy", "T-Shirt (wein-kariert)", 20, { "", "", -1 } },
			{ "U_Competitor", "Polohemd (ION)", 600, { "", "", -1 } },
			{ "U_Marshal", "Polohemd (Weiß)", 600, { "", "", -1 } },
			{ "U_OrestesBody", "Surfer", 860, { "", "", -1 } },
			{ "U_NikosAgedBody", "Hemd mit Krawatte", 15000, { "", "", -1 } },
			{ "U_NikosBody", "Zuhälter", 800, { "", "", -1 } },
			{ "U_C_WorkerCoveralls", "Arbeitsoverall", 800, { "", "", -1 } },
			{ "U_C_Scientist", "Wissenschaftleroverall", 800, { "", "", -1 } },
			{ "U_B_Wetsuit", "Neoprenanzug (NATO)", 10000, { "", "", -1 } },
			{ "U_OG_Guerrilla_6_1", "Guerilla (Grüner Pullover)", 2000, { "", "", -1 } },
			{ "U_IG_leader", "Guerilla (Jacke)", 2000, { "", "", -1 } },
			{ "U_I_G_resistanceLeader_F", "Guerilla (Stavrou)", 2000, { "", "", -1 } },
			{ "U_IG_Guerilla1_1", "Guerilla (T-Shirt)", 2400, {"", "", -1} },
			{ "U_I_G_Story_Protagonist_F", "Kampfanzug (Kerry)", 3000, { "", "", -1 } },
			{ "U_O_OfficerUniform_ocamo", "Offizier (Hex)", 3000, { "", "", -1 } },
			{ "U_O_SpecopsUniform_ocamo", "Militäranzug (Hex)", 3000, { "", "", -1 } },
			{ "U_O_PilotCoveralls", "Fliegermontur (CSAT)", 3600, { "", "", -1 } },
			{ "U_B_T_Soldier_F", "", 15000, { "", "", -1 } },
			{ "U_B_T_Soldier_AR_F", "", 15000, { "", "", -1 } },
			{ "U_OG_Guerrilla_6_1", "", 15000, { "", "", -1 } },
			{ "U_O_GhillieSuit", "", 25000, { "", "", -1 } },
			{ "U_O_T_Sniper_F", "", 25000, { "", "", -1 } },
			{ "U_B_T_Sniper_F", "", 15000, { "", "", -1 } },	
			{ "U_O_T_Officer_F", "", 15000, { "", "", -1 } },
			{ "U_I_C_Soldier_Para_2_F", "", 15000, { "", "", -1 } },
			{ "U_I_C_Soldier_Para_4_F", "", 2000, { "", "", -1 } },
			{ "U_I_C_Soldier_Para_3_F", "", 15000, { "", "", -1 } },
			{ "U_I_C_Soldier_Para_1_F", "", 15000, { "", "", -1 } },
			{ "U_B_T_Soldier_SL_F", "", 15000, { "", "", -1 } },
			{ "U_O_FullGhillie_lsh", "Voll-Ghillie (CSAT)", 90000, { "", "", -1 } },
			{ "U_O_FullGhillie_sard", "Voll-Ghillie (CSAT)", 90000, { "", "", -1 } },
			{ "U_O_FullGhillie_ard", "Voll-Ghillie (CSAT)", 90000, { "", "", -1 } },
			{ "U_O_T_FullGhillie_tna_F", "", 90000, { "", "", -1 } },
			{ "U_B_T_FullGhillie_tna_F", "", 90000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Nichts", 0, { "", "", -1 } },
			{ "H_Bandanna_blu", "Bandana (blau)", 120, { "", "", -1 } },
			{ "H_Bandanna_cbr", "Bandana (Coyote)", 120, { "", "", -1 } },
			{ "H_Bandanna_gry", "Bandana (schwarz)", 120, { "", "", -1 } },
			{ "H_Bandanna_khk", "Bandana (khaki)", 120, { "", "", -1 } },
			{ "H_Bandanna_sgg", "Bandana (graugrün)", 120, { "", "", -1 } },
			{ "H_Bandanna_sand", "Bandana (sand)", 120, { "", "", -1 } },
			{ "H_Bandanna_surfer", "Bandana (blau gemustert)", 120, { "", "", -1 } },
			{ "H_Bandanna_surfer_blk", "Bandana (schwarz gemustert)", 120, { "", "", -1 } },
			{ "H_Bandanna_surfer_grn", "Bandana (grün gemustert)", 120, { "", "", -1 } },
			{ "H_Booniehat_grn", "Boonie Hat (grün)", 160, { "", "", -1 } },
			{ "H_Booniehat_tan", "Boonie Hat (hellbraun)", 160, { "", "", -1 } },			
			{ "H_Booniehat_khk", "Boonie Hat (khaki)", 160, { "", "", -1 } },
			{ "H_Booniehat_oli", "Boonie Hat (oliv)", 160, { "", "", -1 } },
			{ "H_Hat_blue", "Hut (blau kariert)", 180, { "", "", -1 } },
			{ "H_Hat_brown", "Hut (braun)", 180, { "", "", -1 } },
			{ "H_Hat_camo", "Hut (Tarn)", 180, { "", "", -1 } },
			{ "H_Hat_grey", "Hut (grau)", 180, { "", "", -1 } },		
			{ "H_Hat_checker", "Hut (schwarz-weiss)", 180, { "", "", -1 } },
			{ "H_Hat_tan", "Hut (hellbraun)", 180, { "", "", -1 } },
			{ "H_Cap_grn_BI", "Cap (Bohemia)", 160, { "", "", -1 } },
			{ "H_Cap_blk_CMMG", "Cap (CMMG)", 160, { "", "", -1 } },
			{ "H_Cap_grn", "Cap (grün)", 160, { "", "", -1 } },
			{ "H_Cap_tan", "Cap (hellbraun)", 160, { "", "", -1 } },
			{ "H_Cap_blk_ION", "Cap (ION)", 160, { "", "", -1 } },
			{ "H_Cap_blu", "Cap (Jeans)", 160, { "", "", -1 } },
			{ "H_Cap_oli", "Cap (oliv)", 160, { "", "", -1 } },
			{ "H_Cap_red", "Cap (rot)", 160, { "", "", -1 } },
			{ "H_Cap_blk", "Cap (schwarz)", 160, { "", "", -1 } },
			{ "H_Cap_khaki_specops_UK", "Cap (UK)", 160, { "", "", -1 } },
			{ "H_Cap_usblack", "Cap (US schwarz)", 160, { "", "", -1 } },
			{ "H_StrawHat", "Strohhut (hell)", 140, { "", "", -1 } },
			{ "H_StrawHat_dark", "Strohhut (dunkel)", 140, { "", "", -1 } },
			{ "H_HelmetO_ocamo", "", 140000, { "", "", -1 } },
			{ "H_HelmetB_camo ", "", 140000, { "", "", -1 } },
			{ "H_HelmetB_paint ", "", 40000, { "", "", -1 } },
			{ "H_HelmetB_light", "", 30000, { "", "", -1 } },
			{ "H_Bandanna_cbr", "Bandana (Coyote)", 800, { "", "", -1 } },
			{ "H_Bandanna_sgg", "Bandana (graugrün)", 800, { "", "", -1 } },
			{ "H_Bandanna_khk_hs", "Bandana (Headset)", 2500, { "", "", -1 } },
			{ "H_Bandanna_mcamo", "Bandana (khaki)", 800, { "", "", -1 } },
			{ "H_Bandanna_mcamo", "Bandana (MTP)", 800, { "", "", -1 } },
			{ "H_Bandanna_mcamo", "Bandana (sand)", 800, { "", "", -1 } },
			{ "H_Bandanna_gry", "Bandana (schwarz)", 800, { "", "", -1 } },
			{ "H_Bandanna_camo", "Bandana (Wald)", 800, { "", "", -1 } },
			{ "H_Booniehat_khk_hs", "Boonie Hat(Headset)", 2500, { "", "", -1 } },
			{ "H_Booniehat_mcamo", "Boonie Hat (MTP)", 1500, { "", "", -1 } },		
			{ "H_Cap_oli_hs", "Cap (Headset)", 2500, { "", "", -1 } },
			{ "H_Cap_brn_SPECOPS", "Cap (Hex)", 1060, { "", "", -1 } },
			{ "H_Cap_tan_specops_US", "Cap (US MTP)", 1060, { "", "", -1 } },
			{ "H_MilCap_blue", "Feldmütze (blau)", 1600, { "", "", -1 } },
			{ "H_MilCap_gry", "Feldmütze (grau)", 1600, { "", "", -1 } },
			{ "H_MilCap_oucamo", "Feldmütze (Headset)", 1600, { "", "", -1 } },
			{ "H_MilCap_ocamo", "Feldmütze (Hex)", 1600, { "", "", -1 } },
			{ "H_MilCap_mcamo", "Feldmütze (MTP)", 1600, { "", "", -1 } },
			{ "H_ShemagOpen_tan", "Shemag (hellbraun)", 1700, { "", "", -1 } },
			{ "H_Shemag_khk", "Shemag (khaki)", 1700, { "", "", -1 } },
			{ "H_Shemag_olive", "Shemag (oliv)", 1700, { "", "", -1 } },
			{ "H_ShemagOpen_khk", "Shemag (weiß)", 1700, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Nichts", 0, { "", "", -1 } },
			{ "G_Shades_Blue", "Sonnenbrille (blau)", 20, { "", "", -1 } },
			{ "G_Shades_Green", "Sonnenbrille (grün)", 20, { "", "", -1 } },
			{ "G_Shades_Red", "Sonnenbrille (rot)", 20, { "", "", -1 } },
			{ "G_Shades_Black", "Sonnenbrille (schwarz)", 20, { "", "", -1 } },
			{ "G_Aviator", "Fliegerbrille", 20, { "", "", -1 } },
			{ "G_Squares", "Designerbrille", 40, { "", "", -1 } },
			{ "G_Spectacles", "Hornbrille", 20, { "", "", -1 } },
			{ "G_Spectacles_Tinted", "Getönte Brille", 20, { "", "", -1 } },
			{ "G_Lady_Blue", "Damensonnenbrille (Eis)", 20, { "", "", -1 } },
			{ "G_Lady_Red", "Damensonnenbrille (Feuer)", 20, { "", "", -1 } },
			{ "G_Lady_Mirror", "Damensonnenbrille (Iridium)",20, { "", "", -1 } },
			{ "G_Lady_Dark", "Damensonnenbrille (Meer)", 20, { "", "", -1 } },	
			{ "G_Diving", "Taucherbrille", 1000, { "", "", -1 } },			
			{ "G_Sport_Red", "Sportbrille (Feuerrot)", 40, { "", "", -1 } },			
			{ "G_Sport_Greenblack", "Sportbrille (grünschwarz)", 40, { "", "", -1 } },
			{ "G_Sport_Checkered", "Sportbrille (Karo)", 40, { "", "", -1 } },			
			{ "G_Sport_Blackyellow", "Sportbrille (schwarzgelb)", 40, { "", "", -1 } },
			{ "G_Sport_Blackred", "Sportbrille (Vulkan)", 40, { "", "", -1 } },
			{ "G_Sport_BlackWhite", "Sportbrille (weißschwarz)", 40, { "", "", -1 } },
			{ "G_Bandanna_tan", "Bandana (hellbraun)", 600, { "", "", -1 } },	
			{ "G_Bandanna_khk", "Bandana (khaki)", 600, { "", "", -1 } },	
			{ "G_Bandanna_beast", "Bandana (Monster)", 600, { "", "", -1 } },
			{ "G_Bandanna_oli", "Bandana (oliv)", 600, { "", "", -1 } },
			{ "G_Bandanna_blk", "Bandana (schwarz)", 600, { "", "", -1 } },
			{ "G_Bandanna_aviator", "Bandana (Pilotenbrille)", 800, { "", "", -1 } },
			{ "G_Bandanna_shades", "Bandana (Sonnenbrille)", 800, { "", "", -1 } },
			{ "G_Bandanna_sport", "Bandana (Sportbrille)", 800, { "", "", -1 } }

        };
        vests[] = {
            { "NONE", "Nichts", 0, { "", "", -1 } },
			{ "V_RebreatherB", "Tauchgerät (NATO)", 5000, { "", "", -1 } },
            { "V_Rangemaster_belt", "", 5000, { "", "", -1 } },
			{ "V_PlateCarrier2_tna_F ", "", 90000, { "", "", -1 } },
			{ "V_PlateCarrierSpec_tna_F", "", 90000, { "", "", -1 } },
			{ "V_PlateCarrier2_rgr_noflag_F", "", 90000, { "", "", -1 } },
			{ "V_PlateCarrierH_CTRG", "", 90000, { "", "", -1 } },
			{ "V_Chestrig_rgr", "Tragegeschirr (grün)", 10000, { "", "", -1 } },
			{ "V_TacVest_brn", "Taktische Weste (braun)", 15000, { "", "", -1 } },
			{ "V_TacVest_khk", "Taktische Weste (khaki)", 15000, { "", "", -1 } },
			{ "V_BandollierB_cbr", "Patronengurt (Coyote)", 8000, { "", "", -1 } },
			{ "V_BandollierB_rgr", "Patronengurt (grün)", 8000, { "", "", -1 } },
			{ "V_Chestrig_khk", "Tragegeschirr (khaki)", 10000, { "", "", -1 } },
			{ "V_Chestrig_oli", "Tragegeschirr (oliv)", 10000, { "", "", -1 } },
			{ "V_BandollierB_khk", "Patronengurt (khaki)", 8000, { "", "", -1 } },
			{ "V_BandollierB_oli", "Patronengurt (oliv)", 8000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Nichts", 0, { "", "", -1 } },
			{ "B_AssaultPack_cbr", "Angriffspack (Coyote)", 760, { "", "", -1 } },
			{ "B_AssaultPack_sgg", "Angriffspack (graugrün)", 760, { "", "", -1 } },
			{ "B_AssaultPack_rgr", "Angriffspack (grün)", 760, { "", "", -1 } },
			{ "B_AssaultPack_khk", "Angriffspack (khaki)", 760, { "", "", -1 } },
			{ "B_FieldPack_cbr", "Feldpack (Coyote)", 1500, { "", "", -1 } },
			{ "B_FieldPack_khk", "Feldpack (khaki)", 1500, { "", "", -1 } },
			{ "B_FieldPack_oli", "Feldpack (oliv)", 1500, { "", "", -1 } },
			{ "B_TacticalPack_oli", "Westpak (oliv)", 2000, { "", "", -1 } },
			{ "B_OutdoorPack_tan", "Westpak (sand)", 2000, { "", "", -1 } },
			{ "B_Kitbag_cbr", "Seesack (Coyote)", 2500, { "", "", -1 } },
			{ "B_Kitbag_sgg", "Seesack (giftgrün)", 2500, { "", "", -1 } },
			{ "B_ViperLightHarness_khk_F", "", 6000, { "", "", -1 } },
			{ "B_ViperLightHarness_oli_F", "", 6000, { "", "", -1 } },
			{ "B_ViperHarness_khk_F", "", 7000, { "", "", -1 } },
			{ "B_ViperHarness_oli_F", "", 7000, { "", "", -1 } },
			{ "B_Carryall_khk", "Großer Rucksack (khaki)", 5000, { "", "", -1 } },
			{ "B_Carryall_oli", "Großer Rucksack (oliv)", 5000, { "", "", -1 } },
			{ "B_Parachute", "Fallschirm", 5000, { "", "", -1 } }
        };
    };

	class rebellen {
		title = "Rebellenausstatter";
		license = "rebel";
		side = "civ";

		uniforms[] = {
            { "NONE", "Nichts", 0, { "", "", -1 } },
			{ "U_OG_Guerrilla_6_1", "Guerilla (Grüner Pullover)", 2000, { "", "", -1 } },
			{ "U_IG_leader", "Guerilla (Jacke)", 2000, { "", "", -1 } },
			{ "U_I_G_resistanceLeader_F", "Guerilla (Stavrou)", 2000, { "", "", -1 } },
			{ "U_IG_Guerilla1_1", "Guerilla (T-Shirt)", 2400, {"", "", -1} },
			{ "U_I_G_Story_Protagonist_F", "Kampfanzug (Kerry)", 3000, { "", "", -1 } },
			{ "U_O_OfficerUniform_ocamo", "Offizier (Hex)", 3000, { "", "", -1 } },
			{ "U_O_SpecopsUniform_ocamo", "Militäranzug (Hex)", 3000, { "", "", -1 } },
			{ "U_O_PilotCoveralls", "Fliegermontur (CSAT)", 3600, { "", "", -1 } },
			{ "U_B_T_Soldier_F", "", 15000, { "", "", -1 } },
			{ "U_B_T_Soldier_AR_F", "", 15000, { "", "", -1 } },
			{ "U_OG_Guerrilla_6_1", "", 15000, { "", "", -1 } },
			{ "U_O_GhillieSuit", "", 25000, { "", "", -1 } },
			{ "U_O_T_Sniper_F", "", 25000, { "", "", -1 } },
			{ "U_B_T_Sniper_F", "", 15000, { "", "", -1 } },	
			{ "U_O_T_Officer_F", "", 15000, { "", "", -1 } },
			{ "U_I_C_Soldier_Para_2_F", "", 15000, { "", "", -1 } },
			{ "U_I_C_Soldier_Para_4_F", "", 2000, { "", "", -1 } },
			{ "U_I_C_Soldier_Para_3_F", "", 15000, { "", "", -1 } },
			{ "U_I_C_Soldier_Para_1_F", "", 15000, { "", "", -1 } },
			{ "U_B_T_Soldier_SL_F", "", 15000, { "", "", -1 } },
			{ "U_O_FullGhillie_lsh", "Voll-Ghillie (CSAT)", 90000, { "", "", -1 } },
			{ "U_O_FullGhillie_sard", "Voll-Ghillie (CSAT)", 90000, { "", "", -1 } },
			{ "U_O_FullGhillie_ard", "Voll-Ghillie (CSAT)", 90000, { "", "", -1 } },
			{ "U_O_T_FullGhillie_tna_F", "", 90000, { "", "", -1 } },
			{ "U_B_T_FullGhillie_tna_F", "", 90000, { "", "", -1 } }
		};

		headgear[] = {
            { "NONE", "Nichts", 0, { "", "", -1 } },
			{ "H_HelmetO_ocamo", "", 140000, { "", "", -1 } },
			{ "H_HelmetB_camo ", "", 140000, { "", "", -1 } },
			{ "H_HelmetB_paint ", "", 40000, { "", "", -1 } },
			{ "H_HelmetB_light", "", 30000, { "", "", -1 } },
			{ "H_Bandanna_cbr", "Bandana (Coyote)", 800, { "", "", -1 } },
			{ "H_Bandanna_sgg", "Bandana (graugrün)", 800, { "", "", -1 } },
			{ "H_Bandanna_khk_hs", "Bandana (Headset)", 2500, { "", "", -1 } },
			{ "H_Bandanna_mcamo", "Bandana (khaki)", 800, { "", "", -1 } },
			{ "H_Bandanna_mcamo", "Bandana (MTP)", 800, { "", "", -1 } },
			{ "H_Bandanna_mcamo", "Bandana (sand)", 800, { "", "", -1 } },
			{ "H_Bandanna_gry", "Bandana (schwarz)", 800, { "", "", -1 } },
			{ "H_Bandanna_camo", "Bandana (Wald)", 800, { "", "", -1 } },
			{ "H_Booniehat_khk_hs", "Boonie Hat(Headset)", 2500, { "", "", -1 } },
			{ "H_Booniehat_mcamo", "Boonie Hat (MTP)", 1500, { "", "", -1 } },		
			{ "H_Cap_oli_hs", "Cap (Headset)", 2500, { "", "", -1 } },
			{ "H_Cap_brn_SPECOPS", "Cap (Hex)", 1060, { "", "", -1 } },
			{ "H_Cap_tan_specops_US", "Cap (US MTP)", 1060, { "", "", -1 } },
			{ "H_MilCap_blue", "Feldmütze (blau)", 1600, { "", "", -1 } },
			{ "H_MilCap_gry", "Feldmütze (grau)", 1600, { "", "", -1 } },
			{ "H_MilCap_oucamo", "Feldmütze (Headset)", 1600, { "", "", -1 } },
			{ "H_MilCap_ocamo", "Feldmütze (Hex)", 1600, { "", "", -1 } },
			{ "H_MilCap_mcamo", "Feldmütze (MTP)", 1600, { "", "", -1 } },
			{ "H_ShemagOpen_tan", "Shemag (hellbraun)", 1700, { "", "", -1 } },
			{ "H_Shemag_khk", "Shemag (khaki)", 1700, { "", "", -1 } },
			{ "H_Shemag_olive", "Shemag (oliv)", 1700, { "", "", -1 } },
			{ "H_ShemagOpen_khk", "Shemag (weiß)", 1700, { "", "", -1 } }
		};

		goggles[] = {
            { "NONE", "Nichts", 0, { "", "", -1 } },
			{ "G_Shades_Blue", "Sonnenbrille (blau)", 10, { "", "", -1} },
			{ "G_Shades_Green", "Sonnenbrille (grün)", 10, { "", "", -1} },
			{ "G_Shades_Red", "Sonnenbrille (rot)", 10, { "", "", -1} },
			{ "G_Shades_Black", "Sonnenbrille (schwarz)", 10, { "", "", -1} },	
			{ "G_Sport_Blackred", "Sportbrille (Vulkan)", 16, { "", "", -1 } },					
			{ "G_Aviator", "Fliegerbrille", 15, { "", "", -1 } },
			{ "G_Combat", "Kampfbrille", 460, { "", "", -1 } },
			{ "G_Lowprofile", "Motorradbrille", 460, { "", "", -1 } },
			{ "G_Tactical_Clear", "Taktische Brille", 80, { "", "", -1 } },
			{ "G_Tactical_Black", "Taktische Sonnenbrille", 80, { "", "", -1 } },
			{ "G_Bandanna_tan", "Bandana (hellbraun)", 600, { "", "", -1 } },	
			{ "G_Bandanna_khk", "Bandana (khaki)", 600, { "", "", -1 } },	
			{ "G_Bandanna_beast", "Bandana (Monster)", 600, { "", "", -1 } },
			{ "G_Bandanna_oli", "Bandana (oliv)", 600, { "", "", -1 } },
			{ "G_Bandanna_blk", "Bandana (schwarz)", 600, { "", "", -1 } },
			{ "G_Bandanna_aviator", "Bandana (Pilotenbrille)", 800, { "", "", -1 } },
			{ "G_Bandanna_shades", "Bandana (Sonnenbrille)", 800, { "", "", -1 } },
			{ "G_Bandanna_sport", "Bandana (Sportbrille)", 800, { "", "", -1 } }
		};

		vests[] = {
            { "NONE", "Nichts", 0, { "", "", -1 } },
			{ "V_PlateCarrier2_tna_F ", "", 90000, { "", "", -1 } },
			{ "V_PlateCarrierSpec_tna_F", "", 90000, { "", "", -1 } },
			{ "V_PlateCarrier2_rgr_noflag_F", "", 90000, { "", "", -1 } },
			{ "V_PlateCarrierH_CTRG", "", 90000, { "", "", -1 } },
			{ "V_Chestrig_rgr", "Tragegeschirr (grün)", 10000, { "", "", -1 } },
			{ "V_TacVest_brn", "Taktische Weste (braun)", 15000, { "", "", -1 } },
			{ "V_TacVest_khk", "Taktische Weste (khaki)", 15000, { "", "", -1 } },
			{ "V_BandollierB_cbr", "Patronengurt (Coyote)", 8000, { "", "", -1 } },
			{ "V_BandollierB_rgr", "Patronengurt (grün)", 8000, { "", "", -1 } },
			{ "V_Chestrig_khk", "Tragegeschirr (khaki)", 10000, { "", "", -1 } },
			{ "V_Chestrig_oli", "Tragegeschirr (oliv)", 10000, { "", "", -1 } },
			{ "V_BandollierB_khk", "Patronengurt (khaki)", 8000, { "", "", -1 } },
			{ "V_BandollierB_oli", "Patronengurt (oliv)", 8000, { "", "", -1 } }
		};

		backpacks[] = {
            { "NONE", "Nichts", 0, { "", "", -1 } },
			{ "B_AssaultPack_ocamo", "Angriffspack (Hex)", 400, { "", "", -1 } },	
			{ "B_AssaultPack_mcamo", "Angriffspack (MTP)", 400, { "", "", -1 } },
			{ "B_FieldPack_ocamo", "Feldpack (Hex)", 600, { "", "", -1 } },
			{ "B_TacticalPack_mcamo", "Westpak (MTP)", 1000, { "", "", -1 } },
			{ "B_TacticalPack_ocamo", "Westpak (Hex)", 1000, { "", "", -1 } },
			{ "B_Kitbag_mcamo", "Seesack (MTP)", 2000, { "", "", -1 } },			
			{ "B_Carryall_ocamo", "Großer Rucksack (Hex)", 4500, { "", "", -1 } },
			{ "B_Bergen_hex_F", "Bergen Rucksack", 100000, { "", "", -1 } },
			{ "B_Carryall_mcamo", "Großer Rucksack (MTP)", 4500, { "", "", -1 } }
		};
	};
	
	class pvpzone {
		title = "Rebellenausstatter";
		license = "pvp";
		side = "civ";

		uniforms[] = {
            { "NONE", "Nichts", 0, { "", "", -1 } },
			{ "U_O_FullGhillie_lsh", "Voll-Ghillie (CSAT)", 50000, { "", "", -1 } },
			{ "U_O_FullGhillie_sard", "Voll-Ghillie (CSAT)", 50000, { "", "", -1 } },
			{ "U_O_FullGhillie_ard", "Voll-Ghillie (CSAT)", 50000, { "", "", -1 } },
			{ "U_O_T_FullGhillie_tna_F", "", 50000, { "", "", -1 } },
			{ "U_B_T_FullGhillie_tna_F", "", 50000, { "", "", -1 } }
		};

		headgear[] = {
            { "NONE", "Nichts", 0, { "", "", -1 } },
			{ "H_Bandanna_cbr", "Bandana (Coyote)", 800, { "", "", -1 } },
			{ "H_Bandanna_sgg", "Bandana (graugrün)", 800, { "", "", -1 } },
			{ "H_Bandanna_khk_hs", "Bandana (Headset)", 2500, { "", "", -1 } },
			{ "H_Bandanna_mcamo", "Bandana (khaki)", 800, { "", "", -1 } },
			{ "H_Bandanna_mcamo", "Bandana (MTP)", 800, { "", "", -1 } },
			{ "H_Bandanna_mcamo", "Bandana (sand)", 800, { "", "", -1 } },
			{ "H_Bandanna_gry", "Bandana (schwarz)", 800, { "", "", -1 } },
			{ "H_Bandanna_camo", "Bandana (Wald)", 800, { "", "", -1 } },
			{ "H_Booniehat_khk_hs", "Boonie Hat(Headset)", 2500, { "", "", -1 } },
			{ "H_Booniehat_mcamo", "Boonie Hat (MTP)", 1500, { "", "", -1 } },		
			{ "H_Cap_oli_hs", "Cap (Headset)", 2500, { "", "", -1 } },
			{ "H_Cap_brn_SPECOPS", "Cap (Hex)", 1060, { "", "", -1 } },
			{ "H_Cap_tan_specops_US", "Cap (US MTP)", 1060, { "", "", -1 } },
			{ "H_MilCap_blue", "Feldmütze (blau)", 1600, { "", "", -1 } },
			{ "H_MilCap_gry", "Feldmütze (grau)", 1600, { "", "", -1 } },
			{ "H_MilCap_oucamo", "Feldmütze (Headset)", 1600, { "", "", -1 } },
			{ "H_MilCap_ocamo", "Feldmütze (Hex)", 1600, { "", "", -1 } },
			{ "H_MilCap_mcamo", "Feldmütze (MTP)", 1600, { "", "", -1 } },
			{ "H_ShemagOpen_tan", "Shemag (hellbraun)", 1700, { "", "", -1 } },
			{ "H_Shemag_khk", "Shemag (khaki)", 1700, { "", "", -1 } },
			{ "H_Shemag_olive", "Shemag (oliv)", 1700, { "", "", -1 } },
			{ "H_ShemagOpen_khk", "Shemag (weiß)", 1700, { "", "", -1 } },
			{ "H_MilCap_ghex_F", "", 1700, { "", "", -1 } },
			{ "H_MilCap_tna_F", "", 1700, { "", "", -1 } }
		};

		goggles[] = {
            { "NONE", "Nichts", 0, { "", "", -1 } },
			{ "G_Shades_Blue", "Sonnenbrille (blau)", 10, { "", "", -1} },
			{ "G_Shades_Green", "Sonnenbrille (grün)", 10, { "", "", -1} },
			{ "G_Shades_Red", "Sonnenbrille (rot)", 10, { "", "", -1} },
			{ "G_Shades_Black", "Sonnenbrille (schwarz)", 10, { "", "", -1} },	
			{ "G_Sport_Blackred", "Sportbrille (Vulkan)", 16, { "", "", -1 } },					
			{ "G_Aviator", "Fliegerbrille", 15, { "", "", -1 } },
			{ "G_Bandanna_tan", "Bandana (hellbraun)", 600, { "", "", -1 } },	
			{ "G_Bandanna_khk", "Bandana (khaki)", 600, { "", "", -1 } },	
			{ "G_Bandanna_beast", "Bandana (Monster)", 600, { "", "", -1 } },
			{ "G_Bandanna_oli", "Bandana (oliv)", 600, { "", "", -1 } },
			{ "G_Bandanna_blk", "Bandana (schwarz)", 600, { "", "", -1 } },
			{ "G_Bandanna_aviator", "Bandana (Pilotenbrille)", 800, { "", "", -1 } },
			{ "G_Bandanna_shades", "Bandana (Sonnenbrille)", 800, { "", "", -1 } },
			{ "G_Bandanna_sport", "Bandana (Sportbrille)", 800, { "", "", -1 } },
			{ "G_Combat", "Kampfbrille", 460, { "", "", -1 } },
			{ "G_Lowprofile", "Motorradbrille", 460, { "", "", -1 } },			
			{ "G_Balaclava_oli", "Balaclava (oliv)", 1000, { "", "", -1 } },
			{ "G_Balaclava_blk", "Balaclava (schwarz)", 1000, { "", "", -1 } },
			{ "G_Balaclava_combat", "Balaclava (Kampfbrille)", 1000, { "", "", -1 } },
			{ "G_Balaclava_lowprofile", "Balaclava (Motorradbrille)", 1000, { "", "", -1 } },
			{ "G_Tactical_Clear", "Taktische Brille", 80, { "", "", -1 } },
			{ "G_Tactical_Black", "Taktische Sonnenbrille", 80, { "", "", -1 } },
			{ "G_Balaclava_TI_tna_F", "", 80, { "", "", -1 } }
		};

		vests[] = {
            { "NONE", "Nichts", 0, { "", "", -1 } },
			{ "V_TacVest_oli", "Taktische Weste (oliv)", 15000, { "", "", -1 } },
			{ "V_TacVest_camo", "Taktische Weste (Tarn hell)", 15000, { "", "", -1 } },
			{ "V_I_G_resistanceLeader_F", "Taktische Weste (Tarn dunkel)", 15000, { "", "", -1 } },
			{ "V_BandollierB_ghex_F", "", 15000, { "", "", -1 } },
			{ "V_HarnessO_ghex_F", "", 15000, { "", "", -1 } },
			{ "V_HarnessOGL_ghex_F", "", 15000, { "", "", -1 } },
			{ "V_PlateCarrier1_tna_F", "", 40000, { "", "", -1 } }
		};

		backpacks[] = {
            { "NONE", "Nichts", 0, { "", "", -1 } },
			{ "B_AssaultPack_ocamo", "Angriffspack (Hex)", 400, { "", "", -1 } },	
			{ "B_AssaultPack_mcamo", "Angriffspack (MTP)", 400, { "", "", -1 } },
			{ "B_FieldPack_ocamo", "Feldpack (Hex)", 600, { "", "", -1 } },
			{ "B_TacticalPack_mcamo", "Westpak (MTP)", 1000, { "", "", -1 } },
			{ "B_Kitbag_mcamo", "Seesack (MTP)", 2000, { "", "", -1 } },			
			{ "B_FieldPack_ghex_F", "", 2000, { "", "", -1 } },
			{ "B_Carryall_ghex_F", "Angriffspack (Hex)", 5000, { "", "", -1 } },
			{ "B_ViperHarness_ghex_F", "", 6000, { "", "", -1 } },
			{ "B_ViperLightHarness_ghex_F", "", 7000, { "", "", -1 } },
			{ "B_Bergen_tna_F", "", 15000, { "", "", -1 } }
		};
	};

    class cop {
        title = "STR_Shops_C_Police";
        license = "";
        side = "cop";
        uniforms[] = {
            { "NONE", "Nichts", 0, { "", "", -1 } },
			{ "U_Rangemaster", "Kurzarm-Uniform", 750, { "life_coplevel", "SCALAR", 3 } },
			{ "U_BG_Guerilla2_1", "Langarm-Uniform", 750, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam", "SWAT-Uniform", 750, { "life_coplevel", "SCALAR", 8 } },
			{ "U_B_HeliPilotCoveralls", "Pilotenoverall", 750, { "life_coplevel", "SCALAR", 3 } },
			{ "U_B_FullGhillie_lsh", "Ghillie-Anzug", 750, { "life_coplevel", "SCALAR", 5 } },
			{ "U_B_FullGhillie_sard", "Ghillie-Anzug", 750, { "life_coplevel", "SCALAR", 5 } },
			{ "U_B_FullGhillie_ard", "Ghillie-Anzug", 750, { "life_coplevel", "SCALAR", 5 } },
			{ "U_B_Wetsuit", "Taucheranzug", 750, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Nichts", 0, { "", "", -1 } },
			{ "H_Cap_police", "Cap (Polizei)", 100, { "", "", -1 } },
			{ "H_Cap_blk", "Cap (Schwarz)", 100, { "", "", -1 } },
			{ "H_Watchcap_blk", "Beanie (schwarz)", 100, { "", "", -1 } },
            { "H_HelmetSpecB_blk", "Kampfhelm", 100, { "", "", -1 } },
			{ "H_HelmetB_black", "Kampfhelm 2", 100, { "", "", -1 } },
			{ "H_PilotHelmetHeli_B", "Pilotenhelm", 100, { "life_coplevel", "SCALAR", 3 } },
			{ "H_Beret_blk_POLICE", "Barett (schwarz)", 100, { "life_coplevel", "SCALAR", 6 } },
			{ "H_Beret_02", "Barett (Unteroffizier)", 100, { "life_coplevel", "SCALAR", 7 } },
			{ "H_Beret_Colonel", "Barett (Offizier)", 100, { "life_coplevel", "SCALAR", 8 } }
        };
        goggles[] = {
            { "NONE", "Nichts", 0, { "", "", -1 } },
            { "G_Squares", "", 10, { "", "", -1 } },
            { "G_Shades_Blue", "", 20, { "", "", -1 } },
            { "G_Sport_Blackred", "", 20, { "", "", -1 } },
            { "G_Sport_Checkered", "", 20, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 20, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 20, { "", "", -1 } },
            { "G_Tactical_Black", "", 25, { "life_coplevel", "SCALAR", 8 } },
            { "G_Balaclava_TI_blk_F", "", 30, { "", "", -1 } },
            { "G_Combat", "", 55, { "", "", -1 } },
            { "G_Aviator", "", 100, { "", "", -1 } },
            { "G_Lady_Mirror", "", 150, { "", "", -1 } },
            { "G_Lady_Dark", "", 150, { "", "", -1 } },
            { "G_Lady_Blue", "", 150, { "", "", -1 } },
			{ "G_Bandanna_blk", "Bandana (schwarz)", 400, { "life_coplevel", "SCALAR", 8 } },
			{ "G_Bandanna_aviator", "Bandana (Pilotenbrille)", 400, { "life_coplevel", "SCALAR", 8 } }
        };
        vests[] = {
            { "NONE", "Nichts", 0, { "", "", -1 } },
			{ "V_Rangemaster_belt", "Holster", 100, { "", "", -1 } },
			{ "V_TacVest_blk_POLICE", "Taktische Weste (Polizei)", 500, { "", "", -1 } },
			{ "V_PlateCarrier1_blk", "Leichter Tragegurt", 1000, { "life_coplevel", "SCALAR", 4 } },
            { "V_PlateCarrier2_blk", "Tragegurt", 1000, { "life_coplevel", "SCALAR", 6 } },
			{ "V_RebreatherB", "Tauchgerät", 200, { "", "", -1 } }		
        };
        backpacks[] = {
            { "NONE", "Nichts", 0, { "", "", -1 } },
			{ "B_TacticalPack_blk", "", 100, { "", "", -1 } },
			{ "B_ViperHarness_blk_F", "", 100, { "", "", -1 } },
			{ "B_Carryall_ocamo", "Carryall Backpack Hex", 7500, { "", "", -1 } },
			{ "B_BergenG", "Bergen Backpack", 20000, { "", "", -1 } },
			{ "B_Parachute", "Fallschirm", 5000, { "", "", -1 } }
        };
    };

    class dive {
        title = "STR_Shops_C_Diving";
        license = "dive";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_B_Wetsuit", "", 2000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } },
            { "G_Diving", "", 500, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_RebreatherB", "", 5000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } }
        };
    };

    class gun_clothing {
        title = "STR_Shops_C_Gun";
        license = "gun";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_Rangemaster_belt", "", 4900, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } }
        };
    };

    class gang_clothing {
        title = "STR_Shops_C_Gang";
        license = "";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_Rangemaster_belt", "", 1900, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } }
        };
    };

    class med_clothing {
        title = "STR_MAR_EMS_Clothing_Shop";
        license = "";
        side = "med";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_Rangemaster", "FARA-Techniker", 500, { "", "", -1 } },	
			{ "U_BG_Guerilla2_1", "FARA-Medic", 500, { "", "", -1 } },	
			{ "U_B_Wetsuit", "Neoprenanzug (NATO)", 100, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_Cap_blk", "Cap (schwarz)", 20, { "", "", -1 } },
			{ "H_Beret_blk", "", 20, { "", "", -1 } },
			{ "H_Cap_red", "Cap (rot)", 20, { "", "", -1 } },
			{ "H_PilotHelmetHeli_O", "Helipilotenhelm (schwarz)", 100, { "", "", -1 } },
			{ "H_RacingHelmet_1_red_F", "Sturzhelm (rot)", 160, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } },
			{ "G_Shades_Red", "Sonnenbrille (rot)", 20, {"", "", -1} },
			{ "G_Sport_Blackred", "Sportsonnenbrille (feuerrot)", 20, {"", "", -1} },			
			{ "G_Lady_Red", "Damensonnenbrille (Feuer)", 20, {"", "", -1} },
			{ "G_Spectacles", "Hornbrille", 20, {"", "", -1} },
			{ "G_Squares", "Designerbrille", 20, { "", "", -1} },
			{ "G_Spectacles_Tinted", "Getönte Brille", 20, {"", "", -1} },
			{ "G_Aviator", "Fliegerbrille", 20, { "", "", -1 } },
			{ "G_Diving", "Taucherbrille", 60, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
			{ "V_RebreatherB", "Tauchgerät (NATO)", 60, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } },
			{ "B_TacticalPack_rgr", "FARA Rucksack", 60, { "", "", -1 } },
			{ "B_Parachute", "Fallschirm", 5000, { "", "", -1 } }
        };
    };

    class reb {
        title = "STR_Shops_C_Rebel";
        license = "rebel";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_IG_Guerilla1_1", "", 5000, {"", "", -1} },
            { "U_I_G_Story_Protagonist_F", "", 7500, { "", "", -1 } },
            { "U_I_G_resistanceLeader_F", "", 11500, { "", "", -1 } },
            { "U_IG_leader", "Guerilla Leader", 15340, { "", "", -1 } },
            { "U_O_PilotCoveralls", "", 15610, { "", "", -1 } },
            { "U_O_SpecopsUniform_ocamo", "", 17500, { "", "", -1 } },
            { "U_O_GhillieSuit", "", 50000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
            { "H_Bandanna_camo", "", 650, { "", "", -1 } },
            { "H_ShemagOpen_khk", "", 800, { "", "", -1 } },
            { "H_ShemagOpen_tan", "", 850, { "", "", -1 } },
            { "H_Shemag_olive", "", 850, { "", "", -1 } },
            { "H_MilCap_oucamo", "", 1200, { "", "", -1 } },
            { "H_HelmetO_ocamo", "", 2500, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } },
            { "G_Shades_Black", "", 20, { "", "", -1 } },
            { "G_Shades_Blue", "", 20, { "", "", -1 } },
            { "G_Sport_Blackred", "", 25, { "", "", -1 } },
            { "G_Sport_Checkered", "", 25, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 25, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 25, { "", "", -1 } },
            { "G_Lowprofile", "", 30, { "", "", -1 } },
            { "G_Squares", "", 50, { "", "", -1 } },
            { "G_Combat", "", 125, { "", "", -1 } },
            { "G_Balaclava_blk", "", 150, { "", "", -1 } },
            { "G_Balaclava_combat", "", 150, { "", "", -1 } },
            { "G_Balaclava_lowprofile", "", 150, { "", "", -1 } },
            { "G_Balaclava_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_aviator", "", 150, { "", "", -1 } },
            { "G_Bandanna_beast", "", 150, { "", "", -1 } },
            { "G_Bandanna_blk", "", 150, { "", "", -1 } },
            { "G_Bandanna_khk", "", 150, { "", "", -1 } },
            { "G_Bandanna_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_shades", "", 150, { "", "", -1 } },
            { "G_Bandanna_sport", "", 150, { "", "", -1 } },
            { "G_Bandanna_tan", "", 150, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_BandollierB_cbr", "", 4500, { "", "", -1 } },
            { "V_HarnessO_brn", "", 7500, { "", "", -1 } },
            { "V_TacVest_khk", "", 12500, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } },
            { "B_OutdoorPack_blk", "", 500, { "", "", -1 } },
            { "B_AssaultPack_khk", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_dgtl", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_rgr", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_sgg", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_blk", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_cbr", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_mcamo", "", 2000, { "", "", -1 } },
            { "B_TacticalPack_oli", "", 2500, { "", "", -1 } },
            { "B_Kitbag_mcamo", "", 3500, { "", "", -1 } },
            { "B_Kitbag_sgg", "", 3500, { "", "", -1 } },
            { "B_Kitbag_cbr", "", 3500, { "", "", -1 } },
            { "B_FieldPack_blk", "", 5000, { "", "", -1 } },
            { "B_FieldPack_ocamo", "", 5000, { "", "", -1 } },
            { "B_FieldPack_oucamo", "", 5000, { "", "", -1 } },
            { "B_Bergen_sgg", "", 6500, { "", "", -1 } },
            { "B_Bergen_mcamo", "", 6500, { "", "", -1 } },
            { "B_Bergen_rgr", "", 6500, { "", "", -1 } },
            { "B_Bergen_blk", "", 6500, { "", "", -1 } },
            { "B_Carryall_ocamo", "", 7500, { "", "", -1 } },
            { "B_Carryall_oucamo", "", 7500, { "", "", -1 } },
            { "B_Carryall_mcamo", "", 7500, { "", "", -1 } },
            { "B_Carryall_oli", "", 7500, { "", "", -1 } },
            { "B_Carryall_khk", "", 7500, { "", "", -1 } },
            { "B_Carryall_cbr", "", 7500, { "", "", -1 } }
        };
    };

    class kart {
        title = "STR_Shops_C_Kart";
        license = "";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_C_Driver_1_black", "", 1500, { "", "", -1 } },
            { "U_C_Driver_1_blue", "", 1500, { "", "", -1 } },
            { "U_C_Driver_1_red", "", 1500, { "", "", -1 } },
            { "U_C_Driver_1_orange", "", 1500, { "", "", -1 } },
            { "U_C_Driver_1_green", "", 1500, { "", "", -1 } },
            { "U_C_Driver_1_white", "", 1500, { "", "", -1 } },
            { "U_C_Driver_1_yellow", "", 1500, { "", "", -1 } },
            { "U_C_Driver_2", "", 3500, { "", "", -1 } },
            { "U_C_Driver_1", "", 3600, { "", "", -1 } },
            { "U_C_Driver_3", "", 3700, { "", "", -1 } },
            { "U_C_Driver_4", "", 3700, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
            { "H_RacingHelmet_1_black_F", "", 1000, { "", "", -1 } },
            { "H_RacingHelmet_1_red_F", "", 1000, { "", "", -1 } },
            { "H_RacingHelmet_1_white_F", "", 1000, { "", "", -1 } },
            { "H_RacingHelmet_1_blue_F", "", 1000, { "", "", -1 } },
            { "H_RacingHelmet_1_yellow_F", "", 1000, { "", "", -1 } },
            { "H_RacingHelmet_1_green_F", "", 1000, { "", "", -1 } },
            { "H_RacingHelmet_1_F", "", 2500, { "", "", -1 } },
            { "H_RacingHelmet_2_F", "", 2500, { "", "", -1 } },
            { "H_RacingHelmet_3_F", "", 2500, { "", "", -1 } },
            { "H_RacingHelmet_4_F", "", 2500, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } }
        };
    };
};
