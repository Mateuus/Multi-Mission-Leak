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
            { "U_C_Poloshirt_blue", "Poloshirt Blau", 250, { "", "", -1 } },
			{ "U_C_Poloshirt_burgundy", "Poloshirt Burgundy", 250, { "", "", -1 } },
			{ "U_C_Poor_1", "Poloshirt Blau Mix", 250, { "", "", -1 } },
			{ "U_IG_Guerilla2_2", "Grün Schwarz Shirt & Hose", 650, { "", "", -1 } },			
			{ "U_IG_Guerilla3_1", "Guerilla Kleidung", 650, { "", "", -1 } },
			{ "U_IG_Guerilla2_3", "The Outback Ranger", 1200, { "", "", -1 } },
			{ "U_IG_Guerilla2_1", "The Outback Ranger", 1200, { "", "", -1 } },
			{ "U_IG_Guerilla3_2", "Rebellen Kleidung", 5000, { "", "", -1 } },
			{ "U_B_SpecopsUniform_sgg", "Geil", 5000, { "", "", -1 } },
			{ "U_C_HunterBody_grn", "The Hunters Look", 1500, { "", "", -1 } },
			{ "U_OrestesBody", "Biker Kleidung", 2000, { "", "", -1 } },			
			{ "U_I_G_Story_Protagonist_F", "Mechaniker", 1500, { "", "", -1 } },
			{ "U_I_G_resistanceLeader_F", "Kampf Kleidung", 10000, { "", "", -1 } },
			{ "U_Competitor", "Deutsche Post", 2000, { "", "", -1 } },
			{ "U_C_Journalist", "Journalist", 5000, { "", "", -1 } },			
			{ "U_Marshal", "Adrett ", 2500, { "", "", -1 } },
			{ "U_NikosBody", "Zuhälter", 5000, { "", "", -1 } },			
			{ "U_NikosAgedBody", "Business Kleidung", 10000, { "", "", -1 } },
			{ "U_C_Scientist","Strahlenschutzanzug", 20000, {"","",-1} }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
            { "H_Bandanna_camo", "Camo Bandanna", 150, { "", "", -1 } },
			{ "H_Bandanna_surfer", "Surfer Bandanna", 1500, { "", "", -1 } },
			{ "H_Bandanna_gry", "Grey Bandanna", 150, { "", "", -1 } },
			{ "H_Bandanna_cbr", "", 150, { "", "", -1 } },
			{ "H_Bandanna_surfer", "", 150, { "", "", -1 } },
			{ "H_Bandanna_khk", "Khaki Bandanna", 150, { "", "", -1 } },
			{ "H_Bandanna_sgg", "Sage Bandanna", 150, { "", "", -1 } },
			{ "H_Bandanna_mcamo", "Khaki Bandanna", 150, { "", "", -1 } },
			{ "H_Bandanna_khk_hs", "Sage Bandanna", 150, { "", "", -1 } },			
			{ "H_StrawHat", "Straw Fedora", 250, { "", "", -1 } },
			{ "H_BandMask_blk", "Hat & Bandanna", 150, { "", "", -1 } },
			{ "H_Booniehat_tan", "", 500, { "", "", -1 } },
			{ "H_Hat_blue", "", 300, { "", "", -1 } },
			{ "H_Hat_brown", "", 300, { "", "", -1 } },
			{ "H_Hat_checker", "", 300, { "", "", -1 } },
			{ "H_Hat_grey", "", 300, { "", "", -1 } },
			{ "H_Hat_tan", "", 300, { "", "", -1 } },
			{ "H_Cap_blu", "", 150, { "", "", -1 } },
			{ "H_Cap_grn", "", 150, { "", "", -1 } },
			{ "H_Cap_grn_BI", "", 150, { "", "", -1 } },
			{ "H_Cap_oli", "", 150, { "", "", -1 } },
			{ "H_Cap_red", "", 150, { "", "", -1 } },
			{ "H_Cap_tan", "", 150, { "", "", -1 } },			
			{ "H_Cap_blk", "Straw Fedora", 300, { "", "", -1 } },
			{ "H_Cap_blk_Raven", "Hat & Bandanna", 300, { "", "", -1 } },
			{ "H_Cap_brn_SPECOPS", "", 500, { "", "", -1 } },
			{ "H_Cap_blk_CMMG", "", 500, { "", "", -1 } },
			{ "H_Cap_blk_ION", "", 500, { "", "", -1 } },
			{ "H_Cap_press", "", 500, { "", "", -1 } },
			{ "H_Cap_khaki_specops_UK", "", 500, { "", "", -1 } },
			{ "H_Cap_tan_specops_US", "", 500, { "", "", -1 } },
			{ "H_Cap_oli_hs", "", 500, { "", "", -1 } },
			{ "H_Cap_headphones", "", 500, { "", "", -1 } },
			{ "H_Cap_marshal", "", 500, { "", "", -1 } },
			{ "H_Hat_camo", "", 500, { "", "", -1 } },
			{ "H_StrawHat_dark", "", 1000, { "", "", -1 } },
			{ "H_TurbanO_blk", "", 500, { "", "", -1 } },
			{ "H_Watchcap_blk", "", 500, { "", "", -1 } },
			{ "H_Watchcap_camo", "", 500, { "", "", -1 } },
			{ "H_Watchcap_khk", "", 500, { "", "", -1 } },
			{ "H_Watchcap_sgg", "", 500, { "", "", -1 } },
			{ "H_Booniehat_grn", "", 500, { "", "", -1 } },
			{ "H_Booniehat_mcamo", "", 500, { "", "", -1 } },			
			{ "H_Booniehat_indp", "", 500, { "", "", -1 } },
			{ "H_Booniehat_khk_hs", "", 500, { "", "", -1 } },
			{ "H_MilCap_blue", "", 500, { "", "", -1 } },
			{ "H_MilCap_dgtl", "", 500, { "", "", -1 } },
			{ "H_MilCap_gry", "", 500, { "", "", -1 } },
			{ "H_MilCap_mcamo", "", 500, { "", "", -1 } },
			{ "H_MilCap_ocamo", "", 500, { "", "", -1 } },			
			{ "H_MilCap_oucamo", "", 500, { "", "", -1 } },
			{ "H_MilCap_rucamo", "", 500, { "", "", -1 } },
			{ "H_BandMask_reaper", "", 500, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } },
            { "G_Shades_Black", "", 300, { "", "", -1 } },
			{ "G_Shades_Blue", "", 300, { "", "", -1 } },
			{ "G_Sport_Blackred", "", 300, { "", "", -1 } },
			{ "G_Sport_Checkered", "", 300, { "", "", -1 } },
			{ "G_Sport_Blackyellow", "", 300, { "", "", -1 } },
			{ "G_Sport_BlackWhite", "", 300, { "", "", -1 } },
			{ "G_Squares", "", 300, { "", "", -1 } },
			{ "G_Aviator", "", 300, { "", "", -1 } },
			{ "G_Lady_Mirror", "", 300, { "", "", -1 } },
			{ "G_Lady_Dark", "", 300, { "", "", -1 } },
			{ "G_Lady_Blue", "", 300, { "", "", -1 } },
			{ "G_Lowprofile", "", 300, { "", "", -1 } },
			{ "G_Combat", "", 300, { "", "", -1 } },
			{ "G_Shades_Green", "", 300, { "", "", -1 } },
			{ "G_Shades_Red", "", 300, { "", "", -1 } },
			{ "G_Spectacles", "", 300, { "", "", -1 } },
			{ "G_Spectacles_Tinted", "", 300, { "", "", -1 } },			
			{ "G_Sport_Greenblack", "", 300, { "", "", -1 } },
			{ "G_Sport_Red", "", 300, { "", "", -1 } },
			{ "G_Tactical_Black", "", 5000, { "", "", -1 } },
			{ "G_Tactical_Clear", "", 5000, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
			{ "V_Press_F", "", 5000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } },
            { "B_AssaultPack_cbr", "", 2500, { "", "", -1 } },			
			{ "B_AssaultPack_blk", "", 5000, { "", "", -1 } },
			{ "B_AssaultPack_dgtl", "", 5000, { "", "", -1 } },
			{ "B_AssaultPack_khk", "", 5000, { "", "", -1 } },
			{ "B_AssaultPack_mcamo", "", 5000, { "", "", -1 } },
			{ "B_AssaultPack_ocamo", "", 5000, { "", "", -1 } },
			{ "B_AssaultPack_rgr", "", 5000, { "", "", -1 } },
			{ "B_AssaultPack_sgg", "", 5000, { "", "", -1 } },
			{ "B_AssaultPack_Kerry", "", 5000, { "", "", -1 } },			
			{ "B_Kitbag_mcamo", "", 5000, { "", "", -1 } },
			{ "B_TacticalPack_oli", "", 5000, { "", "", -1 } },
			{ "B_FieldPack_ocamo", "", 5000, { "", "", -1 } },
			{ "B_Bergen_sgg", "", 5000, { "", "", -1 } },
			{ "B_Kitbag_cbr", "", 5000, { "", "", -1 } },
			{ "B_Carryall_oli", "", 5000, { "", "", -1 } },
			{ "B_Carryall_khk", "", 5000, { "", "", -1 } },			
			{ "B_FieldPack_blk", "", 5500, { "", "", -1 } },
			{ "B_FieldPack_cbr", "", 5500, { "", "", -1 } },
			{ "B_FieldPack_khk", "", 5500, { "", "", -1 } },
			{ "B_FieldPack_oli", "", 5500, { "", "", -1 } },
			{ "B_FieldPack_oucamo", "", 7000, { "", "", -1 } },
			{ "B_BergenC_grn", "", 7000, { "", "", -1 } },
			{ "B_TacticalPack_mcamo", "", 7500, { "", "", -1 } },
			{ "B_TacticalPack_blk", "", 7500, { "", "", -1 } },
			{ "B_TacticalPack_ocamo", "", 9000, { "", "", -1 } },
			{ "B_TacticalPack_rgr", "", 9000, { "", "", -1 } },
			{ "B_Kitbag_rgr", "", 9000, { "", "", -1 } },			
			{ "B_Kitbag_sgg", "", 10000, { "", "", -1 } },
			{ "B_Carryall_cbr", "", 10000, { "", "", -1 } },
			{ "B_Carryall_mcamo", "", 10000, { "", "", -1 } },
			{ "B_Carryall_ocamo", "", 10000, { "", "", -1 } },
			{ "B_Carryall_oucamo", "", 10000, { "", "", -1 } }
        };
    };

    class cop {
        title = "STR_Shops_C_Police";
        license = "";
        side = "cop";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_Rangemaster", "Polizei Hemd", 100, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam_vest", "Streifen Uniform 1", 100, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam", "Streifen Uniform 2", 100, { "", "", -1 } },
			{ "U_B_SpecopsUniform_sgg", "Einsatzleitung Uniform", 1000, { "life_coplevel", "SCALAR", 4 } },
			{ "U_B_CTRG_3", "Zoll Uniform", 500, { "life_coplevel", "SCALAR", 7 } },
			{ "U_I_CombatUniform_shortsleeve", "SEK Uniform", 500, { "license_cop_sek", "BOOL", true } },
			{ "U_MillerBody", "Polizei Ausbilder", 500, { "life_coplevel", "SCALAR", 6 } },
			{ "U_B_CombatUniform_mcam_worn", "Polizei Leitung", 500, { "life_coplevel", "SCALAR", 8 } },
			{ "U_O_Wetsuit", "Taucherkleidung", 550, { "life_coplevel", "SCALAR", 4} },
			{ "U_B_GhillieSuit", "Ghillie Normal", 550, { "license_cop_kripo", "BOOL", true } },
			{ "U_I_pilotCoveralls", "Pilotenkleidung", 550, { "license_cop_kripo", "BOOL", true } },
		    { "U_NikosAgedBody", "Feiner Herr", 550, { "license_cop_kripo", "BOOL", true } },
			{ "U_B_FullGhillie_sard", "Ghillie DLC", 550, { "license_cop_kripo", "BOOL", true } },
			{ "U_IG_Guerilla3_2", "Undercover 1", 550, { "license_cop_kripo", "BOOL", true } },
			{ "U_IG_Guerilla3_1", "Undercover 2", 1250, { "license_cop_kripo", "BOOL", true } },
			{ "U_O_CombatUniform_oucamo", "Undercover 3", 1250, { "license_cop_kripo", "BOOL", true } },
			{ "U_O_PilotCoveralls",  "Undercover 4", 1250, { "license_cop_kripo", "BOOL", true } },
			{ "U_IG_Guerilla2_3", "Undercover 5", 1250, { "license_cop_kripo", "BOOL", true } },
			{ "U_I_CombatUniform_tshirt", "Undercover 6", 1250,{ "license_cop_kripo", "BOOL", true } },
			{ "U_B_HeliPilotCoveralls", "", 75, { "license_cop_sek", "BOOL", true } },
			{ "U_B_Wetsuit", "", 75, { "license_cop_sek", "BOOL", true } },
			{ "U_B_GhillieSuit", "", 2000, { "license_cop_sek", "BOOL", true } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
            { "H_Beret_blk_POLICE", "Barett", 75, { "life_coplevel", "SCALAR", 2 } },
			{ "H_Cap_police", "Polizei Cap", 75, { "life_coplevel", "SCALAR", 1 } },
            { "H_Watchcap_blk", "Beanie", 75, { "life_coplevel", "SCALAR", 4 } },
            { "H_MilCap_mcamo", "Militärmütze", 75, { "life_coplevel", "SCALAR",5 } },
            { "H_Booniehat_indp", "Fischerhut", 75, { "life_coplevel", "SCALAR", 6 } },
            { "H_Beret_02", "Barett Blau", 75, { "life_coplevel", "SCALAR", 8 } },
            { "H_CrewHelmetHeli_B", "AntiGasHelm", 75, { "life_coplevel", "SCALAR", 8 } },
            { "H_PilotHelmetHeli_B", "Pilotenhelm (auf)", 75, { "life_coplevel", "SCALAR", 8 } },
            { "H_PilotHelmetHeli_B", "NATO Helm", 75, { "life_coplevel", "SCALAR", 8 } },
            { "H_HelmetB_light", "Nato Helm", 75, { "life_coplevel", "SCALAR", 8 } },
            { "H_HelmetB_light_black", "SEK Helm", 75, { "life_coplevel", "SCALAR", 8 } },
            //HELII SEK/Kripo
			{ "H_HelmetB_black", "Kampfhelm", 75, { "license_cop_sek", "BOOL", true } },
			{ "H_HelmetB_black", "Verbesserter Kampfhelm", 75, { "license_cop_sek", "BOOL", true } },
			{ "H_CrewHelmetHeli_B", "Heli Crew Helm", 75, { "license_cop_sek", "BOOL", true } },
            { "H_Beret_Colonel", "Barett Gelb", 75, { "life_coplevel", "SCALAR", 8 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } },
            { "G_Shades_Black", "", 250, { "", "", -1 } },
            { "G_Shades_Blue", "", 250, { "", "", -1 } },
            { "G_Sport_Blackred", "", 250, { "", "", -1 } },
            { "G_Sport_Checkered", "", 250, { "", "", -1 } },
            { "G_Sport_Blackyellow", "", 250, { "", "", -1 } },
            { "G_Sport_BlackWhite", "", 250, { "", "", -1 } },
            { "G_Squares", "", 300, { "", "", -1 } },
            { "G_Aviator", "", 300, { "", "", -1 } },
            { "G_Lady_Mirror", "", 300, { "", "", -1 } },
            { "G_Lady_Dark", "", 300, { "", "", -1 } },
            { "G_Lady_Blue", "", 300, { "", "", -1 } },
            { "G_Lowprofile", "", 300, { "", "", -1 } },
            { "G_Combat", "", 500, { "", "", -1 } },
			{ "G_Balaclava_blk", "Sturmhaube", 500, { "", "", -1 } },
			{ "G_Balaclava_oli", "Sturmhaube", 75, { "license_cop_kripo", "BOOL", true } },
            { "G_Diving", "Taucherbrille", 5000, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_TacVest_blk_POLICE", "Streifenweste", 5000, { "life_coplevel", "SCALAR", 1 } },
			{ "V_Rangemaster_belt", "", 8000, { "life_coplevel", "SCALAR", 1 } },			
            { "V_TacVest_oli", "", 80000, { "life_coplevel", "SCALAR", 2 } },				
            { "V_TacVest_brn", "", 150000, { "life_coplevel", "SCALAR", 3 } },
            { "V_TacVest_khk", "", 80000, { "life_coplevel", "SCALAR", 4 } },
			{ "V_PlateCarrier1_blk", "Antigasweste", 80000, { "life_coplevel", "SCALAR", 4 } },
            { "V_Chestrig_khk", "", 150000, { "life_coplevel", "SCALAR", 5 } },            
            { "V_BandollierB_cbr", "", 8000, { "life_coplevel", "SCALAR", 8 } },
            { "V_PlateCarrierGL_blk", "", 8000, { "life_coplevel", "SCALAR", 8 } },
            { "V_PlateCarrier2_rgr", "", 15000, { "life_coplevel", "SCALAR", 9 } },
            { "V_RebreatherB", "Tauchgerät", 20000, { "life_coplevel", "SCALAR", 3 } },
			{ "V_PlateCarrierH_CTRG", "", 2000, { "license_cop_sek", "BOOL", true } },
			{ "V_PlateCarrierGL_rgr", "Granatwerfertragegurt", 20000, { "license_cop_sek", "Bool", true } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } },
            { "B_Kitbag_cbr", "", 800, { "", "", -1 } },
            { "B_FieldPack_cbr", "", 500, { "", "", -1 } },
            { "B_AssaultPack_cbr", "", 700, { "", "", -1 } },
            { "B_Bergen_sgg", "", 2500, { "", "", -1 } },
            { "B_Carryall_cbr", "", 3500, { "", "", -1 } },
            { "B_Carryall_mcamo", "", 10000, { "", "", -1 } },
            { "B_Carryall_ocamo", "", 10000, { "", "", -1 } },
			{ "B_Carryall_oucamo", "", 10000, { "", "", -1 } },
			{ "B_UAV_01_backpack_F", "UAV Rucksack", 10000, { "life_coplevel", "SCALAR", 4 } }
        };
    };

    class dive {
        title = "STR_Shops_C_Diving";
        license = "dive";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_B_Wetsuit", "", 5000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } },
            { "G_Diving", "", 2500, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_RebreatherB", "", 20000, { "", "", -1 } },
			{ "V_RebreatherIA", "", 20000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } }
        };
    };

    class gun_clothing {
        title = "STR_Shops_C_Gun";
        license = "gun";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_Rangemaster_belt", "", 4900, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } }
        };
    };
	
	class gang_hoods {
        title = "STR_Shops_Gangkleidung";
        license = "hoods";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_O_CombatUniform_oucamo", "Hoods Uniform", 2500, { "license_civ_hoods", "BOOL", true } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_Rangemaster_belt", "", 4900, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } }
        };
    };
	
	class gang_gssd {
        title = "STR_Shops_Gangkleidung";
        license = "gssd";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_O_CombatUniform_oucamo", "GSSD Uniform", 2500, { "license_civ_gssd", "BOOL", true } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_Rangemaster_belt", "", 4900, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } }
        };
    };

    class gang_clothing {
        title = "STR_Shops_C_Gang";
        license = "";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
			{ "U_C_WorkerCoveralls", "Gefängniss Insasse", 2500, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_Rangemaster_belt", "", 1900, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } }
        };
    };

    class med_clothing {
        title = "STR_MAR_EMS_Clothing_Shop";
        license = "";
        side = "med";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_I_HeliPilotCoveralls", "MTD Uniform", 2500, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
            { "H_Bandanna_camo", "Camo Bandanna", 50, { "", "", -1 } },
			{ "H_Bandanna_surfer", "Surfer Bandanna", 50, { "", "", -1 } },
			{ "H_Bandanna_gry", "Grey Bandanna", 50, { "", "", -1 } },
			{ "H_Bandanna_cbr", "", 50, { "", "", -1 } },
			{ "H_Bandanna_khk", "Khaki Bandanna", 50, { "", "", -1 } },
			{ "H_Bandanna_sgg", "Sage Bandanna", 50, { "", "", -1 } },
			{ "H_StrawHat", "Straw Fedora", 50, { "", "", -1 } },
			{ "H_BandMask_blk", "Hat & Bandanna", 50, { "", "", -1 } },
			{ "H_Booniehat_tan", "", 50, { "", "", -1 } },
			{ "H_Hat_blue", "", 50, { "", "", -1 } },
			{ "H_Hat_brown", "", 50, { "", "", -1 } },
			{ "H_Hat_checker", "", 50, { "", "", -1 } },
			{ "H_Hat_grey", "", 50, { "", "", -1 } },
			{ "H_Hat_tan", "", 50, { "", "", -1 } },
			{ "H_Cap_blu", "", 50, { "", "", -1 } },
			{ "H_Cap_grn", "", 50, { "", "", -1 } },
			{ "H_Cap_grn_BI", "", 50, { "", "", -1 } },
			{ "H_Cap_oli", "", 50, { "", "", -1 } },
			{ "H_Cap_red", "", 50, { "", "", -1 } },
			{ "H_Cap_tan", "", 50, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 20, { "", "", -1 } },
            { "G_Shades_Black", "", 20, { "", "", -1 } },
			{ "G_Shades_Blue", "", 20, { "", "", -1 } },
			{ "G_Sport_Blackred", "", 20, { "", "", -1 } },
			{ "G_Sport_Checkered", "", 20, { "", "", -1 } },
			{ "G_Sport_Blackyellow", "", 20, { "", "", -1 } },
			{ "G_Sport_BlackWhite", "", 20, { "", "", -1 } },
			{ "G_Squares", "", 20, { "", "", -1 } },
			{ "G_Aviator", "", 20, { "", "", -1 } },
			{ "G_Lady_Mirror", "", 20, { "", "", -1 } },
			{ "G_Lady_Dark", "", 20, { "", "", -1 } },
			{ "G_Lady_Blue", "", 20, { "", "", -1 } },
			{ "G_Lowprofile", "", 20, { "", "", -1 } },
			{ "G_Combat", "", 20, { "", "", -1 } },
			{ "G_Diving", "", 20, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
			{ "V_Rangemaster_belt", "", 150, { "", "", -1 } },
			{ "V_RebreatherB", "Tauchgerät", 150, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } },
            { "B_FieldPack_oli", "MTD Rucksack", 3000, { "", "", -1 } },
			{ "B_Kitbag_sgg", "", 3000, { "", "", -1 } },
			{ "B_Carryall_mcamo", "", 3000, { "", "", -1 } }
        };
    };

    class reb {
        title = "STR_Shops_C_Rebel";
        license = "rebel";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_IG_Guerilla1_1", "", 10000, {"", "", -1} },
			{ "U_I_G_Story_Protagonist_F", "", 7500, { "", "", -1 } },
			{ "U_I_G_resistanceLeader_F", "", 10000, { "", "", -1 } },
			{ "U_O_SpecopsUniform_ocamo", "", 17500, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam", "Rebellen", 20000, { "", "", -1 } },
			{ "U_B_SpecopsUniform_sgg", "Geil", 20000, { "", "", -1 } },
			{ "U_O_PilotCoveralls", "", 15000, { "", "", -1 } },
			{ "U_IG_leader", "Guerilla Leader", 15000, { "", "", -1 } },			
			{ "U_I_CombatUniform", "", 10000, {"", "", -1} },
			{ "U_I_CombatUniform_shortsleeve", "", 10000, { "", "", -1 } },
			{ "U_O_CombatUniform_oucamo", "", 10000, { "", "", -1 } },
			{ "U_O_CombatUniform_ocamo", "", 17500, { "", "", -1 } },
			{ "U_I_OfficerUniform", "", 15000, { "", "", -1 } },
			{ "U_O_OfficerUniform_ocamo", "Guerilla Leader", 15000, { "", "", -1 } },
			{ "U_I_HeliPilotCoveralls", "", 10000, { "", "", -1 } },			
			{ "U_I_pilotCoveralls", "", 10000, {"", "", -1} },
			{ "U_I_Wetsuit", "", 10000, { "", "", -1 } },
			{ "U_O_Wetsuit", "", 10000, { "", "", -1 } },
			{ "U_I_GhillieSuit", "", 50000, { "", "", -1 } },
			{ "U_O_GhillieSuit", "", 50000, { "", "", -1 } },
			{ "U_B_CTRG_1", "", 15000, { "", "", -1 } },
			{ "U_B_FullGhillie_ard", "", 100000, { "", "", -1 } },			
			{ "U_O_FullGhillie_ard", "", 100000, {"", "", -1} },
			{ "U_I_FullGhillie_ard", "", 100000, { "", "", -1 } },
			{ "U_B_FullGhillie_sard", "", 100000, { "", "", -1 } },
			{ "U_O_FullGhillie_sard", "", 100000, { "", "", -1 } },
			{ "U_I_FullGhillie_sard", "", 100000, { "", "", -1 } },			
			{ "U_B_FullGhillie_lsh", "", 100000, { "", "", -1 } },
			{ "U_O_FullGhillie_lsh", "", 100000, { "", "", -1 } },
			{ "U_C_WorkerCoveralls", "Gefängniss Insasse", 2500, { "", "", -1 } },
			{ "U_I_FullGhillie_lsh", "", 100000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
            { "H_MilCap_oucamo", "", 2500, { "", "", -1 } },
			{ "H_Bandanna_camo", "", 2500, { "", "", -1 } },	
			{ "H_ShemagOpen_tan", "", 10000, { "", "", -1 } },
			{ "H_Shemag_olive", "", 10000, { "", "", -1 } },
			{ "H_ShemagOpen_khk", "", 10000, { "", "", -1 } },
			{ "H_Shemag_khk", "", 10000, { "", "", -1 } },
			{ "H_Shemag_olive_hs", "", 10000, { "", "", -1 } },
			{ "H_Shemag_tan", "", 10000, { "", "", -1 } },
			{ "H_HelmetO_ocamo", "", 10000, { "", "", -1 } },		
			{ "H_HelmetB", "", 10000, { "", "", -1 } },
			{ "H_HelmetB_black", "", 10000, { "", "", -1 } },
			{ "H_HelmetB_camo", "", 10000, { "", "", -1 } },
			{ "H_HelmetB_desert", "", 10000, { "", "", -1 } },
			{ "H_HelmetB_grass", "", 10000, { "", "", -1 } },
			{ "H_HelmetB_light", "", 10000, { "", "", -1 } },			
			{ "H_HelmetB_light_black", "", 10000, { "", "", -1 } },
			{ "H_HelmetB_light_desert", "", 10000, { "", "", -1 } },
			{ "H_HelmetB_light_grass", "", 10000, { "", "", -1 } },
			{ "H_HelmetB_light_sand", "", 10000, { "", "", -1 } },
			{ "H_HelmetB_light_snakeskin", "", 10000, { "", "", -1 } },
			{ "H_HelmetB_paint", "", 12500, { "", "", -1 } },			
			{ "H_Helmet_Kerry", "", 12500, { "", "", -1 } },
			{ "H_HelmetB_plain_blk", "", 12500, { "", "", -1 } },
			{ "H_HelmetB_plain_mcamo", "", 12500, { "", "", -1 } },
			{ "H_HelmetB_sand", "", 12500, { "", "", -1 } },
			{ "H_HelmetB_snakeskin", "", 12500, { "", "", -1 } },
			{ "H_HelmetCrew_B", "", 12500, { "", "", -1 } },			
			{ "H_HelmetCrew_I", "", 12500, { "", "", -1 } },
			{ "H_HelmetCrew_O", "", 12500, { "", "", -1 } },
			{ "H_HelmetIA", "", 12500, { "", "", -1 } },
			{ "H_HelmetLeaderO_ocamo", "", 15000, { "", "", -1 } },
			{ "H_HelmetLeaderO_oucamo", "", 15000, { "", "", -1 } },
			{ "H_HelmetO_oucamo", "", 15000, { "", "", -1 } },			
			{ "H_HelmetSpecB", "", 15000, { "", "", -1 } },
			{ "H_HelmetSpecB_blk", "", 15000, { "", "", -1 } },
			{ "H_HelmetSpecB_paint1", "", 15000, { "", "", -1 } },
			{ "H_HelmetSpecB_paint2", "", 15000, { "", "", -1 } },
			{ "H_HelmetSpecO_blk", "", 15000, { "", "", -1 } },
			{ "H_HelmetSpecO_ocamo", "", 15000, { "", "", -1 } },						
			{ "H_PilotHelmetHeli_O", "", 20000, { "", "", -1 } },
			{ "H_PilotHelmetHeli_B", "", 20000, { "", "", -1 } },
			{ "H_PilotHelmetHeli_I", "", 20000, { "", "", -1 } },			
			{ "H_CrewHelmetHeli_O", "", 20000, { "", "", -1 } },
			{ "H_CrewHelmetHeli_I", "", 20000, { "", "", -1 } },
			{ "H_PilotHelmetFighter_B", "", 25000, { "", "", -1 } },
			{ "H_PilotHelmetFighter_I", "", 25000, { "", "", -1 } },
			{ "H_PilotHelmetFighter_O", "", 25000, { "", "", -1 } },
			{ "H_Beret_02", "", 25000, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } },
            { "G_Shades_Black", "", 100, { "", "", -1 } },
			{ "G_Shades_Blue", "", 100, { "", "", -1 } },
			{ "G_Sport_Blackred", "", 100, { "", "", -1 } },
			{ "G_Sport_Checkered", "", 100, { "", "", -1 } },
			{ "G_Sport_Blackyellow", "", 100, { "", "", -1 } },
			{ "G_Sport_BlackWhite", "", 100, { "", "", -1 } },
			{ "G_Squares", "", 500, { "", "", -1 } },
			{ "G_Lowprofile", "", 500, { "", "", -1 } },
			{ "G_Combat", "", 500, { "", "", -1 } },						
			{ "G_Shades_Green", "", 500, { "", "", -1 } },
			{ "G_Shades_Red", "", 500, { "", "", -1 } },
			{ "G_Spectacles", "", 500, { "", "", -1 } },
			{ "G_Spectacles_Tinted", "", 1000, { "", "", -1 } },		
			{ "G_Sport_Greenblack", "", 1000, { "", "", -1 } },
			{ "G_Sport_Red", "", 2500, { "", "", -1 } },
			{ "G_Aviator", "", 2500, { "", "", -1 } },
			{ "G_Lady_Blue", "", 2500, { "", "", -1 } },					
			{ "G_Tactical_Black", "", 15000, { "", "", -1 } },
			{ "G_Tactical_Clear", "", 15000, { "", "", -1 } },
			{ "G_Bandanna_tan", "", 15000, { "", "", -1 } },
			{ "G_Bandanna_oli", "", 15000, { "", "", -1 } },			
			{ "G_Bandanna_blk", "", 15000, { "", "", -1 } },
			{ "G_Bandanna_beast", "", 15000, { "", "", -1 } },
			{ "G_Bandanna_shades", "", 15000, { "", "", -1 } },
			{ "G_Bandanna_sport", "", 15000, { "", "", -1 } },
			{ "G_Bandanna_aviator", "", 15000, { "", "", -1 } },
			{ "G_Balaclava_blk", "", 20000, { "", "", -1 } },
			{ "G_Balaclava_oli", "", 20000, { "", "", -1 } },
			{ "G_Balaclava_lowprofile", "", 20000, { "", "", -1 } },			
			{ "G_Balaclava_combat", "", 20000, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_BandollierB_cbr", "", 20000, { "", "", -1 } },
			{ "V_BandollierB_blk", "", 20000, { "", "", -1 } },
			{ "V_BandollierB_khk", "", 20000, { "", "", -1 } },			
			{ "V_BandollierB_oli", "", 20000, { "", "", -1 } },
			{ "V_BandollierB_rgr", "", 20000, { "", "", -1 } },
			{ "V_Chestrig_blk", "", 30000, { "", "", -1 } },						
			{ "V_Chestrig_khk", "", 30000, { "", "", -1 } },
			{ "V_Chestrig_oli", "", 30000, { "", "", -1 } },
			{ "V_Chestrig_rgr", "", 30000, { "", "", -1 } },			
			{ "V_HarnessO_brn", "", 30000, { "", "", -1 } },
			{ "V_HarnessO_gry", "", 30000, { "", "", -1 } },
			{ "V_HarnessOGL_brn", "", 30000, { "", "", -1 } },
			{ "V_HarnessOGL_gry", "", 30000, { "", "", -1 } },			
			{ "V_HarnessOSpec_brn", "", 30000, { "", "", -1 } },
			{ "V_HarnessOSpec_gry", "", 30000, { "", "", -1 } },
			{ "V_TacVest_blk", "", 50000, { "", "", -1 } },
			{ "V_TacVest_khk", "", 50000, { "", "", -1 } },
			{ "V_TacVest_brn", "", 50000, { "", "", -1 } },
			{ "V_TacVest_camo", "", 50000, { "", "", -1 } },
			{ "V_TacVest_oli", "", 50000, { "", "", -1 } },			
			{ "V_TacVestCamo_khk", "", 50000, { "", "", -1 } },
			{ "V_TacVestIR_blk", "", 50000, { "", "", -1 } },
			{ "V_I_G_resistanceLeader_F", "", 50000, { "", "", -1 } },						
			{ "V_PlateCarrier1_blk", "", 100000, { "", "", -1 } },
			{ "V_PlateCarrierIA2_dgtl", "", 250000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } },
            {"B_AssaultPack_cbr", "", 5000, { "", "", -1 } },
			{"B_AssaultPack_blk", "", 5000, { "", "", -1 } },
			{ "B_Kitbag_mcamo", "", 5000, { "", "", -1 } },
			{ "B_TacticalPack_oli", "", 5000, { "", "", -1 } },
			{ "B_FieldPack_ocamo", "", 5000, { "", "", -1 } },
			{ "B_Bergen_sgg", "", 5000, { "", "", -1 } },
			{ "B_Kitbag_cbr", "", 5000, { "", "", -1 } },
			{ "B_Carryall_oli", "", 20000, { "", "", -1 } },
			{ "B_Carryall_khk", "", 20000, { "", "", -1 } },			
			{ "B_AssaultPack_dgtl", "", 5000, { "", "", -1 } },
			{ "B_AssaultPack_khk", "", 5000, { "", "", -1 } },
			{ "B_AssaultPack_mcamo", "", 5000, { "", "", -1 } },
			{ "B_AssaultPack_ocamo", "", 5000, { "", "", -1 } },			
			{ "B_AssaultPack_rgr", "", 5000, { "", "", -1 } },
			{ "B_AssaultPack_sgg", "", 5000, { "", "", -1 } },
			{ "B_AssaultPack_Kerry", "", 5000, { "", "", -1 } },
			{ "B_FieldPack_blk", "", 10000, { "", "", -1 } },			
			{ "B_FieldPack_cbr", "", 10000, { "", "", -1 } },
			{ "B_FieldPack_khk", "", 10000, { "", "", -1 } },
			{ "B_FieldPack_oli", "", 10000, { "", "", -1 } },
			{ "B_FieldPack_oucamo", "", 10000, { "", "", -1 } },			
			{ "B_BergenC_grn", "", 10000, { "", "", -1 } },
			{ "B_TacticalPack_mcamo", "", 10000, { "", "", -1 } },
			{ "B_TacticalPack_blk", "", 10000, { "", "", -1 } },
			{ "B_TacticalPack_ocamo", "", 10000, { "", "", -1 } },			
			{ "B_TacticalPack_rgr", "", 10000, { "", "", -1 } },
			{ "B_Kitbag_rgr", "", 15000, { "", "", -1 } },
			{ "B_Kitbag_sgg", "", 15000, { "", "", -1 } },
			{ "B_Carryall_cbr", "", 20000, { "", "", -1 } },			
			{ "B_Carryall_mcamo", "", 20000, { "", "", -1 } },
			{ "B_Carryall_ocamo", "", 20000, { "", "", -1 } },
			{ "B_Carryall_oucamo", "", 20000, { "", "", -1 } }
        };
    };
	
	class schwarzmarktuniform {
        title = "STR_Shops_C_sshop";
        license = "schwarzwaffen";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_IG_Guerilla1_1", "", 8000, {"", "", -1} },
			{ "U_C_WorkerCoveralls", "Gefängniss Insasse", 2500, { "", "", -1 } },
			{ "U_I_G_Story_Protagonist_F", "", 7500, { "", "", -1 } },
			{ "U_I_G_resistanceLeader_F", "", 8000, { "", "", -1 } },
			{ "U_O_SpecopsUniform_ocamo", "", 17500, { "", "", -1 } },
			{ "U_B_CombatUniform_mcam", "Rebellen", 20000, { "", "", -1 } },
			{ "U_B_SpecopsUniform_sgg", "Geil", 20000, { "", "", -1 } },
			{ "U_O_PilotCoveralls", "", 15000, { "", "", -1 } },
			{ "U_IG_leader", "Guerilla Leader", 15000, { "", "", -1 } },			
			{ "U_I_CombatUniform", "", 8000, {"", "", -1} },
			{ "U_I_CombatUniform_shortsleeve", "", 8000, { "", "", -1 } },
			{ "U_O_CombatUniform_oucamo", "", 8000, { "", "", -1 } },
			{ "U_O_CombatUniform_ocamo", "", 17500, { "", "", -1 } },
			{ "U_I_OfficerUniform", "", 15000, { "", "", -1 } },
			{ "U_O_OfficerUniform_ocamo", "Guerilla Leader", 15000, { "", "", -1 } },
			{ "U_I_HeliPilotCoveralls", "", 8000, { "", "", -1 } },			
			{ "U_I_pilotCoveralls", "", 8000, {"", "", -1} },
			{ "U_I_Wetsuit", "", 8000, { "", "", -1 } },
			{ "U_O_Wetsuit", "", 8000, { "", "", -1 } },
			{ "U_I_GhillieSuit", "", 50000, { "", "", -1 } },
			{ "U_O_GhillieSuit", "", 50000, { "", "", -1 } },
			{ "U_B_CTRG_1", "", 15000, { "", "", -1 } },
			{ "U_B_FullGhillie_ard", "", 80000, { "", "", -1 } },			
			{ "U_O_FullGhillie_ard", "", 80000, {"", "", -1} },
			{ "U_I_FullGhillie_ard", "", 80000, { "", "", -1 } },
			{ "U_B_FullGhillie_sard", "", 80000, { "", "", -1 } },
			{ "U_O_FullGhillie_sard", "", 80000, { "", "", -1 } },
			{ "U_I_FullGhillie_sard", "", 80000, { "", "", -1 } },			
			{ "U_B_FullGhillie_lsh", "", 80000, { "", "", -1 } },
			{ "U_O_FullGhillie_lsh", "", 80000, { "", "", -1 } },
			{ "U_I_FullGhillie_lsh", "", 80000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
            { "H_MilCap_oucamo", "", 2500, { "", "", -1 } },
			{ "H_Bandanna_camo", "", 2500, { "", "", -1 } },	
			{ "H_ShemagOpen_tan", "", 10000, { "", "", -1 } },
			{ "H_Shemag_olive", "", 10000, { "", "", -1 } },
			{ "H_ShemagOpen_khk", "", 10000, { "", "", -1 } },
			{ "H_Shemag_khk", "", 10000, { "", "", -1 } },
			{ "H_Shemag_olive_hs", "", 10000, { "", "", -1 } },
			{ "H_Shemag_tan", "", 10000, { "", "", -1 } },
			{ "H_HelmetO_ocamo", "", 10000, { "", "", -1 } },		
			{ "H_HelmetB", "", 10000, { "", "", -1 } },
			{ "H_HelmetB_black", "", 10000, { "", "", -1 } },
			{ "H_HelmetB_camo", "", 10000, { "", "", -1 } },
			{ "H_HelmetB_desert", "", 10000, { "", "", -1 } },
			{ "H_HelmetB_grass", "", 10000, { "", "", -1 } },
			{ "H_HelmetB_light", "", 10000, { "", "", -1 } },			
			{ "H_HelmetB_light_black", "", 10000, { "", "", -1 } },
			{ "H_HelmetB_light_desert", "", 10000, { "", "", -1 } },
			{ "H_HelmetB_light_grass", "", 10000, { "", "", -1 } },
			{ "H_HelmetB_light_sand", "", 10000, { "", "", -1 } },
			{ "H_HelmetB_light_snakeskin", "", 10000, { "", "", -1 } },
			{ "H_HelmetB_paint", "", 12500, { "", "", -1 } },			
			{ "H_Helmet_Kerry", "", 12500, { "", "", -1 } },
			{ "H_HelmetB_plain_blk", "", 12500, { "", "", -1 } },
			{ "H_HelmetB_plain_mcamo", "", 12500, { "", "", -1 } },
			{ "H_HelmetB_sand", "", 12500, { "", "", -1 } },
			{ "H_HelmetB_snakeskin", "", 12500, { "", "", -1 } },
			{ "H_HelmetCrew_B", "", 12500, { "", "", -1 } },			
			{ "H_HelmetCrew_I", "", 12500, { "", "", -1 } },
			{ "H_HelmetCrew_O", "", 12500, { "", "", -1 } },
			{ "H_HelmetIA", "", 12500, { "", "", -1 } },
			{ "H_HelmetLeaderO_ocamo", "", 15000, { "", "", -1 } },
			{ "H_HelmetLeaderO_oucamo", "", 15000, { "", "", -1 } },
			{ "H_HelmetO_oucamo", "", 15000, { "", "", -1 } },			
			{ "H_HelmetSpecB", "", 15000, { "", "", -1 } },
			{ "H_HelmetSpecB_blk", "", 15000, { "", "", -1 } },
			{ "H_HelmetSpecB_paint1", "", 15000, { "", "", -1 } },
			{ "H_HelmetSpecB_paint2", "", 15000, { "", "", -1 } },
			{ "H_HelmetSpecO_blk", "", 15000, { "", "", -1 } },
			{ "H_HelmetSpecO_ocamo", "", 15000, { "", "", -1 } },						
			{ "H_PilotHelmetHeli_O", "", 20000, { "", "", -1 } },
			{ "H_PilotHelmetHeli_B", "", 20000, { "", "", -1 } },
			{ "H_PilotHelmetHeli_I", "", 20000, { "", "", -1 } },			
			{ "H_CrewHelmetHeli_O", "", 20000, { "", "", -1 } },
			{ "H_CrewHelmetHeli_I", "", 20000, { "", "", -1 } },
			{ "H_PilotHelmetFighter_B", "", 25000, { "", "", -1 } },
			{ "H_PilotHelmetFighter_I", "", 25000, { "", "", -1 } },
			{ "H_PilotHelmetFighter_O", "", 25000, { "", "", -1 } },
			{ "H_Beret_02", "", 25000, { "", "", -1 } }
        };
        goggles[] = {
            { "NONE", "Remove Glasses", 0, { "", "", -1 } },
            { "G_Shades_Black", "", 100, { "", "", -1 } },
			{ "G_Shades_Blue", "", 100, { "", "", -1 } },
			{ "G_Sport_Blackred", "", 100, { "", "", -1 } },
			{ "G_Sport_Checkered", "", 100, { "", "", -1 } },
			{ "G_Sport_Blackyellow", "", 100, { "", "", -1 } },
			{ "G_Sport_BlackWhite", "", 100, { "", "", -1 } },
			{ "G_Squares", "", 500, { "", "", -1 } },
			{ "G_Lowprofile", "", 500, { "", "", -1 } },
			{ "G_Combat", "", 500, { "", "", -1 } },						
			{ "G_Shades_Green", "", 500, { "", "", -1 } },
			{ "G_Shades_Red", "", 500, { "", "", -1 } },
			{ "G_Spectacles", "", 500, { "", "", -1 } },
			{ "G_Spectacles_Tinted", "", 1000, { "", "", -1 } },		
			{ "G_Sport_Greenblack", "", 1000, { "", "", -1 } },
			{ "G_Sport_Red", "", 2500, { "", "", -1 } },
			{ "G_Aviator", "", 2500, { "", "", -1 } },
			{ "G_Lady_Blue", "", 2500, { "", "", -1 } },					
			{ "G_Tactical_Black", "", 15000, { "", "", -1 } },
			{ "G_Tactical_Clear", "", 15000, { "", "", -1 } },
			{ "G_Bandanna_tan", "", 15000, { "", "", -1 } },
			{ "G_Bandanna_oli", "", 15000, { "", "", -1 } },			
			{ "G_Bandanna_blk", "", 15000, { "", "", -1 } },
			{ "G_Bandanna_beast", "", 15000, { "", "", -1 } },
			{ "G_Bandanna_shades", "", 15000, { "", "", -1 } },
			{ "G_Bandanna_sport", "", 15000, { "", "", -1 } },
			{ "G_Bandanna_aviator", "", 15000, { "", "", -1 } },
			{ "G_Balaclava_blk", "", 20000, { "", "", -1 } },
			{ "G_Balaclava_oli", "", 20000, { "", "", -1 } },
			{ "G_Balaclava_lowprofile", "", 20000, { "", "", -1 } },			
			{ "G_Balaclava_combat", "", 20000, { "", "", -1 } }
        };
        vests[] = {
            { "NONE", "Remove Vest", 0, { "", "", -1 } },
            { "V_BandollierB_cbr", "", 20000, { "", "", -1 } },
			{ "V_BandollierB_blk", "", 20000, { "", "", -1 } },
			{ "V_BandollierB_khk", "", 20000, { "", "", -1 } },			
			{ "V_BandollierB_oli", "", 20000, { "", "", -1 } },
			{ "V_BandollierB_rgr", "", 20000, { "", "", -1 } },
			{ "V_Chestrig_blk", "", 30000, { "", "", -1 } },						
			{ "V_Chestrig_khk", "", 30000, { "", "", -1 } },
			{ "V_Chestrig_oli", "", 30000, { "", "", -1 } },
			{ "V_Chestrig_rgr", "", 30000, { "", "", -1 } },			
			{ "V_HarnessO_brn", "", 30000, { "", "", -1 } },
			{ "V_HarnessO_gry", "", 30000, { "", "", -1 } },
			{ "V_HarnessOGL_brn", "", 30000, { "", "", -1 } },
			{ "V_HarnessOGL_gry", "", 30000, { "", "", -1 } },			
			{ "V_HarnessOSpec_brn", "", 30000, { "", "", -1 } },
			{ "V_HarnessOSpec_gry", "", 30000, { "", "", -1 } },
			{ "V_TacVest_blk", "", 50000, { "", "", -1 } },
			{ "V_TacVest_khk", "", 50000, { "", "", -1 } },
			{ "V_TacVest_brn", "", 50000, { "", "", -1 } },
			{ "V_TacVest_camo", "", 50000, { "", "", -1 } },
			{ "V_TacVest_oli", "", 50000, { "", "", -1 } },			
			{ "V_TacVestCamo_khk", "", 50000, { "", "", -1 } },
			{ "V_TacVestIR_blk", "", 50000, { "", "", -1 } },
			{ "V_I_G_resistanceLeader_F", "", 50000, { "", "", -1 } },						
			{ "V_PlateCarrier1_blk", "", 100000, { "", "", -1 } },
			{ "V_PlateCarrierIA2_dgtl", "", 250000, { "", "", -1 } }
        };
        backpacks[] = {
            { "NONE", "Remove Backpack", 0, { "", "", -1 } },
            {"B_AssaultPack_cbr", "", 5000, { "", "", -1 } },
			{"B_AssaultPack_blk", "", 5000, { "", "", -1 } },
			{ "B_Kitbag_mcamo", "", 5000, { "", "", -1 } },
			{ "B_TacticalPack_oli", "", 5000, { "", "", -1 } },
			{ "B_FieldPack_ocamo", "", 5000, { "", "", -1 } },
			{ "B_Bergen_sgg", "", 5000, { "", "", -1 } },
			{ "B_Kitbag_cbr", "", 5000, { "", "", -1 } },
			{ "B_Carryall_oli", "", 20000, { "", "", -1 } },
			{ "B_Carryall_khk", "", 20000, { "", "", -1 } },			
			{ "B_AssaultPack_dgtl", "", 5000, { "", "", -1 } },
			{ "B_AssaultPack_khk", "", 5000, { "", "", -1 } },
			{ "B_AssaultPack_mcamo", "", 5000, { "", "", -1 } },
			{ "B_AssaultPack_ocamo", "", 5000, { "", "", -1 } },			
			{ "B_AssaultPack_rgr", "", 5000, { "", "", -1 } },
			{ "B_AssaultPack_sgg", "", 5000, { "", "", -1 } },
			{ "B_AssaultPack_Kerry", "", 5000, { "", "", -1 } },
			{ "B_FieldPack_blk", "", 10000, { "", "", -1 } },			
			{ "B_FieldPack_cbr", "", 10000, { "", "", -1 } },
			{ "B_FieldPack_khk", "", 10000, { "", "", -1 } },
			{ "B_FieldPack_oli", "", 10000, { "", "", -1 } },
			{ "B_FieldPack_oucamo", "", 10000, { "", "", -1 } },			
			{ "B_BergenC_grn", "", 10000, { "", "", -1 } },
			{ "B_TacticalPack_mcamo", "", 10000, { "", "", -1 } },
			{ "B_TacticalPack_blk", "", 10000, { "", "", -1 } },
			{ "B_TacticalPack_ocamo", "", 10000, { "", "", -1 } },			
			{ "B_TacticalPack_rgr", "", 10000, { "", "", -1 } },
			{ "B_Kitbag_rgr", "", 15000, { "", "", -1 } },
			{ "B_Kitbag_sgg", "", 15000, { "", "", -1 } },
			{ "B_Carryall_cbr", "", 20000, { "", "", -1 } },			
			{ "B_Carryall_mcamo", "", 20000, { "", "", -1 } },
			{ "B_Carryall_ocamo", "", 20000, { "", "", -1 } },
			{ "B_Carryall_oucamo", "", 20000, { "", "", -1 } }
        };
    };

    class kart {
        title = "STR_Shops_C_Kart";
        license = "";
        side = "civ";
        uniforms[] = {
            { "NONE", "Remove Uniform", 0, { "", "", -1 } },
            { "U_C_Driver_1_black", "", 5000, { "", "", -1 } },
			{ "U_C_Driver_1_blue", "", 5000, { "", "", -1 } },
			{ "U_C_Driver_1_red", "", 5000, { "", "", -1 } },
			{ "U_C_Driver_1_orange", "", 5000, { "", "", -1 } },
			{ "U_C_Driver_1_green", "", 5000, { "", "", -1 } },
			{ "U_C_Driver_1_white", "", 5000, { "", "", -1 } },
			{ "U_C_Driver_1_yellow", "", 5000, { "", "", -1 } },
			{ "U_C_Driver_2", "", 7500, { "", "", -1 } },
			{ "U_C_Driver_1", "", 7500, { "", "", -1 } },
			{ "U_C_Driver_3", "", 10000, { "", "", -1 } },
			{ "U_C_Driver_4", "", 10000, { "", "", -1 } }
        };
        headgear[] = {
            { "NONE", "Remove Hat", 0, { "", "", -1 } },
            { "H_RacingHelmet_1_black_F", "", 5000, { "", "", -1 } },
			{ "H_RacingHelmet_1_red_F", "", 5000, { "", "", -1 } },
			{ "H_RacingHelmet_1_white_F", "", 5000, { "", "", -1 } },
			{ "H_RacingHelmet_1_blue_F", "", 5000, { "", "", -1 } },
			{ "H_RacingHelmet_1_yellow_F", "", 5000, { "", "", -1 } },
			{ "H_RacingHelmet_1_green_F", "", 5000, { "", "", -1 } },
			{ "H_RacingHelmet_1_F", "", 5000, { "", "", -1 } },
			{ "H_RacingHelmet_2_F", "", 10000, { "", "", -1 } },
			{ "H_RacingHelmet_3_F", "", 10000, { "", "", -1 } },
			{ "H_RacingHelmet_4_F", "", 10000, { "", "", -1 } }
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
