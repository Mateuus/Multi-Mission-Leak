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
            { "U_C_Poloshirt_redwhite", "Hawaii-Shirt-gruen", 125, { "", "", -1 } },
            { "U_C_Poloshirt_stripped", "Hawaii-Shirt-rot", 125, { "", "", -1 } },
            { "U_C_Poloshirt_burgundy", "Talk to the Hand", 125, { "", "", -1 } },
            { "U_C_Poloshirt_blue", "Poloshirt Blue", 125, { "", "", -1 } },
            { "U_C_Poloshirt_salmon", "Poloshirt Salmon", 125, { "", "", -1 } },
            { "U_C_Poloshirt_tricolour", "Poloshirt Tricolor", 125, { "", "", -1 } },
            { "U_C_Poor_2", "Rag tagged clothes", 250, { "", "", -1 } },
            { "U_IG_Guerilla2_2", "Green stripped shirt & Pants", 650, { "", "", -1 } },
            { "U_IG_Guerilla3_1", "Brown Jacket & Pants", 735, { "", "", -1 } },
            { "U_IG_Guerilla2_3", "The Outback Rangler", 1200, { "", "", -1 } },
            { "U_C_HunterBody_grn", "The Hunters Look", 1500, { "", "", -1 } },
            { "U_C_WorkerCoveralls", "Mechanic Coveralls", 2500, { "", "", -1 } },
            { "U_OrestesBody", "Surfing On Land", 1100, { "", "", -1 } },
            { "U_NikosAgedBody", "Casual Wears", 5000, { "", "", -1 } }
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
            { "H_Cap_usblack", "", 150, { "", "", -1 } }
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
            { "V_Press_F", "", 5000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } },
            { "B_AssaultPack_khk", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_dgtl", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_rgr", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_sgg", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_blk", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_cbr", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_mcamo", "", 2000, { "", "", -1 } },
            { "B_TacticalPack_oli", "", 2500, { "", "", -1 } },
            { "B_Kitbag_mcamo", "", 3500, { "", "", -1 } },
            { "B_Kitbag_sgg", "", 3500, { "", "", -1 } },
            { "B_Kitbag_cbr", "", 3500, { "", "", -1 } },
            { "B_Bergen_sgg", "", 4500, { "", "", -1 } },
            { "B_Bergen_mcamo", "", 4500, { "", "", -1 } },
            { "B_Bergen_rgr", "", 4500, { "", "", -1 } },
            { "B_Bergen_blk", "", 4500, { "", "", -1 } },
            { "B_FieldPack_blk", "", 4000, { "", "", -1 } },
            { "B_FieldPack_ocamo", "", 4000, { "", "", -1 } },
            { "B_FieldPack_oucamo", "", 4000, { "", "", -1 } },
            { "B_Carryall_ocamo", "", 5000, { "", "", -1 } },
            { "B_Carryall_oucamo", "", 5000, { "", "", -1 } },
            { "B_Carryall_mcamo", "", 5000, { "", "", -1 } },
            { "B_Carryall_oli", "", 5000, { "", "", -1 } },
            { "B_Carryall_khk", "", 5000, { "", "", -1 } },
            { "B_Carryall_cbr", "", 5000, { "", "", -1 } },
            { "B_OutdoorPack_blk", "", 500, { "", "", -1 } }
        };
    };

    class cop {
        title = "STR_Shops_C_Police";
        license = "";
        side = "cop";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_Rangemaster", "REC.OFF", 25, { "", "", -1 } },
            { "U_B_SpecopsUniform_sgg", "Polizei Uniform", 350, { "life_coplevel", "SCALAR", 3 } },
            { "U_B_Wetsuit", "", 1250, { "life_coplevel", "SCALAR", 3 } },
            { "U_B_CombatUniform_mcam", "DEA-Uniform", 550, { "license_cop_dea", "BOOL", true } },
            { "U_OG_Guerilla1_1", "Zivilfahnder", 550, { "license_cop_civ", "BOOL", true } },
            { "U_B_CombatUniform_mcam_tshirt", "Zivilfahnder", 550, { "license_cop_civ", "BOOL", true } },
            { "U_B_survival_uniform", "Zivilfahnder", 550, { "license_cop_civ", "BOOL", true } },
            { "U_I_G_Story_Protagonist_F", "Zivilfahnder", 550, { "license_cop_civ", "BOOL", true } },
            { "U_I_G_resistanceLeader_F", "Zivilfahnder", 550, { "license_cop_civ", "BOOL", true } },
            { "U_B_GhillieSuit", "", 550, { "license_cop_sniper", "BOOL", true } },
            { "U_I_GhillieSuit", "", 550, { "license_cop_sniper", "BOOL", true } },
            { "U_B_FullGhillie_ard", "", 550, { "license_cop_sniper", "BOOL", true } },
            { "U_B_FullGhillie_lsh", "", 550, { "license_cop_sniper", "BOOL", true } },
            { "U_B_FullGhillie_sard", "", 550, { "license_cop_sniper", "BOOL", true } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
            { "H_Cap_police", "", 100, { "life_coplevel", "SCALAR", 1 } },
            { "H_StrawHat", "", 100, { "life_coplevel", "SCALAR", 1 } },
            { "H_StrawHat_dark", "", 100, { "life_coplevel", "SCALAR", 1 } },
            { "H_PilotHelmetFighter_O", "Gasmaske", 100, { "life_coplevel", "SCALAR", 1 } },
            { "H_Booniehat_indp", "", 100, { "life_coplevel", "SCALAR", 3 } },
            { "H_Beret_blk_POLICE", "", 100, { "life_coplevel", "SCALAR", 3 } },
            { "H_Watchcap_camo", "", 100, { "life_coplevel", "SCALAR", 4 } },
            { "H_Watchcap_blk", "", 100, { "life_coplevel", "SCALAR", 4 } },
            { "H_Beret_02", "", 100, { "life_coplevel", "SCALAR", 6 } },
            { "H_Beret_Colonel", "", 100, { "life_coplevel", "SCALAR", 8 } },
            { "H_HelmetSpecB_blk", "DEA-Helm", 100, { "license_cop_dea", "BOOL", true } },
            { "H_Booniehat_khk", "Zivilfahnder", 100, { "license_cop_civ", "BOOL", true } },
            { "H_Booniehat_dgtl", "Zivilfahnder", 100, { "license_cop_civ", "BOOL", true } },
            { "H_HelmetB_sand", "Zivilfahnder", 100, { "license_cop_civ", "BOOL", true } },
            { "H_HelmetSpecB", "Zivilfahnder", 100, { "license_cop_civ", "BOOL", true } },
            { "H_HelmetB_light_desert", "Zivilfahnder", 100, { "license_cop_civ", "BOOL", true } },
            { "H_Bandanna_khk_hs", "Zivilfahnder", 100, { "license_cop_civ", "BOOL", true } },
            { "H_ShemagOpen_khk", "Zivilfahnder", 100, { "license_cop_civ", "BOOL", true } },
            { "H_Watchcap_blk", "Zivilfahnder", 100, { "license_cop_civ", "BOOL", true } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } },
            { "G_Tactical_Black", "", 25, { "", "", -1 } },
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
            { "G_Bandanna_aviator", "DEA", 150, { "license_cop_dea", "BOOL", true } },
            { "G_Bandanna_beast", "DEA", 150, { "license_cop_dea", "BOOL", true } },
            { "G_Bandanna_blk", "DEA", 150, { "license_cop_dea", "BOOL", true } },
            { "G_Bandanna_khk", "DEA", 150, { "license_cop_dea", "BOOL", true } },
            { "G_Bandanna_oli", "DEA", 150, { "license_cop_dea", "BOOL", true } },
            { "G_Bandanna_shades", "DEA", 150, { "license_cop_dea", "BOOL", true } },
            { "G_Bandanna_sport", "DEA", 150, { "license_cop_dea", "BOOL", true } },
            { "G_Bandanna_tan", "DEA", 150, { "license_cop_dea", "BOOL", true } },
            { "G_Bandanna_aviator", "Zivilfahnder", 150, { "license_cop_civ", "BOOL", true } },
            { "G_Bandanna_beast", "Zivilfahnder", 150, { "license_cop_civ", "BOOL", true } },
            { "G_Bandanna_blk", "Zivilfahnder", 150, { "license_cop_civ", "BOOL", true } },
            { "G_Bandanna_khk", "Zivilfahnder", 150, { "license_cop_civ", "BOOL", true } },
            { "G_Bandanna_oli", "Zivilfahnder", 150, { "license_cop_civ", "BOOL", true } },
            { "G_Bandanna_shades", "Zivilfahnder", 150, { "license_cop_civ", "BOOL", true } },
            { "G_Bandanna_sport", "Zivilfahnder", 150, { "license_cop_civ", "BOOL", true } },
            { "G_Bandanna_tan", "Zivilfahnder", 150, { "license_cop_civ", "BOOL", true } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_Rangemaster_belt", "", 800, { "", "", -1 } },
            { "V_TacVest_blk_POLICE", "Polizeiweste", 1000, { "", "", -1 } },
            { "V_RebreatherB", "", 1000, { "life_coplevel", "SCALAR", 3 } },
            { "V_TacVestIR_blk", "", 1000, { "life_coplevel", "SCALAR", 4 } },
            { "V_PlateCarrier1_blk", "", 1000, { "life_coplevel", "SCALAR", 5 } },
            { "V_PlateCarrier2_blk", "", 1000, { "life_coplevel", "SCALAR", 5 } },
            { "V_Chestrig_blk", "DEA-Weste", 1000, { "license_cop_dea", "BOOL", true } },
            { "V_PlateCarrier2_rgr", "Zivilfahnder", 1000, { "license_cop_civ", "BOOL", true } },
            { "V_TacVest_khk", "Zivilfahnder", 1000, { "license_cop_civ", "BOOL", true } },
            { "V_TacVest_oli", "Zivilfahnder", 1000, { "license_cop_civ", "BOOL", true } },
            { "V_PlateCarrierIA1_dgtl", "Zivilfahnder", 1000, { "license_cop_civ", "BOOL", true } },
            { "V_PlateCarrierH_CTRG", "Zivilfahnder", 1000, { "license_cop_civ", "BOOL", true } }
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
        title = "STR_Shops_C_Diving";
        license = "dive";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_B_Wetsuit", "", 2000, { "", "", -1 } },
            { "U_I_Wetsuit", "", 2000, { "", "", -1 } }
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
        title = "STR_MAR_EMS_Clothing_Shop";
        license = "";
        side = "med";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_I_CombatUniform", "THW Uniform", 50, { "", "", -1 } },
            { "U_I_CombatUniform_shortsleeve", "THW Uniform", 50, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
            { "H_Watchcap_camo", "", 10, { "", "", -1 } },
            { "H_Watchcap_khk", "", 10, { "", "", -1 } },
            { "H_Watchcap_sgg", "", 10, { "", "", -1 } },
            { "H_Watchcap_blk", "", 10, { "", "", -1 } },
            { "H_Watchcap_camo", "", 10, { "", "", -1 } }
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
            { "B_Kitbag_cbr", "", 800, { "", "", -1 } },
            { "B_FieldPack_cbr", "", 500, { "", "", -1 } },
            { "B_AssaultPack_cbr", "", 700, { "", "", -1 } },
            { "B_Bergen_sgg", "", 2500, { "", "", -1 } },
            { "B_Carryall_cbr", "", 3500, { "", "", -1 } }
        };
    };

    class reb {
        title = "STR_Shops_C_Rebel";
        license = "";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_O_CombatUniform_ocamo", "VIP Digi", 20000, {"life_donatorlvl", "SCALAR", 2} },
            { "U_B_Wetsuit", "", 2000, {"", "", -1} },
            { "U_I_Wetsuit", "", 2000, {"", "", -1} },
            { "U_O_Wetsuit", "", 2000, {"", "", -1} },
            { "U_B_CTRG_1", "", 20000, {"", "", -1} },
            { "U_B_CTRG_2", "", 20000, {"", "", -1} },
            { "U_B_CTRG_3", "", 20000, {"", "", -1} },
            { "U_B_CombatUniform_mcam_worn", "", 15000, {"", "", -1} },
            { "U_B_CombatUniform_mcam_vest", "", 20000, {"", "", -1} },
            { "U_B_CombatUniform_mcam", "", 20000, {"", "", -1} },
            { "U_B_CombatUniform_mcam_tshirt", "", 20000, {"", "", -1} },
            { "U_I_G_Story_Protagonist_F", "", 15000, {"", "", -1} },
            { "U_O_OfficerUniform_ocamo", "", 20000, {"", "", -1} },
            { "U_O_SpecopsUniform_ocamo", "", 20000, {"", "", -1} },
            { "U_O_CombatUniform_oucamo", "", 20000, {"", "", -1} },
            { "U_O_CombatUniform_ocamo", "", 20000, {"", "", -1} },
            { "U_I_CombatUniform_shortsleeve", "", 20000, {"", "", -1} },
            { "U_I_CombatUniform", "", 20000, {"", "", -1} },
            { "U_I_OfficerUniform", "", 20000, {"", "", -1} },
            { "U_BG_leader", "", 20000, {"", "", -1} },
            { "U_BG_Guerrilla_6_1", "", 20000, {"", "", -1} },
            { "U_I_G_resistanceLeader_F", "", 20000, {"", "", -1} },
            { "U_I_GhillieSuit", "", 50000, {"", "", -1} },
            { "U_O_GhillieSuit", "", 50000, {"", "", -1} },
            { "U_B_GhillieSuit", "", 50000, {"", "", -1} },
            { "U_O_FullGhillie_lsh", "", 50000, {"", "", -1} },
            { "U_O_FullGhillie_sard", "", 50000, {"", "", -1} },
            { "U_O_FullGhillie_ard", "", 50000, {"", "", -1} },
            { "U_I_HeliPilotCoveralls", "", 20000, {"", "", -1} },
            { "U_B_HeliPilotCoveralls", "", 20000, {"", "", -1} },
            { "U_I_pilotCoveralls", "", 20000, {"", "", -1} },
            { "U_O_PilotCoveralls", "", 20000, {"", "", -1} },
            { "U_B_PilotCoveralls", "", 20000, {"", "", -1} }
        };
        headgear[] = {
            { "H_PilotHelmetFighter_O", "Gasmaske", 5000, { "", "", -1 } },
			{ "H_Cap_headphones", "", 100, { "", "", -1 } },
			{ "H_Cap_grn_BI", "", 100, { "", "", -1 } },
			{ "H_Cap_oli_hs", "", 100, { "", "", -1 } },
			{ "H_MilCap_mcamo", "", 100, { "", "", -1 } },
			{ "H_Cap_tan_specops_US", "", 100, { "", "", -1 } },
			{ "H_MilCap_gry", "", 100, { "", "", -1 } },
			{ "H_Booniehat_mcamo", "", 100, { "", "", -1 } },
			{ "H_Watchcap_camo", "", 100, { "", "", -1 } },
			{ "H_Watchcap_khk", "", 100, { "", "", -1 } },
			{ "H_Watchcap_sgg", "", 100, { "", "", -1 } },
			{ "H_Watchcap_blk", "", 100, { "", "", -1 } },
			{ "H_MilCap_blue", "", 100, { "", "", -1 } },
			{ "H_Cap_khaki_specops_UK", "", 100, { "", "", -1 } },
			{ "H_Booniehat_khk_hs", "", 100, { "", "", -1 } },
			{ "H_Booniehat_grn", "", 100, { "", "", -1 } },
			{ "H_MilCap_oucamo", "", 100, { "", "", -1 } },
			{ "H_MilCap_dgtl", "", 100, { "", "", -1 } },
			{ "H_Bandanna_khk_hs", "", 100, { "", "", -1 } },
			{ "H_Booniehat_indp", "", 100, { "", "", -1 } },
			{ "H_HelmetCrew_O", "", 100, { "", "", -1 } },
			{ "H_HelmetCrew_I", "", 100, { "", "", -1 } },
			{ "H_HelmetB_plain_mcamo", "", 100, { "", "", -1 } },
			{ "H_PilotHelmetHeli_O", "", 100, { "", "", -1 } },
			{ "H_PilotHelmetHeli_I", "", 100, { "", "", -1 } },
			{ "H_CrewHelmetHeli_O", "", 100, { "", "", -1 } },
			{ "H_CrewHelmetHeli_I", "", 100, { "", "", -1 } },
			{ "H_HelmetO_ocamo", "", 100, { "", "", -1 } },
			{ "H_HelmetLeaderO_ocamo", "", 100, { "", "", -1 } },
			{ "H_Shemag_khk", "", 100, { "", "", -1 } },
			{ "H_Shemag_tan", "", 100, { "", "", -1 } },
			{ "H_Shemag_olive", "", 100, { "", "", -1 } },
			{ "H_Shemag_olive_hs", "", 100, { "", "", -1 } },
			{ "H_ShemagOpen_khk", "", 100, { "", "", -1 } },
			{ "H_ShemagOpen_tan", "", 100, { "", "", -1 } },
			{ "H_HelmetB_camo", "", 100, { "", "", -1 } },
			{ "H_HelmetB_light", "", 100, { "", "", -1 } },
			{ "H_HelmetIA", "", 100, { "", "", -1 } },
			{ "H_HelmetB_desert", "", 100, { "", "", -1 } },
			{ "H_MilCap_ocamo", "", 100, { "", "", -1 } },
			{ "H_MilCap_mcamo", "", 100, { "", "", -1 } },
			{ "H_MilCap_oucamo", "", 100, { "", "", -1 } },
			{ "H_HelmetSpecB", "", 100, { "", "", -1 } },
			{ "H_HelmetSpecB_paint1", "", 100, { "", "", -1 } },
			{ "H_HelmetSpecB_paint2", "", 100, { "", "", -1 } },
			{ "H_HelmetSpecB_blk", "", 100, { "", "", -1 } }
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
            { "V_BandollierB_cbr", "", 10000, { "", "", -1 } },
            { "V_BandollierB_rgr", "", 10000, { "", "", -1 } },
            { "V_BandollierB_khk", "", 10000, { "", "", -1 } },
            { "V_BandollierB_oli", "", 10000, { "", "", -1 } },
            { "V_HarnessO_brn", "", 15000, { "", "", -1 } },
            { "V_HarnessO_gry", "", 15000, { "", "", -1 } },
            { "V_HarnessOGL_brn", "", 15000, { "", "", -1 } },
            { "V_HarnessOGL_gry", "", 15000, { "", "", -1 } },
            { "V_Chestrig_rgr", "", 20000, { "", "", -1 } },
            { "V_Chestrig_khk", "", 20000, { "", "", -1 } },
            { "V_Chestrig_oli", "", 20000, { "", "", -1 } },
            { "V_TacVest_brn", "", 25000, { "", "", -1 } },
            { "V_TacVest_khk", "", 25000, { "", "", -1 } },
            { "V_TacVest_oli", "", 25000, { "", "", -1 } },
            { "V_TacVest_blk", "", 25000, { "", "", -1 } },
            { "V_TacVest_camo", "", 25000, { "", "", -1 } },
            { "V_PlateCarrierIA1_dgtl", "", 35000, { "", "", -1 } },
            { "V_PlateCarrierL_CTRG", "", 45000, { "", "", -1 } },
            { "V_PlateCarrierH_CTRG", "", 45000, { "", "", -1 } },
            { "V_PlateCarrierIA2_dgtl", "", 45000, { "", "", -1 } },
            { "V_PlateCarrier_Kerry", "", 55000, { "", "", -1 } },
            { "V_PlateCarrier1_rgr", "", 65000, { "", "", -1 } },
            { "V_PlateCarrier2_rgr", "", 65000, { "", "", -1 } },
            { "V_RebreatherB", "", 5000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } },
            { "B_AssaultPack_khk", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_dgtl", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_rgr", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_sgg", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_blk", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_cbr", "", 2000, { "", "", -1 } },
            { "B_AssaultPack_mcamo", "", 2000, { "", "", -1 } },
            { "B_TacticalPack_oli", "", 2500, { "", "", -1 } },
            { "B_Kitbag_mcamo", "", 3500, { "", "", -1 } },
            { "B_Kitbag_sgg", "", 3500, { "", "", -1 } },
            { "B_Kitbag_cbr", "", 3500, { "", "", -1 } },
            { "B_Bergen_sgg", "", 4500, { "", "", -1 } },
            { "B_Bergen_mcamo", "", 4500, { "", "", -1 } },
            { "B_Bergen_rgr", "", 4500, { "", "", -1 } },
            { "B_Bergen_blk", "", 4500, { "", "", -1 } },
            { "B_FieldPack_blk", "", 4000, { "", "", -1 } },
            { "B_FieldPack_ocamo", "", 4000, { "", "", -1 } },
            { "B_FieldPack_oucamo", "", 4000, { "", "", -1 } },
            { "B_Carryall_ocamo", "", 5000, { "", "", -1 } },
            { "B_Carryall_oucamo", "", 5000, { "", "", -1 } },
            { "B_Carryall_mcamo", "", 5000, { "", "", -1 } },
            { "B_Carryall_oli", "", 5000, { "", "", -1 } },
            { "B_Carryall_khk", "", 5000, { "", "", -1 } },
            { "B_Carryall_cbr", "", 5000, { "", "", -1 } },
            { "B_OutdoorPack_blk", "", 500, { "", "", -1 } }
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
