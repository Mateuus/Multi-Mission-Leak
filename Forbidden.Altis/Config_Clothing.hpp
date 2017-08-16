
class Clothing {
	class bruce {
		title = "STR_Shops_C_Bruce";
		license = "";
		side = "civ";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_C_Poloshirt_blue", "Poloshirt Blue", 1000, { "", "", -1 } },
			{ "U_C_Poloshirt_burgundy", "Poloshirt Burgundy", 1250, { "", "", -1 } },
			{ "U_C_Poloshirt_redwhite", "Poloshirt Red/White", 1250, { "", "", -1 } },
			{ "U_C_Poloshirt_salmon", "Poloshirt Salmon", 1150, { "", "", -1 } },
			{ "U_C_Poloshirt_stripped", "Poloshirt stripped", 900, { "", "", -1 } },
			{ "U_C_Poloshirt_tricolour", "Poloshirt Tricolor", 1500, { "", "", -1 } },
			{ "U_C_Poor_2", "Rag tagged clothes", 1250, { "", "", -1 } },
			{ "U_IG_Guerilla2_2", "Green stripped shirt & Pants", 1750, { "", "", -1 } },
			{ "U_IG_Guerilla3_1", "Brown Jacket & Pants", 2000, { "", "", -1 } },
			{ "U_IG_Guerilla2_3", "The Outback Rangler", 4000, { "", "", -1 } },
			{ "U_C_HunterBody_grn", "The Hunters Look", 4500, { "", "", -1 } },
			{ "U_C_WorkerCoveralls", "Mechanic Coveralls", 3000, { "", "", -1 } },
			{ "U_OrestesBody", "Surfing On Land", 3000, { "", "", -1 } },
			{ "U_NikosAgedBody", "Casual Wears", 10000, { "", "", -1 } }
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_Bandanna_camo", "Camo Bandanna", 500, { "", "", -1 } },
			{ "H_Bandanna_surfer", "Surfer Bandanna", 500, { "", "", -1 } },
			{ "H_Bandanna_gry", "Grey Bandanna", 500, { "", "", -1 } },
			{ "H_Bandanna_cbr", "", 500, { "", "", -1 } },
			{ "H_Bandanna_surfer", "", 500, { "", "", -1 } },
			{ "H_Bandanna_khk", "Khaki Bandanna", 550, { "", "", -1 } },
			{ "H_Bandanna_sgg", "Sage Bandanna", 550, { "", "", -1 } },
			{ "H_StrawHat", "Straw Fedora", 650, { "", "", -1 } },
			{ "H_BandMask_blk", "Hat & Bandanna", 750, { "", "", -1 } },
			{ "H_Booniehat_tan", "", 800, { "", "", -1 } },
			{ "H_Hat_blue", "", 500, { "", "", -1 } },
			{ "H_Hat_brown", "", 500, { "", "", -1 } },
			{ "H_Hat_checker", "", 500, { "", "", -1 } },
			{ "H_Hat_grey", "", 500, { "", "", -1 } },
			{ "H_Hat_tan", "", 500, { "", "", -1 } },
			{ "H_Cap_blu", "", 450, { "", "", -1 } },
			{ "H_Cap_grn", "", 450, { "", "", -1 } },
			{ "H_Cap_grn_BI", "", 450, { "", "", -1 } },
			{ "H_Cap_oli", "", 450, { "", "", -1 } },
			{ "H_Cap_red", "", 450, { "", "", -1 } },
			{ "H_Cap_tan", "", 450, { "", "", -1 } }
		};

		goggles[] = {
			{ "NONE", "Remove Glasses", 0, { "", "", -1 } },
			{ "G_Shades_Black", "", 250, { "", "", -1 } },
			{ "G_Shades_Blue", "", 250, { "", "", -1 } },
			{ "G_Sport_Blackred", "", 200, { "", "", -1 } },
			{ "G_Sport_Checkered", "", 200, { "", "", -1 } },
			{ "G_Sport_Blackyellow", "", 200, { "", "", -1 } },
			{ "G_Sport_BlackWhite", "", 200, { "", "", -1 } },
			{ "G_Squares", "", 250, { "", "", -1 } },
			{ "G_Aviator", "", 1000, { "", "", -1 } },
			{ "G_Lady_Mirror", "", 250, { "", "", -1 } },
			{ "G_Lady_Dark", "", 250, { "", "", -1 } },
			{ "G_Lady_Blue", "", 250, { "", "", -1 } },
			{ "G_Lowprofile", "", 300, { "", "", -1 } },
			{ "G_Combat", "", 1000, { "", "", -1 } },
			{ "G_Balaclava_blk", "", 5000, { "", "", -1 } },
			{ "G_Balaclava_combat", "", 5000, { "", "", -1 } },
			{ "G_Balaclava_lowprofile", "", 5000, { "", "", -1 } },
			{ "G_Balaclava_oli", "", 5000, { "", "", -1 } }
		};

		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } }
		};

		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "", "", -1 } },
			{ "B_Parachute", "", 4000, { "", "", -1 } },
			{ "B_AssaultPack_cbr", "", 4000, { "", "", -1 } },
			{ "B_Kitbag_mcamo", "", 5000, { "", "", -1 } },
			{ "B_TacticalPack_oli", "", 5500, { "", "", -1 } },
			{ "B_FieldPack_ocamo", "", 5500, { "", "", -1 } },
			{ "B_Bergen_sgg", "", 6000, { "", "", -1 } },
			{ "B_Kitbag_cbr", "", 6000, { "", "", -1 } },
			{ "B_Carryall_oli", "", 8000, { "", "", -1 } },
			{ "B_Carryall_khk", "", 8000, { "", "", -1 } }
		};
	};
	
	class medic {
		title = "Medical clothing shop";
		license = "";
		side = "med";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_B_Wetsuit", "", 2000, { "", "", -1 } },
			{ "U_Rangemaster", "Medic uniform", 250, { "", "", -1 } }
		};
		
		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_Bandanna_camo", "Camo Bandanna", 500, { "", "", -1 } },
			{ "H_Bandanna_surfer", "Surfer Bandanna", 500, { "", "", -1 } },
			{ "H_Bandanna_gry", "Grey Bandanna", 500, { "", "", -1 } },
			{ "H_Bandanna_cbr", "", 500, { "", "", -1 } },
			{ "H_Bandanna_surfer", "", 500, { "", "", -1 } },
			{ "H_Bandanna_khk", "Khaki Bandanna", 550, { "", "", -1 } },
			{ "H_Bandanna_sgg", "Sage Bandanna", 550, { "", "", -1 } },
			{ "H_StrawHat", "Straw Fedora", 650, { "", "", -1 } },
			{ "H_BandMask_blk", "Hat & Bandanna", 750, { "", "", -1 } },
			{ "H_Booniehat_tan", "", 800, { "", "", -1 } },
			{ "H_Hat_blue", "", 500, { "", "", -1 } },
			{ "H_Hat_brown", "", 500, { "", "", -1 } },
			{ "H_Hat_checker", "", 500, { "", "", -1 } },
			{ "H_Hat_grey", "", 500, { "", "", -1 } },
			{ "H_Hat_tan", "", 500, { "", "", -1 } },
			{ "H_Cap_blu", "", 450, { "", "", -1 } },
			{ "H_Cap_grn", "", 450, { "", "", -1 } },
			{ "H_Cap_grn_BI", "", 450, { "", "", -1 } },
			{ "H_Cap_oli", "", 450, { "", "", -1 } },
			{ "H_Cap_red", "", 450, { "", "", -1 } },
			{ "H_Cap_tan", "", 450, { "", "", -1 } }
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
			{ "G_Diving", "", 150, { "", "", -1 } }
		};

		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } },
			{ "V_RebreatherB", "", 1000, { "", "", -1 } }
		};

		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "", "", -1 } },
			{ "B_Parachute", "", 1000, { "", "", -1 } },
			{ "B_AssaultPack_rgr_Medic", "", 2500, { "", "", -1 } },
			{ "B_Kitbag_mcamo", "", 4500, { "", "", -1 } },
			{ "B_TacticalPack_oli", "", 3500, { "", "", -1 } },
			{ "B_FieldPack_ocamo", "", 3000, { "", "", -1 } },
			{ "B_Bergen_sgg", "", 4500, { "", "", -1 } },
			{ "B_Kitbag_cbr", "", 4500, { "", "", -1 } },
			{ "B_Carryall_oli", "", 5000, { "", "", -1 } },
			{ "B_Carryall_khk", "", 5000, { "", "", -1 } }
		};
	};
	
	class donator {
		title = "STR_Shops_C_Donator";
		license = "";
		side = "civ";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_C_Poloshirt_burgundy", "Svampbob", 1000, { "life_donatorlvl", "SCALAR", 4 } },
			{ "U_C_ShirtSurfer_shorts", "Squirtle", 1000, { "life_donatorlvl", "SCALAR", 4 } },
			{ "U_C_TeeSurfer_shorts_1", "Cool dude", 1000, { "life_donatorlvl", "SCALAR", 4 } },
			{ "U_C_TeeSurfer_shorts_2", "Monster", 1000, { "life_donatorlvl", "SCALAR", 4 } },
			{ "U_Marshal", "KFC", 5000, { "life_donatorlvl", "SCALAR", 4 } },
			{ "U_Rangemaster", "Taxi", 1000, { "life_donatorlvl", "SCALAR", 4 } },
			{ "U_C_Man_casual_3_F", "Påskharen", 1000, { "life_donatorlvl", "SCALAR", 4 } },
			{ "U_I_C_Soldier_Bandit_4_F", "", 1000, { "life_donatorlvl", "SCALAR", 4 } },
			{ "U_I_C_Soldier_Bandit_1_F", "", 1000, { "life_donatorlvl", "SCALAR", 4 } },
			{ "U_I_C_Soldier_Bandit_2_F", "", 1000, { "life_donatorlvl", "SCALAR", 4 } },
			{ "U_I_C_Soldier_Bandit_5_F", "", 1000, { "life_donatorlvl", "SCALAR", 4 } },
			{ "U_I_C_Soldier_Bandit_3_F", "", 1000, { "life_donatorlvl", "SCALAR", 4 } },
			{ "U_C_Man_casual_2_F", "", 1000, { "life_donatorlvl", "SCALAR", 4 } },
			{ "U_C_Man_casual_1_F", "", 1000, { "life_donatorlvl", "SCALAR", 4 } },
			{ "U_B_GEN_Soldier_F", "", 1000, { "life_donatorlvl", "SCALAR", 4 } },
			{ "U_I_C_Soldier_Para_5_F", "", 1000, { "life_donatorlvl", "SCALAR", 4 } },
			{ "U_C_man_sport_1_F", "", 1000, { "life_donatorlvl", "SCALAR", 4 } },
			{ "U_C_man_sport_3_F", "", 1000, { "life_donatorlvl", "SCALAR", 4 } },
			{ "U_C_man_sport_2_F", "", 1000, { "life_donatorlvl", "SCALAR", 4 } },
			{ "U_C_Man_casual_6_F", "", 1000, { "life_donatorlvl", "SCALAR", 4 } },
			{ "U_C_Man_casual_4_F", "", 1000, { "life_donatorlvl", "SCALAR", 4 } },
			{ "U_C_Man_casual_5_F", "", 1000, { "life_donatorlvl", "SCALAR", 4 } },
			{ "U_C_Poloshirt_blue", "Poloshirt Blue", 500, { "", "", -1 } },
			{ "U_C_Poloshirt_burgundy", "Poloshirt Burgundy", 500, { "", "", -1 } },
			{ "U_C_Poloshirt_redwhite", "Poloshirt Red/White", 500, { "", "", -1 } },
			{ "U_C_Poloshirt_salmon", "Poloshirt Salmon", 500, { "", "", -1 } },
			{ "U_C_Poloshirt_stripped", "Poloshirt stripped", 500, { "", "", -1 } },
			{ "U_C_Poloshirt_tricolour", "Poloshirt Tricolor", 500, { "", "", -1 } },
			{ "U_C_Poor_2", "Rag tagged clothes", 500, { "", "", -1 } },
			{ "U_IG_Guerilla2_2", "Green stripped shirt & Pants", 650, { "", "", -1 } },
			{ "U_IG_Guerilla3_1", "Brown Jacket & Pants", 735, { "", "", -1 } },
			{ "U_IG_Guerilla2_3", "The Outback Rangler", 1200, { "", "", -1 } },
			{ "U_C_HunterBody_grn", "The Hunters Look", 1500, { "", "", -1 } },
			{ "U_C_WorkerCoveralls", "Mechanic Coveralls", 2500, { "", "", -1 } },
			{ "U_OrestesBody", "Surfing On Land", 1100, { "", "", -1 } },
			{ "U_NikosAgedBody", "Casual Wears", 7000, { "", "", -1 } },
			{ "U_NikosBody", "Nikos look", 10000, { "life_donatorlvl", "SCALAR", 2 } },
			{ "U_Marshal", "", 5000, { "life_donatorlvl", "SCALAR", 2 } },
			{ "U_B_Wetsuit", "Batman", 2500, { "life_donatorlvl", "SCALAR", 2 } },
			{ "U_Competitor", "", 500, { "life_donatorlvl", "SCALAR", 2 } },
			{ "U_IG_Guerilla2_1", "", 12000, { "life_donatorlvl", "SCALAR", 2 } },
			{ "U_C_Poor_1", "", 500, { "life_donatorlvl", "SCALAR", 2 } },
			{ "U_C_Driver_1", "", 2500, { "life_donatorlvl", "SCALAR", 2 } },
			{ "U_C_Driver_2", "", 2500, { "life_donatorlvl", "SCALAR", 2 } },
			{ "U_C_Driver_3", "", 2500, { "life_donatorlvl", "SCALAR", 2 } },
			{ "U_C_Driver_4", "", 2500, { "life_donatorlvl", "SCALAR", 2 } },
			{ "U_B_Protagonist_VR", "", 2500, { "life_donatorlvl", "SCALAR", 2 } },
			{ "U_O_Protagonist_VR", "", 2500, { "life_donatorlvl", "SCALAR", 2 } },
			{ "U_I_Protagonist_VR", "", 2500, { "life_donatorlvl", "SCALAR", 2 } }
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
			{ "H_Bandanna_khk_hs", "", 150, { "", "", -1 } },
			{ "H_StrawHat", "Straw Fedora", 225, { "", "", -1 } },
			{ "H_BandMask_blk", "Hat & Bandanna", 300, { "", "", -1 } },
			{ "H_Booniehat_tan", "", 425, { "", "", -1 } },
			{ "H_Hat_blue", "", 310, { "", "", -1 } },
			{ "H_Hat_brown", "", 276, { "life_donatorlvl", "SCALAR", 2 } },
			{ "H_Hat_checker", "", 340, { "life_donatorlvl", "SCALAR", 2 } },
			{ "H_Hat_grey", "", 280, { "life_donatorlvl", "SCALAR", 2 } },
			{ "H_Hat_tan", "", 265, { "life_donatorlvl", "SCALAR", 2 } },
			{ "H_Cap_blu", "", 150, { "life_donatorlvl", "SCALAR", 2 } },
			{ "H_Cap_grn", "", 150, { "life_donatorlvl", "SCALAR", 2 } },
			{ "H_Cap_grn_BI", "", 150, { "life_donatorlvl", "SCALAR", 2 } },
			{ "H_Cap_oli", "", 150, { "life_donatorlvl", "SCALAR", 2 } },
			{ "H_Cap_red", "", 150, { "life_donatorlvl", "SCALAR", 2 } },
			{ "H_Cap_tan", "", 150, { "life_donatorlvl", "SCALAR", 2 } },
			{ "H_Cap_blk", "", 150, { "life_donatorlvl", "SCALAR", 2 } },
			{ "H_Cap_marshal", "", 150, { "life_donatorlvl", "SCALAR", 2 } },
			{ "H_Cap_blk_CMMG", "", 150, { "life_donatorlvl", "SCALAR", 2 } },
			{ "H_Cap_brn_SPECOPS", "", 150, { "life_donatorlvl", "SCALAR", 2 } },
			{ "H_Cap_tan_specops_US", "", 150, { "life_donatorlvl", "SCALAR", 2 } },
			{ "H_Cap_khaki_specops_UK", "", 150, { "life_donatorlvl", "SCALAR", 2 } },
			{ "H_Cap_blk_Raven", "", 150, { "life_donatorlvl", "SCALAR", 2 } },
			{ "H_Cap_blk_ION", "", 150, { "life_donatorlvl", "SCALAR", 2 } },
			{ "H_Cap_oli_hs", "", 150, { "life_donatorlvl", "SCALAR", 2 } },
			{ "H_Cap_press", "", 150, { "life_donatorlvl", "SCALAR", 2 } },
			{ "H_Cap_surfer", "", 150, { "life_donatorlvl", "SCALAR", 2 } },
			{ "H_Cap_headphones", "", 150, { "life_donatorlvl", "SCALAR", 2 } },
			{ "H_MilCap_blue", "", 150, { "life_donatorlvl", "SCALAR", 2 } },
			{ "H_BandMask_blk", "", 150, { "life_donatorlvl", "SCALAR", 2 } },
			{ "H_RacingHelmet_1_F", "", 150, { "life_donatorlvl", "SCALAR", 2 } },
			{ "H_RacingHelmet_2_F", "", 150, { "life_donatorlvl", "SCALAR", 2 } },
			{ "H_RacingHelmet_4_F", "", 150, { "life_donatorlvl", "SCALAR", 2 } },
			{ "H_RacingHelmet_1_green_F", "", 150, { "life_donatorlvl", "SCALAR", 2 } },
			{ "H_RacingHelmet_1_red_F", "", 150, { "life_donatorlvl", "SCALAR", 2 } },
			{ "H_RacingHelmet_1_yellow_F", "", 150, { "life_donatorlvl", "SCALAR", 2 } },
			{ "H_Beret_02", "", 150, { "life_donatorlvl", "SCALAR", 2 } }
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
			{ "G_Balaclava_blk", "", 100, { "", "", -1 } },
			{ "G_Balaclava_combat", "", 100, { "", "", -1 } },
			{ "G_Balaclava_lowprofile", "", 100, { "", "", -1 } },
			{ "G_Balaclava_oli", "", 100, { "", "", -1 } },
			{ "G_Diving", "", 100, { "", "", -1 } }
		};

		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } },
			{ "V_BandollierB_cbr", "", 30000, { "life_donatorlvl", "SCALAR", 1 } },
			{ "V_BandollierB_blk", "", 30000, { "life_donatorlvl", "SCALAR", 1 } },
			{ "V_BandollierB_khk", "", 30000, { "life_donatorlvl", "SCALAR", 1 } },
			{ "V_RebreatherB", "", 5000, { "", "", -1 } }
		};

		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "", "", -1 } },
			{ "B_Parachute", "", 1000, { "", "", -1 } },
			{ "B_AssaultPack_cbr", "", 2500, { "", "", -1 } },
			{ "B_Kitbag_mcamo", "", 4500, { "", "", -1 } },
			{ "B_TacticalPack_oli", "", 3500, { "", "", -1 } },
			{ "B_FieldPack_ocamo", "", 3000, { "", "", -1 } },
			{ "B_Bergen_sgg", "", 4500, { "", "", -1 } },
			{ "B_Kitbag_cbr", "", 4500, { "", "", -1 } },
			{ "B_Carryall_oli", "", 6000, { "", "", -1 } },
			{ "B_Carryall_khk", "", 6000, { "", "", -1 } },
			{ "B_Carryall_cbr", "", 6000, { "life_donatorlvl", "SCALAR", 2 } },
			{ "B_Carryall_ocamo", "", 6000, { "life_donatorlvl", "SCALAR", 2 } },
			{ "B_Carryall_mcamo", "", 6000, { "life_donatorlvl", "SCALAR", 2 } },
			{ "B_Carryall_oucamo", "", 6000, { "life_donatorlvl", "SCALAR", 2 } }
		};
	};

	class cop {
		title = "STR_Shops_C_Police";
		license = "";
		side = "cop";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_B_Wetsuit", "", 2000, { "", "", -1 } },
			{ "U_Rangemaster", "Kadettuniform", 25, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam", "Uniform", 25, { "life_coplevel", "SCALAR", 2 } },
			{ "U_B_CombatUniform_mcam_vest", "Uniform", 25, { "life_coplevel", "SCALAR", 5 } }
			
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_HelmetB", "", 4000, { "life_coplevel", "SCALAR", 2 } },
			{ "H_Beret_Colonel", "Kaptensbasker", 500, { "life_coplevel", "SCALAR", 8 } },
			{ "H_Beret_blk", "Basker", 250, { "life_coplevel", "SCALAR", 2 } },
			{ "H_Watchcap_blk", "", 100, { "life_coplevel", "SCALAR", 3 } },
			{ "H_Cap_police", "", 100, { "life_coplevel", "SCALAR", 1 } },
			{ "H_Booniehat_mcamo", "", 100, { "life_coplevel", "SCALAR", 4 } },
			{ "H_MilCap_mcamo", "", 150, { "life_coplevel", "SCALAR", 3 } }
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
			{ "G_Diving", "", 55, { "", "", -1 } }
		};

		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } },
			{ "V_Rangemaster_belt", "", 5000, { "", "", -1 } },
			{ "V_RebreatherB", "", 1000, { "", "", -1 } },
			{ "V_TacVest_blk_POLICE", "", 10000, { "life_coplevel", "SCALAR", 1 } },
			{ "V_PlateCarrier1_blk", "", 10000, { "life_coplevel", "SCALAR", 6 } }
		};

		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "", "", -1 } },
			{ "B_Parachute", "", 1000, { "", "", -1 } },
			{ "B_Kitbag_cbr", "", 800, { "", "", -1 } },
			{ "B_Kitbag_mcamo", "", 800, { "life_coplevel", "SCALAR", 5 } }
			
		};
	};
	
	class insats {
		title = "STR_Shops_C_Police";
		license = "";
		side = "cop";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_B_Wetsuit", "", 2000, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam", "Insats uniform", 25, { "", "", -1 } },
			{ "U_O_GhillieSuit", "Ghillie", 100000, { "", "", -1 } }
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_HelmetSpecB_sand", "", 2000, { "", "", -1 } },
			{ "H_HelmetB", "", 4000, { "", "", -1 } },
			{ "H_Watchcap_blk", "", 100, { "", "", -1 } },
			{ "H_Booniehat_mcamo", "", 100, { "", "", -1 } },
			{ "H_MilCap_mcamo", "", 150, { "", "", -1 } }
		};

		goggles[] = {
			{ "NONE", "Remove Glasses", 0, { "", "", -1 } },
			{ "G_Balaclava_blk", "", 25, { "", "", -1 } },
			{ "G_Balaclava_combat", "", 25, { "", "", -1 } },
			{ "G_Balaclava_lowprofile", "", 25, { "", "", -1 } },
			{ "G_Balaclava_oli", "", 25, { "", "", -1 } },
			{ "G_Bandanna_aviator", "", 25, { "", "", -1 } },
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
			{ "G_Diving", "", 55, { "", "", -1 } }
		};

		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } },
			{ "V_Rangemaster_belt", "", 5000, { "", "", -1 } },
			{ "V_RebreatherB", "", 1000, { "", "", -1 } },
			{ "V_TacVest_blk_POLICE", "", 10000, { "", "", -1 } },
			{ "V_PlateCarrier_Kerry", "", 10000, { "", "", -1 } }
		};

		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "", "", -1 } },
			{ "B_Parachute", "", 1000, { "", "", -1 } },
			{ "B_Kitbag_cbr", "", 800, { "", "", -1 } },
			{ "B_FieldPack_cbr", "", 500, { "", "", -1 } },
			{ "B_AssaultPack_cbr", "", 700, { "", "", -1 } },
			{ "B_Bergen_sgg", "", 2500, { "", "", -1 } },
			{ "B_Carryall_cbr", "", 3500, { "", "", -1 } }
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
		license = "";
		side = "civ";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_IG_leader", "Guerilla Leader", 9340, { "", "", -1 } },
			{ "U_I_G_resistanceLeader_F", "", 7500, { "", "",  -1 } },
			{ "U_I_G_Story_Protagonist_F", "", 7500, { "", "", -1 } },
			{ "U_OG_Guerilla2_3", "", 5000, { "", "", -1 } },
			{ "U_KerryBody", "", 7500, { "life_reblevel", "SCALAR", 3 } },
			{ "U_B_CTRG_1", "", 7500, { "life_reblevel", "SCALAR", 8 } },
			{ "U_B_CTRG_2", "", 7500, { "life_reblevel", "SCALAR", 3 } },
			{ "U_B_CTRG_3", "", 20000, { "life_reblevel", "SCALAR", 6 } },
			{ "U_I_GhillieSuit", "", 100000, { "life_reblevel", "SCALAR", 4 } },
			{ "U_O_GhillieSuit", "", 100000, { "life_reblevel", "SCALAR", 4 } },
			{ "U_B_GhillieSuit", "", 100000, { "life_reblevel", "SCALAR", 4 } },
			{ "U_I_FullGhillie_ard", "", 150000, { "life_reblevel", "SCALAR", 5 } },
			{ "U_O_FullGhillie_ard", "", 150000, { "life_reblevel", "SCALAR", 5 } },
			{ "U_B_FullGhillie_ard", "", 150000, { "life_reblevel", "SCALAR", 5 } },
			{ "U_I_FullGhillie_lsh", "", 150000, { "life_reblevel", "SCALAR", 5 } },
			{ "U_O_FullGhillie_lsh", "", 150000, { "life_reblevel", "SCALAR", 5 } },
			{ "U_B_FullGhillie_lsh", "", 150000, { "life_reblevel", "SCALAR", 5 } },
			{ "U_I_FullGhillie_sard", "", 150000, { "life_reblevel", "SCALAR", 5 } },
			{ "U_O_FullGhillie_sard", "", 150000, { "life_reblevel", "SCALAR", 5 } },
			{ "U_B_FullGhillie_sard", "", 150000, { "life_reblevel", "SCALAR", 5 } }
		};

		headgear[] = {
			{ "NONE", "Remove Hat", 0, { "", "", -1 } },
			{ "H_ShemagOpen_tan", "", 850, { "life_reblevel", "SCALAR", 3 } },
			{ "H_Shemag_olive", "", 850, { "life_reblevel", "SCALAR", 3 } },
			{ "H_ShemagOpen_khk", "", 800, { "life_reblevel", "SCALAR", 8 } },
			{ "H_HelmetO_ocamo", "", 2500, { "", "", -1 } },
			{ "H_HelmetB_camo", "", 2500, { "", "", -1 } },
			{ "H_MilCap_oucamo", "", 1200, { "", "", -1 } },
			{ "H_Bandanna_camo", "", 650, { "", "", -1 } },
			{ "H_Watchcap_cbr", "", 100, { "", "", -1 } }
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
			{ "G_Combat", "", 55, { "", "", -1 } },
			{ "G_Balaclava_blk", "", 100, { "", "", -1 } },
			{ "G_Balaclava_combat", "", 100, { "", "", -1 } },
			{ "G_Balaclava_lowprofile", "", 100, { "", "", -1 } },
			{ "G_Balaclava_oli", "", 100, { "", "", -1 } }
		};

		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } },
			{ "V_TacVestIR_blk", "", 10000, { "life_donatorlvl", "SCALAR", 3 } },
			{ "V_TacVest_oli", "", 10000, { "life_donatorlvl", "SCALAR", 3 } },
			{ "V_BandollierB_blk", "", 7500, { "life_donatorlvl", "SCALAR", 3 } },
			{ "V_TacVest_brn", "", 10000, { "life_donatorlvl", "SCALAR", 3 } },
			{ "V_TacVest_khk", "", 10000, { "", "", -1 } },
			{ "V_BandollierB_cbr", "", 4500, { "", "", -1 } },
			{ "V_HarnessO_brn", "", 7500, { "", "", -1 } },
			{ "V_RebreatherB", "", 5000, { "", "", -1 } }
		};

		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "", "", -1 } },
			{ "B_Parachute", "", 1000, { "", "", -1 } },
			{ "B_AssaultPack_cbr", "", 2500, { "", "", -1 } },
			{ "B_Kitbag_mcamo", "", 4500, { "", "", -1 } },
			{ "B_TacticalPack_oli", "", 3500, { "", "", -1 } },
			{ "B_FieldPack_ocamo", "", 3000, { "", "", -1 } },
			{ "B_Bergen_sgg", "", 4500, { "", "", -1 } },
			{ "B_Kitbag_cbr", "", 4500, { "", "", -1 } },
			{ "B_Carryall_oli", "", 5000, { "", "", -1 } },
			{ "B_Carryall_khk", "", 5000, { "", "", -1 } },
			{ "B_Carryall_cbr", "", 5000, { "life_donatorlvl", "SCALAR", 3 } },
			{ "B_Carryall_ocamo", "", 5000, { "life_donatorlvl", "SCALAR", 3 } },
			{ "B_Carryall_mcamo", "", 5000, { "life_donatorlvl", "SCALAR", 3 } },
			{ "B_Carryall_oucamo", "", 5000, { "life_donatorlvl", "SCALAR", 3 } }
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
	
	class blackmarket {
		title = "STR_Shops_C_BlackMarket";
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
			{ "U_NikosAgedBody", "Casual Wears", 5000, { "", "", -1 } },
			{ "U_I_GhillieSuit", "", 300000, { "", "", -1 } },
			{ "U_O_GhillieSuit", "", 300000, { "", "", -1 } },
			{ "U_B_GhillieSuit", "", 300000, { "", "", -1 } },
			{ "U_I_FullGhillie_ard", "", 500000, { "", "", -1 } },
			{ "U_O_FullGhillie_ard", "", 500000, { "", "", -1 } },
			{ "U_B_FullGhillie_ard", "", 500000, { "", "", -1 } },
			{ "U_I_FullGhillie_lsh", "", 500000, { "", "", -1 } },
			{ "U_O_FullGhillie_lsh", "", 500000, { "", "", -1 } },
			{ "U_B_FullGhillie_lsh", "", 500000, { "", "", -1 } },
			{ "U_I_FullGhillie_sard", "", 500000, { "", "", -1 } },
			{ "U_O_FullGhillie_sard", "", 500000, { "", "", -1 } },
			{ "U_B_FullGhillie_sard", "", 500000, { "", "", -1 } }
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
			{ "G_Combat", "", 55, { "", "", -1 } },
			{ "G_Balaclava_blk", "", 1500, { "", "", -1 } },
			{ "G_Balaclava_combat", "", 1500, { "", "", -1 } },
			{ "G_Balaclava_lowprofile", "", 1500, { "", "", -1 } },
			{ "G_Balaclava_oli", "", 1500, { "", "", -1 } }
		};

		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } },
			{ "V_Rangemaster_belt", "", 10000, { "", "", -1 } }
		};

		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "", "", -1 } },
			{ "B_Parachute", "", 1000, { "", "", -1 } },
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
	
	class gangarea {
		title = "Gängtillhållets klädbutik";
		license = "";
		side = "civ";

		uniforms[] = {
			{ "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_IG_Guerilla2_2", "Green stripped shirt & Pants", 650, { "", "", -1 } },
			{ "U_IG_Guerilla3_1", "Brown Jacket & Pants", 735, { "", "", -1 } },
			{ "U_IG_Guerilla2_3", "The Outback Rangler", 1200, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam", "Combat Uniform", 200000, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam_tshirt", "Combat Uniform-Tshirt", 150000, { "", "", -1 } },
			{ "U_I_C_Soldier_Para_1_F", "Paramilitary Garb (Tee)", 210000, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam_vest", "Recon Fatigues (MTP)", 230000, { "", "", -1 } },
			{ "U_BG_Guerrilla_6_1", "Guerilla Apparel", 250000, { "", "", -1 } },
			{ "U_I_GhillieSuit", "Halv ghillie", 500000, { "", "", -1 } },
			{ "U_O_GhillieSuit", "Halv ghillie", 500000, { "", "", -1 } },
			{ "U_B_GhillieSuit", "Halv ghillie", 500000, { "", "", -1 } },
			{ "U_I_FullGhillie_ard", "FullGhillie", 800000, { "", "", -1 } }, 
			{ "U_O_FullGhillie_ard", "FullGhillie", 800000, { "", "", -1 } },
			{ "U_B_FullGhillie_ard", "FullGhillie", 800000, { "", "", -1 } },
			{ "U_I_FullGhillie_lsh", "FullGhillie", 800000, { "", "", -1 } },
			{ "U_O_FullGhillie_lsh", "FullGhillie", 800000, { "", "", -1 } },
			{ "U_B_FullGhillie_lsh", "FullGhillie", 800000, { "", "", -1 } },
			{ "U_I_FullGhillie_sard", "FullGhillie", 800000, { "", "", -1 } },
			{ "U_O_FullGhillie_sard", "FullGhillie", 800000, { "", "", -1 } },
			{ "U_B_FullGhillie_sard", "FullGhillie", 800000, { "", "", -1 } },
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
			{ "G_Combat", "", 55, { "", "", -1 } },
			{ "G_Balaclava_blk", "", 1500, { "", "", -1 } },
			{ "G_Balaclava_combat", "", 1500, { "", "", -1 } },
			{ "G_Balaclava_lowprofile", "", 1500, { "", "", -1 } },
			{ "G_Balaclava_oli", "", 1500, { "", "", -1 } }
		};

		vests[] = {
			{ "NONE", "Remove Vest", 0, { "", "", -1 } },
			{ "V_Rangemaster_belt", "", 10000, { "", "", -1 } }
		};

		backpacks[] = {
			{ "NONE", "Remove Backpack", 0, { "", "", -1 } },
			{ "B_Parachute", "", 1000, { "", "", -1 } },
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
};