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
            { "NONE", "Remove Uniform", 0, "" },
            { "U_C_Poloshirt_stripped", "Poloshirt stripped", 125, "" },
            { "U_C_Poloshirt_redwhite", "Poloshirt Red/White", 150, "" },
            { "U_C_Poloshirt_salmon", "Poloshirt Salmon", 175, "" },
            { "U_C_Poloshirt_blue", "Poloshirt Blue", 250, "" },
            { "U_C_Poor_2", "Rag tagged clothes", 250, "" },
            { "U_C_Poloshirt_burgundy", "Poloshirt Burgundy", 275, "" },
            { "U_C_Poloshirt_tricolour", "Poloshirt Tricolor", 350, "" },
            { "U_IG_Guerilla2_2", "Green stripped shirt & Pants", 650, "" },
            { "U_IG_Guerilla3_1", "Brown Jacket & Pants", 735, "" },
            { "U_OrestesBody", "Surfing On Land", 1100, "" },
            { "U_IG_Guerilla2_3", "The Outback Rangler", 1200, "" },
            { "U_C_HunterBody_grn", "The Hunters Look", 1500, "" },
            { "U_C_WorkerCoveralls", "Mechanic Coveralls", 2500, "" },
            { "U_NikosAgedBody", "Casual Wears", 5000, "" }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, "" },
            { "H_Bandanna_camo", "Camo Bandanna", 120, "" },
            { "H_Bandanna_surfer", "Surfer Bandanna", 130, "" },
            { "H_Bandanna_khk", "Khaki Bandanna", 145, "" },
            { "H_Cap_blu", "", 150, "" },
            { "H_Cap_grn", "", 150, "" },
            { "H_Cap_grn_BI", "", 150, "" },
            { "H_Cap_oli", "", 150, "" },
            { "H_Cap_red", "", 150, "" },
            { "H_Cap_tan", "", 150, "" },
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
            { "H_Booniehat_tan", "", 425, "" }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, "" },
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
            { "NONE", "Remove Vest", 0, "" }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, "" },
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
            { "B_Bergen_dgtl_F", "", 15000, "" },
            { "B_Bergen_hex_F", "", 15000, "" },
            { "B_Bergen_mcamo_F", "", 15000, "" },
            { "B_Bergen_tna_F", "", 15000, "" }
        };
    };

    class cop {
        title = "STR_Shops_C_Police";
        conditions = "";
        side = "cop";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, "" },
            { "U_Rangemaster", "OB Uniform", 1000, "" },
			      { "U_IG_Guerilla2_1", "Cop Uniform", 1500, "call life_coplevel >= 2" },
			      { "U_IG_Guerilla2_3", "Kommissar Uniform", 1750, "call life_coplevel >= 5" },
            { "U_B_CombatUniform_mcam_tshirt", "", 2000, "call life_coplevel >= 4 && {license_cop_sek} " },
            { "U_B_CombatUniform_mcam_worn", "", 2000, "call life_coplevel >= 4 && {license_cop_sek} " },
            { "U_B_survival_uniform", "", 2000, "call life_coplevel >= 3" },
            { "U_NikosAgedBody", "Casual Wears", 2000, "license_cop_verhandler" }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, "" },
            { "H_Cap_police", "", 50, "" },
            { "H_Beret_blk_POLICE", "", 50, "call life_coplevel >= 2" },
            { "H_HelmetB_plain_mcamo", "", 100, "call life_coplevel >= 3" },
			      { "H_HelmetSpecB_blk", "", 100, "call life_coplevel >= 4" },
			      { "H_Beret_Colonel", "", 75, "call life_coplevel >= 6" },
            { "H_MilCap_mcamo", "", 50, "call life_coplevel >= 2" },
            { "H_Booniehat_mcamo", "", 50, "call life_coplevel >= 2" }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, "" },
            { "G_Squares", "", 10, "" },
            { "G_Shades_Blue", "", 20, "" },
            { "G_Sport_Blackred", "", 20, "" },
            { "G_Sport_Checkered", "", 20, "" },
            { "G_Sport_Blackyellow", "", 20, "" },
            { "G_Sport_BlackWhite", "", 20, "" },
            { "G_Shades_Black", "", 25, "" },
            { "G_Lowprofile", "", 30, "" },
            { "G_Combat", "Gasmaske", 500, "call life_coplevel >= 3" },
			      { "G_Balaclava_combat", "", 500, "license_cop_sek" },
			      { "G_B_Diving", "", 60, "call life_coplevel >= 3" },
            { "G_Aviator", "", 100, "" },
            { "G_Lady_Mirror", "", 150, "" },
            { "G_Lady_Dark", "", 150, "" },
            { "G_Lady_Blue", "", 150, "" }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, "" },
            { "V_Rangemaster_belt", "", 800, "" },
            { "V_TacVest_blk_POLICE", "", 1000, "call life_coplevel >= 1" },
            { "V_PlateCarrier1_blk", "", 1500, "call life_coplevel >= 4" },
			      { "V_PlateCarrierSpec_blk", "", 3500, "call life_coplevel >= 7" },
			      { "V_RebreatherB", "", 500, "call life_coplevel >= 3" }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, "" },
            { "B_FieldPack_cbr", "", 500, "" },
            { "B_AssaultPack_cbr", "", 700, "" },
            { "B_Kitbag_cbr", "", 800, "" },
            { "B_Bergen_sgg", "", 2500, "" },
            { "B_Carryall_cbr", "", 3500, "" }
        };
    };

    class dive {
        title = "STR_Shops_C_Diving";
        conditions = "license_civ_dive";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, "" },
            { "U_B_Wetsuit", "", 2000, "" }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, "" }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, "" },
            { "G_Diving", "", 500, "" }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, "" },
            { "V_RebreatherB", "", 5000, "" }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, "" }
        };
    };

    class uran {
        title = "STR_Shops_C_Uran";
        conditions = "license_civ_uran_raw";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, "" },
            { "U_C_Scientist", "", 50000, "" }
        };
        headgear[] = {
        };
        goggles[] = {
          { "NONE", "Remove Glasses", 0, "" },
          { "G_Lowprofile", "Schutzbrille", 60000, "" }
        };
        vests[] = {
        };
        backpacks[] = {
        };
    };

    class gun_clothing {
        title = "STR_Shops_C_Gun";
        conditions = "license_civ_gun";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, "" }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, "" }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, "" }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, "" },
            { "V_Rangemaster_belt", "", 4900, "" }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, "" }
        };
    };

    class gang_clothing {
        title = "STR_Shops_C_Gang";
        conditions = "";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, "" }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, "" }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, "" }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, "" },
            { "V_Rangemaster_belt", "", 1900, "" }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, "" }
        };
    };

    class med_clothing {
        title = "STR_MAR_EMS_Clothing_Shop";
        conditions = "";
        side = "med";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, "" },
            { "U_O_OfficerUniform_ocamo", "Uniform", 50, "" },
            { "U_B_Wetsuit", "", 100, "" },
            { "U_C_Scientist", "Strahlenschutzanzug", 25000, "" }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, "" },
            { "H_Cap_blu", "", 10, "" }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, "" },
            { "G_Shades_Blue", "", 10, "" },
            { "G_Diving", "", 50, "" },
            { "G_Lowprofile", "Schutzbrille", 25000, "" }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, "" },
            { "V_RebreatherB", "", 50, "" }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, "" },
            { "B_FieldPack_oli", "Rucksack", 3000, "" }
        };
    };

    class reb {
        title = "STR_Shops_C_Rebel";
        conditions = "license_civ_rebel";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, "" },
            { "U_O_Wetsuit", "", 5000, "" },
            { "U_IG_Guerilla1_1", "", 5000, "" },
            { "U_IG_Guerilla2_3", "", 5000, "" },
            { "U_IG_Guerilla3_1", "", 5000, "" },
            { "U_IG_Guerilla3_2", "", 5000, "" },
            { "U_BG_leader", "", 5000, "" },
            { "U_I_G_Story_Protagonist_F", "", 7500, "" },
            { "U_I_G_resistanceLeader_F", "", 10000, "" },
            { "U_I_CombatUniform", "", 15000, "" },
            { "U_I_CombatUniform_tshirt", "", 15000, "" },
            { "U_I_OfficerUniform", "", 15000, "" },
            { "U_O_PilotCoveralls", "", 15000, "" },
            { "U_B_HeliPilotCoveralls", "", 17500, "" },
            { "U_O_SpecopsUniform_ocamo", "", 17500, "" },
            { "U_B_SpecopsUniform_sgg", "", 17500, "" },
            { "U_O_CombatUniform_ocamo", "", 17500, "" },
            { "U_O_CombatUniform_oucamo", "", 17500, "" },
            { "U_B_CombatUniform_mcam_vest", "", 17500, "" },
            { "U_B_CTRG_2", "", 17500, "" },
            { "U_B_CTRG_3", "", 17500, "" },
            { "U_I_G_resistanceLeader_F", "", 17500, "" },
            { "U_O_GhillieSuit", "", 50000, "" },
            { "U_I_GhillieSuit", "", 50000, "" },
            { "U_B_GhillieSuit", "", 50000, "" },
            { "U_B_FullGhillie_ard", "", 75000, "" },
            { "U_B_FullGhillie_sard", "", 75000, "" },
            { "U_B_FullGhillie_lsh", "", 75000, "" }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, "" },
            { "H_Bandanna_camo", "", 650, "" },
            { "H_ShemagOpen_khk", "", 800, "" },
            { "H_ShemagOpen_tan", "", 850, "" },
            { "H_Shemag_olive", "", 850, "" },
            { "H_Shemag_khk", "", 850, "" },
            { "H_Shemag_tan", "", 850, "" },
            { "H_MilCap_oucamo", "", 1200, "" },
            { "H_MilCap_dgtl", "", 1200, "" },
            { "H_Cap_blk_Raven", "", 1200, "" },
            { "H_HelmetB_light_black", "", 1200, "" },
            { "H_HelmetB_light_grass", "", 1200, "" },
            { "H_HelmetCrew_B", "", 1200, "" },
            { "H_Watchcap_khk", "", 1200, "" },
            { "H_HelmetIA", "", 1200, "" },
            { "H_HelmetB_camo", "", 1200, "" },
            { "H_HelmetB_sand", "", 1200, "" },
            { "H_HelmetO_ocamo", "", 2500, "" }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, "" },
            { "G_Shades_Black", "", 20, "" },
            { "G_Shades_Blue", "", 20, "" },
            { "G_Sport_Blackred", "", 25, "" },
            { "G_Sport_Checkered", "", 25, "" },
            { "G_Sport_Blackyellow", "", 25, "" },
            { "G_Sport_BlackWhite", "", 25, "" },
            { "G_Lowprofile", "", 30, "" },
            { "G_Squares", "", 50, "" },
            { "G_Combat", "Gasmaske", 50000, "" },
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
            { "NONE", "Remove Vest", 0, "" },
            { "V_BandollierB_cbr", "", 4500, "" },
            { "V_HarnessO_brn", "", 7500, "" },
            { "V_TacVest_blk", "", 12500, "" },
			      { "V_TacVestIR_blk", "", 15000, "" },
			      { "V_PlateCarrierIA1_dgtl", "", 20000, "" },
			      { "V_PlateCarrierIA2_dgtl", "", 25000, "" },
			      { "V_PlateCarrier1_tna_F", "", 30000, "" },
			      { "V_PlateCarrier2_tna_F", "", 35000, "" },
            { "V_PlateCarrier3_rgr", "", 35000, "" },
            { "V_PlateCarrierH_CTRG", "", 35000, "" }

        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, "" },
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
            { "B_Bergen_dgtl_F", "", 15000, "" },
            { "B_Bergen_hex_F", "", 15000, "" },
            { "B_Bergen_mcamo_F", "", 15000, "" },
            { "B_Bergen_tna_F", "", 15000, "" }
        };
    };

    class kart {
        title = "STR_Shops_C_Kart";
        conditions = "";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, "" },
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
            { "NONE", "Remove Hat", 0, "" },
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
            { "NONE", "Remove Glasses", 0, "" }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, "" }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, "" }
        };
    };
};
