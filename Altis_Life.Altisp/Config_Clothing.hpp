/*
*    ARRAY FORMAT:
*        0: STRING (Classname)
*        1: STRING (Display Name, leave as "" for default)
*        2: SCALAR (Price)Właściciel Acid
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
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
            { "U_C_Poloshirt_stripped", "ALN", 100, { "", "", -1 } },
            { "U_C_Poloshirt_redwhite", "Ananas", 100, { "", "", -1 } },
            { "U_C_Poloshirt_salmon", "Fuck World", 100, { "", "", -1 } },
            { "U_C_Poloshirt_blue", "Poloshirt Blue", 250, { "", "", -1 } },
            { "U_Rangemaster", "Garnitur aln", 250, { "", "", -1 } },
			{ "U_C_ConstructionCoverall_Blue_F", "Pracownik", 250, { "", "", -1 } },
			{ "U_I_C_Soldier_Bandit_2_F", "Bandyta", 250, { "", "", -1 } },
            { "U_C_Poloshirt_burgundy", "Poloshirt Burgundy", 250, { "", "", -1 } },
            { "U_C_Poloshirt_tricolour", "Poloshirt Tricolor", 250, { "", "", -1 } },
            { "U_C_man_sport_1_F", "", 250, { "", "", -1 } },
            { "U_C_man_sport_2_F", "", 250, { "", "", -1 } },
            { "U_C_man_sport_3_F", "", 250, { "", "", -1 } },
            { "U_C_Man_casual_4_F", "", 250, { "", "", -1 } },
            { "U_C_Man_casual_5_F", "", 250, { "", "", -1 } },
            { "U_C_Man_casual_6_F", "", 250, { "", "", -1 } },
            { "U_IG_Guerilla2_2", "Green stripped shirt & Pants", 500, { "", "", -1 } },
            { "U_IG_Guerilla3_1", "Brown Jacket & Pants", 500, { "", "", -1 } },
            { "U_Competitor", "", 500, { "", "", -1 } },
            { "U_OrestesBody", "Surfing On Land", 500, { "", "", -1 } },
            { "U_C_Man_casual_1_F", "", 500, { "", "", -1 } },
            { "U_C_Man_casual_2_F", "", 500, { "", "", -1 } },
            { "U_C_Man_casual_3_F", "", 500, { "", "", -1 } },
            { "U_NikosBody", "", 1000, { "", "", -1 } },
			{ "U_NikosAgedBody", "", 2000, { "", "", -1 } }
			
        };
        headgear[] = {
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } },
			{ "H_HeadSet_black_F", "Słuchawki", 100, { "", "", -1 } },
			{ "H_Construction_basic_orange_F", "Kask", 150, { "", "", -1 } },
            { "H_Bandanna_surfer", "", 100, { "", "", -1 } },
            { "H_Bandanna_khk", "Khaki Bandanna", 100, { "", "", -1 } },
            { "H_Cap_blu", "", 100, { "", "", -1 } },
            { "H_Cap_grn", "", 100, { "", "", -1 } },
            { "H_Cap_grn_BI", "", 100, { "", "", -1 } },
            { "H_Cap_oli", "", 100, { "", "", -1 } },
            { "H_Cap_red", "", 100, { "", "", -1 } },
            { "H_Cap_tan", "", 100, { "", "", -1 } },
            { "H_Bandanna_sgg", "Sage Bandanna", 100, { "", "", -1 } },
            { "H_Bandanna_cbr", "", 100, { "", "", -1 } },
            { "H_StrawHat", "Straw Fedora", 100, { "", "", -1 } },
            { "H_Hat_tan", "", 100, { "", "", -1 } },
            { "H_Hat_brown", "", 100, { "", "", -1 } },
            { "H_Hat_grey", "", 100, { "", "", -1 } },
            { "H_BandMask_blk", "Hat & Bandanna", 100, { "", "", -1 } },
            { "H_Hat_blue", "", 100, { "", "", -1 } },
            { "H_Hat_checker", "", 100, { "", "", -1 } },
            { "H_Booniehat_tan", "", 100, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } },
            { "G_Shades_Black", "", 20, { "", "", -1 } },
            { "G_Shades_Blue", "", 20, { "", "", -1 } },
            { "G_Shades_Green", "", 20, { "", "", -1 } },
            { "G_Shades_Red", "", 20, { "", "", -1 } },
            { "G_Sport_Blackred", "", 25, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 25, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 25, { "", "", -1 } },
            { "G_Sport_Checkered", "", 25, { "", "", -1 } },
            { "G_Sport_Greenblack", "", 25, { "", "", -1 } },
            { "G_Sport_Red", "", 25, { "", "", -1 } },
            { "G_Lowprofile", "", 30, { "", "", -1 } },
            { "G_Squares", "", 50, { "", "", -1 } },
            { "G_Aviator", "", 100, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } },
			{ "V_BandollierB_khk", "", 4000, { "", "", -1 } },
			{ "V_Pocketed_coyote_F", "", 6000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } },
			{ "B_Messenger_Gray_F", "Listonosz", 900, { "", "", -1 } },
            { "B_AssaultPack_khk", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_rgr", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_sgg", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_cbr", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_mcamo", "", 2000, { "", "", -1 } },
            { "B_TacticalPack_oli", "", 2500, { "", "", -1 } },
            { "B_Kitbag_sgg", "", 3500, { "", "", -1 } },
            { "B_Kitbag_cbr", "", 3500, { "", "", -1 } },
            { "B_FieldPack_blk", "", 5000, { "", "", -1 } },
            { "B_FieldPack_ocamo", "", 5000, { "", "", -1 } },
            { "B_FieldPack_oucamo", "", 5000, { "", "", -1 } },
            { "B_Bergen_sgg", "", 6500, { "", "", -1 } },
            { "B_Bergen_mcamo", "", 6500, { "", "", -1 } },
            { "B_Bergen_rgr", "", 6500, { "", "", -1 } },
            { "B_Bergen_blk", "", 6500, { "", "", -1 } },
            { "B_Carryall_mcamo", "", 7500, { "", "", -1 } },
            { "B_Carryall_oli", "", 7500, { "", "", -1 } },
            { "B_Carryall_khk", "", 7500, { "", "", -1 } },
            { "B_Carryall_cbr", "", 7500, { "", "", -1 } },
			{ "B_Bergen_dgtl_F", "", 17500, { "", "", -1 } }
			
        };
    };

    class cop {
        title = "STR_Shops_C_Police";
        license = "";
        side = "cop";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
			{ "U_Rangemaster", "", 50, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam", "", 1000, { "life_coplevel", "SCALAR", -1 } },
            { "U_B_CombatUniform_mcam_worn", "", 1000, { "life_coplevel", "SCALAR", 3 } },
			{ "U_B_GEN_Soldier_F", "", 1000, { "life_coplevel", "SCALAR", 4 } },
            { "U_O_Wetsuit", "", 350, { "life_coplevel", "SCALAR", -1 } },
            { "U_B_GEN_Commander_F", "", 1000, { "life_coplevel", "SCALAR", 7 } },
            { "U_B_FullGhillie_ard", "", 1000, { "life_coplevel", "SCALAR", 8 } }           
        };
        headgear[] = {
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } },
            { "H_Cap_police", "", 100, { "life_coplevel", "SCALAR", 1 } },
            { "H_Bandanna_gry", "", 100, { "life_coplevel", "SCALAR", 4 } },
            { "H_Watchcap_blk", "", 100, { "life_coplevel", "SCALAR", 5 } },            
            { "H_Beret_blk", "", 100, { "life_coplevel", "SCALAR", 6 } },
            { "H_Beret_gen_F", "", 100, { "life_coplevel", "SCALAR", 7 } },
            { "H_HelmetB_light_black", "", 100, { "life_coplevel", "SCALAR", 8 } },
            { "H_HelmetB_sand", "", 100, { "life_coplevel", "SCALAR", 6 } },
            { "H_HelmetSpecB_blk", "", 100, { "life_coplevel", "SCALAR", 6 } },
            { "H_Beret_02", "", 100, { "life_coplevel", "SCALAR", 6 } },
            { "H_CrewHelmetHeli_B", "", 100, { "life_coplevel", "SCALAR", 7 } },
            { "H_Beret_Colonel", "", 100, { "life_coplevel", "SCALAR", 11 } }
        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } },
            { "G_Squares", "", 10, { "", "", -1 } },
            { "G_Shades_Black", "", 25, { "", "", -1 } },
            { "G_Lowprofile", "", 30, { "", "", -1 } },
			{ "G_Balaclava_TI_blk_F", "", 100, { "life_coplevel", "SCALAR", 6 } },
            { "G_Balaclava_blk", "", 100, { "life_coplevel", "SCALAR", 6 } },
			{ "G_Aviator", "", 100, { "", "", -1 } },
            { "G_Combat", "", 200, { "", "", -1 } },
			{ "G_Bandanna_blk", "", 200, { "life_coplevel", "SCALAR", 6 } },
			{ "G_B_Diving", "", 200, { "life_coplevel", "SCALAR", 2 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } },
			{ "V_Safety_yellow_F", "", 1000, { "", "", -1 } },
			{ "V_TacVest_blk_POLICE", "", 1000, { "", "", -1 } },
            { "V_RebreatherB", "", 1000, { "life_coplevel", "SCALAR", 2 } },
			{ "V_PlateCarrier1_blk", "", 5000, { "life_coplevel", "SCALAR", 4 } },
			{ "V_PlateCarrier2_blk", "", 5000, { "life_coplevel", "SCALAR", 6 } },
            { "V_PlateCarrierSpec_blk", "", 10000, { "life_coplevel", "SCALAR", 8 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } },
			{ "B_UAV_01_backpack_F", "", 500, { "life_coplevel", "SCALAR", 11 } },
			{ "B_AssaultPack_blk", "", 500, { "", "", -1 } },
            { "B_OutdoorPack_blk", "", 1000, { "", "", -1 } },
            { "B_Carryall_oucamo", "", 2000, { "", "", -1 } },
			{ "B_Bergen_hex_F", "", 5000, { "", "", -1 } },
			{ "B_Bergen_mcamo_F", "", 7500, { "", "", -1 } },
			{ "B_Bergen_dgtl_F", "", 17500, { "", "", -1 } },
            { "Steerable_Parachute_F", "", 2000, { "", "", -1 } }
        };
    };

	class cop_spec {
        title = "STR_Shops_C_Police";
        license = "";
        side = "cop";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
            { "U_O_Wetsuit", "", 350, { "life_coplevel", "SCALAR", 2 } },
            { "U_B_CombatUniform_mcam_vest", "Pol", 1000, { "life_coplevel", "SCALAR", -1 } },
            { "U_B_CombatUniform_mcam", "", 1000, { "life_coplevel", "SCALAR", -1 } },
            { "U_B_GEN_Soldier_F", "", 1000, { "life_coplevel", "SCALAR", -1 } },
            { "U_B_GEN_Commander_F", "", 1000, { "life_coplevel", "SCALAR", -1 } },
            { "U_B_GhillieSuit", "Ghillie BOA", 1000, { "life_coplevel", "SCALAR", 5 } }
        };
        headgear[] = {
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } },
            { "H_Cap_police", "", 100, { "life_coplevel", "SCALAR", 1 } },
            { "H_Bandanna_gry", "", 100, { "life_coplevel", "SCALAR", 2 } },
            { "H_Watchcap_blk", "", 100, { "life_coplevel", "SCALAR", 2 } },
            { "H_Booniehat_khk_hs", "", 100, { "life_coplevel", "SCALAR", 3 } },
            { "H_MilCap_blue", "", 100, { "life_coplevel", "SCALAR", 3 } },
			{ "H_Beret_blk", "", 100, { "life_coplevel", "SCALAR", 4 } },
            { "H_HelmetB_plain_blk", "", 100, { "life_coplevel", "SCALAR", 5 } },
            { "H_Beret_gen_F", "", 100, { "life_coplevel", "SCALAR", 5 } },
            { "H_Beret_02", "", 100, { "life_coplevel", "SCALAR", 6 } },
            { "H_Beret_Colonel", "", 100, { "life_coplevel", "SCALAR", 7 } },
            { "H_PilotHelmetFighter_B", "", 100, { "life_coplevel", "SCALAR", 3 } }
        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } },
            { "G_Squares", "", 10, { "", "", -1 } },
            { "G_Shades_Black", "", 25, { "", "", -1 } },
            { "G_Lowprofile", "", 30, { "", "", -1 } },
			{ "G_Aviator", "", 100, { "", "", -1 } },
            { "G_Combat", "", 200, { "", "", -1 } },
			{ "G_B_Diving", "", 200, { "life_coplevel", "SCALAR", 2 } },
			{ "G_Bandanna_blk", "", 200, { "life_coplevel", "SCALAR", 4 } },
			{ "G_Bandanna_blk", "", 200, { "life_coplevel", "SCALAR", 4 } }
        };
        vests[] = {
			{ "NONE", "Usuń Kamizelke", 0, { "", "", -1 } },		
            { "V_DeckCrew_yellow_F", "", 1000, { "", "", -1 } },
			{ "V_TacVest_blk_POLICE", "", 1000, { "", "", -1 } },
            { "V_RebreatherB", "", 1000, { "life_coplevel", "SCALAR", 3 } },
			{ "V_PlateCarrier1_blk", "", 5000, { "life_coplevel", "SCALAR", 4 } },
			{ "V_PlateCarrier2_blk", "", 5000, { "life_coplevel", "SCALAR", 6 } },
            { "V_PlateCarrierSpec_blk", "", 10000, { "life_coplevel", "SCALAR", 7 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } },
			{ "B_AssaultPack_blk", "", 500, { "", "", -1 } },
            { "B_OutdoorPack_blk", "", 1000, { "", "", -1 } },
            { "B_Carryall_oucamo", "", 2000, { "", "", -1 } },
			{ "B_Bergen_hex_F", "", 5000, { "", "", -1 } },
            { "Steerable_Parachute_F", "", 2000, { "", "", -1 } }
        };
    };

	class cop_snajper {
        title = "STR_Shops_C_Police";
        license = "";
        side = "cop";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
            { "U_B_CombatUniform_mcam_vest", "", 1000, { "life_coplevel", "SCALAR", -1 } },
            { "U_B_CombatUniform_mcam", "", 1000, { "life_coplevel", "SCALAR", -1 } },
            { "U_B_GEN_Soldier_F", "", 1000, { "life_coplevel", "SCALAR", -1 } },
            { "U_B_GEN_Commander_F", "", 1000, { "life_coplevel", "SCALAR", -1 } },
			{ "U_O_Wetsuit", "", 350, { "life_coplevel", "SCALAR", 2 } },
             { "U_B_GhillieSuit", "Ghillie BOA", 1000, { "life_coplevel", "SCALAR", 5 } }
        };
        headgear[] = {
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } },
            { "H_Cap_police", "", 100, { "life_coplevel", "SCALAR", 1 } },
            { "H_Bandanna_gry", "", 100, { "life_coplevel", "SCALAR", 2 } },
            { "H_Watchcap_blk", "", 100, { "life_coplevel", "SCALAR", 2 } },
            { "H_Booniehat_khk_hs", "", 100, { "life_coplevel", "SCALAR", 3 } },
            { "H_MilCap_blue", "", 100, { "life_coplevel", "SCALAR", 3 } },
			{ "H_Beret_blk", "", 100, { "life_coplevel", "SCALAR", 4 } },
            { "H_HelmetB_plain_blk", "", 100, { "life_coplevel", "SCALAR", 5 } },
            { "H_Beret_gen_F", "", 100, { "life_coplevel", "SCALAR", 5 } },
            { "H_Beret_02", "", 100, { "life_coplevel", "SCALAR", 6 } },
            { "H_Beret_Colonel", "", 100, { "life_coplevel", "SCALAR", 7 } },
            { "H_PilotHelmetFighter_B", "", 100, { "life_coplevel", "SCALAR", 3 } }
        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } },
            { "G_Squares", "", 10, { "", "", -1 } },
            { "G_Shades_Black", "", 25, { "", "", -1 } },
            { "G_Lowprofile", "", 30, { "", "", -1 } },
			{ "G_Aviator", "", 100, { "", "", -1 } },
            { "G_Combat", "", 200, { "", "", -1 } },
			{ "G_B_Diving", "", 200, { "life_coplevel", "SCALAR", 2 } },
			{ "G_Bandanna_blk", "", 200, { "life_coplevel", "SCALAR", 5 } },
			{ "G_Bandanna_blk", "", 200, { "life_coplevel", "SCALAR", 5 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } },
            { "V_TacVest_blk_POLICE", "", 1000, { "", "", -1 } },
            { "V_RebreatherB", "", 1000, { "life_coplevel", "SCALAR", 1 }},
			{ "V_PlateCarrier1_blk", "", 5000, { "life_coplevel", "SCALAR", 3 } },
			{ "V_PlateCarrier2_blk", "", 5000, { "life_coplevel", "SCALAR", 5 } },
                        { "V_PlateCarrierSpec_blk", "", 10000, { "life_coplevel", "SCALAR", 7 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } },
			{ "B_AssaultPack_blk", "", 500, { "", "", -1 } },
            { "B_OutdoorPack_blk", "", 1000, { "", "", -1 } },
            { "B_Carryall_oucamo", "", 2000, { "", "", -1 } },
            { "B_Bergen_hex_F", "", 5000, { "", "", -1 } },
            { "Steerable_Parachute_F", "", 2000, { "", "", -1 } }
        };
    };

    class cop_boa {
        title = "STR_Shops_C_Police";
        license = "";
        side = "cop";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
            { "U_B_GhillieSuit", "Ghillie BOA", 1000, { "life_coplevel", "SCALAR", -1 } },
			{ "U_O_FullGhillie_lsh", 1000, { "life_coplevel", "SCALAR", -1 } },
			{ "U_B_FullGhillie_lsh", 10000, { "life_coplevel", "SCALAR", -1 } },
			{ "U_B_FullGhillie_sard", "", 10000, { "life_coplevel", "SCALAR", -1 } },
			{ "U_B_FullGhillie_ard", "", 10000, { "life_coplevel", "SCALAR", -1 } },
			{ "U_O_PilotCoveralls", "", 10000, { "life_coplevel", "SCALAR", -1 } }
        };
        headgear[] = {
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } },
            { "H_HelmetO_oucamo", "", 100, { "life_coplevel", "SCALAR", 2 } },
            { "H_PilotHelmetFighter_B", "", 100, { "life_coplevel", "SCALAR", 3 } },
            { "H_HelmetSpecB", "", 100, { "life_coplevel", "SCALAR", 3 } },
            { "H_HelmetSpecB_paint1", "", 100, { "life_coplevel", "SCALAR", 3 } },
            { "H_HelmetSpecB_blk", "", 100, { "life_coplevel", "SCALAR", 3 } },
            { "H_HelmetB_black", "", 100, { "life_coplevel", "SCALAR", 3 } },
            { "H_HelmetB_TI_tna_F", "", 100, { "life_coplevel", "SCALAR", 3 } },
			{ "H_HelmetB_plain_blk", "", 100, { "life_coplevel", "SCALAR", 3 } },
			{ "H_HelmetB_camo", "", 100, { "life_coplevel", "SCALAR", 3 } },
			{ "H_HelmetLeaderO_ghex_F", "", 100, { "life_coplevel", "SCALAR", 3 } }

        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } },
            { "G_Balaclava_TI_blk_F", "", 200, { "life_coplevel", "SCALAR", 4 } },
            { "G_Balaclava_TI_G_blk_F", "", 200, { "life_coplevel", "SCALAR", 5 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } },
            { "V_PlateCarrier1_blk", "", 5000, { "life_coplevel", "SCALAR", 2 } },
            { "V_PlateCarrier2_blk", "", 5000, { "life_coplevel", "SCALAR", 4 } },
            { "V_PlateCarrierSpec_blk", "", 10000, { "life_coplevel", "SCALAR", 5 } },
			{ "V_PlateCarrierSpec_rgr", "", 10000, { "life_coplevel", "SCALAR", 5 } },
			{ "V_PlateCarrierIA2_dgtl", "", 10000, { "life_coplevel", "SCALAR", 5 } },
			{ "V_PlateCarrier3_rgr", "", 10000, { "life_coplevel", "SCALAR", 5 } },
			{ "V_PlateCarrierSpec_mtp", "", 10000, { "life_coplevel", "SCALAR", 5 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } },
            { "B_AssaultPack_blk", "", 500, { "", "", -1 } },
            { "B_OutdoorPack_blk", "", 1000, { "", "", -1 } },
            { "B_Carryall_oucamo", "", 2000, { "", "", -1 } },
			{ "B_Bergen_hex_F", "", 5000, { "", "", -1 } },
            { "Steerable_Parachute_F", "", 2000, { "", "", -1 } }
        };
    };

	class cop_szturm2 {
        title = "STR_Shops_C_Police";
        license = "";
        side = "cop";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
            { "U_O_Wetsuit", "", 350, { "life_coplevel", "SCALAR", 2 } },
            { "U_B_CombatUniform_mcam_vest", "", 1000, { "life_coplevel", "SCALAR", -1 } },
            { "U_B_CombatUniform_mcam", "", 1000, { "life_coplevel", "SCALAR", -1 } },
            { "U_B_GEN_Soldier_F", "", 1000, { "life_coplevel", "SCALAR", -1 } },
            { "U_B_GEN_Commander_F", "", 1000, { "life_coplevel", "SCALAR", -1 } },
             { "U_B_GhillieSuit", "Ghillie BOA", 1000, { "life_coplevel", "SCALAR", 5 } }
        };
        headgear[] = {
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } },
            { "H_Cap_police", "", 100, { "life_coplevel", "SCALAR", 1 } },
            { "H_Bandanna_gry", "", 100, { "life_coplevel", "SCALAR", 2 } },
            { "H_Watchcap_blk", "", 100, { "life_coplevel", "SCALAR", 2 } },
            { "H_Booniehat_khk_hs", "", 100, { "life_coplevel", "SCALAR", 3 } },
            { "H_MilCap_blue", "", 100, { "life_coplevel", "SCALAR", 3 } },
			{ "H_Beret_blk", "", 100, { "life_coplevel", "SCALAR", 5 } },
            { "H_HelmetB_plain_blk", "", 100, { "life_coplevel", "SCALAR", 5 } },
            { "H_Beret_gen_F", "", 100, { "life_coplevel", "SCALAR", 7 } },
            { "H_Beret_02", "", 100, { "life_coplevel", "SCALAR", 8 } },
            { "H_Beret_Colonel", "", 100, { "life_coplevel", "SCALAR", 9 } },
            { "H_PilotHelmetFighter_B", "", 100, { "life_coplevel", "SCALAR", 3 } }
        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } },
            { "G_Squares", "", 10, { "", "", -1 } },
            { "G_Shades_Black", "", 25, { "", "", -1 } },
            { "G_Lowprofile", "", 30, { "", "", -1 } },
			{ "G_Aviator", "", 100, { "", "", -1 } },
            { "G_Combat", "", 200, { "", "", -1 } },
			{ "G_B_Diving", "", 200, { "life_coplevel", "SCALAR", 2 } },
			{ "G_Bandanna_blk", "", 200, { "life_coplevel", "SCALAR", 4 } },
			{ "G_Bandanna_blk", "", 200, { "life_coplevel", "SCALAR", 4 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } },
            { "V_TacVest_blk_POLICE", "", 1000, { "", "", -1 } },
            { "V_RebreatherB", "", 1000, { "life_coplevel", "SCALAR", 1 }},
			{ "V_PlateCarrier1_blk", "", 5000, { "life_coplevel", "SCALAR", 2 } },
			{ "V_PlateCarrier2_blk", "", 5000, { "V_PlateCarrier2_blk", "SCALAR", 2 } },
                        { "V_PlateCarrierSpec_blk", "", 10000, { "life_coplevel", "SCALAR", 7 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } },
			{ "B_AssaultPack_blk", "", 500, { "", "", -1 } },
            { "B_OutdoorPack_blk", "", 1000, { "", "", -1 } },
            { "B_Carryall_oucamo", "", 2000, { "", "", -1 } },
			{ "B_Bergen_hex_F", "", 5000, { "", "", -1 } },
            { "Steerable_Parachute_F", "", 2000, { "", "", -1 } }
        };
    };

	class cop_szturm3 {
        title = "STR_Shops_C_Police";
        license = "";
        side = "cop";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
            { "U_O_Wetsuit", "", 350, { "life_coplevel", "SCALAR", 2 } },
            { "U_B_CombatUniform_mcam_vest", "", 1000, { "life_coplevel", "SCALAR", -1 } },
            { "U_B_CombatUniform_mcam", "", 1000, { "life_coplevel", "SCALAR", -1 } },
            { "U_B_GEN_Soldier_F", "", 1000, { "life_coplevel", "SCALAR", -1 } },
            { "U_B_GEN_Commander_F", "", 1000, { "life_coplevel", "SCALAR", -1 } },
             { "U_B_GhillieSuit", "Ghillie BOA", 1000, { "life_coplevel", "SCALAR", 5 } }
        };
        headgear[] = {
              { "NONE", "Usuń Czapkę", 0, { "", "", -1 } },
            { "H_Cap_police", "", 100, { "life_coplevel", "SCALAR", 1 } },
            { "H_Bandanna_gry", "", 100, { "life_coplevel", "SCALAR", 2 } },
            { "H_Watchcap_blk", "", 100, { "life_coplevel", "SCALAR", 2 } },
            { "H_Booniehat_khk_hs", "", 100, { "life_coplevel", "SCALAR", 3 } },
            { "H_MilCap_blue", "", 100, { "life_coplevel", "SCALAR", 3 } },
            { "H_Beret_blk", "", 100, { "life_coplevel", "SCALAR", 5 } },
            { "H_HelmetB_plain_blk", "", 100, { "life_coplevel", "SCALAR", 5 } },
            { "H_Beret_gen_F", "", 100, { "life_coplevel", "SCALAR", 7 } },
            { "H_Beret_02", "", 100, { "life_coplevel", "SCALAR", 8 } },
            { "H_Beret_Colonel", "", 100, { "life_coplevel", "SCALAR", 9 } },
            { "H_PilotHelmetFighter_B", "", 100, { "life_coplevel", "SCALAR", 3 } }
        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } },
            { "G_Squares", "", 10, { "", "", -1 } },
            { "G_Shades_Black", "", 25, { "", "", -1 } },
            { "G_Lowprofile", "", 30, { "", "", -1 } },
			{ "G_Aviator", "", 100, { "", "", -1 } },
            { "G_Combat", "", 200, { "", "", -1 } },
			{ "G_B_Diving", "", 200, { "life_coplevel", "SCALAR", 2 } },
			{ "G_Bandanna_blk", "", 200, { "life_coplevel", "SCALAR", 4 } },
			{ "G_Bandanna_blk", "", 200, { "life_coplevel", "SCALAR", 4 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } },
            { "V_TacVest_blk_POLICE", "", 1000, { "", "", -1 } },
            { "V_RebreatherB", "", 1000, { "life_coplevel", "SCALAR", 1 }},
			{ "V_PlateCarrier1_blk", "", 5000, { "life_coplevel", "SCALAR", 2 } },
			{ "V_PlateCarrier2_blk", "", 5000, { "life_coplevel", "SCALAR", 4 } },
            { "V_PlateCarrierSpec_blk", "", 10000, { "life_coplevel", "SCALAR", 7 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } },
			{ "B_AssaultPack_blk", "", 500, { "", "", -1 } },
            { "B_OutdoorPack_blk", "", 1000, { "", "", -1 } },
            { "B_Carryall_oucamo", "", 2000, { "", "", -1 } },
			{ "B_Bergen_hex_F", "", 5000, { "", "", -1 } },
            { "Steerable_Parachute_F", "", 2000, { "", "", -1 } }
        };
    };

    class dive {
        title = "STR_Shops_C_Diving";
        license = "dive";
        side = "civ";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
            { "U_B_Wetsuit", "", 2000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } },
            { "G_Diving", "", 500, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } },
            { "V_RebreatherIR", "", 5000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } }
        };
    };

    class bedzieszkurwodzialac {
        title = "STR_Shops_C_Gun";
        license = "bedzieszkurwodzialac";
        side = "civ";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
			{ "U_IG_Guerilla2_3", "The Outback Rangler", 1000, { "", "", -1 } },
            { "U_BG_Guerilla3_1", "", 1000, { "", "", -1 } },
            { "U_C_HunterBody_grn", "The Hunters Look", 1000, { "", "", -1 } },
            { "U_C_WorkerCoveralls", "Mechanic Coveralls", 1000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } },
            { "V_Rangemaster_belt", "", 5000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } },
			{ "B_Carryall_mcamo", "", 7500, { "", "", -1 } },
            { "B_Carryall_oli", "", 7500, { "", "", -1 } },
            { "B_Carryall_khk", "", 7500, { "", "", -1 } },
            { "B_Carryall_cbr", "", 7500, { "", "", -1 } },
			{ "B_Bergen_dgtl_F", "", 17500, { "", "", -1 } }
        };
    };
	
	class gun {
        title = "STR_Shops_C_Gun";
        license = "gun";
        side = "civ";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } },
            { "V_Rangemaster_belt", "", 5000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } }
        };
    };

    class sec {
        title = "STR_Shops_C_Gun";
        license = "sec";
        side = "civ";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
			{ "U_B_SpecopsUniform_sgg", "Strój Ochroniarza", 5000, {"", "", -1} }
        };
        headgear[] = {
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } },
			{ "H_Helmet_Skate", "", 750, { "", "", -1 } },
			{ "H_Watchcap_sgg", "", 1000, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } },
			{ "G_Shades_Black", "", 20, { "", "", -1 } },
            { "G_Shades_Blue", "", 20, { "", "", -1 } },
            { "G_Sport_Blackred", "", 25, { "", "", -1 } },
            { "G_Sport_Checkered", "", 25, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 25, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 25, { "", "", -1 } },
            { "G_Lowprofile", "", 30, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } },
            { "V_Press_F", "", 30000, { "", "", -1 } },
            { "V_PlateCarrier1_blk", "", 80000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } },
			{ "B_LegStrapBag_black_F", "", 4500, { "", "", -1 } },
            { "B_Carryall_mcamo", "", 7500, { "", "", -1 } },
            { "B_Carryall_oli", "", 7500, { "", "", -1 } },
            { "B_Carryall_khk", "", 7500, { "", "", -1 } },
            { "B_Carryall_cbr", "", 7500, { "", "", -1 } },
			{ "B_Carryall_mcamo", "", 7500, { "", "", -1 } },
			{ "B_Bergen_dgtl_F", "", 17500, { "", "", -1 } }
        };
    };

    class merc {
        title = "STR_Shops_C_Gun";
        license = "merc";
        side = "civ";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
			{ "U_Marshal", "", 5000, {"", "", -1} }
        };
        headgear[] = {
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } },
			{ "G_Tactical_Black", "", 100, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } },
            { "V_Rangemaster_belt", "", 5000, { "", "", -1 } },
			{ "V_TacVestIR_blk", "", 20000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } }
        };
    };

    class gang_clothing {
        title = "STR_Shops_C_Gang";
        license = "";
        side = "civ";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
			{ "U_I_C_Soldier_Bandit_1_F", "", 1000, { "", "", -1 } },
			{ "U_I_C_Soldier_Bandit_2_F", "", 1000, { "", "", -1 } },
			{ "U_I_C_Soldier_Bandit_3_F", "", 1000, { "", "", -1 } },
			{ "U_I_C_Soldier_Bandit_4_F", "", 1000, { "", "", -1 } },
			{ "U_I_C_Soldier_Bandit_5_F", "", 1000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } },
            { "V_BandollierB_oli", "", 1900, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } }
        };
    };

    class med_clothing {
        title = "STR_MAR_EMS_Clothing_Shop";
        license = "";
        side = "med";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
            { "U_B_CombatUniform_mcam", "Strój medyka", 50, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam_vest", "Strój medyka", 50, { "", "", -1 } },
            { "U_Rangemaster", "Strój Mechanika", 50, { "", "", -1 } },
			{ "U_B_Wetsuit", "", 2000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } },
			{ "H_PASGT_basic_white_F", "Hełm Med", 100, { "", "", -1 } },
			{ "H_HeadBandage_bloody_F", "", 350, { "", "", -1 } },
            { "H_Cap_marshal", "", 10, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } },
			{ "G_Respirator_white_F", "Maska", 10, { "", "", -1 } },
            { "G_Sport_Blackred", "", 10, { "", "", -1 } },
			{ "G_Diving", "", 500, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } },
			{ "V_Safety_orange_F", "", 1000, { "", "", -1 } },
			{ "V_RebreatherIR", "", 5000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } },
            { "B_Kitbag_sgg", "Plecak Medyczny", 3000, { "", "", -1 } },
            { "B_Kitbag_cbr", "Plecak Mechanika", 3000, { "", "", -1 } },
			{ "B_Bergen_dgtl_F", "", 7500, { "", "", -1 } }
        };
    };

    class zolnierz {
        title = "STR_Shops_C_Zolnierz";
        license = "zolnierz";
        side = "civ";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
            { "U_B_CombatUniform_mcam", "", 5000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_1_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_2_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_3_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_4_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_5_F", "", 20000, { "", "", -1 } },
            { "U_IG_Guerilla1_1", "", 20000, {"", "", -1} },
            { "U_IG_Guerrilla_6_1", "", 20000, {"", "", -1} },
            { "U_I_CombatUniform", "", 20000, { "", "", -1 } },
            { "U_I_CombatUniform_shortsleeve", "", 20000, { "", "", -1 } },
            { "U_B_T_Soldier_F", "", 20000, { "", "", -1 } },
            { "U_B_T_Soldier_AR_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Camo_F", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_1", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_2", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_3", "", 20000, { "", "", -1 } },
            { "U_O_SpecopsUniform_ocamo", "", 35000, { "", "", -1 } },
            { "U_O_GhillieSuit", "", 75000, { "", "", -1 } },
            { "U_I_GhillieSuit", "", 75000, { "", "", -1 } },
            { "U_B_FullGhillie_ard", "", 150000, { "", "", -1 } },
            { "U_B_FullGhillie_sard", "", 150000, { "", "", -1 } },
            { "U_B_FullGhillie_lsh", "", 150000, { "", "", -1 } },
            { "U_O_T_FullGhillie_tna_F", "", 200000, { "", "", -1 } }

        };
        headgear[] = {
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } },
            { "H_Bandanna_camo", "", 500, { "", "", -1 } },
            { "H_Bandanna_mcamo", "", 500, { "", "", -1 } },
            { "H_Booniehat_indp", "", 500, { "", "", -1 } },
            { "H_Booniehat_mcamo", "", 500, { "", "", -1 } },
            { "H_Cap_brn_SPECOPS", "", 500, { "", "", -1 } },
            { "H_Cap_blk_Raven", "", 500, { "", "", -1 } },
            { "H_MilCap_ocamo", "", 500, { "", "", -1 } },
            { "H_MilCap_mcamo", "", 500, { "", "", -1 } },
            { "H_MilCap_oucamo", "", 500, { "", "", -1 } },
            { "H_MilCap_rucamo", "", 500, { "", "", -1 } },
            { "H_Shemag_olive", "Maska", 500, { "", "", -1 } },
            { "H_Shemag_olive_hs", "Maska", 500, { "", "", -1 } },
            { "H_CrewHelmetHeli_O", "", 5000, { "", "", -1 } },
            { "H_HelmetB_TI_tna_F", "", 6000, { "", "", -1 } },
            { "H_HelmetCrew_I", "", 7000, { "", "", -1 } },
            { "H_HelmetO_ocamo", "", 8000, { "", "", -1 } },
            { "H_PilotHelmetFighter_B", "", 9000, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } },
            { "G_Shades_Black", "", 20, { "", "", -1 } },
            { "G_Shades_Blue", "", 20, { "", "", -1 } },
            { "G_Sport_Blackred", "", 25, { "", "", -1 } },
            { "G_Sport_Checkered", "", 25, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 25, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 25, { "", "", -1 } },
            { "G_Lowprofile", "", 30, { "", "", -1 } },
            { "G_Squares", "", 50, { "", "", -1 } },
            { "G_Bandanna_aviator", "", 150, { "", "", -1 } },
            { "G_Bandanna_khk", "", 150, { "", "", -1 } },
            { "G_Bandanna_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_shades", "", 150, { "", "", -1 } },
            { "G_Bandanna_sport", "", 150, { "", "", -1 } },
            { "G_Bandanna_tan", "", 150, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } },
            { "V_TacVest_khk", "", 5000, { "", "", -1 } },
            { "V_TacVest_brn", "", 5000, { "", "", -1 } },
            { "V_TacVest_oli", "", 5000, { "", "", -1 } },
            { "V_TacVest_blk", "", 5000, { "", "", -1 } },
            { "V_TacVest_camo", "", 5000, { "", "", -1 } },
            { "V_PlateCarrier1_blk", "", 15000, { "", "", -1 } },
            { "V_PlateCarrier1_tna_F", "", 15000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } },
            { "B_AssaultPack_dgtl", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_ocamo", "", 2000, { "", "", -1 } },
            { "B_FieldPack_ocamo", "", 3000, { "", "", -1 } },
            { "B_Kitbag_mcamo", "", 3000, { "", "", -1 } },
            { "B_TacticalPack_ocamo", "", 4000, { "", "", -1 } },
            { "B_TacticalPack_mcamo", "", 4000, { "", "", -1 } },
            { "B_Carryall_ocamo", "", 5000, { "", "", -1 } },
            { "B_Carryall_mcamo", "", 5000, { "", "", -1 } },
			{ "B_Bergen_dgtl_F", "", 7500, { "", "", -1 } }
        };
    };

    class rebel {
        title = "STR_Shops_C_Rebel";
        license = "rebel";
        side = "civ";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
            { "U_B_CombatUniform_mcam", "WP", 5000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_1_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_2_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_3_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_4_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_5_F", "", 20000, { "", "", -1 } },
            { "U_IG_Guerilla1_1", "", 20000, {"", "", -1} },
            { "U_IG_Guerrilla_6_1", "", 20000, {"", "", -1} },
            { "U_I_CombatUniform", "", 20000, { "", "", -1 } },
            { "U_I_CombatUniform_shortsleeve", "", 20000, { "", "", -1 } },
			{ "U_B_T_Soldier_F", "", 20000, { "", "", -1 } },
			{ "U_B_T_Soldier_AR_F", "", 20000, { "", "", -1 } },
			{ "U_I_C_Soldier_Camo_F", "", 20000, { "", "", -1 } },
			{ "U_B_CTRG_1", "", 20000, { "", "", -1 } },
			{ "U_B_CTRG_2", "", 20000, { "", "", -1 } },
			{ "U_B_CTRG_3", "", 20000, { "", "", -1 } },
			{ "U_O_SpecopsUniform_ocamo", "", 35000, { "", "", -1 } },
	        { "U_O_GhillieSuit", "", 75000, { "", "", -1 } },
            { "U_I_GhillieSuit", "", 75000, { "", "", -1 } },
            { "U_B_FullGhillie_ard", "", 150000, { "", "", -1 } },
            { "U_B_FullGhillie_sard", "", 150000, { "", "", -1 } },
            { "U_B_FullGhillie_lsh", "", 150000, { "", "", -1 } },
            { "U_O_T_FullGhillie_tna_F", "", 200000, { "", "", -1 } }

        };
        headgear[] = {
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } },
            { "H_Bandanna_camo", "", 500, { "", "", -1 } },
            { "H_Bandanna_mcamo", "", 500, { "", "", -1 } },
            { "H_Booniehat_indp", "", 500, { "", "", -1 } },
            { "H_Booniehat_mcamo", "", 500, { "", "", -1 } },
            { "H_Cap_brn_SPECOPS", "", 500, { "", "", -1 } },
            { "H_Cap_blk_Raven", "", 500, { "", "", -1 } },
            { "H_MilCap_ocamo", "", 500, { "", "", -1 } },
            { "H_MilCap_mcamo", "", 500, { "", "", -1 } },
            { "H_MilCap_oucamo", "", 500, { "", "", -1 } },
            { "H_MilCap_rucamo", "", 500, { "", "", -1 } },
            { "H_Shemag_olive", "Maska", 500, { "", "", -1 } },
            { "H_Shemag_olive_hs", "Maska", 500, { "", "", -1 } },
            { "H_CrewHelmetHeli_O", "", 50000, { "", "", -1 } },
            { "H_HelmetB_TI_tna_F", "", 60000, { "", "", -1 } },
            { "H_HelmetCrew_I", "", 70000, { "", "", -1 } },
            { "H_HelmetO_ocamo", "", 80000, { "", "", -1 } },
            { "H_PilotHelmetFighter_B", "", 90000, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } },
            { "G_Shades_Black", "", 20, { "", "", -1 } },
            { "G_Shades_Blue", "", 20, { "", "", -1 } },
            { "G_Sport_Blackred", "", 25, { "", "", -1 } },
            { "G_Sport_Checkered", "", 25, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 25, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 25, { "", "", -1 } },
            { "G_Lowprofile", "", 30, { "", "", -1 } },
            { "G_Squares", "", 50, { "", "", -1 } },
            { "G_Bandanna_aviator", "", 150, { "", "", -1 } },
            { "G_Bandanna_khk", "", 150, { "", "", -1 } },
            { "G_Bandanna_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_shades", "", 150, { "", "", -1 } },
            { "G_Bandanna_sport", "", 150, { "", "", -1 } },
            { "G_Bandanna_tan", "", 150, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } },
            { "V_TacVest_khk", "", 50000, { "", "", -1 } },
            { "V_TacVest_brn", "", 50000, { "", "", -1 } },
            { "V_TacVest_oli", "", 50000, { "", "", -1 } },
            { "V_TacVest_blk", "", 50000, { "", "", -1 } },
            { "V_TacVest_camo", "", 50000, { "", "", -1 } },
            { "V_PlateCarrier1_blk", "", 150000, { "", "", -1 } },
            { "V_PlateCarrier1_tna_F", "", 150000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } },
            { "B_AssaultPack_dgtl", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_ocamo", "", 2000, { "", "", -1 } },
            { "B_FieldPack_ocamo", "", 3000, { "", "", -1 } },
            { "B_Kitbag_mcamo", "", 3000, { "", "", -1 } },
            { "B_TacticalPack_ocamo", "", 4000, { "", "", -1 } },
            { "B_TacticalPack_mcamo", "", 4000, { "", "", -1 } },
            { "B_Carryall_ocamo", "", 5000, { "", "", -1 } },
            { "B_Carryall_mcamo", "", 5000, { "", "", -1 } },
			{ "B_Bergen_dgtl_F", "", 14500, { "", "", -1 } }
        };
    };

    class adv_rebel {
        title = "STR_Shops_C_Rebel";
        license = "adv_rebel";
        side = "civ";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
            { "U_B_CombatUniform_mcam", "", 5000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_1_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_2_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_3_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_4_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_5_F", "", 20000, { "", "", -1 } },
            { "U_IG_Guerilla1_1", "", 20000, {"", "", -1} },
            { "U_IG_Guerrilla_6_1", "", 20000, {"", "", -1} },
            { "U_I_CombatUniform", "", 20000, { "", "", -1 } },
            { "U_I_CombatUniform_shortsleeve", "", 20000, { "", "", -1 } },
            { "U_B_T_Soldier_F", "", 20000, { "", "", -1 } },
            { "U_B_T_Soldier_AR_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Camo_F", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_1", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_2", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_3", "", 20000, { "", "", -1 } },
            { "U_O_SpecopsUniform_ocamo", "", 35000, { "", "", -1 } },
            { "U_O_GhillieSuit", "", 75000, { "", "", -1 } },
            { "U_I_GhillieSuit", "", 75000, { "", "", -1 } },
            { "U_B_FullGhillie_ard", "", 150000, { "", "", -1 } },
            { "U_B_FullGhillie_sard", "", 150000, { "", "", -1 } },
            { "U_B_FullGhillie_lsh", "", 150000, { "", "", -1 } },
            { "U_O_T_FullGhillie_tna_F", "", 200000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } },
            { "H_Bandanna_camo", "", 500, { "", "", -1 } },
            { "H_Bandanna_mcamo", "", 500, { "", "", -1 } },
            { "H_Booniehat_indp", "", 500, { "", "", -1 } },
            { "H_Booniehat_mcamo", "", 500, { "", "", -1 } },
            { "H_Cap_brn_SPECOPS", "", 500, { "", "", -1 } },
            { "H_Cap_blk_Raven", "", 500, { "", "", -1 } },
            { "H_MilCap_ocamo", "", 500, { "", "", -1 } },
            { "H_MilCap_mcamo", "", 500, { "", "", -1 } },
            { "H_MilCap_oucamo", "", 500, { "", "", -1 } },
            { "H_MilCap_rucamo", "", 500, { "", "", -1 } },
            { "H_Shemag_olive", "Maska", 500, { "", "", -1 } },
            { "H_Shemag_olive_hs", "Maska", 500, { "", "", -1 } },
            { "H_CrewHelmetHeli_O", "", 50000, { "", "", -1 } },
            { "H_HelmetCrew_I", "", 80000, { "", "", -1 } },
            { "H_HelmetB_TI_tna_F", "", 60000, { "", "", -1 } },
            { "H_PilotHelmetFighter_B", "", 90000, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } },
            { "G_Shades_Black", "", 20, { "", "", -1 } },
            { "G_Shades_Blue", "", 20, { "", "", -1 } },
            { "G_Sport_Blackred", "", 25, { "", "", -1 } },
            { "G_Sport_Checkered", "", 25, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 25, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 25, { "", "", -1 } },
            { "G_Lowprofile", "", 30, { "", "", -1 } },
            { "G_Squares", "", 50, { "", "", -1 } },
            { "G_Bandanna_aviator", "", 150, { "", "", -1 } },
            { "G_Bandanna_khk", "", 150, { "", "", -1 } },
            { "G_Bandanna_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_shades", "", 150, { "", "", -1 } },
            { "G_Bandanna_sport", "", 150, { "", "", -1 } },
            { "G_Bandanna_tan", "", 150, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } },
            { "V_TacVest_khk", "", 50000, { "", "", -1 } },
            { "V_TacVest_brn", "", 50000, { "", "", -1 } },
            { "V_TacVest_oli", "", 50000, { "", "", -1 } },
            { "V_TacVest_blk", "", 50000, { "", "", -1 } },
            { "V_TacVest_camo", "", 50000, { "", "", -1 } },
            { "V_PlateCarrier1_blk", "", 150000, { "", "", -1 } },
            { "V_PlateCarrier1_tna_F", "", 150000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } },
            { "B_AssaultPack_dgtl", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_ocamo", "", 2000, { "", "", -1 } },
            { "B_FieldPack_ocamo", "", 3000, { "", "", -1 } },
            { "B_Kitbag_mcamo", "", 3000, { "", "", -1 } },
            { "B_TacticalPack_ocamo", "", 4000, { "", "", -1 } },
            { "B_TacticalPack_mcamo", "", 4000, { "", "", -1 } },
            { "B_Carryall_ocamo", "", 5000, { "", "", -1 } },
            { "B_Carryall_mcamo", "", 5000, { "", "", -1 } }
        };
    };

    class reb_sniper1 {
        title = "STR_Shops_C_Rebel";
        license = "reb_sniper1";
        side = "civ";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam", "", 5000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_1_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_2_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_3_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_4_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_5_F", "", 20000, { "", "", -1 } },
            { "U_IG_Guerilla1_1", "", 20000, {"", "", -1} },
            { "U_IG_Guerrilla_6_1", "", 20000, {"", "", -1} },
            { "U_I_CombatUniform", "", 20000, { "", "", -1 } },
            { "U_I_CombatUniform_shortsleeve", "", 20000, { "", "", -1 } },
            { "U_B_T_Soldier_F", "", 20000, { "", "", -1 } },
            { "U_B_T_Soldier_AR_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Camo_F", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_1", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_2", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_3", "", 20000, { "", "", -1 } },
            { "U_O_SpecopsUniform_ocamo", "", 35000, { "", "", -1 } },
            { "U_O_GhillieSuit", "", 75000, { "", "", -1 } },
            { "U_I_GhillieSuit", "", 75000, { "", "", -1 } },
            { "U_B_FullGhillie_ard", "", 150000, { "", "", -1 } },
            { "U_B_FullGhillie_sard", "", 150000, { "", "", -1 } },
            { "U_B_FullGhillie_lsh", "", 150000, { "", "", -1 } },
            { "U_O_T_FullGhillie_tna_F", "", 200000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } },
            { "H_Bandanna_camo", "", 500, { "", "", -1 } },
            { "H_Bandanna_mcamo", "", 500, { "", "", -1 } },
            { "H_Booniehat_indp", "", 500, { "", "", -1 } },
            { "H_Booniehat_mcamo", "", 500, { "", "", -1 } },
            { "H_Cap_brn_SPECOPS", "", 500, { "", "", -1 } },
            { "H_Cap_blk_Raven", "", 500, { "", "", -1 } },
            { "H_MilCap_ocamo", "", 500, { "", "", -1 } },
            { "H_MilCap_mcamo", "", 500, { "", "", -1 } },
            { "H_MilCap_oucamo", "", 500, { "", "", -1 } },
            { "H_MilCap_rucamo", "", 500, { "", "", -1 } },
            { "H_Shemag_olive", "Maska", 500, { "", "", -1 } },
            { "H_Shemag_olive_hs", "Maska", 500, { "", "", -1 } },
            { "H_CrewHelmetHeli_O", "", 50000, { "", "", -1 } },
            { "H_HelmetCrew_I", "", 80000, { "", "", -1 } },
            { "H_HelmetB_TI_tna_F", "", 60000, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } },
            { "G_Shades_Black", "", 20, { "", "", -1 } },
            { "G_Shades_Blue", "", 20, { "", "", -1 } },
            { "G_Sport_Blackred", "", 25, { "", "", -1 } },
            { "G_Sport_Checkered", "", 25, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 25, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 25, { "", "", -1 } },
            { "G_Lowprofile", "", 30, { "", "", -1 } },
            { "G_Squares", "", 50, { "", "", -1 } },
            { "G_Combat", "", 125, { "", "", -1 } },
            { "G_Balaclava_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_aviator", "", 150, { "", "", -1 } },
            { "G_Bandanna_khk", "", 150, { "", "", -1 } },
            { "G_Bandanna_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_shades", "", 150, { "", "", -1 } },
            { "G_Bandanna_sport", "", 150, { "", "", -1 } },
            { "G_Bandanna_tan", "", 150, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } },
            { "V_TacVest_khk", "", 50000, { "", "", -1 } },
            { "V_TacVest_brn", "", 50000, { "", "", -1 } },
            { "V_TacVest_oli", "", 50000, { "", "", -1 } },
            { "V_TacVest_blk", "", 50000, { "", "", -1 } },
            { "V_TacVest_camo", "", 50000, { "", "", -1 } },
            { "V_PlateCarrier1_blk", "", 150000, { "", "", -1 } },
            { "V_PlateCarrier1_tna_F", "", 150000, { "", "", -1 } },
            { "V_PlateCarrier2_rgr", "", 200000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } },
            { "B_AssaultPack_dgtl", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_ocamo", "", 2000, { "", "", -1 } },
            { "B_FieldPack_ocamo", "", 3000, { "", "", -1 } },
            { "B_Kitbag_mcamo", "", 3000, { "", "", -1 } },
            { "B_TacticalPack_ocamo", "", 4000, { "", "", -1 } },
            { "B_TacticalPack_mcamo", "", 4000, { "", "", -1 } },
            { "B_Carryall_ocamo", "", 5000, { "", "", -1 } },
            { "B_Carryall_mcamo", "", 5000, { "", "", -1 } },
			{ "B_Bergen_dgtl_F", "", 17500, { "", "", -1 } }
        };
    };

    class reb_sniper2 {
        title = "STR_Shops_C_Rebel";
        license = "reb_sniper2";
        side = "civ";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam", "", 5000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_1_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_2_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_3_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_4_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_5_F", "", 20000, { "", "", -1 } },
            { "U_IG_Guerilla1_1", "", 20000, {"", "", -1} },
            { "U_IG_Guerrilla_6_1", "", 20000, {"", "", -1} },
            { "U_I_CombatUniform", "", 20000, { "", "", -1 } },
            { "U_I_CombatUniform_shortsleeve", "", 20000, { "", "", -1 } },
            { "U_B_T_Soldier_F", "", 20000, { "", "", -1 } },
            { "U_B_T_Soldier_AR_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Camo_F", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_1", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_2", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_3", "", 20000, { "", "", -1 } },
            { "U_O_SpecopsUniform_ocamo", "", 35000, { "", "", -1 } },
            { "U_B_CombatUniform_mcam", "", 55000, { "", "", -1 } },
            { "U_O_GhillieSuit", "", 75000, { "", "", -1 } },
            { "U_I_GhillieSuit", "", 75000, { "", "", -1 } },
            { "U_B_FullGhillie_ard", "", 150000, { "", "", -1 } },
            { "U_B_FullGhillie_sard", "", 150000, { "", "", -1 } },
            { "U_B_FullGhillie_lsh", "", 150000, { "", "", -1 } },
            { "U_O_T_FullGhillie_tna_F", "", 200000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } },
            { "H_Bandanna_camo", "", 500, { "", "", -1 } },
            { "H_Bandanna_mcamo", "", 500, { "", "", -1 } },
            { "H_Booniehat_indp", "", 500, { "", "", -1 } },
            { "H_Booniehat_mcamo", "", 500, { "", "", -1 } },
            { "H_Cap_brn_SPECOPS", "", 500, { "", "", -1 } },
            { "H_Cap_blk_Raven", "", 500, { "", "", -1 } },
            { "H_MilCap_ocamo", "", 500, { "", "", -1 } },
            { "H_MilCap_mcamo", "", 500, { "", "", -1 } },
            { "H_MilCap_oucamo", "", 500, { "", "", -1 } },
            { "H_MilCap_rucamo", "", 500, { "", "", -1 } },
            { "H_Shemag_olive", "Maska", 500, { "", "", -1 } },
            { "H_Shemag_olive_hs", "Maska", 500, { "", "", -1 } },
            { "H_CrewHelmetHeli_O", "", 50000, { "", "", -1 } },
            { "H_HelmetCrew_I", "", 80000, { "", "", -1 } },
            { "H_HelmetB_TI_tna_F", "", 60000, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } },
            { "G_Shades_Black", "", 20, { "", "", -1 } },
            { "G_Shades_Blue", "", 20, { "", "", -1 } },
            { "G_Sport_Blackred", "", 25, { "", "", -1 } },
            { "G_Sport_Checkered", "", 25, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 25, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 25, { "", "", -1 } },
            { "G_Lowprofile", "", 30, { "", "", -1 } },
            { "G_Squares", "", 50, { "", "", -1 } },
            { "G_Combat", "", 125, { "", "", -1 } },
            { "G_Balaclava_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_aviator", "", 150, { "", "", -1 } },
            { "G_Bandanna_khk", "", 150, { "", "", -1 } },
            { "G_Bandanna_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_shades", "", 150, { "", "", -1 } },
            { "G_Bandanna_sport", "", 150, { "", "", -1 } },
            { "G_Bandanna_tan", "", 150, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } },
            { "V_TacVest_khk", "", 50000, { "", "", -1 } },
            { "V_TacVest_brn", "", 50000, { "", "", -1 } },
            { "V_TacVest_oli", "", 50000, { "", "", -1 } },
            { "V_TacVest_blk", "", 50000, { "", "", -1 } },
            { "V_TacVest_camo", "", 50000, { "", "", -1 } },
            { "V_PlateCarrier1_blk", "", 150000, { "", "", -1 } },
            { "V_PlateCarrier1_tna_F", "", 150000, { "", "", -1 } },
            { "V_PlateCarrier2_rgr", "", 200000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } },
            { "B_AssaultPack_dgtl", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_ocamo", "", 2000, { "", "", -1 } },
            { "B_FieldPack_ocamo", "", 3000, { "", "", -1 } },
            { "B_Kitbag_mcamo", "", 3000, { "", "", -1 } },
            { "B_TacticalPack_ocamo", "", 4000, { "", "", -1 } },
            { "B_TacticalPack_mcamo", "", 4000, { "", "", -1 } },
            { "B_Carryall_ocamo", "", 5000, { "", "", -1 } },
            { "B_Carryall_mcamo", "", 5000, { "", "", -1 } },
			{ "B_Bergen_dgtl_F", "", 17500, { "", "", -1 } }
        };
    };

    class reb_sniper3 {
        title = "STR_Shops_C_Rebel";
        license = "reb_sniper3";
        side = "civ";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam", "", 5000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_1_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_2_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_3_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_4_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_5_F", "", 20000, { "", "", -1 } },
            { "U_IG_Guerilla1_1", "", 20000, {"", "", -1} },
            { "U_IG_Guerrilla_6_1", "", 20000, {"", "", -1} },
            { "U_I_CombatUniform", "", 20000, { "", "", -1 } },
            { "U_I_CombatUniform_shortsleeve", "", 20000, { "", "", -1 } },
            { "U_B_T_Soldier_F", "", 20000, { "", "", -1 } },
            { "U_B_T_Soldier_AR_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Camo_F", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_1", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_2", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_3", "", 20000, { "", "", -1 } },
            { "U_O_SpecopsUniform_ocamo", "", 35000, { "", "", -1 } },
            { "U_B_CombatUniform_mcam", "", 55000, { "", "", -1 } },
            { "U_O_GhillieSuit", "", 75000, { "", "", -1 } },
            { "U_I_GhillieSuit", "", 75000, { "", "", -1 } },
            { "U_B_FullGhillie_ard", "", 150000, { "", "", -1 } },
            { "U_B_FullGhillie_sard", "", 150000, { "", "", -1 } },
            { "U_B_FullGhillie_lsh", "", 150000, { "", "", -1 } },
            { "U_O_T_FullGhillie_tna_F", "", 200000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } },
            { "H_Bandanna_camo", "", 500, { "", "", -1 } },
            { "H_Bandanna_mcamo", "", 500, { "", "", -1 } },
            { "H_Booniehat_indp", "", 500, { "", "", -1 } },
            { "H_Booniehat_mcamo", "", 500, { "", "", -1 } },
            { "H_Cap_brn_SPECOPS", "", 500, { "", "", -1 } },
            { "H_Cap_blk_Raven", "", 500, { "", "", -1 } },
            { "H_MilCap_ocamo", "", 500, { "", "", -1 } },
            { "H_MilCap_mcamo", "", 500, { "", "", -1 } },
            { "H_MilCap_oucamo", "", 500, { "", "", -1 } },
            { "H_MilCap_rucamo", "", 500, { "", "", -1 } },
            { "H_Shemag_olive", "Maska", 500, { "", "", -1 } },
            { "H_Shemag_olive_hs", "Maska", 500, { "", "", -1 } },
            { "H_CrewHelmetHeli_O", "", 50000, { "", "", -1 } },
            { "H_HelmetCrew_I", "", 80000, { "", "", -1 } },
            { "H_HelmetB_TI_tna_F", "", 60000, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } },
            { "G_Shades_Black", "", 20, { "", "", -1 } },
            { "G_Shades_Blue", "", 20, { "", "", -1 } },
            { "G_Sport_Blackred", "", 25, { "", "", -1 } },
            { "G_Sport_Checkered", "", 25, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 25, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 25, { "", "", -1 } },
            { "G_Lowprofile", "", 30, { "", "", -1 } },
            { "G_Squares", "", 50, { "", "", -1 } },
            { "G_Combat", "", 125, { "", "", -1 } },
            { "G_Balaclava_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_aviator", "", 150, { "", "", -1 } },
            { "G_Bandanna_khk", "", 150, { "", "", -1 } },
            { "G_Bandanna_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_shades", "", 150, { "", "", -1 } },
            { "G_Bandanna_sport", "", 150, { "", "", -1 } },
            { "G_Bandanna_tan", "", 150, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } },
            { "V_TacVest_khk", "", 50000, { "", "", -1 } },
            { "V_TacVest_brn", "", 50000, { "", "", -1 } },
            { "V_TacVest_oli", "", 50000, { "", "", -1 } },
            { "V_TacVest_blk", "", 50000, { "", "", -1 } },
            { "V_TacVest_camo", "", 50000, { "", "", -1 } },
            { "V_PlateCarrier1_blk", "", 150000, { "", "", -1 } },
            { "V_PlateCarrier1_tna_F", "", 150000, { "", "", -1 } },
            { "V_PlateCarrier2_rgr", "", 200000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } },
            { "B_AssaultPack_dgtl", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_ocamo", "", 2000, { "", "", -1 } },
            { "B_FieldPack_ocamo", "", 3000, { "", "", -1 } },
            { "B_Kitbag_mcamo", "", 3000, { "", "", -1 } },
            { "B_TacticalPack_ocamo", "", 4000, { "", "", -1 } },
            { "B_TacticalPack_mcamo", "", 4000, { "", "", -1 } },
            { "B_Carryall_ocamo", "", 5000, { "", "", -1 } },
            { "B_Carryall_mcamo", "", 5000, { "", "", -1 } },
			{ "B_Bergen_dgtl_F", "", 17500, { "", "", -1 } }
        };
    };

    class reb_wsparcie1 {
        title = "STR_Shops_C_Rebel";
        license = "reb_wsparcie1";
        side = "civ";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam", "", 5000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_1_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_2_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_3_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_4_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_5_F", "", 20000, { "", "", -1 } },
            { "U_IG_Guerilla1_1", "", 20000, {"", "", -1} },
            { "U_IG_Guerrilla_6_1", "", 20000, {"", "", -1} },
            { "U_I_CombatUniform", "", 20000, { "", "", -1 } },
            { "U_I_CombatUniform_shortsleeve", "", 20000, { "", "", -1 } },
            { "U_B_T_Soldier_F", "", 20000, { "", "", -1 } },
            { "U_B_T_Soldier_AR_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Camo_F", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_1", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_2", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_3", "", 20000, { "", "", -1 } },
            { "U_O_SpecopsUniform_ocamo", "", 35000, { "", "", -1 } },
            { "U_B_CombatUniform_mcam", "", 55000, { "", "", -1 } },
            { "U_O_GhillieSuit", "", 75000, { "", "", -1 } },
            { "U_I_GhillieSuit", "", 75000, { "", "", -1 } },
            { "U_B_FullGhillie_ard", "", 150000, { "", "", -1 } },
            { "U_B_FullGhillie_sard", "", 150000, { "", "", -1 } },
            { "U_B_FullGhillie_lsh", "", 150000, { "", "", -1 } },
            { "U_O_T_FullGhillie_tna_F", "", 200000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } },
            { "H_Bandanna_camo", "", 500, { "", "", -1 } },
            { "H_Bandanna_mcamo", "", 500, { "", "", -1 } },
            { "H_Booniehat_indp", "", 500, { "", "", -1 } },
            { "H_Booniehat_mcamo", "", 500, { "", "", -1 } },
            { "H_Cap_brn_SPECOPS", "", 500, { "", "", -1 } },
            { "H_Cap_blk_Raven", "", 500, { "", "", -1 } },
            { "H_MilCap_ocamo", "", 500, { "", "", -1 } },
            { "H_MilCap_mcamo", "", 500, { "", "", -1 } },
            { "H_MilCap_oucamo", "", 500, { "", "", -1 } },
            { "H_MilCap_rucamo", "", 500, { "", "", -1 } },
            { "H_Shemag_olive", "Maska", 500, { "", "", -1 } },
            { "H_Shemag_olive_hs", "Maska", 500, { "", "", -1 } },
            { "H_CrewHelmetHeli_O", "", 50000, { "", "", -1 } },
            { "H_HelmetCrew_I", "", 80000, { "", "", -1 } },
            { "H_HelmetB_TI_tna_F", "", 60000, { "", "", -1 } },
            { "H_PilotHelmetFighter_B", "", 90000, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } },
            { "G_Shades_Black", "", 20, { "", "", -1 } },
            { "G_Shades_Blue", "", 20, { "", "", -1 } },
            { "G_Sport_Blackred", "", 25, { "", "", -1 } },
            { "G_Sport_Checkered", "", 25, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 25, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 25, { "", "", -1 } },
            { "G_Lowprofile", "", 30, { "", "", -1 } },
            { "G_Squares", "", 50, { "", "", -1 } },
            { "G_Combat", "", 125, { "", "", -1 } },
            { "G_Balaclava_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_aviator", "", 150, { "", "", -1 } },
            { "G_Bandanna_khk", "", 150, { "", "", -1 } },
            { "G_Bandanna_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_shades", "", 150, { "", "", -1 } },
            { "G_Bandanna_sport", "", 150, { "", "", -1 } },
            { "G_Bandanna_tan", "", 150, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } },
            { "V_TacVest_khk", "", 50000, { "", "", -1 } },
            { "V_TacVest_brn", "", 50000, { "", "", -1 } },
            { "V_TacVest_oli", "", 50000, { "", "", -1 } },
            { "V_TacVest_blk", "", 50000, { "", "", -1 } },
            { "V_TacVest_camo", "", 50000, { "", "", -1 } },
            { "V_PlateCarrier1_blk", "", 150000, { "", "", -1 } },
            { "V_PlateCarrier1_tna_F", "", 150000, { "", "", -1 } },
            { "V_PlateCarrier2_rgr", "", 200000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } },
            { "B_AssaultPack_dgtl", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_ocamo", "", 2000, { "", "", -1 } },
            { "B_FieldPack_ocamo", "", 3000, { "", "", -1 } },
            { "B_Kitbag_mcamo", "", 3000, { "", "", -1 } },
            { "B_TacticalPack_ocamo", "", 4000, { "", "", -1 } },
            { "B_TacticalPack_mcamo", "", 4000, { "", "", -1 } },
            { "B_Carryall_ocamo", "", 5000, { "", "", -1 } },
            { "B_Carryall_mcamo", "", 5000, { "", "", -1 } },
			{ "B_Bergen_dgtl_F", "", 17500, { "", "", -1 } }
        };
    };

    class reb_wsparcie2 {
        title = "STR_Shops_C_Rebel";
        license = "reb_wsparcie2";
        side = "civ";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam", "", 5000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_1_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_2_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_3_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_4_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_5_F", "", 20000, { "", "", -1 } },
            { "U_IG_Guerilla1_1", "", 20000, {"", "", -1} },
            { "U_IG_Guerrilla_6_1", "", 20000, {"", "", -1} },
            { "U_I_CombatUniform", "", 20000, { "", "", -1 } },
            { "U_I_CombatUniform_shortsleeve", "", 20000, { "", "", -1 } },
            { "U_B_T_Soldier_F", "", 20000, { "", "", -1 } },
            { "U_B_T_Soldier_AR_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Camo_F", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_1", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_2", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_3", "", 20000, { "", "", -1 } },
            { "U_O_SpecopsUniform_ocamo", "", 35000, { "", "", -1 } },
            { "U_B_CombatUniform_mcam", "", 55000, { "", "", -1 } },
            { "U_O_GhillieSuit", "", 75000, { "", "", -1 } },
            { "U_I_GhillieSuit", "", 75000, { "", "", -1 } },
            { "U_B_FullGhillie_ard", "", 150000, { "", "", -1 } },
            { "U_B_FullGhillie_sard", "", 150000, { "", "", -1 } },
            { "U_B_FullGhillie_lsh", "", 150000, { "", "", -1 } },
            { "U_O_T_FullGhillie_tna_F", "", 200000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } },
            { "H_Bandanna_camo", "", 500, { "", "", -1 } },
            { "H_Bandanna_mcamo", "", 500, { "", "", -1 } },
            { "H_Booniehat_indp", "", 500, { "", "", -1 } },
            { "H_Booniehat_mcamo", "", 500, { "", "", -1 } },
            { "H_Cap_brn_SPECOPS", "", 500, { "", "", -1 } },
            { "H_Cap_blk_Raven", "", 500, { "", "", -1 } },
            { "H_MilCap_ocamo", "", 500, { "", "", -1 } },
            { "H_MilCap_mcamo", "", 500, { "", "", -1 } },
            { "H_MilCap_oucamo", "", 500, { "", "", -1 } },
            { "H_MilCap_rucamo", "", 500, { "", "", -1 } },
            { "H_Shemag_olive", "Maska", 500, { "", "", -1 } },
            { "H_Shemag_olive_hs", "Maska", 500, { "", "", -1 } },
            { "H_CrewHelmetHeli_O", "", 50000, { "", "", -1 } },
            { "H_HelmetCrew_I", "", 80000, { "", "", -1 } },
            { "H_HelmetB_TI_tna_F", "", 60000, { "", "", -1 } },
            { "H_PilotHelmetFighter_B", "", 90000, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } },
            { "G_Shades_Black", "", 20, { "", "", -1 } },
            { "G_Shades_Blue", "", 20, { "", "", -1 } },
            { "G_Sport_Blackred", "", 25, { "", "", -1 } },
            { "G_Sport_Checkered", "", 25, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 25, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 25, { "", "", -1 } },
            { "G_Lowprofile", "", 30, { "", "", -1 } },
            { "G_Squares", "", 50, { "", "", -1 } },
            { "G_Combat", "", 125, { "", "", -1 } },
            { "G_Balaclava_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_aviator", "", 150, { "", "", -1 } },
            { "G_Bandanna_khk", "", 150, { "", "", -1 } },
            { "G_Bandanna_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_shades", "", 150, { "", "", -1 } },
            { "G_Bandanna_sport", "", 150, { "", "", -1 } },
            { "G_Bandanna_tan", "", 150, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } },
            { "V_TacVest_khk", "", 50000, { "", "", -1 } },
            { "V_TacVest_brn", "", 50000, { "", "", -1 } },
            { "V_TacVest_oli", "", 50000, { "", "", -1 } },
            { "V_TacVest_blk", "", 50000, { "", "", -1 } },
            { "V_TacVest_camo", "", 50000, { "", "", -1 } },
            { "V_PlateCarrier1_blk", "", 150000, { "", "", -1 } },
            { "V_PlateCarrier1_tna_F", "", 150000, { "", "", -1 } },
            { "V_PlateCarrier2_rgr", "", 200000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } },
            { "B_AssaultPack_dgtl", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_ocamo", "", 2000, { "", "", -1 } },
            { "B_FieldPack_ocamo", "", 3000, { "", "", -1 } },
            { "B_Kitbag_mcamo", "", 3000, { "", "", -1 } },
            { "B_TacticalPack_ocamo", "", 4000, { "", "", -1 } },
            { "B_TacticalPack_mcamo", "", 4000, { "", "", -1 } },
            { "B_Carryall_ocamo", "", 5000, { "", "", -1 } },
            { "B_Carryall_mcamo", "", 5000, { "", "", -1 } },
			{ "B_Bergen_dgtl_F", "", 17500, { "", "", -1 } }
        };
    };

    class reb_wsparcie3 {
        title = "STR_Shops_C_Rebel";
        license = "reb_wsparcie3";
        side = "civ";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam", "", 5000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_1_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_2_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_3_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_4_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_5_F", "", 20000, { "", "", -1 } },
            { "U_IG_Guerilla1_1", "", 20000, {"", "", -1} },
            { "U_IG_Guerrilla_6_1", "", 20000, {"", "", -1} },
            { "U_I_CombatUniform", "", 20000, { "", "", -1 } },
            { "U_I_CombatUniform_shortsleeve", "", 20000, { "", "", -1 } },
            { "U_B_T_Soldier_F", "", 20000, { "", "", -1 } },
            { "U_B_T_Soldier_AR_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Camo_F", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_1", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_2", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_3", "", 20000, { "", "", -1 } },
            { "U_O_SpecopsUniform_ocamo", "", 35000, { "", "", -1 } },
            { "U_B_CombatUniform_mcam", "", 55000, { "", "", -1 } },
            { "U_O_GhillieSuit", "", 75000, { "", "", -1 } },
            { "U_I_GhillieSuit", "", 75000, { "", "", -1 } },
            { "U_B_FullGhillie_ard", "", 150000, { "", "", -1 } },
            { "U_B_FullGhillie_sard", "", 150000, { "", "", -1 } },
            { "U_B_FullGhillie_lsh", "", 150000, { "", "", -1 } },
            { "U_O_T_FullGhillie_tna_F", "", 200000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } },
            { "H_Bandanna_camo", "", 500, { "", "", -1 } },
            { "H_Bandanna_mcamo", "", 500, { "", "", -1 } },
            { "H_Booniehat_indp", "", 500, { "", "", -1 } },
            { "H_Booniehat_mcamo", "", 500, { "", "", -1 } },
            { "H_Cap_brn_SPECOPS", "", 500, { "", "", -1 } },
            { "H_Cap_blk_Raven", "", 500, { "", "", -1 } },
            { "H_MilCap_ocamo", "", 500, { "", "", -1 } },
            { "H_MilCap_mcamo", "", 500, { "", "", -1 } },
            { "H_MilCap_oucamo", "", 500, { "", "", -1 } },
            { "H_MilCap_rucamo", "", 500, { "", "", -1 } },
            { "H_Shemag_olive", "Maska", 500, { "", "", -1 } },
            { "H_Shemag_olive_hs", "Maska", 500, { "", "", -1 } },
            { "H_CrewHelmetHeli_O", "", 50000, { "", "", -1 } },
            { "H_HelmetCrew_I", "", 80000, { "", "", -1 } },
            { "H_HelmetB_TI_tna_F", "", 60000, { "", "", -1 } },
            { "H_PilotHelmetFighter_B", "", 90000, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } },
            { "G_Shades_Black", "", 20, { "", "", -1 } },
            { "G_Shades_Blue", "", 20, { "", "", -1 } },
            { "G_Sport_Blackred", "", 25, { "", "", -1 } },
            { "G_Sport_Checkered", "", 25, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 25, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 25, { "", "", -1 } },
            { "G_Lowprofile", "", 30, { "", "", -1 } },
            { "G_Squares", "", 50, { "", "", -1 } },
            { "G_Combat", "", 125, { "", "", -1 } },
            { "G_Balaclava_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_aviator", "", 150, { "", "", -1 } },
            { "G_Bandanna_khk", "", 150, { "", "", -1 } },
            { "G_Bandanna_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_shades", "", 150, { "", "", -1 } },
            { "G_Bandanna_sport", "", 150, { "", "", -1 } },
            { "G_Bandanna_tan", "", 150, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } },
            { "V_TacVest_khk", "", 50000, { "", "", -1 } },
            { "V_TacVest_brn", "", 50000, { "", "", -1 } },
            { "V_TacVest_oli", "", 50000, { "", "", -1 } },
            { "V_TacVest_blk", "", 50000, { "", "", -1 } },
            { "V_TacVest_camo", "", 50000, { "", "", -1 } },
            { "V_PlateCarrier1_blk", "", 150000, { "", "", -1 } },
            { "V_PlateCarrier1_tna_F", "", 150000, { "", "", -1 } },
            { "V_PlateCarrier2_rgr", "", 200000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } },
            { "B_AssaultPack_dgtl", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_ocamo", "", 2000, { "", "", -1 } },
            { "B_FieldPack_ocamo", "", 3000, { "", "", -1 } },
            { "B_Kitbag_mcamo", "", 3000, { "", "", -1 } },
            { "B_TacticalPack_ocamo", "", 4000, { "", "", -1 } },
            { "B_TacticalPack_mcamo", "", 4000, { "", "", -1 } },
            { "B_Carryall_ocamo", "", 5000, { "", "", -1 } },
            { "B_Carryall_mcamo", "", 5000, { "", "", -1 } },
			{ "B_Bergen_dgtl_F", "", 17500, { "", "", -1 } }
        };
    };

    class reb_szturm1 {
        title = "STR_Shops_C_Rebel";
        license = "reb_szturm1";
        side = "civ";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam", "", 5000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_1_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_2_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_3_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_4_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_5_F", "", 20000, { "", "", -1 } },
            { "U_IG_Guerilla1_1", "", 20000, {"", "", -1} },
            { "U_IG_Guerrilla_6_1", "", 20000, {"", "", -1} },
            { "U_I_CombatUniform", "", 20000, { "", "", -1 } },
            { "U_I_CombatUniform_shortsleeve", "", 20000, { "", "", -1 } },
            { "U_B_T_Soldier_F", "", 20000, { "", "", -1 } },
            { "U_B_T_Soldier_AR_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Camo_F", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_1", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_2", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_3", "", 20000, { "", "", -1 } },
            { "U_O_SpecopsUniform_ocamo", "", 35000, { "", "", -1 } },
            { "U_B_CombatUniform_mcam", "", 55000, { "", "", -1 } },
            { "U_O_GhillieSuit", "", 75000, { "", "", -1 } },
            { "U_I_GhillieSuit", "", 75000, { "", "", -1 } },
            { "U_B_FullGhillie_ard", "", 150000, { "", "", -1 } },
            { "U_B_FullGhillie_sard", "", 150000, { "", "", -1 } },
            { "U_B_FullGhillie_lsh", "", 150000, { "", "", -1 } },
            { "U_O_T_FullGhillie_tna_F", "", 200000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } },
            { "H_Bandanna_camo", "", 500, { "", "", -1 } },
            { "H_Bandanna_mcamo", "", 500, { "", "", -1 } },
            { "H_Booniehat_indp", "", 500, { "", "", -1 } },
            { "H_Booniehat_mcamo", "", 500, { "", "", -1 } },
            { "H_Cap_brn_SPECOPS", "", 500, { "", "", -1 } },
            { "H_Cap_blk_Raven", "", 500, { "", "", -1 } },
            { "H_MilCap_ocamo", "", 500, { "", "", -1 } },
            { "H_MilCap_mcamo", "", 500, { "", "", -1 } },
            { "H_MilCap_oucamo", "", 500, { "", "", -1 } },
            { "H_MilCap_rucamo", "", 500, { "", "", -1 } },
            { "H_Shemag_olive", "Maska", 500, { "", "", -1 } },
            { "H_Shemag_olive_hs", "Maska", 500, { "", "", -1 } },
            { "H_CrewHelmetHeli_O", "", 50000, { "", "", -1 } },
            { "H_HelmetCrew_I", "", 80000, { "", "", -1 } },
            { "H_HelmetB_TI_tna_F", "", 60000, { "", "", -1 } },
            { "H_PilotHelmetFighter_B", "", 90000, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } },
            { "G_Shades_Black", "", 20, { "", "", -1 } },
            { "G_Shades_Blue", "", 20, { "", "", -1 } },
            { "G_Sport_Blackred", "", 25, { "", "", -1 } },
            { "G_Sport_Checkered", "", 25, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 25, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 25, { "", "", -1 } },
            { "G_Lowprofile", "", 30, { "", "", -1 } },
            { "G_Squares", "", 50, { "", "", -1 } },
            { "G_Combat", "", 125, { "", "", -1 } },
            { "G_Balaclava_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_aviator", "", 150, { "", "", -1 } },
            { "G_Bandanna_khk", "", 150, { "", "", -1 } },
            { "G_Bandanna_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_shades", "", 150, { "", "", -1 } },
            { "G_Bandanna_sport", "", 150, { "", "", -1 } },
            { "G_Bandanna_tan", "", 150, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } },
            { "V_TacVest_khk", "", 50000, { "", "", -1 } },
            { "V_TacVest_brn", "", 50000, { "", "", -1 } },
            { "V_TacVest_oli", "", 50000, { "", "", -1 } },
            { "V_TacVest_blk", "", 50000, { "", "", -1 } },
            { "V_TacVest_camo", "", 50000, { "", "", -1 } },
            { "V_PlateCarrier1_blk", "", 150000, { "", "", -1 } },
            { "V_PlateCarrier1_tna_F", "", 150000, { "", "", -1 } },
            { "V_PlateCarrier2_rgr", "", 200000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } },
            { "B_AssaultPack_dgtl", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_ocamo", "", 2000, { "", "", -1 } },
            { "B_FieldPack_ocamo", "", 3000, { "", "", -1 } },
            { "B_Kitbag_mcamo", "", 3000, { "", "", -1 } },
            { "B_TacticalPack_ocamo", "", 4000, { "", "", -1 } },
            { "B_TacticalPack_mcamo", "", 4000, { "", "", -1 } },
            { "B_Carryall_ocamo", "", 5000, { "", "", -1 } },
            { "B_Carryall_mcamo", "", 5000, { "", "", -1 } },
			{ "B_Bergen_dgtl_F", "", 17500, { "", "", -1 } }
        };
    };

    class reb_szturm2 {
        title = "STR_Shops_C_Rebel";
        license = "reb_szturm2";
        side = "civ";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam", "", 5000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_1_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_2_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_3_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_4_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_5_F", "", 20000, { "", "", -1 } },
            { "U_IG_Guerilla1_1", "", 20000, {"", "", -1} },
            { "U_IG_Guerrilla_6_1", "", 20000, {"", "", -1} },
            { "U_I_CombatUniform", "", 20000, { "", "", -1 } },
            { "U_I_CombatUniform_shortsleeve", "", 20000, { "", "", -1 } },
            { "U_B_T_Soldier_F", "", 20000, { "", "", -1 } },
            { "U_B_T_Soldier_AR_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Camo_F", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_1", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_2", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_3", "", 20000, { "", "", -1 } },
            { "U_O_SpecopsUniform_ocamo", "", 35000, { "", "", -1 } },
            { "U_B_CombatUniform_mcam", "", 55000, { "", "", -1 } },
            { "U_O_GhillieSuit", "", 75000, { "", "", -1 } },
            { "U_I_GhillieSuit", "", 75000, { "", "", -1 } },
            { "U_B_FullGhillie_ard", "", 150000, { "", "", -1 } },
            { "U_B_FullGhillie_sard", "", 150000, { "", "", -1 } },
            { "U_B_FullGhillie_lsh", "", 150000, { "", "", -1 } },
            { "U_O_T_FullGhillie_tna_F", "", 200000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } },
            { "H_Bandanna_camo", "", 500, { "", "", -1 } },
            { "H_Bandanna_mcamo", "", 500, { "", "", -1 } },
            { "H_Booniehat_indp", "", 500, { "", "", -1 } },
            { "H_Booniehat_mcamo", "", 500, { "", "", -1 } },
            { "H_Cap_brn_SPECOPS", "", 500, { "", "", -1 } },
            { "H_Cap_blk_Raven", "", 500, { "", "", -1 } },
            { "H_MilCap_ocamo", "", 500, { "", "", -1 } },
            { "H_MilCap_mcamo", "", 500, { "", "", -1 } },
            { "H_MilCap_oucamo", "", 500, { "", "", -1 } },
            { "H_MilCap_rucamo", "", 500, { "", "", -1 } },
            { "H_Shemag_olive", "Maska", 500, { "", "", -1 } },
            { "H_Shemag_olive_hs", "Maska", 500, { "", "", -1 } },
            { "H_CrewHelmetHeli_O", "", 50000, { "", "", -1 } },
            { "H_HelmetCrew_I", "", 80000, { "", "", -1 } },
            { "H_HelmetB_TI_tna_F", "", 60000, { "", "", -1 } },
            { "H_PilotHelmetFighter_B", "", 90000, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } },
            { "G_Shades_Black", "", 20, { "", "", -1 } },
            { "G_Shades_Blue", "", 20, { "", "", -1 } },
            { "G_Sport_Blackred", "", 25, { "", "", -1 } },
            { "G_Sport_Checkered", "", 25, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 25, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 25, { "", "", -1 } },
            { "G_Lowprofile", "", 30, { "", "", -1 } },
            { "G_Squares", "", 50, { "", "", -1 } },
            { "G_Combat", "", 125, { "", "", -1 } },
            { "G_Balaclava_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_aviator", "", 150, { "", "", -1 } },
            { "G_Bandanna_khk", "", 150, { "", "", -1 } },
            { "G_Bandanna_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_shades", "", 150, { "", "", -1 } },
            { "G_Bandanna_sport", "", 150, { "", "", -1 } },
            { "G_Bandanna_tan", "", 150, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } },
            { "V_TacVest_khk", "", 50000, { "", "", -1 } },
            { "V_TacVest_brn", "", 50000, { "", "", -1 } },
            { "V_TacVest_oli", "", 50000, { "", "", -1 } },
            { "V_TacVest_blk", "", 50000, { "", "", -1 } },
            { "V_TacVest_camo", "", 50000, { "", "", -1 } },
            { "V_PlateCarrier1_blk", "", 150000, { "", "", -1 } },
            { "V_PlateCarrier1_tna_F", "", 150000, { "", "", -1 } },
            { "V_PlateCarrier2_rgr", "", 200000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } },
            { "B_AssaultPack_dgtl", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_ocamo", "", 2000, { "", "", -1 } },
            { "B_FieldPack_ocamo", "", 3000, { "", "", -1 } },
            { "B_Kitbag_mcamo", "", 3000, { "", "", -1 } },
            { "B_TacticalPack_ocamo", "", 4000, { "", "", -1 } },
            { "B_TacticalPack_mcamo", "", 4000, { "", "", -1 } },
            { "B_Carryall_ocamo", "", 5000, { "", "", -1 } },
            { "B_Carryall_mcamo", "", 5000, { "", "", -1 } },
			{ "B_Bergen_dgtl_F", "", 17500, { "", "", -1 } }
        };
    };

    class reb_szturm3 {
        title = "STR_Shops_C_Rebel";
        license = "reb_szturm3";
        side = "civ";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam", "", 5000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_1_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_2_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_3_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_4_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_5_F", "", 20000, { "", "", -1 } },
            { "U_IG_Guerilla1_1", "", 20000, {"", "", -1} },
            { "U_IG_Guerrilla_6_1", "", 20000, {"", "", -1} },
            { "U_I_CombatUniform", "", 20000, { "", "", -1 } },
            { "U_I_CombatUniform_shortsleeve", "", 20000, { "", "", -1 } },
            { "U_B_T_Soldier_F", "", 20000, { "", "", -1 } },
            { "U_B_T_Soldier_AR_F", "", 20000, { "", "", -1 } },
            { "U_I_C_Soldier_Camo_F", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_1", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_2", "", 20000, { "", "", -1 } },
            { "U_B_CTRG_3", "", 20000, { "", "", -1 } },
            { "U_O_SpecopsUniform_ocamo", "", 35000, { "", "", -1 } },
            { "U_B_CombatUniform_mcam", "", 55000, { "", "", -1 } },
            { "U_O_GhillieSuit", "", 75000, { "", "", -1 } },
            { "U_I_GhillieSuit", "", 75000, { "", "", -1 } },
            { "U_B_FullGhillie_ard", "", 150000, { "", "", -1 } },
            { "U_B_FullGhillie_sard", "", 150000, { "", "", -1 } },
            { "U_B_FullGhillie_lsh", "", 150000, { "", "", -1 } },
            { "U_O_T_FullGhillie_tna_F", "", 200000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } },
            { "H_Bandanna_camo", "", 500, { "", "", -1 } },
            { "H_Bandanna_mcamo", "", 500, { "", "", -1 } },
            { "H_Booniehat_indp", "", 500, { "", "", -1 } },
            { "H_Booniehat_mcamo", "", 500, { "", "", -1 } },
            { "H_Cap_brn_SPECOPS", "", 500, { "", "", -1 } },
            { "H_Cap_blk_Raven", "", 500, { "", "", -1 } },
            { "H_MilCap_ocamo", "", 500, { "", "", -1 } },
            { "H_MilCap_mcamo", "", 500, { "", "", -1 } },
            { "H_MilCap_oucamo", "", 500, { "", "", -1 } },
            { "H_MilCap_rucamo", "", 500, { "", "", -1 } },
            { "H_Shemag_olive", "Maska", 500, { "", "", -1 } },
            { "H_Shemag_olive_hs", "Maska", 500, { "", "", -1 } },
            { "H_CrewHelmetHeli_O", "", 50000, { "", "", -1 } },
            { "H_HelmetCrew_I", "", 80000, { "", "", -1 } },
            { "H_HelmetB_TI_tna_F", "", 60000, { "", "", -1 } },
            { "H_PilotHelmetFighter_B", "", 90000, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } },
            { "G_Shades_Black", "", 20, { "", "", -1 } },
            { "G_Shades_Blue", "", 20, { "", "", -1 } },
            { "G_Sport_Blackred", "", 25, { "", "", -1 } },
            { "G_Sport_Checkered", "", 25, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 25, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 25, { "", "", -1 } },
            { "G_Lowprofile", "", 30, { "", "", -1 } },
            { "G_Squares", "", 50, { "", "", -1 } },
            { "G_Combat", "", 125, { "", "", -1 } },
            { "G_Balaclava_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_aviator", "", 150, { "", "", -1 } },
            { "G_Bandanna_khk", "", 150, { "", "", -1 } },
            { "G_Bandanna_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_shades", "", 150, { "", "", -1 } },
            { "G_Bandanna_sport", "", 150, { "", "", -1 } },
            { "G_Bandanna_tan", "", 150, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } },
            { "V_TacVest_khk", "", 50000, { "", "", -1 } },
            { "V_TacVest_brn", "", 50000, { "", "", -1 } },
            { "V_TacVest_oli", "", 50000, { "", "", -1 } },
            { "V_TacVest_blk", "", 50000, { "", "", -1 } },
            { "V_TacVest_camo", "", 50000, { "", "", -1 } },
            { "V_PlateCarrier1_blk", "", 150000, { "", "", -1 } },
            { "V_PlateCarrier1_tna_F", "", 150000, { "", "", -1 } },
            { "V_PlateCarrier2_rgr", "", 200000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } },
            { "B_AssaultPack_dgtl", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_ocamo", "", 2000, { "", "", -1 } },
            { "B_FieldPack_ocamo", "", 3000, { "", "", -1 } },
            { "B_Kitbag_mcamo", "", 3000, { "", "", -1 } },
            { "B_TacticalPack_ocamo", "", 4000, { "", "", -1 } },
            { "B_TacticalPack_mcamo", "", 4000, { "", "", -1 } },
            { "B_Carryall_ocamo", "", 5000, { "", "", -1 } },
            { "B_Carryall_mcamo", "", 5000, { "", "", -1 } },
			{ "B_Bergen_dgtl_F", "", 17500, { "", "", -1 } }
        };
    };

    class c_don1 {
        title = "STR_Shops_C_Rebel";
        license = "don1";
        side = "civ";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam", "", 5000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_1_F", "", 15000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_2_F", "", 15000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_3_F", "", 15000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_4_F", "", 15000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_5_F", "", 15000, { "", "", -1 } },
            { "U_IG_Guerilla1_1", "", 15000, {"", "", -1} },
            { "U_IG_Guerrilla_6_1", "", 15000, {"", "", -1} },
            { "U_I_CombatUniform", "", 15000, { "", "", -1 } },
            { "U_I_CombatUniform_shortsleeve", "", 15000, { "", "", -1 } },
            { "U_B_T_Soldier_F", "", 15000, { "", "", -1 } },
            { "U_B_T_Soldier_AR_F", "", 15000, { "", "", -1 } },
            { "U_I_C_Soldier_Camo_F", "", 15000, { "", "", -1 } },
            { "U_B_CTRG_1", "", 15000, { "", "", -1 } },
            { "U_B_CTRG_2", "", 15000, { "", "", -1 } },
            { "U_B_CTRG_3", "", 15000, { "", "", -1 } },
            { "U_O_SpecopsUniform_ocamo", "", 30000, { "", "", -1 } },
            { "U_B_CombatUniform_mcam", "", 40000, { "", "", -1 } },
            { "U_O_GhillieSuit", "", 65000, { "", "", -1 } },
            { "U_I_GhillieSuit", "", 65000, { "", "", -1 } },
            { "U_B_FullGhillie_ard", "", 125000, { "", "", -1 } },
            { "U_B_FullGhillie_sard", "", 125000, { "", "", -1 } },
            { "U_B_FullGhillie_lsh", "", 125000, { "", "", -1 } },
            { "U_O_T_FullGhillie_tna_F", "", 150000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } },
            { "H_Bandanna_camo", "", 500, { "", "", -1 } },
            { "H_Bandanna_mcamo", "", 500, { "", "", -1 } },
            { "H_Booniehat_indp", "", 500, { "", "", -1 } },
            { "H_Booniehat_mcamo", "", 500, { "", "", -1 } },
            { "H_Cap_brn_SPECOPS", "", 500, { "", "", -1 } },
            { "H_Cap_blk_Raven", "", 500, { "", "", -1 } },
            { "H_MilCap_ocamo", "", 500, { "", "", -1 } },
            { "H_MilCap_mcamo", "", 500, { "", "", -1 } },
            { "H_MilCap_oucamo", "", 500, { "", "", -1 } },
            { "H_MilCap_rucamo", "", 500, { "", "", -1 } },
            { "H_Shemag_olive", "Maska", 500, { "", "", -1 } },
            { "H_Shemag_olive_hs", "Maska", 500, { "", "", -1 } },
            { "H_CrewHelmetHeli_O", "", 40000, { "", "", -1 } },
            { "H_HelmetCrew_I", "", 70000, { "", "", -1 } },
            { "H_HelmetB_TI_tna_F", "", 50000, { "", "", -1 } },
            { "H_PilotHelmetFighter_B", "", 80000, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } },
            { "G_Shades_Black", "", 20, { "", "", -1 } },
            { "G_Shades_Blue", "", 20, { "", "", -1 } },
            { "G_Sport_Blackred", "", 25, { "", "", -1 } },
            { "G_Sport_Checkered", "", 25, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 25, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 25, { "", "", -1 } },
            { "G_Lowprofile", "", 30, { "", "", -1 } },
            { "G_Squares", "", 50, { "", "", -1 } },
            { "G_Combat", "", 125, { "", "", -1 } },
            { "G_Balaclava_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_aviator", "", 150, { "", "", -1 } },
            { "G_Bandanna_khk", "", 150, { "", "", -1 } },
            { "G_Bandanna_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_shades", "", 150, { "", "", -1 } },
            { "G_Bandanna_sport", "", 150, { "", "", -1 } },
            { "G_Bandanna_tan", "", 150, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } },
            { "V_TacVest_khk", "", 50000, { "", "", -1 } },
            { "V_TacVest_brn", "", 50000, { "", "", -1 } },
            { "V_TacVest_oli", "", 50000, { "", "", -1 } },
            { "V_TacVest_blk", "", 50000, { "", "", -1 } },
            { "V_TacVest_camo", "", 50000, { "", "", -1 } },
            { "V_PlateCarrier1_blk", "", 125000, { "", "", -1 } },
            { "V_PlateCarrier1_tna_F", "", 125000, { "", "", -1 } },
            { "V_PlateCarrier2_rgr", "", 150000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } },
            { "B_AssaultPack_dgtl", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_ocamo", "", 2000, { "", "", -1 } },
            { "B_FieldPack_ocamo", "", 3000, { "", "", -1 } },
            { "B_Kitbag_mcamo", "", 3000, { "", "", -1 } },
            { "B_TacticalPack_ocamo", "", 4000, { "", "", -1 } },
            { "B_TacticalPack_mcamo", "", 4000, { "", "", -1 } },
            { "B_Carryall_ocamo", "", 5000, { "", "", -1 } },
            { "B_Carryall_mcamo", "", 5000, { "", "", -1 } },
			{ "B_Bergen_dgtl_F", "", 17500, { "", "", -1 } }
        };
    };

    class c_don2 {
        title = "STR_Shops_C_Rebel";
        license = "don2";
        side = "civ";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam", "", 2500, { "", "", -1 } },
            { "U_I_C_Soldier_Para_1_F", "", 10000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_2_F", "", 10000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_3_F", "", 10000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_4_F", "", 10000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_5_F", "", 10000, { "", "", -1 } },
            { "U_IG_Guerilla1_1", "", 10000, {"", "", -1} },
            { "U_IG_Guerrilla_6_1", "", 10000, {"", "", -1} },
            { "U_I_CombatUniform", "", 10000, { "", "", -1 } },
            { "U_I_CombatUniform_shortsleeve", "", 10000, { "", "", -1 } },
            { "U_B_T_Soldier_F", "", 10000, { "", "", -1 } },
            { "U_B_T_Soldier_AR_F", "", 10000, { "", "", -1 } },
            { "U_I_C_Soldier_Camo_F", "", 10000, { "", "", -1 } },
            { "U_B_CTRG_1", "", 10000, { "", "", -1 } },
            { "U_B_CTRG_2", "", 10000, { "", "", -1 } },
            { "U_B_CTRG_3", "", 10000, { "", "", -1 } },
            { "U_O_SpecopsUniform_ocamo", "", 25000, { "", "", -1 } },
            { "U_B_CombatUniform_mcam", "", 35000, { "", "", -1 } },
            { "U_O_GhillieSuit", "", 55000, { "", "", -1 } },
            { "U_I_GhillieSuit", "", 55000, { "", "", -1 } },
            { "U_B_FullGhillie_ard", "", 100000, { "", "", -1 } },
            { "U_B_FullGhillie_sard", "", 100000, { "", "", -1 } },
            { "U_B_FullGhillie_lsh", "", 100000, { "", "", -1 } },
            { "U_O_T_FullGhillie_tna_F", "", 125000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } },
            { "H_Bandanna_camo", "", 500, { "", "", -1 } },
            { "H_Bandanna_mcamo", "", 500, { "", "", -1 } },
            { "H_Booniehat_indp", "", 500, { "", "", -1 } },
            { "H_Booniehat_mcamo", "", 500, { "", "", -1 } },
            { "H_Cap_brn_SPECOPS", "", 500, { "", "", -1 } },
            { "H_Cap_blk_Raven", "", 500, { "", "", -1 } },
            { "H_MilCap_ocamo", "", 500, { "", "", -1 } },
            { "H_MilCap_mcamo", "", 500, { "", "", -1 } },
            { "H_MilCap_oucamo", "", 500, { "", "", -1 } },
            { "H_MilCap_rucamo", "", 500, { "", "", -1 } },
            { "H_Shemag_olive", "Maska", 500, { "", "", -1 } },
            { "H_Shemag_olive_hs", "Maska", 500, { "", "", -1 } },
            { "H_CrewHelmetHeli_O", "", 35000, { "", "", -1 } },
            { "H_HelmetCrew_I", "", 55000, { "", "", -1 } },
            { "H_HelmetB_TI_tna_F", "", 40000, { "", "", -1 } },
            { "H_PilotHelmetFighter_B", "", 65000, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } },
            { "G_Shades_Black", "", 20, { "", "", -1 } },
            { "G_Shades_Blue", "", 20, { "", "", -1 } },
            { "G_Sport_Blackred", "", 25, { "", "", -1 } },
            { "G_Sport_Checkered", "", 25, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 25, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 25, { "", "", -1 } },
            { "G_Lowprofile", "", 30, { "", "", -1 } },
            { "G_Squares", "", 50, { "", "", -1 } },
            { "G_Combat", "", 125, { "", "", -1 } },
            { "G_Balaclava_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_aviator", "", 150, { "", "", -1 } },
            { "G_Bandanna_khk", "", 150, { "", "", -1 } },
            { "G_Bandanna_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_shades", "", 150, { "", "", -1 } },
            { "G_Bandanna_sport", "", 150, { "", "", -1 } },
            { "G_Bandanna_tan", "", 150, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } },
            { "V_TacVest_khk", "", 35000, { "", "", -1 } },
            { "V_TacVest_brn", "", 35000, { "", "", -1 } },
            { "V_TacVest_oli", "", 35000, { "", "", -1 } },
            { "V_TacVest_blk", "", 35000, { "", "", -1 } },
            { "V_TacVest_camo", "", 35000, { "", "", -1 } },
            { "V_PlateCarrier1_blk", "", 100000, { "", "", -1 } },
            { "V_PlateCarrier1_tna_F", "", 100000, { "", "", -1 } },
            { "V_PlateCarrier2_rgr", "", 135000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } },
            { "B_AssaultPack_dgtl", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_ocamo", "", 2000, { "", "", -1 } },
            { "B_FieldPack_ocamo", "", 3000, { "", "", -1 } },
            { "B_Kitbag_mcamo", "", 3000, { "", "", -1 } },
            { "B_TacticalPack_ocamo", "", 4000, { "", "", -1 } },
            { "B_TacticalPack_mcamo", "", 4000, { "", "", -1 } },
            { "B_Carryall_ocamo", "", 5000, { "", "", -1 } },
            { "B_Carryall_mcamo", "", 5000, { "", "", -1 } },
			{ "B_Bergen_dgtl_F", "", 17500, { "", "", -1 } }
        };
    };

class c_don3 {
        title = "STR_Shops_C_Rebel";
        license = "don3";
        side = "civ";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam", "", 1500, { "", "", -1 } },
            { "U_I_C_Soldier_Para_1_F", "", 5000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_2_F", "", 5000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_3_F", "", 5000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_4_F", "", 5000, { "", "", -1 } },
            { "U_I_C_Soldier_Para_5_F", "", 5000, { "", "", -1 } },
            { "U_IG_Guerilla1_1", "", 5000, {"", "", -1} },
            { "U_IG_Guerrilla_6_1", "", 5000, {"", "", -1} },
            { "U_I_CombatUniform", "", 5000, { "", "", -1 } },
            { "U_I_CombatUniform_shortsleeve", "", 5000, { "", "", -1 } },
            { "U_B_T_Soldier_F", "", 5000, { "", "", -1 } },
            { "U_B_T_Soldier_AR_F", "", 5000, { "", "", -1 } },
            { "U_I_C_Soldier_Camo_F", "", 5000, { "", "", -1 } },
            { "U_B_CTRG_1", "", 5000, { "", "", -1 } },
            { "U_B_CTRG_2", "", 5000, { "", "", -1 } },
            { "U_B_CTRG_3", "", 5000, { "", "", -1 } },
            { "U_O_SpecopsUniform_ocamo", "", 20000, { "", "", -1 } },
            { "U_B_CombatUniform_mcam", "", 25000, { "", "", -1 } },
            { "U_O_GhillieSuit", "", 35000, { "", "", -1 } },
            { "U_I_GhillieSuit", "", 35000, { "", "", -1 } },
            { "U_B_FullGhillie_ard", "", 75000, { "", "", -1 } },
            { "U_B_FullGhillie_sard", "", 75000, { "", "", -1 } },
            { "U_B_FullGhillie_lsh", "", 75000, { "", "", -1 } },
            { "U_O_T_FullGhillie_tna_F", "", 100000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } },
            { "H_Bandanna_camo", "", 500, { "", "", -1 } },
            { "H_Bandanna_mcamo", "", 500, { "", "", -1 } },
            { "H_Booniehat_indp", "", 500, { "", "", -1 } },
            { "H_Booniehat_mcamo", "", 500, { "", "", -1 } },
            { "H_Cap_brn_SPECOPS", "", 500, { "", "", -1 } },
            { "H_Cap_blk_Raven", "", 500, { "", "", -1 } },
            { "H_MilCap_ocamo", "", 500, { "", "", -1 } },
            { "H_MilCap_mcamo", "", 500, { "", "", -1 } },
            { "H_MilCap_oucamo", "", 500, { "", "", -1 } },
            { "H_MilCap_rucamo", "", 500, { "", "", -1 } },
            { "H_Shemag_olive", "Maska", 500, { "", "", -1 } },
            { "H_Shemag_olive_hs", "Maska", 500, { "", "", -1 } },
            { "H_CrewHelmetHeli_O", "", 30000, { "", "", -1 } },
            { "H_HelmetCrew_I", "", 45000, { "", "", -1 } },
            { "H_HelmetB_TI_tna_F", "", 35000, { "", "", -1 } },
            { "H_PilotHelmetFighter_B", "", 50000, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } },
            { "G_Shades_Black", "", 20, { "", "", -1 } },
            { "G_Shades_Blue", "", 20, { "", "", -1 } },
            { "G_Sport_Blackred", "", 25, { "", "", -1 } },
            { "G_Sport_Checkered", "", 25, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 25, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 25, { "", "", -1 } },
            { "G_Lowprofile", "", 30, { "", "", -1 } },
            { "G_Squares", "", 50, { "", "", -1 } },
            { "G_Combat", "", 125, { "", "", -1 } },
            { "G_Balaclava_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_aviator", "", 150, { "", "", -1 } },
            { "G_Bandanna_khk", "", 150, { "", "", -1 } },
            { "G_Bandanna_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_shades", "", 150, { "", "", -1 } },
            { "G_Bandanna_sport", "", 150, { "", "", -1 } },
            { "G_Bandanna_tan", "", 150, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } },
            { "V_TacVest_khk", "", 25000, { "", "", -1 } },
            { "V_TacVest_brn", "", 25000, { "", "", -1 } },
            { "V_TacVest_oli", "", 25000, { "", "", -1 } },
            { "V_TacVest_blk", "", 25000, { "", "", -1 } },
            { "V_TacVest_camo", "", 25000, { "", "", -1 } },
            { "V_PlateCarrier1_blk", "", 75000, { "", "", -1 } },
            { "V_PlateCarrier1_tna_F", "", 75000, { "", "", -1 } },
            { "V_PlateCarrier2_rgr", "", 100000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } },
            { "B_AssaultPack_dgtl", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_ocamo", "", 2000, { "", "", -1 } },
            { "B_FieldPack_ocamo", "", 3000, { "", "", -1 } },
            { "B_Kitbag_mcamo", "", 3000, { "", "", -1 } },
            { "B_TacticalPack_ocamo", "", 4000, { "", "", -1 } },
            { "B_TacticalPack_mcamo", "", 4000, { "", "", -1 } },
            { "B_Carryall_ocamo", "", 5000, { "", "", -1 } },
            { "B_Carryall_mcamo", "", 5000, { "", "", -1 } },
			{ "B_Bergen_dgtl_F", "", 17500, { "", "", -1 } }
        };
    };
	class c_don4 {
        title = "STR_Shops_C_Rebel";
        license = "don4";
        side = "civ";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam", "", 500, { "", "", -1 } },
            { "U_I_C_Soldier_Para_1_F", "", 3500, { "", "", -1 } },
            { "U_I_C_Soldier_Para_2_F", "", 3500, { "", "", -1 } },
            { "U_I_C_Soldier_Para_3_F", "", 3500, { "", "", -1 } },
            { "U_I_C_Soldier_Para_4_F", "", 3500, { "", "", -1 } },
            { "U_I_C_Soldier_Para_5_F", "", 3500, { "", "", -1 } },
            { "U_IG_Guerilla1_1", "", 3500, {"", "", -1} },
            { "U_IG_Guerrilla_6_1", "", 3500, {"", "", -1} },
            { "U_I_CombatUniform", "", 3500, { "", "", -1 } },
            { "U_I_CombatUniform_shortsleeve", "", 3500, { "", "", -1 } },
            { "U_B_T_Soldier_F", "", 3500, { "", "", -1 } },
            { "U_B_T_Soldier_AR_F", "", 3500, { "", "", -1 } },
            { "U_I_C_Soldier_Camo_F", "", 3500, { "", "", -1 } },
            { "U_B_CTRG_1", "", 3500, { "", "", -1 } },
            { "U_B_CTRG_2", "", 3500, { "", "", -1 } },
            { "U_B_CTRG_3", "", 3500, { "", "", -1 } },
            { "U_I_Protagonist_VR", "", 3500, { "", "", -1 } },
            { "U_O_Protagonist_VR", "", 3500, { "", "", -1 } },
            { "U_B_Protagonist_VR", "", 3500, { "", "", -1 } },
            { "U_O_SpecopsUniform_ocamo", "", 12500, { "", "", -1 } },
            { "U_B_CombatUniform_mcam", "", 12500, { "", "", -1 } },
            { "U_O_GhillieSuit", "", 20000, { "", "", -1 } },
            { "U_I_GhillieSuit", "", 20000, { "", "", -1 } },
            { "U_B_FullGhillie_ard", "", 50000, { "", "", -1 } },
            { "U_B_FullGhillie_sard", "", 50000, { "", "", -1 } },
            { "U_B_FullGhillie_lsh", "", 50000, { "", "", -1 } },
            { "U_O_T_FullGhillie_tna_F", "", 70000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } },
            { "H_Bandanna_camo", "", 500, { "", "", -1 } },
            { "H_Bandanna_mcamo", "", 500, { "", "", -1 } },
            { "H_Booniehat_indp", "", 500, { "", "", -1 } },
            { "H_Booniehat_mcamo", "", 500, { "", "", -1 } },
            { "H_Cap_brn_SPECOPS", "", 500, { "", "", -1 } },
            { "H_Cap_blk_Raven", "", 500, { "", "", -1 } },
            { "H_MilCap_ocamo", "", 500, { "", "", -1 } },
            { "H_MilCap_mcamo", "", 500, { "", "", -1 } },
            { "H_MilCap_oucamo", "", 500, { "", "", -1 } },
            { "H_MilCap_rucamo", "", 500, { "", "", -1 } },
            { "H_Shemag_olive", "Maska", 500, { "", "", -1 } },
            { "H_Shemag_olive_hs", "Maska", 500, { "", "", -1 } },
            { "H_CrewHelmetHeli_O", "", 20000, { "", "", -1 } },
            { "H_HelmetCrew_I", "", 30000, { "", "", -1 } },
            { "H_HelmetB_TI_tna_F", "", 20000, { "", "", -1 } },
            { "H_HelmetCrew_O", "", 29000, { "", "", -1 } },  	  
			{ "H_PilotHelmetFighter_B", "", 29000, { "", "", -1 } },
			{ "H_PilotHelmetFighter_I", "", 29000, { "", "", -1 } },
			{ "H_HelmetSpecO_ocamo", "", 39000, { "", "", -1 } },
			{ "H_HelmetLeaderO_ocamo", "", 58000, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } },
            { "G_Shades_Black", "", 20, { "", "", -1 } },
            { "G_Shades_Blue", "", 20, { "", "", -1 } },
            { "G_Sport_Blackred", "", 25, { "", "", -1 } },
            { "G_Sport_Checkered", "", 25, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 25, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 25, { "", "", -1 } },
            { "G_Lowprofile", "", 30, { "", "", -1 } },
            { "G_Squares", "", 50, { "", "", -1 } },
            { "G_Combat", "", 125, { "", "", -1 } },
            { "G_Balaclava_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_aviator", "", 150, { "", "", -1 } },
            { "G_Bandanna_khk", "", 150, { "", "", -1 } },
            { "G_Bandanna_oli", "", 150, { "", "", -1 } },
            { "G_Bandanna_shades", "", 150, { "", "", -1 } },
            { "G_Bandanna_sport", "", 150, { "", "", -1 } },
            { "G_Bandanna_tan", "", 150, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } },
            { "V_TacVest_khk", "", 18000, { "", "", -1 } },
            { "V_TacVest_brn", "", 18000, { "", "", -1 } },
            { "V_TacVest_oli", "", 18000, { "", "", -1 } },
            { "V_TacVest_blk", "", 18000, { "", "", -1 } },
            { "V_TacVest_camo", "", 18000, { "", "", -1 } },
            { "V_PlateCarrier1_blk", "", 50000, { "", "", -1 } },
            { "V_PlateCarrier1_tna_F", "", 50000, { "", "", -1 } },
            { "V_PlateCarrier2_rgr", "", 70000, { "", "", -1 } },
			{ "V_PlateCarrierSpec_rgr", "", 90000, { "", "", -1 } }
			
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } },
            { "B_AssaultPack_dgtl", "", 1000, { "", "", -1 } },
            { "B_AssaultPack_ocamo", "", 1000, { "", "", -1 } },
            { "B_FieldPack_ocamo", "", 1500, { "", "", -1 } },
            { "B_Kitbag_mcamo", "", 1500, { "", "", -1 } },
            { "B_TacticalPack_ocamo", "", 2000, { "", "", -1 } },
            { "B_TacticalPack_mcamo", "", 2000, { "", "", -1 } },
            { "B_Carryall_ocamo", "", 3000, { "", "", -1 } },
            { "B_Carryall_mcamo", "", 3000, { "", "", -1 } },
			{ "B_Bergen_dgtl_F", "", 17500, { "", "", -1 } }
        };
    };


    class kart {
        title = "STR_Shops_C_Kart";
        license = "";
        side = "civ";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
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
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } },
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
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } }
        };
    };
	 class scientist {
        title = "STR_Shops_scientist";
        license = "uranoc";
        side = "civ";
        uniforms[] = {
            { "NONE", "Usuń Uniform", 0, { "", "", -1 } },
            { "U_C_Scientist", "Kombinezon na promieniowanie", 65000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Usuń Czapkę", 0, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Usuń Okulary", 0, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Usuń Kamizelke", 0, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Usuń Plecak", 0, { "", "", -1 } },
			{ "B_AssaultPack_khk", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_rgr", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_sgg", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_cbr", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_mcamo", "", 2000, { "", "", -1 } },
            { "B_TacticalPack_oli", "", 2500, { "", "", -1 } },
            { "B_Kitbag_sgg", "", 3500, { "", "", -1 } },
            { "B_Kitbag_cbr", "", 3500, { "", "", -1 } },
            { "B_FieldPack_blk", "", 5000, { "", "", -1 } },
            { "B_FieldPack_ocamo", "", 5000, { "", "", -1 } },
            { "B_FieldPack_oucamo", "", 5000, { "", "", -1 } },
            { "B_Bergen_sgg", "", 6500, { "", "", -1 } },
            { "B_Bergen_mcamo", "", 6500, { "", "", -1 } },
            { "B_Bergen_rgr", "", 6500, { "", "", -1 } },
            { "B_Bergen_blk", "", 6500, { "", "", -1 } },
            { "B_Carryall_mcamo", "", 7500, { "", "", -1 } },
            { "B_Carryall_oli", "", 7500, { "", "", -1 } },
            { "B_Carryall_khk", "", 7500, { "", "", -1 } },
            { "B_Carryall_cbr", "", 7500, { "", "", -1 } }
        };
	 };
};
