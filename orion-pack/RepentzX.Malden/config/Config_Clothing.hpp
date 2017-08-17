/*
*    ARRAY FORMAT:
*        0: STRING (Classname)
*        1: STRING (Display Name, leave as "" for default)
*        2: SCALAR (Price)
*        3: STRING (Conditions) - Must return boolean :
*            String can contain any amount of conditions, aslong as the entire
*            string returns a boolean. This allows you to check any levels, licenses etc,
*            in any combination. For example:
*                "call life_coplevel && license_civ_someLicense"
*            This will also let you call any other function.
*
*   Clothing classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Equipment
*   Backpacks/remaining classnames can be found here (TIP: Search page for "pack"): https://community.bistudio.com/wiki/Arma_3_CfgVehicles_EMPTY
*
*/
class Clothing {
    class bruce {
        title = "STR_Shops_C_Bruce";
        conditions = "";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            { "U_C_Scientist", "Radiation Suit", 4250, "" },
            { "NONE", "Remove Uniform", 0, "" },
            { "U_C_Poloshirt_stripped", "Poloshirt stripped", 125, "" },
            { "U_C_Poloshirt_redwhite", "Poloshirt Red/White", 150, "" },
            { "U_C_Poloshirt_salmon", "Poloshirt Salmon", 175, "" },
            { "U_C_Poloshirt_blue", "Poloshirt Blue / Monster", 250, "" },
            { "U_C_Poor_2", "Rag tagged clothes", 250, "" },
            { "U_C_Poloshirt_burgundy", "Poloshirt Burgundy", 275, "" },
            { "U_C_Poloshirt_tricolour", "Poloshirt Tricolor", 350, "" },
            { "U_IG_Guerilla2_2", "Green stripped shirt & Pants", 650, "" },
            { "U_IG_Guerilla3_1", "Brown Jacket & Pants", 735, "" },
            { "U_OrestesBody", "Surfing On Land", 1100, "" },
            { "U_IG_Guerilla2_3", "The Outback Rangler", 1200, "" },
            { "U_C_HunterBody_grn", "The Hunters Look", 1500, "" },
            { "U_C_Man_casual_1_F", "Casual Wears", 5000, "" },
            { "U_C_Man_casual_2_F", "Casual Wears", 5000, "" }, //Apex DLC
            { "U_C_Man_casual_3_F", "Casual Wears", 5000, "" }, //Apex DLC
            { "U_C_Man_casual_4_F", "Casual Wears", 5000, "" }, //Apex DLC
            { "U_C_Man_casual_5_F", "Casual Wears", 5000, "" }, //Apex DLC
            { "U_C_Man_casual_6_F", "Casual Wears", 5000, "" }, //Apex DLC
            { "U_C_man_sport_1_F", "Casual Wears", 5000, "" }, //Apex DLC
            { "U_C_man_sport_2_F", "Casual Wears", 5000, "" }, //Apex DLC
            { "U_C_man_sport_3_F", "Casual Wears", 5000, "" }, //Apex DLC
            { "U_C_Man_casual_4_F", "", 175, "" },
            { "U_C_Man_casual_2_F", "", 175, "" },
            { "U_C_Man_casual_3_F", "", 175, "" },
            { "U_C_Man_casual_1_F", "", 175, "" },
            { "U_C_Man_casual_5_F", "", 175, "" },
            { "U_C_Man_casual_6_F", "", 175, "" },
            { "U_I_C_Soldier_Bandit_4_F", "Slumdog Polo (Checkered)", 100, "" },
            { "U_I_C_Soldier_Bandit_1_F", "Slumdog Polo (Brown)", 100, "" },
            { "U_I_C_Soldier_Bandit_2_F", "", 2500, "" },
            { "U_C_Poor_1", "Begger tagged clothes", 175, "" },
            { "U_C_Poor_2", "Worn tagged clothes", 175, "" },
            { "U_OrestesBody", "Surfing On Land", 550, "" },
            { "U_C_man_sport_1_F", "", 75, "" },
            { "U_NikosBody", "Nikos", 2500, "" },
            { "U_NikosAgedBody", "Casual Wears", 2500, "" },
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" },
            { "H_CrewHelmetHeli_B", "Hazmat Breather", 3750, "" },
            { "H_Bandanna_blu", "Blue Bandanna", 60, "" },
            { "H_Bandanna_surfer", "Surfer Bandanna", 65, "" },
            { "H_Bandanna_gry", "Grey Bandanna", 75, "" },
            { "H_Bandanna_cbr", "", 80, "" },
            { "H_Bandanna_surfer_grn", "", 65, "" },
            { "H_Bandanna_khk", "Khaki Bandanna", 70, "" },
            { "H_Bandanna_sgg", "Sage Bandanna", 80, "" },
            { "H_StrawHat", "Straw Fedora", 115, "" },
            { "H_BandMask_blk", "Hat & Bandanna", 150, "" },
            { "H_Booniehat_tan", "", 215, "" },
            { "H_Booniehat_oli", "", 215, "" },
            { "H_Booniehat_grn", "", 215, "" },
            { "H_Booniehat_dirty", "", 215, "" },
            { "H_Booniehat_khk_hs", "", 215, "" },
            { "H_H_MilCap_gry", "", 75, "" },
            { "H_MilCap_blue", "", 75, "" },
            { "H_Hat_blue", "", 140, "" },
            { "H_Hat_brown", "", 140, "" },
            { "H_Hat_checker", "", 170, "" },
            { "H_Hat_grey", "", 140, "" },
            { "H_Hat_tan", "", 130, "" },
            { "H_Cap_blu", "", 75, "" },
            { "H_Cap_blk", "", 75, "" },
            { "H_Cap_blk_CMMG", "", 75, "" },
            { "H_Cap_grn", "", 75, "" },
            { "H_Cap_grn_BI", "", 75, "" },
            { "H_Cap_blk_ION", "", 75, "" },
            { "H_Cap_usblack", "", 75, "" },
            { "H_Cap_surfer", "", 75, "" },
            { "H_Cap_oli", "", 75, "" },
            { "H_Cap_red", "", 75, "" },
            { "H_Cap_tan", "", 75, "" },
            { "H_Helmet_Skate", "", 300, "" },
            { "H_Watchcap_sgg", "", 425, "" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" },
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
            { "NONE", $STR_C_Remove_vests, 0, "" },
            { "V_DeckCrew_blue_F", "", 4500, "" },
            { "V_DeckCrew_brown_F", "", 4500, "" },
            { "V_DeckCrew_green_F", "", 4500, "" },
            { "V_DeckCrew_red_F", "", 4500, "" },
            { "V_DeckCrew_violet_F", "", 4500, "" },
            { "V_DeckCrew_yellow_F", "", 4500, "" },
            { "V_DeckCrew_white_F", "", 4500, "" }     
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" },
            { "B_OutdoorPack_blk", "", 500, "" },
            { "B_AssaultPack_khk", "", 2000, "" },
            { "B_AssaultPack_dgtl", "", 2000, "" },
            { "B_AssaultPack_rgr", "", 2000, "" },
            { "B_AssaultPack_sgg", "", 2000, "" },
            { "B_AssaultPack_blk", "", 2000, "" },
            { "B_AssaultPack_cbr", "", 2000, "" },
            { "B_AssaultPack_mcamo", "", 2000, "" },
            { "B_AssaultPack_tna_f", "", 2000, "" }, //Apex DLC
            { "B_TacticalPack_oli", "", 2500, "" },
            { "B_Kitbag_mcamo", "", 3500, "" },
            { "B_Kitbag_sgg", "", 3500, "" },
            { "B_Kitbag_cbr", "", 3500, "" },
            { "B_FieldPack_blk", "", 5000, "" },
            { "B_FieldPack_ocamo", "", 5000, "" },
            { "B_FieldPack_oucamo", "", 5000, "" },
            { "B_FieldPack_ghex_f", "", 5000, "" }, //Apex DLC
            { "B_Bergen_sgg", "", 6500, "" },
            { "B_Bergen_mcamo", "", 6500, "" },
            { "B_Bergen_rgr", "", 6500, "" },
            { "B_Bergen_blk", "", 6500, "" },
            { "B_Carryall_ocamo", "", 7500, "" },
            { "B_Carryall_oucamo", "", 7500, "" },
            { "B_Carryall_mcamo", "", 7500, "" },
            { "B_Carryall_oli", "", 7500, "" },
            { "B_Carryall_khk", "", 7500, "" },
            { "B_Carryall_cbr", "", 7500, "" },
            { "B_Carryall_ghex_f", "", 7500, "" }, //Apex DLC
            { "B_Bergen_dgtl_f", "", 6500, "" }, //Apex DLC
            { "B_Bergen_tna_f", "", 6500, "" } //Apex DLC
        };
    };

    class cop {
        title = "STR_Shops_C_Police";
        conditions = "";
        side = "cop";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            { "U_Rangemaster", $STR_C_Cop_uniforms, 25, "" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" },
            { "H_Cap_police", "", 25, "" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" },
            { "G_Squares", "", 10, "" },
            { "G_Shades_Blue", "", 20, "" },
            { "G_Sport_Blackred", "", 20, "" },
            { "G_Sport_Checkered", "", 20, "" },
            { "G_Sport_Blackyellow", "", 20, "" },
            { "G_Sport_BlackWhite", "", 20, "" },
            { "G_Shades_Black", "", 25, "" },
            { "G_Lowprofile", "", 30, "" },
            { "G_Combat", "", 55, "" },
            { "G_Aviator", "", 100, "" },
            { "G_Lady_Mirror", "", 150, "" },
            { "G_Lady_Dark", "", 150, "" },
            { "G_Lady_Blue", "", 150, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" },
            { "V_TacVest_blk_POLICE", "", 1000, "" },
            { "V_PlateCarrier2_blk", "", 2500, "call life_coplevel >= 2" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" },
            { "B_AssaultPack_Kerry", "", 700, "" },
            { "B_Carryall_cbr", "", 3500, "" }
        };
    };

    class dive {
        title = "STR_Shops_C_Diving";
        conditions = "license_civ_dive";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            { "U_B_Wetsuit", "", 2000, "" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" },
            { "G_Diving", "", 500, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" },
            { "V_RebreatherB", "", 5000, "" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" }
        };
    };

    class cop_boat {
        title = "STR_Shops_C_Diving";
        conditions = "";
        side = "cop";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            { "U_B_Wetsuit", "", 2000, "" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" },
            { "G_Diving", "", 100, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" },
            { "V_RebreatherB", "", 1000, "" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" },
            { "B_ViperHarness_blk_F", "", 1000, "" }
        };
    };

    class gun_clothing {
        title = "STR_Shops_C_Gun";
        conditions = "license_civ_gun";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" },
            { "V_Rangemaster_belt", "", 2900, "" },
            { "V_DeckCrew_blue_F", "", 4500, "" },
            { "V_DeckCrew_brown_F", "", 4500, "" },
            { "V_DeckCrew_green_F", "", 4500, "" },
            { "V_DeckCrew_red_F", "", 4500, "" },
            { "V_DeckCrew_violet_F", "", 4500, "" },
            { "V_DeckCrew_yellow_F", "", 4500, "" },
            { "V_DeckCrew_white_F", "", 4500, "" } 
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" }
        };
    };

    class gang_clothing {
        title = "STR_Shops_C_Gang";
        conditions = "";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" },
            { "V_Rangemaster_belt", "", 1900, "" },
            { "V_DeckCrew_blue_F", "", 4500, "" },
            { "V_DeckCrew_brown_F", "", 4500, "" },
            { "V_DeckCrew_green_F", "", 4500, "" },
            { "V_DeckCrew_red_F", "", 4500, "" },
            { "V_DeckCrew_violet_F", "", 4500, "" },
            { "V_DeckCrew_yellow_F", "", 4500, "" },
            { "V_DeckCrew_white_F", "", 4500, "" } 
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" }
        };
    };

    class med_clothing {
        title = "STR_MAR_EMS_Clothing_Shop";
        conditions = "";
        side = "med";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            { "U_C_WorkerCoveralls", $STR_C_EMS_uniforms, 50, "" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" },
            { "H_Cap_marshal", "", 10, "" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" },
            { "G_Shades_Blue", "", 10, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" },
            { "B_TacticalPack_blk", $STR_C_EMS_backpacks, 3000, "" }
        };
    };

    class reb {
        title = "STR_Shops_C_Rebel";
        conditions = "mav_ttm_var_rebel == 1;";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            { "U_I_C_Soldier_Bandit_5_F", "", 100, "" },
            { "U_I_C_Soldier_Bandit_3_F", "", 100, "" },
            { "U_O_SpecopsUniform_ocamo", "", 8750, "" },
            { "U_O_Wetsuit", "", 8750, "" },
            { "U_IG_Guerilla1_1", "", 4500, "" },
            { "U_I_G_Story_Protagonist_F", "", 8750, "" },
            { "U_I_G_resistanceLeader_F", "", 7750, "" },
            { "U_IG_leader", "Guerilla Leader", 17670, "" },
            { "U_O_T_Officer_F", "Officer Fatigues", 12500, "" },
            { "U_I_CombatUniform", "", 8750, "" },
            { "U_B_T_Soldier_AR_F", "", 15500, "" },
            { "U_B_T_Soldier_F", "", 11500, "" },
            { "U_B_survival_uniform", "", 15000, "" },
            { "U_I_C_Soldier_Para_2_F", "", 10500, "" },
            { "U_I_C_Soldier_Para_3_F", "", 8500, "" },
            { "U_I_C_Soldier_Para_5_F", "", 5000, "" },
            { "U_I_C_Soldier_Para_4_F", "", 5000, "" },
            { "U_I_C_Soldier_Para_1_F", "", 8500, "" },
            { "U_I_C_Soldier_Camo_F", "Syndikat Uniform", 10000, "" },
            { "U_B_CTRG_Soldier_F", "Stealth Uniform (Tropic)", 25000, "" },
            { "U_Marshal", "", 2500, "" },
            { "U_B_CombatUniform_mcam_vest", "", 4500, "" },
            { "U_B_T_Soldier_SL_F", "", 9500, "" },
            { "U_O_V_Soldier_Viper_F", "", 9500, "" },
            { "U_O_V_Soldier_Viper_hex_F", "", 9500, "" },
            { "U_B_CTRG_Soldier_urb_2_F", "", 4500, "" },
            { "U_B_CTRG_Soldier_urb_3_F", "", 4500, "" },
            { "U_B_CTRG_Soldier_urb_1_F", "", 4500, "" },
            { "U_B_CTRG_Soldier_2_F", "", 4500, "" },
            { "U_I_OfficerUniform", "", 4500, "" },
            { "U_B_CombatUniform_mcam_tshirt", "", 4500, "" },
            { "U_B_CombatUniform_mcam", "", 4500, "" },
            { "U_I_CombatUniform_shortsleeve", "", 4500, "" },
            { "U_O_CombatUniform_oucamo", "", 4500, "" },
            { "U_B_GEN_Soldier_F", "", 8500, "" },
            { "U_BG_Guerilla1_1", "", 4500, "" },
            { "U_BG_Guerilla2_2", "", 4500, "" },
            { "U_BG_Guerilla2_1", "", 4500, "" },
            { "U_BG_Guerilla2_3", "", 4500, "" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" },
            { "H_MilCap_oucamo", "", 500, "" },
            { "H_MilCap_gen_F", "", 400, "" },
            { "H_MilCap_tna_F", "", 400, "" },
            { "H_Beret_gen_F", "", 2000, "" },
            { "H_Bandanna_mcamo", "", 250, "" },
            { "H_Bandanna_camo", "", 250, "" },
            { "H_Booniehat_mcamo", "Booniehat (MTP)", 500, "" },
            { "H_Booniehat_indp", " Booniehat (Khaki)", 500, "" },
            { "H_Booniehat_tna_F", "Booniehat (Tropic)", 500, "" },
            { "H_TurbanO_blk", "Black Turban", 500, "" },
            { "H_Hat_camo", "", 500, "" },
            { "H_HelmetO_ocamo", "", 1000, "" },
            { "H_HelmetO_ghex_F", "", 1000, "" },
            { "H_HelmetB_light", "", 1000, "" },
            { "H_HelmetB_light_desert", "", 1000, "" },
            { "H_HelmetB_light_grass", "", 1000, "" },
            { "H_HelmetB_light_sand", "", 1000, "" },
            { "H_HelmetB_light_snakeskin", "", 1000, "" },
            { "H_HelmetB_Light_tna_F", "", 1000, "" },
            { "H_HelmetB_Enh_tna_F", "", 1000, "" },
            { "H_HelmetB_paint", "", 1000, "" },
            { "H_HelmetB_plain_mcamo", "", 1000, "" },
            { "H_HelmetB_tna_F", "", 1000, "" },
            { "H_HelmetIA_net", "", 1000, "" },
            { "H_HelmetSpecO_ocamo", "", 1000, "" },
            { "H_Shemag_tan", "", 400, "" },
            { "H_Shemag_olive_hs", "", 400, "" },
            { "H_ShemagOpen_tan", "", 425, "" },
            { "H_Shemag_olive", "", 425, "" },
            { "H_HelmetCrew_O_ghex_F", "", 500, "" },
            { "H_HelmetB_TI_tna_F", "", 500, "" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" },
            { "G_Shades_Black", "", 20, "" },
            { "G_Shades_Blue", "", 20, "" },
            { "G_Sport_Blackred", "", 25, "" },
            { "G_Sport_Checkered", "", 25, "" },
            { "G_Sport_Blackyellow", "", 25, "" },
            { "G_Sport_BlackWhite", "", 25, "" },
            { "G_Lowprofile", "", 30, "" },
            { "G_Squares", "", 50, "" },
            { "G_Combat", "", 125, "" },
            { "G_Balaclava_blk", "", 150, "" },
            { "G_Balaclava_combat", "", 150, "" },
            { "G_Balaclava_lowprofile", "", 150, "" },
            { "G_Balaclava_oli", "", 150, "" },
            { "G_Bandanna_aviator", "", 150, "" },
            { "G_Bandanna_beast", "", 150, "" },
            { "G_Bandanna_blk", "", 150, "" },
            { "G_Bandanna_khk", "", 150, "" },
            { "G_Bandanna_oli", "", 150, "" },
            { "G_Bandanna_shades", "", 150, "" },
            { "G_Bandanna_sport", "", 150, "" },
            { "G_Bandanna_tan", "", 150, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" },
            { "V_Chestrig_khk", "", 1500, "" },
            { "V_TacVest_brn", "", 3250, "" },
            { "V_TacVest_camo", "", 3250, "" },
            { "V_TacVest_khk", "", 3250, "" },
            { "V_TacVest_oli", "", 3250, "" },
            { "V_PlateCarrierIA1_dgtl", "", 16500, "" },
            { "V_PlateCarrier2_rgr", "", 24500, "" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" },
            { "B_OutdoorPack_blk", "", 500, "" },
            { "B_AssaultPack_khk", "", 2000, "" },
            { "B_AssaultPack_dgtl", "", 2000, "" },
            { "B_AssaultPack_rgr", "", 2000, "" },
            { "B_AssaultPack_sgg", "", 2000, "" },
            { "B_AssaultPack_blk", "", 2000, "" },
            { "B_AssaultPack_cbr", "", 2000, "" },
            { "B_AssaultPack_mcamo", "", 2000, "" },
            { "B_TacticalPack_oli", "", 2500, "" },
            { "B_Kitbag_mcamo", "", 3500, "" },
            { "B_Kitbag_sgg", "", 3500, "" },
            { "B_Kitbag_cbr", "", 3500, "" },
            { "B_FieldPack_blk", "", 5000, "" },
            { "B_FieldPack_ocamo", "", 5000, "" },
            { "B_FieldPack_oucamo", "", 5000, "" },
            { "B_Bergen_sgg", "", 6500, "" },
            { "B_Bergen_mcamo", "", 6500, "" },
            { "B_Bergen_rgr", "", 6500, "" },
            { "B_Bergen_blk", "", 6500, "" },
            { "B_Carryall_ocamo", "", 7500, "" },
            { "B_Carryall_oucamo", "", 7500, "" },
            { "B_Carryall_mcamo", "", 7500, "" },
            { "B_Carryall_oli", "", 7500, "" },
            { "B_Carryall_khk", "", 7500, "" },
            { "B_Carryall_cbr", "", 7500, "" },
            { "B_Bergen_dgtl_f", "", 19500, "" }, 
            { "B_Bergen_tna_f", "", 19500, "" } 
        };
    };

    class terrorist_clothing {
        title = "STR_Shops_C_Terrorist";
        conditions = "mav_ttm_var_terrorist == 1;";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            { "U_I_C_Soldier_Bandit_5_F", "", 100, "" },
            { "U_I_C_Soldier_Bandit_3_F", "", 100, "" },
            { "U_O_SpecopsUniform_ocamo", "", 8750, "" },
            { "U_O_Wetsuit", "", 8750, "" },
            { "U_IG_Guerilla1_1", "", 4500, "" },
            { "U_I_G_Story_Protagonist_F", "", 8750, "" },
            { "U_I_G_resistanceLeader_F", "", 7750, "" },
            { "U_IG_leader", "Guerilla Leader", 17670, "" },
            { "U_O_T_Officer_F", "Officer Fatigues", 12500, "" },
            { "U_I_CombatUniform", "", 8750, "" },
            { "U_B_T_Soldier_AR_F", "", 15500, "" },
            { "U_B_T_Soldier_F", "", 11500, "" },
            { "U_B_survival_uniform", "", 15000, "" },
            { "U_I_C_Soldier_Para_2_F", "", 10500, "" },
            { "U_I_C_Soldier_Para_3_F", "", 8500, "" },
            { "U_I_C_Soldier_Para_5_F", "", 5000, "" },
            { "U_I_C_Soldier_Para_4_F", "", 5000, "" },
            { "U_I_C_Soldier_Para_1_F", "", 8500, "" },
            { "U_I_C_Soldier_Camo_F", "Syndikat Uniform", 10000, "" },
            { "U_B_CTRG_Soldier_F", "Stealth Uniform (Tropic)", 25000, "" },
            { "U_Marshal", "", 2500, "" },
            { "U_B_CombatUniform_mcam_vest", "", 4500, "" },
            { "U_B_T_Soldier_SL_F", "", 9500, "" },
            { "U_O_V_Soldier_Viper_F", "", 9500, "" },
            { "U_O_V_Soldier_Viper_hex_F", "", 9500, "" },
            { "U_B_CTRG_Soldier_urb_2_F", "", 4500, "" },
            { "U_B_CTRG_Soldier_urb_3_F", "", 4500, "" },
            { "U_B_CTRG_Soldier_urb_1_F", "", 4500, "" },
            { "U_B_CTRG_Soldier_2_F", "", 4500, "" },
            { "U_I_OfficerUniform", "", 4500, "" },
            { "U_B_CombatUniform_mcam_tshirt", "", 4500, "" },
            { "U_B_CombatUniform_mcam", "", 4500, "" },
            { "U_I_CombatUniform_shortsleeve", "", 4500, "" },
            { "U_O_CombatUniform_oucamo", "", 4500, "" },
            { "U_B_GEN_Soldier_F", "", 8500, "" },
            { "U_BG_Guerilla1_1", "", 4500, "" },
            { "U_BG_Guerilla2_2", "", 4500, "" },
            { "U_BG_Guerilla2_1", "", 4500, "" },
            { "U_BG_Guerilla2_3", "", 4500, "" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" },
            { "H_ShemagOpen_khk", "", 800, "" },
            { "H_MilCap_oucamo", "", 500, "" },
            { "H_MilCap_gen_F", "", 400, "" },
            { "H_MilCap_tna_F", "", 400, "" },
            { "H_Beret_gen_F", "", 2000, "" },
            { "H_Bandanna_mcamo", "", 250, "" },
            { "H_Bandanna_camo", "", 250, "" },
            { "H_Booniehat_mcamo", "Booniehat (MTP)", 500, "" },
            { "H_Booniehat_indp", " Booniehat (Khaki)", 500, "" },
            { "H_Booniehat_tna_F", "Booniehat (Tropic)", 500, "" },
            { "H_TurbanO_blk", "Black Turban", 500, "" },
            { "H_Hat_camo", "", 500, "" },
            { "H_HelmetO_ocamo", "", 1000, "" },
            { "H_HelmetO_ghex_F", "", 1000, "" },
            { "H_HelmetB_light", "", 1000, "" },
            { "H_HelmetB_light_desert", "", 1000, "" },
            { "H_HelmetB_light_grass", "", 1000, "" },
            { "H_HelmetB_light_sand", "", 1000, "" },
            { "H_HelmetB_light_snakeskin", "", 1000, "" },
            { "H_HelmetB_Light_tna_F", "", 1000, "" },
            { "H_HelmetB_Enh_tna_F", "", 1000, "" },
            { "H_HelmetB_paint", "", 1000, "" },
            { "H_HelmetB_plain_mcamo", "", 1000, "" },
            { "H_HelmetB_tna_F", "", 1000, "" },
            { "H_HelmetIA_net", "", 1000, "" },
            { "H_HelmetSpecO_ocamo", "", 1000, "" },
            { "H_Shemag_tan", "", 400, "" },
            { "H_Shemag_olive_hs", "", 400, "" },
            { "H_ShemagOpen_tan", "", 425, "" },
            { "H_Shemag_olive", "", 425, "" },
            { "H_HelmetCrew_O_ghex_F", "", 500, "" },
            { "H_HelmetB_TI_tna_F", "", 500, "" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" },
            { "G_Shades_Black", "", 20, "" },
            { "G_Shades_Blue", "", 20, "" },
            { "G_Sport_Blackred", "", 25, "" },
            { "G_Sport_Checkered", "", 25, "" },
            { "G_Sport_Blackyellow", "", 25, "" },
            { "G_Sport_BlackWhite", "", 25, "" },
            { "G_Lowprofile", "", 30, "" },
            { "G_Squares", "", 50, "" },
            { "G_Combat", "", 125, "" },
            { "G_Balaclava_blk", "", 150, "" },
            { "G_Balaclava_combat", "", 150, "" },
            { "G_Balaclava_lowprofile", "", 150, "" },
            { "G_Balaclava_oli", "", 150, "" },
            { "G_Bandanna_aviator", "", 150, "" },
            { "G_Bandanna_beast", "", 150, "" },
            { "G_Bandanna_blk", "", 150, "" },
            { "G_Bandanna_khk", "", 150, "" },
            { "G_Bandanna_oli", "", 150, "" },
            { "G_Bandanna_shades", "", 150, "" },
            { "G_Bandanna_sport", "", 150, "" },
            { "G_Bandanna_tan", "", 150, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" },
            { "V_Chestrig_khk", "", 1500, "" },
            { "V_TacVest_brn", "", 3250, "" },
            { "V_TacVest_camo", "", 3250, "" },
            { "V_TacVest_khk", "", 3250, "" },
            { "V_TacVest_oli", "", 3250, "" },
            { "V_PlateCarrierIA1_dgtl", "", 16500, "" },
            { "V_PlateCarrier2_rgr", "", 24500, "" },
            { "V_PlateCarrierIAGL_dgtl", "", 30500, "" },
            { "V_HarnessOGL_gry", "Suicide Vest", 1200000, "" } //SUICIDE
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" },
            { "B_OutdoorPack_blk", "", 500, "" },
            { "B_AssaultPack_khk", "", 2000, "" },
            { "B_AssaultPack_dgtl", "", 2000, "" },
            { "B_AssaultPack_rgr", "", 2000, "" },
            { "B_AssaultPack_sgg", "", 2000, "" },
            { "B_AssaultPack_blk", "", 2000, "" },
            { "B_AssaultPack_cbr", "", 2000, "" },
            { "B_AssaultPack_mcamo", "", 2000, "" },
            { "B_TacticalPack_oli", "", 2500, "" },
            { "B_Kitbag_mcamo", "", 3500, "" },
            { "B_Kitbag_sgg", "", 3500, "" },
            { "B_Kitbag_cbr", "", 3500, "" },
            { "B_FieldPack_blk", "", 5000, "" },
            { "B_FieldPack_ocamo", "", 5000, "" },
            { "B_FieldPack_oucamo", "", 5000, "" },
            { "B_Bergen_sgg", "", 6500, "" },
            { "B_Bergen_mcamo", "", 6500, "" },
            { "B_Bergen_rgr", "", 6500, "" },
            { "B_Bergen_blk", "", 6500, "" },
            { "B_Carryall_ocamo", "", 7500, "" },
            { "B_Carryall_oucamo", "", 7500, "" },
            { "B_Carryall_mcamo", "", 7500, "" },
            { "B_Carryall_oli", "", 7500, "" },
            { "B_Carryall_khk", "", 7500, "" },
            { "B_Carryall_cbr", "", 7500, "" },
            { "B_Bergen_dgtl_f", "", 19500, "" }, 
            { "B_Bergen_tna_f", "", 19500, "" } 
            
        };
    };

    class donator_clothing {
        title = "STR_Shops_C_Donator";
        conditions = "call life_donorlevel >= 1";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            { "U_I_C_Soldier_Bandit_5_F", "", 100, "" },
            { "U_I_C_Soldier_Bandit_3_F", "", 100, "" },
            { "U_O_SpecopsUniform_ocamo", "", 4750, "" },
            { "U_O_Wetsuit", "", 4750, "" },
            { "U_IG_Guerilla1_1", "", 4500, "" },
            { "U_I_G_Story_Protagonist_F", "", 8750, "" },
            { "U_I_G_resistanceLeader_F", "", 4750, "" },
            { "U_IG_leader", "Guerilla Leader", 7670, "" },
            { "U_O_T_Officer_F", "Officer Fatigues", 8500, "" },
            { "U_I_CombatUniform", "", 4750, "" },
            { "U_B_T_Soldier_AR_F", "", 5500, "" },
            { "U_B_T_Soldier_F", "", 4500, "" },
            { "U_B_survival_uniform", "", 5000, "" },
            { "U_I_C_Soldier_Para_2_F", "", 5500, "" },
            { "U_I_C_Soldier_Para_3_F", "", 3500, "" },
            { "U_I_C_Soldier_Para_5_F", "", 3000, "" },
            { "U_I_C_Soldier_Para_4_F", "", 3000, "" },
            { "U_I_C_Soldier_Para_1_F", "", 3500, "" },
            { "U_I_C_Soldier_Camo_F", "Syndikat Uniform", 6000, "" },
            { "U_B_CTRG_Soldier_F", "Stealth Uniform (Tropic)", 13000, "" },
            { "U_Marshal", "", 2500, "" },
            { "U_B_CombatUniform_mcam_vest", "", 4500, "" },
            { "U_B_T_Soldier_SL_F", "", 3500, "" },
            { "U_O_V_Soldier_Viper_F", "", 3500, "" },
            { "U_O_V_Soldier_Viper_hex_F", "", 3500, "" },
            { "U_B_CTRG_Soldier_urb_2_F", "", 2500, "" },
            { "U_B_CTRG_Soldier_urb_3_F", "", 2500, "" },
            { "U_B_CTRG_Soldier_urb_1_F", "", 2500, "" },
            { "U_B_CTRG_Soldier_2_F", "", 2500, "" },
            { "U_I_OfficerUniform", "", 2500, "" },
            { "U_B_CombatUniform_mcam_tshirt", "", 2500, "" },
            { "U_B_CombatUniform_mcam", "", 2500, "" },
            { "U_I_CombatUniform_shortsleeve", "", 2500, "" },
            { "U_O_CombatUniform_oucamo", "", 2500, "" },
            { "U_B_GEN_Soldier_F", "", 3500, "" },
            { "U_BG_Guerilla1_1", "", 2500, "" },
            { "U_BG_Guerilla2_2", "", 2500, "" },
            { "U_BG_Guerilla2_1", "", 2500, "" },
            { "U_BG_Guerilla2_3", "", 2500, "" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" },
            { "H_ShemagOpen_khk", "", 800, "" },
            { "H_MilCap_oucamo", "", 500, "" },
            { "H_MilCap_gen_F", "", 400, "" },
            { "H_MilCap_tna_F", "", 400, "" },
            { "H_Beret_gen_F", "", 2000, "" },
            { "H_Bandanna_mcamo", "", 250, "" },
            { "H_Bandanna_camo", "", 250, "" },
            { "H_Booniehat_mcamo", "Booniehat (MTP)", 500, "" },
            { "H_Booniehat_indp", " Booniehat (Khaki)", 500, "" },
            { "H_Booniehat_tna_F", "Booniehat (Tropic)", 500, "" },
            { "H_TurbanO_blk", "Black Turban", 500, "" },
            { "H_Hat_camo", "", 500, "" },
            { "H_HelmetO_ocamo", "", 1000, "" },
            { "H_HelmetO_ghex_F", "", 1000, "" },
            { "H_HelmetB_light", "", 1000, "" },
            { "H_HelmetB_light_desert", "", 1000, "" },
            { "H_HelmetB_light_grass", "", 1000, "" },
            { "H_HelmetB_light_sand", "", 1000, "" },
            { "H_HelmetB_light_snakeskin", "", 1000, "" },
            { "H_HelmetB_Light_tna_F", "", 1000, "" },
            { "H_HelmetB_Enh_tna_F", "", 1000, "" },
            { "H_HelmetB_paint", "", 1000, "" },
            { "H_HelmetB_plain_mcamo", "", 1000, "" },
            { "H_HelmetB_tna_F", "", 1000, "" },
            { "H_HelmetIA_net", "", 1000, "" },
            { "H_HelmetSpecO_ocamo", "", 1000, "" },
            { "H_Shemag_tan", "", 400, "" },
            { "H_Shemag_olive_hs", "", 400, "" },
            { "H_ShemagOpen_tan", "", 425, "" },
            { "H_Shemag_olive", "", 425, "" },
            { "H_HelmetCrew_O_ghex_F", "", 500, "" },
            { "H_HelmetB_TI_tna_F", "", 500, "" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" },
            { "G_Shades_Black", "", 20, "" },
            { "G_Shades_Blue", "", 20, "" },
            { "G_Sport_Blackred", "", 25, "" },
            { "G_Sport_Checkered", "", 25, "" },
            { "G_Sport_Blackyellow", "", 25, "" },
            { "G_Sport_BlackWhite", "", 25, "" },
            { "G_Lowprofile", "", 30, "" },
            { "G_Squares", "", 50, "" },
            { "G_Combat", "", 125, "" },
            { "G_Balaclava_blk", "", 150, "" },
            { "G_Balaclava_combat", "", 150, "" },
            { "G_Balaclava_lowprofile", "", 150, "" },
            { "G_Balaclava_oli", "", 150, "" },
            { "G_Bandanna_aviator", "", 150, "" },
            { "G_Bandanna_beast", "", 150, "" },
            { "G_Bandanna_blk", "", 150, "" },
            { "G_Bandanna_khk", "", 150, "" },
            { "G_Bandanna_oli", "", 150, "" },
            { "G_Bandanna_shades", "", 150, "" },
            { "G_Bandanna_sport", "", 150, "" },
            { "G_Bandanna_tan", "", 150, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" },
            { "V_Chestrig_khk", "", 1500, "" },
            { "V_TacVest_brn", "", 3250, "" },
            { "V_TacVest_camo", "", 3250, "" },
            { "V_TacVest_khk", "", 3250, "" },
            { "V_TacVest_oli", "", 3250, "" },
            { "V_PlateCarrierIA1_dgtl", "", 6500, "" },
            { "V_PlateCarrier2_rgr", "", 14500, "" },
            { "V_PlateCarrierIAGL_dgtl", "", 20500, "" },
            { "V_HarnessOGL_gry", "Suicide Vest", 800000, "" } //SUICIDE
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" },
            { "B_OutdoorPack_blk", "", 200, "" },
            { "B_AssaultPack_khk", "", 1000, "" },
            { "B_AssaultPack_dgtl", "", 1000, "" },
            { "B_AssaultPack_rgr", "", 1000, "" },
            { "B_AssaultPack_sgg", "", 1000, "" },
            { "B_AssaultPack_blk", "", 1000, "" },
            { "B_AssaultPack_cbr", "", 1000, "" },
            { "B_AssaultPack_mcamo", "", 1000, "" },
            { "B_TacticalPack_oli", "", 500, "" },
            { "B_Kitbag_mcamo", "", 1500, "" },
            { "B_Kitbag_sgg", "", 31500, "" },
            { "B_Kitbag_cbr", "", 1500, "" },
            { "B_FieldPack_blk", "", 2000, "" },
            { "B_FieldPack_ocamo", "", 2000, "" },
            { "B_FieldPack_oucamo", "", 2000, "" },
            { "B_Bergen_sgg", "", 2500, "" },
            { "B_Bergen_mcamo", "", 2500, "" },
            { "B_Bergen_rgr", "", 2500, "" },
            { "B_Bergen_blk", "", 2500, "" },
            { "B_Carryall_ocamo", "", 3500, "" },
            { "B_Carryall_oucamo", "", 3500, "" },
            { "B_Carryall_mcamo", "", 3500, "" },
            { "B_Carryall_oli", "", 3500, "" },
            { "B_Carryall_khk", "", 3500, "" },
            { "B_Carryall_cbr", "", 3500, "" },
            { "B_Bergen_dgtl_f", "", 9500, "" }, 
            { "B_Bergen_tna_f", "", 9500, "" } 
            
        };
    };

    class kart {
        title = "STR_Shops_C_Kart";
        conditions = "";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
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
            { "NONE", $STR_C_Remove_headgear, 0, "" },
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
            { "NONE", $STR_C_Remove_goggles, 0, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" }
        };
    };
};
