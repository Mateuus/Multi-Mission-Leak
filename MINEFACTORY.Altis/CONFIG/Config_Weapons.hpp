/*
*    Format:
*        level: ARRAY (This is for limiting items to certain things)
*            0: Variable to read from
*            1: Variable Value Type (SCALAR / BOOL / EQUAL)
*            2: What to compare to (-1 = Check Disabled)
*            3: Custom exit message (Optional)
*
*    items: { Classname, Itemname, BuyPrice, SellPrice }
*
*    Itemname only needs to be filled if you want to rename the original object name.
*
*    Weapon classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Weapons
*    Item classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Items
*
*/
class WeaponShops {
    //Armory Shops
    class gun {
        name = "Billy Joe's Firearms";
        side = "civ";
        license = "gun";
        level[] = { "", "", -1, "" };
        items[] = {
            { "hgun_Pistol_Signal_F", "", 5000 },
            { "SMG_02_F", "", 45000 },
            { "hgun_PDW2000_F", "", 30000 },
            { "hgun_Rook40_F", "", 7500 },
            { "hgun_ACPC2_F", "", 10000 },
            { "hgun_Pistol_heavy_02_Yorris_F", "", 12500 },
            { "optic_Aco_smg", "", 2500 },
            { "optic_ACO_grn_smg", "", 2500 },
            { "V_Rangemaster_belt", "", 2500 }
        };
        mags[] = {
            { "6Rnd_GreenSignal_F", "", 100 },
            { "6Rnd_RedSignal_F", "", 100 },
            { "30Rnd_9x21_Mag", "", 125 },
            { "16Rnd_9x21_Mag", "", 75 },
            { "30Rnd_9x21_Mag", "", 50 },
            { "9Rnd_45ACP_Mag", "", 75 },
            { "6Rnd_45ACP_Cylinder", "", 50 }
        };
    };
	
    class donator {
        name = "Diplomatenshop";
        side = "civ";
        license = "donator";
        level[] = { "", "", -1, "" };
        items[] = {
            { "arifle_MXM_RCO_pointer_snds_F", "", 60000 },
            { "arifle_MX_SW_Black_F", "", 70000 },
            { "arifle_MX_SW_F", "", 70000 },
            { "hgun_Rook40_F", "", 7500 },
            { "hgun_PDW2000_F", "", 10000 },
            { "arifle_TRG21_GL_F", "", 1500 },
            { "1Rnd_SmokeRed_Grenade_shell", "", 1500 },
			{ "1Rnd_SmokeGreen_Grenade_shell", "", 1500 },
			{ "1Rnd_SmokeYellow_Grenade_shell", "", 1500 },
			{ "1Rnd_SmokePurple_Grenade_shell", "", 1500 },
			{ "1Rnd_SmokeBlue_Grenade_shell", "", 1500 },
			{ "1Rnd_SmokeOrange_Grenade_shell", "", 1500 },
            { "optic_DMS", "", 4500 },
            { "srifle_EBR_ARCO_pointer_snds_F", "", 65000 },
			{ "srifle_GM6_camo_LRPS_F", "", 950000 },
			{ "srifle_LRR_camo_SOS_F", "", 450000 },
			{ "srifle_DMR_04_Tan_F", "", 75000 },
			{ "10Rnd_127x54_Mag", "", 1500 },
			{ "optic_KHS_hex", "", 4000 },
			{ "bipod_01_F_mtp", "", 7500 },
			{ "muzzle_snds_338_black", "", 1020 },
			{ "muzzle_snds_L", "", 2000 },
			{ "muzzle_snds_B", "", 2000 },
			{ "muzzle_snds_M", "", 2500 },
			{ "muzzle_snds_H", "", 2500 },
			{ "muzzle_snds_H_MG", "", 2500 }
        };
        mags[] = {
            { "30Rnd_65x39_caseless_mag", "", 750 },
            { "100Rnd_65x39_caseless_mag", "", 3750 },
            { "100Rnd_65x39_caseless_mag", "", 1500 },
            { "30Rnd_9x21_Mag", "", 500 },
            { "30Rnd_556x45_Stanag_Tracer_Green", "", 1500 },
            { "9Rnd_45ACP_Mag", "", 75 },
            { "20Rnd_762x51_Mag", "", 550 },
			{ "5Rnd_127x108_Mag", "", 2000 },
			{ "5Rnd_127x108_APDS_Mag", "", 18000 },
			{ "7Rnd_408_Mag", "", 1500 },
			{ "10Rnd_127x54_Mag", "", 1500 }
        };
    };
	
    class gun_big {
        name = "Jagdwaffen";
        side = "civ";
        license = "gun_big";
        level[] = { "", "", -1, "" };
        items[] = {
            { "srifle_DMR_06_camo_F", "", 75000 },
            { "optic_KHS_hex", "", 20000 },
            { "bipod_01_F_mtp", "", 7500 },
            { "hgun_ACPC2_F", "", 10000 },
            { "optic_Aco_smg", "", 2500 },
            { "optic_ACO_grn_smg", "", 2500 },
            { "V_Rangemaster_belt", "", 2500 },
			{ "hgun_Rook40_F", "", 4500 },
			{ "hgun_PDW2000_F", "", 10000 },
			{ "arifle_TRG21_GL_F", "", 90500 },
			{ "1Rnd_Smoke_Grenade_shell", "", 1500 },
			{ "1Rnd_SmokeRed_Grenade_shell", "", 1500 },
            { "1Rnd_SmokeGreen_Grenade_shell", "", 1500 },
            { "1Rnd_SmokeYellow_Grenade_shell", "", 1500 },
			{ "1Rnd_SmokePurple_Grenade_shell", "", 1500 },
			{ "1Rnd_SmokeBlue_Grenade_shell", "", 1500 },
			{ "1Rnd_SmokeOrange_Grenade_shell", "", 1500 },
			{ "ToolKit", "", 1500 },
			{ "optic_DMS", "", 4900 }
        };
        mags[] = {
            { "20Rnd_762x51_Mag", "", 125 },
			{ "9Rnd_45ACP_Mag", "", 123},
            { "10Rnd_93x64_DMR_05_Mag", "", 12500 },
            { "30Rnd_9x21_Mag", "", 4500 },
            { "20Rnd_762x51_Mag", "", 125 },
			{ "6Rnd_45ACP_Cylinder", "", 120},
			{ "30Rnd_556x45_Stanag_Tracer_Green", "", 1500}
        };
    };

    class rebel {
        name = "Mohammed's Jihadi Shop";
        side = "civ";
        license = "rebel";
        level[] = { "", "", -1, "" };
        items[] = {
            { "SMG_02_F", "", 25000 },
            { "arifle_MX_RCO_pointer_snds_F", "", 160000 },
            { "SMG_01_F", "", 10700 },
            { "hgun_Pistol_heavy_01_MRD_F", "", 8000 },
            { "arifle_SDAR_F", "", 55000 },
            { "arifle_TRG20_F", "", 25750 },
            { "arifle_Mk20_F", "", 28000 },
            { "arifle_Katiba_F", "", 75000 },
            { "LMG_Mk200_F", "", 800000 },
            { "srifle_DMR_01_F", "", 215000 },
            { "srifle_LRR_SOS_F", "", 990000 },
            { "srifle_DMR_03_multicam_F", "", 325000 },
            { "optic_Aco", "", 3500 },
            { "optic_NVS", "", 3500 },
            { "optic_ACO_grn", "", 3500 },
            { "optic_ACO_grn_smg", "", 3500 },
            { "optic_Holosight_smg", "", 3500 },
            { "optic_Holosight", "", 3500 },
            { "optic_Arco", "", 3500 },
            { "optic_MRCO", "", 3500 },
            { "optic_Hamr", "", 3500 },
            { "optic_KHS_hex", "", 3500 },
            { "optic_AMS", "", 3500 },
            { "acc_flashlight", "", 3500 },
            { "ToolKit", "", 2500 },
            { "FirstAidKit", "", 2500 },
            { "ItemGPS", "", 2500 },
            { "NVGoggles_INDEP", "", 2500 },
            { "Chemlight_red", "", 2500 },
            { "Chemlight_yellow", "", 2500 },
            { "Chemlight_green", "", 2500 },
            { "Chemlight_blue", "", 2500 },
            { "Rangefinder", "", 2500 }
        };
        mags[] = {
            { "30Rnd_9x21_Mag", "", 500 },
            { "30Rnd_65x39_caseless_mag_Tracer", "", 2500 },
            { "30Rnd_45ACP_Mag_SMG_01", "", 550 },
            { "11Rnd_45ACP_Mag", "", 700 },
            { "20Rnd_556x45_UW_mag", "", 500 },
            { "30Rnd_556x45_Stanag", "", 300 },
            { "30Rnd_556x45_Stanag", "", 300 },
            { "30Rnd_65x39_caseless_green", "", 800 },
            { "200Rnd_65x39_cased_Box", "", 3500 },
            { "10Rnd_762x54_Mag", "", 500 },
            { "7Rnd_408_Mag", "", 2500 },
            { "20Rnd_762x51_Mag", "", 125 }
        };
    };

    class gang {
        name = "Hideout Armament";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
           { "hgun_Rook40_F", "", 1500 },
            { "hgun_Pistol_heavy_02_F", "", 2500 },
            { "hgun_ACPC2_F", "", 4500 },
            { "hgun_PDW2000_F", "", 9500 },
            { "optic_ACO_grn_smg", "", 950 },
            { "V_Rangemaster_belt", "", 1900 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 25 },
            { "9Rnd_45ACP_Mag", "", 45 },
            { "6Rnd_45ACP_Cylinder", "", 50 },
            { "30Rnd_9x21_Mag", "", 75 }
        };
    };

    //Basic Shops
    class genstore {
        name = "Altis General Store";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "Binocular", "", 150, -1 },
            { "ItemGPS", "", 100, 45 },
            { "ItemMap", "", 50, 35 },
            { "ItemCompass", "", 50, 25 },
            { "ItemWatch", "", 50, -1 },
            { "ToolKit", "", 250, 75 },
            { "FirstAidKit", "", 150, 65 },
            { "NVGoggles", "", 2000, 980 },
            { "Chemlight_red", "", 300, -1 },
            { "Chemlight_yellow", "", 300, 50 },
            { "Chemlight_green", "", 300, 50 },
            { "Chemlight_blue", "", 300, 50 }
        };
        mags[] = {};
    };

    class f_station_store {
        name = "Altis Fuel Station Store";
        side = "";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
             { "Binocular", "", 150 },
            { "ItemGPS", "", 100 },
            { "ToolKit", "", 250 },
            { "FirstAidKit", "", 150 },
            { "NVGoggles", "", 2000 },
            { "Chemlight_red", "", 300 },
            { "Chemlight_yellow", "", 300 },
            { "Chemlight_green", "", 300 },
            { "Chemlight_blue", "", 300 }
        };
        mags[] = {};
    };

    //Cop Shops
    class cop_1 {
        name = "Altis Cop Shop";
        side = "cop";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
           { "arifle_sdar_F", "Taser Rifle", 100 },
            { "hgun_P07_snds_F", "Taser Pistole", 100 },
            { "arifle_MX_ACO_F", "", 100 },
            { "SMG_02_ARCO_pointg_F", "", 100 },
            { "HandGrenade_Stone", "Flashbang", 1700 },
            { "optic_Aco", "", 150 },
            { "optic_ACO_grn_smg", "", 150 },
            { "optic_Holosight_smg", "", 1000 },
            { "optic_Holosight", "", 2000 },
            { "optic_Arco", "", 50 },
            { "optic_Hamr", "", 50 },
            { "optic_NVS", "", 100 },
            { "optic_DMS", "", 50 },
            { "optic_MRCO", "", 50 },
            { "optic_AMS", "", 250 },
            { "optic_SOS", "", 650 },
            { "optic_LRPS", "", 50 },
            { "optic_KHS_hex", "", 50 },
            { "acc_flashlight", "", 50 },
            { "acc_pointer_IR", "", 50 },
            { "Laserdesignator", "", 50 },
            { "NVGoggles_OPFOR", "", 50 },
            { "muzzle_snds_L", "", 50 },
            { "ItemGPS", "", 50 },
            { "ToolKit", "", 50 },
            { "Rangefinder", "", 125 },
            { "Chemlight_red", "", 300, -1 },
            { "Chemlight_yellow", "", 300, 50 },
            { "Chemlight_green", "", 300, 50 },
            { "Chemlight_blue", "", 300, 50 }
        };
        mags[] = {
            { "20Rnd_556x45_UW_mag", "Taser Rifle Magazine", 100 },
            { "30Rnd_9x21_Mag", "Taser 30 Schuss", 100 },
            { "30Rnd_65x39_caseless_mag", "", 100 },
            { "30Rnd_9x21_Mag", "", 100 }
        };
    };

    class cop_2 {
        name = "Altis Patrol Officer Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 2, "Du hast einen zu niedrigen Dienstrang!" };
        items[] = {
           { "arifle_MX_ACO_F", "", 100 },
            { "arifle_sdar_F", "", 100 },
            { "arifle_Mk20_plain_F", "", 100 },
            { "muzzle_snds_H", "", 100 },
            { "muzzle_snds_B", "", 100 },
            { "muzzle_snds_M", "", 100 },
            { "muzzle_snds_H_MG", "", 100 },
            { "bipod_01_F_blk", "", 100 },
            { "arifle_Katiba_ARCO_pointer_snds_F", "", 100 },
            { "arifle_MX_Black_F", "", 100 }
        };
        mags[] = {
            { "30Rnd_65x39_caseless_mag", "", 100 },
            { "30Rnd_556x45_Stanag_Tracer_Green", "Scharfe-SDAR-Munition", 100 },
            { "30Rnd_556x45_Stanag", "", 100 },
            { "30Rnd_65x39_caseless_green", "", 100 },
            { "30Rnd_9x21_Mag", "", 100 }
        };
    };

    class cop_3 {
        name = "Altis Sergeant Officer Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 3, "Du hast einen zu niedrigen Dienstrang!" };
        items[] = {
            { "arifle_MXM_RCO_pointer_snds_F", "", 100 },
            { "arifle_TRG21_MRCO_F", "", 100 },
            { "arifle_MX_SW_F", "", 100 },
			{ "arifle_MXM_Black_F", "", 100 },
			{ "arifle_MX_SW_Black_F", "", 100 }
        };
        mags[] = {
            { "30Rnd_65x39_caseless_mag", "", 100 },
            { "30Rnd_556x45_Stanag", "", 100 },
            { "100Rnd_65x39_caseless_mag", "", 100 }
        };
    };

    class cop_4 {
        name = "Altis Sergeant Officer Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 4, "Du hast einen zu niedrigen Dienstrang!" };
        items[] = {
           { "srifle_EBR_DMS_F", "", 100 },
			{ "LMG_Mk200_F", "", 100 },
			{ "arifle_MX_GL_ACO_F", "", 100 },
            { "SmokeShellGreen", "Reizgas", 100 },
			{ "arifle_MX_GL_Black_F", "MX 3Gl", 100 }
        };
        mags[] = {
            { "20Rnd_762x51_Mag", "", 100 },
			{ "200Rnd_65x39_cased_Box", "", 100 },
			{ "30Rnd_65x39_caseless_mag", "", 100 },
			{ "3Rnd_Smoke_Grenade_shell", "", 100 },
			{ "3Rnd_SmokeRed_Grenade_shell", "", 100 },
			{ "3Rnd_SmokeGreen_Grenade_shell", "", 100 },
			{ "3Rnd_SmokeYellow_Grenade_shell", "", 100 },
			{ "3Rnd_SmokeBlue_Grenade_shell", "", 100 },
			{ "3Rnd_SmokeOrange_Grenade_shell", "", 100 },
			{ "3Rnd_UGL_FlareRed_F", "", 100 },
            { "3Rnd_UGL_FlareGreen_F", "", 100 },
			{ "3Rnd_SmokePurple_Grenade_shell", "GL Reizgas", 100 }
        };
    };

    class cop_5 {
        name = "Altis Sergeant Officer Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 5, "Du hast einen zu niedrigen Dienstrang!" };
        items[] = {
            { "srifle_DMR_06_olive_F", "", 100 },
            { "srifle_DMR_02_F", "", 100 },
            { "muzzle_snds_338_black", "", 100 },
            { "bipod_01_F_blk", "", 100 },
            { "Laserbatteries", "", 100 },
            { "DemoCharge_Remote_Mag", "", 100 }
        };
        mags[] = {
            { "20Rnd_762x51_Mag", "", 100 },
            { "10Rnd_338_Mag", "", 100 }
        };
    };

    class cop_6 {
        name = "Altis Sergeant Officer Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 6, "Du hast einen zu niedrigen Dienstrang!" };
        items[] = {         
			{ "srifle_DMR_05_blk_F", "", 100 },
            { "muzzle_snds_93mmg", "", 100 },
            { "bipod_01_F_blk", "", 100 }
        };
        mags[] = {
            { "10Rnd_93x64_DMR_05_Mag", "", 100 },
            { "30Rnd_556x45_Stanag", "", 100 }
        };
    };

    class cop_7 {
        name = "Altis Sergeant Officer Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 7, "Du hast einen zu niedrigen Dienstrang!" };
        items[] = {
            { "srifle_DMR_05_DMS_F", "", 100 },
            { "LMG_Zafir_ARCO_F", "", 100 },
        };
        mags[] = {
            { "10Rnd_93x64_DMR_05_Mag", "", 100 },
            { "150Rnd_762x54_Box", "", 100 }
        };
    };

    class cop_8 {
        name = "Altis Sergeant Officer Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 8, "Du hast einen zu niedrigen Dienstrang!" };
        items[] = {
            { "srifle_DMR_05_tan_f", "", 100 },
			{ "arifle_MX_GL_ACO_F", "", 100 },
        };
        mags[] = {
            { "10Rnd_93x64_DMR_05_Mag", "", 100 },
			{ "30Rnd_65x39_caseless_mag", "", 100 },
			{ "3Rnd_Smoke_Grenade_shell", "", 100 },
			{ "3Rnd_SmokeRed_Grenade_shell", "", 100 },
			{ "3Rnd_SmokeGreen_Grenade_shell", "", 100 },
			{ "3Rnd_SmokeYellow_Grenade_shell", "", 100 },
			{ "3Rnd_SmokeBlue_Grenade_shell", "", 100 },
			{ "3Rnd_SmokeOrange_Grenade_shell", "", 100 },
			{ "3Rnd_UGL_FlareRed_F", "", 100 },
            { "3Rnd_UGL_FlareGreen_F", "", 100 },
			{ "3Rnd_SmokePurple_Grenade_shell", "GL Reizgas", 100 },
            { "3Rnd_HE_Grenade_shell", "", 100 }
        };
    };

    class cop_9 {
        name = "Altis Sergeant Officer Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 9, "Du hast einen zu niedrigen Dienstrang!" };
        items[] = {
            { "srifle_DMR_05_tan_f", "", 100 },
            { "SatchelCharge_Remote_Mag", "", 100 }
        };
        mags[] = {
            { "10Rnd_93x64_DMR_05_Mag", "", 100 }
        };
    };

    class cop_10 {
        name = "Altis Sergeant Officer Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 10, "Du hast einen zu niedrigen Dienstrang!" };
        items[] = {
            { "srifle_DMR_05_tan_f", "", 100 },
            { "SatchelCharge_Remote_Mag", "", 100 }
        };
        mags[] = {
            { "10Rnd_93x64_DMR_05_Mag", "", 100 }
        };
    };

    class cop_sek {
        name = "MF S.E.K. Shop";
        side = "cop";
        license = "swat";
        level[] = { "life_coplevel", "SCALAR", 2, "Du bist kein S.E.K. Mitglied!" };
        items[] = {
           
            { "arifle_MXC_ACO_pointer_snds_F", "", 100 },
            { "srifle_EBR_DMS_pointer_snds_F", "", 100 },
			{ "LMG_Zafir_ARCO_F", "", 100 },
            { "srifle_DMR_03_DMS_snds_F", "", 100 },
            { "srifle_DMR_05_hex_F", "", 100 },
            { "srifle_LRR_camo_SOS_F", "", 100 },
            { "srifle_GM6_LRPS_F", "", 100 },
            { "MMG_02_black_RCO_BI_F", "", 100 },
            { "MMG_01_tan_F", "", 100 },
            { "muzzle_snds_M", "", 100 },
            { "muzzle_snds_H", "", 100 },
            { "muzzle_snds_B", "", 100 },
            { "muzzle_snds_H_MG", "", 100 },
            { "muzzle_snds_338_black", "", 100 },
            { "muzzle_snds_93mmg", "", 100 },
            { "bipod_01_F_blk", "", 100 },
            { "SmokeShellGreen", "Reizgas", 100 },
            { "DemoCharge_Remote_Mag", "", 100 },
            { "Laserbatteries", "", 100 },
			{ "arifle_MXC_Black_F", "", 100 }
        };
        mags[] = {
            { "30Rnd_65x39_caseless_mag", "", 100 },
            { "20Rnd_762x51_Mag", "", 100 },
            { "10Rnd_93x64_DMR_05_Mag", "", 100 },
            { "7Rnd_408_Mag", "", 100 },
            { "5Rnd_127x108_APDS_Mag", "", 100 },
            { "130Rnd_338_Mag", "", 100 },
            { "150Rnd_93x64_Mag", "", 100 },
			 { "150Rnd_762x54_Box", "", 100 }
        };
    };

    class cop_OP {
        name = "MF Operator Shop";
        side = "cop";
        license = "OP";
        level[] = { "life_coplevel", "SCALAR", 4, "Du bist kein Operator!" };
        items[] = {           
            { "B_UavTerminal", "", 100 },
            { "B_Static_Designator_01_weapon_F", "", 100 },
            { "B_UAV_01_backpack_F", "", 100 },
            { "Laserbatteries", "", 100 }
        };
        mags[] = {
        };
    };

    //Medic Shops
    class med_basic {
        name = "store";
        side = "med";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "ItemGPS", "", 100 },
            { "Binocular", "", 150 },
            { "ToolKit", "", 250 },
            { "FirstAidKit", "", 150 },
            { "Medikit", "", 500 },
            { "NVGoggles", "", 1200 },
            { "B_FieldPack_ocamo", "", 3000 }
        };
        mags[] = {};
    };
};
