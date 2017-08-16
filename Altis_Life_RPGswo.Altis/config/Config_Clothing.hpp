/*
*    ARRAY FORMAT:
*        0: STRING (Classname)
*        1: STRING (Display Name, leave as "" for default)
*        2: SCALAR (Price)
*        3: STRING (Conditions) - Must return boolean :
*            String can contain any amount of conditions, aslong as the entire
*            string returns a boolean. This allows you to check any levels, licenses etc,
*            in any combination. For example:
*                "call DWEV_coplevel && license_civ_someLicense"
*            This will also let you call any other function.
*
*   Clothing classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Equipment
*   Backpacks/remaining classnames can be found here (TIP: Search page for "pack"): https://community.bistudio.com/wiki/Arma_3_CfgVehicles_EMPTY
*
*/
class Clothing {
	
    class bruce {
        title = "Bekleidungsgeschäft";
        conditions = "";
        side = "civ";
        uniforms[] = {
//			{ "NONE", "Entferne Kleidung", 0, "" },
            { "U_C_Poloshirt_blue", "Hello Kitty", 5000, "lc_girl" },
            { "U_C_Poloshirt_stripped", "Streifen Kleidung", 200, "" },
            { "U_C_Poloshirt_redwhite", "Rot/Weiß Kleidung", 200, "" },
            { "U_C_Poloshirt_salmon", "Salmon Kleidung", 200, "" },
            { "U_C_Poor_2", "Blaue Kleidung", 300, "" },
            { "U_C_Poloshirt_burgundy", "Luna Kleidung", 350, "" },
            { "U_C_Poloshirt_tricolour", "Stella Kleidung", 350, "" },
            { "U_IG_Guerilla3_1", "Braune Kleidung", 1000, "" },
//			{ "NONE", "Mehr ab VIP Level 3", 0, "call DWEV_viplevel <= 2" },
//			{ "NONE", "--- VIP Level 3 ---", 0, "call DWEV_viplevel >= 3" },
			{ "U_C_HunterBody_grn", "Jäger Kleidung", 1500, "call DWEV_viplevel >= 3" },
            { "U_BG_Guerilla1_1", "Guerilla Garment", 1500, "call DWEV_viplevel >= 3" },
            { "U_BG_Guerilla2_3", "Guerilla Blau/Grün", 1500, "call DWEV_viplevel >= 3" },
            { "U_BG_Guerilla3_1", "Guerilla Smocks", 1500, "call DWEV_viplevel >= 3" },
            { "U_BG_Guerilla3_2", "Guerilla Smocks 1", 1500, "call DWEV_viplevel >= 3" },
			{ "U_C_Man_casual_5_F", "Polohemd Gelb", 2000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 3)" }, //Apex
			{ "U_C_Man_casual_6_F", "Polohemd Rot", 2000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 3)" }, //Apex
			{ "U_C_man_sport_2_F", "Strand Orange", 2500, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 3)" }, //Apex
			{ "U_I_C_Soldier_Bandit_4_F", "Checker", 3000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 3)" }, //Apex
			{ "U_I_C_Soldier_Bandit_5_F", "Tank Top", 3000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 3)" }, //Apex
//			{ "NONE", "Mehr ab VIP Level 5", 0, "call DWEV_viplevel <= 4" },
//			{ "NONE", "--- VIP Level 5 ---", 0, "call DWEV_viplevel >= 5" },
			{ "U_OrestesBody", "Surfer Kleidung", 1200, "call DWEV_viplevel >= 5" },
			{ "U_C_WorkerCoveralls", "Arbeiter Kleidung", 2500, "call DWEV_viplevel >= 5" },
			{ "U_C_man_sport_1_F", "Strand Schwarz", 2500, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 5)" }, //Apex
			{ "U_Marshal", "Marshal Kleidung", 3000, "call DWEV_viplevel >= 5" },
			{ "U_I_C_Soldier_Bandit_2_F", "Totenkopf Kleidung", 3000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 5)" }, //Apex
			{ "U_I_C_Soldier_Bandit_3_F", "Jeans + Halstuch", 3000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 5)" }, //Apex
			{ "U_C_Journalist", "Presse Kleidung", 4000, "call DWEV_viplevel >= 5" },
			{ "U_NikosBody", "Drachen Kleidung", 5000, "call DWEV_viplevel >= 5" },
//			{ "NONE", "--- APEX Kleidung ---", 0, "DWEV_OwnedApexDLC" },
//			{ "NONE", "Mehr Kleidung mit Apex!", 0, "!DWEV_OwnedApexDLC" },
			{ "U_C_Man_casual_1_F", "Polohemd Navy", 2000, "DWEV_OwnedApexDLC" },
			{ "U_C_Man_casual_2_F", "Polohemd Blau", 2000, "DWEV_OwnedApexDLC" },
			{ "U_C_Man_casual_3_F", "Polohemd Grün", 2000, "DWEV_OwnedApexDLC" },
			{ "U_C_Man_casual_4_F", "Polohemd Sky", 2000, "DWEV_OwnedApexDLC" },	
			{ "U_C_man_sport_3_F", "Strand Blau", 2500, "DWEV_OwnedApexDLC" },
            { "U_I_C_Soldier_Bandit_1_F", "Firly Kleidung", 3000, "DWEV_OwnedApexDLC" }
			
			
        };
        headgear[] = {
//          { "NONE", "Entferne Kopfbedeckung", 0, "" },			
			{ "H_Cap_red", "Cap Rot", 200, "" },
			{ "H_Cap_blu", "Cap Blau", 200, "" },
			{ "H_Cap_oli", "Cap Olive", 200, "" },
			{ "H_Cap_tan", "Cap Tan", 200, "" },
			{ "H_Cap_blk", "Cap Schwarz", 200, "" },
			{ "H_Hat_brown", "Hut Braun", 300, "" },
			{ "H_Bandanna_gry", "Bandanna Schwarz", 350, "" },
			{ "H_Bandanna_cbr", "Bandanna Coyote", 350, "" },
			{ "H_Bandanna_khk", "Bandanna Khaki", 350, "" },
			{ "H_Bandanna_sgg", "Bandanna Sage", 350, "" },
			{ "H_BandMask_blk", "Bandanna Maske Schwarz", 350, "" },
//			{ "NONE", "Mehr ab VIP Level 1", 0, "call DWEV_viplevel <= 0" },
//			{ "NONE", "--- VIP Level 1 ---", 0, "call DWEV_viplevel >= 1" },
			{ "H_Cap_grn", "Cap Grün", 200, "call DWEV_viplevel >= 1" },
			{ "H_Cap_grn_BI", "Cap BI", 200, "call DWEV_viplevel >= 1" },
			{ "H_Cap_blk_Raven", "Cap AFF", 200, "call DWEV_viplevel >= 1" },
			{ "H_Cap_blk_ION", "Cap ION", 200, "call DWEV_viplevel >= 1" },
			{ "H_Cap_oli_hs", "Cap Olive Headset", 200, "call DWEV_viplevel >= 1" },
			{ "H_Cap_press", "Cap Presse", 200, "call DWEV_viplevel >= 1" },
			{ "H_Cap_usblack", "Cap US Schwarz", 200, "call DWEV_viplevel >= 1" },
			{ "H_Cap_surfer", "Cap Surfer", 200, "call DWEV_viplevel >= 1" },
			{ "H_Cap_marshal", "Cap Marshal", 200, "call DWEV_viplevel >= 1" },
			{ "H_Hat_blue", "Hut Blau", 300, "call DWEV_viplevel >= 1" },
			{ "H_Hat_camo", "Hut Camo", 300, "call DWEV_viplevel >= 1" },
			{ "H_Hat_grey", "Hut Grau", 300, "call DWEV_viplevel >= 1" },
			{ "H_Hat_checker", "Hut Checker", 300, "call DWEV_viplevel >= 1" },
			{ "H_Hat_tan", "Hut Tan", 300, "call DWEV_viplevel >= 1" },
			{ "H_Cap_oli_Syndikat_F", "Cap Olive", 500, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 1)" }, //APEX
			{ "H_Cap_blk_Syndikat_F", "Cap Schwarz", 500, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 1)" }, //APEX
//			{ "NONE", "Mehr ab VIP Level 2", 0, "call DWEV_viplevel <= 1" },
//			{ "NONE", "--- VIP Level 2 ---", 0, "call DWEV_viplevel >= 2" },
			{ "H_StrawHat", "Strohhut", 325, "call DWEV_viplevel >= 2" },
			{ "H_TurbanO_blk", "Turban Schwarz", 325, "call DWEV_viplevel >= 2" },
			{ "H_StrawHat_dark", "Strohhut Dunkel", 325, "call DWEV_viplevel >= 2" },
			{ "H_Bandanna_blu", "Bandanna Blau", 350, "call DWEV_viplevel >= 2" },
			{ "H_Bandanna_camo", "Bandanna Wald", 350, "call DWEV_viplevel >= 2" },
			{ "H_Bandanna_mcamo", "Bandanna MTP", 350, "call DWEV_viplevel >= 2" },
			{ "H_Bandanna_surfer", "Bandanna Surfer", 350, "call DWEV_viplevel >= 2" },
			{ "H_Bandanna_surfer_grn", "Bandanna Surfer Grün", 350, "call DWEV_viplevel >= 2" },
			{ "H_Bandanna_surfer_blk", "Bandanna Surfer Schwarz", 350, "call DWEV_viplevel >= 2" },
			{ "H_Bandanna_khk_hs", "Bandanna Headset", 350, "call DWEV_viplevel >= 2" },
			{ "H_Bandanna_sand", "Bandanna Sand", 350, "call DWEV_viplevel >= 2" },
			{ "H_Booniehat_oli", "Booniehat Olive", 425, "call DWEV_viplevel >= 2" },
			{ "H_Booniehat_indp", "Booniehat Khaki", 425, "call DWEV_viplevel >= 2" },
			{ "H_Booniehat_mcamo", "Booniehat MTP", 425, "call DWEV_viplevel >= 2" },
			{ "H_Booniehat_grn", "Booniehat Grün", 425, "call DWEV_viplevel >= 2" },
			{ "H_Booniehat_tan", "Booniehat Tan", 425, "call DWEV_viplevel >= 2" },
			{ "H_Booniehat_dirty", "Booniehat Dreckig", 425, "call DWEV_viplevel >= 2" },
			{ "H_Booniehat_dgtl", "Booniehat AAF", 425, "call DWEV_viplevel >= 2" },
			{ "H_Booniehat_khk", "Booniehat Khaki", 425, "call DWEV_viplevel >= 2" },
			{ "H_Booniehat_khk_hs", "Booniehat Khaki Headset", 425, "call DWEV_viplevel >= 2" },
			{ "H_Booniehat_tna_F", "Booniehat Tropic", 500, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 2)" }, //APEX
			{ "H_Helmet_Skate", "Sakter Helm", 3000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 2)" }, //APEX
//			{ "NONE", "--- APEX Kopfbedeckung ---", 0, "DWEV_OwnedApexDLC" },
//			{ "NONE", "Mehr Hüte mit Apex!", 0, "!DWEV_OwnedApexDLC" },
			{ "H_Cap_tan_Syndikat_F", "Cap Tan", 500, "DWEV_OwnedApexDLC" }, //APEX
			{ "H_Cap_grn_Syndikat_F", "Cap Grün", 500, "DWEV_OwnedApexDLC" } //APEX
        };
        goggles[] = {
//          { "NONE", "Entferne Brille", 0, "" },
			{ "G_Shades_Black", "Brille Schwarz", 200, "" },
			{ "G_Squares", "Quatratische Brille", 300, "" },
//			{ "NONE", "Mehr ab VIP Level 1", 0, "call DWEV_viplevel <= 0" },
//			{ "NONE", "--- VIP Level 1 ---", 0, "call DWEV_viplevel >= 1" },
			{ "G_Shades_Blue", "Brille Blau", 200, "call DWEV_viplevel >= 1" },
//			{ "G_Sport_Blackred", "Sportbrille Schwarz-Rot", "call DWEV_viplevel >= 1" }, //deaktiviert weil maskierung Polizei
			{ "G_Sport_Checkered", "Sportbrille Rot-Kariert", 200, "call DWEV_viplevel >= 1" },
			{ "G_Sport_Blackyellow", "Sportbrille Schwarz-Gelb", 200, "call DWEV_viplevel >= 1" },
			{ "G_Sport_BlackWhite", "Sportbrille Schwarz-Weiß", 200, "call DWEV_viplevel >= 1" },
			{ "G_Sport_Greenblack", "Sportbrille Schwarz-Grün", 200, "call DWEV_viplevel >= 1" },
//			{ "NONE", "Mehr ab VIP Level 2", 0, "call DWEV_viplevel <= 1" },
//			{ "NONE", "--- VIP Level 2 ---", 0, "call DWEV_viplevel >= 2" },
			{ "G_Shades_Green", "Brille Grün", 200, "call DWEV_viplevel >= 2" },
			{ "G_Shades_Red", "Brille Rot", 200, "call DWEV_viplevel >= 2" },
			{ "G_Sport_Red", "Sportbrille Rot", 200, "call DWEV_viplevel >= 2" },
			{ "G_Lady_Mirror", "Lady Normal", 300, "call DWEV_viplevel >= 2" },
			{ "G_Lady_Dark", "Lady Dunkel", 300, "call DWEV_viplevel >= 2" },
			{ "G_Lady_Blue", "Lady Blau", 300, "call DWEV_viplevel >= 2" },
			{ "G_Aviator", "Fliegerbrille", 400, "call DWEV_viplevel >= 2" },
			{ "G_Lowprofile", "Flachbrille", 400, "call DWEV_viplevel >= 2" }
        };
        vests[] = {
//			{ "NONE", "Im Waffen oder Rebellen Shop", 0, "" }
        };
        backpacks[] = {
//          { "NONE", "Entferne Rucksack", 0, "" },
            { "B_Kitbag_cbr", "Monster Hai", 7000, "lc_girl" },
			{ "B_Carryall_khk", "Carryall Hellgrün", 7000, "" },
//			{ "NONE", "Mehr ab VIP Level 4", 0, "call DWEV_viplevel <= 3" },
//			{ "NONE", "--- VIP Level 4 ---", 0, "call DWEV_viplevel >= 4" },
			{ "B_AssaultPack_khk", "Assault Pack Hellgrün", 7000, "call DWEV_viplevel >= 4" },
			{ "B_AssaultPack_dgtl", "Assault Pack Desert Camo", 7000, "call DWEV_viplevel >= 4" },
			{ "B_AssaultPack_rgr", "Assault Pack Olive", 7000, "call DWEV_viplevel >= 4" },
			{ "B_AssaultPack_sgg", "Assault Pack Sage", 7000, "call DWEV_viplevel >= 4" },
			{ "B_AssaultPack_blk", "Assault Pack Black", 7000, "call DWEV_viplevel >= 4" },
			{ "B_AssaultPack_mcamo", "Assault Pack Wald Camo", 7000, "call DWEV_viplevel >= 4" },
			{ "B_AssaultPack_ocamo", "Assault Pack Hex", 7000, "call DWEV_viplevel >= 4" },
			{ "B_AssaultPack_cbr", "Assault Pack Tan", 7000, "call DWEV_viplevel >= 4" },
			{ "B_AssaultPack_tna_F", "Assault Pack Tropic", 7000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 4)" }, //APEX
			{ "B_Kitbag_rgr", "Kitbag Grün", 7000, "call DWEV_viplevel >= 4" },
			{ "B_Kitbag_mcamo", "Kitbag Wald Camo", 7000, "call DWEV_viplevel >= 4" },
			{ "B_Kitbag_sgg", "Kitbag Sage", 7000, "call DWEV_viplevel >= 4" },
//			{ "NONE", "Mehr ab VIP Level 5", 0, "call DWEV_viplevel <= 4" },
//			{ "NONE", "--- VIP Level 5 ---", 0, "call DWEV_viplevel >= 5" },
			{ "B_Bergen_sgg", "Bergen Sage", 7000, "call DWEV_viplevel >= 5" },
			{ "B_Bergen_mcamo", "Bergen Waldcamo", 7000, "call DWEV_viplevel >= 5" },
			{ "B_Bergen_rgr", "Bergen Olive", 7000, "call DWEV_viplevel >= 5" },
			{ "B_Bergen_blk", "Bergen Black", 7000, "call DWEV_viplevel >= 5" },
			{ "B_Carryall_ocamo", "Carryall Desert Camo", 7000, "call DWEV_viplevel >= 5" },
			{ "B_Carryall_oucamo", "Carryall Blau Camo", 7000, "call DWEV_viplevel >= 5" },
			{ "B_Carryall_mcamo", "Carryall Wald Camo", 7000, "call DWEV_viplevel >= 5" },
			{ "B_Carryall_ghex_F", "Carryall Grün Hex", 7000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 5)" }, //APEX
//			{ "NONE", "--- APEX Rucksäcke ---", 0, "DWEV_OwnedApexDLC" },
//			{ "NONE", "Mehr Rucksäcke mit Apex!", 0, "!DWEV_OwnedApexDLC" },
			{ "B_FieldPack_ghex_F", "Field Pack Grün Hex", 7000, "DWEV_OwnedApexDLC" } //APEX
        };
    };
	
	class kart {
        title = "Markus's Kartkleidung";
        conditions = "";
        side = "civ";
        uniforms[] = {
//          { "NONE", "Entferne Kleidung", 0, "" },
			{ "U_C_Driver_1_black", "", 5000, "" },
			{ "U_C_Driver_1_blue", "", 5000, "" },
			{ "U_C_Driver_1_red", "", 5000, "" },
			{ "U_C_Driver_1_orange", "", 5000, "" },
			{ "U_C_Driver_1_green", "", 5000, "" },
			{ "U_C_Driver_1_white", "", 5000, "" },
			{ "U_C_Driver_1_yellow", "", 5000, "" },
			{ "U_C_Driver_1", "", 8000, "" },
			{ "U_C_Driver_2", "", 8000, "" },
			{ "U_C_Driver_3", "", 8000, "" },
			{ "U_C_Driver_4", "", 8000, "" }
        };
        headgear[] = {
//			{ "NONE", "Entferne Kopfbedeckung", 0, "" },
            { "H_RacingHelmet_1_black_F", "", 2500, "" },
			{ "H_RacingHelmet_1_red_F", "", 2500, "" },
			{ "H_RacingHelmet_1_white_F", "", 2500, "" },
			{ "H_RacingHelmet_1_blue_F", "", 2500, "" },
			{ "H_RacingHelmet_1_yellow_F", "", 2500, "" },
			{ "H_RacingHelmet_1_green_F", "", 2500, "" },
			{ "H_RacingHelmet_1_orange_F", "", 2500, "" },
			{ "H_RacingHelmet_1_F", "", 4000, "" },
			{ "H_RacingHelmet_2_F", "", 4000, "" },
			{ "H_RacingHelmet_3_F", "", 4000, "" },
			{ "H_RacingHelmet_4_F", "", 4000, "" }
        };
        goggles[] = {
//			{ "NONE", "Entferne Brille", 0, "" }
        };
        vests[] = {
//			{ "NONE", "Entferne Weste", 0, "" }
        };
        backpacks[] = {
//			{ "NONE", "Entferne Rucksack", 0, "" }
        };
    };
	
	class dive {
        title = "Tauchausrüstung";
        conditions = "lc_dive";
        side = "civ";
        uniforms[] = {
//			{ "NONE", "Entferne Kleidung", 0, "" },
            { "U_B_Wetsuit", "", 1500, "" }
        };
        headgear[] = {
//			{ "NONE", "Entferne Kopfbedeckung", 0, "" }
        };
        goggles[] = {
//			{ "NONE", "Entferne Brille", 0, "" },
            { "G_Diving", "", 1250, "" }
        };
        vests[] = {
//			{ "NONE", "Entferne Weste", 0, "" },
            { "V_RebreatherB", "", 5000, "" }
        };
        backpacks[] = {
//			{ "NONE", "Entferne Rucksack", 0, "" },
			{ "B_AssaultPack_blk", "", 5000, "" }
        };
    };
	
	class reb {
        title = "Rebellen Kleidung";
        conditions = "lc_rebel";
        side = "civ";
        uniforms[] = {
//			{ "NONE", "Entferne Kleidung", 0, "" },
			{ "U_BG_Guerilla2_1", "Girly Power", 5000, "lc_girl" },
			{ "U_B_Wetsuit", "Tauchanzug NATO", 10000, "" },
			{ "U_IG_Guerilla1_1", "Guerilla Garment", 5000, "" },
			{ "U_I_G_Story_Protagonist_F", "Abgenutzte Kampfanzug Kerry", 7500, "" },
			{ "U_I_G_resistanceLeader_F", "Kampfanzug Stavrou", 12000, "" },
			{ "U_O_SpecopsUniform_ocamo", "Recon Fatigues Hex", 18000, "" },
			{ "U_O_PilotCoveralls", "Pilotenoverall CSAT", 16000, "" },
			{ "U_IG_leader", "Guerilla Leader", 15500, "" },
			{ "U_O_CombatUniform_oucamo", "Fatigues Urban", 20000, "" },
			{ "U_I_HeliPilotCoveralls", "Heli Pilotenoverall AAF", 20000, "" },
			{ "U_O_T_Officer_F", "Offizier Fatigues Grün Hex", 70000, "" },
			{ "U_I_pilotCoveralls", "Pilotenoverall AAF", 20000, "" },
			{ "U_I_GhillieSuit", "Ghillie Suit AAF", 70000, "" },
//			{ "NONE", "Mehr ab VIP Level 4", 0, "call DWEV_viplevel <= 3" },
//			{ "NONE", "--- VIP Level 4 ---", 0, "call DWEV_viplevel >= 4" },
			{ "U_O_Wetsuit", "Tauchanzug CSAT", 10000, "call DWEV_viplevel >= 4" },
			{ "U_I_Wetsuit", "Tauchanzug AAF", 10000, "call DWEV_viplevel >= 4" },
			{ "U_I_OfficerUniform", "Kampfanzug Offizier AAF", 20000, "call DWEV_viplevel >= 4" },
			{ "U_I_CombatUniform", "Kampfanzug AAF", 20000, "call DWEV_viplevel >= 4" },
			{ "U_I_CombatUniform_shortsleeve", "Kampfanzug Kurzarm", 20000, "call DWEV_viplevel >= 4" },
			{ "U_O_CombatUniform_ocamo", "Kampfanzug Hex CSAT", 20000, "call DWEV_viplevel >= 4" },
			{ "U_B_T_Soldier_AR_F", "Combat Fatigues Tee", 70000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 4)" }, //APEX
			{ "U_B_T_Soldier_SL_F", "Combat Fatigues Tropic", 70000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 4)" }, // APEX
			{ "U_B_CTRG_Soldier_2_F", "CTRG Stealth Uniform Tee", 70000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 4)" }, // APEX
			{ "U_B_CTRG_Soldier_3_F", "CTRG Stealth Uniform Rolled-up", 70000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 4)" }, // APEX
			{ "U_O_V_Soldier_Viper_hex_F", "Spezialanwendung Hex", 70000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 4)" }, // APEX
			{ "U_I_C_Soldier_Para_1_F", "Paramilitär Garb Tee", 70000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 4)" }, // APEX
			{ "U_I_C_Soldier_Para_4_F", "Paramilitär Garb Tank Top", 70000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 4)" }, // APEX
			{ "U_I_C_Soldier_Para_5_F", "Paramilitär Garb Shorts", 70000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 4)" }, // APEX
			{ "U_B_CTRG_Soldier_urb_1_F", "CTRG Urban Uniform", 70000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 4)" }, // APEX
			{ "U_B_CTRG_Soldier_urb_3_F", "CTRG Urban Uniform Rolled-up", 70000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 4)" }, // APEX
			{ "U_B_GEN_Soldier_F", "Gendarmerie Uniform", 70000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 4)" }, // APEX
//			{ "NONE", "Mehr ab VIP Level 5", 0, "call DWEV_viplevel <= 4" },
//			{ "NONE", "--- VIP Level 5 ---", 0, "call DWEV_viplevel >= 5" },
			{ "U_O_GhillieSuit", "Ghillie Suit CSAT", 70000, "call DWEV_viplevel >= 5" },
			{ "U_O_FullGhillie_ard", "Full Ghillie Arid", 70000, "call DWEV_viplevel >= 5" },
			{ "U_O_FullGhillie_lsh", "Full Ghillie Lush", 70000, "call DWEV_viplevel >= 5" },
			{ "U_O_FullGhillie_sard", "Full Ghillie Semi Arid", 70000, "call DWEV_viplevel >= 5" },
			{ "U_B_T_Sniper_F", "Ghillie Suit Tropic", 70000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 5)" }, // APEX
			{ "U_O_T_Sniper_F", "Ghillie Suit Grün Hex", 70000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 5)" }, // APEX
			{ "U_O_T_FullGhillie_tna_F", "Full Ghillie Dschungel 2", 70000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 5)" }, // APEX
//			{ "NONE", "--- APEX Kleidung ---", 0, "DWEV_OwnedApexDLC" },
//			{ "NONE", "Mehr Kleidung mit Apex!", 0, "!DWEV_OwnedApexDLC" },
			{ "U_B_T_Soldier_F", "Combat Fatigues Tropic", 70000, "DWEV_OwnedApexDLC" }, //APEX
			{ "U_B_CTRG_Soldier_F", "CTRG Stealth Uniform", 70000, "DWEV_OwnedApexDLC" }, // APEX
			{ "U_B_GEN_Commander_F", "Gendarmerie-Kommandant-Uniform", 70000, "DWEV_OwnedApexDLC" }, // APEX
			{ "U_O_T_Soldier_F", "Fatigues Grün Hex CSAT", 70000, "DWEV_OwnedApexDLC" }, // APEX
			{ "U_O_V_Soldier_Viper_F", "Spezialanwendung Grün Hex", 70000, "DWEV_OwnedApexDLC" }, // APEX
			{ "U_I_C_Soldier_Camo_F", "Syndikat Uniform", 70000, "DWEV_OwnedApexDLC" }, // APEX
			{ "U_I_C_Soldier_Para_2_F", "Paramilitär Garb Jacket", 70000, "DWEV_OwnedApexDLC" }, // APEX
			{ "U_I_C_Soldier_Para_3_F", "Paramilitär Garb Shirt", 70000, "DWEV_OwnedApexDLC" }, // APEX
			{ "U_B_CTRG_Soldier_urb_2_F", "CTRG Urban Uniform Tee", 70000, "DWEV_OwnedApexDLC" }, // APEX
			{ "U_O_T_Officer_F", "Offizier Fatigues Grün Hex", 70000, "DWEV_OwnedApexDLC" }, // APEX
			{ "U_B_T_FullGhillie_tna_F", "Full Ghillie Dschungel 1", 70000, "DWEV_OwnedApexDLC" } // APEX
			
			
        };
        headgear[] = {
//			{ "NONE", "Entferne Kopfbedeckung", 0, "" },
			{ "H_HelmetB", "ECH Normal Armor 2", 2000, "" },
			{ "H_HelmetB_black", "ECH Schwarz Armor 2", 2200, "" },
			{ "H_Bandanna_khk", "Bandanna Khaki", 2000, "" },
			{ "H_Bandanna_khk_hs", "Bandanna Headset", 2000, "" },
			{ "H_Bandanna_cbr", "Bandanna Coyote", 2000, "" },
			{ "H_Bandanna_sgg", "Bandanna Sage", 2000, "" },
			{ "H_Cap_tan", "Cap Tan", 2000, "" },
			{ "H_Cap_blk", "Cap Schwarz", 2000, "" },
			{ "H_MilCap_blue", "Military Cap Blau", 2000, "" },
			{ "H_HelmetIA", "Mich Normal Armor 2", 2500, "" },
			{ "H_HelmetO_ocamo", "Schutzhelm Hex Armor 3", 3000, "" },
			{ "H_HelmetSpecB", "SF Helm Armor 4", 3500, "" },
			{ "H_HelmetSpecO_blk", "Assassin Helm Schwarz Armor 4", 4000, "" },
			{ "H_ShemagOpen_tan", "Shemag Tan", 4500, "" },
//			{ "NONE", "Mehr ab VIP Level 2", 0, "call DWEV_viplevel <= 1" },
//			{ "NONE", "--- VIP Level 2 ---", 0, "call DWEV_viplevel >= 2" },
			{ "H_Booniehat_oli", "Booniehat Olive", 850, "call DWEV_viplevel >= 2" },
			{ "H_Booniehat_indp", "Booniehat Khaki", 850, "call DWEV_viplevel >= 2" },
			{ "H_Booniehat_mcamo", "Booniehat MTP", 850, "call DWEV_viplevel >= 2" },
			{ "H_Booniehat_grn", "Booniehat Grün", 850, "call DWEV_viplevel >= 2" },
			{ "H_Booniehat_tan", "Booniehat Tan", 850, "call DWEV_viplevel >= 2" },
			{ "H_Booniehat_dgtl", "Booniehat AAF", 850, "call DWEV_viplevel >= 2" },
			{ "H_Booniehat_dirty", "Booniehat Dreckig", 850, "call DWEV_viplevel >= 2" },
			{ "H_Booniehat_khk", "Booniehat Khaki", 850, "call DWEV_viplevel >= 2" },
			{ "H_Booniehat_tna_F", "Booniehat Tropic", 850, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 2)" }, // APEX
//			{ "NONE", "Mehr ab VIP Level 3", 0, "call DWEV_viplevel <= 2" },
//			{ "NONE", "--- VIP Level 3 ---", 0, "call DWEV_viplevel >= 3" },
			{ "H_HelmetB_camo", "ECH Camo Armor 2", 1200, "call DWEV_viplevel >= 3" },
			{ "H_HelmetB_desert", "ECH Desert Armor 2", 1300, "call DWEV_viplevel >= 3" },
			{ "H_HelmetB_grass", "ECH Gras Armor 2", 1400, "call DWEV_viplevel >= 3" },
			{ "H_HelmetB_light", "ECH Hell Armor 1", 1500, "call DWEV_viplevel >= 3" },
			{ "H_HelmetB_light_black", "ECH Hellschwarz Armor 1", 1600, "call DWEV_viplevel >= 3" },
			{ "H_HelmetB_light_desert", "ECH Hell-Desert Armor 1", 1700, "call DWEV_viplevel >= 3" },
			{ "H_HelmetB_light_grass", "ECH Hell-Gras Armor 1", 1800, "call DWEV_viplevel >= 3" },
			{ "H_HelmetB_light_sand", "ECH Hell-Sand Armor 1", 1900, "call DWEV_viplevel >= 3" },
			{ "H_HelmetB_light_snakeskin", "ECH-Hell-Schlange Armor 1", 2000, "call DWEV_viplevel >= 3" },
			{ "H_HelmetB_paint", "ECH Sprühfarbe Armor 2", 2100, "call DWEV_viplevel >= 3" },
			{ "H_HelmetB_plain_blk", "Kampfhelm Schwarz Armor 2", 2200, "call DWEV_viplevel >= 3" },
			{ "H_Helmet_Kerry", "Kampfhelm Kerry Armor 2", 2200, "call DWEV_viplevel >= 3" },
			{ "H_HelmetB_plain_mcamo", "Kampfhelm Camo Armor 2", 2300, "call DWEV_viplevel >= 3" },
			{ "H_HelmetB_sand", "ECH Sand Armor 2", 2400, "call DWEV_viplevel >= 3" },
			{ "H_HelmetB_snakeskin", "ECH Schlange Armor 2", 2500, "call DWEV_viplevel >= 3" },
			{ "H_Cap_headphones", "Cap Headset", 2000, "call DWEV_viplevel >= 3" },
			{ "H_Cap_brn_SPECOPS", "Cap Opfor", 2000, "call DWEV_viplevel >= 3" },
			{ "H_Cap_tan_specops_US", "Cap US MTP", 2000, "call DWEV_viplevel >= 3" },
			{ "H_Cap_khaki_specops_UK", "Cap UK", 2000, "call DWEV_viplevel >= 3" },
			{ "H_Cap_blk_CMMG", "Cap CMMG", 2000, "call DWEV_viplevel >= 3" },
			{ "H_Cap_oli_Syndikat_F", "Cap Olive", 2000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 3)" }, // APEX
			{ "H_Cap_blk_Syndikat_F", "Cap Schwarz", 2000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 3)" }, // APEX
//			{ "NONE", "Mehr ab VIP Level 5", 0, "call DWEV_viplevel <= 4" },
//			{ "NONE", "--- VIP Level 5 ---", 0, "call DWEV_viplevel >= 5" },
			{ "H_HelmetIA_net", "Mich Camo Armor 2", 3000, "call DWEV_viplevel >= 5" },
			{ "H_HelmetIA_camo", "Mich 2 Camo Armor 2", 3000, "call DWEV_viplevel >= 5" },
			{ "H_Shemag_khk", "Shemag Khaki", 4500, "call DWEV_viplevel >= 5" },
			{ "H_Shemag_olive", "Shemag Olive", 4500, "call DWEV_viplevel >= 5" },
			{ "H_Shemag_olive_hs", "Shemag Olive Headset", 4500, "call DWEV_viplevel >= 5" },
			{ "H_Shemag_tan", "Shemag Tan", 4500, "call DWEV_viplevel >= 5" },
			{ "H_ShemagOpen_khk", "Shemag weiß", 4500, "call DWEV_viplevel >= 5" },
			{ "H_Watchcap_blk", "Beanie", 6000, "call DWEV_viplevel >= 5" },
			{ "H_Watchcap_khk", "Beanie Khaki", 6000, "call DWEV_viplevel >= 5" },
			{ "H_Watchcap_cbr", "Beanie Coyote", 6000, "call DWEV_viplevel >= 5" },
			{ "H_Watchcap_camo", "Beanie Camo", 6000, "call DWEV_viplevel >= 5" },
			{ "H_Watchcap_sgg", "Beanie Sage", 6000, "call DWEV_viplevel >= 5" },
			{ "H_MilCap_mcamo", "Military Cap MTP", 2000, "call DWEV_viplevel >= 5" },
			{ "H_MilCap_oucamo", "Military Cap Urban", 2000, "call DWEV_viplevel >= 5" },
			{ "H_MilCap_rucamo", "Military Cap Russia", 2000, "call DWEV_viplevel >= 5" },
			{ "H_MilCap_gry", "Military Cap Grau", 2000, "call DWEV_viplevel >= 5" },
			{ "H_MilCap_ocamo", "Military Cap Hex", 2000, "call DWEV_viplevel >= 5" },
			{ "H_MilCap_dgtl", "Military Cap AAF", 2000, "call DWEV_viplevel >= 5" },
			{ "H_Beret_blk", "Beret Schwarz", 3000, "call DWEV_viplevel >= 5" },
			{ "H_Beret_red", "Beret Rot", 3000, "call DWEV_viplevel >= 5" },
			{ "H_Beret_grn", "Beret Grün", 3000, "call DWEV_viplevel >= 5" },
			{ "H_Beret_grn_SF", "Beret SF", 3000, "call DWEV_viplevel >= 5" },
			{ "H_Beret_brn_SF", "Beret SAS", 3000, "call DWEV_viplevel >= 5" },
			{ "H_Beret_ocamo", "Beret CSAT", 3000, "call DWEV_viplevel >= 5" },
			{ "H_HelmetO_oucamo", "Schutzhelm Urban Armor 3", 3300, "call DWEV_viplevel >= 5" },
			{ "H_HelmetSpecB_blk", "SF Helm Schwarz Armor 4", 3500, "call DWEV_viplevel >= 5" },
			{ "H_HelmetSpecB_paint1", "SF Helm Hell Armor 4", 3600, "call DWEV_viplevel >= 5" },
			{ "H_HelmetSpecB_paint2", "SF Helm Dunkel Armor 4", 3700 , "call DWEV_viplevel >= 5" },
			{ "H_HelmetSpecO_ocamo", "Assassin Helm Hex Armor 4", 3900, "call DWEV_viplevel >= 5" },
			{ "H_HelmetB_TI_tna_F", "ECH Stealth Combat Armor 2", 3700, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 5)" }, // APEX
			{ "H_HelmetCrew_O_ghex_F", "Crew Helmet Grün Hex Armor 3", 4000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 5)" }, // APEX 
//			{ "NONE", "--- APEX Kopfbedeckung ---", 0, "DWEV_OwnedApexDLC" },
//			{ "NONE", "Mehr Kopfbedeckung mit Apex!", 0, "!DWEV_OwnedApexDLC" },
			{ "H_MilCap_ghex_F", "Military Cap Hex", 2500, "DWEV_OwnedApexDLC" }, // APEX 
			{ "H_MilCap_tna_F", "Military Cap Tan", 2500, "DWEV_OwnedApexDLC" }, // APEX 
			{ "H_Cap_tan_Syndikat_F", "Cap Tan", 2000, "DWEV_OwnedApexDLC" }, // APEX
			{ "H_HelmetB_Light_tna_F", "ECH-Leicht Tropic Armor 1", 3000, "DWEV_OwnedApexDLC" }, // APEX 
			{ "H_HelmetB_tna_F", "ECH Tropic Armor 2", 3500, "DWEV_OwnedApexDLC" }, // APEX 
			{ "H_HelmetO_ghex_F", "Schutzhelm Grün-Hex Armor 3", 4000, "DWEV_OwnedApexDLC" } // APEX  
        };
        goggles[] = {
//			{ "NONE", "Entferne Brille", 0, "" },
			{ "G_Combat", "Antigasmaske", 200000, "" },
			{ "G_Diving", "Tauchermaske", 1500, "" },
			{ "G_Shades_Black", "Brille Schwarz", 400, "" },
			{ "G_Squares", "Quatratische Brille", 600, "" },
			{ "G_Balaclava_blk", "Balaclava", 9000, "" },
			{ "G_Bandanna_blk", "Bandanna", 8000, "" },
//			{ "NONE", "Mehr ab VIP Level 1", 0, "call DWEV_viplevel <= 0" },
//			{ "NONE", "--- VIP Level 1 ---", 0, "call DWEV_viplevel >= 1" },
			{ "G_Shades_Blue", "Brille Blau", 400, "call DWEV_viplevel >= 1" },
//			{ "G_Sport_Blackred", "Sportbrille Schwarz-Rot", 400, "call DWEV_viplevel >= 1" }, //deaktiviert weil maskierung Polizei
			{ "G_Sport_Checkered", "Sportbrille Rot-Kariert", 400, "call DWEV_viplevel >= 1" },
			{ "G_Sport_Blackyellow", "Sportbrille Schwarz-Gelb", 400, "call DWEV_viplevel >= 1" },
			{ "G_Sport_BlackWhite", "Sportbrille Schwarz-Weiß", 400, "call DWEV_viplevel >= 1" },
			{ "G_Sport_Greenblack", "Sportbrille Schwarz-Grün", 400, "call DWEV_viplevel >= 1" },
//			{ "NONE", "Mehr ab VIP Level 2", 0, "call DWEV_viplevel <= 1" },
//			{ "NONE", "--- VIP Level 2 ---", 0, "call DWEV_viplevel >= 2" },
			{ "G_Shades_Green", "Brille Grün", 400, "call DWEV_viplevel >= 2" },
			{ "G_Shades_Red", "Brille Rot", 400, "call DWEV_viplevel >= 2" },
			{ "G_Sport_Red", "Sportbrille Rot", 400, "call DWEV_viplevel >= 2" },
			{ "G_Lady_Mirror", "Lady Normal", 600, "call DWEV_viplevel >= 2" },
			{ "G_Lady_Dark", "Lady Dunkel", 600, "call DWEV_viplevel >= 2" },
			{ "G_Lady_Blue", "Lady Blau", 600, "call DWEV_viplevel >= 2" },
			{ "G_Aviator", "Fliegerbrille", 800, "call DWEV_viplevel >= 2" },
			{ "G_Lowprofile", "Flachbrille", 800, "call DWEV_viplevel >= 2" },
//			{ "NONE", "Mehr ab VIP Level 3", 0, "call DWEV_viplevel <= 2" },
//			{ "NONE", "--- VIP Level 3 ---", 0, "call DWEV_viplevel >= 3" },
			{ "G_Spectacles", "Spec Normal", 1000, "call DWEV_viplevel >= 3" },
			{ "G_Spectacles_Tinted", "Spec Getönt", 1000, "call DWEV_viplevel >= 3" },
			{ "G_Tactical_Black", "Taktisch Schwarz", 1200, "call DWEV_viplevel >= 3" },
			{ "G_Tactical_Clear", "Taktisch Klar", 1200, "call DWEV_viplevel >= 3" },
			{ "G_Bandanna_tan", "Bandanna tan", 8000, "call DWEV_viplevel >= 3" },
			{ "G_Bandanna_oli", "Bandanna Olive", 8000, "call DWEV_viplevel >= 3" },
//			{ "NONE", "Mehr ab VIP Level 5", 0, "call DWEV_viplevel <= 4" },
//			{ "NONE", "--- VIP Level 5 ---", 0, "call DWEV_viplevel >= 5" },
			{ "G_Bandanna_beast", "Bandanna Beast", 8000, "call DWEV_viplevel >= 5" },
			{ "G_Bandanna_shades", "Bandanna Shades", 8000, "call DWEV_viplevel >= 5" },
			{ "G_Bandanna_sport", "Bandanna Sport", 8000, "call DWEV_viplevel >= 5" },
			{ "G_Bandanna_aviator", "Bandanna Flieger", 8000, "call DWEV_viplevel >= 5" },
			{ "G_Balaclava_oli", "Balaclava Olive", 9000, "call DWEV_viplevel >= 5" },
			{ "G_Balaclava_lowprofile", "Balaclava Unten", 10000, "call DWEV_viplevel >= 5" }
            
        };
        vests[] = {
//			{ "NONE", "Entferne Weste", 0, "" },
			{ "V_Rangemaster_belt", "Rangemaster Gürtel", 5000, "" },
			{ "V_BandollierB_blk", "Slash Bandolier Schwarz", 6000, "" },
			{ "V_BandollierB_cbr", "Slash Bandolier Coyote", 7000, "" },
			{ "V_BandollierB_khk", "Slash Bandolier Khaki", 8000, "" },
			{ "V_BandollierB_oli", "Slash Bandolier Olive", 9000, "" },
			{ "V_BandollierB_rgr", "Slash Bandolier Grün", 10000, "" },
			{ "V_Chestrig_blk", "Brust Rig Schwarz", 11000, "" },
			{ "V_Chestrig_khk", "Brust Rig Khaki", 12000, "" },
			{ "V_Chestrig_oli", "Brust Rig Olive", 13000, "" },
			{ "V_Chestrig_rgr", "Brust Rig Grün", 14000, "" },
			{ "V_HarnessO_brn", "LBV Harness", 15000, "" },
			{ "V_HarnessO_gry", "LBV Harness Grau", 16000, "" },
			{ "V_HarnessOGL_brn", "LBV Grenadier Harness", 17000, "" },
			{ "V_HarnessOGL_gry", "LBV Grenadier Harness Grau", 18000, "" },
			{ "V_HarnessOSpec_brn", "ELBV Harness", 19000, "" },
			{ "V_HarnessOSpec_gry", "ELBV Harness Grau", 20000, "" },
			{ "V_Press_F", "Presse Weste Armor 2", 20000, "" },
			{ "V_RebreatherB", "Atemgerät Nato Armor 1", 33000, "" },
			{ "V_RebreatherIA", "Atemgerät AAF Armor 1", 33000, "" },
			{ "V_TacVest_blk", "Taktische Weste Schwarz Armor 1", 21000, "" },
			{ "V_TacVest_brn", "Taktische Weste Braun Armor 1", 22000, "" },
			{ "V_TacVest_camo", "Taktische Weste Camo Armor 1", 23000, "" },
			{ "V_TacVest_khk", "Taktische Weste Khaki Armor 1", 24000, "" },
			{ "V_TacVest_oli", "Taktische Weste Olive Amor 1", 25000, "" },
			{ "V_TacVestCamo_khk", "Getarnte Weste Armor 1", 26000, "" },
			{ "V_TacVestIR_blk", "Raven Weste Armor 1", 27000, "" },
			{ "V_I_G_resistanceLeader_F", "Taktische Weste Stavrou Armor 1", 28000, "" },
			{ "V_PlateCarrier1_blk", "Carrier Lite Schwarz Armor 3", 35000, "" },
			{ "V_PlateCarrierIA1_dgtl", "Carrier Lite Digi Amor 3", 35000, "" },
			{ "V_PlateCarrierIA2_dgtl", "Carrier Rig Digi Armor 3", 35000, "" },
//			{ "NONE", "--- APEX Westen ---", 0, "DWEV_OwnedApexDLC" },
//			{ "NONE", "Mehr Westen mit Apex!", 0, "!DWEV_OwnedApexDLC" },
			{ "V_BandollierB_ghex_F", "Slash Bandolier", 10000, "DWEV_OwnedApexDLC" }, // APEX
			{ "V_HarnessO_ghex_F", "LBV Harness", 10500, "DWEV_OwnedApexDLC" }, // APEX
			{ "V_HarnessOGL_ghex_F", "LBV Grenadier Harness", 10700, "DWEV_OwnedApexDLC" }, // APEX
			{ "V_TacChestrig_cbr_F", "Tactical Chest Rig", 11000, "DWEV_OwnedApexDLC" }, // APEX
			{ "V_TacChestrig_oli_F", "Tactical Chest Rig Olive", 11200, "DWEV_OwnedApexDLC" }, // APEX
			{ "V_TacChestrig_grn_F", "Tactical Chest Rig Grün", 11400, "DWEV_OwnedApexDLC" }, // APEX
			{ "V_PlateCarrier1_rgr_noflag_F", "Carrier Lite Grün Armor 3", 40000, "DWEV_OwnedApexDLC" }, // APEX
			{ "V_PlateCarrier1_tna_F", "Carrier Lite Tropic Armor 3", 45000, "DWEV_OwnedApexDLC" }, // APEX
			{ "V_PlateCarrier2_rgr_noflag_F", "Carrier Rig Grün Armor 4", 50000, "DWEV_OwnedApexDLC" }, // APEX
			{ "V_PlateCarrier2_tna_F", "Carrier Rig Tropic Armor 4", 55000, "DWEV_OwnedApexDLC" } // APEX
        };
        backpacks[] = {
//			{ "NONE", "Entferne Rucksack", 0, "" },
			{ "B_Kitbag_cbr", "Monster Hai", 9000, "lc_girl" },
			{ "B_Carryall_khk", "Carryall Hellgrün", 9000, "" },
			{ "B_Parachute", "Fallschirm", 20000, "" },
//			{ "NONE", "Mehr ab VIP Level 2", 0, "call DWEV_viplevel <= 1" },
//			{ "NONE", "--- VIP Level 2 ---", 0, "call DWEV_viplevel >= 2" },
			{ "B_ViperLightHarness_khk_F", "Viper L. Harness Khaki", 20000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 2)" }, // APEX VIP 2
			{ "B_ViperLightHarness_blk_F", "Viper L. Harness Schwarz", 20000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 2)" }, // APEX VIP 2
			{ "B_ViperLightHarness_hex_F", "Viper L. Harness Hex", 20000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 2)" }, // APEX VIP 2
			{ "B_ViperLightHarness_oli_F", "Viper L. Harness Olive", 20000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 2)" }, // APEX VIP 2
			{ "B_ViperLightHarness_ghex_F", "Viper L. Harness Grün Hex", 20000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 2)" }, // APEX VIP 2
//			{ "NONE", "Mehr ab VIP Level 3", 0, "call DWEV_viplevel <= 2" },
//			{ "NONE", "--- VIP Level 3 ---", 0, "call DWEV_viplevel >= 3" },
			{ "B_ViperHarness_oli_F", "Viper Harness Olive", 20000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 3)" }, // APEX VIP 3
			{ "B_ViperHarness_khk_F", "Viper Harness Khaki", 20000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 3)" }, // APEX VIP 3
			{ "B_ViperHarness_ghex_F", "Viper Harness Grün Hex", 20000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 3)" }, // APEX VIP 3
			{ "B_ViperHarness_blk_F", "Viper Harness Schwarz", 20000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 3)" }, // APEX VIP 3
			{ "B_ViperHarness_hex_F", "Viper Harness Hex", 20000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 3)" }, // APEX VIP 3
//			{ "NONE", "Mehr ab VIP Level 4", 0, "call DWEV_viplevel <= 3" },
//			{ "NONE", "--- VIP Level 4 ---", 0, "call DWEV_viplevel >= 4" },
			{ "B_AssaultPack_tna_F", "Assault Pack Tropic",  9000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 4)" }, //Apex
			{ "B_AssaultPack_khk", "Assault Pack Hellgrün", 9000, "call DWEV_viplevel >= 4" },
			{ "B_AssaultPack_dgtl", "Assault Pack Desert Camo", 9000, "call DWEV_viplevel >= 4" },
			{ "B_AssaultPack_rgr", "Assault Pack Olive", 9000, "call DWEV_viplevel >= 4" },
			{ "B_AssaultPack_sgg", "Assault Pack Sage", 9000, "call DWEV_viplevel >= 4" },
			{ "B_AssaultPack_blk", "Assault Pack Black", 9000, "call DWEV_viplevel >= 4" },
			{ "B_AssaultPack_mcamo", "Assault Pack Wald Camo", 9000, "call DWEV_viplevel >= 4" },
			{ "B_AssaultPack_ocamo", "Assault Pack Hex", 9000, "call DWEV_viplevel >= 4" },
			{ "B_AssaultPack_cbr", "Assault Pack Tan", 9000, "call DWEV_viplevel >= 4" },
			{ "B_Kitbag_rgr", "Kitbag Grün", 9000, "call DWEV_viplevel >= 4" },
			{ "B_Kitbag_mcamo", "Kitbag Wald Camo", 9000, "call DWEV_viplevel >= 4" },
			{ "B_Kitbag_sgg", "Kitbag Sage", 9000, "call DWEV_viplevel >= 4" },
//			{ "NONE", "Mehr ab VIP Level 5", 0, "call DWEV_viplevel <= 4" },
//			{ "NONE", "--- VIP Level 5 ---", 0, "call DWEV_viplevel >= 5" },
			{ "B_Bergen_sgg", "Bergen Sage", 9000, "call DWEV_viplevel >= 5" },
			{ "B_Bergen_mcamo", "Bergen Waldcamo", 9000, "call DWEV_viplevel >= 5" },
			{ "B_Bergen_rgr", "Bergen Olive", 9000, "call DWEV_viplevel >= 5" },
			{ "B_Bergen_blk", "Bergen Black", 9000, "call DWEV_viplevel >= 5" },
			{ "B_Carryall_ocamo", "Carryall Desert Camo", 9000, "call DWEV_viplevel >= 5" },
			{ "B_Carryall_oucamo", "Carryall Blau Camo", 9000, "call DWEV_viplevel >= 5" },
			{ "B_Carryall_mcamo", "Carryall Wald Camo", 9000, "call DWEV_viplevel >= 5" },
			{ "B_Carryall_ghex_F", "Carryall Grün Hex", 9000, "DWEV_OwnedApexDLC && (call DWEV_viplevel >= 5)" }, // APEX
//			{ "NONE", "--- APEX Rucksäcke ---", 0, "DWEV_OwnedApexDLC" },
//			{ "NONE", "Mehr Rucksäcke mit Apex!", 0, "!DWEV_OwnedApexDLC" },
			{ "B_FieldPack_ghex_F", "Field Pack Grün Hex", 9000, "DWEV_OwnedApexDLC" }, // APEX
			{ "B_Bergen_dgtl_F", "Bergen Digital", 100000, "DWEV_OwnedApexDLC" } // APEX
        };
    };

    class Cop {
        title = "Polizeikleidung";
        conditions = "";
        side = "cop";
        uniforms[] = {
//			{ "NONE", "Entferne Kleidung", 0, "" },
            { "U_BG_Guerilla2_1", "Cop Uniform", 500, "" },
			{ "U_B_survival_uniform", "Wasserstaffel", 5000, "call DWEV_coplevel >= 3" },
			{ "U_BG_Guerilla2_2","Uniform Schwarz",4000, "call DWEV_coplevel >= 6" },
			{ "U_B_CombatUniform_mcam","SEK-Kleidung",200, "lp_swat && (call DWEV_coplevel >= 3)" },
//			{ "NONE", "--- Zivil Polizei ---", 0, "lp_zivi && (call DWEV_coplevel >= 3)" },
			{ "U_NikosAgedBody","Verhandlungsführer",2000, "lp_zivi && (call DWEV_coplevel >= 3)" },
			{ "U_C_Poloshirt_stripped","Streifen Kleidung",100, "lp_zivi && (call DWEV_coplevel >= 3)" },
			{ "U_C_Poloshirt_redwhite","Rot/Weiß Kleidung",100, "lp_zivi && (call DWEV_coplevel >= 3)" },
			{ "U_C_Poloshirt_salmon","Salmon Kleidung",100, "lp_zivi && (call DWEV_coplevel >= 3)" },
			{ "U_C_Poor_2","Blaue Kleidung",150, "lp_zivi && (call DWEV_coplevel >= 3)" },
			{ "U_C_Poloshirt_burgundy","Luna Kleidung",175, "lp_zivi && (call DWEV_coplevel >= 3)" },
			{ "U_C_Poloshirt_tricolour","Stella Kleidung",175, "lp_zivi && (call DWEV_coplevel >= 3)" },
			{ "U_IG_Guerilla3_1","Braune Kleidung",500, "lp_zivi && (call DWEV_coplevel >= 3)" },
			{ "U_I_C_Soldier_Bandit_1_F", "", 1000, "lp_zivi && (call DWEV_coplevel >= 3)" },
			{ "U_C_man_sport_3_F", "", 350, "lp_zivi && (call DWEV_coplevel >= 3)" },
			{ "U_C_Man_casual_1_F", "", 350, "lp_zivi && (call DWEV_coplevel >= 3)" },
			{ "U_C_Man_casual_2_F", "", 400, "lp_zivi && (call DWEV_coplevel >= 3)" },
			{ "U_C_Man_casual_3_F", "", 350, "lp_zivi && (call DWEV_coplevel >= 3)" },
			{ "U_C_Man_casual_4_F", "", 250, "lp_zivi && (call DWEV_coplevel >= 3)" }
        };
        headgear[] = {
//			{ "NONE", "Entferne Kopfbedeckung", 0, "" },
			{ "H_Cap_police", "Cap Polizei", 500, "" },
			{ "H_Watchcap_camo", "Beanie Camo", 4000, "" },
			{ "H_HelmetSpecB_blk", "SF Helm Schwarz Armor 4", 3500, "" },
			{ "H_Beret_Colonel", "Beret NATO Colonel", 3000, "call DWEV_coplevel >= 6" },
//			{ "NONE", "--- Zivil Polizei ---", 0, "lp_zivi && (call DWEV_coplevel >= 3)" },
			{ "H_Booniehat_tna_F","Booniehut (Apex)",750, "lp_zivi && (call DWEV_coplevel >= 3)" },
			{ "H_Cap_red", "Cap Rot", 200, "lp_zivi && (call DWEV_coplevel >= 3)" },
			{ "H_Cap_blu", "Cap Blau", 200, "lp_zivi && (call DWEV_coplevel >= 3)" },
			{ "H_Cap_oli", "Cap Olive", 200, "lp_zivi && (call DWEV_coplevel >= 3)" },
			{ "H_Cap_tan", "Cap Tan", 200, "lp_zivi && (call DWEV_coplevel >= 3)" },
			{ "H_Hat_brown", "Hut Braun", 300, "lp_zivi && (call DWEV_coplevel >= 3)" },
			{ "H_Bandanna_gry", "Bandanna Schwarz", 350, "lp_zivi && (call DWEV_coplevel >= 3)" },
			{ "H_Bandanna_cbr", "Bandanna Coyote", 350, "lp_zivi && (call DWEV_coplevel >= 3)" },
			{ "H_Bandanna_sgg", "Bandanna Sage", 350, "lp_zivi && (call DWEV_coplevel >= 3)" },
			{ "H_BandMask_blk", "Bandanna Maske Schwarz", 350, "lp_zivi && (call DWEV_coplevel >= 3)" },
//			{ "NONE", "--- APEX Kopfbedeckung ---", 0, "DWEV_OwnedApexDLC" },
//			{ "NONE", "Mehr Kopfbedeckung mit Apex!", 0, "!DWEV_OwnedApexDLC" },
			{ "H_Beret_blk_POLICE", "Barett Polizei", 750, "DWEV_OwnedApexDLC" }, //Apex
			{ "H_MilCap_gen_F", "Military Cap Gendamerie", 750, "DWEV_OwnedApexDLC" }, //Apex
			{ "H_HelmetLeaderO_oucamo", "Verteidiger Helm Armor 5", 750, "DWEV_OwnedApexDLC" }, //Apex
			{ "H_Cap_tan_Syndikat_F", "Cap Tan", 500, "lp_zivi && DWEV_OwnedApexDLC" } // APEX

        };
        goggles[] = {
//			{ "NONE", "Entferne Brille", 0, "" },
			{ "G_Combat", "Gasmaske", 50000, "" },
			{ "G_Balaclava_combat","Sturmhaube",70000, "lp_swat && (call DWEV_coplevel >= 3)" },
			{ "G_Shades_Black", "Brille Schwarz", 100, "" },
			{ "G_Diving", "Tauchermaske", 1000, "call DWEV_coplevel >= 3" },
			{ "G_Sport_Blackred", "Maskierung - Sportbrille Schwarz-Rot", 10000, "lp_zivi && (call DWEV_coplevel >= 3)" },
			{ "G_Squares", "Quatratische Brille", 300, "lp_zivi && (call DWEV_coplevel >= 3)" },
			{ "G_Aviator", "Fliegerbrille", 400, "lp_zivi && (call DWEV_coplevel >= 3)" }

        };
        vests[] = {
//			{ "NONE", "Entferne Weste", 0, "" },
			{ "V_TacVest_blk_POLICE", "Taktische Weste Polizei Armor 2", 8000, "" },
			{ "V_RebreatherB", "", 4000, "call DWEV_coplevel >= 3" },
			{ "V_PlateCarrier1_blk", "Carrier Lite Schwarz Armor 3", 14500, "call DWEV_coplevel >= 3" },
			{ "V_PlateCarrierSpec_blk", "Carrier Special Rig Schwarz Armor 5", 20000, "(call DWEV_coplevel >= 6) || lp_swat && (call DWEV_coplevel >= 3)" }
			
        };
        backpacks[] = {
//			{ "NONE", "Entferne Rucksack", 0, "" },
			{ "B_Carryall_cbr", "Carryall Polizei", 3500, "" }
        };
    };

    class med {
        title = "Feuerwehrkleidung";
        conditions = "";
        side = "med";
        uniforms[] = {
//			{ "NONE", "Entferne Kleidung", 0, "" },
			{ "U_IG_Guerilla2_1", "Uniform", 1000, "" },
			{ "U_I_Wetsuit", "Tauchanzug", 1000, "" }
        };
        headgear[] = {
//			{ "NONE", "Entferne Kopfbedeckung", 0, "" },
			{ "H_Cap_red", "Cap Rot", 250, 0, "" }
        };
        goggles[] = {
//			{ "NONE", "Entferne Brille", 0, "" },
			{ "G_Diving", "Taucherbrille", 1000, "" },
			{ "G_Squares", "Quatratische Brille", 230, "" },
			{ "G_Aviator", "Fliegerbrille", 240, "" }
        };
        vests[] = {
//			{ "NONE", "Entferne Weste", 0, "" },
			{ "V_RebreatherB", "", 4000, "" }
        };
        backpacks[] = {
//			{ "NONE", "Entferne Rucksack", 0, "" },
			{ "B_Kitbag_cbr", "Kitbag Tan", 2400, "" }
        };
    };
	
	class WSC {
        title = "Sicherheitskleidung";
        conditions = "";
        side = "WSC";
        uniforms[] = {
//			{ "NONE", "Entferne Kleidung", 0, "" },
			{ "U_BG_Guerilla2_1", "Uniform", 1000, "" }
        };
        headgear[] = {
//			{ "NONE", "Entferne Kopfbedeckung", 0, "" },
			{ "H_MilCap_mcamo", "Military Cap MTP", 500, "" }
        };
        goggles[] = {
//			{ "NONE", "Entferne Brille", 0, "" },
			{ "G_Combat", "Gasmaske", 50000, "" },
			{ "G_Squares", "Quatratische Brille", 230, "" },
			{ "G_Aviator", "Fliegerbrille", 240, "" }
        };
        vests[] = {
//			{ "NONE", "Entferne Weste", 0, "" },
			{ "V_PlateCarrier1_blk", "Carrier Lite Schwarz Armor 3", 14500, "" }
        };
        backpacks[] = {
//			{ "NONE", "Entferne Rucksack", 0, "" },
			{ "B_Kitbag_cbr", "Kitbag Tan", 2400], "" }
        };
    };
	
	class gun {
        title = "Waffenshop Kleidung";
        conditions = "lc_gun";
        side = "civ";
        uniforms[] = {
//			{ "NONE", "Entferne Kleidung", 0, "" }
        };
        headgear[] = {
//			{ "NONE", "Entferne Kopfbedeckung", 0, "" }
        };
        goggles[] = {
//			{ "NONE", "Entferne Brille", 0, "" }
        };
        vests[] = {
//			{ "NONE", "Entferne Weste", 0, "" },
			{ "V_Rangemaster_belt", "", 6000, "" },
			{ "V_Press_F", "", 25000, "" }
        };
        backpacks[] = {
//			{ "NONE", "Entferne Rucksack", 0, "" }
        };
    };
	
	class Anwalt {
        title = "Anwaltskleidung";
        conditions = "lc_anwalt";
        side = "civ";
        uniforms[] = {
//			{ "NONE", "Entferne Kleidung", 0, "" },
			{ "U_NikosAgedBody", "Anwaltsanzug", 20000, "" }
        };
        headgear[] = {
//			{ "NONE", "Entferne Kopfbedeckung", 0, "" }
        };
        goggles[] = {
//			{ "NONE", "Entferne Brille", 0, "" }
        };
        vests[] = {
//			{ "NONE", "Entferne Weste", 0, "" }
        };
        backpacks[] = {
//			{ "NONE", "Entferne Rucksack", 0, "" }
        };
    };
	
	class uranium {
        title = "Uraniumverarbeitung";
        conditions = "lc_uranium";
        side = "civ";
        uniforms[] = {
//			{ "NONE", "Entferne Kleidung", 0, "" },
			{ "U_C_Scientist", "Anti-Strahlen-Anzug", 100000, "" }
        };
        headgear[] = {
//			{ "NONE", "Entferne Kopfbedeckung", 0, "" }
        };
        goggles[] = {
//			{ "NONE", "Entferne Brille", 0, "" }
        };
        vests[] = {
//			{ "NONE", "Entferne Weste", 0, "" }
        };
        backpacks[] = {
//			{ "NONE", "Entferne Rucksack", 0, "" }
        };
    };
	
	class donator {
        title = "Premium Shop";
        conditions = "call DWEV_donator >= 1";
        side = "civ";
        uniforms[] = {
//			{ "NONE", "Entferne Kleidung", 0, "" }
        };
        headgear[] = {
//			{ "NONE", "Entferne Kopfbedeckung", 0, "" }
        };
        goggles[] = {
//			{ "NONE", "Entferne Brille", 0, "" }
        };
        vests[] = {
//			{ "NONE", "Entferne Weste", 0, "" }
        };
        backpacks[] = {
//			{ "NONE", "Entferne Rucksack", 0, "" },
			{ "B_Carryall_khk", "Carryall Hellgrün", 2500, "" }
        };
    };
};
