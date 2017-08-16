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
        name = "Waffenladen";
        side = "civ";
        license = "gun";
        level[] = { "", "", -1, "" };
        items[] = {
            { "hgun_Rook40_F", "", 6000, { "", "", -1 } },
            { "hgun_Pistol_01_F", "", 5000, { "", "", -1 } },
            { "arifle_SDAR_F", "Unterwasser-Rifle", 15000, { "", "", -1 } },
			{ "hgun_Pistol_heavy_01_F", "", 7500, { "", "", -1 } },
            { "hgun_ACPC2_F", "", 7000, { "", "", -1 } },
            { "hgun_PDW2000_F", "", 25000, { "", "", -1 } }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 250, { "", "", -1 } },
            { "10Rnd_9x21_Mag", "", 250, { "", "", -1 } },
			{ "11Rnd_45ACP_Mag", "", 250, { "", "", -1 } },
            { "9Rnd_45ACP_Mag", "", 250, { "", "", -1 } },
            { "20Rnd_556x45_UW_mag", "", 250, { "", "", -1 } },
            { "6Rnd_45ACP_Cylinder", "", 250, { "", "", -1 } },
            { "30Rnd_9x21_Mag", "30 Schuss 9mm", 250, { "", "", -1 } }
        };
        accs[] = {
            { "optic_ACO_grn_smg", "ACO grün", 1000, { "", "", -1 } },
			{ "optic_Aco", "ACO rot", 1000, { "", "", -1 } }
        };
    };

    class rebellen {
        name = "Rebellen-Waffenhändler";
        side = "civ";
        license = "rebel";
        level[] = { "", "", -1, "" };
        items[] = {
			{ "Binocular", "", 150, -1, { "", "", -1 } },
			{ "Rangefinder", "", 2000, -1, { "", "", -1 } },
            { "ItemGPS", "", 100, 45, { "", "", -1 } },
			{ "ItemMap", "", 100, 45, { "", "", -1 } },
			{ "ItemCompass", "", 100, 45, { "", "", -1 } },
            { "FirstAidKit", "", 150, 65, { "", "", -1 } },
            { "NVGoggles", "", 5000, 980, { "", "", -1 } },
            { "hgun_Pistol_heavy_02_F", "", 10000, { "", "", -1 } },
            { "SMG_01_F", "", 40000, { "", "", -1 } },	
			{ "arifle_AKS_F", "", 55000, { "", "", -1 } },	
            { "arifle_TRG21_F", "", 80000, { "", "", -1 } },

			{ "arifle_Mk20C_plain_F", "", 100000, { "", "", -1 } },	

			{ "arifle_Mk20_plain_F", "", 130000, { "", "", -1 } },
			{ "arifle_SPAR_01_khk_F", "", 225000, { "", "", -1 } },
            { "arifle_CTAR_hex_F", "", 250000, { "", "", -1 } },			
			{ "arifle_AKM_F", "", 450000, { "", "", -1 } },
			{ "arifle_Katiba_F", "", 300000, { "", "", -1 } },
			{ "arifle_Katiba_C_F", "", 275000, { "", "", -1 } },
        };
        mags[] = {
            { "11Rnd_45ACP_Mag", "", 300, { "", "", -1 } },
			{ "30Rnd_45ACP_Mag_SMG_01", "", 1000, { "", "", -1 } },
			{ "30Rnd_545x39_Mag_F", "", 1000, { "", "", -1 } },
            { "30Rnd_556x45_Stanag", "", 1000, { "", "", -1 } },
            { "30Rnd_65x39_caseless_green", "", 2000, { "", "", -1 } },
            { "30Rnd_65x39_caseless_mag", "", 1000, { "", "", -1 } },
            { "20Rnd_762x51_Mag", "", 1000, { "", "", -1 } },
            { "30Rnd_580x42_Mag_F", "", 1000, { "", "", -1 } },
            { "30Rnd_762x39_Mag_F", "", 5000, { "", "", -1 } }
        };
        accs[] = {
            { "muzzle_snds_acp", "", 1000, { "", "", -1 } },
            { "optic_ACO_grn_smg", "", 1000, { "", "", -1 } },
            { "optic_Holosight_khk_F", "", 15000, { "", "", -1 } },
			{ "acc_flashlight", "", 5000, { "", "", -1 } },
			{ "acc_pointer_IR", "", 5000, { "", "", -1 } },
			{ "optic_Arco_ghex_F", "", 20000, { "", "", -1 } },
			{ "optic_Hamr_khk_F", "", 20000, { "", "", -1 } },
			{ "optic_MRCO", "", 20000, { "", "", -1 } },
			{ "optic_NVS", "", 15000, { "", "", -1 } },			
            { "optic_DMS_ghex_F", "", 30000, { "", "", -1 } },
			{ "optic_KHS_hex", "", 35000, { "", "", -1 } }
        };
    };
	
	class pvpzone {
        name = "Waffenhändler";
        side = "civ";
        license = "pvp";
        level[] = { "", "", -1, "" };
        items[] = {
			{ "srifle_DMR_01_F", "", 800000, { "", "", -1 } },
			{ "srifle_DMR_07_ghex_F", "", 800000, { "", "", -1 } },	
			{ "srifle_DMR_06_camo_F", "", 600000, { "", "", -1 } },
			{ "srifle_DMR_03_woodland_F", "", 1300000, { "", "", -1 } },
			{ "arifle_AK12_F", "", 600000, { "", "", -1 } },
			{ "srifle_DMR_02_camo_F", "", 1300000, { "", "", -1 } },
			{ "srifle_DMR_05_hex_F", "", 1300000, { "", "", -1 } },
			{ "srifle_LRR_tna_F", "", 1500000, { "", "", -1 } },
			{ "srifle_GM6_ghex_F", "", 1500000, { "", "", -1 } },
			{ "arifle_ARX_ghex_F", "", 1700000, { "", "", -1 } }
		};
        mags[] = {
            { "30Rnd_65x39_caseless_green", "", 2000, { "", "", -1 } },
            { "30Rnd_65x39_caseless_mag", "", 2000, { "", "", -1 } },
            { "20Rnd_650x39_Cased_Mag_F", "", 2000, { "", "", -1 } },
            { "10Rnd_762x54_Mag", "", 5000, { "", "", -1 } },
            { "20Rnd_762x51_Mag", "", 6000, { "", "", -1 } },
            { "30Rnd_762x39_Mag_F", "", 8000, { "", "", -1 } },
            { "10Rnd_338_Mag", "", 14500, { "", "", -1 } },
			{ "10Rnd_50BW_Mag_F", "", 14500, { "", "", -1 } },
			{ "10Rnd_93x64_DMR_05_Mag", "", 15500, { "", "", -1 } },
            { "7Rnd_408_Mag", "", 20500, { "", "", -1 } },
			{ "5Rnd_127x108_Mag", "", 25000, { "", "", -1 } }
        };
        accs[] = {
            { "optic_ACO_grn_smg", "", 2500, { "", "", -1 } },
            { "optic_Holosight_khk_F", "", 15000, { "", "", -1 } },
			{ "optic_ERCO_khk_F", "", 20000, { "", "", -1 } },	
			{ "optic_Arco_ghex_F", "", 20000, { "", "", -1 } },
			{ "optic_Hamr_khk_F", "", 20000, { "", "", -1 } },
			{ "optic_MRCO", "", 20000, { "", "", -1 } },
			{ "optic_NVS", "", 15000, { "", "", -1 } },			
            { "optic_DMS_ghex_F", "", 30000, { "", "", -1 } },
			{ "optic_KHS_hex", "", 35000, { "", "", -1 } },
			{ "optic_SOS_khk_F", "", 35000, { "", "", -1 } },
            { "optic_LRPS_ghex_F", "", 35000, { "", "", -1 } },
			{ "optic_AMS_khk", "", 40000, { "", "", -1 } },	
			{ "bipod_02_F_tan", "", 10000, { "", "", -1 } },
			{ "bipod_02_F_hex", "", 10000, { "", "", -1 } },
			{ "bipod_01_F_mtp", "", 10000, { "", "", -1 } },	
			{ "optic_tws_mg", "", 557000, { "", "", -1 } }
        };
    };

    class gang {
        name = "Hideout Armament";
        side = "civ";
        license = "gun";
        level[] = { "", "", -1, "" };
        items[] = {
            { "hgun_Rook40_F", "", 6000, 500 },
            { "hgun_Pistol_heavy_02_F", "", 5000, -1 },
            { "hgun_ACPC2_F", "", 5500, -1 },
            { "hgun_PDW2000_F", "", 25000, -1 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 25 },
            { "6Rnd_45ACP_Cylinder", "", 50 },
            { "9Rnd_45ACP_Mag", "", 45 },
            { "30Rnd_9x21_Mag", "", 75 }
        };
        accs[] = {
            { "optic_ACO_grn_smg", "", 950 }
        };
    };

    //Basic Shops
    class genstore {
        name = "Altis General Store";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "Binocular", "", 1000, -1 },
            { "ItemGPS", "", 2000, 45 },
            { "ItemMap", "", 250, 35 },
            { "ItemCompass", "", 250, 25 },
            { "ItemWatch", "", 250, -1 },
            { "FirstAidKit", "", 2000, 65 },
            { "NVGoggles", "", 5000, 980 }
        };
        mags[] = {};
        accs[] = {};
    };

    class f_station_store {
        name = "Altis Fuel Station Store";
        side = "";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "Binocular", "", 1500, -1 },
            { "ItemGPS", "", 2500, 45 },
            { "ItemMap", "", 350, 35 },
            { "ItemCompass", "", 350, 25 },
            { "ItemWatch", "", 350, -1 },
            { "FirstAidKit", "", 2750, 65 },
            { "NVGoggles", "", 10000, 980 },
            { "Chemlight_red", "", 1500, -1 },
            { "Chemlight_yellow", "", 1500, 50 },
            { "Chemlight_green", "", 1500, 50 },
            { "Chemlight_blue", "", 1500, 50 },
			{ "SmokeShell", "Smoke White", 3000, -1, { "", "", -1 } }
        };
        mags[] = {};
        accs[] = {};
    };

    //Cop Shops
    class cop_basic {
        name = "Polizei Shop";
        side = "cop";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
			{ "Binocular", "Binocular", 750, -1, { "", "", -1 } },
			{ "Rangefinder", "Rangefinder", 1500, -1, { "", "", -1 } },
			{ "NVGoggles_OPFOR", "NV Black", 7500, -1, { "", "", -1 } },
			{ "NVGoggles_INDEP", "NV Green", 7500, -1, { "", "", -1 } },
			{ "NVGoggles", "NV Brown", 7500, -1, { "", "", -1 } },
            { "ItemGPS", "GPS", 200, 45, { "", "", -1 } },
			{ "ItemMap", "Map", 200, 45, { "", "", -1 } },
			{ "ItemCompass", "Compass", 50, 45, { "", "", -1 } },
            { "FirstAidKit", "First Aid Kit", 750, 65, { "", "", -1 } },

            { "hgun_P07_snds_F", "Taser-Pistole", 1000, 650, { "", "", -1 } },
			{ "hgun_Pistol_heavy_01_F", "4-five .45 ACP", 2000, 650, { "life_coplevel", "SCALAR", 2 } },
			{ "hgun_Rook40_F", "Rook-40 9 mm", 1500, 650, { "", "", -1 } },
			{ "SMG_05_F", "Protector 9 mm", 12000, 650, { "life_coplevel", "SCALAR", 2 } },
			{ "SMG_02_F", "Sting 9 mm", 10000, 650, { "life_coplevel", "SCALAR", 2 } },
			{ "arifle_TRG21_F", "TRG-21 5.56 mm", 20000, 650, { "life_coplevel", "SCALAR", 3 } },
			{ "arifle_Mk20_F", "Mk20 5.56 mm", 20000, 650, { "life_coplevel", "SCALAR", 3 } },
			{ "arifle_MXC_Black_F", "MXC 6.5 mm Black", 50000, 650, { "life_coplevel", "SCALAR", 4 } },
			{ "arifle_SDAR_F", "SDAR Underwater Gun", 10000, 650, { "life_coplevel", "SCALAR", 4 } },
			{ "arifle_MX_Black_F", "MX 6.5 mm Black", 75000, 650, { "life_coplevel", "SCALAR", 5 } },
			{ "arifle_SPAR_01_blk_F", "SPAR-16 5.56 mm Black", 70000, 650, { "life_coplevel", "SCALAR", 5 } },
			{ "arifle_MXM_Black_F", "MXM 6.5 mm Black", 100000, 650, { "life_coplevel", "SCALAR", 6 } },
			{ "arifle_AK12_F", "AK-12 7.62 mm", 100000, 650, { "life_coplevel", "SCALAR", 7 } },
			{ "srifle_EBR_F", "	Mk18 ABR 7.62 mm", 250000, 650, { "life_coplevel", "SCALAR", 6 } },
			{ "srifle_DMR_05_blk_F", "Cyrus 9.3 mm Black", 300000, 650, { "life_coplevel", "SCALAR", 7 } },
			{ "srifle_DMR_03_F", "Mk-I EMR 7.62 mm Black", 300000, 650, { "life_coplevel", "SCALAR", 8 } },
			{ "SmokeShell", "Smoke White", 500, -1, { "", "", -1 } },
			{ "SmokeShellRed", "Smoke Red", 500, -1, { "", "", -1 } },
			{ "SmokeShellGreen", "Smoke Green", 500, -1, { "", "", -1 } },
			{ "Chemlight_red", "Chemlight Red", 150, -1, { "", "", -1 } },
			{ "Chemlight_green", "Chemlight Green", 150, -1, { "", "", -1 } }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 25, 100, { "", "", -1 } },
			{ "30Rnd_9x21_Mag_SMG_02", "", 25, 100, { "", "", -1 } },
			{ "30Rnd_556x45_Stanag", "", 25, 100, { "", "", -1 } },
			{ "10Rnd_762x54_Mag", "", 25, 100, { "", "", -1 } },
			{ "30Rnd_65x39_caseless_mag", "", 25, 100, { "", "", -1 } },
			{ "100Rnd_65x39_caseless_mag_Tracer", "", 25, 100, { "", "", -1 } },
			{ "20Rnd_762x51_Mag", "", 25, 100, { "", "", -1 } },
			{ "7Rnd_408_Mag", "", 25, 100, { "", "", -1 } },
			{ "5Rnd_127x108_Mag", "", 25, 100, { "", "", -1 } },
			{ "30Rnd_65x39_caseless_green", "", 25, 100, { "", "", -1 } },
			{ "200Rnd_65x39_cased_Box", "", 25, 100, { "", "", -1 } },
			{ "30Rnd_9x21_Mag", "", 25, 100, { "", "", -1 } },
			{ "30Rnd_45ACP_Mag_SMG_01", "", 25, 100, { "", "", -1 } },
			{ "10Rnd_338_Mag", "", 25, 100, { "", "", -1 } },
			{ "10Rnd_127x54_Mag", "", 25, 100, { "", "", -1 } },
			{ "10Rnd_93x64_DMR_05_Mag", "", 25, 100, { "", "", -1 } },
			{ "150Rnd_93x64_Mag", "", 25, 100, { "", "", -1 } },
			{ "30Rnd_762x39_Mag_F", "", 25, 100, { "", "", -1 } },
			{ "150Rnd_556x45_Drum_Mag_F", "", 25, 100, { "", "", -1 } },
			{ "11Rnd_45ACP_Mag", "", 25, 100, { "", "", -1 } }
			
        };
        accs[] = {
            { "muzzle_snds_L", "Schalldämpfer 9 mm", 2500, 100, { "life_coplevel", "SCALAR", 6 } },
			{ "muzzle_snds_M", "Schalldämpfer 5.56 mm", 2500, 100, { "life_coplevel", "SCALAR", 6 } },
			{ "muzzle_snds_H", "Schalldämpfer 6.5 mm", 2500, 100, { "life_coplevel", "SCALAR", 6 } },
			{ "muzzle_snds_B", "Schalldämpfer 7.62 mm", 2500, 100, { "life_coplevel", "SCALAR", 6 } },
			{ "optic_Aco", "ACO Red", 100, 100, { "", "", -1 } },
			{ "optic_ACO_grn", "ACO Green", 100, 100, { "", "", -1 } },
			{ "optic_Aco_smg", "ACO SMG Red", 100, 100, { "", "", -1 } },
			{ "optic_ACO_grn_smg", "ACO SMG Green", 100, 100, { "", "", -1 } },
			{ "optic_Hamr", "RCO", 250, 100, { "", "", -1 } },
			{ "optic_MRCO", "MRCO", 250, 100, { "", "", -1 } },
			{ "optic_ERCO_blk_F", "ERCO Black", 250, 100, { "", "", -1 } },
			{ "optic_Arco_blk_F", "ARCO Black", 250, 100, { "", "", -1 } },
			{ "optic_AMS", "AMS", 500, 100, { "", "", -1 } },
			{ "optic_DMS", "DMS", 750, 100, { "", "", -1 } },
			{ "acc_flashlight", "Flashlight", 100, 100, { "", "", -1 } },
			{ "acc_pointer_IR", "IR Laser Pointer", 500, 100, { "", "", -1 } },
			{ "optic_SOS", "MOS", 750, 100, { "", "", -1 } },
			{ "optic_LRPS", "LRPS", 1000, 100, { "", "", -1 } },
			{ "optic_Holosight", "Holosight", 150, 100, { "", "", -1 } },
			{ "optic_Holosight_smg", "Holosight SMG", 300, 100, { "", "", -1 } },
			{ "bipod_01_F_blk", "Bipod Black", 500, 100, { "", "", -1 } },
			{ "	bipod_02_F_hex", "Bipod Hex", 500, 100, { "", "", -1 } },
			{ "optic_MRD", "MRD", 100, 100, { "", "", -1 } },
			{ "optic_Arco", "ARCO", 250, 100, { "", "", -1 } }
        };
	};
	class cop_swat {
	name = "SWAT Shop";
	side = "cop";
	license = "swat";
	level[] = { "", "", -1, "" };
	items[] = {
		{ "Binocular", "Binocular", 750, -1, { "", "", -1 } },
		{ "Rangefinder", "Rangefinder", 1500, -1, { "", "", -1 } },
		{ "NVGoggles_OPFOR", "NV Black", 7500, -1, { "", "", -1 } },
		{ "NVGoggles_INDEP", "NV Green", 7500, -1, { "", "", -1 } },
		{ "NVGoggles", "NV Brown", 7500, -1, { "", "", -1 } },
		{ "ItemGPS", "GPS", 200, 45, { "", "", -1 } },
		{ "ItemMap", "Map", 200, 45, { "", "", -1 } },
		{ "ItemCompass", "Compass", 50, 45, { "", "", -1 } },
		{ "Medikit", "Medikit", 1000, 45, { "", "", -1 } },
		{ "FirstAidKit", "First Aid Kit", 750, 65, { "", "", -1 } },
		{ "HandGrenade_Stone", "Blendgranate", 2000, -1, { "", "", -1 } },
		{ "hgun_P07_snds_F", "Taser-Pistole", 1000, 650, { "", "", -1 } },
		{ "hgun_Pistol_heavy_01_F", "4-five .45 ACP", 2000, 650, { "", "", -1 } },
		{ "hgun_Rook40_F", "Rook-40 9 mm", 1500, 650, { "", "", -1 } },
		{ "SMG_05_F", "Protector 9 mm", 12000, 650, { "", "", -1 } },
		{ "SMG_02_F", "Sting 9 mm", 10000, 650, { "", "", -1 } },
		{ "arifle_TRG21_F", "TRG-21 5.56 mm", 20000, 650, { "", "", -1 } },
		{ "arifle_Mk20_F", "Mk20 5.56 mm", 20000, 650, { "", "", -1 } },
		{ "arifle_MXC_Black_F", "MXC 6.5 mm Black", 50000, 650, { "", "", -1 } },
		{ "arifle_SDAR_F", "SDAR Underwater Gun", 10000, 650, { "", "", -1 } },
		{ "arifle_MX_Black_F", "MX 6.5 mm Black", 75000, 650, { "", "", -1 } },
		{ "arifle_SPAR_01_blk_F", "SPAR-16 5.56 mm Black", 70000, 650, { "", "", -1 } },
		{ "arifle_MXM_Black_F", "MXM 6.5 mm Black", 100000, 650, { "", "", -1 } },
		{ "arifle_AK12_F", "AK-12 7.62 mm", 100000, 650, { "", "", -1 } },
		{ "srifle_EBR_F", "	Mk18 ABR 7.62 mm", 250000, 650, { "", "", -1 } },
		{ "srifle_DMR_05_blk_F", "Cyrus 9.3 mm Black", 300000, 650, { "", "", -1 } },
		{ "srifle_DMR_03_F", "Mk-I EMR 7.62 mm Black", 300000, 650, { "", "", -1 } },
		{ "SmokeShell", "Smoke White", 500, -1, { "", "", -1 } },
		{ "SmokeShellRed", "Smoke Red", 500, -1, { "", "", -1 } },
		{ "SmokeShellGreen", "Smoke Green", 500, -1, { "", "", -1 } },
		{ "Chemlight_red", "Chemlight Red", 150, -1, { "", "", -1 } },
		{ "Chemlight_green", "Chemlight Green", 150, -1, { "", "", -1 } }
	};
	mags[] = {
		{ "16Rnd_9x21_Mag", "", 25, 100, { "", "", -1 } },
		{ "30Rnd_9x21_Mag_SMG_02", "", 25, 100, { "", "", -1 } },
		{ "30Rnd_556x45_Stanag", "", 25, 100, { "", "", -1 } },
		{ "10Rnd_762x54_Mag", "", 25, 100, { "", "", -1 } },
		{ "30Rnd_65x39_caseless_mag", "", 25, 100, { "", "", -1 } },
		{ "100Rnd_65x39_caseless_mag_Tracer", "", 25, 100, { "", "", -1 } },
		{ "20Rnd_762x51_Mag", "", 25, 100, { "", "", -1 } },
		{ "7Rnd_408_Mag", "", 25, 100, { "", "", -1 } },
		{ "5Rnd_127x108_Mag", "", 25, 100, { "", "", -1 } },
		{ "30Rnd_65x39_caseless_green", "", 25, 100, { "", "", -1 } },
		{ "200Rnd_65x39_cased_Box", "", 25, 100, { "", "", -1 } },
		{ "30Rnd_9x21_Mag", "", 25, 100, { "", "", -1 } },
		{ "30Rnd_45ACP_Mag_SMG_01", "", 25, 100, { "", "", -1 } },
		{ "10Rnd_338_Mag", "", 25, 100, { "", "", -1 } },
		{ "10Rnd_127x54_Mag", "", 25, 100, { "", "", -1 } },
		{ "10Rnd_93x64_DMR_05_Mag", "", 25, 100, { "", "", -1 } },
		{ "150Rnd_93x64_Mag", "", 25, 100, { "", "", -1 } },
		{ "30Rnd_762x39_Mag_F", "", 25, 100, { "", "", -1 } },
		{ "150Rnd_556x45_Drum_Mag_F", "", 25, 100, { "", "", -1 } },
		{ "11Rnd_45ACP_Mag", "", 25, 100, { "", "", -1 } }
		
	};
	accs[] = {
		{ "muzzle_snds_L", "Schalldämpfer 9 mm", 2500, 100, { "", "", -1 } },
		{ "muzzle_snds_M", "Schalldämpfer 5.56 mm", 2500, 100, { "", "", -1 } },
		{ "muzzle_snds_H", "Schalldämpfer 6.5 mm", 2500, 100, { "", "", -1 } },
		{ "muzzle_snds_B", "Schalldämpfer 7.62 mm", 2500, 100, { "", "", -1 } },
		{ "optic_Aco", "ACO Red", 100, 100, { "", "", -1 } },
		{ "optic_ACO_grn", "ACO Green", 100, 100, { "", "", -1 } },
		{ "optic_Aco_smg", "ACO SMG Red", 100, 100, { "", "", -1 } },
		{ "optic_ACO_grn_smg", "ACO SMG Green", 100, 100, { "", "", -1 } },
		{ "optic_Hamr", "RCO", 250, 100, { "", "", -1 } },
		{ "optic_MRCO", "MRCO", 250, 100, { "", "", -1 } },
		{ "optic_ERCO_blk_F", "ERCO Black", 250, 100, { "", "", -1 } },
		{ "optic_Arco_blk_F", "ARCO Black", 250, 100, { "", "", -1 } },
		{ "optic_AMS", "AMS", 500, 100, { "", "", -1 } },
		{ "optic_DMS", "DMS", 750, 100, { "", "", -1 } },
		{ "acc_flashlight", "Flashlight", 100, 100, { "", "", -1 } },
		{ "acc_pointer_IR", "IR Laser Pointer", 500, 100, { "", "", -1 } },
		{ "optic_SOS", "MOS", 750, 100, { "", "", -1 } },
		{ "optic_LRPS", "LRPS", 1000, 100, { "", "", -1 } },
		{ "optic_Holosight", "Holosight", 150, 100, { "", "", -1 } },
		{ "optic_Holosight_smg", "Holosight SMG", 300, 100, { "", "", -1 } },
		{ "bipod_01_F_blk", "Bipod Black", 500, 100, { "", "", -1 } },
		{ "	bipod_02_F_hex", "Bipod Hex", 500, 100, { "", "", -1 } },
		{ "optic_MRD", "MRD", 100, 100, { "", "", -1 } },
		{ "optic_Arco", "ARCO", 250, 100, { "", "", -1 } }
	};
};

    //Medic Shops
    class med_basic {
        name = "store";
        side = "med";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "ItemGPS", "", 200, 45 },
            { "Binocular", "", 700, -1 },
            { "FirstAidKit", "", 500, 65 },
            { "NVGoggles", "", 7500, 980 }
        };
        mags[] = {};
        accs[] = {};
    };
};