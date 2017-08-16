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
		title = "Bruce's Outback Outfits";
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
			{ "U_IG_Guerilla3_2", "Brown Jacket & Pants", 735, { "", "", -1 } },
			{ "U_IG_Guerilla2_3", "The Outback Rangler", 1200, { "", "", -1 } },
			{ "U_IG_Guerilla2_1", "The Outback Rangler", 1200, { "", "", -1 } },
			{ "U_C_HunterBody_grn", "The Hunters Look", 1500, { "", "", -1 } },
			{ "U_C_WorkerCoveralls", "Mechanic Coveralls", 2500, { "", "", -1 } },
			{ "U_Competitor", "Gelbes Shirt", 2500, { "", "", -1 } },
			{ "U_OrestesBody", "Surfing On Land", 1100, { "", "", -1 } },
			{ "U_NikosAgedBody", "Casual Wears", 5000, { "", "", -1 } },
			{ "U_C_Journalist", "Journalist", 5000, { "", "", -1 } },
			{ "U_C_Scientist", "Scientist", 5000, { "", "", -1 } },
			{ "U_NikosBody", "Assi Toni", 5000, { "", "", -1 } }
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
			{ "H_StrawHat_dark", "Straw Fedora", 225, { "", "", -1 } },
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
			{ "H_RacingHelmet_1_black_F", "", 1000, { "", "", -1 } },
			{ "H_RacingHelmet_1_red_F", "", 1000, { "", "", -1 } },
			{ "H_RacingHelmet_1_white_F", "", 1000, { "", "", -1 } },
			{ "H_RacingHelmet_1_blue_F", "", 1000, { "", "", -1 } },
			{ "H_RacingHelmet_1_yellow_F", "", 1000, { "", "", -1 } },
			{ "H_RacingHelmet_1_green_F", "", 1000, { "", "", -1 } },
			{ "H_RacingHelmet_1_F", "", 2500, { "", "", -1 } },
			{ "H_RacingHelmet_2_F", "", 2500, { "", "", -1 } },
			{ "H_RacingHelmet_3_F", "", 2500, { "", "", -1 } },
			{ "H_RacingHelmet_4_F", "", 2500, { "", "", -1 } },
			{ "H_Cap_blk_CMMG", "", 2500, { "", "", -1 } },
			{ "H_Cap_press", "", 2500, { "", "", -1 } },
			{ "H_Cap_blk_ION", "", 2500, { "", "", -1 } },
			{ "H_Cap_usblack", "", 2500, { "", "", -1 } },
			{ "H_Cap_surfer", "", 2500, { "", "", -1 } },
			{ "H_MilCap_blue", "", 2000, { "", "", -1 } },
			{ "H_Cap_marshal", "", 2000, { "", "", -1 } },
			{ "H_Bandanna_surfer_grn", "", 2000, { "", "", -1 } }
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
			{ "NONE", "Remove Vest", 0, { "", "", -1 } },
			{ "V_Rangemaster_belt", "", 1000, { "", "", -1 } },
			{ "V_Press_F", "", 15000, { "", "", -1 } }
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
		title = "Altis Police Department Shop";
		license = "";
		side = "cop";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_Marshal", "", 25, { "", "", -1 } },
			{ "U_Rangemaster", "Cop Uniform", 25, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam_tshirt", "", 350, { "life_coplevel", "SCALAR", 2 } },
			{ "U_B_CombatUniform_mcam", "", 1250, { "life_coplevel", "SCALAR", 3 } },
			{ "U_B_CombatUniform_mcam_worn", "", 550, { "life_coplevel", "SCALAR", 4 } },
			{ "U_O_OfficerUniform_ocamo", "", 550, { "life_coplevel", "SCALAR", 8 } }
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_Cap_police", "", 75, { "life_coplevel", "SCALAR", 1 } },
			{ "H_Beret_02", "", 75, { "life_coplevel", "SCALAR", 1 } },
			{ "H_HelmetB_plain_mcamo", "", 75, { "life_coplevel", "SCALAR", 1 } },
			{ "H_Booniehat_mcamo", "", 120, { "life_coplevel", "SCALAR", 1 } },
			{ "H_MilCap_mcamo", "", 100, { "life_coplevel", "SCALAR", 2 } },
			{ "H_HelmetSpecO_blk", "", 100, { "life_coplevel", "SCALAR", 4 } },
			{ "H_Watchcap_blk", "", 30, { "", "", -1 } },
			{ "H_Cap_headphones", "", 30, { "", "", -1 } },
			{ "G_Bandanna_blk", "", 55, { "life_coplevel", "SCALAR", 5 } },
			{ "H_HelmetB_light_black", "", 100, { "life_coplevel", "SCALAR", 4 } }
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
			{ "G_Balaclava_combat", "", 30, { "", "", -1 } },
			{ "G_Combat", "", 55, { "", "", -1 } }
		};

		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } },
			{ "V_Rangemaster_belt", "", 800, { "", "", -1 } },
			{ "V_TacVest_blk_POLICE", "", 800, { "life_coplevel", "SCALAR", 2 } },
			{ "V_PlateCarrier1_blk", "", 800, { "life_coplevel", "SCALAR", 3 } },
			{ "V_TacVestIR_blk", "", 800, { "life_coplevel", "SCALAR", 2 } },
			{ "V_PlateCarrierSpec_blk", "", 1500, { "life_coplevel", "SCALAR", 4 } },
			{ "V_PlateCarrier1_blk", "", 1500, { "life_coplevel", "SCALAR", 4 } },	
			{ "V_PlateCarrierGL_blk", "", 1500, { "life_coplevel", "SCALAR", 4 } }
		};

		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "", "", -1 } },
			{ "B_Kitbag_cbr", "", 800, { "", "", -1 } },
			{ "B_FieldPack_cbr", "", 500, { "", "", -1 } },
			{ "B_AssaultPack_cbr", "", 700, { "", "", -1 } },
			{ "B_Bergen_sgg", "", 2500, { "", "", -1 } },
			{ "B_Carryall_cbr", "", 3500, { "", "", -1 } }
		};
	};
		class sek {
		title = "Altis Police Department Shop";
		license = "swat";
		side = "cop";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_Marshal", "", 25, { "", "", -1 } },
			{ "U_Rangemaster", "Cop Uniform", 25, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam_tshirt", "", 350, { "life_coplevel", "SCALAR", 1 } },
			{ "U_B_survival_uniform", "", 1250, { "life_coplevel", "SCALAR", 1 } },
			{ "U_B_Wetsuit", "", 1250, { "life_coplevel", "SCALAR", 1 } },
			{ "U_B_CombatUniform_mcam", "", 1250, { "life_coplevel", "SCALAR", 1 } },
			{ "U_B_CombatUniform_mcam_worn", "", 550, { "life_coplevel", "SCALAR", 1 } },
			{ "U_B_FullGhillie_ard", "", 550, { "life_coplevel", "SCALAR", 1 } },
			{ "U_B_FullGhillie_lsh", "", 550, { "life_coplevel", "SCALAR", 1 } },
			{ "U_B_FullGhillie_sard", "", 550, { "life_coplevel", "SCALAR", 1 } }
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_Cap_police", "", 75, { "life_coplevel", "SCALAR", 1 } },
			{ "H_Beret_Colonel", "", 55, { "life_coplevel", "SCALAR", 1 } },
			{ "H_HelmetB_plain_mcamo", "", 75, { "life_coplevel", "SCALAR", 1 } },
			{ "H_Booniehat_mcamo", "", 120, { "life_coplevel", "SCALAR", 1 } },
			{ "H_MilCap_mcamo", "", 100, { "life_coplevel", "SCALAR", 1 } },
			{ "H_HelmetSpecO_blk", "", 100, { "life_coplevel", "SCALAR", 1 } },
			{ "H_HelmetB_light_black", "", 100, { "life_coplevel", "SCALAR", 1 } }
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
			{ "G_Bandanna_blk", "", 55, { "", "", -1 } },
			{ "G_Balaclava_combat", "", 55, { "", "", -1 } },
			{ "G_Combat", "", 55, { "", "", -1 } },
			{ "G_Diving", "", 500, { "", "", -1 } }
		};

		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } },
			{ "V_Rangemaster_belt", "", 800, { "", "", -1 } },
			{ "V_TacVest_blk_POLICE", "", 800, { "life_coplevel", "SCALAR", 1 } },
			{ "V_PlateCarrier1_blk", "", 800, { "life_coplevel", "SCALAR", 1 } },
			{ "V_TacVestIR_blk", "", 800, { "life_coplevel", "SCALAR", 1 } },
			{ "V_PlateCarrierSpec_blk", "", 1500, { "life_coplevel", "SCALAR", 1 } },	
			{ "V_PlateCarrierGL_blk", "", 1500, { "life_coplevel", "SCALAR", 1 } },				
			{ "V_RebreatherB", "", 1500, { "life_coplevel", "SCALAR", 1 } }
		};

		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "", "", -1 } },
			{ "B_Kitbag_cbr", "", 800, { "", "", -1 } },
			{ "B_FieldPack_cbr", "", 500, { "", "", -1 } },
			{ "B_AssaultPack_cbr", "", 700, { "", "", -1 } },
			{ "B_Bergen_sgg", "", 2500, { "", "", -1 } },
			{ "B_Carryall_cbr", "", 3500, { "", "", -1 } }
		};
	};

	class dive {
		title = "Steve's Taucherequipment";
		license = "dive";
		side = "civ";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_B_Wetsuit", "", 2000, { "", "", -1 } },
			{ "U_I_Wetsuit", "", 2000, { "", "", -1 } },
			{ "U_O_Wetsuit", "", 2000, { "", "", -1 } }
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
	
	class medic {
		title = "Medic Shop";
		license = "";
		side = "med";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_I_HeliPilotCoveralls", "Overall", 2000, { "", "", -1 } },
			{ "U_B_Wetsuit", "Seerettung", 2000, { "", "", -1 } }
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_Beret_Colonel", "Chef-Barrett", 0, { "", "", -1 } },
			{ "H_TurbanO_blk", "Hut", 0, { "", "", -1 } },
			{ "H_HelmetCrew_I", "Pilotenhelm", 0, { "", "", -1 } }

		};

		goggles[] = {
			{ "NONE", "Remove Glasses", 0, { "", "", -1 } },
			{ "G_Shades_Black", "", 25, { "", "", -1 } },
			{ "G_Shades_Blue", "", 20, { "", "", -1 } },
			{ "G_Squares", "", 10, { "", "", -1 } },
			{ "G_Aviator", "", 100, { "", "", -1 } },
			{ "G_Lowprofile", "", 30, { "", "", -1 } },
			{ "G_Combat", "", 55, { "", "", -1 } }
		};

		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } },
			{ "V_RebreatherB", "Atemgerät", 5000, { "", "", -1 } }
		};

		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "", "", -1 } },
			{ "B_TacticalPack_oli", "", 800, { "", "", -1 } },
			{ "B_Carryall_cbr", "", 3500, { "", "", -1 } }
		};
	};

	class reb {
		title = "Mohammed's Jihadi Shop";
		license = "rebel";
		side = "civ";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_IG_Guerilla1_1", "", 2500, {"", "", -1} },
			{ "U_MillerBody", "", 3000, {"", "", -1} },
			{ "U_KerryBody", "", 3000, {"", "", -1} },
			{ "U_B_CTRG_1", "", 5000, {"", "", -1} },
			{ "U_IG_Guerrilla_6_1", "", 5000, {"", "", -1} },
			{ "U_I_G_Story_Protagonist_F", "", 4500, { "", "", -1 } },
			{ "U_I_G_resistanceLeader_F", "", 4500, { "", "", -1 } },
			{ "U_B_PilotCoveralls", "", 11500, { "", "", -1 } },
			{ "U_O_SpecopsUniform_ocamo", "", 20000, { "", "", -1 } },
			{ "U_O_CombatUniform_oucamo", "", 20000, { "", "", -1 } },
			{ "U_I_CombatUniform_tshirt", "", 15500, { "", "", -1 } },
			{ "U_I_CombatUniform", "", 15600, { "", "", -1 } },
			{ "U_I_CombatUniform_shortsleeve", "", 17500, { "", "", -1 } },
			{ "U_I_pilotCoveralls", "", 19500, { "", "", -1 } },
			{ "U_O_SpecopsUniform_blk", "", 18500, { "", "", -1 } },
			{ "U_O_PilotCoveralls", "", 15610, { "", "", -1 } },
			{ "U_IG_leader", "Guerilla Leader", 15340, { "", "", -1 } },
			{ "U_O_GhillieSuit", "", 90000, { "", "", -1 } },
			{ "U_I_GhillieSuit", "", 90000, { "", "", -1 } },
			{ "U_O_OfficerUniform_ocamo", "", 14000, { "", "", -1 } },
			{ "U_B_FullGhillie_lsh", "", 120000, { "", "", -1 } },
			{ "U_B_FullGhillie_sard", "", 120000, { "", "", -1 } },
			{ "U_B_FullGhillie_ard", "", 120000, { "", "", -1 } },
			{ "U_O_FullGhillie_lsh", "", 120000, { "", "", -1 } },
			{ "U_O_FullGhillie_sard", "", 120000, { "", "", -1 } },
			{ "U_O_FullGhillie_ard", "", 120000, { "", "", -1 } },
			{ "U_I_FullGhillie_lsh", "", 120000, { "", "", -1 } },
			{ "U_I_FullGhillie_sard", "", 120000, { "", "", -1 } },
			{ "U_I_FullGhillie_ard", "", 120000, { "", "", -1 } },
			{ "U_I_OfficerUniform", "", 120000, { "", "", -1 } }
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_ShemagOpen_tan", "", 850, { "", "", -1 } },
			{ "H_Shemag_olive", "", 850, { "", "", -1 } },
			{ "H_Shemag_khk", "", 850, { "", "", -1 } },
			{ "H_BandMask_khk", "", 950, { "", "", -1 } },
			{ "H_ShemagOpen_khk", "", 850, { "", "", -1 } },
			{ "H_HelmetO_ocamo", "", 2300, { "", "", -1 } },
			{ "H_HelmetB_light", "", 2100, { "", "", -1 } },
			{ "H_HelmetB_paint", "", 2000, { "", "", -1 } },
			{ "H_HelmetB_grass", "", 2000, { "", "", -1 } },
			{ "H_HelmetB_camo", "", 2200, { "", "", -1 } },
			{ "H_HelmetLeaderO_oucamo", "", 2600, { "", "", -1 } },
			{ "H_HelmetSpecO_ocamo", "", 2500, { "", "", -1 } },
			{ "H_HelmetB", "", 2500, { "", "", -1 } },
			{ "H_MilCap_oucamo", "", 50, { "", "", -1 } },
			{ "H_Bandanna_camo", "", 650, { "", "", -1 } },
			{ "H_CrewHelmetHeli_B", "", 1600, { "", "", -1 } },
			{ "H_CrewHelmetHeli_O", "", 1600, { "", "", -1 } },
			{ "H_HelmetIA", "", 950, { "", "", -1 } },
			{ "H_HelmetCrew_B", "", 2000, { "", "", -1 } },
			{ "H_HelmetCrew_I", "", 1250, { "", "", -1 } },
			{ "H_PilotHelmetFighter_B", "", 3050, { "", "", -1 } },
			{ "H_PilotHelmetHeli_B", "", 1550, { "", "", -1 } },
			{ "H_PilotHelmetHeli_O", "", 1550, { "", "", -1 } },
			{ "H_Beret_blk", "", 150, { "", "", -1 } },
			{ "H_Watchcap_blk", "", 150, { "", "", -1 } },
			{ "H_BandMask_blk", "", 250, { "", "", -1 } },
			{ "H_PilotHelmetFighter_O", "", 3000, { "", "", -1 } }
			
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
			{ "G_Lowprofile", "", 30, { "", "", -1 } },
			{ "G_Combat", "", 55, { "", "", -1 } }
		};

		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } },
			{ "V_BandollierB_khk", "", 1000, { "", "", -1 } },
			{ "V_PlateCarrier1_rgr", "", 10500, { "", "", -1 } },
			{ "V_Chestrig_khk", "", 1500, { "", "", -1 } },
			{ "V_TacVest_khk", "", 8500, { "", "", -1 } },
			{ "V_TacVest_oli", "", 8500, { "", "", -1 } },
			{ "V_TacVest_camo", "", 8500, { "", "", -1 } },
			{ "V_TacVestIR_blk", "", 8500, { "", "", -1 } },
			{ "V_Chestrig_oli", "", 1500, { "", "", -1 } },
			{ "V_Chestrig_blk", "", 1500, { "", "", -1 } },
			{ "V_Chestrig_rgr", "", 1500, { "", "", -1 } },
			{ "V_Chestrig_khk", "", 1500, { "", "", -1 } },
			{ "V_HarnessO_brn", "", 1500, { "", "", -1 } },
			{ "V_HarnessOGL_brn", "", 1600, { "", "", -1 } },
			{ "V_PlateCarrierIA1_dgtl", "", 10900, { "", "", -1 } },
			{ "V_PlateCarrierIAGL_dgtl", "", 20000, { "", "", -1 } },
			{ "V_PlateCarrier_Kerry", "", 8500, { "", "", -1 } },
			{ "V_I_G_resistanceLeader_F", "", 8500, { "", "", -1 } },
			{ "V_Press_F", "", 10500, { "", "", -1 } }
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
	
	class asr {
		title = "Mohammed's Jihadi Shop";
		license = "rebel";
		side = "civ";

		uniforms[] = {
			{ "U_B_CombatUniform_mcam", "", 6500, { "", "", -1 } }
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } }
			
		};

		goggles[] = {
			{ "NONE", "Remove Glasses", 0, { "", "", -1 } },
			{ "G_Combat", "", 55, { "", "", -1 } }
		};

		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } },
			{ "V_Press_F", "", 10500, { "", "", -1 } }
		};

		backpacks[] = {
			{ "B_Bergen_sgg", "", 4500, { "", "", -1 } },
			{ "B_Bergen_blk", "", 4500, { "", "", -1 } }
		};
	};

	class kart {
		title = "Bobby's Go-Kart Rennklamotten";
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