/*
	ARRAY FORMAT:
		0: STRING (Classname)
		1: STRING (Display Name, leave as "" for default)x
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
			{ "NONE", "Uniform entfernen", 0, { "", "", -1 } },
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
			{ "U_C_Scientist","Strahlenschutzanzug", 20000, {"","",-1} },
			{ "U_NikosAgedBody", "Casual Wears", 5000, { "", "", -1 } }
		};

		headgear[] = {
			{ "NONE", "Kopfbedeckung entfernen", 0, { "", "", -1 } },
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
			{ "NONE", "Brille entfernen", 0, { "", "", -1 } },
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
			{ "NONE", "Weste entfernen", 0, { "", "", -1 } }
		};

		backpacks[] = {
			{ "NONE", "Rucksack entfernen", 0, { "", "", -1 } },
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
			{ "NONE", "Uniform entfernen", 0, { "", "", -1 } },
			{ "U_Rangemaster", "Streifen Uniform", 0, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam", "Einsatz Uniform", 0, { "life_coplevel", "SCALAR", 2 } },
			{ "U_IG_Guerilla3_2", "Pulli", 0, { "life_coplevel", "SCALAR", 4 } },
			{ "U_B_CombatUniform_mcam_worn", "Feldjägerkleidung", 0, { "life_coplevel", "SCALAR", 6 } },
			{ "U_B_CombatUniform_mcam_vest", "SEK Uniform", 0, { "license_cop_sek", "BOOL", true } },
			{ "U_IG_Guerilla1_1", "", 0, { "license_cop_kripo", "BOOL", true } },
			{ "U_I_G_Story_Protagonist_F", "", 0, { "license_cop_kripo", "BOOL", true } },
			{ "U_I_G_resistanceLeader_F", "", 0, { "license_cop_kripo", "BOOL", true } },
			{ "U_O_SpecopsUniform_ocamo", "", 0, { "license_cop_kripo", "BOOL", true } },
			{ "U_IG_leader", "", 0, { "license_cop_kripo", "BOOL", true } },
			{ "U_B_PilotCoveralls", "", 0, { "license_cop_kripo", "BOOL", true } },
			{ "U_IG_Guerilla3_2", "Undercover 1", 0, { "license_cop_kripo", "BOOL", true } },
			{ "U_IG_Guerilla3_1", "Undercover 2", 0, { "license_cop_kripo", "BOOL", true } },
			{ "U_O_CombatUniform_oucamo", "Undercover 3", 0, { "license_cop_kripo", "BOOL", true } },
			{ "U_O_PilotCoveralls",  "Undercover 4", 0, { "license_cop_kripo", "BOOL", true } },
			{ "U_IG_Guerilla2_3", "Undercover 5", 0, { "license_cop_kripo", "BOOL", true } },
			{ "U_I_CombatUniform_tshirt", "Undercover 6", 0,{ "license_cop_kripo", "BOOL", true } },
			{ "U_B_Wetsuit", "Taucheranzug", 0, { "life_coplevel", "SCALAR", 3 } },
			{ "U_O_Wetsuit", "Taucheranzug SEK", 0,{ "license_cop_sek", "BOOL", true } }
		};

		headgear[] = {
			{ "NONE", "Kopfbedeckung entfernen", 0, { "", "", -1 } },
			{ "H_Cap_police", "", 0, { "life_coplevel", "SCALAR", 1 } },
			{ "H_Beret_blk_POLICE", "", 0, { "life_coplevel", "SCALAR", 3 } },
			{ "H_Beret_02", "", 0, { "life_coplevel", "SCALAR", 6 } },
			{ "H_Beret_Colonel", "", 0, { "life_coplevel", "SCALAR", 7 } },
			{ "H_HelmetB_plain_mcamo", "", 0, { "life_coplevel", "SCALAR", 1 } },
			{ "H_Booniehat_mcamo", "", 0, { "life_coplevel", "SCALAR", 1 } },
			{ "H_MilCap_mcamo", "", 0, { "life_coplevel", "SCALAR", 2 } },
			{ "H_HelmetB_paint", "", 0, { "license_cop_kripo", "BOOL", true } },
			{ "H_HelmetCrew_I", "", 0, { "license_cop_kripo", "BOOL", true } },
			{ "H_HelmetSpecB",  "", 0, { "license_cop_kripo", "BOOL", true } },
			{ "H_HelmetSpecB_blk",  "", 0, { "license_cop_sek", "BOOL", true } },
			{ "H_PilotHelmetHeli_O",  "", 0, { "license_cop_kripo", "BOOL", true } },
			{ "H_Bandanna_camo",  "", 0, { "license_cop_kripo", "BOOL", true } }
		};

		goggles[] = {
			{ "NONE", "Brille entfernen", 0, { "", "", -1 } },
			{ "G_Shades_Black", "", 0, { "", "", -1 } },
			{ "G_Shades_Blue", "", 0, { "", "", -1 } },
			{ "G_Sport_Blackred", "", 0, { "", "", -1 } },
			{ "G_Sport_Checkered", "", 0, { "", "", -1 } },
			{ "G_Sport_Blackyellow", "", 0, { "", "", -1 } },
			{ "G_Sport_BlackWhite", "", 0, { "", "", -1 } },
			{ "G_Squares", "", 0, { "", "", -1 } },
			{ "G_Aviator", "", 0, { "", "", -1 } },
			{ "G_Lady_Mirror", "", 0, { "", "", -1 } },
			{ "G_Lady_Dark", "", 0, { "", "", -1 } },
			{ "G_Lady_Blue", "", 0, { "", "", -1 } },
			{ "G_Lowprofile", "", 0, { "", "", -1 } },
			{ "G_Combat", "", 0, { "", "", -1 } },
			{ "G_Diving", "", 0, { "", "", -1 } },
			{ "G_Balaclava_blk", "", 0, { "license_cop_sek", "BOOL", true } }
		};

		vests[] = {
			{ "NONE", "Weste entfernen", 0, { "", "", -1 } },
			{ "V_Rangemaster_belt", "", 0, { "", "", -1 } },
			{ "V_TacVest_blk_POLICE", "Polizeiweste", 0, { "life_coplevel", "SCALAR", 2 } },
			{ "V_TacVest_khk", "", 0, { "license_cop_kripo", "BOOL", true } },
			{ "V_BandollierB_cbr", "", 0, { "license_cop_kripo", "BOOL", true } },
			{ "V_HarnessO_brn", "", 0, { "license_cop_kripo", "BOOL", true } },
			{ "V_TacVest_khk", "Kripoweste", 0, { "license_cop_kripo", "BOOL", true } },
			{ "V_PlateCarrier1_blk", "Antigasweste", 0, { "life_coplevel", "SCALAR", 1 } },
			{ "V_RebreatherB", "", 0, { "life_coplevel", "SCALAR", 3 } },
			{ "V_RebreatherIR", "", 0,{ "license_cop_sek", "BOOL", true } }
		};

		backpacks[] = {
			{ "NONE", "Rucksack entfernen", 0, { "", "", -1 } },
			{ "B_Carryall_mcamo", "Unsichtbarer Rucksack", 0, { "", "", -1 } },
			{ "B_TacticalPack_oli","", 0, { "license_cop_kripo", "BOOL", true } },
			{ "B_Kitbag_mcamo","", 0, { "license_cop_kripo", "BOOL", true } },
			{ "B_Bergen_sgg","", 0, { "license_cop_kripo", "BOOL", true } },
			{ "B_Kitbag_cbr","", 0, { "license_cop_kripo", "BOOL", true } },
			{ "B_Carryall_oli","", 0, { "license_cop_kripo", "BOOL", true } },
			{ "B_Carryall_khk","", 0, { "license_cop_kripo", "BOOL", true } }
		};
	};

	class dive {
		title = "STR_Shops_C_Diving";
		license = "dive";
		side = "civ";

		uniforms[] = {
			{ "NONE", "Uniform entfernen", 0, { "", "", -1 } },
			{ "U_B_Wetsuit", "", 2000, { "", "", -1 } }
		};

		headgear[] = {
			{ "NONE", "Kopfbedeckung entfernen", 0, { "", "", -1 } }
		};

		goggles[] = {
			{ "NONE", "Brille entfernen", 0, { "", "", -1 } },
			{ "G_Diving", "", 500, { "", "", -1 } }
		};

		vests[] = {
			{ "NONE", "Weste entfernen", 0, { "", "", -1 } },
			{ "V_RebreatherB", "", 5000, { "", "", -1 } }
		};

		backpacks[] = {
			{ "NONE", "Rucksack entfernen", 0, { "", "", -1 } }
		};
	};

	class reb {
		title = "STR_Shops_C_Rebel";
		license = "rebel";
		side = "civ";

		uniforms[] = {
			{ "NONE", "Uniform entfernen", 0, { "", "", -1 } },
			{ "U_IG_Guerilla1_1", "", 10000, { "", "", -1 } },
			{ "U_I_G_Story_Protagonist_F", "", 12500, {"", "", -1} },
			{ "U_I_G_resistanceLeader_F", "", 15000, { "", "", -1 } },
			{ "U_O_SpecopsUniform_ocamo", "", 17500, { "", "", -1 } },
			{ "U_O_PilotCoveralls", "", 20000, { "", "", -1 } },
			{ "U_IG_leader","Guerilla Leader", 22500, { "", "", -1 } },
			{ "U_B_PilotCoveralls", "", 22500, { "", "", -1 } },
			{ "U_IG_Guerilla3_2", "", 32500, {"", "", -1} },
			{ "U_IG_Guerilla3_1", "", 42500, { "", "", -1 } },
			{ "U_O_CombatUniform_oucamo", "", 42500, { "", "", -1 } },
			{ "U_O_PilotCoveralls", "", 52500, { "", "", -1 } },
			{ "U_IG_Guerilla2_3", "", 52500, { "", "", -1 } },
			{ "U_I_CombatUniform_tshirt", "", 100000, { "", "", -1 } },
			{ "U_B_FullGhillie_ard", "", 200000, { "", "", -1 } },
			{ "U_B_FullGhillie_sard", "", 200000, { "", "", -1 } },
			{ "U_B_FullGhillie_lsh", "", 200000, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam", "Gang Uniform", 0, { "PG_donGang", "BOOL", true } }
		};

		headgear[] = {
			{ "NONE", "Kopfbedeckung entfernen", 0, { "", "", -1 } },
			{ "H_ShemagOpen_tan", "", 5000, { "", "", -1 } },
			{ "H_Shemag_olive", "", 5000, { "", "", -1 } },
			{ "H_ShemagOpen_khk", "", 5000, { "", "", -1 } },
			{ "H_HelmetO_ocamo", "", 5000, { "", "", -1 } },
			{ "H_MilCap_oucamo", "", 5000, { "", "", -1 } },
			{ "H_HelmetB_camo", "", 5000, { "", "", -1 } },
			{ "H_HelmetB_paint", "", 5000, { "", "", -1 } },
			{ "H_HelmetCrew_I", "", 5000, { "", "", -1 } },
			{ "H_HelmetSpecB", "", 5000, { "", "", -1 } },
			{ "H_PilotHelmetHeli_O", "", 5000, { "", "", -1 } },
			{ "H_Bandanna_camo", "", 5000, { "", "", -1 } }
		};

		goggles[] = {
			{ "NONE", "Brille entfernen", 0, { "", "", -1 } },
			{ "G_Squares", "", 10, { "", "", -1 } },
			{ "G_Shades_Black", "", 20, { "", "", -1 } },
			{ "G_Shades_Blue", "", 20, { "", "", -1 } },
			{ "G_Sport_Blackred", "", 20, { "", "", -1 } },
			{ "G_Sport_Checkered", "", 20, { "", "", -1 } },
			{ "G_Sport_Blackyellow", "", 20, { "", "", -1 } },
			{ "G_Sport_BlackWhite", "", 20, { "", "", -1 } },
			{ "G_Lowprofile", "", 30, { "", "", -1 } },
			{ "G_Combat", "", 55, { "", "", -1 } },
			{ "G_Balaclava_oli", "", 100, { "", "", -1 } },
			{ "G_Balaclava_blk", "", 100, { "", "", -1 } }
		};

		vests[] = {
			{ "NONE", "Weste entfernen", 0, { "", "", -1 } },
			{ "V_TacVest_khk", "", 25000, { "", "", -1 } },
			{ "V_BandollierB_cbr", "", 25000, { "", "", -1 } },
			{ "V_HarnessO_brn", "", 25000, { "", "", -1 } },
			{ "V_PlateCarrier1_blk", "Anti Gas Weste", 750000, { "", "", -1 } }
		};

		backpacks[] = {
			{ "NONE", "Rucksack entfernen", 0, { "", "", -1 } },
			{"B_AssaultPack_cbr", "", 2500, { "", "", -1 }},
			{ "B_FieldPack_ocamo", "", 3000, { "", "", -1 } },
			{ "B_TacticalPack_oli", "", 3500, { "", "", -1 } },
			{ "B_Kitbag_mcamo", "", 4500, { "", "", -1 } },
			{ "B_TacticalPack_oli", "", 3500, { "", "", -1 } },
			{ "B_Bergen_sgg", "", 4500, { "", "", -1 } },
			{ "B_Kitbag_cbr", "", 4500, { "", "", -1 } },
			{ "B_Carryall_oli", "", 5000, { "", "", -1 } },
			{ "B_Carryall_khk", "", 5000, { "", "", -1 } },
			{ "B_Carryall_oucamo", "", 5000, { "", "", -1 } }
		};
	};

	class kart {
		title = "STR_Shops_C_Kart";
		license = "";
		side = "civ";

		uniforms[] = {
			{ "NONE", "Uniform entfernen", 0, { "", "", -1 } },
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
			{ "NONE", "Kopfbedeckung entfernen", 0, { "", "", -1 } },
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
			{ "NONE", "Brille entfernen", 0, { "", "", -1 } }
		};

		vests[] = {
			{ "NONE", "Weste entfernen", 0, { "", "", -1 } }
		};

		backpacks[] = {
			{ "NONE", "Rucksack entfernen", 0, { "", "", -1 } }
		};
	};

	class donator {
		title = "STR_Shops_C_Outlet";
		license = "donator";
		side = "civ";

		uniforms[] = {
			{ "NONE", "Uniform entfernen", 0, { "", "", -1 } },
			{ "U_C_Poloshirt_blue", "Poloshirt Blue", 250, {"", "", -1} },
			{ "U_C_Poloshirt_burgundy", "Poloshirt Burgundy", 275, { "", "", -1 } },
			{ "U_C_Poloshirt_redwhite", "Poloshirt Red/White", 150, { "", "", -1 } },
			{ "U_C_Poloshirt_salmon", "Poloshirt Salmon", 175, { "", "", -1 } },
			{ "U_C_Poloshirt_stripped", "Poloshirt stripped", 125, { "", "", -1 } },
			{ "U_C_Poloshirt_tricolour", "Poloshirt Tricolor", 350, { "", "", -1 } },
			{ "U_C_Poor_2", "Rag tagged clothes", 250, { "", "", -1 } },
			{ "U_IG_Guerilla2_2", "Green stripped shirt & Pants", 650, { "", "", -1 } },
			{ "U_IG_Guerilla3_1", "Brown Jacket & Pants", 735, {"", "", -1} },
			{ "U_IG_Guerilla2_3", "The Outback Rangler", 1200, { "", "", -1 } },
			{ "U_C_HunterBody_grn", "The Hunters Look", 1500, { "", "", -1 } },
			{ "U_C_WorkerCoveralls", "Mechanic Coveralls", 2500, { "", "", -1 } },
			{ "U_OrestesBody", "Surfing On Land", 1100, { "", "", -1 } },
			{ "U_NikosAgedBody", "Casual Wears", 5000, { "", "", -1 } },
			{ "U_IG_Guerilla1_1", "", 10000, { "", "", -1 } },
			{ "U_I_G_Story_Protagonist_F", "", 12500, { "", "", -1 } },
			{ "U_I_G_resistanceLeader_F", "", 15000, {"", "", -1} },
			{ "U_O_SpecopsUniform_ocamo", "", 17500, { "", "", -1 } },
			{ "U_O_PilotCoveralls", "", 20000, { "", "", -1 } },
			{ "U_IG_leader", "Guerilla Leader", 22500, { "", "", -1 } },
			{ "U_O_GhillieSuit", "", 100000, { "", "", -1 } },
			{ "U_B_FullGhillie_ard", "", 150000, { "", "", -1 } },
			{ "U_B_FullGhillie_sard", "", 150000, { "", "", -1 } },
			{ "U_B_FullGhillie_lsh", "", 150000, { "", "", -1 } }
		};

		headgear[] = {
			{ "NONE", "Kopfbedeckung entfernen", 0, { "", "", -1 } },
			{ "H_Bandanna_camo", "Camo Bandanna", 120, { "", "", -1 } },
			{ "H_Bandanna_surfer", "Surfer Bandanna", 130, { "", "", -1 } },
			{ "H_Bandanna_gry", "Grey Bandanna", 165, { "", "", -1 } },
			{ "H_Bandanna_cbr", "", 165, { "", "", -1 } },
			{ "H_Bandanna_khk", "Khaki Bandanna", 150, { "", "", -1 } },
			{ "H_Bandanna_sgg", "Sage Bandanna", 165, { "", "", -1 } },
			{ "H_StrawHat", "Straw Fedora", 135, { "", "", -1 } },
			{ "H_BandMask_blk", "Hat & Bandanna", 145, { "", "", -1 } },
			{ "H_Booniehat_tan", "", 160, { "", "", -1 } },
			{ "H_Hat_blue", "", 225, { "", "", -1 } },
			{ "H_Hat_brown", "", 300, { "", "", -1 } },
			{ "H_Hat_checker", "", 425, { "", "", -1 } },
			{ "H_Hat_grey", "", 310, { "", "", -1 } },
			{ "H_Hat_tan", "", 276, { "", "", -1 } },
			{ "H_Cap_blu", "", 100, { "", "", -1 } },
			{ "H_Cap_grn", "", 150, { "", "", -1 } },
			{ "H_Cap_grn_BI", "", 150, { "", "", -1 } },
			{ "H_Cap_oli", "", 150, { "", "", -1 } },
			{ "H_Cap_red", "", 150, { "", "", -1 } },
			{ "H_Cap_tan", "", 150, { "", "", -1 } },
			{ "H_ShemagOpen_tan", "", 4000, { "", "", -1 } },
			{ "H_Shemag_olive", "", 4000, { "", "", -1 } },
			{ "H_ShemagOpen_khk", "", 4000, { "", "", -1 } },
			{ "H_HelmetO_ocamo", "", 4000, { "", "", -1 } },
			{ "H_MilCap_oucamo", "", 4000, { "", "", -1 } },
			{ "H_Bandanna_camo", "", 4000, { "", "", -1 } }
		};

		goggles[] = {
			{ "NONE", "Brille entfernen", 0, { "", "", -1 } },
			{ "G_Shades_Black", "", 25, { "", "", -1 } },
			{ "G_Shades_Blue", "", 20, { "", "", -1 } },
			{ "G_Sport_Blackred", "", 20, { "", "", -1 } },
			{ "G_Sport_Checkered", "", 20, { "", "", -1 } },
			{ "G_Sport_Blackyellow", "", 20, { "", "", -1 } },
			{ "G_Sport_BlackWhite", "", 20, { "", "", -1 } },
			{ "G_Squares", "", 10, { "", "", -1 } },
			{ "G_Lowprofile", "", 30, { "", "", -1 } },
			{ "G_Combat", "", 55, { "", "", -1 } }
		};

		vests[] = {
			{ "NONE", "Weste entfernen", 0, { "", "", -1 } },
			{ "V_TacVest_khk", "", 12500, { "", "", -1 } },
			{ "V_BandollierB_cbr", "", 4500, { "", "", -1 } },
			{ "V_HarnessO_brn", "", 7500, { "", "", -1 } },
			{ "V_PlateCarrier1_blk", "Anti Gas Weste", 200000, { "", "", -1 } }
		};

		backpacks[] = {
			{ "NONE", "Rucksack entfernen", 0, { "", "", -1 } },
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

	class med {
		title = "STR_Shops_C_Medic";
		license = "";
		side = "med";

		uniforms[] = {
			{ "NONE", "Uniform entfernen", 0, { "", "", -1 } },
			{ "U_Rangemaster", "Anwärter Uniform", 25, { "", "", -1 } },
			{ "U_I_HeliPilotCoveralls", "Einsatz Uniform", 25, { "life_thwlevel", "SCALAR", 2 } },
			{ "U_O_OfficerUniform_ocamo", "Präsident Uniform", 25, { "life_thwlevel", "SCALAR", 7 } },
			{ "U_I_Wetsuit", "Einsatz Uniform", 25, { "", "", -1 } },
			{ "U_IG_Guerilla1_1", "", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "U_I_G_Story_Protagonist_F", "", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "U_I_G_resistanceLeader_F", "", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "U_O_SpecopsUniform_ocamo", "", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "U_O_PilotCoveralls", "", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "U_IG_leader","Guerilla Leader", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "U_B_PilotCoveralls", "", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "U_IG_Guerilla3_2", "", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "U_IG_Guerilla3_1", "", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "U_O_CombatUniform_oucamo", "", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "U_O_PilotCoveralls", "", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "U_IG_Guerilla2_3", "", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "U_I_CombatUniform_tshirt", "", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "U_B_FullGhillie_ard", "", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "U_B_FullGhillie_sard", "", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "U_B_FullGhillie_lsh", "", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "U_C_HunterBody_grn", "The Hunters Look", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "U_C_WorkerCoveralls", "Mechanic Coveralls", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "U_OrestesBody", "Surfing On Land", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "U_C_Scientist","Strahlenschutzanzug", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "U_NikosAgedBody", "Casual Wears", 0, { "life_eventlevel", "SCALAR", 1 } }
		};

		headgear[] = {
			{ "NONE", "Kopfbedeckung entfernen", 0, { "", "", -1 } },
			{ "H_Bandanna_camo", "Camo Bandanna", 0, { "", "", -1 } },
			{ "H_Bandanna_surfer", "Surfer Bandanna", 0, { "", "", -1 } },
			{ "H_Bandanna_gry", "Grey Bandanna", 0, { "", "", -1 } },
			{ "H_Bandanna_cbr", "", 0, { "", "", -1 } },
			{ "H_Bandanna_khk", "Khaki Bandanna", 0, { "", "", -1 } },
			{ "H_Bandanna_sgg", "Sage Bandanna", 0, { "", "", -1 } },
			{ "H_StrawHat", "Straw Fedora", 0, { "", "", -1 } },
			{ "H_BandMask_blk", "Hat & Bandanna", 0, { "", "", -1 } },
			{ "H_Booniehat_tan", "", 0, { "", "", -1 } },
			{ "H_Hat_blue", "", 0, { "", "", -1 } },
			{ "H_Hat_brown", "", 0, { "", "", -1 } },
			{ "H_Hat_checker", "", 0, { "", "", -1 } },
			{ "H_Hat_grey", "", 0, { "", "", -1 } },
			{ "H_Hat_tan", "", 0, { "", "", -1 } },
			{ "H_Cap_blu", "", 0, { "", "", -1 } },
			{ "H_Cap_grn", "", 0, { "", "", -1 } },
			{ "H_Cap_grn_BI", "", 0, { "", "", -1 } },
			{ "H_Cap_oli", "", 0, { "", "", -1 } },
			{ "H_Cap_red", "", 0, { "", "", -1 } },
			{ "H_Cap_tan", "", 0, { "", "", -1 } },
			{ "H_Beret_02", "", 0, { "life_mediclevel", "SCALAR", 4 } },
			{ "H_PilotHelmetHeli_B", "", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "H_ShemagOpen_tan", "", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "H_Shemag_olive", "", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "H_ShemagOpen_khk", "", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "H_HelmetO_ocamo", "", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "H_MilCap_oucamo", "", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "H_HelmetB_camo", "", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "H_HelmetB_paint", "", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "H_HelmetCrew_I", "", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "H_HelmetSpecB", "", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "H_PilotHelmetHeli_O", "", 0, { "life_eventlevel", "SCALAR", 1 } }
		};

		goggles[] = {
			{ "NONE", "Brille entfernen", 0, { "", "", -1 } },
			{ "G_Shades_Black", "", 0, { "", "", -1 } },
			{ "G_Shades_Blue", "", 0, { "", "", -1 } },
			{ "G_Sport_Blackred", "", 0, { "", "", -1 } },
			{ "G_Sport_Checkered", "", 0, { "", "", -1 } },
			{ "G_Sport_Blackyellow", "", 0, { "", "", -1 } },
			{ "G_Sport_BlackWhite", "", 0, { "", "", -1 } },
			{ "G_Squares", "", 0, { "", "", -1 } },
			{ "G_Aviator", "", 0, { "", "", -1 } },
			{ "G_Lady_Mirror", "", 0, { "", "", -1 } },
			{ "G_Lady_Dark", "", 0, { "", "", -1 } },
			{ "G_Lady_Blue", "", 0, { "", "", -1 } },
			{ "G_Lowprofile", "", 0, { "", "", -1 } },
			{ "G_Combat", "", 0, { "", "", -1 } },
			{ "G_Diving", "", 0, { "", "", -1 } }
		};

		vests[] = {
			{ "NONE", "Weste entfernen", 0, { "", "", -1 } },
			{ "V_Rangemaster_belt", "", 0, { "", "", -1 } },
			{ "V_RebreatherB", "Tauchgerät", 0, { "", "", -1 } },
			{ "V_TacVest_khk", "", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "V_BandollierB_cbr", "", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "V_HarnessO_brn", "", 0, { "life_eventlevel", "SCALAR", 1 } },
			{ "V_PlateCarrier1_blk", "Anti Gas Weste", 0, { "life_eventlevel", "SCALAR", 1 } }
		};

		backpacks[] = {
			{ "NONE", "Rucksack entfernen", 0, { "", "", -1 } },
			{ "B_Kitbag_sgg", "", 0, { "life_hsd", "", "med" } },
			{ "B_Carryall_mcamo", "", 0, { "", "", -1 } }
		};
	};

	class asf {
		title = "STR_Shops_C_Asf";
		license = "";
		side = "asf";

		uniforms[] = {
			{ "NONE", "Uniform entfernen", 0, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam_vest", "Dienstuniform", 0, {"", "", -1} },
			{ "U_O_Wetsuit", "", 0, {"", "", -1} }
		};

		headgear[] = {
			{ "NONE", "Kopfbedeckung entfernen", 0, { "", "", -1 } },
			{ "H_Bandanna_gry", "", 0, { "", "", -1 } },
			{ "H_HelmetB_light_black", "", 0, { "", "", -1 } },
			{ "H_PilotHelmetHeli_B", "", 0, { "", "", -1 } },
			{ "H_Watchcap_blk", "", 0, { "", "", -1 } },
			{ "H_MilCap_gry", "", 0, { "", "", -1 } },
			{ "H_CrewHelmetHeli_B", "", 0, { "", "", -1 } },
			{ "H_HelmetB_light_black", "", 0, { "", "", -1 } },
			{ "H_Beret_blk", "", 0, { "life_asflevel", "SCALAR", 2 } },
			{ "H_Beret_02", "", 0, { "life_asflevel", "SCALAR", 5 } },
			{ "H_Beret_Colonel", "", 0, { "life_asflevel", "SCALAR", 5 } },
			{ "H_Cap_headphones", "", 0, { "life_asflevel", "SCALAR", 2 } }
		};

		goggles[] = {
			{ "NONE", "Brille entfernen", 0, { "", "", -1 } },
			{ "G_Shades_Black", "", 0, { "", "", -1 } },
			{ "G_Shades_Blue", "", 0, { "", "", -1 } },
			{ "G_Sport_Blackred", "", 0, { "", "", -1 } },
			{ "G_Sport_Checkered", "", 0, { "", "", -1 } },
			{ "G_Sport_Blackyellow", "", 0, { "", "", -1 } },
			{ "G_Sport_BlackWhite", "", 0, { "", "", -1 } },
			{ "G_Squares", "", 0, { "", "", -1 } },
			{ "G_Aviator", "", 0, { "", "", -1 } },
			{ "G_Lady_Mirror", "", 0, { "", "", -1 } },
			{ "G_Lady_Dark", "", 0, { "", "", -1 } },
			{ "G_Lady_Blue", "", 0, { "", "", -1 } },
			{ "G_Combat", "", 0, { "", "", -1 } },
			{ "G_Tactical_Black", "", 0, { "", "", -1 } },
			{ "G_Tactical_Clear", "", 0, { "", "", -1 } },
			{ "G_Diving", "", 0, { "", "", -1 } },
			{ "G_Balaclava_blk", "", 0, { "", "", -1 } }
		};

		vests[] = {
			{ "NONE", "Weste entfernen", 0, { "", "", -1 } },
			{ "V_Rangemaster_belt", "", 0, { "", "", -1 } },
			{ "V_TacVestIR_blk", "", 0, { "", "", -1 } },
			{ "V_PlateCarrier1_blk", "Anti Gas Weste", 0, { "", "", -1 } },
			{ "V_RebreatherIR", "", 0, { "", "", -1 } }
		};

		backpacks[] = {
			{ "NONE", "Rucksack entfernen", 0, { "", "", -1 } },
			{"B_Carryall_oli", "", 0, { "", "", -1 }}
		};
	};

	class press {
		title = "AAN News Shop";
		license = "press";
		side = "civ";

		uniforms[] = {
			{ "NONE", "Uniform entfernen", 0, { "", "", -1 } },
			{ "U_C_Journalist", "", 500, { "", "", -1 } }
		};

		headgear[] = {
			{ "NONE", "Kopfbedeckung entfernen", 0, { "", "", -1 } },
			{ "H_Cap_press", "", 500, { "", "", -1 } }
		};

		goggles[] = {
			{ "NONE", "Brille entfernen", 0, { "", "", -1 } },
			{ "", "", 500, { "", "", -1 } }
		};

		vests[] = {
			{ "NONE", "Weste entfernen", 0, { "", "", -1 } },
			{ "V_Press_F", "", 5000, { "", "", -1 } }
		};

		backpacks[] = {
			{ "NONE", "Rucksack entfernen", 0, { "", "", -1 } }
		};
	};
};