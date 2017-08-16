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
			{ "U_C_Poloshirt_blue", "Bender Shirt", 1000, { "", "", -1 } },
			{ "U_C_Poloshirt_burgundy", "Homer Shirt", 1000, { "", "", -1 } },
			{ "U_C_Poloshirt_stripped", "Itchy Shirt", 1000, { "", "", -1 } },
			{ "U_C_Poloshirt_tricolour", "Jerry Shirt", 1000, { "", "", -1 } },
			{ "U_C_Poloshirt_salmon", "Monster Shirt", 1000, { "", "", -1 } },
			{ "U_C_Poloshirt_redwhite", "Pink Panther Shirt", 1000, { "", "", -1 } },
			{ "U_I_C_Soldier_Bandit_1_F", "Casual Clothing 1", 1500, { "", "", -1 } },
			{ "U_I_C_Soldier_Bandit_2_F", "Casual Clothing 2", 1500, { "", "", -1 } },
			{ "U_I_C_Soldier_Bandit_3_F", "Casual Clothing 3", 1500, { "", "", -1 } },
			{ "U_I_C_Soldier_Bandit_4_F", "Casual Clothing 4", 1500, { "", "", -1 } },
			{ "U_I_C_Soldier_Bandit_5_F", "Casual Clothing 5", 1500, { "", "", -1 } },
			{ "U_C_man_sport_1_F", "Outdoor Clothing 1", 2000, { "", "", -1 } },
			{ "U_C_man_sport_2_F", "Outdoor Clothing 2", 2000, { "", "", -1 } },
			{ "U_C_man_sport_3_F", "Outdoor Clothing 3", 2000, { "", "", -1 } },
			{ "U_C_Man_casual_4_F", "Summer Clothing (Sky)", 2000, { "", "", -1 } },
			{ "U_C_Man_casual_6_F", "Summer Clothing (Red)", 2000, { "", "", -1 } },
			{ "U_C_Commoner1_1", "Sad Panda Shirt", 1000, { "", "", -1 } },
			{ "U_C_Poor_2", "Rag tagged clothes", 400, { "", "", -1 } },
			{ "U_IG_Guerilla2_2", "Green stripped shirt & Pants", 700, { "", "", -1 } },
			{ "U_IG_Guerilla3_1", "Brown Jacket & Pants", 900, { "", "", -1 } },
			{ "U_IG_Guerilla2_3", "The Outback Rangler", 1500, { "", "", -1 } },
			{ "U_C_HunterBody_grn", "The Hunters Look", 1700, { "", "", -1 } },
			{ "U_OrestesBody", "Surfing On Land", 1250, { "", "", -1 } },
			{ "U_NikosAgedBody", "Casual Wears", 5000, { "", "", -1 } },
			{ "U_C_Journalist", "Journalist", 5000, { "", "", -1 } },
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
            { "H_Cap_tan", "", 150, { "", "", -1 } },
            { "H_Cap_press", "", 150, { "", "", -1 } },
            { "H_Helmet_Skate", "", 300, { "", "", -1 } },
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
            { "G_Combat", "", 55, { "", "", -1 } },
            
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
			{ "V_Press_F", "", 7000, { "", "", -1 } }
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
            { "B_Carryall_khk", "", 5000, { "", "", -1 } },
            { "B_Parachute", "", 25000, { "", "", -1 } }
		};
	};

	class suit {
        title = "STR_Shops_C_Bruce";
        license = "rebel";
		side = "civ";
		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_C_Scientist", "Radiation Suit", 200000, {"", "", -1} }
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } }
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

	class cop {
        title = "STR_Shops_C_Police";
        license = "";
        side = "cop";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam", "Police Uniform", 0, { "", "", -1 } },
			{ "U_B_CTRG_1", "SO19 Fatigues", 0, { "license_cop_SCO", "BOOL", true } },
			{ "U_B_HeliPilotCoveralls", "Heli Uniform", 0, { "license_cop_cAir", "BOOL", true } },
			{ "U_C_Scientist", "Radiation Suit", 0, {"life_coplevel", "SCALAR", -1} },
            { "U_C_Poloshirt_blue", "(UC) Bender Shirt", 0, { "license_cop_UC", "BOOL", true } },
			{ "U_C_Poloshirt_burgundy", "(UC) Homer Shirt", 0, { "license_cop_UC", "BOOL", true } },
			{ "U_C_Poloshirt_stripped", "(UC) Itchy Shirt", 0, { "license_cop_UC", "BOOL", true } },
			{ "U_C_Poloshirt_tricolour", "(UC) Jerry Shirt", 0, { "license_cop_UC", "BOOL", true } },
			{ "U_C_Poloshirt_salmon", "(UC) Monster Shirt", 0, { "license_cop_UC", "BOOL", true } },
			{ "U_C_Poloshirt_redwhite", "(UC) Pink Panther Shirt", 0, { "license_cop_UC", "BOOL", true } },
			{ "U_C_Commoner1_1", "(UC) Sad Panda Shirt", 0, { "license_cop_UC", "BOOL", true } },
			{ "U_C_Poor_2", "(UC) Rag tagged clothes", 0, { "license_cop_UC", "BOOL", true } },
			{ "U_IG_Guerilla2_2", "(UC) Green stripped shirt & Pants", 0, { "license_cop_UC", "BOOL", true } },
			{ "U_IG_Guerilla3_1", "(UC) Brown Jacket & Pants", 0, { "license_cop_UC", "BOOL", true } },
			{ "U_IG_Guerilla2_3", "(UC) The Outback Rangler", 0, { "license_cop_UC", "BOOL", true } },
			{ "U_C_HunterBody_grn", "(UC) The Hunters Look", 0, { "license_cop_UC", "BOOL", true } },
			{ "U_OrestesBody", "(UC) Surfing On Land", 0, { "license_cop_UC", "BOOL", true } },		
            { "U_B_Wetsuit", "Wetsuit", 0, { "", "", -1 } },
            { "U_I_Wetsuit", "Wetsuit", 0, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
            { "H_Cap_police", "", 0, { "", "", -1 } },
            { "H_Beret_blk_POLICE", "", 0, { "life_coplevel", "SCALAR", 6 } },
			{ "H_Beret_gen_F", "", 0, { "life_coplevel", "SCALAR", 6 } },
			
            { "H_Bandanna_camo", "Undercover Bandana", 0, { "license_cop_UC", "BOOL", true } },
            { "H_ShemagOpen_khk", "Undercover Shemagh", 0, { "license_cop_UC", "BOOL", true } },
            { "H_ShemagOpen_tan", "Undercover Shemagh", 0, { "license_cop_UC", "BOOL", true } },
			{ "H_Shemag_olive_hs", "Undercover Shemagh", 0, { "license_cop_UC", "BOOL", true } },

            { "H_HelmetB_black", "SWAT Helmet", 0, { "license_cop_SCO", "BOOL", true } },
			{ "H_HelmetSpecB_blk", "SWAT Helmet", 0, { "license_cop_SCO", "BOOL", true } },
			{ "H_HelmetB_light_black", "SWAT Helmet", 0, { "license_cop_SCO", "BOOL", true } },
            { "H_CrewHelmetHeli_B", "SWAT Mask", 0, { "license_cop_SCO", "BOOL", true } },

			{ "H_Beret_Colonel", "", 0, { "life_coplevel", "SCALAR", 6 } },
			{ "H_Watchcap_blk", "", 0, { "life_coplevel", "SCALAR", 6 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } },
			{ "G_Shades_Black", "", 0, { "", "", -1 } },
			{ "G_Shades_Blue", "", 0, { "", "", -1 } },
			{ "G_Sport_Blackred", "", 0, { "", "", -1 } },
			{ "G_Sport_Checkered", "", 0, { "", "", -1 } },
			{ "G_Sport_Blackyellow", "", 0, { "", "", -1 } },
			{ "G_Sport_BlackWhite", "", 0, { "", "", -1 } },
			{ "G_Squares", "", 0, { "", "", -1 } },
			{ "G_Aviator", "", 0, { "", "", -1 } },
			{ "G_Diving", "", 0, { "", "", -1 } },
			{ "G_Combat", "", 0, { "", "", -1 } },
			{ "G_Bandanna_beast", "", 0, { "", "", 4 } },
			{ "G_Balaclava_blk", "", 0, { "", "", 4 } },
            { "G_Balaclava_TI_blk_F", "", 0, { "", "", 4 } },
            { "G_Balaclava_TI_G_blk_F", "", 0, { "", "", 4 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
			{ "V_RebreatherB", "", 0, { "life_coplevel", "SCALAR", 3 } },
			{ "V_TacVest_blk_POLICE", "Police Officer Vest", 0, { "", "", -1 } },
			{ "V_TacVest_blk", "Police Vest", 1000, { "life_coplevel", "SCALAR", 3 } },
            { "V_PlateCarrier1_blk", "Police Vest V1", 3000, { "life_coplevel", "SCALAR", 4 } },
			{ "V_PlateCarrier2_blk", "Police Vest V2", 5000, { "life_coplevel", "SCALAR", 4 } },
            { "V_PlateCarrierGL_blk", "SWAT Vest", 6000, { "license_cop_SCO", "BOOL", true } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } },
			{ "B_UavTerminal", "Uav Terminal", 1000, { "license_cop_copuav", "BOOL", true } },
            { "B_UAV_01_backpack_F", "Drone", 3000, { "license_cop_copuav", "BOOL", true } },
            { "B_Carryall_mcamo", "Carryall Invis Backpack", 500, { "life_coplevel", "SCARLAR", -1 } },
			{ "B_ViperLightHarness_blk_F", "Viper Invis Backpack", 500, { "life_coplevel", "SCARLAR", -1 } },
            { "B_ViperHarness_blk_F", "Viper Invis Backpack", 500, { "life_coplevel", "SCARLAR", -1 } }
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
	
	class bounty_clothing {
        title = "Bounty Hunter Clothing";
        license = "bountyhunter";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam_worn", "Bounty Hunter", 1000, { "", "", -1 } },
			//{ "U_C_Poloshirt_blue", "Bender Shirt", 1000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
			{ "V_Rangemaster_belt", "", 1000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } },
			{ "B_FieldPack_oli", "Backpack", 1000, { "", "", -1 } }
        };
    };

    class gun_clothing {
        title = "STR_Shops_C_Gun";
        license = "gun";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_Competitor", "", 2500, {"", "", -1} }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_Booniehat_indp", "", 1000, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_Rangemaster_belt", "", 5000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } },
			{ "B_TacticalPack_oli", "", 3000, { "", "", -1 } }
        };
    };

    class gang_clothing {
        title = "STR_Shops_C_Gang";
        license = "";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_IG_Guerilla2_1", "", 50000, {"", "", -1} },
            { "U_BG_Guerilla1_1", "", 50000, {"", "", -1} },
            { "U_BG_Guerilla2_1", "", 50000, {"", "", -1} },
            { "U_BG_Guerilla2_2", "", 50000, {"", "", -1} }
        };
        headgear[] = {
			{ "H_Cap_headphones", "", 1000, { "", "", -1 } },
			{ "H_Cap_grn_BI", "", 1000, { "", "", -1 } },
			{ "H_Cap_oli_hs", "", 1000, { "", "", -1 } },
			{ "H_MilCap_ocamo", "", 1000, { "", "", -1 } },
			{ "H_MilCap_mcamo", "", 1000, { "", "", -1 } },
			{ "H_MilCap_oucamo", "", 1000, { "", "", -1 } },
			{ "H_MilCap_dgtl", "", 1000, { "", "", -1 } },
			{ "H_MilCap_ghex_F", "", 1000, { "", "", -1 } },
			{ "H_MilCap_tna_F", "", 1000, { "", "", -1 } },
			{ "H_Watchcap_camo", "", 1000, { "", "", -1 } },
			{ "H_Booniehat_mcamo", "", 1000, { "", "", -1 } },
			{ "H_Booniehat_khk_hs", "", 1000, { "", "", -1 } },
			{ "H_Booniehat_grn", "", 1000, { "", "", -1 } },
			{ "H_Bandanna_khk_hs", "", 1000, { "", "", -1 } },
			{ "H_Booniehat_indp", "", 1000, { "", "", -1 } },
			{ "H_Booniehat_tna_F", "", 1000, { "", "", -1 } },
			{ "H_Shemag_khk", "", 1000, { "", "", -1 } },
			{ "H_Shemag_tan", "", 1000, { "", "", -1 } },
			{ "H_Shemag_olive", "", 1000, { "", "", -1 } },
			{ "H_Shemag_olive_hs", "", 1000, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } },
            { "G_Shades_Black", "", 250, { "", "", -1 } },
            { "G_Shades_Blue", "", 200, { "", "", -1 } },
            { "G_Sport_Blackred", "", 200, { "", "", -1 } },
            { "G_Sport_Checkered", "", 200, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 200, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 200, { "", "", -1 } },
            { "G_Bandanna_beast", "", 1500, { "", "", -1 } },
            { "G_Bandanna_khk", "", 1500, { "", "", -1 } },
            { "G_Bandanna_oli", "", 1500, { "", "", -1 } },
            { "G_Bandanna_shades", "", 1500, { "", "", -1 } },
            { "G_Bandanna_sport", "", 1500, { "", "", -1 } },
            { "G_Bandanna_tan", "", 1500, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_Chestrig_khk", "", 5000, { "", "", -1 } },
            { "V_TacVest_khk", "", 6000, { "", "", -1 } },
            { "V_TacVest_camo", "", 6000, { "", "", -1 } },
            { "V_TacVest_blk", "", 6000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } },
            { "B_AssaultPack_khk", "", 200000, { "", "", -1 } },
            { "B_AssaultPack_tna_F", "", 20000, { "", "", -1 } },
            { "B_TacticalPack_oli", "", 25000, { "", "", -1 } },
            { "B_Kitbag_mcamo", "", 35000, { "", "", -1 } },
            { "B_Kitbag_sgg", "", 35000, { "", "", -1 } },
            { "B_Kitbag_cbr", "", 35000, { "", "", -1 } },
            { "B_FieldPack_ocamo", "", 40000, { "", "", -1 } },
            { "B_FieldPack_oucamo", "", 40000, { "", "", -1 } },
            { "B_OutdoorPack_blk", "", 5000, { "", "", -1 } }
        };
    };

    class med_clothing {
        title = "STR_MAR_EMS_Clothing_Shop";
        license = "";
        side = "med";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_B_CombatUniform_mcam", "NHS Uniform", 0, { "", "", -1 } },
			{ "U_B_Wetsuit", "Wetsuit", 0, { "", "", -1 } },
			{ "U_I_Wetsuit", "Wetsuit", 0, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
            { "H_Cap_blu", "", 0, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } },
            { "G_Shades_Blue", "",0, { "", "", -1 } },
			{ "G_Diving", "", 0, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
			{ "V_RebreatherB", "", 0, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } },
            { "B_Carryall_mcamo", "Carryall Backpack", 0, { "", "", -1 } },
			{ "B_ViperLightHarness_blk_F", "Viper Invis Backpack", 0, { "", "", -1 } },
            { "B_ViperHarness_blk_F", "Viper Invis Backpack", 0, { "", "", -1 } }
        };
    };

	class reb {
		title = "STR_Shops_C_Rebel";
		license = "rebel";
		side = "civ";
		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_I_C_Soldier_Para_1_F", "", 18000, {"", "", -1} },
			{ "U_I_C_Soldier_Para_2_F", "", 18000, {"", "", -1} },
			{ "U_I_C_Soldier_Para_3_F", "", 18000, {"", "", -1} },
			{ "U_I_C_Soldier_Para_4_F", "", 18000, {"", "", -1} },
			{ "U_I_C_Soldier_Para_5_F", "", 18000, {"", "", -1} },
			{ "U_BG_Guerilla1_1", "", 18000, {"", "", -1} },
			{ "U_O_SpecopsUniform_ocamo", "", 18000, {"", "", -1} },
			{ "U_O_PilotCoveralls", "", 18000, {"", "", -1} },
			{ "U_O_GhillieSuit", "", 120000, { "", "", -1 } },
			//{ "U_C_Scientist", "Radiation Suit", 20000, {"", "", -1} },
			{ "U_O_FullGhillie_lsh", "", 200000, { "license_civ_advguerilla", "BOOL", 1 } },
			{ "U_O_OfficerUniform_ocamo", "", 60000, { "license_civ_advguerilla", "BOOL", 1 } },
			{ "U_O_V_Soldier_Viper_hex_F", "Anti-Thermal Fatigues", 400000, { "license_civ_advguerilla", "BOOL", 1 } },
			{ "U_I_C_Soldier_Camo_F", "", 50000, { "license_civ_advguerilla", "BOOL", 1 } },
			{ "U_B_T_Soldier_F", "",12000, {"", "", -1} },
			{ "U_B_T_Soldier_AR_F", "", 10000, {"", "", -1} },
			{ "U_I_CombatUniform", "Full Uniform", 6000, {"", "", -1} },
			{ "U_I_CombatUniform_shortsleeve", "Short-Sleeve Uniform", 8000, {"", "", -1} },
			{ "U_I_OfficerUniform", "Officer Fatigues", 25000, { "license_civ_advguerilla", "BOOL", 1 } },
			{ "U_B_T_Soldier_SL_F", "", 20000, { "license_civ_advguerilla", "BOOL", 1 } },
			{ "U_O_T_FullGhillie_tna_F", "", 200000, { "license_civ_advguerilla", "BOOL", 1 } },
			{ "U_O_V_Soldier_Viper_F", "Anti-Thermal Fatigues", 400000, { "license_civ_advguerilla", "BOOL", 1 } },
			{ "U_IG_Guerilla1_1", "", 5000, {"", "", -1} },
			{ "U_IG_Guerilla2_1", "", 5000, {"", "", -1} },
			{ "U_IG_Guerilla2_2", "", 5000, {"", "", -1} },
			{ "U_IG_Guerilla2_3", "", 5000, {"", "", -1} },
			{ "U_I_G_Story_Protagonist_F", "", 7500, { "", "", -1 } },
			{ "U_I_G_resistanceLeader_F", "", 11500, { "", "", -1 } },
			{ "U_O_CombatUniform_oucamo", "", 15610, { "", "", -1 } },
			{ "U_B_PilotCoveralls", "", 15500, { "", "", -1 } },
			{ "U_I_HeliPilotCoveralls", "", 15500, { "", "", -1 } },
			{ "U_B_HeliPilotCoveralls", "", 15500, { "", "", -1 } },
			{ "U_B_CTRG_1", "", 50000, { "", "", -1 } },
			{ "U_B_CTRG_2", "", 50000, { "", "", -1 } },
			{ "U_IG_leader", "", 50000, { "", "", -1 } },
			{ "U_KerryBody", "", 15340, { "", "", -1 } },
			{ "U_B_SpecopsUniform_sgg", "", 15340, { "", "", -1 } },
			{ "U_B_survival_uniform", "", 25340, { "", "", -1 } },
			{ "U_IG_Guerilla3_2", "", 25340, { "", "", -1 } },
			{ "U_IG_Guerrilla_6_1", "", 5340, { "", "", -1 } },
			{ "U_O_FullGhillie_ard", "", 15340, { "", "", -1 } },
			{ "U_O_FullGhillie_sard", "", 15340, { "", "", -1 } }
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_Booniehat_khk_hs", "", 2000, { "", "", -1 } },
			{ "H_ShemagOpen_tan", "", 5000, { "", "", -1 } },
			{ "H_Shemag_olive", "", 5000, { "", "", -1 } },
			{ "H_ShemagOpen_khk", "", 5000, { "", "", -1 } },
			{ "H_HelmetO_ocamo", "", 6500, { "", "", -1 } },
			{ "H_MilCap_oucamo", "", 3000, { "", "", -1 } },
			{ "H_Bandanna_camo", "", 800, { "", "", -1 } },
			{ "H_HelmetB_Snakeskin", "", 6500, { "", "", -1 } },
			{ "H_Watchcap_camo", "", 3000, { "license_civ_advguerilla", "BOOL", 1 } },
			{ "H_Booniehat_tna_F", "", 2000, { "", "", -1 } },
			{ "H_Booniehat_dgtl", "", 2000, { "", "", -1 } },
			{ "H_MilCap_tna_F", "", 2000, { "", "", -1 } },
			{ "H_HelmetB_tna_F", "", 7500, { "", "", -1 } },
			{ "H_MilCap_dgtl", "", 7500, { "", "", -1 } },
			{ "H_HelmetIA", "", 10000, { "", "", -1 } },
			{ "H_HelmetB_Enh_tna_F", "", 10000, { "license_civ_advguerilla", "BOOL", 1 } },
			{ "H_HelmetB_Light_tna_F", "", 10000, { "license_civ_advguerilla", "BOOL", 1 } }
			//{ "H_HelmetO_ViperSP_ghex_F", "", 600000, { "license_civ_advguerilla", "BOOL", 1 } } //Disabled Too OverPowered
		};

		goggles[] = {
			{ "NONE", "Remove Glasses", 0, { "", "", -1 } },
			{ "G_Shades_Black", "", 300, { "", "", -1 } },
			{ "G_Shades_Blue", "", 300, { "", "", -1 } },
			{ "G_Sport_Blackred", "", 300, { "", "", -1 } },
			{ "G_Sport_Checkered", "", 300, { "", "", -1 } },
			{ "G_Sport_Blackyellow", "", 300, { "", "", -1 } },
			{ "G_Sport_BlackWhite", "", 300, { "", "", -1 } },
			{ "G_Squares", "", 2000, { "", "", -1 } },
			{ "G_Lowprofile", "", 4000, { "", "", -1 } },
			{ "G_Combat", "", 7000, { "", "", -1 } },
			// BI
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
			{ "V_BandollierB_cbr", "", 15000, { "", "", -1 } },
			{ "V_BandollierB_rgr", "", 15000, { "", "", -1 } },
			{ "V_BandollierB_khk", "", 15000, { "", "", -1 } },
			{ "V_HarnessO_brn", "", 17000, { "", "", -1 } },
			{ "V_HarnessOGL_brn", "", 17000, { "", "", -1 } },
			{ "V_HarnessO_gry", "", 17000, { "", "", -1 } },
			{ "V_HarnessO_brn", "", 17000, { "", "", -1 } },
			{ "V_HarnessOGL_brn", "", 17000, { "", "", -1 } },
			{ "V_TacVest_brn", "", 25000, { "", "", -1 } },
      		{ "V_TacVest_camo", "", 25000, { "", "", -1 } },
			{ "V_I_G_resistanceLeader_F", "", 25000, { "", "", -1 } },
			{ "V_PlateCarrier1_rgr_noflag_F", "", 50000, { "license_civ_advguerilla", "BOOL", 1 } },
			{ "V_PlateCarrier2_rgr_noflag_F", "", 100000, { "license_civ_advguerilla", "BOOL", 1 } },
			{ "V_PlateCarrierH_CTRG", "", 100000, { "license_civ_advguerilla", "BOOL", 1 } },
			{ "V_BandollierB_oli", "", 5000, { "", "", -1 } },
			{ "V_HarnessOGL_ghex_F", "", 10000, { "", "", -1 } },
			{ "V_TacVest_oli", "", 25000, { "", "", -1 } },
			{ "V_PlateCarrier1_tna_F", "", 50000, { "", "", -1 } },
			{ "V_PlateCarrierIA1_dgtl", "", 50000, { "", "", -1 } },
			{ "V_PlateCarrier2_tna_F", "", 75000, { "license_civ_advguerilla", "BOOL", 1 } },
			{ "V_PlateCarrierIA2_dgtl", "", 75000, { "license_civ_advguerilla", "BOOL", 1 } },
			{ "V_PlateCarrierGL_rgr", "", 120000, { "license_civ_advguerilla", "BOOL", 1 } },
			{ "V_BandollierB_khk", "", 12500, { "", "", -1 } },
			{ "V_BandollierB_blk", "", 12500, { "", "", -1 } },
			{ "V_Chestrig_blk", "", 14500, { "", "", -1 } },
			{ "V_TacVest_brn", "", 17500, { "", "", -1 } },
			{ "V_TacVest_oli", "", 17500, { "", "", -1 } },
			{ "V_I_G_resistanceLeader_F", "", 17500, { "", "", -1 } },
			{ "V_PlateCarrierH_CTRG", "", 17500, { "", "", -1 } },
			{ "V_PlateCarrierL_CTRG", "", 17500, { "", "", -1 } },
			{ "V_PlateCarrierIA2_dgtl", "", 17500, { "", "", -1 } },
			{ "V_TacVest_camo", "", 15000, { "", "", -1 } },
			{ "V_PlateCarrier1_rgr", "", 15000, { "", "", -1 } }
		};

		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "", "", -1 } },
			{ "B_AssaultPack_cbr", "", 4000, { "", "", -1 } },
			{ "B_Kitbag_mcamo", "", 5000, { "", "", -1 } },
			{ "B_TacticalPack_oli", "", 3500, { "", "", -1 } },
			{ "B_FieldPack_ocamo", "", 3500, { "", "", -1 } },
			{ "B_AssaultPack_blk", "", 4000, { "", "", -1 } },
			{ "B_Bergen_sgg", "", 5000, { "", "", -1 } },
			{ "B_Kitbag_cbr", "", 4500, { "", "", -1 } },
			{ "B_Carryall_oli", "", 6000, { "", "", -1 } },
			{ "B_HuntingBackpack", "", 5500, { "", "", -1 } },
			{ "B_ViperHarness_ghex_F", "Slim Backpack Green Hex", 7000, { "", "", -1 } },
			{ "B_ViperHarness_oli_F", "Slim Backpack Olive", 7000, { "", "", -1 } },
			{ "B_ViperHarness_khk_F", "Slim Backpack Khaki", 7000, { "", "", -1 } },
			{ "B_ViperHarness_hex_F", "Slim Backpack Hex", 7000, { "", "", -1 } },
			{ "B_Carryall_mcamo", "", 8000, { "", "", -1 } },
			{ "B_Carryall_oucamo", "", 8000, { "", "", -1 } },
			{ "B_Carryall_ocamo", "", 8000, { "", "", -1 } },
			{ "B_Carryall_khk", "", 8000, { "", "", -1 } },
			{ "B_Bergen_dgtl_F", "", 20000, { "", "", -1 } },
			{ "B_Bergen_hex_F", "", 20000, { "", "", -1 } },
			{ "B_Bergen_mcamo_F", "", 20000, { "", "", -1 } },
			{ "B_Bergen_tna_F", "", 20000, { "", "", -1 } }
		};
	};
	
	class corp {
		title = "STR_Shops_C_Corp";
		license = "corp";
		side = "civ";
		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_B_T_Soldier_F", "",12000, {"", "", -1} },
			{ "U_B_T_Soldier_AR_F", "", 10000, {"", "", -1} },
			{ "U_I_CombatUniform", "Full Uniform", 6000, {"", "", -1} },
			{ "U_I_CombatUniform_shortsleeve", "Short-Sleeve Uniform", 8000, {"", "", -1} },
			{ "U_I_OfficerUniform", "Officer Fatigues", 25000, { "license_civ_advcorp", "BOOL", 1 } },
			{ "U_B_T_Soldier_SL_F", "", 20000, { "license_civ_advcorp", "BOOL", 1 } },
			{ "U_O_T_FullGhillie_tna_F", "", 200000, { "license_civ_advcorp", "BOOL", 1 } },
			{ "U_O_V_Soldier_Viper_F", "Anti-Thermal Fatigues", 400000, { "license_civ_advcorp", "BOOL", 1 } }
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_Booniehat_tna_F", "", 2000, { "", "", -1 } },
			{ "H_Booniehat_dgtl", "", 2000, { "", "", -1 } },
			{ "H_MilCap_tna_F", "", 2000, { "", "", -1 } },
			{ "H_HelmetB_tna_F", "", 7500, { "", "", -1 } },
			{ "H_MilCap_dgtl", "", 7500, { "", "", -1 } },
			{ "H_HelmetIA", "", 10000, { "", "", -1 } },
			{ "H_HelmetB_Enh_tna_F", "", 10000, { "license_civ_advcorp", "BOOL", 1 } },
			{ "H_HelmetB_Light_tna_F", "", 10000, { "license_civ_advcorp", "BOOL", 1 } }
			//{ "H_HelmetO_ViperSP_ghex_F", "", 600000, { "license_civ_advcorp", "BOOL", 1 } } //Disabled Too OverPowered
		};

		goggles[] = {
			{ "NONE", "Remove Glasses", 0, { "", "", -1 } },
			{ "G_Shades_Black", "", 300, { "", "", -1 } },
			{ "G_Shades_Blue", "", 300, { "", "", -1 } },
			{ "G_Sport_Blackred", "", 300, { "", "", -1 } },
			{ "G_Sport_Checkered", "", 300, { "", "", -1 } },
			{ "G_Sport_Blackyellow", "", 300, { "", "", -1 } },
			{ "G_Sport_BlackWhite", "", 300, { "", "", -1 } },
			{ "G_Squares", "", 2000, { "", "", -1 } },
			{ "G_Lowprofile", "", 4000, { "", "", -1 } },
			{ "G_Combat", "", 7000, { "", "", -1 } },
			{ "G_Combat", "", 7000, { "", "", -1 } },
            // BI
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
			{ "V_BandollierB_oli", "", 5000, { "", "", -1 } },
			{ "V_HarnessOGL_ghex_F", "", 10000, { "", "", -1 } },
			{ "V_TacVest_oli", "", 25000, { "", "", -1 } },
			{ "V_PlateCarrier1_tna_F", "", 50000, { "", "", -1 } },
			{ "V_PlateCarrierIA1_dgtl", "", 50000, { "", "", -1 } },
			{ "V_PlateCarrier2_tna_F", "", 75000, { "license_civ_advcorp", "BOOL", 1 } },
			{ "V_PlateCarrierIA2_dgtl", "", 75000, { "license_civ_advcorp", "BOOL", 1 } },
			{ "V_PlateCarrierSpec_tna_F", "", 120000, { "license_civ_advcorp", "BOOL", 1 } }
		};

		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "", "", -1 } },
			{ "B_AssaultPack_cbr", "", 4000, { "", "", -1 } },
			{ "B_Kitbag_mcamo", "", 5000, { "", "", -1 } },
			{ "B_TacticalPack_oli", "", 3500, { "", "", -1 } },
			{ "B_AssaultPack_blk", "", 4000, { "", "", -1 } },
			{ "B_FieldPack_ocamo", "", 3500, { "", "", -1 } },
			{ "B_Bergen_sgg", "", 5000, { "", "", -1 } },
			{ "B_Kitbag_cbr", "", 4500, { "", "", -1 } },
			{ "B_Carryall_oli", "", 6000, { "", "", -1 } },
			{ "B_HuntingBackpack", "", 5500, { "", "", -1 } },
			{ "B_ViperHarness_ghex_F", "Slim Backpack Green Hex", 7000, { "", "", -1 } },
			{ "B_ViperHarness_oli_F", "Slim Backpack Olive", 7000, { "", "", -1 } },
			{ "B_ViperHarness_khk_F", "Slim Backpack Khaki", 7000, { "", "", -1 } },
			{ "B_ViperHarness_hex_F", "Slim Backpack Hex", 7000, { "", "", -1 } },
			{ "B_Carryall_mcamo", "", 8000, { "", "", -1 } },
			{ "B_Carryall_oucamo", "", 8000, { "", "", -1 } },
			{ "B_Carryall_ocamo", "", 8000, { "", "", -1 } },
			{ "B_Carryall_khk", "", 8000, { "", "", -1 } },
			{ "B_Bergen_dgtl_F", "", 20000, { "", "", -1 } },
			{ "B_Bergen_hex_F", "", 20000, { "", "", -1 } },
			{ "B_Bergen_mcamo_F", "", 20000, { "", "", -1 } },
			{ "B_Bergen_tna_F", "", 20000, { "", "", -1 } }
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
