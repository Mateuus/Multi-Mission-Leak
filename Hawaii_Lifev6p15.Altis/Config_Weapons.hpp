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
    //Medic Shops
    class med_basic {
        name = "STR_Shop_C_THW";
        side = "med";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "ItemGPS", "",50, -1 },
            { "ToolKit", "",100, -1 },
            { "FirstAidKit", "",50, -1 },
            { "Medikit", "",1000, -1 },
            { "NVGoggles", "",100, -1 }
        };
        mags[] = {};
    };
	
    //Armory Shops
    class gun {
        name = "STR_Shops_W_Gun";
        side = "civ";
        license = "gun";
        level[] = { "", "", -1, "" };
        items[] = {
			{ "SMG_02_F", "",40000, -1 },
            { "SMG_01_F", "",40000, -1 },
            { "hgun_PDW2000_F", "",25000, -1 },
            { "hgun_Rook40_F", "",15000, -1 },
            { "hgun_Pistol_heavy_02_F", "",15000, -1 },
            { "hgun_Pistol_heavy_01_F", "",15000, -1 },
            { "hgun_ACPC2_F", "",15000, -1 },
            { "muzzle_snds_L", "",30000, -1 },
            { "muzzle_snds_acp", "",30000, -1 },
            { "optic_MRD", "",2500, -1 },
            { "optic_Yorris", "",2500, -1 },
            { "optic_Aco_smg", "",2500, -1 },
            { "optic_ACO_grn_smg", "",2500, -1 },
            { "optic_Holosight_smg", "",2500, -1 }
		};
        mags[] = {
            { "30Rnd_9x21_Mag", "",500, -1 },
            { "16Rnd_9x21_Mag", "",250, -1 },
            { "30Rnd_45ACP_Mag_SMG_01", "",500, -1 },
            { "11Rnd_45ACP_Mag", "",250, -1 },
            { "9Rnd_45ACP_Mag", "",250, -1 },
            { "6Rnd_45ACP_Cylinder", "",250, -1 }
		};
    };

    class rebel {
        name = "STR_Shops_C_Rebel";
        side = "civ";
        license = "rebel";
        level[] = { "", "", -1, "" };
        items[] = {
            { "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "NONE", "Sturmgewehre",0, -1 },
            { "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "arifle_SDAR_F", "",75000, -1 },
            { "arifle_Mk20C_plain_F", "",150000, -1 },
            { "arifle_Mk20_plain_F", "",150000, -1 },
            { "arifle_Mk20_GL_plain_F", "",180000, -1 },
            { "arifle_Mk20C_F", "",150000, -1 },
            { "arifle_Mk20_F", "",150000, -1 },
            { "arifle_Mk20_GL_F", "",180000, -1 },
            { "arifle_TRG20_F", "",150000, -1 },
            { "arifle_TRG21_F", "",150000, -1 },
            { "arifle_TRG21_GL_F", "",180000, -1 },
            { "arifle_Katiba_C_F", "",225000, -1 },
            { "arifle_Katiba_F", "",225000, -1 },
            { "arifle_Katiba_GL_F", "",250000, -1 },
            { "arifle_MXC_F", "",300000, -1 },
            { "arifle_MX_F", "",300000, -1 },
            { "arifle_MX_GL_F", "",375000, -1 },
            { "arifle_MXM_F", "",350000, -1 },
            { "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "NONE", "Sniper- und Schütztengewehre",0, -1 },
            { "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "srifle_DMR_01_F", "",400000, -1 },
            { "srifle_EBR_F", "",500000, -1 },
            { "srifle_DMR_06_camo_F", "",600000, -1 },
            { "srifle_DMR_06_olive_F", "",600000, -1 },
            { "srifle_DMR_03_multicam_F", "",1000000, -1 },
            { "srifle_DMR_03_khaki_F", "",1000000, -1 },
            { "srifle_DMR_03_tan_F", "",1000000, -1 },
            { "srifle_DMR_03_woodland_F", "",1000000, -1 },
            { "srifle_LRR_camo_F", "",4000000, -1 },
            { "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "NONE", "Zubehör",0, -1 },
            { "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "acc_flashlight", "",500, -1 },
            { "acc_pointer_IR", "",500, -1 },
            { "optic_Aco", "",5000, -1 },
            { "optic_ACO_grn", "",5000, -1 },
            { "optic_Holosight", "",7500, -1 },
            { "optic_MRCO", "",10000, -1 },
            { "optic_Hamr", "",10000, -1 },
            { "optic_Arco", "",10000, -1 },
            { "optic_DMS", "",15000, -1 },
            { "optic_AMS", "",17500, -1 },
            { "optic_AMS_snd", "",17500, -1 },
            { "optic_AMS_khk", "",17500, -1 },
            { "optic_KHS_blk", "",17500, -1 },
            { "optic_KHS_old", "",17500, -1 },
            { "optic_KHS_tan", "",17500, -1 },
            { "optic_KHS_hex", "",17500, -1 },
            { "optic_SOS", "",20000, -1 },
            { "optic_LRPS", "",25000, -1 },
            { "optic_NVS", "",75000, -1 },
            { "muzzle_snds_B", "",50000, -1 },
            { "muzzle_snds_H", "",50000, -1 },
            { "muzzle_snds_M", "",50000, -1 },
            { "bipod_01_F_blk", "",65000, -1 },
            { "bipod_01_F_snd", "",65000, -1 },
            { "bipod_01_F_mtp", "",65000, -1 },
            { "bipod_02_F_blk", "",65000, -1 },
            { "bipod_02_F_hex", "",65000, -1 },
            { "bipod_02_F_tan", "",65000, -1 },
            { "bipod_03_F_blk", "",65000, -1 },
            { "bipod_03_F_oli", "",65000, -1 },
            { "UGL_FlareWhite_F", "",500, -1 },
            { "UGL_FlareGreen_F", "",500, -1 },
            { "UGL_FlareRed_F", "",500, -1 },
            { "UGL_FlareYellow_F", "",500, -1 },
            { "UGL_FlareCIR_F", "",500, -1 },
            { "1Rnd_Smoke_Grenade_shell", "",500, -1 },
            { "1Rnd_SmokeRed_Grenade_shell", "",500, -1 },
            { "1Rnd_SmokeYellow_Grenade_shell", "",500, -1 },
            { "1Rnd_SmokePurple_Grenade_shell", "",500, -1 },
            { "1Rnd_SmokeBlue_Grenade_shell", "",500, -1 },
            { "1Rnd_SmokeOrange_Grenade_shell", "",500, -1 },
            { "1Rnd_SmokeGreen_Grenade_shell","Tränengas",15000, -1 },
            { "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "NONE", "Kleine Kaliber",0, -1 },
			{ "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "SMG_02_F", "",40000, -1 },
            { "SMG_01_F", "",40000, -1 },
            { "hgun_PDW2000_F", "",25000, -1 },
            { "hgun_Rook40_F", "",15000, -1 },
            { "hgun_Pistol_heavy_02_F", "",15000, -1 },
            { "hgun_Pistol_heavy_01_F", "",15000, -1 },
            { "hgun_ACPC2_F", "",15000, -1 },
            { "muzzle_snds_L", "",30000, -1 },
            { "muzzle_snds_acp", "",30000, -1 },
            { "optic_MRD", "",2500, -1 },
            { "optic_Yorris", "",2500, -1 },
            { "optic_Aco_smg", "",2500, -1 },
            { "optic_ACO_grn_smg", "",2500, -1 },
            { "optic_Holosight_smg", "",2500, -1 }
        };
        mags[] = {
            { "7Rnd_408_Mag", "",5000, -1 },
            { "20Rnd_762x51_Mag", "",1000, -1 },
            { "10Rnd_762x54_Mag", "",500, -1 },
            { "30Rnd_65x39_caseless_green", "",500, -1 },
            { "30Rnd_65x39_caseless_mag", "",500, -1 },
            { "30Rnd_556x45_Stanag", "",500, -1 },
            { "20Rnd_556x45_UW_mag", "",500, -1 },
            { "30Rnd_9x21_Mag", "",500, -1 },
            { "16Rnd_9x21_Mag", "",250, -1 },
            { "30Rnd_45ACP_Mag_SMG_01", "",500, -1 },
            { "11Rnd_45ACP_Mag", "",250, -1 },
            { "9Rnd_45ACP_Mag", "",250, -1 },
            { "6Rnd_45ACP_Cylinder", "",250, -1 }
        };
    };

    class gang {
        name = "STR_Shops_C_Hideout";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "NONE", "Sturmgewehre",0, -1 },
            { "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "arifle_Mk20C_plain_F", "",150000, -1 },
            { "arifle_Mk20_plain_F", "",150000, -1 },
            { "arifle_Mk20_GL_plain_F", "",180000, -1 },
            { "arifle_Mk20C_F", "",150000, -1 },
            { "arifle_Mk20_F", "",150000, -1 },
            { "arifle_Mk20_GL_F", "",180000, -1 },
            { "arifle_TRG20_F", "",150000, -1 },
            { "arifle_TRG21_F", "",150000, -1 },
            { "arifle_TRG21_GL_F", "",180000, -1 },
            { "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "NONE", "Zubehör",0, -1 },
            { "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "acc_flashlight", "",500, -1 },
            { "acc_pointer_IR", "",500, -1 },
            { "optic_Aco", "",5000, -1 },
            { "optic_ACO_grn", "",5000, -1 },
            { "optic_Holosight", "",7500, -1 },
            { "optic_MRCO", "",10000, -1 },
            { "optic_Hamr", "",10000, -1 },
            { "optic_Arco", "",10000, -1 },
            { "optic_DMS", "",15000, -1 },
            { "optic_AMS", "",17500, -1 },
            { "optic_AMS_snd", "",17500, -1 },
            { "optic_AMS_khk", "",17500, -1 },
            { "optic_KHS_blk", "",17500, -1 },
            { "optic_KHS_old", "",17500, -1 },
            { "optic_KHS_tan", "",17500, -1 },
            { "optic_KHS_hex", "",17500, -1 },
            { "optic_SOS", "",20000, -1 },
            { "muzzle_snds_H", "",50000, -1 },
            { "muzzle_snds_M", "",50000, -1 },
            { "bipod_01_F_blk", "",65000, -1 },
            { "bipod_01_F_snd", "",65000, -1 },
            { "bipod_01_F_mtp", "",65000, -1 },
            { "bipod_02_F_blk", "",65000, -1 },
            { "bipod_02_F_hex", "",65000, -1 },
            { "bipod_02_F_tan", "",65000, -1 },
            { "bipod_03_F_blk", "",65000, -1 },
            { "bipod_03_F_oli", "",65000, -1 },
            { "UGL_FlareWhite_F", "",500, -1 },
            { "UGL_FlareGreen_F", "",500, -1 },
            { "UGL_FlareRed_F", "",500, -1 },
            { "UGL_FlareYellow_F", "",500, -1 },
            { "UGL_FlareCIR_F", "",500, -1 },
            { "1Rnd_Smoke_Grenade_shell", "",500, -1 },
            { "1Rnd_SmokeRed_Grenade_shell", "",500, -1 },
            { "1Rnd_SmokeYellow_Grenade_shell", "",500, -1 },
            { "1Rnd_SmokePurple_Grenade_shell", "",500, -1 },
            { "1Rnd_SmokeBlue_Grenade_shell", "",500, -1 },
            { "1Rnd_SmokeOrange_Grenade_shell", "",500, -1 },
            { "1Rnd_SmokeGreen_Grenade_shell","Tränengas",15000, -1 },
            { "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "NONE", "Kleine Kaliber",0, -1 },
			{ "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "SMG_02_F", "",40000, -1 },
            { "SMG_01_F", "",40000, -1 },
            { "hgun_PDW2000_F", "",25000, -1 },
            { "hgun_Rook40_F", "",15000, -1 },
            { "hgun_Pistol_heavy_02_F", "",15000, -1 },
            { "hgun_Pistol_heavy_01_F", "",15000, -1 },
            { "hgun_ACPC2_F", "",15000, -1 },
            { "muzzle_snds_L", "",30000, -1 },
            { "muzzle_snds_acp", "",30000, -1 },
            { "optic_MRD", "",2500, -1 },
            { "optic_Yorris", "",2500, -1 },
            { "optic_Aco_smg", "",2500, -1 },
            { "optic_ACO_grn_smg", "",2500, -1 },
            { "optic_Holosight_smg", "",2500, -1 }
        };
        mags[] = {
            { "30Rnd_65x39_caseless_green", "",500, -1 },
            { "30Rnd_65x39_caseless_mag", "",500, -1 },
            { "30Rnd_556x45_Stanag", "",500, -1 },
            { "20Rnd_556x45_UW_mag", "",500, -1 },
            { "30Rnd_9x21_Mag", "",500, -1 },
            { "16Rnd_9x21_Mag", "",250, -1 },
            { "30Rnd_45ACP_Mag_SMG_01", "",500, -1 },
            { "11Rnd_45ACP_Mag", "",250, -1 },
            { "9Rnd_45ACP_Mag", "",250, -1 },
            { "6Rnd_45ACP_Cylinder", "",250, -1 }
        };
    };

    class black {
        name = "STR_Shops_C_Black";
        side = "civ";
        license = "black";
        level[] = { "", "", -1, "" };
        items[] = {
            { "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "NONE", "Sturmgewehre",0, -1 },
            { "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "arifle_SDAR_F", "",75000, -1 },
            { "arifle_Mk20C_plain_F", "",150000, -1 },
            { "arifle_Mk20_plain_F", "",150000, -1 },
            { "arifle_Mk20_GL_plain_F", "",180000, -1 },
            { "arifle_Mk20C_F", "",150000, -1 },
            { "arifle_Mk20_F", "",150000, -1 },
            { "arifle_Mk20_GL_F", "",180000, -1 },
            { "arifle_TRG20_F", "",150000, -1 },
            { "arifle_TRG21_F", "",150000, -1 },
            { "arifle_TRG21_GL_F", "",180000, -1 },
            { "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "NONE", "Zubehör",0, -1 },
            { "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "acc_flashlight", "",500, -1 },
            { "acc_pointer_IR", "",500, -1 },
            { "optic_Aco", "",5000, -1 },
            { "optic_ACO_grn", "",5000, -1 },
            { "optic_Holosight", "",7500, -1 },
            { "optic_MRCO", "",10000, -1 },
            { "optic_Hamr", "",10000, -1 },
            { "optic_Arco", "",10000, -1 },
            { "optic_DMS", "",15000, -1 },
            { "optic_AMS", "",17500, -1 },
            { "optic_AMS_snd", "",17500, -1 },
            { "optic_AMS_khk", "",17500, -1 },
            { "optic_KHS_blk", "",17500, -1 },
            { "optic_KHS_old", "",17500, -1 },
            { "optic_KHS_tan", "",17500, -1 },
            { "optic_KHS_hex", "",17500, -1 },
            { "optic_SOS", "",20000, -1 },
            { "muzzle_snds_H", "",50000, -1 },
            { "muzzle_snds_M", "",50000, -1 },
            { "bipod_01_F_blk", "",65000, -1 },
            { "bipod_01_F_snd", "",65000, -1 },
            { "bipod_01_F_mtp", "",65000, -1 },
            { "bipod_02_F_blk", "",65000, -1 },
            { "bipod_02_F_hex", "",65000, -1 },
            { "bipod_02_F_tan", "",65000, -1 },
            { "bipod_03_F_blk", "",65000, -1 },
            { "bipod_03_F_oli", "",65000, -1 },
            { "UGL_FlareWhite_F", "",500, -1 },
            { "UGL_FlareGreen_F", "",500, -1 },
            { "UGL_FlareRed_F", "",500, -1 },
            { "UGL_FlareYellow_F", "",500, -1 },
            { "UGL_FlareCIR_F", "",500, -1 },
            { "1Rnd_Smoke_Grenade_shell", "",500, -1 },
            { "1Rnd_SmokeRed_Grenade_shell", "",500, -1 },
            { "1Rnd_SmokeYellow_Grenade_shell", "",500, -1 },
            { "1Rnd_SmokePurple_Grenade_shell", "",500, -1 },
            { "1Rnd_SmokeBlue_Grenade_shell", "",500, -1 },
            { "1Rnd_SmokeOrange_Grenade_shell", "",500, -1 },
            { "1Rnd_SmokeGreen_Grenade_shell","Tränengas",15000, -1 },
            { "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "NONE", "Kleine Kaliber",0, -1 },
			{ "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "SMG_02_F", "",40000, -1 },
            { "SMG_01_F", "",40000, -1 },
            { "hgun_PDW2000_F", "",25000, -1 },
            { "hgun_Rook40_F", "",15000, -1 },
            { "hgun_Pistol_heavy_02_F", "",15000, -1 },
            { "hgun_Pistol_heavy_01_F", "",15000, -1 },
            { "hgun_ACPC2_F", "",15000, -1 },
            { "muzzle_snds_L", "",30000, -1 },
            { "muzzle_snds_acp", "",30000, -1 },
            { "optic_MRD", "",2500, -1 },
            { "optic_Yorris", "",2500, -1 },
            { "optic_Aco_smg", "",2500, -1 },
            { "optic_ACO_grn_smg", "",2500, -1 },
            { "optic_Holosight_smg", "",2500, -1 }
        };
        mags[] = {
            { "30Rnd_65x39_caseless_green", "",500, -1 },
            { "30Rnd_65x39_caseless_mag", "",500, -1 },
            { "30Rnd_556x45_Stanag", "",500, -1 },
            { "20Rnd_556x45_UW_mag", "",500, -1 },
            { "30Rnd_9x21_Mag", "",500, -1 },
            { "16Rnd_9x21_Mag", "",250, -1 },
            { "30Rnd_45ACP_Mag_SMG_01", "",500, -1 },
            { "11Rnd_45ACP_Mag", "",250, -1 },
            { "9Rnd_45ACP_Mag", "",250, -1 },
            { "6Rnd_45ACP_Cylinder", "",250, -1 }
        };
    };

    //Basic Shops
    class genstore {
        name = "STR_MAR_General_Store";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "Binocular", "",150, -1 },
			{ "ItemGPS", "",100, -1 },
			{ "ToolKit", "",3500, -1 },
			{ "FirstAidKit", "",150, -1 },
			{ "NVGoggles", "",1500, -1 },
			{ "NVGoggles_INDEP", "",1500, -1 },
			{ "NVGoggles_OPFOR", "",1500, -1 },
            { "Rangefinder", "",10000, -1 }
        };
        mags[] = {};
    };

    //Cop Shops
    class cop_basic {
        name = "STR_MAR_Cop_Item_Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 1, "Du musst Polizist sein!" };
        items[] = {
            { "ItemGPS", "",100, -1 },
            { "Binocular", "",100, -1 },
            { "Rangefinder", "",500, -1 },
            { "ToolKit", "",100, -1 },
            { "FirstAidKit", "",100, -1 },
            { "Medikit", "",1000, -1 },
            { "NVGoggles", "",10, -1 },
            { "NVGoggles_INDEP", "",10, -1 },
            { "NVGoggles_OPFOR", "",10, -1 },
            { "Chemlight_red", "",20, -1 },
            { "Chemlight_green", "",20, -1 },
            { "Chemlight_blue", "",20, -1 }
        };
        mags[] = {
        };
    };
	
    class cop_recruit {
        name = "STR_MAR_Cop_Weapon_Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 1, "Du musst Rekrut sein!" };
        items[] = {
            { "hgun_P07_snds_F","Taser Pistole",500, -1 },
            { "arifle_SDAR_F","Tazer Rifle",15000, -1 },
            { "SMG_02_F", "",5000, -1 },
            { "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "acc_flashlight", "",500, -1 },
            { "acc_pointer_IR", "",500, -1 },
            { "optic_Aco", "",1500, -1 },
            { "optic_ACO_grn", "",1500, -1 },
            { "optic_Holosight", "",2500, -1 },
            { "muzzle_snds_L", "",5000, -1 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag","Taser 16rnd",100, -1 },
            { "20Rnd_556x45_UW_mag","Tazer Munition",100, -1 },
            { "30Rnd_9x21_Mag", "",100, -1 }
        };
    };
	
    class cop_officer {
        name = "STR_MAR_Cop_Weapon_Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 2, "Du musst Officer sein!" };
        items[] = {
            { "hgun_P07_snds_F","Taser Pistole",500, -1 },
            { "arifle_SDAR_F","Tazer Rifle",15000, -1 },
            { "SMG_02_F", "",5000, -1 },
            { "arifle_TRG20_F", "",5000, -1 },
            { "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "acc_flashlight", "",500, -1 },
            { "acc_pointer_IR", "",500, -1 },
            { "optic_Aco", "",1500, -1 },
            { "optic_ACO_grn", "",1500, -1 },
            { "optic_Holosight", "",2500, -1 },
            { "optic_MRCO", "",5000, -1 },
            { "optic_Hamr", "",5000, -1 },
            { "optic_Arco", "",5000, -1 },
            { "optic_DMS", "",10000, -1 },
            { "muzzle_snds_M", "",10000, -1 },
            { "muzzle_snds_L", "",5000, -1 },
            { "bipod_01_F_blk", "",10000, -1 },
            { "bipod_01_F_snd", "",10000, -1 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag","Taser 16rnd",100, -1 },
            { "20Rnd_556x45_UW_mag","Tazer Munition",100, -1 },
            { "30Rnd_9x21_Mag", "",100, -1 },
            { "30Rnd_556x45_Stanag", "",100, -1 }
        };
    };
	
    class cop_detective {
        name = "STR_MAR_Cop_Weapon_Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 3, "Du musst Detective sein!" };
        items[] = {
            { "hgun_P07_snds_F","Taser Pistole",500, -1 },
            { "arifle_SDAR_F","Tazer Rifle",15000, -1 },
            { "SMG_02_F", "",5000, -1 },
            { "arifle_TRG20_F", "",5000, -1 },
            { "arifle_MX_Black_F", "",20000, -1 },
            { "arifle_MXC_Black_F", "",15000, -1 },
            { "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "acc_flashlight", "",500, -1 },
            { "acc_pointer_IR", "",500, -1 },
            { "optic_Aco", "",1500, -1 },
            { "optic_ACO_grn", "",1500, -1 },
            { "optic_Holosight", "",2500, -1 },
            { "optic_MRCO", "",5000, -1 },
            { "optic_Hamr", "",5000, -1 },
            { "optic_Arco", "",5000, -1 },
            { "optic_DMS", "",10000, -1 },
            { "optic_AMS", "",10000, -1 },
            { "optic_AMS_snd", "",12500, -1 },
            { "optic_AMS_khk", "",12500, -1 },
            { "optic_KHS_blk", "",12500, -1 },
            { "optic_KHS_old", "",12500, -1 },
            { "optic_KHS_tan", "",12500, -1 },
            { "optic_KHS_hex", "",12500, -1 },
            { "muzzle_snds_H", "",10000, -1 },
            { "muzzle_snds_M", "",10000, -1 },
            { "muzzle_snds_L", "",5000, -1 },
            { "bipod_01_F_blk", "",10000, -1 },
            { "bipod_01_F_snd", "",10000, -1 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag","Taser 16rnd",100, -1 },
            { "20Rnd_556x45_UW_mag","Tazer Munition",100, -1 },
            { "30Rnd_9x21_Mag", "",100, -1 },
            { "30Rnd_556x45_Stanag", "",100, -1 },
            { "30Rnd_65x39_caseless_mag", "",100, -1 }
        };
    };
	
    class cop_sergeant {
        name = "STR_MAR_Cop_Weapon_Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 4, "Du musst Sergeant sein!" };
        items[] = {
            { "hgun_P07_snds_F","Taser Pistole",500, -1 },
            { "arifle_SDAR_F","Tazer Rifle",15000, -1 },
            { "SMG_02_F", "",5000, -1 },
            { "arifle_TRG20_F", "",5000, -1 },
            { "arifle_MX_Black_F", "",20000, -1 },
            { "arifle_MXC_Black_F", "",15000, -1 },
            { "arifle_MX_GL_Black_F", "",30000, -1 },
            { "arifle_MXM_Black_F", "",35000, -1 },
            { "arifle_MX_SW_Black_F", "",60000, -1 },
            { "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "acc_flashlight", "",500, -1 },
            { "acc_pointer_IR", "",500, -1 },
            { "optic_Aco", "",1500, -1 },
            { "optic_ACO_grn", "",1500, -1 },
            { "optic_Holosight", "",2500, -1 },
            { "optic_MRCO", "",5000, -1 },
            { "optic_Hamr", "",5000, -1 },
            { "optic_Arco", "",5000, -1 },
            { "optic_DMS", "",10000, -1 },
            { "optic_AMS", "",10000, -1 },
            { "optic_AMS_snd", "",12500, -1 },
            { "optic_AMS_khk", "",12500, -1 },
            { "optic_KHS_blk", "",12500, -1 },
            { "optic_KHS_old", "",12500, -1 },
            { "optic_KHS_tan", "",12500, -1 },
            { "optic_KHS_hex", "",12500, -1 },
            { "optic_SOS", "",14000, -1 },
            { "optic_LRPS", "",15000, -1 },
            { "optic_NVS", "",17500, -1 },
            { "muzzle_snds_H", "",10000, -1 },
            { "muzzle_snds_M", "",10000, -1 },
            { "muzzle_snds_L", "",5000, -1 },
            { "bipod_01_F_blk", "",10000, -1 },
            { "bipod_01_F_snd", "",10000, -1 },
            { "HandGrenade_Stone","Blendgranate",5000, -1 },
            { "1Rnd_SmokeGreen_Grenade_shell","Tränengas",15000, -1 },
            { "SmokeShellGreen","Reizgas",5000, -1 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag","Taser 16rnd",100, -1 },
            { "20Rnd_556x45_UW_mag","Tazer Munition",100, -1 },
            { "30Rnd_9x21_Mag", "",100, -1 },
            { "30Rnd_556x45_Stanag", "",100, -1 },
            { "30Rnd_65x39_caseless_mag", "",100, -1 },
            { "100Rnd_65x39_caseless_mag", "",100, -1 }
        };
    };
	
    class cop_lieutenant {
        name = "STR_MAR_Cop_Weapon_Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 5, "Du musst Lieutenant sein!" };
        items[] = {
			{ "hgun_P07_snds_F","Taser Pistole",500, -1 },
            { "arifle_SDAR_F","Tazer Rifle",15000, -1 },
            { "SMG_02_F", "",5000, -1 },
            { "arifle_TRG20_F", "",5000, -1 },
            { "arifle_MX_Black_F", "",20000, -1 },
            { "arifle_MXC_Black_F", "",15000, -1 },
            { "arifle_MX_GL_Black_F", "",30000, -1 },
            { "arifle_MXM_Black_F", "",35000, -1 },
            { "arifle_MX_SW_Black_F", "",60000, -1 },
            { "srifle_EBR_F", "",50000, -1 },
            { "srifle_DMR_03_F", "",100000, -1 },
            { "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "acc_flashlight", "",500, -1 },
            { "acc_pointer_IR", "",500, -1 },
            { "optic_Aco", "",1500, -1 },
            { "optic_ACO_grn", "",1500, -1 },
            { "optic_Holosight", "",2500, -1 },
            { "optic_MRCO", "",5000, -1 },
            { "optic_Hamr", "",5000, -1 },
            { "optic_Arco", "",5000, -1 },
            { "optic_DMS", "",10000, -1 },
            { "optic_AMS", "",10000, -1 },
            { "optic_AMS_snd", "",12500, -1 },
            { "optic_AMS_khk", "",12500, -1 },
            { "optic_KHS_blk", "",12500, -1 },
            { "optic_KHS_old", "",12500, -1 },
            { "optic_KHS_tan", "",12500, -1 },
            { "optic_KHS_hex", "",12500, -1 },
            { "optic_SOS", "",14000, -1 },
            { "optic_LRPS", "",15000, -1 },
            { "optic_NVS", "",17500, -1 },
            { "muzzle_snds_B", "",10000, -1 },
            { "muzzle_snds_H", "",10000, -1 },
            { "muzzle_snds_M", "",10000, -1 },
            { "muzzle_snds_L", "",5000, -1 },
            { "bipod_01_F_blk", "",10000, -1 },
            { "bipod_01_F_snd", "",10000, -1 },
            { "HandGrenade_Stone","Blendgranate",5000, -1 },
            { "1Rnd_SmokeGreen_Grenade_shell","Tränengas",15000, -1 },
            { "SmokeShellGreen","Reizgas",5000, -1 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag","Taser 16rnd",100, -1 },
            { "20Rnd_556x45_UW_mag","Tazer Munition",100, -1 },
            { "30Rnd_9x21_Mag", "",100, -1 },
            { "30Rnd_556x45_Stanag", "",100, -1 },
            { "30Rnd_65x39_caseless_mag", "",100, -1 },
            { "100Rnd_65x39_caseless_mag", "",100, -1 },
            { "20Rnd_762x51_Mag", "",100, -1 }
        };
    };
	
    class cop_captain {
        name = "STR_MAR_Cop_Weapon_Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 6, "Du musst Captain sein!" };
        items[] = {
            { "hgun_P07_snds_F","Taser Pistole",500, -1 },
            { "arifle_SDAR_F","Tazer Rifle",15000, -1 },
            { "SMG_02_F", "",5000, -1 },
            { "arifle_TRG20_F", "",5000, -1 },
            { "arifle_MX_Black_F", "",20000, -1 },
            { "arifle_MXC_Black_F", "",15000, -1 },
            { "arifle_MX_GL_Black_F", "",30000, -1 },
            { "arifle_MXM_Black_F", "",35000, -1 },
            { "arifle_MX_SW_Black_F", "",60000, -1 },
            { "srifle_EBR_F", "",50000, -1 },
            { "srifle_DMR_03_F", "",100000, -1 },
            { "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "acc_flashlight", "",500, -1 },
            { "acc_pointer_IR", "",500, -1 },
            { "optic_Aco", "",1500, -1 },
            { "optic_ACO_grn", "",1500, -1 },
            { "optic_Holosight", "",2500, -1 },
            { "optic_MRCO", "",5000, -1 },
            { "optic_Hamr", "",5000, -1 },
            { "optic_Arco", "",5000, -1 },
            { "optic_DMS", "",10000, -1 },
            { "optic_AMS", "",10000, -1 },
            { "optic_AMS_snd", "",12500, -1 },
            { "optic_AMS_khk", "",12500, -1 },
            { "optic_KHS_blk", "",12500, -1 },
            { "optic_KHS_old", "",12500, -1 },
            { "optic_KHS_tan", "",12500, -1 },
            { "optic_KHS_hex", "",12500, -1 },
            { "optic_SOS", "",14000, -1 },
            { "optic_LRPS", "",15000, -1 },
            { "optic_NVS", "",17500, -1 },
            { "muzzle_snds_B", "",10000, -1 },
            { "muzzle_snds_H", "",10000, -1 },
            { "muzzle_snds_M", "",10000, -1 },
            { "muzzle_snds_L", "",5000, -1 },
            { "bipod_01_F_blk", "",10000, -1 },
            { "bipod_01_F_snd", "",10000, -1 },
            { "HandGrenade_Stone","Blendgranate",5000, -1 },
            { "1Rnd_SmokeGreen_Grenade_shell","Tränengas",15000, -1 },
            { "SmokeShellGreen","Reizgas",5000, -1 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag","Taser 16rnd",100, -1 },
            { "20Rnd_556x45_UW_mag","Tazer Munition",100, -1 },
            { "30Rnd_9x21_Mag", "",100, -1 },
            { "30Rnd_556x45_Stanag", "",100, -1 },
            { "30Rnd_65x39_caseless_mag", "",100, -1 },
            { "100Rnd_65x39_caseless_mag", "",100, -1 },
            { "20Rnd_762x51_Mag", "",100, -1 }
        };
    };
	
    class cop_major {
        name = "STR_MAR_Cop_Weapon_Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 7, "Du musst Major sein!" };
        items[] = {
            { "hgun_P07_snds_F","Taser Pistole",500, -1 },
            { "arifle_SDAR_F","Tazer Rifle",15000, -1 },
            { "SMG_02_F", "",5000, -1 },
            { "arifle_TRG20_F", "",5000, -1 },
            { "arifle_MX_Black_F", "",20000, -1 },
            { "arifle_MXC_Black_F", "",15000, -1 },
            { "arifle_MX_GL_Black_F", "",30000, -1 },
            { "arifle_MXM_Black_F", "",35000, -1 },
            { "arifle_MX_SW_Black_F", "",60000, -1 },
            { "srifle_EBR_F", "",50000, -1 },
            { "srifle_DMR_03_F", "",100000, -1 },
            { "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "acc_flashlight", "",500, -1 },
            { "acc_pointer_IR", "",500, -1 },
            { "optic_Aco", "",1500, -1 },
            { "optic_ACO_grn", "",1500, -1 },
            { "optic_Holosight", "",2500, -1 },
            { "optic_MRCO", "",5000, -1 },
            { "optic_Hamr", "",5000, -1 },
            { "optic_Arco", "",5000, -1 },
            { "optic_DMS", "",10000, -1 },
            { "optic_AMS", "",10000, -1 },
            { "optic_AMS_snd", "",12500, -1 },
            { "optic_AMS_khk", "",12500, -1 },
            { "optic_KHS_blk", "",12500, -1 },
            { "optic_KHS_old", "",12500, -1 },
            { "optic_KHS_tan", "",12500, -1 },
            { "optic_KHS_hex", "",12500, -1 },
            { "optic_SOS", "",14000, -1 },
            { "optic_LRPS", "",15000, -1 },
            { "optic_NVS", "",17500, -1 },
            { "muzzle_snds_B", "",10000, -1 },
            { "muzzle_snds_H", "",10000, -1 },
            { "muzzle_snds_M", "",10000, -1 },
            { "muzzle_snds_L", "",5000, -1 },
            { "bipod_01_F_blk", "",10000, -1 },
            { "bipod_01_F_snd", "",10000, -1 },
            { "HandGrenade_Stone","Blendgranate",5000, -1 },
            { "1Rnd_SmokeGreen_Grenade_shell","Tränengas",15000, -1 },
            { "SmokeShellGreen","Reizgas",5000, -1 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag","Taser 16rnd",100, -1 },
            { "20Rnd_556x45_UW_mag","Tazer Munition",100, -1 },
            { "30Rnd_9x21_Mag", "",100, -1 },
            { "30Rnd_556x45_Stanag", "",100, -1 },
            { "30Rnd_65x39_caseless_mag", "",100, -1 },
            { "100Rnd_65x39_caseless_mag", "",100, -1 },
            { "20Rnd_762x51_Mag", "",100, -1 }
        };
    };
	
    class cop_chief {
        name = "STR_MAR_Cop_Weapon_Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 8, "Du musst Chief sein!" };
        items[] = {
            { "hgun_P07_snds_F","Taser Pistole",500, -1 },
            { "arifle_SDAR_F","Tazer Rifle",15000, -1 },
            { "SMG_02_F", "",5000, -1 },
            { "arifle_TRG20_F", "",5000, -1 },
            { "arifle_MX_Black_F", "",20000, -1 },
            { "arifle_MXC_Black_F", "",15000, -1 },
            { "arifle_MX_GL_Black_F", "",30000, -1 },
            { "arifle_MXM_Black_F", "",35000, -1 },
            { "arifle_MX_SW_Black_F", "",60000, -1 },
            { "srifle_EBR_F", "",50000, -1 },
            { "srifle_DMR_03_F", "",100000, -1 },
            { "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "acc_flashlight", "",500, -1 },
            { "acc_pointer_IR", "",500, -1 },
            { "optic_Aco", "",1500, -1 },
            { "optic_ACO_grn", "",1500, -1 },
            { "optic_Holosight", "",2500, -1 },
            { "optic_MRCO", "",5000, -1 },
            { "optic_Hamr", "",5000, -1 },
            { "optic_Arco", "",5000, -1 },
            { "optic_DMS", "",10000, -1 },
            { "optic_AMS", "",10000, -1 },
            { "optic_AMS_snd", "",12500, -1 },
            { "optic_AMS_khk", "",12500, -1 },
            { "optic_KHS_blk", "",12500, -1 },
            { "optic_KHS_old", "",12500, -1 },
            { "optic_KHS_tan", "",12500, -1 },
            { "optic_KHS_hex", "",12500, -1 },
            { "optic_SOS", "",14000, -1 },
            { "optic_LRPS", "",15000, -1 },
            { "optic_NVS", "",17500, -1 },
            { "muzzle_snds_B", "",10000, -1 },
            { "muzzle_snds_H", "",10000, -1 },
            { "muzzle_snds_M", "",10000, -1 },
            { "muzzle_snds_L", "",5000, -1 },
            { "bipod_01_F_blk", "",10000, -1 },
            { "bipod_01_F_snd", "",10000, -1 },
            { "HandGrenade_Stone","Blendgranate",5000, -1 },
            { "1Rnd_SmokeGreen_Grenade_shell","Tränengas",15000, -1 },
            { "SmokeShellGreen","Reizgas",5000, -1 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag","Taser 16rnd",100, -1 },
            { "20Rnd_556x45_UW_mag","Tazer Munition",100, -1 },
            { "30Rnd_9x21_Mag", "",100, -1 },
            { "30Rnd_556x45_Stanag", "",100, -1 },
            { "30Rnd_65x39_caseless_mag", "",100, -1 },
            { "100Rnd_65x39_caseless_mag", "",100, -1 },
            { "20Rnd_762x51_Mag", "",100, -1 }
        };
    };
	
    class cop_sniper {
        name = "STR_MAR_Cop_Weapon_Shop";
        side = "cop";
        license = "";
        level[] = { "license_cop_sniper", "BOOL", true, "Du musst Polizei Sniper sein!" };
        items[] = {
			{ "srifle_LRR_F", "",250000, -1 },
            { "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "acc_flashlight", "",500, -1 },
            { "acc_pointer_IR", "",500, -1 },
            { "optic_Aco", "",1500, -1 },
            { "optic_ACO_grn", "",1500, -1 },
            { "optic_Holosight", "",2500, -1 },
            { "optic_MRCO", "",5000, -1 },
            { "optic_Hamr", "",5000, -1 },
            { "optic_Arco", "",5000, -1 },
            { "optic_DMS", "",10000, -1 },
            { "optic_AMS", "",10000, -1 },
            { "optic_AMS_snd", "",12500, -1 },
            { "optic_AMS_khk", "",12500, -1 },
            { "optic_KHS_blk", "",12500, -1 },
            { "optic_KHS_old", "",12500, -1 },
            { "optic_KHS_tan", "",12500, -1 },
            { "optic_KHS_hex", "",12500, -1 },
            { "optic_SOS", "",14000, -1 },
            { "optic_LRPS", "",15000, -1 },
            { "optic_NVS", "",17500, -1 },
            { "HandGrenade_Stone","Blendgranate",5000, -1 },
            { "SmokeShellGreen","Reizgas",5000, -1 }
        };
        mags[] = {
            { "7Rnd_408_Mag", "",500, -1 }
        };
    };
	
    class cop_dea {
        name = "STR_MAR_Cop_Weapon_Shop";
        side = "cop";
        license = "";
        level[] = { "license_cop_dea", "BOOL", true, "Du musst DEA Mitglied sein!" };
        items[] = {
			{ "hgun_P07_snds_F","Taser Pistole",500, -1 },
            { "arifle_SDAR_F","Tazer Rifle",15000, -1 },
            { "SMG_02_F", "",5000, -1 },
            { "arifle_TRG20_F", "",5000, -1 },
            { "arifle_MX_Black_F", "",20000, -1 },
            { "arifle_MXC_Black_F", "",15000, -1 },
            { "arifle_MX_GL_Black_F", "",30000, -1 },
            { "arifle_MXM_Black_F", "",35000, -1 },
            { "srifle_EBR_F", "",50000, -1 },
            { "srifle_DMR_06_camo_F", "",75000, -1 },
            { "srifle_DMR_06_olive_F", "",75000, -1 },
            { "srifle_DMR_03_F", "",100000, -1 },
            { "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "acc_flashlight", "",500, -1 },
            { "acc_pointer_IR", "",500, -1 },
            { "optic_Aco", "",1500, -1 },
            { "optic_ACO_grn", "",1500, -1 },
            { "optic_Holosight", "",2500, -1 },
            { "optic_MRCO", "",5000, -1 },
            { "optic_Hamr", "",5000, -1 },
            { "optic_Arco", "",5000, -1 },
            { "optic_DMS", "",10000, -1 },
            { "optic_AMS", "",10000, -1 },
            { "optic_AMS_snd", "",12500, -1 },
            { "optic_AMS_khk", "",12500, -1 },
            { "optic_KHS_blk", "",12500, -1 },
            { "optic_KHS_old", "",12500, -1 },
            { "optic_KHS_tan", "",12500, -1 },
            { "optic_KHS_hex", "",12500, -1 },
            { "optic_SOS", "",14000, -1 },
            { "optic_LRPS", "",15000, -1 },
            { "optic_NVS", "",17500, -1 },
            { "muzzle_snds_B", "",10000, -1 },
            { "muzzle_snds_H", "",10000, -1 },
            { "muzzle_snds_M", "",10000, -1 },
            { "muzzle_snds_L", "",5000, -1 },
            { "bipod_01_F_blk", "",10000, -1 },
            { "bipod_01_F_snd", "",10000, -1 },
            { "HandGrenade_Stone","Blendgranate",5000, -1 },
            { "1Rnd_SmokeGreen_Grenade_shell","Tränengas",15000, -1 },
            { "SmokeShellGreen","Reizgas",5000, -1 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag","Taser 16rnd",100, -1 },
            { "20Rnd_556x45_UW_mag","Tazer Munition",100, -1 },
            { "30Rnd_9x21_Mag", "",100, -1 },
            { "30Rnd_556x45_Stanag", "",100, -1 },
            { "30Rnd_65x39_caseless_mag", "",100, -1 },
            { "100Rnd_65x39_caseless_mag", "",100, -1 },
            { "20Rnd_762x51_Mag", "",100, -1 }
        };
    };
	
    class cop_fahnder {
        name = "STR_MAR_Cop_Weapon_Shop";
        side = "cop";
        license = "";
        level[] = { "license_cop_civ", "BOOL", true, "Du musst Zivilfahnder sein!" };
        items[] = {
			{ "hgun_P07_snds_F","Taser Pistole",500, -1 },
            { "arifle_SDAR_F","Tazer Rifle",15000, -1 },
            { "arifle_MXC_F", "",15000, -1 },
            { "arifle_MX_F", "",20000, -1 },
            { "arifle_MX_GL_F", "",30000, -1 },
            { "arifle_MXM_F", "",35000, -1 },
            { "srifle_DMR_06_camo_F", "",75000, -1 },
            { "srifle_DMR_06_olive_F", "",75000, -1 },
            { "NONE", "---------------------------------------------------------------------------",0, -1 },
            { "acc_flashlight", "",500, -1 },
            { "acc_pointer_IR", "",500, -1 },
            { "optic_Aco", "",1500, -1 },
            { "optic_ACO_grn", "",1500, -1 },
            { "optic_Holosight", "",2500, -1 },
            { "optic_MRCO", "",5000, -1 },
            { "optic_Hamr", "",5000, -1 },
            { "optic_Arco", "",5000, -1 },
            { "optic_DMS", "",10000, -1 },
            { "optic_AMS", "",10000, -1 },
            { "optic_AMS_snd", "",12500, -1 },
            { "optic_AMS_khk", "",12500, -1 },
            { "optic_KHS_blk", "",12500, -1 },
            { "optic_KHS_old", "",12500, -1 },
            { "optic_KHS_tan", "",12500, -1 },
            { "optic_KHS_hex", "",12500, -1 },
            { "optic_SOS", "",14000, -1 },
            { "optic_LRPS", "",15000, -1 },
            { "optic_NVS", "",17500, -1 },
            { "muzzle_snds_B", "",10000, -1 },
            { "muzzle_snds_H", "",10000, -1 },
            { "muzzle_snds_M", "",10000, -1 },
            { "muzzle_snds_L", "",5000, -1 },
            { "bipod_01_F_blk", "",10000, -1 },
            { "bipod_01_F_snd", "",10000, -1 },
            { "HandGrenade_Stone","Blendgranate",5000, -1 },
            { "1Rnd_SmokeGreen_Grenade_shell","Tränengas",15000, -1 },
            { "SmokeShellGreen","Reizgas",5000, -1 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag","Taser 16rnd",100, -1 },
            { "30Rnd_9x21_Mag","Taser 30rnd",100, -1 },
            { "20Rnd_556x45_UW_mag","Tazer Munition",100, -1 },
            { "30Rnd_65x39_caseless_mag", "",100, -1 },
            { "20Rnd_762x51_Mag", "",100, -1 }
        };
    };
};