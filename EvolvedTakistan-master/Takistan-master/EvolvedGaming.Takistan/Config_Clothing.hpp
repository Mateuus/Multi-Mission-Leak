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
			{ "U_C_Poloshirt_blue", "Poloshirt Blue", 250, { "", "", -1 } },
			{ "U_C_Poloshirt_burgundy", "Poloshirt Burgundy", 275, { "", "", -1 } },
			{ "U_C_Poloshirt_redwhite", "Poloshirt Red/White", 150, { "", "", -1 } },
			{ "U_C_Poloshirt_salmon", "Poloshirt Salmon", 175, { "", "", -1 } },
			{ "U_C_Poloshirt_stripped", "Poloshirt stripped", 125, { "", "", -1 } },
			{ "U_C_Poloshirt_tricolour", "Poloshirt Tricolor", 350, { "", "", -1 } },
			{ "U_C_Poor_2", "Rag tagged clothes", 250, { "", "", -1 } },
			{ "U_IG_Guerilla2_2", "Green stripped shirt & Pants", 650, { "", "", -1 } },
			{ "U_IG_Guerilla3_1", "Brown Jacket & Pants", 735, { "", "", -1 } },
			{ "U_IG_Guerilla2_3", "The Outback Rangler", 1200, { "", "", -1 } },
			{ "U_C_HunterBody_grn", "The Hunters Look", 1500, { "", "", -1 } },
			{ "U_C_WorkerCoveralls", "Mechanic Coveralls", 2500, { "", "", -1 } },
			{ "U_OrestesBody", "Surfing On Land", 1100, { "", "", -1 } },
			{ "TRYK_U_B_C02_Tsirt", "", 1100, { "", "", -1 } },
			{ "U_NikosAgedBody", "Casual Wears", 5000, { "", "", -1 } },
			{ "MEC_dishda_black", "", 1000, { "", "", -1 } },
			{ "MEC_dishda_jacket", "", 1000, { "", "", -1 } },
			{ "MEC_dishda_blk_jacket", "", 1000, { "", "", -1 } },
			{ "MEC_dishda_des_jacket", "", 1000, { "", "", -1 } },
			{ "MEC_dishda_des2_jacket", "", 1000, { "", "", -1 } },
			{ "MEC_dishda_wood_jacket", "", 1000, { "", "", -1 } },
			{ "MEC_dishdaw_des_jacket", "", 1000, { "", "", -1 } },
			{ "MEC_dishdaw_des2_jacket", "", 1000, { "", "", -1 } },
			{ "MEC_dishdaw_wood_jacket", "", 1000, { "", "", -1 } },
			{ "MEC_dishda_vest", "", 1000, { "", "", -1 } },
			{ "MEC_dishda_vestA", "", 1000, { "", "", -1 } },
			{ "MEC_dishda_vestB", "", 1000, { "", "", -1 } },
			{ "MEC_dishda_vestC", "", 1000, { "", "", -1 } },
			{ "MEC_dishda_vestD", "", 1000, { "", "", -1 } },
			{ "rhs_uniform_msv_emr", "", 1000, { "", "", -1 } },
			{ "MEC_dishda_vestD", "", 1000, { "", "", -1 } },
			{ "MEC_dishda_vestE", "", 1000, { "", "", -1 } }
			
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
			{ "H_Cap_brn_SPECOPS", "", 250, { "", "", -1 } },
			{ "H_Cap_khaki_specops_UK", "", 250, { "", "", -1 } },
			{ "H_Cap_oli", "", 250, { "", "", -1 } },
			{ "H_Cap_tan", "", 250, { "", "", -1 } },
			{ "H_Cap_red", "", 250, { "", "", -1 } },
			{ "H_Cap_tan_specops_US", "", 250, { "", "", -1 } },
			{ "H_Bandanna_camo", "", 250, { "", "", -1 } },
			{ "H_Bandanna_cbr", "", 250, { "", "", -1 } },
			{ "H_Bandanna_gry", "", 250, { "", "", -1 } },
			{ "H_Bandanna_khk", "", 250, { "", "", -1 } },
			{ "H_Bandanna_mcamo", "", 250, { "", "", -1 } },
			{ "H_Bandanna_sgg", "", 250, { "", "", -1 } },
			{ "H_Bandanna_surfer", "", 250, { "", "", -1 } },
			{ "H_Cap_blk", "", 250, { "", "", -1 } },
			{ "H_Cap_grn", "", 250, { "", "", -1 } },
			{ "H_Cap_blu", "", 250, { "", "", -1 } }
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
			{ "rhs_uniform_cu_ocp", "", 350, { "life_coplevel", "SCALAR", 1 } },
			{ "U_B_FullGhillie_ard", "", 5000, { "life_coplevel", "SCALAR", 1 } },
			{ "TRYK_U_B_3c", "", 350, { "life_coplevel", "SCALAR", 1 } },
			{ "rhs_uniform_m88_patchless", "", 350, { "life_coplevel", "SCALAR", 1 } },
			{ "U_B_HeliPilotCoveralls", "", 250, { "", "", -1 } },
			{ "U_bombsuit", "", 250, { "", "", -1 } },
			{ "TRYK_U_B_MARPAT_Wood_Tshirt", "", 250, { "", "", -1 } },
			{ "Trixie_Ghillie_Uniform_03", "", 250, { "", "", -1 } },
			{"Trixie_Ghillie_Uniform_03", "", 250, { "", "", -1 } }

		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "rhsusf_ach_helmet_ocp", "", 120, { "life_coplevel", "SCALAR", 1 } },
			{ "rhsusf_ach_helmet_ESS_ocp", "", 120, { "life_coplevel", "SCALAR", 1 } },
			{ "rhsusf_ach_helmet_headset_ocp", "", 120, { "life_coplevel", "SCALAR", 1 } },
			{ "rhsusf_ach_helmet_headset_ess_ocp", "", 120, { "life_coplevel", "SCALAR", 1 } },
			{ "H_Cap_usblack", "", 120, { "life_coplevel", "SCALAR", 1 } },
			{ "H_PilotHelmetHeli_B", "", 120, { "life_coplevel", "SCALAR", 1 } },
			{ "rhs_Booniehat_ocp", "", 120, { "life_coplevel", "SCALAR", 1 } },
			{ "rhsusf_ach_helmet_camo_ocp", "", 120, { "life_coplevel", "SCALAR", 1 } },
			{ "H_Booniehat_mcamo", "", 120, { "life_coplevel", "SCALAR", 1 } },
			{ "H_Beret_Colonel", "", 120, { "life_coplevel", "SCALAR", 1 } },
			{ "H_Beret_02", "", 120, { "life_coplevel", "SCALAR", 1 } },
			{ "H_MilCap_gry", "", 120, { "life_coplevel", "SCALAR", 1 } },
			{ "TRYK_H_Helmet_3C", "", 120, { "life_coplevel", "SCALAR", 1 } },
			{ "H_Cap_usblack", "", 25, { "life_coplevel", "SCALAR", 1 } },
			{ "H_Bombsuit_Helmet", "", 250, { "", "", -1 } },
			{ "rhs_Booniehat_ocp", "", 250, { "", "", -1 } },
			{ "rhs_Booniehat_marpatwd", "", 250, { "", "", -1 } },
			{ "TRYK_H_PASGT_BLK", "", 250, { "", "", -1 } },
			{ "H_Cap_tan_specops_US", "", 250, { "", "", -1 } },
			{ "H_CrewHelmetHeli_B", "", 250, { "", "", -1 } },
			{ "H_PilotHelmetHeli_B", "", 250, { "", "", -1 } },
			{ "RHS_jetpilot_usaf", "", 250, { "", "", -1 } },
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
			{ "H_Cap_brn_SPECOPS", "", 250, { "", "", -1 } },
			{ "H_Cap_khaki_specops_UK", "", 250, { "", "", -1 } },
			{ "H_Cap_oli", "", 250, { "", "", -1 } },
			{ "H_Cap_tan", "", 250, { "", "", -1 } },
			{ "H_Cap_red", "", 250, { "", "", -1 } },
			{ "H_Cap_tan_specops_US", "", 250, { "", "", -1 } },
			{ "H_Bandanna_camo", "", 250, { "", "", -1 } },
			{ "H_Bandanna_cbr", "", 250, { "", "", -1 } },
			{ "H_Bandanna_gry", "", 250, { "", "", -1 } },
			{ "H_Bandanna_khk", "", 250, { "", "", -1 } },
			{ "H_Bandanna_mcamo", "", 250, { "", "", -1 } },
			{ "H_Bandanna_sgg", "", 250, { "", "", -1 } },
			{ "H_Bandanna_surfer", "", 250, { "", "", -1 } },
			{ "H_Cap_blk", "", 250, { "", "", -1 } },
			{ "H_Cap_grn", "", 250, { "", "", -1 } },
		};

		goggles[] = {
			{ "NONE", "Remove Glasses", 0, { "", "", -1 } },
			{ "rhs_googles_black", "", 25, { "", "", -1 } },
			{ "rhs_googles_yellow", "", 25, { "", "", -1 } },
			{ "rhs_googles_clear", "", 25, { "", "", -1 } },
			{ "rhs_googles_orange", "", 25, { "", "", -1 } },
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
			{ "G_Lady_Mirror", "", 150, { "", "", -1 } },
			{ "G_Lady_Dark", "", 150, { "", "", -1 } },
			{ "G_Lady_Blue", "", 150, { "", "", -1 } },
			{ "G_Lowprofile", "", 30, { "", "", -1 } },
			{ "G_Spectacles", "", 30, { "", "", -1 } },
			{ "G_Combat", "", 55, { "", "", -1 } },
			{ "G_Bandanna_beast ", "", 250, { "", "", -1 } },
			{ "G_Bandanna_aviator ", "", 250, { "", "", -1 } },
			{ "G_Bandanna_blk ", "", 250, { "", "", -1 } },
			{ "G_Bandanna_beast ", "", 250, { "", "", -1 } }
		};

		vests[] = {
			{ "V_PlateCarrier2_rgr", "", 1500, { "life_coplevel", "SCALAR", 1 } },
			{ "rhsusf_iotv_ocp_Grenadier", "", 1500, { "life_coplevel", "SCALAR", 1 } },
			{ "rhsusf_iotv_ocp_Medic", "", 1500, { "life_coplevel", "SCALAR", 1 } },
			{ "rhsusf_iotv_ocp_Rifleman", "", 1500, { "life_coplevel", "SCALAR", 1 } },
			{ "rhsusf_iotv_ocp_SAW", "", 1500, { "life_coplevel", "SCALAR", 1 } },
			{ "rhsusf_iotv_ocp_Squadleader", "", 1500, { "life_coplevel", "SCALAR", 1 } },
			{ "rhsusf_iotv_ocp_Teamleader", "", 1500, { "life_coplevel", "SCALAR", 1 } },
			{ "V_PlateCarrierGL_rgr", "", 1500, { "life_coplevel", "SCALAR", 1 } },
			{ "V_PlateCarrierGL_mtp", "Demo Vest", 1500, { "life_coplevel", "SCALAR", 1 } },
			{ "V_TacVest_oli", "", 250, { "life_coplevel", "SCALAR", 1 } },
			{ "V_TacVest_brn", "", 250, { "life_coplevel", "SCALAR", 1 } }
		};

		backpacks[] = {
			{ "EG_InvisBagMain", "InvisBackpack", 800, { "", "", -1 } },
			{ "B_Kitbag_cbr", "", 800, { "", "", -1 } },
			{ "rhsusf_assault_eagleaiii_ocp", "", 800, { "", "", -1 } },
			{ "B_AssaultPack_Kerry", "", 800, { "", "", -1 } },
			{ "B_Kitbag_cbr", "", 800, { "", "", -1 } },
			{ "B_FieldPack_cbr", "", 500, { "", "", -1 } },
			{ "B_AssaultPack_cbr", "", 700, { "", "", -1 } },
			{ "B_Bergen_sgg", "", 2500, { "", "", -1 } },
			{ "B_Carryall_cbr", "", 3500, { "", "", -1 } },
			{ "B_Carryall_mcamo ", "", 250, { "", "", -1 } },
			{ "tf_rt1523g_big_rhs ", "", 250, { "", "", -1 } },
			{ "B_Parachute ", "", 250, { "", "", -1 } },
			{ "TRYK_B_Belt_BLK  ", "", 250, { "", "", -1 } },
			{ "B_UAV_01_backpack_F", "", 350, { "", "", -1 } },
			{ "TRYK_B_BELT_BLK", "", 3500, { "", "", -1 } },
			{ "B_Carryall_ocamo", "", 35, { "", "", -1 } }
		};
	};
		class tsf {
		title = "STR_Shops_C_Police";
		license = "";
		side = "cop";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "TRYK_U_B_PCUGs_BLK", "", 350, { "", "", -1 } },
			{ "TRYK_U_B_ACUTshirt", "", 350, { "", "", -1 } },
			{ "TRYK_U_B_3c", "", 350, { "Undercover 1", "", -1 } },
			{ "MEC_dishda_vest", "", 350, { "Undercover 2", "", -1 } },
			{ "U_Marshal", "", 350, { "", "", -1 } },
			{ "MEC_dishda_blk_jacket", "", 350, { "", "", -1 } }
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_Cap_police", "", 120, { "life_coplevel", "SCALAR", 1 } },
			{ "H_Watchcap_cbr", "", 250, { "", "", -1 } },
			{ "H_Watchcap_camo", "", 250, { "", "", -1 } },
			{ "H_Watchcap_khk", "", 250, { "", "", -1 } },
			{ "TRYK_H_TACEARMUFF_H", "", 250, { "", "", -1 } },
			{ "rhs_fieldcap_helm_digi", "", 250, { "", "", -1 } },
			{ "rhsusf_patrolcap_ocp", "", 250, { "", "", -1 } }
		};

		goggles[] = {
			{ "NONE", "Remove Glasses", 0, { "", "", -1 } },
			{ "rhs_googles_black", "", 25, { "", "", -1 } },
			{ "rhs_googles_yellow", "", 25, { "", "", -1 } },
			{ "rhs_googles_clear", "", 25, { "", "", -1 } },
			{ "rhs_googles_orange", "", 25, { "", "", -1 } },
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
			{ "G_Lady_Mirror", "", 150, { "", "", -1 } },
			{ "G_Lady_Dark", "", 150, { "", "", -1 } },
			{ "G_Lady_Blue", "", 150, { "", "", -1 } },
			{ "G_Lowprofile", "", 30, { "", "", -1 } },
			{ "G_Spectacles", "", 30, { "", "", -1 } },
			{ "G_Combat", "", 55, { "", "", -1 } },
			{ "G_Bandanna_beast ", "", 250, { "", "", -1 } },
			{ "G_Bandanna_aviator ", "", 250, { "", "", -1 } },
			{ "G_Bandanna_blk ", "", 250, { "", "", -1 } },
			{ "G_Bandanna_beast ", "", 250, { "", "", -1 } }
		};

		vests[] = {
			{ "V_TacVest_blk_POLICE", "", 1500, { "life_coplevel", "SCALAR", 1 } },
			{ "TRYK_V_tacv1LP_BK", "", 1500, { "life_coplevel", "SCALAR", 1 } },
			{ "TRYK_V_tacv1_P_BK", "", 1500, { "life_coplevel", "SCALAR", 1 } },
			{ "TRYK_V_Bulletproof", "", 1500, { "life_coplevel", "SCALAR", 1 } }
		};

		backpacks[] = {
			{ "EG_InvisBagMain", "InvisBackpack", 800, { "", "", -1 } },
			{ "B_Kitbag_cbr", "", 800, { "", "", -1 } },
			{ "rhsusf_assault_eagleaiii_ocp", "", 800, { "", "", -1 } },
			{ "B_AssaultPack_Kerry", "", 800, { "", "", -1 } },
			{ "B_Kitbag_cbr", "", 800, { "", "", -1 } },
			{ "B_FieldPack_cbr", "", 500, { "", "", -1 } },
			{ "B_AssaultPack_cbr", "", 700, { "", "", -1 } },
			{ "B_Bergen_sgg", "", 2500, { "", "", -1 } },
			{ "B_Carryall_cbr", "", 3500, { "", "", -1 } },
			{ "B_Carryall_mcamo ", "", 250, { "", "", -1 } },
			{ "tf_rt1523g_big_rhs ", "", 250, { "", "", -1 } },
			{ "B_Parachute ", "", 250, { "", "", -1 } },
			{ "TRYK_B_Belt_BLK  ", "", 250, { "", "", -1 } },
			{ "B_UAV_01_backpack_F", "", 350, { "", "", -1 } },
			{ "TRYK_B_BELT_BLK", "", 3500, { "", "", -1 } },
			{ "B_Carryall_ocamo", "", 35, { "", "", -1 } }
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

	class reb {
		title = "STR_Shops_C_Rebel";
		license = "rebel";
		side = "civ";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_IG_Guerilla1_1", "", 5000, {"", "", -1} },
			{ "U_I_G_Story_Protagonist_F", "", 7500, { "", "", -1 } },
			{ "U_I_G_resistanceLeader_F", "", 11500, { "", "", -1 } },
			{ "U_BG_Guerrilla_6_1", "", 11500, { "", "", -1 } },
			{ "rhs_uniform_mflora_patchless", "", 11500, { "", "", -1 } },
			{ "MEC_SAA_BDU", "", 11500, { "", "", -1 } },
			{ "MEC_SAA_BDU2", "", 11500, { "", "", -1 } },
			{ "U_O_SpecopsUniform_ocamo", "", 17500, { "", "", -1 } },
			{ "U_O_PilotCoveralls", "", 15610, { "", "", -1 } },
			{ "U_IG_leader", "Guerilla Leader", 15340, { "", "", -1 } },
			{ "U_O_GhillieSuit", "", 50000, { "", "", -1 } },
			{ "MEC_dishda_black", "", 1000, { "", "", -1 } },
			{ "MEC_dishda_jacket", "", 1000, { "", "", -1 } },
			{ "MEC_dishda_blk_jacket", "", 1000, { "", "", -1 } },
			{ "MEC_dishda_des_jacket", "", 1000, { "", "", -1 } },
			{ "MEC_dishda_des2_jacket", "", 1000, { "", "", -1 } },
			{ "MEC_dishda_wood_jacket", "", 1000, { "", "", -1 } },
			{ "MEC_dishdaw_des_jacket", "", 1000, { "", "", -1 } },
			{ "MEC_dishdaw_des2_jacket", "", 1000, { "", "", -1 } },
			{ "MEC_dishdaw_wood_jacket", "", 1000, { "", "", -1 } },
			{ "MEC_dishda_vest", "", 1000, { "", "", -1 } },
			{ "MEC_dishda_vestA", "", 1000, { "", "", -1 } },
			{ "MEC_dishda_vestB", "", 1000, { "", "", -1 } },
			{ "MEC_dishda_vestC", "", 1000, { "", "", -1 } },
			{ "MEC_dishda_vestD", "", 1000, { "", "", -1 } },
			{ "rhs_uniform_msv_emr", "", 1000, { "", "", -1 } },
			{ "U_I_FullGhillie_ard", "", 50000, { "", "", -1 } },
			{ "U_I_Wetsuit", "", 1000, { "", "", -1 } },
			{ "U_O_Wetsuit", "", 1000, { "", "", -1 } },
			{ "MEC_dishda_vestD", "", 1000, { "", "", -1 } },
			{ "MEC_dishda_vestE", "", 1000, { "", "", -1 } }
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_ShemagOpen_tan", "", 850, { "", "", -1 } },
			{ "MEC_headband_hamas", "", 250, { "", "", -1 } },
			{ "MEC_headband_hezbollah", "", 250, { "", "", -1 } },
			{ "MEC_headband_isis", "", 250, { "", "", -1 } },
			{ "MEC_headband_islamist", "", 250, { "", "", -1 } },
			{ "MEC_pakol_black", "", 250, { "", "", -1 } },
			{ "MEC_pakol_brown", "", 250, { "", "", -1 } },
			{ "MEC_Pakol_grey", "", 850, { "", "", -1 } },
			{ "rhs_tsh4_bala", "", 250, { "", "", -1 } },
			{ "rhs_tsh4_ess_bala", "", 250, { "", "", -1 } },
			{ "mgsr_headbag", "", 550, { "", "", -1 } },
			{ "mgsr_eyepatch", "", 550, { "", "", -1 } },
			{ "H_Shemag_olive", "", 850, { "", "", -1 } },
			{ "H_ShemagOpen_khk", "", 200, { "", "", -1 } },
			{ "H_ShemagOpen_tan", "", 200, { "", "", -1 } },
			{ "H_HelmetO_ocamo", "", 2500, { "", "", -1 } },
			{ "MEC_SAA_BDU_Helmet", "", 2500, { "", "", -1 } },
			{ "H_MilCap_oucamo", "", 1200, { "", "", -1 } },
			{ "H_Bandanna_camo", "", 650, { "", "", -1 } }
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
			{ "MEC_shemag_black", "", 30, { "", "", -1 } },
			{ "MEC_shemag_bw", "", 30, { "", "", -1 } },
			{ "MEC_shemag_red", "", 30, { "", "", -1 } },
			{ "G_Balaclava_blk", "", 30, { "", "", -1 } },
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
			{ "V_TacVest_khk", "", 12500, { "", "", -1 } },
			{ "V_BandollierB_cbr", "", 4500, { "", "", -1 } },
			{ "V_HarnessO_brn", "", 7500, { "", "", -1 } },
            		{ "V_BandollierB_blk", "Black Bandollier", 9000, { "", "", -1 } },
        		{ "V_BandollierB_cbr", "", 9000, { "", "", -1 } },
        		{ "V_BandollierB_khk", "Khaki Bandollier", 9000, { "", "", -1 } },
        		{ "V_BandollierB_oli", "", 9000, { "", "", -1 } },
            		{ "V_BandollierB_rgr", "", 9000, { "", "", -1 } },
            		{ "V_HarnessO_brn", "", 9000, { "", "", -1 } },
            		{ "V_HarnessO_gry", "", 9000, { "", "", -1 } },
            		{ "v_tacvest_blk", "Black Tacvest", 9000, { "", "", -1 } },
            		{ "v_tacvest_brn", "Brown Tacvest", 9000, { "", "", -1 } },
            		{ "v_tacvest_camo", "Camo Tacvest", 9000, { "", "", -1 } },
            		{ "v_tacvest_khk", "Khaki Tacvest", 9000, { "", "", -1 } },
            		{ "v_tacvest_oli", "Olive Tacvest", 9000, { "", "", -1 } }
		};

		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "", "", -1 } },
			{"B_AssaultPack_cbr", "", 2500, { "", "", -1 }},
			{ "B_Kitbag_mcamo", "", 4500, { "", "", -1 } },
			{ "B_TacticalPack_oli", "", 3500, { "", "", -1 } },
			{ "B_FieldPack_ocamo", "", 3000, { "", "", -1 } },
			{ "B_Bergen_sgg", "", 4500, { "", "", -1 } },
			{ "B_Kitbag_cbr", "", 4500, { "", "", -1 } },
			{ "B_Carryall_oli", "", 5000, { "", "", -1 } },
			{ "B_Carryall_khk", "", 5000, { "", "", -1 } }
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
