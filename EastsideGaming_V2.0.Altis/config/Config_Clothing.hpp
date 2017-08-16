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
*   DLC Clothing Items added by [TIG] Alex
*
*/
class Clothing {
    class bruce {
        title = "STR_Shops_C_Bruce";
        conditions = "";
        side = "civ";
        uniforms[] = {
            { "U_C_Poloshirt_stripped", "", 125, "" },
            { "U_C_Poloshirt_redwhite", "", 150, "" },
            { "U_C_Poloshirt_salmon", "", 175, "" },
            { "U_C_Poloshirt_blue", "", 250, "" },
            { "U_C_Poor_2", "", 250, "" },
            { "U_C_Poloshirt_burgundy", "", 275, "" },
            { "U_C_Poloshirt_tricolour", "", 350, "" },
            { "U_IG_Guerilla2_2", "", 650, "" },
            { "U_IG_Guerilla3_1", "", 735, "" },
            { "U_OrestesBody", "", 1100, "" },
            { "U_IG_Guerilla2_3", "", 1200, "" },
            { "U_C_HunterBody_grn", "", 1500, "" },
            { "U_C_WorkerCoveralls", "", 2500, "" },
            { "U_C_Man_casual_1_F", "", 1000, "" },
            { "U_C_Man_casual_2_F", "", 1000, "" }, //Apex DLC
            { "U_C_Man_casual_3_F", "", 1000, "" }, //Apex DLC
            { "U_C_Man_casual_4_F", "", 1000, "" }, //Apex DLC
            { "U_C_Man_casual_5_F", "", 1000, "" }, //Apex DLC
            { "U_C_Man_casual_6_F", "", 1000, "" }, //Apex DLC
            { "U_C_man_sport_1_F", "", 1000, "" }, //Apex DLC
            { "U_C_man_sport_2_F", "", 1000, "" }, //Apex DLC
            { "U_C_man_sport_3_F", "", 1000, "" } //Apex DLC
        };
        headgear[] = {
            { "NONE", "Hut entfernen", 0, "" },
            { "H_Bandanna_camo", "Camo Bandanna", 120, "" },
            { "H_Bandanna_surfer", "Surfer Bandanna", 130, "" },
            { "H_Bandanna_surfer", "", 135, "" },
            { "H_Bandanna_khk", "Khaki Bandanna", 145, "" },
            { "H_Cap_blu", "", 150, "" },
            { "H_Cap_grn", "", 150, "" },
            { "H_Cap_grn_BI", "", 150, "" },
            { "H_Cap_oli", "", 150, "" },
            { "H_Cap_red", "", 150, "" },
            { "H_Cap_tan", "", 150, "" },
            { "H_Helmet_Skate", "", 150, "" }, //Apex DLC
            { "H_Bandanna_gry", "Grey Bandanna", 150, "" },
            { "H_Bandanna_sgg", "Sage Bandanna", 160, "" },
            { "H_Bandanna_cbr", "", 165, "" },
            { "H_StrawHat", "Straw Fedora", 225, "" },
            { "H_Hat_tan", "", 265, "" },
            { "H_Hat_brown", "", 276, "" },
            { "H_Hat_grey", "", 280, "" },
            { "H_BandMask_blk", "Hat & Bandanna", 300, "" },
            { "H_Hat_blue", "", 310, "" },
            { "H_Hat_checker", "", 340, "" },
            { "H_Booniehat_grn", "", 425, "" }
        };
        goggles[] = {
            { "NONE", "Hut entfernen", 0, "" },
            { "G_Shades_Black", "", 20, "" },
            { "G_Shades_Blue", "", 20, "" },
            { "G_Shades_Green", "", 20, "" },
            { "G_Shades_Red", "", 20, "" },
            { "G_Sport_Blackred", "", 25, "" },
            { "G_Sport_BlackWhite", "", 25, "" },
            { "G_Sport_Blackyellow", "", 25, "" },
            { "G_Sport_Checkered", "", 25, "" },
            { "G_Sport_Greenblack", "", 25, "" },
            { "G_Sport_Red", "", 25, "" },
            { "G_Lowprofile", "", 30, "" },
            { "G_Squares", "", 50, "" },
            { "G_Aviator", "", 100, "" },
            { "G_Combat", "", 125, "" },
            { "G_Lady_Mirror", "", 150, "" },
            { "G_Lady_Dark", "", 150, "" },
            { "G_Lady_Blue", "", 150, "" }
        };
        vests[] = {
            { "NONE", "Weste entfernen", 0, "" }
        };
        backpacks[] = {
            { "NONE", "Rucksack entfernen", 0, "" },
            { "B_OutdoorPack_blk", "", 500, "" },
            { "B_AssaultPack_khk", "", 2500, "" },
            { "B_AssaultPack_dgtl", "", 2500, "" },
            { "B_AssaultPack_rgr", "", 2500, "" },
            { "B_AssaultPack_sgg", "", 2500, "" },
            { "B_AssaultPack_blk", "", 2500, "" },
            { "B_AssaultPack_cbr", "", 2500, "" },
            { "B_AssaultPack_mcamo", "", 2500, "" },
            { "B_AssaultPack_tna_f", "", 2500, "" }, //Apex DLC
            { "B_TacticalPack_oli", "", 3500, "" },
            { "B_Kitbag_mcamo", "", 4250, "" },
            { "B_Kitbag_sgg", "", 4250, "" },
            { "B_Kitbag_cbr", "", 4250, "" },
            { "B_FieldPack_blk", "", 3500, "" },
            { "B_FieldPack_ocamo", "", 3500, "" },
            { "B_FieldPack_oucamo", "", 3500, "" },
            { "B_FieldPack_ghex_f", "", 3500, "" }, //Apex DLC
            { "B_Bergen_sgg", "", 6000, "" },
            { "B_Bergen_mcamo", "", 6000, "" },
            { "B_Bergen_rgr", "", 6000, "" },
            { "B_Bergen_blk", "", 6000, "" },
            { "B_Carryall_ocamo", "", 5000, "" },
            { "B_Carryall_oucamo", "", 5000, "" },
            { "B_Carryall_mcamo", "", 5000, "" },
            { "B_Carryall_oli", "", 5000, "" },
            { "B_Carryall_khk", "", 5000, "" },
            { "B_Carryall_cbr", "", 5000, "" },
            { "B_Carryall_ghex_f", "", 5000, "" }, //Apex DLC
            { "B_Bergen_dgtl_f", "", 6000, "" }, //Apex DLC
            { "B_Bergen_tna_f", "", 6000, "" } //Apex DLC
        };
    };

	class reb {
        title = "STR_Shop_C_Terror";
		   conditions = "license_civ_rebel";
        side = "civ";
        uniforms[] = {
      			{ "U_B_CombatUniform_mcam", "", 10000, "" },
      			{ "U_B_CombatUniform_mcam_tshirt", "", 10000, "" },
      			{ "U_B_CombatUniform_mcam_vest", "", 10000, "" },
      			{ "U_B_HeliPilotCoveralls", "", 10000, "" },
      			{ "U_O_CombatUniform_ocamo", "", 10000, "" },
      			{ "U_O_PilotCoveralls", "", 10000, "" },
      			{ "U_B_CombatUniform_mcam_worn", "", 10000, "" },
      			{ "U_B_SpecopsUniform_sgg", "", 10000, "" },
      			{ "U_B_PilotCoveralls", "", 10000, "" },
      			{ "U_O_CombatUniform_oucamo", "", 10000, "" },
      			{ "U_O_SpecopsUniform_ocamo", "", 10000, "" },
      			{ "U_O_SpecopsUniform_blk", "", 10000, "" },
      			{ "U_O_OfficerUniform_ocamo", "", 10000, "" },
				{ "U_I_CombatUniform", "", 10000, "" },
      			{ "U_I_CombatUniform_tshirt", "", 10000, "" },
      			{ "U_I_CombatUniform_shortsleeve", "", 10000, "" },
      			{ "U_I_pilotCoveralls", "", 10000, "" },
      			{ "U_I_HeliPilotCoveralls", "", 10000, "" },
      			{ "U_I_OfficerUniform", "", 10000, "" },
      			{ "U_IG_leader", "", 10000, "" },
      			{ "U_BG_Guerilla1_1", "", 10000, "" },
      			{ "U_IG_Guerilla2_1", "", 10000, "" },
      			{ "U_IG_Guerilla2_2", "", 10000, "" },
      			{ "U_IG_Guerilla2_3", "", 10000, "" },
      			{ "U_O_GhillieSuit", "", 75000, "" },
      			{ "U_I_GhillieSuit", "", 75000, "" },
      			{ "U_O_FullGhillie_lsh", "", 100000, "" },
      			{ "U_I_FullGhillie_lsh", "", 100000, "" },
      			{ "U_O_FullGhillie_sard", "", 100000, "" },
      			{ "U_I_FullGhillie_sard", "", 100000, "" },
      			{ "U_O_FullGhillie_ard", "", 100000, "" },
      			{ "U_I_FullGhillie_ard", "", 100000, "" },
      			{ "U_O_T_FullGhillie_tna_F", "", 100000, "" }
        };

        headgear[] = {
            { "NONE", "Hut entfernen", 0, "" },
      			{ "H_Bandanna_camo", "", 300, "" },
      			{ "H_Bandanna_mcamo", "", 300, "" },
      			{ "H_Watchcap_blk", "", 500, "" },
      			{ "H_Watchcap_cbr", "", 500, "" },
      			{ "H_Watchcap_khk", "", 500, "" },
      			{ "H_Watchcap_camo", "", 500, "" },
      			{ "H_Watchcap_sgg", "", 500, "" },
      			{ "H_MilCap_ocamo", "", 1000, "" },
      			{ "H_MilCap_mcamo", "", 1000, "" },
      			{ "H_MilCap_oucamo", "", 1000, "" },
      			{ "H_MilCap_rucamo", "", 1000, "" },
      			{ "H_MilCap_gry", "", 1000, "" },
      			{ "H_MilCap_dgtl", "", 1000, "" },
      			{ "H_MilCap_tna_F", "", 1000, "" },
      			{ "H_MilCap_ghex_F", "", 1000, "" },
            { "H_Booniehat_indp", "", 1000, "" },
      			{ "H_Booniehat_mcamo", "", 1000, "" },
      			{ "H_Booniehat_grn", "", 1000, "" },
      			{ "H_Booniehat_tna_F", "", 1000, "" },
      			{ "H_HelmetB_plain_mcamo", "", 1500, "" },
      			{ "H_HelmetIA", "", 1500, "" },
      			{ "H_HelmetB_tna_F", "", 1500, "" },
      			{ "H_HelmetB_Enh_tna_F", "", 1500, "" },
      			{ "H_HelmetB_Light_tna_F", "", 1500, "" },
      			{ "H_HelmetCrew_O", "", 2000, "" },
      			{ "H_HelmetCrew_I", "", 2000, "" },
      			{ "H_Shemag_khk", "", 2000, "" },
      			{ "H_Shemag_tan", "", 2000, "" },
      			{ "H_Shemag_olive", "", 2000, "" },
      			{ "H_Shemag_olive_hs", "", 2010, "" },
      			{ "H_ShemagOpen_khk", "", 2000, "" },
      			{ "H_ShemagOpen_tan", "", 2000, "" },
      			{ "H_HelmetO_ocamo", "", 3000, "" },
      			{ "H_HelmetLeaderO_ocamo", "", 3000, "" },
      			{ "H_HelmetO_oucamo", "", 3000, "" },
      			{ "H_HelmetLeaderO_oucamo", "", 3000, "" },
      			{ "H_HelmetSpecO_ocamo", "", 3000, "" },
      			{ "H_HelmetSpecO_blk", "", 3000	, "" },
      			{ "H_HelmetSpecO_ghex_F", "", 3000, "" },
      			{ "H_HelmetO_ghex_F", "", 3000, "" },
      			{ "H_PilotHelmetHeli_O", "", 4500, "" },
      			{ "H_PilotHelmetHeli_I", "", 4500, "" },
      			{ "H_PilotHelmetFighter_O", "", 5000, "" },
      			{ "H_PilotHelmetFighter_I", "", 5000, "" },
      			{ "H_CrewHelmetHeli_O", "", 5000, "" },
      			{ "H_CrewHelmetHeli_I", "", 5000, "" }
        };

        goggles[] = {
            { "NONE", "Hut entfernen", 0, "" },
			      { "G_Squares", "", 25, "" },
            { "G_Shades_Blue", "", 25, "" },
            { "G_Sport_Blackred", "", 25, "" },
            { "G_Sport_Checkered", "", 25, "" },
            { "G_Sport_Blackyellow", "", 25, "" },
            { "G_Sport_BlackWhite", "", 25, "" },
            { "G_Shades_Black", "", 25, "" },
            { "G_Lowprofile", "", 25, "" },
            { "G_Combat", "", 25, "" },
            { "G_Aviator", "", 25, "" },
            { "G_Lady_Mirror", "", 25, "" },
            { "G_Lady_Dark", "", 25, "" },
            { "G_Lady_Blue", "", 25, "" },
            { "G_Balaclava_blk", "", 100, "" },
      			{ "G_Balaclava_oli", "", 100, "" },
      			{ "G_Balaclava_lowprofile", "", 120, "" },
      			{ "G_Balaclava_combat", "", 200, "" },
      			{ "G_Bandanna_aviator", "", 250, "" },
      			{ "G_Bandanna_beast", "", 250, "" },
      			{ "G_Bandanna_tan", "", 250, "" },
      			{ "G_Bandanna_sport", "", 250, "" },
      			{ "G_Bandanna_blk", "", 250, "" },
      			{ "G_Bandanna_oli", "", 250, "" },
      			{ "G_Bandanna_shades", "", 250, "" }
        };

        vests[] = {
            { "NONE", "Weste entfernen", 0, "" },
      			{ "V_BandollierB_khk", "", 25000, "" },
            { "V_BandollierB_cbr", "", 25000, "" },
            { "V_BandollierB_rgr", "", 25000, "" },
            { "V_BandollierB_oli", "", 25000, "" },
            { "V_Chestrig_khk", "", 25000, "" },
            { "V_Chestrig_rgr", "", 25000, "" },
            { "V_Chestrig_oli", "", 25000, "" },
            { "V_HarnessO_brn", "", 25000, "" },
            { "V_HarnessOGL_brn", "", 25000, "" },
            { "V_HarnessO_gry", "", 25000, "" },
            { "V_HarnessOGL_gry", "", 25000, "" },
            { "V_HarnessOSpec_brn", "", 25000, "" },
            { "V_HarnessOSpec_gry", "", 25000, "" },
            { "V_PlateCarrierIAGL_dgtl", "", 25000, "" },
            { "V_PlateCarrierGL_rgr", "", 25000, "" },
            { "V_TacVest_khk", "", 50000, "" },
            { "V_TacVest_brn", "", 50000, "" },
            { "V_TacVest_oli", "", 50000, "" },
            { "V_TacVest_camo", "", 50000, "" },
            { "V_PlateCarrier_Kerry", "", 85000, "" },
            { "V_PlateCarrierIA1_dgtl", "", 85000, "" },
            { "V_PlateCarrierIA2_dgtl", "", 85000, "" },
            { "V_PlateCarrier1_rgr", "", 85000, "" },
            { "V_PlateCarrier2_rgr", "", 100000, "" },
            { "V_PlateCarrier3_rgr", "", 100000, "" },
            { "V_PlateCarrierSpec_rgr", "", 150000, "" },
            { "V_PlateCarrierSpec_mtp", "", 150000, "" }
        };

        backpacks[] = {
            { "NONE", "Rucksack entfernen", 0, "" },
            { "B_OutdoorPack_blk", "", 500, "" },
            { "B_AssaultPack_khk", "", 2500, "" },
            { "B_AssaultPack_dgtl", "", 2500, "" },
            { "B_AssaultPack_rgr", "", 2500, "" },
            { "B_AssaultPack_sgg", "", 2500, "" },
            { "B_AssaultPack_blk", "", 2500, "" },
            { "B_AssaultPack_cbr", "", 2500, "" },
            { "B_AssaultPack_mcamo", "", 2500, "" },
            { "B_AssaultPack_tna_f", "", 2500, "" }, //Apex DLC
            { "B_TacticalPack_oli", "", 3500, "" },
            { "B_Kitbag_mcamo", "", 4250, "" },
            { "B_Kitbag_sgg", "", 4250, "" },
            { "B_Kitbag_cbr", "", 4250, "" },
            { "B_FieldPack_blk", "", 3500, "" },
            { "B_FieldPack_ocamo", "", 3500, "" },
            { "B_FieldPack_oucamo", "", 3500, "" },
            { "B_FieldPack_ghex_f", "", 3500, "" }, //Apex DLC
            { "B_Bergen_sgg", "", 6000, "" },
            { "B_Bergen_mcamo", "", 6000, "" },
            { "B_Bergen_rgr", "", 6000, "" },
            { "B_Bergen_blk", "", 6000, "" },
            { "B_Carryall_ocamo", "", 5000, "" },
            { "B_Carryall_oucamo", "", 5000, "" },
            { "B_Carryall_mcamo", "", 5000, "" },
            { "B_Carryall_oli", "", 5000, "" },
            { "B_Carryall_khk", "", 5000, "" },
            { "B_Carryall_cbr", "", 5000, "" },
            { "B_Carryall_ghex_f", "", 5000, "" }, //Apex DLC
            { "B_Bergen_dgtl_f", "", 6000, "" }, //Apex DLC
            { "B_Bergen_tna_f", "", 6000, "" } //Apex DLC
        };
    };

    class cop {
        title = "STR_Shops_C_Police";
        conditions = "";
        side = "cop";
        uniforms[] = {
            { "U_Rangemaster", "Polizei Uniform", 25, "call life_coplevel isEqualTo 1" },
            { "U_I_CombatUniform", "Polizei Uniform (Lang)", 25, "call life_coplevel >= 2" },
            { "U_I_CombatUniform_shortsleeve", "Polizei Uniform (Kurz)", 25, "call life_coplevel >= 2" },
            { "U_B_CombatUniform_mcam_tshirt", "Polizei Uniform (Taucher)", 25, "call life_coplevel >= 4" },
            { "U_B_CombatUniform_mcam", "Polizei Uniform (Lang)", 25, "call life_coplevel >= 5" },
            { "U_B_CombatUniform_mcam_vest", "Polizei Uniform (Kurz)", 25, "call life_coplevel >= 5" }
        };
        headgear[] = {
            { "NONE", "Hut entfernen", 0, "" },
            { "H_Cap_police", "", 25, "" },
            { "H_Beret_blk_POLICE", "", 25, "call life_coplevel >= 2" },
            { "H_Beret_02", "", 25, "call life_coplevel >= 3" },
            { "H_Beret_Colonel", "", 25, "call life_coplevel >= 7" },
            { "H_Watchcap_blk", "", 25, "call life_coplevel >= 3" },
            { "H_Watchcap_cbr", "", 25, "call life_coplevel >= 3" },
            { "H_Watchcap_khk", "", 25, "call life_coplevel >= 3" },
            { "H_Watchcap_camo", "", 25, "call life_coplevel >= 3" },
            { "H_Watchcap_sgg", "", 25, "call life_coplevel >= 3" },
            { "H_StrawHat", "", 25, "call life_coplevel >= 5" },
            { "H_StrawHat_dark", "", 25, "call life_coplevel >= 5" },
            { "H_Hat_grey", "", 25, "call life_coplevel >= 5" },
            { "H_Booniehat_tna_F", "", 25, "call life_coplevel >= 3" },
            { "H_HelmetSpecB_sand", "", 25, "call life_coplevel >= 5" },
            { "H_Booniehat_mcamo", "", 25, "call life_coplevel >= 3" },
            { "H_Booniehat_tan", "", 25, "call life_coplevel >= 3" }

        };
        goggles[] = {
            { "NONE", "Hut entfernen", 0, "" },
            { "G_Shades_Black", "", 20, "" },
            { "G_Shades_Blue", "", 20, "" },
            { "G_Shades_Green", "", 20, "" },
            { "G_Shades_Red", "", 20, "" },
            { "G_Sport_Blackred", "", 25, "" },
            { "G_Sport_BlackWhite", "", 25, "" },
            { "G_Sport_Blackyellow", "", 25, "" },
            { "G_Sport_Checkered", "", 25, "" },
            { "G_Sport_Greenblack", "", 25, "" },
            { "G_Sport_Red", "", 25, "" },
            { "G_Lowprofile", "", 30, "" },
            { "G_Squares", "", 50, "" },
            { "G_Aviator", "", 100, "" },
            { "G_Combat", "", 125, "" },
            { "G_Lady_Mirror", "", 150, "" },
            { "G_Lady_Dark", "", 150, "" },
			{ "G_Goggles_VR", "", 150, "" },
            { "G_Lady_Blue", "", 150, "" }
        };
        vests[] = {
            { "NONE", "Weste entfernen", 0, "" },
            { "V_TacVest_blk_POLICE", "", 25, "call life_coplevel >= 1" },
            { "V_PlateCarrier1_blk", "", 25, "call life_coplevel >= 3" },
			      { "V_PlateCarrier2_blk", "", 25, "call life_coplevel >= 4" },
			      { "V_PlateCarrierSpec_blk", "", 25, "call life_coplevel >= 5" }
        };
        backpacks[] = {
            { "NONE", "Rucksack entfernen", 0, "" },
            { "B_FieldPack_cbr", "", 500, "" },
            { "B_AssaultPack_cbr", "", 700, "" },
            { "B_Kitbag_cbr", "", 800, "" },
            { "B_Bergen_sgg", "", 2500, "" },
            { "B_Carryall_cbr", "", 3500, "" },
			{ "B_Bergen_dgtl_f", "", 6000, "" }, //Apex DLC
            { "B_Bergen_tna_f", "", 6000, "" }
        };
    };

    class dive {
        title = "STR_Shops_C_Diving";
		conditions = "license_civ_dive";
        side = "civ";
        uniforms[] = {
            { "U_B_Wetsuit", "", 2000, "" }
        };
        headgear[] = {
            { "NONE", "Hut entfernen", 0, "" }
        };
        goggles[] = {
            { "NONE", "Brille entfernen", 0, "" },
            { "G_Diving", "", 500, "" }
        };
        vests[] = {
            { "NONE", "Weste entfernen", 0, "" },
            { "V_RebreatherB", "", 5000, "" }
        };
        backpacks[] = {
            { "NONE", "Rucksack entfernen", 0, "" }
        };
    };

    class gun_clothing {
        title = "STR_Shops_C_Gun";
		      conditions = "license_civ_gun";
        side = "civ";
        uniforms[] = {
        };
        headgear[] = {
            { "NONE", "Hut entfernen", 0, "" }
        };
        goggles[] = {
            { "NONE", "Brille entfernen", 0, "" }
        };
        vests[] = {
            { "NONE", "Weste entfernen", 0, "" },
            { "V_Rangemaster_belt", "", 4900, "" }
        };
        backpacks[] = {
            { "NONE", "Rucksack entfernen", 0, "" }
        };
    };

    class gang_clothing {
        title = "STR_Shops_C_Gang";
        conditions = "";
        side = "civ";
        uniforms[] = {
            { "U_C_Poloshirt_stripped", "", 125, "" },
            { "U_C_Poloshirt_redwhite", "", 150, "" },
            { "U_C_Poloshirt_salmon", "", 175, "" },
            { "U_C_Poloshirt_blue", "", 250, "" },
            { "U_C_Poor_2", "", 250, "" },
            { "U_C_Poloshirt_burgundy", "", 275, "" },
            { "U_C_Poloshirt_tricolour", "", 350, "" },
            { "U_IG_Guerilla2_2", "", 650, "" },
            { "U_IG_Guerilla3_1", "", 735, "" },
            { "U_OrestesBody", "", 1100, "" },
            { "U_IG_Guerilla2_3", "", 1200, "" },
            { "U_C_HunterBody_grn", "", 1500, "" },
            { "U_C_WorkerCoveralls", "", 2500, "" },
            { "U_C_Man_casual_1_F", "", 1000, "" },
            { "U_C_Man_casual_2_F", "", 1000, "" }, //Apex DLC
            { "U_C_Man_casual_3_F", "", 1000, "" }, //Apex DLC
            { "U_C_Man_casual_4_F", "", 1000, "" }, //Apex DLC
            { "U_C_Man_casual_5_F", "", 1000, "" }, //Apex DLC
            { "U_C_Man_casual_6_F", "", 1000, "" }, //Apex DLC
            { "U_C_man_sport_1_F", "", 1000, "" }, //Apex DLC
            { "U_C_man_sport_2_F", "", 1000, "" }, //Apex DLC
            { "U_C_man_sport_3_F", "", 1000, "" } //Apex DLC
        };
        headgear[] = {
            { "NONE", "Hut entfernen", 0, "" },
            { "H_Bandanna_camo", "Camo Bandanna", 120, "" },
            { "H_Bandanna_surfer", "Surfer Bandanna", 130, "" },
            { "H_Bandanna_surfer", "", 135, "" },
            { "H_Bandanna_khk", "Khaki Bandanna", 145, "" },
            { "H_Cap_blu", "", 150, "" },
            { "H_Cap_grn", "", 150, "" },
            { "H_Cap_grn_BI", "", 150, "" },
            { "H_Cap_oli", "", 150, "" },
            { "H_Cap_red", "", 150, "" },
            { "H_Cap_tan", "", 150, "" },
            { "H_Helmet_Skate", "", 150, "" }, //Apex DLC
            { "H_Bandanna_gry", "Grey Bandanna", 150, "" },
            { "H_Bandanna_sgg", "Sage Bandanna", 160, "" },
            { "H_Bandanna_cbr", "", 165, "" },
            { "H_StrawHat", "Straw Fedora", 225, "" },
            { "H_Hat_tan", "", 265, "" },
            { "H_Hat_brown", "", 276, "" },
            { "H_Hat_grey", "", 280, "" },
            { "H_BandMask_blk", "Hat & Bandanna", 300, "" },
            { "H_Hat_blue", "", 310, "" },
            { "H_Hat_checker", "", 340, "" },
            { "H_Booniehat_grn", "", 425, "" }
        };
        goggles[] = {
            { "NONE", "Hut entfernen", 0, "" },
            { "G_Shades_Black", "", 20, "" },
            { "G_Shades_Blue", "", 20, "" },
            { "G_Shades_Green", "", 20, "" },
            { "G_Shades_Red", "", 20, "" },
            { "G_Sport_Blackred", "", 25, "" },
            { "G_Sport_BlackWhite", "", 25, "" },
            { "G_Sport_Blackyellow", "", 25, "" },
            { "G_Sport_Checkered", "", 25, "" },
            { "G_Sport_Greenblack", "", 25, "" },
            { "G_Sport_Red", "", 25, "" },
            { "G_Lowprofile", "", 30, "" },
            { "G_Squares", "", 50, "" },
            { "G_Aviator", "", 100, "" },
            { "G_Combat", "", 125, "" },
            { "G_Lady_Mirror", "", 150, "" },
            { "G_Lady_Dark", "", 150, "" },
            { "G_Lady_Blue", "", 150, "" }
        };
        vests[] = {
            { "NONE", "Weste entfernen", 0, "" }
        };
        backpacks[] = {
            { "NONE", "Rucksack entfernen", 0, "" },
            { "B_OutdoorPack_blk", "", 500, "" },
            { "B_AssaultPack_khk", "", 2500, "" },
            { "B_AssaultPack_dgtl", "", 2500, "" },
            { "B_AssaultPack_rgr", "", 2500, "" },
            { "B_AssaultPack_sgg", "", 2500, "" },
            { "B_AssaultPack_blk", "", 2500, "" },
            { "B_AssaultPack_cbr", "", 2500, "" },
            { "B_AssaultPack_mcamo", "", 2500, "" },
            { "B_AssaultPack_tna_f", "", 2500, "" }, //Apex DLC
            { "B_TacticalPack_oli", "", 3500, "" },
            { "B_Kitbag_mcamo", "", 4250, "" },
            { "B_Kitbag_sgg", "", 4250, "" },
            { "B_Kitbag_cbr", "", 4250, "" },
            { "B_FieldPack_blk", "", 3500, "" },
            { "B_FieldPack_ocamo", "", 3500, "" },
            { "B_FieldPack_oucamo", "", 3500, "" },
            { "B_FieldPack_ghex_f", "", 3500, "" }, //Apex DLC
            { "B_Bergen_sgg", "", 6000, "" },
            { "B_Bergen_mcamo", "", 6000, "" },
            { "B_Bergen_rgr", "", 6000, "" },
            { "B_Bergen_blk", "", 6000, "" },
            { "B_Carryall_ocamo", "", 5000, "" },
            { "B_Carryall_oucamo", "", 5000, "" },
            { "B_Carryall_mcamo", "", 5000, "" },
            { "B_Carryall_oli", "", 5000, "" },
            { "B_Carryall_khk", "", 5000, "" },
            { "B_Carryall_cbr", "", 5000, "" },
            { "B_Carryall_ghex_f", "", 5000, "" }, //Apex DLC
            { "B_Bergen_dgtl_f", "", 6000, "" }, //Apex DLC
            { "B_Bergen_tna_f", "", 6000, "" } //Apex DLC
        };
    };

    class med_clothing {
        title = "STR_MAR_EMS_Clothing_Shop";
        conditions = "";
        side = "med";
        uniforms[] = {
			       { "U_I_CombatUniform", "Feuerwehr Uniform (Lang)", 0, "" },
             { "U_I_CombatUniform_shortsleeve", "Feuerwehr Uniform (Kurz)", 0, "" }
        };
        headgear[] = {
            { "NONE", "Hut entfernen", 0, "" },
            { "H_Booniehat_khk", "", 100, "" },
      			{ "H_Cap_blu", "", 100, "" },
      			{ "H_Cap_oli", "", 100, "" },
      			{ "H_Cap_grn", "", 100, "" },
      			{ "H_Bandanna_mcamo", "", 100, "" },
      			{ "H_Watchcap_khk", "", 100, "" },
      			{ "H_StrawHat", "", 100, "" },
      			{ "H_Hat_blue", "", 100, "" },
      			{ "H_Hat_checker", "", 100, "" },
      			{ "H_Hat_grey", "", 100, "" }
        };
        goggles[] = {
            { "NONE", "Hut entfernen", 0, "" },
            { "G_Shades_Black", "", 100, "" },
      			{ "G_Shades_Blue", "", 100, "" },
      			{ "G_Sport_Blackred", "", 100, "" },
      			{ "G_Sport_Checkered", "", 100, "" },
      			{ "G_Sport_Blackyellow", "", 100, "" },
      			{ "G_Sport_BlackWhite", "", 100, "" },
      			{ "G_Squares", "", 100, "" },
      			{ "G_Aviator", "", 100, "" },
      			{ "G_Lady_Mirror", "", 100, "" },
      			{ "G_Lady_Dark", "", 100, "" },
      			{ "G_Lady_Blue", "", 100, "" },
      			{ "G_Lowprofile", "", 100, "" },
      			{ "G_Combat", "", 100, "" }
        };
        vests[] = {
            { "NONE", "Weste entfernen", 0, "" },
			      { "V_RebreatherIR", "", 0, "" }
        };
        backpacks[] = {
            { "NONE", "Rucksack entfernen", 0, "" },
            { "B_AssaultPack_cbr", "", 100, "" },
      			{ "B_Kitbag_mcamo", "", 100, "" },
      			{ "B_TacticalPack_oli", "", 100, "" },
      			{ "B_FieldPack_ocamo", "", 100, "" },
      			{ "B_Bergen_sgg", "", 100, "" },
      			{ "B_Kitbag_cbr", "", 100, "" },
      			{ "B_Carryall_oli", "", 100, "" },
      			{ "B_Carryall_khk", "", 100, "" },
				{ "B_Bergen_dgtl_f", "", 6000, "" }, //Apex DLC
				{ "B_Bergen_tna_f", "", 6000, "" }
        };
    };

    class kart {
        title = "STR_Shops_C_Kart";
        conditions = "";
        side = "civ";
        uniforms[] = {
            { "U_C_Driver_1_black", "", 1500, "" },
            { "U_C_Driver_1_blue", "", 1500, "" },
            { "U_C_Driver_1_red", "", 1500, "" },
            { "U_C_Driver_1_orange", "", 1500, "" },
            { "U_C_Driver_1_green", "", 1500, "" },
            { "U_C_Driver_1_white", "", 1500, "" },
            { "U_C_Driver_1_yellow", "", 1500, "" },
            { "U_C_Driver_2", "", 3500, "" },
            { "U_C_Driver_1", "", 3600, "" },
            { "U_C_Driver_3", "", 3700, "" },
            { "U_C_Driver_4", "", 3700, "" }
        };
        headgear[] = {
            { "NONE", "Hut entfernen", 0, "" },
            { "H_RacingHelmet_1_black_F", "", 1000, "" },
            { "H_RacingHelmet_1_red_F", "", 1000, "" },
            { "H_RacingHelmet_1_white_F", "", 1000, "" },
            { "H_RacingHelmet_1_blue_F", "", 1000, "" },
            { "H_RacingHelmet_1_yellow_F", "", 1000, "" },
            { "H_RacingHelmet_1_green_F", "", 1000, "" },
            { "H_RacingHelmet_1_F", "", 2500, "" },
            { "H_RacingHelmet_2_F", "", 2500, "" },
            { "H_RacingHelmet_3_F", "", 2500, "" },
            { "H_RacingHelmet_4_F", "", 2500, "" }
        };
        goggles[] = {
            { "NONE", "Brille entfernen", 0, "" }
        };
        vests[] = {
            { "NONE", "Weste entfernen", 0, "" }
        };
        backpacks[] = {
            { "NONE", "Rucksack entfernen", 0, "" }
        };
    };
};
