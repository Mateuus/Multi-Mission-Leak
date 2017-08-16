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
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_C_Poloshirt_blue", "Poloshirt Blue", 250, { "", "", -1 } },
            { "U_C_Poloshirt_burgundy", "Poloshirt Burgundy", 275, { "", "", -1 } },
            { "U_C_Poloshirt_redwhite", "Poloshirt Red/White", 150, { "", "", -1 } },
            { "U_C_Poloshirt_salmon", "Poloshirt Salmon", 175, { "", "", -1 } },
            { "U_C_Poloshirt_stripped", "Poloshirt stripped", 125, { "", "", -1 } },
            { "U_C_Poloshirt_tricolour", "Poloshirt Tricolor", 350, { "", "", -1 } },
			{ "U_C_Man_casual_1_F", "Poloshirt Navy", 350, { "", "", -1 } },
			{ "U_C_Man_casual_2_F", "Poloshirt Blue", 350, { "", "", -1 } },
			{ "U_C_Man_casual_3_F", "Poloshirt Green", 350, { "", "", -1 } },
			{ "U_C_Man_casual_4_F", "Poloshirt Sky", 500, { "", "", -1 } },
			{ "U_C_Man_casual_5_F", "Poloshirt Yellow", 500, { "", "", -1 } },
			{ "U_C_Man_casual_6_F", "Poloshirt Red", 500, { "", "", -1 } },
            { "U_C_Poor_2", "Rag tagged clothes", 250, { "", "", -1 } },
            { "U_IG_Guerilla2_2", "Green stripped shirt & Pants", 650, { "", "", -1 } },
            { "U_IG_Guerilla3_1", "Brown Jacket & Pants", 735, { "", "", -1 } },
            { "U_IG_Guerilla2_3", "The Outback Rangler", 1200, { "", "", -1 } },
            { "U_C_HunterBody_grn", "The Hunters Look", 1500, { "", "", -1 } },
            { "U_C_WorkerCoveralls", "Mechanic Coveralls", 2500, { "", "", -1 } },
            { "U_OrestesBody", "Surfing On Land", 1100, { "", "", -1 } },
			{ "U_C_man_sport_1_F", "Sport Beach", 1100, { "", "", -1 } },
			{ "U_C_man_sport_2_F", "Sport Orange", 1100, { "", "", -1 } },
			{ "U_C_man_sport_3_F", "Sport Blue", 1100, { "", "", -1 } },
            { "U_NikosAgedBody", "Casual Wears", 5000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
            { "H_Bandanna_camo", "Camo Bandanna", 120, { "", "", -1 } },
            { "H_Bandanna_surfer", "Surfer Bandanna", 130, { "", "", -1 } },
            { "H_Bandanna_gry", "Grey Bandanna", 150, { "", "", -1 } },
            { "H_Bandanna_cbr", "", 165, { "", "", -1 } },
            { "H_Bandanna_surfer", "", 135, { "", "", -1 } },
            { "H_Bandanna_khk", "Khaki Bandanna", 145, { "", "", -1 } },
            { "H_Bandanna_sgg", "Sage Bandanna", 160, { "", "", -1 } },
            { "H_StrawHat", "Straw Fedora", 225, { "", "", -1 } },
            { "H_BandMask_blk", "Hat & Bandanna", 300, { "", "", -1 } },
            { "H_Booniehat_tan", "", 425, { "", "", -1 } },
            { "H_Hat_blue", "", 310, { "", "", -1 } },
            { "H_Hat_brown", "", 276, { "", "", -1 } },
            { "H_Hat_checker", "", 340, { "", "", -1 } },
            { "H_Hat_grey", "", 280, { "", "", -1 } },
            { "H_Hat_tan", "", 265, { "", "", -1 } },
            { "H_Cap_blu", "", 150, { "", "", -1 } },
            { "H_Cap_grn", "", 150, { "", "", -1 } },
            { "H_Cap_grn_BI", "", 150, { "", "", -1 } },
            { "H_Cap_oli", "", 150, { "", "", -1 } },
            { "H_Cap_red", "", 150, { "", "", -1 } },
            { "H_Cap_tan", "", 150, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } },
            { "G_Shades_Black", "", 25, { "", "", -1 } },
            { "G_Shades_Blue", "", 20, { "", "", -1 } },
            { "G_Sport_Blackred", "", 20, { "", "", -1 } },
            { "G_Sport_Checkered", "", 20, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 20, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 20, { "", "", -1 } },
            { "G_Squares", "", 10, { "", "", -1 } },
            { "G_Aviator", "", 100, { "", "", -1 } },
            { "G_Lady_Mirror", "", 150, { "", "", -1 } },
            { "G_Lady_Dark", "", 150, { "", "", -1 } },
            { "G_Lady_Blue", "", 150, { "", "", -1 } },
            { "G_Lowprofile", "", 30, { "", "", -1 } },
            { "G_Combat", "", 55, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } },
            { "B_AssaultPack_cbr", "", 2500, { "", "", -1 } },
            { "B_Kitbag_mcamo", "", 4500, { "", "", -1 } },
            { "B_TacticalPack_oli", "", 3500, { "", "", -1 } },
            { "B_FieldPack_ocamo", "", 3000, { "", "", -1 } },
            { "B_Bergen_sgg", "", 4500, { "", "", -1 } },
            { "B_Kitbag_cbr", "", 4500, { "", "", -1 } },
            { "B_Carryall_oli", "", 5000, { "", "", -1 } },
            { "B_Carryall_khk", "", 5000, { "", "", -1 } }
        };
    };

    class cop {
        title = "STR_Shops_C_Police";
        license = "";
        side = "cop";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_Rangemaster", "Cop Uniform", 25, { "", "", -1 } },
            { "U_B_Wetsuit", "Diving Uniform", 20000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
            { "H_MilCap_blue", "", 250, { "", "", -1 } },
            { "H_Beret_blk_POLICE", "", 500, { "", "", -1 } },
			{ "H_Beret_Colonel", "", 1250, { "life_coplevel", "SCALAR", 5 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } },
            { "G_Shades_Black", "", 250, { "", "", -1 } },
            { "G_Shades_Blue", "", 250, { "", "", -1 } },
            { "G_Sport_Blackred", "", 250, { "", "", -1 } },
            { "G_Sport_Checkered", "", 250, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 250, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 250, { "", "", -1 } },
            { "G_Squares", "", 250, { "", "", -1 } },
            { "G_Aviator", "", 250, { "", "", -1 } },
            { "G_Lady_Mirror", "", 250, { "", "", -1 } },
            { "G_Lady_Dark", "", 250, { "", "", -1 } },
            { "G_Lady_Blue", "", 250, { "", "", -1 } },
            { "G_Lowprofile", "", 250, { "", "", -1 } },
            { "G_Combat", "", 250, { "", "", -1 } },
			{ "G_Balaclava_blk", "", 1000, { "", "", -1 } },
			{ "G_Balaclava_lowprofile", "", 1000, { "", "", -1 } },
			{ "G_Diving", "", 2000, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_Rangemaster_belt", "", 1000, { "", "", -1 } },
            { "V_TacVest_blk_POLICE", "", 5000, { "life_coplevel", "SCALAR", 1 } },
			{ "V_PlateCarrier1_blk", "", 20000, { "life_coplevel", "SCALAR", 2 } },
			{ "V_PlateCarrierSpec_blk", "", 30000, { "life_coplevel", "SCALAR", 3 } },
			{ "V_RebreatherB", "", 20000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } },
            { "B_Kitbag_cbr", "", 1000, { "", "", -1 } },
            { "B_FieldPack_cbr", "", 1000, { "", "", -1 } },
            { "B_AssaultPack_cbr", "", 2000, { "", "", -1 } },
            { "B_Bergen_sgg", "", 3000, { "", "", -1 } },
			{ "B_TacticalPack_blk", "", 4000, { "", "", -1 } },
            { "B_Carryall_cbr", "", 5000, { "", "", -1 } }
        };
    };

    class dive {
        title = "STR_Shops_C_Diving";
        license = "dive";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_B_Wetsuit", "", 20000, { "", "", -1 } },
			{ "U_O_Wetsuit", "", 20000, { "", "", -1 } },
			{ "U_I_Wetsuit", "", 20000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } },
            { "G_Diving", "", 2000, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_RebreatherB", "", 15000, { "", "", -1 } },
			{ "V_RebreatherIR", "", 15000, { "", "", -1 } },
			{ "V_RebreatherIA", "", 15000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } }
        };
    };

    class reb {
        title = "STR_Shops_C_Rebel";
        license = "rebel";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_IG_Guerilla1_1", "", 5000, {"", "", -1} },
			{ "U_IG_Guerilla2_1", "", 5000, {"", "", -1} },
			{ "U_IG_Guerilla2_2", "", 5000, {"", "", -1} },
			{ "U_IG_Guerilla2_3", "", 5000, {"", "", -1} },
			{ "U_IG_Guerilla3_1", "", 5000, {"", "", -1} },
			{ "U_IG_Guerilla3_2", "", 5000, {"", "", -1} },
			{ "U_BG_Guerilla2_1", "", 5000, {"", "", -1} },
			{ "U_BG_Guerilla2_2", "", 5000, {"", "", -1} },
			{ "U_BG_Guerilla2_3", "", 5000, {"", "", -1} },
			{ "U_BG_Guerilla3_1", "", 5000, {"", "", -1} },
			{ "U_BG_Guerilla3_2", "", 5000, {"", "", -1} },
			{ "U_I_C_Soldier_Bandit_1_F", "", 5000, {"", "", -1} },
			{ "U_I_C_Soldier_Bandit_2_F", "", 5000, {"", "", -1} },
			{ "U_I_C_Soldier_Bandit_3_F", "", 5000, {"", "", -1} },
			{ "U_I_C_Soldier_Bandit_4_F", "", 5000, {"", "", -1} },
			{ "U_I_C_Soldier_Bandit_5_F", "", 5000, {"", "", -1} },
			{ "U_I_C_Soldier_Para_1_F", "", 5000, {"", "", -1} },
			{ "U_I_C_Soldier_Para_2_F", "", 5000, {"", "", -1} },
			{ "U_I_C_Soldier_Para_3_F", "", 5000, {"", "", -1} },
			{ "U_I_C_Soldier_Para_4_F", "", 5000, {"", "", -1} },
			{ "U_I_C_Soldier_Para_5_F", "", 5000, {"", "", -1} },
			{ "U_BG_Guerrilla_6_1", "", 5000, {"", "", -1} },
			{ "U_OG_leader", "", 5000, {"", "", -1} },
			{ "U_B_survival_uniform", "", 5000, {"", "", -1} },
			{ "U_B_CTRG_1", "", 5000, {"", "", -1} },
			{ "U_B_CTRG_2", "", 5000, {"", "", -1} },
			{ "U_I_G_Story_Protagonist_F", "", 5000, {"", "", -1} },
			{ "U_I_G_resistanceLeader_F", "", 5000, {"", "", -1} },
			{ "U_O_PilotCoveralls", "", 5000, {"", "", -1} },
			{ "U_O_T_Officer_F", "", 7500, {"", "", -1} },
			{ "U_O_OfficerUniform_ocamo", "", 7500, {"", "", -1} },
			{ "U_B_FullGhillie_ard", "", 20000, {"", "", -1} },
			{ "U_B_FullGhillie_lsh", "", 20000, {"", "", -1} },
			{ "U_B_FullGhillie_sard", "", 20000, {"", "", -1} },
			{ "U_O_FullGhillie_ard", "", 20000, {"", "", -1} },
			{ "U_O_FullGhillie_lsh", "", 20000, {"", "", -1} },
			{ "U_O_FullGhillie_sard", "", 20000, {"", "", -1} },
			{ "U_I_FullGhillie_ard", "", 20000, {"", "", -1} },
			{ "U_I_FullGhillie_lsh", "", 20000, {"", "", -1} },
			{ "U_I_FullGhillie_sard", "", 20000, {"", "", -1} },
			{ "U_B_CTRG_Soldier_F", "", 75000, {"", "", -1} }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_Cap_headphones", "", 3000, { "", "", -1 } },
            { "H_ShemagOpen_tan", "", 4000, { "", "", -1 } },
			{ "H_Shemag_olive", "", 4000, { "", "", -1 } },
			{ "H_Shemag_khk", "", 4000, { "", "", -1 } },
			{ "H_ShemagOpen_khk", "", 4000, { "", "", -1 } },
			{ "H_Bandanna_cbr", "", 3000, { "", "", -1 } },
			{ "H_Bandanna_khk", "", 3000, { "", "", -1 } },
			{ "H_Bandanna_camo", "", 3000, { "", "", -1 } },
			{ "H_MilCap_mcamo", "", 3000, { "", "", -1 } },
			{ "H_MilCap_oucamo", "", 3000, { "", "", -1 } },
			{ "H_MilCap_gry", "", 3000, { "", "", -1 } },
			{ "H_Booniehat_dirty", "", 3000, { "", "", -1 } },
			{ "H_Booniehat_mcamo", "", 3000, { "", "", -1 } },
			{ "H_TurbanO_blk", "", 3000, { "", "", -1 } },
			{ "H_Booniehat_indp", "", 3000, { "", "", -1 } },
			{ "H_HelmetO_ocamo", "", 6000, { "", "", -1 } },
			{ "H_HelmetIA_camo", "", 6000, { "", "", -1 } },
			{ "H_HelmetB", "", 6000, { "", "", -1 } },
			{ "H_HelmetB_paint", "", 6000, { "", "", -1 } },
			{ "H_HelmetB_light", "", 6000, { "", "", -1 } },			
			{ "H_HelmetB_camo", "", 6000, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } },
            { "G_Shades_Black", "", 250, { "", "", -1 } },
            { "G_Shades_Blue", "", 250, { "", "", -1 } },
            { "G_Sport_Blackred", "", 250, { "", "", -1 } },
            { "G_Sport_Checkered", "", 250, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 250, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 250, { "", "", -1 } },
            { "G_Squares", "", 250, { "", "", -1 } },
            { "G_Lowprofile", "", 250, { "", "", -1 } },
            { "G_Combat", "", 250, { "", "", -1 } },
            // BI
            { "G_Balaclava_blk", "", 2500, { "", "", -1 } },
            { "G_Balaclava_combat", "", 2500, { "", "", -1 } },
            { "G_Balaclava_lowprofile", "", 2500, { "", "", -1 } },
            { "G_Balaclava_oli", "", 2500, { "", "", -1 } },
            { "G_Bandanna_aviator", "", 2500, { "", "", -1 } },
            { "G_Bandanna_beast", "", 2500, { "", "", -1 } },
            { "G_Bandanna_blk", "", 2500, { "", "", -1 } },
            { "G_Bandanna_khk", "", 2500, { "", "", -1 } },
            { "G_Bandanna_oli", "", 2500, { "", "", -1 } },
            { "G_Bandanna_shades", "", 2500, { "", "", -1 } },
            { "G_Bandanna_sport", "", 2500, { "", "", -1 } },
            { "G_Bandanna_tan", "", 2500, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_Rangemaster_belt", "", 2500, { "", "", -1 } },
            { "V_BandollierB_cbr", "", 4500, { "", "", -1 } },
			{ "V_BandollierB_oli", "", 4500, { "", "", -1 } },
			{ "V_BandollierB_blk", "", 4500, { "", "", -1 } },
			{ "V_Chestrig_oli", "", 5000, { "", "", -1 } },
			{ "V_Chestrig_blk", "", 5000, { "", "", -1 } },
			{ "V_Chestrig_rgr", "", 5000, { "", "", -1 } },
			{ "V_Chestrig_khk", "", 5000, { "", "", -1 } },
            { "V_HarnessO_brn", "", 7500, { "", "", -1 } },
			{ "V_Chestrig_rgr", "", 8500, { "", "", -1 } },
			{ "V_TacVest_oli", "", 9500, { "", "", -1 } },
			{ "V_TacVest_brn", "", 9500, { "", "", -1 } },
			{ "V_TacVest_khk", "", 9500, { "", "", -1 } },
			{ "V_TacVest_camo", "", 9500, { "", "", -1 } },
			{ "V_Press_F", "", 12000, { "", "", -1 } },
			{ "V_PlateCarrierIA1_dgtl", "", 10000, { "", "", -1 } },
			{ "V_PlateCarrier1_rgr", "", 10500, { "", "", -1 } },
			{ "V_PlateCarrierIA2_dgtl", "", 11000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } },
            {"B_AssaultPack_cbr", "", 3000, { "", "", -1 }},
			{"B_AssaultPack_tna_F", "", 3000, { "", "", -1 }},
            { "B_Kitbag_mcamo", "", 4500, { "", "", -1 } },
            { "B_TacticalPack_oli", "", 3500, { "", "", -1 } },
            { "B_FieldPack_ocamo", "", 3000, { "", "", -1 } },
            { "B_Bergen_sgg", "", 7500, { "", "", -1 } },
            { "B_Kitbag_cbr", "", 7500, { "", "", -1 } },
            { "B_Carryall_oli", "", 10000, { "", "", -1 } },
            { "B_Carryall_khk", "", 10000, { "", "", -1 } },
			{ "B_Carryall_ghex_F", "", 10000, { "", "", -1 } },
			{ "B_Bergen_dgtl_F", "", 50000, { "", "", -1 } },
			{ "B_Bergen_mcamo_F", "", 50000, { "", "", -1 } },
			{ "B_Bergen_tna_F", "", 50000, { "", "", -1 } }
        };
    };
	
	class assassin {
        title = "STR_Shops_C_Assassin";
        license = "assassin";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_O_V_Soldier_Viper_F", "", 175000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_HelmetB_TI_tna_F", "", 250000, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } },
			{ "B_ViperHarness_ghex_F", "", 100000, { "", "", -1 } }
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
