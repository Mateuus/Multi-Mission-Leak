/*
	ARRAY FORMAT:
		0: STRING (Classname)
		1: STRING (Display Name, leave as "" for default)
		2: SCALAR (Price)
		4: ARRAY (This is for limiting items to certain things)
			0: Variable to read from
			1: Variable Value Type
			2: What to compare to
*/
class Clothing {
	class bruce {
		title = "STR_Shops_C_Bruce";
		license = "";
		side = "civ";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_C_Poloshirt_blue", "Poloshirt Blue", 25, { "", "", -1 } },
			{ "U_C_Poloshirt_burgundy", "Poloshirt Burgundy", 27, { "", "", -1 } },
			{ "U_C_Poloshirt_redwhite", "Poloshirt Red/White", 15, { "", "", -1 } },
			{ "U_C_Poloshirt_salmon", "Poloshirt Salmon", 17, { "", "", -1 } },
			{ "U_C_Poloshirt_stripped", "Poloshirt stripped", 12, { "", "", -1 } },
			{ "U_C_Poloshirt_tricolour", "Poloshirt Tricolor", 35, { "", "", -1 } },
			{ "U_C_Poor_2", "Rag tagged clothes", 25, { "", "", -1 } },
			{ "U_IG_Guerilla2_2", "Green stripped shirt & Pants", 65, { "", "", -1 } },
			{ "U_IG_Guerilla3_1", "Brown Jacket & Pants", 75, { "", "", -1 } },
			{ "U_IG_Guerilla2_3", "The Outback Rangler", 100, { "", "", -1 } },
			{ "U_C_HunterBody_grn", "The Hunters Look", 60, { "", "", -1 } },
			{ "U_C_WorkerCoveralls", "Mechanic Coveralls", 90, { "", "", -1 } },
			{ "U_OrestesBody", "Surfing On Land", 80, { "", "", -1 } },
			{ "TRYK_U_B_C02_Tsirt", "", 70, { "", "", -1 } },
			{ "U_NikosAgedBody", "Casual Wears", 70, { "", "", -1 } }

		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_Bandanna_camo", "Camo Bandanna", 12, { "", "", -1 } },
			{ "H_Bandanna_surfer", "Surfer Bandanna", 13, { "", "", -1 } },
			{ "H_Bandanna_gry", "Grey Bandanna", 10, { "", "", -1 } },
			{ "H_Bandanna_cbr", "", 16, { "", "", -1 } },
			{ "H_Bandanna_surfer", "", 13, { "", "", -1 } },
			{ "H_Bandanna_khk", "Khaki Bandanna", 15, { "", "", -1 } },
			{ "H_Bandanna_sgg", "Sage Bandanna", 16, { "", "", -1 } },
			{ "H_StrawHat", "Straw Fedora", 22, { "", "", -1 } },
			{ "H_BandMask_blk", "Hat & Bandanna", 30, { "", "", -1 } },
			{ "H_Booniehat_tan", "", 42, { "", "", -1 } },
			{ "H_Hat_blue", "", 31, { "", "", -1 } },
			{ "H_Hat_brown", "", 27, { "", "", -1 } },
			{ "H_Hat_checker", "", 34, { "", "", -1 } },
			{ "H_Hat_grey", "", 28, { "", "", -1 } },
			{ "H_Hat_tan", "", 26, { "", "", -1 } },
			{ "H_Cap_blu", "", 10, { "", "", -1 } },
			{ "H_Cap_grn", "", 10, { "", "", -1 } },
			{ "H_Cap_grn_BI", "", 10, { "", "", -1 } },
			{ "H_Cap_oli", "", 10, { "", "", -1 } },
			{ "H_Cap_brn_SPECOPS", "", 20, { "", "", -1 } },
			{ "H_Cap_khaki_specops_UK", "", 20, { "", "", -1 } },
			{ "H_Cap_oli", "", 20, { "", "", -1 } },
			{ "H_Cap_tan", "", 20, { "", "", -1 } },
			{ "H_Cap_red", "", 20, { "", "", -1 } },
			{ "H_Cap_tan_specops_US", "", 20, { "", "", -1 } },
			{ "H_Bandanna_camo", "", 20, { "", "", -1 } },
			{ "H_Bandanna_cbr", "", 20, { "", "", -1 } },
			{ "H_Bandanna_gry", "", 20, { "", "", -1 } },
			{ "H_Bandanna_khk", "", 25, { "", "", -1 } },
			{ "H_Bandanna_mcamo", "", 25, { "", "", -1 } },
			{ "H_Bandanna_sgg", "", 25, { "", "", -1 } },
			{ "H_Bandanna_surfer", "", 25, { "", "", -1 } }

		};

		goggles[] = {
			{ "NONE", "Remove Glasses", 0, { "", "", -1 } },
			{ "G_Shades_Black", "", 6, { "", "", -1 } },
			{ "G_Shades_Blue", "", 7, { "", "", -1 } },
			{ "G_Sport_Blackred", "", 10, { "", "", -1 } },
			{ "G_Sport_Checkered", "", 10, { "", "", -1 } },
			{ "G_Sport_Blackyellow", "", 13, { "", "", -1 } },
			{ "G_Sport_BlackWhite", "", 13, { "", "", -1 } },
			{ "G_Squares", "", 10, { "", "", -1 } },
			{ "G_Aviator", "", 10, { "", "", -1 } },
			{ "G_Lady_Mirror", "", 15, { "", "", -1 } },
			{ "G_Lady_Dark", "", 15, { "", "", -1 } },
			{ "G_Lady_Blue", "", 15, { "", "", -1 } },
			{ "G_Lowprofile", "", 30, { "", "", -1 } },
			{ "G_Combat", "", 55, { "", "", -1 } }
		};

		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } }
		};

		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "", "", -1 } },
			{ "B_AssaultPack_cbr", "", 250, { "", "", -1 } },
			{ "B_Kitbag_mcamo", "", 400, { "", "", -1 } },
			{ "B_TacticalPack_oli", "", 300, { "", "", -1 } },
			{ "B_FieldPack_ocamo", "", 300, { "", "", -1 } },
			{ "B_Bergen_sgg", "", 400, { "", "", -1 } },
			{ "B_Kitbag_cbr", "", 450, { "", "", -1 } },
			{ "B_Carryall_oli", "", 500, { "", "", -1 } },
			{ "B_Carryall_khk", "", 500, { "", "", -1 } }
		};
	};

	class cop {
		title = "STR_Shops_C_Police";
		license = "";
		side = "cop";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "sab_UN_Soldier_Clothing", "", 10, { "life_coplevel", "SCALAR", 6 } },
			{ "sab_UN_Soldier_ClothingS", "", 10, { "life_coplevel", "SCALAR", 6 } },
			{ "sab_UN_Soldier_ClothingP", "", 10, { "life_coplevel", "SCALAR", 6 } },
			{ "sab_UN_Soldier_ClothingSD", "", 10, { "life_coplevel", "SCALAR", 6 } },
			{ "sab_UN_Soldier_ClothingPD", "", 10, { "life_coplevel", "SCALAR", 6 } },
			{ "sab_UN_Soldier_ClothingD", "", 10, { "life_coplevel", "SCALAR", 6 } },
			{ "sab_UN_Soldier_ClothingU", "", 10, { "life_coplevel", "SCALAR", 6 } },
			{ "sab_UN_Soldier_ClothingSU", "", 10, { "life_coplevel", "SCALAR", 6 } },
			{ "sab_UN_Soldier_ClothingPU", "", 10, { "life_coplevel", "SCALAR", 6 } },
			{ "sab_UN_Soldier_ClothingK", "", 10, { "life_coplevel", "SCALAR", 6 } },
			{ "sab_UN_Officer_ClothingE", "", 10, { "life_coplevel", "SCALAR", 6 } },
			{ "sab_UN_Soldier_ClothingA", "", 10, { "life_coplevel", "SCALAR", 6 } },
			{ "sab_UN_Soldier_ClothingI", "", 10, { "life_coplevel", "SCALAR", 6 } },
			{ "sab_UN_Soldier_ClothingB", "", 10, { "life_coplevel", "SCALAR", 6 } },
			{ "TRYK_U_B_BLK", "", 10, { "life_coplevel", "SCALAR", 6 } },
			{ "TRYK_U_B_3c", "", 10, { "life_coplevel", "SCALAR", 6 } },
			{ "U_B_HeliPilotCoveralls", "", 10, { "life_coplevel", "SCALAR", 6 } },
			{ "TRYK_U_B_MARPAT_Wood_Tshirt", "", 10, { "life_coplevel", "SCALAR", 6 } },
			{ "Trixie_Ghillie_Uniform_03", "", 10, { "life_coplevel", "SCALAR", 6 } },
			{ "Trixie_Ghillie_Uniform_03", "", 10, { "life_coplevel", "SCALAR", 6 } }

		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "sab_UN_Turban", "", 10, { "life_coplevel", "SCALAR", 1 } },
			{ "sab_UN_HelmetHeli", "", 12, { "life_coplevel", "SCALAR", 1 } },
			{ "sab_UN_cap", "", 12, { "life_coplevel", "SCALAR", 1 } },
			{ "sab_UN_capHP", "", 12, { "life_coplevel", "SCALAR", 1 } },
			{ "sab_UN_Beret", "", 12, { "life_coplevel", "SCALAR", 1 } },
			{ "sab_UN_Helmet", "", 10, { "life_coplevel", "SCALAR", 1 } },
			{ "H_PilotHelmetHeli_B", "", 10, { "life_coplevel", "SCALAR", 1 } },
			{ "H_Booniehat_mcamo", "", 10, { "life_coplevel", "SCALAR", 1 } },
			{ "H_Beret_Colonel", "", 10, { "life_coplevel", "SCALAR", 1 } },
			{ "H_Beret_02", "", 10, { "life_coplevel", "SCALAR", 1 } },
			{ "H_MilCap_gry", "", 10, { "life_coplevel", "SCALAR", 1 } },
			{ "TRYK_H_Helmet_3C", "", 10, { "life_coplevel", "SCALAR", 1 } },
			{ "H_Cap_usblack", "", 20, { "life_coplevel", "SCALAR", 1 } },
			{ "TRYK_H_PASGT_BLK", "", 20, { "", "", -1 } },
			{ "H_Cap_tan_specops_US", "", 20, { "", "", -1 } },
			{ "H_CrewHelmetHeli_B", "", 20, { "", "", -1 } },
			{ "H_Bandanna_camo", "Camo Bandanna", 12, { "", "", -1 } },
			{ "H_Bandanna_surfer", "Surfer Bandanna", 10, { "", "", -1 } },
			{ "H_Bandanna_gry", "Grey Bandanna", 10, { "", "", -1 } },
			{ "H_Bandanna_cbr", "", 15, { "", "", -1 } },
			{ "H_Bandanna_surfer", "", 15, { "", "", -1 } },
			{ "H_Bandanna_khk", "Khaki Bandanna", 14, { "", "", -1 } },
			{ "H_Bandanna_sgg", "Sage Bandanna", 10, { "", "", -1 } },
			{ "H_StrawHat", "Straw Fedora", 25, { "", "", -1 } },
			{ "H_BandMask_blk", "Hat & Bandanna", 30, { "", "", -1 } },
			{ "H_Booniehat_tan", "", 42, { "", "", -1 } },
			{ "H_Hat_blue", "", 30, { "", "", -1 } },
			{ "H_Hat_brown", "", 26, { "", "", -1 } },
			{ "H_Hat_checker", "", 30, { "", "", -1 } },
			{ "H_Hat_grey", "", 20, { "", "", -1 } },
			{ "H_Hat_tan", "", 26, { "", "", -1 } },
			{ "H_Cap_blu", "", 15, { "", "", -1 } },
			{ "H_Cap_grn", "", 15, { "", "", -1 } },
			{ "H_Cap_grn_BI", "", 15, { "", "", -1 } },
			{ "H_Cap_oli", "", 15, { "", "", -1 } },
			{ "H_Cap_brn_SPECOPS", "", 25, { "", "", -1 } },
			{ "H_Cap_khaki_specops_UK", "", 25, { "", "", -1 } },
			{ "H_Cap_tan", "", 20, { "", "", -1 } },
			{ "H_Cap_red", "", 25, { "", "", -1 } }
		};

		goggles[] = {
			{ "NONE", "Remove Glasses", 0, { "", "", -1 } },
			{ "T_HoodACUBLK", "", 25, { "", "", -1 } },
			{ "G_Shades_Black", "", 25, { "", "", -1 } },
			{ "G_Shades_Blue", "", 20, { "", "", -1 } },
			{ "G_Sport_Blackred", "", 20, { "", "", -1 } },
			{ "G_Sport_Checkered", "", 20, { "", "", -1 } },
			{ "G_Sport_Blackyellow", "", 20, { "", "", -1 } },
			{ "G_Sport_BlackWhite", "", 20, { "", "", -1 } },
			{ "G_Squares", "", 10, { "", "", -1 } },
			{ "G_Aviator", "", 10, { "", "", -1 } },
			{ "G_Lady_Mirror", "", 15, { "", "", -1 } },
			{ "G_Lady_Dark", "", 10, { "", "", -1 } },
			{ "G_Lady_Blue", "", 10, { "", "", -1 } },
			{ "G_Lowprofile", "", 30, { "", "", -1 } },
			{ "G_Spectacles", "", 30, { "", "", -1 } },
			{ "G_Combat", "", 55, { "", "", -1 } },
			{ "G_Bandanna_beast ", "", 20, { "", "", -1 } },
			{ "G_Bandanna_aviator ", "", 25, { "", "", -1 } },
			{ "G_Bandanna_blk ", "", 20, { "", "", -1 } },
			{ "G_Bandanna_beast ", "", 20, { "", "", -1 } }
		};

		vests[] = {
			{ "V_PlateCarrier2_rgr", "", 50, { "life_coplevel", "SCALAR", 1 } },
			{ "sab_UN_Vest", "", 50, { "life_coplevel", "SCALAR", 1 } },
			{ "sab_UN_hVest", "", 50, { "life_coplevel", "SCALAR", 1 } },
			{ "sab_UN_mVest", "", 50, { "life_coplevel", "SCALAR", 1 } },
			{ "sab_UN_tVest", "", 50, { "life_coplevel", "SCALAR", 1 } },
			{ "V_PlateCarrierGL_rgr", "", 50, { "life_coplevel", "SCALAR", 1 } },
			{ "V_PlateCarrierGL_blk", "", 50, { "life_coplevel", "SCALAR", 1 } },
			{ "V_PlateCarrierGL_mtp", "Demo Vest", 50, { "life_coplevel", "SCALAR", 1 } },
			{ "V_TacVest_oli", "", 50, { "life_coplevel", "SCALAR", 1 } },
			{ "V_TacVest_brn", "", 50, { "life_coplevel", "SCALAR", 1 } }
		};

		backpacks[] = {
			{ "EG_InvisBagMain", "InvisBackpack", 80, { "", "", -1 } },
			{ "AM_PoliceBelt", "Belt with Radio", 80, { "", "", -1 } },
			{ "B_Kitbag_cbr", "", 80, { "", "", -1 } },
			{ "rhsusf_assault_eagleaiii_ocp", "", 80, { "", "", -1 } },
			{ "B_AssaultPack_Kerry", "", 80, { "", "", -1 } },
			{ "B_Kitbag_cbr", "", 80, { "", "", -1 } },
			{ "B_FieldPack_cbr", "", 50, { "", "", -1 } },
			{ "B_AssaultPack_cbr", "", 70, { "", "", -1 } },
			{ "B_Bergen_sgg", "", 90, { "", "", -1 } },
			{ "B_Carryall_cbr", "", 90, { "", "", -1 } },
			{ "B_Carryall_mcamo", "", 90, { "", "", -1 } },
			{ "tf_rt1523g_big_rhs", "", 90, { "", "", -1 } },
			{ "B_Parachute", "", 90, { "", "", -1 } },
			{ "TRYK_B_Belt_BLK", "", 90, { "", "", -1 } },
			{ "B_UAV_01_backpack_F", "", 90, { "", "", -1 } },
			{ "TRYK_B_BELT_BLK", "", 90, { "", "", -1 } },
			{ "B_Carryall_ocamo", "", 35, { "", "", -1 } }
		};
	};
		class tsf {
		title = "STR_Shops_C_Police";
		license = "";
		side = "cop";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "TRYK_U_B_wh_blk_Rollup_CombatUniform", "Rct/Pvt Uniform", 35, { "", "", -1 } },
			{ "TRYK_U_B_BLK_tan_Rollup_CombatUniform", "Cpl Uniform", 35, { "", "", -1 } },
			{ "Kangaro0_Tactical1", "Black Uniform (White Text)", 35, { "", "", -1 } },
			{ "Kangaro0_Tactical2", "Black Uniform (Yellow Text)", 35, { "", "", -1 } },
			{ "TRYK_U_B_BLKTAN_CombatUniform", "SGT+ Command Uni", 12, { "life_coplevel", "SCALAR", 2 } },
			{ "TRYK_U_B_3c", "SRU Desert Camo", 12, { "life_coplevel", "SCALAR", 3 } },
			{ "TRYK_U_B_TANOCP_CombatUniform", "SRU TL Uniform", 12, { "life_coplevel", "SCALAR", 3 } },
			{ "TRYK_U_B_GRTAN_CombatUniform", "SRU CQB Uniform", 12, { "life_coplevel", "SCALAR", 3 } },
			{ "Trixie_Ghillie_Uniform_03", "SRU Mark Ghillie", 12, { "life_coplevel", "SCALAR", 3 } },
			{ "U_B_FullGhillie_ard", "SRU Mark Ghillie 2", 12, { "life_coplevel", "SCALAR", 3 } }
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_Cap_usblack", "Rct/Pvt Hat", 12, { "life_coplevel", "SCALAR", 1 } },
			{ "H_Beret_blk", "Cpl Beret", 12, { "life_coplevel", "SCALAR", 2 } },
			{ "TRYK_ESS_CAP", "Cpl Hat", 12, { "life_coplevel", "SCALAR", 2 } },
			{ "Kangaro0_TacticalHelmet", "Black Helmet", 12, { "life_coplevel", "SCALAR", 3 } },
			{ "TRYK_R_CAP_BLK", "Sgt Hat", 12, { "life_coplevel", "SCALAR", 3 } },
			{ "TRYK_H_PASGT_BLK", "Riot Cap", 12, { "life_coplevel", "SCALAR", 4 } },
			{ "TRYK_H_PASGT_COYO", "SRU TL Cap", 12, { "life_coplevel", "SCALAR", 3 } },
			{ "TRYK_H_PASGT_OD", "SRU CQB Cap", 12, { "life_coplevel", "SCALAR", 3 } },
			{ "H_Booniehat_mcamo", "SRU Boonie", 12, { "life_coplevel", "SCALAR", 3 } },
			{ "TRYK_H_AOR1", "SRU Desert Helm", 12, { "life_coplevel", "SCALAR", 3 } }
		};

		goggles[] = {
			{ "NONE", "Remove Glasses", 0, { "", "", -1 } },
			{ "mgsr_eyepatch_goggles", "", 25, { "", "", -1 } },
			{ "T_HoodACUBLK", "", 25, { "", "", -1 } },
			{ "G_Shades_Black", "", 25, { "", "", -1 } },
			{ "G_Shades_Blue", "", 20, { "", "", -1 } },
			{ "G_Sport_Blackred", "", 20, { "", "", -1 } },
			{ "G_Sport_Checkered", "", 20, { "", "", -1 } },
			{ "G_Sport_Blackyellow", "", 20, { "", "", -1 } },
			{ "G_Sport_BlackWhite", "", 20, { "", "", -1 } },
			{ "G_Squares", "", 10, { "", "", -1 } },
			{ "G_Aviator", "", 100, { "", "", -1 } },
			{ "G_Lady_Mirror", "", 15, { "", "", -1 } },
			{ "G_Lady_Dark", "", 15, { "", "", -1 } },
			{ "G_Lady_Blue", "", 15, { "", "", -1 } },
			{ "G_Lowprofile", "", 30, { "", "", -1 } },
			{ "G_Spectacles", "", 30, { "", "", -1 } },
			{ "G_Combat", "", 55, { "", "", -1 } },
			{ "G_Bandanna_beast ", "", 25, { "", "", -1 } },
			{ "G_Bandanna_tan ", "", 25, { "", "", -1 } },
			{ "G_Bandanna_blk ", "", 25, { "", "", -1 } },
			{ "G_Bandanna_beast ", "", 25, { "", "", -1 } }
		};

		vests[] = {
			{ "TRYK_V_Bulletproof", "Media Vest", 50, { "life_coplevel", "SCALAR", 1 } },
			{ "Kangaro0_Vest1", "Black Vest", 50, { "life_coplevel", "SCALAR", 1 } },
			{ "Kangaro0_Vest2", "Blue Vest", 50, { "life_coplevel", "SCALAR", 1 } },
			{ "TRYK_V_tacv1LP_BK", "Recruit Vest", 50, { "life_coplevel", "SCALAR", 1 } },
			{ "TRYK_V_ArmorVest_Delta", "Pvt Vest", 50, { "life_coplevel", "SCALAR", 1 } },
			{ "TRYK_V_ArmorVest_Delta2", "Corp Vest", 50, { "life_coplevel", "SCALAR", 2 } },
			{ "TRYK_V_ArmorVest_Delta_W", "Corpral Vest (White)", 50, { "life_coplevel", "SCALAR", 2 } },
			{ "TRYK_V_ArmorVest_Delta_Y", "Corpral Vest (Yellow)", 50, { "life_coplevel", "SCALAR", 2 } },
			{ "Specter_RAV_BLK", "Sgt Vest", 50, { "life_coplevel", "SCALAR", 2 } },
			{ "TRYK_V_PlateCarrier_blk", "Lt+ Vest", 50, { "life_coplevel", "SCALAR", 3 } },
			{ "Kangaro0_TSFChief1", "Chief Vest	Holster 1", 50, { "life_coplevel", "SCALAR", 5 } },
			{ "Kangaro0_TSFChief1a", "Chief Vest No Holster 1", 50, { "life_coplevel", "SCALAR", 5 } },
			{ "Kangaro0_TSFChief2", "Chief Vest Holster 2", 50, { "life_coplevel", "SCALAR", 5 } },
			{ "Kangaro0_TSFChief2a", "Chief Vest No Holster 2", 50, { "life_coplevel", "SCALAR", 5 } },
			{ "TRYK_V_ArmorVest_coyo", "SRU TL Plate", 50, { "life_coplevel", "SCALAR", 3 } },
			{ "TRYK_V_ArmorVest_Ranger", "SRU CQB Plate", 50, { "life_coplevel", "SCALAR", 3 } },
			{ "TRYK_V_ArmorVest_AOR1_2", "SRU Desert Plate", 50, { "life_coplevel", "SCALAR", 3 } },
			{ "V_PlateCarrierGL_mtp", "SRU HeavyOPS Vest", 50, { "life_coplevel", "SCALAR", 3 } }
		};

		backpacks[] = {
			{ "AM_PoliceBelt", "Duty Belt With LR Radio", 30, { "", "", -1 } },
			{ "EG_InvisBagMain", "InvisBackpack", 20, { "", "", -1 } },
			{ "tf_rt1523g_big_rhs ", "", 80, { "", "", -1 } },
			{ "B_Parachute", "", 90, { "", "", -1 } },
			{ "B_Carryall_ocamo", "", 35, { "", "", -1 } },
			{ "TRYK_B_Kitbag_Base_JSDF", "SRU Backpack", 20, { "", "", -1 } },
			{ "TRYK_B_Coyotebackpack", "SRU Desert Backpack", 20, { "", "", -1 } }
		};
	};

	class dive {
		title = "STR_Shops_C_Diving";
		license = "dive";
		side = "civ";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_B_Wetsuit", "", 200, { "", "", -1 } }
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } }
		};

		goggles[] = {
			{ "NONE", "Remove Glasses", 0, { "", "", -1 } },
			{ "G_Diving", "", 50, { "", "", -1 } }
		};

		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } },
			{ "V_RebreatherB", "Why would i need this?", 500, { "", "", -1 } }
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
			{ "U_Afghan01", "", 500, {"", "", -1} },
			{ "U_Afghan01NH", "", 750, { "", "", -1 } },
			{ "U_Afghan02", "", 1150, { "", "", -1 } },
			{ "U_Afghan02NH", "", 1150, { "", "", -1 } },
			{ "U_Afghan03", "", 1750, { "", "", -1 } },
			{ "U_Afghan03NH", "", 1560, { "", "", -1 } },
			{ "U_Afghan04", "", 1750, { "", "", -1 } },
			{ "U_Afghan05", "", 1560, { "", "", -1 } },
			{ "U_Afghan06", "", 1560, { "", "", -1 } },
			{ "U_Afghan06NH", "", 1560, { "", "", -1 } },
			{ "U_IG_Guerilla1_1", "", 500, {"", "", -1} },
			{ "U_I_G_Story_Protagonist_F", "", 750, { "", "", -1 } },
			{ "U_I_G_resistanceLeader_F", "", 1150, { "", "", -1 } },
			{ "U_BG_Guerrilla_6_1", "", 1150, { "", "", -1 } },
			{ "U_O_SpecopsUniform_ocamo", "", 1750, { "", "", -1 } },
			{ "U_O_PilotCoveralls", "", 1560, { "", "", -1 } },
			{ "U_IG_leader", "Guerilla Leader", 1530, { "", "", -1 } },
			{ "U_O_GhillieSuit", "", 5000, { "", "", -1 } },
			{ "U_I_FullGhillie_ard", "", 5000, { "", "", -1 } },
			{ "U_I_Wetsuit", "", 1000, { "", "", -1 } },
			{ "U_O_Wetsuit", "", 1000, { "", "", -1 } },
			
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "Afghan_01Hat", "", 85, { "", "", -1 } },
			{ "Afghan_02Hat", "", 55, { "", "", -1 } },
			{ "Afghan_03Hat", "", 85, { "", "", -1 } },
			{ "Afghan_04Hat", "", 55, { "", "", -1 } },
			{ "Afghan_05Hat", "", 85, { "", "", -1 } },
			{ "Afghan_06Hat", "", 55, { "", "", -1 } },
			{ "mgsr_eyepatch", "", 55, { "", "", -1 } },
			{ "H_Shemag_olive", "", 85, { "", "", -1 } },
			{ "H_ShemagOpen_khk", "", 20, { "", "", -1 } },
			{ "H_ShemagOpen_tan", "", 20, { "", "", -1 } },
			{ "H_HelmetO_ocamo", "", 250, { "", "", -1 } },
			{ "H_MilCap_oucamo", "", 120, { "", "", -1 } },
			{ "H_Bandanna_camo", "", 65, { "", "", -1 } }
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
			{ "PU_shemagh_OD", "", 30, { "", "", -1 } },
			{ "PU_shemagh_Tan", "", 30, { "", "", -1 } },
			{ "PU_shemagh_GryBLK", "", 30, { "", "", -1 } },
			{ "PU_shemagh_ODBLK", "", 30, { "", "", -1 } },
			{ "PU_shemagh_TanBLK", "", 30, { "", "", -1 } },
			{ "G_Balaclava_oli", "", 30, { "", "", -1 } },
			{ "G_Bandanna_beast", "", 30, { "", "", -1 } },
			{ "G_Bandanna_blk", "", 30, { "", "", -1 } },
			{ "G_Bandanna_khk", "", 30, { "", "", -1 } },
			{ "G_Bandanna_oli", "", 30, { "", "", -1 } },
			{ "G_Bandanna_tan", "", 30, { "", "", -1 } },
			{ "SFG_Tac_smallBeardB", "", 30, { "", "", -1 } },
			{ "SFG_Tac_smallBeardD", "", 30, { "", "", -1 } },
			{ "SFG_Tac_smallBeardG", "", 30, { "", "", -1 } },
			{ "SFG_Tac_smallBeardO", "", 30, { "", "", -1 } },
			{ "SFG_Tac_chinlessbD", "", 30, { "", "", -1 } },
			{ "SFG_Tac_chinlessbO", "", 30, { "", "", -1 } },
			{ "SFG_Tac_ChopsD", "", 30, { "", "", -1 } },
			{ "SFG_Tac_ChopsO", "", 30, { "", "", -1 } },
			{ "G_Combat", "", 55, { "", "", -1 } }
		};

		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } },
			{ "V_BandollierB_blk", "Black Bandollier", 900, { "", "", -1 } },
			{ "V_BandollierB_cbr", "", 900, { "", "", -1 } },
			{ "V_BandollierB_khk", "Khaki Bandollier", 900, { "", "", -1 } },
			{ "V_BandollierB_oli", "", 900, { "", "", -1 } },
			{ "V_BandollierB_rgr", "", 900, { "", "", -1 } },
			{ "V_HarnessO_brn", "", 900, { "", "", -1 } },
			{ "V_HarnessO_gry", "", 900, { "", "", -1 } },
			{ "TRYK_V_ChestRig_L", "", 900, { "", "", -1 } },
			{ "v_tacvest_blk", "Black Tacvest", 900, { "", "", -1 } },
			{ "v_tacvest_brn", "Brown Tacvest", 900, { "", "", -1 } },
			{ "v_tacvest_camo", "Camo Tacvest", 900, { "", "", -1 } },
			{ "v_tacvest_khk", "Khaki Tacvest", 900, { "", "", -1 } },
			{ "v_tacvest_oli", "Olive Tacvest", 900, { "", "", -1 } }
		};

		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "", "", -1 } },
			{"B_AssaultPack_cbr", "", 250, { "", "", -1 }},
			{ "B_Kitbag_mcamo", "", 450, { "", "", -1 } },
			{ "B_TacticalPack_oli", "", 350, { "", "", -1 } },
			{ "B_FieldPack_ocamo", "", 300, { "", "", -1 } },
			{ "B_Bergen_sgg", "", 450, { "", "", -1 } },
			{ "B_Kitbag_cbr", "", 450, { "", "", -1 } },
			{ "B_Carryall_oli", "", 500, { "", "", -1 } },
			{ "B_Carryall_khk", "", 500, { "", "", -1 } }
		};
	};

	class kart {
		title = "STR_Shops_C_Kart";
		license = "";
		side = "civ";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_C_Driver_1_black", "", 150, { "", "", -1 } },
			{ "U_C_Driver_1_blue", "", 150, { "", "", -1 } },
			{ "U_C_Driver_1_red", "", 150, { "", "", -1 } },
			{ "U_C_Driver_1_orange", "", 150, { "", "", -1 } },
			{ "U_C_Driver_1_green", "", 150, { "", "", -1 } },
			{ "U_C_Driver_1_white", "", 150, { "", "", -1 } },
			{ "U_C_Driver_1_yellow", "", 150, { "", "", -1 } },
			{ "U_C_Driver_2", "", 350, { "", "", -1 } },
			{ "U_C_Driver_1", "", 360, { "", "", -1 } },
			{ "U_C_Driver_3", "", 370, { "", "", -1 } },
			{ "U_C_Driver_4", "", 370, { "", "", -1 } }
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_RacingHelmet_1_black_F", "", 100, { "", "", -1 } },
			{ "H_RacingHelmet_1_red_F", "", 100, { "", "", -1 } },
			{ "H_RacingHelmet_1_white_F", "", 100, { "", "", -1 } },
			{ "H_RacingHelmet_1_blue_F", "", 100, { "", "", -1 } },
			{ "H_RacingHelmet_1_yellow_F", "", 100, { "", "", -1 } },
			{ "H_RacingHelmet_1_green_F", "", 100, { "", "", -1 } },
			{ "H_RacingHelmet_1_F", "", 250, { "", "", -1 } },
			{ "H_RacingHelmet_2_F", "", 250, { "", "", -1 } },
			{ "H_RacingHelmet_3_F", "", 250, { "", "", -1 } },
			{ "H_RacingHelmet_4_F", "", 250, { "", "", -1 } }
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