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
            { "hgun_Rook40_F", "", 10000, 2500 },
            { "hgun_Pistol_heavy_02_F", "", 12500, -1 },
            { "hgun_ACPC2_F", "", 15500, -1 },
            { "hgun_PDW2000_F", "", 20000, -1 },
			{ "hgun_Pistol_heavy_01_F", "", 17500, 500 },
			{ "SMG_01_F", "", 40000, 500 },
			{ "hgun_PDW2000_Holo_snds_F", "", 44000, 500 },
			{ "arifle_SDAR_F", "", 50000, 500 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", 300, 200 },
            { "6Rnd_45ACP_Cylinder", 150, 125 },
            { "9Rnd_45ACP_Mag", 180, 150 },
            { "30Rnd_9x21_Mag", 150, 100 },
			{ "11Rnd_45ACP_Mag", 200, 175 },
			{ "30Rnd_45ACP_Mag_SMG_01", 350, 300 },
			{ "20Rnd_556x45_UW_mag", 2800, 1500 }
			
        };
        accs[] = {
            {"optic_Yorris","",2500},
			{"optic_ACO_grn_smg","",2500},
			{"optic_Holosight_smg","",3500},
			{"optic_Aco","",10000},
			{"optic_Holosight","",12000}
        };
    };

    class rebel {
        name = "Mohammed's Jihadi Shop";
        side = "civ";
        license = "rebel";
        level[] = { "", "", -1, "" };
        items[] = {
            { "hgun_Pistol_heavy_01_F", "", 6000, 1500 },
			{ "hgun_Rook40_F", "", 6500, 1500 },
            { "hgun_Pistol_heavy_02_F", "", 9000, 1500 },
            { "hgun_ACPC2_F", "", 9500, 2000 },
            { "arifle_TRG20_F", "", 150000, 4500 },
			{ "arifle_TRG21_F", "", 150000, 4500 },
            { "arifle_SDAR_F", "", 45000, 3000 },
            { "arifle_MXM_F", "", 750000, 6500 },
            { "arifle_MXC_F", "", 450000, 6000 },
            { "arifle_Katiba_F", "", 200000, 5000 },
            { "arifle_Katiba_C_F", "", 220000, 5000 },
			{ "muzzle_snds_H", "", 60000, 300 },
            { "SMG_01_F", "", 35000, 6500 },
            { "arifle_MX_Black_F", "", 65000, 6400 }
			
        };
        mags[] = {
            { "10Rnd_762x54_Mag", "", 300 },
            { "9Rnd_45ACP_Mag", "", 45 },
            { "11Rnd_45ACP_Mag", "", 45 },
            { "6Rnd_45ACP_Cylinder", "", 50 },
            { "16Rnd_9x21_Mag", "", 45 },
            { "30Rnd_65x39_caseless_green", "", 120 },
            { "30Rnd_65x39_caseless_mag", "", 130 },
            { "100Rnd_65x39_caseless_mag_Tracer", "", 500 },
            { "20Rnd_556x45_UW_mag", "", 125 },
            { "30Rnd_556x45_Stanag", "", 300 },
            { "30Rnd_45ACP_Mag_SMG_01", "", 100 }
        };
        accs[] = {
            { "optic_AMS", "", 20000, 300 },
            { "optic_AMS_khk", "", 40000, 300 },
            { "optic_KHS_blk", "", 40000, 300 },
            { "optic_KHS_hex", "", 45000, 300 },
            { "optic_KHS_old", "", 45000, 300 },
            { "optic_DMS", "", 3500, 300 },
            { "optic_NVS", "", 8500, 300 },
            { "optic_MRCO", "", 3600, 300 },
            { "optic_SOS", "", 10000, 100 },
            { "optic_Holosight_smg", "", 10000, 300 },
            { "optic_Holosight", "", 10000, 300 },
            { "optic_Aco_smg", "", 15000, 300 },
            { "optic_ACO_grn_smg", "", 15000, 300 },
            { "optic_Aco", "", 15000, 300 },
            { "optic_Hamr", "", 15000, 300 },
			{ "muzzle_snds_338_black", "", 6000, 300 },
            { "muzzle_snds_338_green", "", 6000, 300 },
            { "muzzle_snds_acp", "", 6000, 300 },
            { "muzzle_snds_93mmg", "", 6000, 300 },
            { "muzzle_snds_93mmg_tan", "", 6000, 300 },
            { "muzzle_snds_H_MG", "", 6000, 300 },
            { "muzzle_snds_B", "", 6000, 300 },
            { "muzzle_snds_M", "", 6000, 300 },
            { "muzzle_snds_L", "", 6000, 100 },
            { "muzzle_snds_H", "", 6000, 300 },
            { "acc_flashlight", "", 6000, 300 },
            { "acc_pointer_IR", "", 6000, 300 }
        };
    };
	
	class schwarzwaffenladen {
        name = "Schwarzmarkt Waaffenhaendler";
        side = "civ";
        license = "schwarzwaffen";
        level[] = { "", "", -1, "" };
        items[] = {
            { "srifle_DMR_01_F", "", 100000, -1 },
            { "srifle_EBR_F", "", 80000, -1 },
            { "srifle_LRR_F", "", 800000, -1 },
            { "srifle_DMR_03_F", "", 80000, -1 },
            { "srifle_DMR_04_F", "", 300000, -1 },
            { "srifle_DMR_05_blk_F", "", 580000, -1 },
            { "srifle_DMR_05_tan_f", "", 580000, -1 },
            { "srifle_DMR_06_camo_F", "", 70000, -1 },
            { "MMG_02_black_F", "", 700000, -1 },
            { "LMG_Mk200_F", "", 250000, -1 },
            { "LMG_Zafir_F", "", 680000, -1 },
            { "arifle_Katiba_GL_F", "", 56000, -1 },
			{ "arifle_MXM_F", "", 30000, -1 },
			{ "arifle_MX_GL_F", "", 150000, -1 },
            { "arifle_Mk20_F", "", 25000, -1 },
			{ "arifle_Mk20_GL_F", "", 120000, -1 },
			{ "muzzle_snds_H", "", 6000, 300 },
			{ "bipod_01_F_snd", "", 1200, -1 },
			{ "bipod_01_F_blk", "", 1200, -1 },
			{ "bipod_02_F_tan", "", 1200, -1 },
			{ "bipod_02_F_hex", "", 1200, -1 },
			{ "bipod_03_F_oli", "", 1200, -1 }
			
        };
        mags[] = {
            { "10Rnd_762x54_Mag", "", 300 },
			{ "30Rnd_65x39_caseless_mag", "", 150 },
			{ "30Rnd_65x39_caseless_mag_Tracer", "", 170 },
            { "7Rnd_408_Mag", "", 4000 },
            { "20Rnd_762x51_Mag", "", 500 },
            { "10Rnd_127x54_Mag", "", 5000 },
            { "10Rnd_93x64_DMR_05_Mag", "", 1000 },
            { "130Rnd_338_Mag", "", 7000 },
			{ "200Rnd_65x39_cased_Box_Tracer", "", 5000 },
			{ "200Rnd_65x39_cased_Box", "", 5000 },
			{ "150Rnd_762x54_Box", "", 7000 },
			{ "150Rnd_762x54_Box_Tracer", "", 7000 },
			{ "30Rnd_556x45_Stanag", "", 100 },
			{ "30Rnd_556x45_Stanag_Tracer_Yellow", "", 120 },
			{ "30Rnd_556x45_Stanag_Tracer_Red", "", 120 },
            { "30Rnd_65x39_caseless_green_mag_Tracer", "", 150 }
        };
        accs[] = {
            { "optic_AMS", "", 20000, 300 },
            { "optic_AMS_khk", "", 40000, 300 },
            { "optic_KHS_blk", "", 40000, 300 },
            { "optic_KHS_hex", "", 45000, 300 },
            { "optic_KHS_old", "", 45000, 300 },
            { "optic_DMS", "", 3500, 300 },
            { "optic_NVS", "", 8500, 300 },
            { "optic_MRCO", "", 3600, 300 },
            { "optic_SOS", "", 10000, 100 },
            { "optic_Holosight_smg", "", 10000, 300 },
            { "optic_Holosight", "", 10000, 300 },
            { "optic_Aco_smg", "", 15000, 300 },
            { "optic_ACO_grn_smg", "", 15000, 300 },
            { "optic_Aco", "", 15000, 300 },
            { "optic_Hamr", "", 15000, 300 },
			{ "muzzle_snds_338_black", "", 6000, 300 },
            { "muzzle_snds_338_green", "", 6000, 300 },
            { "muzzle_snds_acp", "", 6000, 300 },
            { "muzzle_snds_93mmg", "", 6000, 300 },
            { "muzzle_snds_93mmg_tan", "", 6000, 300 },
            { "muzzle_snds_H_MG", "", 6000, 300 },
			{ "muzzle_snds_H_SW", "", 6000, 300 },
            { "muzzle_snds_B", "", 6000, 300 },
            { "muzzle_snds_M", "", 6000, 300 },
            { "muzzle_snds_L", "", 6000, 100 },
            { "muzzle_snds_H", "", 6000, 300 },
            { "acc_flashlight", "", 6000, 300 },
            { "acc_pointer_IR", "", 6000, 300 }
        };
    };

    class gang {
        name = "Hideout Armament";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "hgun_Rook40_F", "", 1500, 500 },
            { "hgun_Pistol_heavy_02_F", "", 2500, -1 },
            { "hgun_ACPC2_F", "", 4500, -1 },
            { "hgun_PDW2000_F", "", 9500, -1 }
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
            { "Binocular", "", 150, -1 },
            { "ItemGPS", "", 150, 45 },
            { "ItemMap", "", 50, 35 },
            { "ItemCompass", "", 50, 25 },
            { "ItemWatch", "", 50, -1 },
            { "FirstAidKit", "", 200, 65 },
			{ "NVGoggles", "", 2000, 980 },
			{ "NVGoggles_OPFOR", "", 2000, 980 },
			{ "NVGoggles_INDEP", "", 2000, 980 },
            { "Chemlight_red", "", 500, -1 },
            { "Chemlight_yellow", "", 500, 50 },
            { "Chemlight_green", "", 500, 50 },
            { "Chemlight_blue", "", 500, 50 }
        };
        mags[] = {};
        accs[] = {};
    };
	
 //Basic Shops
    class mtdciv {
        name = "MTD Shop";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "Chemlight_red", "", 300, -1 },
            { "Chemlight_yellow", "", 300, 50 },
            { "Chemlight_green", "", 300, 50 },
            { "Chemlight_blue", "", 300, 50 }
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
            { "Binocular", "", 750, -1 },
            { "ItemGPS", "", 500, 45 },
            { "ItemMap", "", 250, 35 },
            { "ItemCompass", "", 250, 25 },
            { "ItemWatch", "", 250, -1 },
            { "FirstAidKit", "", 750, 65 },
            { "NVGoggles", "", 10000, 980 },
			{ "NVGoggles_OPFOR", "", 2000, 980 },
			{ "NVGoggles_INDEP", "", 2000, 980 },
            { "Chemlight_red", "", 1500, -1 },
            { "Chemlight_yellow", "", 1500, 50 },
            { "Chemlight_green", "", 1500, 50 },
            { "Chemlight_blue", "", 1500, 50 }
        };
        mags[] = {};
        accs[] = {};
    };

    //Cop Shops
	
	class cop_genstore {
        name = "Einsatzausrüstung";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 1, "Du bist kein Polizei Mitglied" };
        items[] = {
            { "Binocular", "", 150, -1 },
            { "ItemGPS", "", 100, -1 },
			{ "MineDetector", "", 1000, -1 },
			{ "Rangefinder", "", 150, -1 },
            { "FirstAidKit", "", 150, -1 },
            { "Medikit", "", 1000, -1 },
            { "NVGoggles", "", 1000, -1 },
			{ "NVGoggles_OPFOR", "", 1000, -1 },
			{ "NVGoggles_INDEP", "", 1000, -1 },
			{ "Chemlight_red", "", 500, -1 },
            { "Chemlight_yellow", "", 500, -1 },
            { "Chemlight_green", "", 500, -1 },
            { "Chemlight_blue", "", 500, -1 }
        };
        mags[] = {};
    };
	
	class cop_praktikant {
        name = "Polizei Praktikant Dienstwaffen";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 1, "Du bist kein Praktikant" };
        items[] = {
            { "hgun_P07_snds_F", "Taser Pistol", 2000, -1 }
        };
		accs[] = {	
			{ "optic_Holosight", "", 1200, -1 },
            { "optic_ACO_grn_smg", "", 2500, -1 },
			{ "muzzle_snds_L", "", 650, -1 },
            { "muzzle_snds_H", "", 2750, -1 },
			{ "acc_flashlight", "", 750, -1 }
        };
        mags[] = {
            { "30Rnd_9x21_Mag", "", 150 }
        };
    };
	
	class cop_anwaerter {
        name = "Polizei Anwaerter Dienstwaffen";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 2, "Du bist kein Anwaerter" };
        items[] = {
            { "arifle_MXC_F", "Taser Gewehr", 25000, -1 },
            { "hgun_P07_snds_F", "Taser Pistol", 2000, -1 }
        };
		accs[] = {	
			{ "optic_Holosight", "", 1200, -1 },
            { "optic_ACO_grn_smg", "", 2500, -1 },
			{ "muzzle_snds_L", "", 650, -1 },
            { "muzzle_snds_H", "", 2750, -1 },
			{ "acc_flashlight", "", 750, -1 }
        };
        mags[] = {
            { "30Rnd_65x39_caseless_mag", "", 130 },
			{ "30Rnd_65x39_caseless_mag", "Taser Gewehr Munition", 45 },
            { "30Rnd_9x21_Mag", "", 150 }
        };
    };

    class cop_wachtm {
        name = "Polizeiwachtmeister Dienstwaffen";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 3, "Du bist kein Watchmeister" };
        items[] = {
            { "arifle_MXC_F", "Taser Gewehr", 25000, -1 },
            { "hgun_P07_snds_F", "Taser Pistol", 2000, -1 },
            { "SMG_02_F", "", 30000, -1 },
			{ "arifle_MX_F", "Gummi MX", 35000, -1 }
		};
        accs[] = {    
			{ "optic_Holosight", "", 1200, -1 },
            { "optic_ACO_grn_smg", "", 2500, -1 },
            { "optic_MRCO", "", 2500, -1 },			
			{ "muzzle_snds_L", "", 650, -1 },
			{ "muzzle_snds_M", "", 950, -1 },
            { "muzzle_snds_H", "", 2750, -1 },
			{ "muzzle_snds_B", "", 2750, -1 },
			{ "muzzle_snds_H_MG", "", 2750, -1 },
			{ "optic_Arco", "", 1000, -1 },
			{ "optic_Hamr", "", 1000, -1 },
			{ "acc_flashlight", "", 750, -1 }
        };
        mags[] = {
			{ "16Rnd_9x21_Mag", "", 25, -1 },
			{ "20Rnd_762x51_Mag", "", 80, -1 },
            { "30Rnd_65x39_caseless_mag", "Taser Gewehr Munition", 45, -1 },
			{ "30Rnd_65x39_caseless_mag", "Gummi Munition", 60, -1 },
            { "30Rnd_65x39_caseless_mag", "", 130, -1 },
            { "30Rnd_9x21_Mag", "", 250, -1 }
        };
    };

    class cop_kommissar {
        name = "Polizeikommissar Dienstwaffen";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 4, "Du bist kein Kommissar" };
        items[] = {
            { "arifle_MXC_F", "Taser Gewehr", 25000, -1 },
            { "hgun_P07_snds_F", "Taser Pistol", 2000, -1 },
            { "SMG_02_F", "", 30000, -1 },
			{ "arifle_MX_F", "Gummi MX", 35000, -1 },
			{ "hgun_ACPC2_F", "", 17500, -1 },
		    { "arifle_Mk20_F", "", 25000, -1 },
			{ "arifle_SDAR_F", "", 45000, -1 },
            { "HandGrenade_Stone", "Flashbang", 1500, -1 },
			{ "SmokeShellGreen", "Tränengas", 1500, -1 }
        };   
		accs[] = {
			{ "optic_Holosight", "", 1200, 275 },
            { "optic_ARCO", "", 2500, -1 },
            { "optic_MRCO", "", 2500, -1 },
			{ "optic_Hamr", "", 1000, -1 },			
            { "optic_ACO_grn_smg", "", 2500, -1 },
            { "optic_DMS", "", 3500, -1 },	
			{ "bipod_02_F_tan", "", 1000, -1 },
			{ "bipod_02_F_blk", "", 1000, -1 },
			{ "muzzle_snds_L", "", 650, -1 },
			{ "muzzle_snds_M", "", 950, -1 },
            { "muzzle_snds_H", "", 2750, -1 },
			{ "muzzle_snds_B", "", 2750, -1 },
			{ "muzzle_snds_H_MG", "", 2750, -1 },
			{ "acc_flashlight", "", 750, -1 }
        };
        mags[] = {
            { "9Rnd_45ACP_Mag", "", 45, -1 },
			{ "16Rnd_9x21_Mag", "", 25, -1 },
			{ "20Rnd_762x51_Mag", "", 80, -1 },
            { "30Rnd_65x39_caseless_mag", "Taser Gewehr Munition", 45, -1 },
			{ "30Rnd_65x39_caseless_mag", "Gummi Munition", 60, -1 },
            { "30Rnd_9x21_Mag", "", 60, -1 },
            { "30Rnd_65x39_caseless_mag", "", 100, -1, -1 },
			{ "30Rnd_556x45_Stanag", "", 100, -1, -1 },
			{ "30Rnd_556x45_Stanag_Tracer_Green", "", 100, -1, -1 }			
        };
    };
	
	class cop_oberk {
        name = "Polizeioberkommissar Einsatzwaffen";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 5, "Du bist kein Oberkommissar" };
        items[] = {
            { "arifle_MXC_F", "Taser Gewehr", 25000, -1 },
            { "hgun_P07_snds_F", "Taser Pistol", 2000, -1 },
            { "SMG_02_F", "", 30000, -1 },
			{ "arifle_MX_F", "Gummi MX", 35000, -1 },
			{ "arifle_MX_SW_F", "", 45000, -1 },
			{ "arifle_MXM_F", "", 45000, -1 },
			{ "srifle_EBR_F", "", 45000, -1 },
			{ "hgun_ACPC2_F", "", 17500, -1 },
		    { "arifle_Mk20_F", "", 25000, -1 },
			{ "arifle_SDAR_F", "", 45000, -1 },
            { "HandGrenade_Stone", "Flashbang", 1500, -1 },
			{ "SmokeShellGreen", "Tränengas", 1500, -1 }
        };   
		accs[] = {
			{ "optic_Holosight", "", 1200, 275 },
            { "optic_ARCO", "", 2500, -1 },
            { "optic_MRCO", "", 2500, -1 },	
			{ "optic_Hamr", "", 1000, -1 },
            { "optic_ACO_grn_smg", "", 2500, -1 },
			{ "optic_DMS", "", 3500, -1 },
            { "optic_AMS_snd", "", 2500, -1 },
			{ "bipod_02_F_tan", "", 1000, -1 },
			{ "bipod_02_F_blk", "", 1000, -1 },
			{ "muzzle_snds_L", "", 650, -1 },
			{ "muzzle_snds_M", "", 950, -1 },
            { "muzzle_snds_H", "", 2750, -1 },
			{ "muzzle_snds_B", "", 2750, -1 },
			{ "muzzle_snds_H_MG", "", 2750, -1 },
			{ "acc_pointer_IR", "", 1000, -1 },
			{ "acc_flashlight", "", 750, -1 }
        };
        mags[] = {
            { "9Rnd_45ACP_Mag", "", 45, -1 },
			{ "16Rnd_9x21_Mag", "", 25, -1 },
			{ "20Rnd_762x51_Mag", "", 80, -1 },
            { "30Rnd_65x39_caseless_mag", "Taser Gewehr Munition", 45, -1 },
			{ "30Rnd_65x39_caseless_mag", "Gummi Munition", 60, -1 },
			{ "100Rnd_65x39_caseless_mag", "", 160, -1 },
            { "30Rnd_9x21_Mag", "", 60, -1 },
            { "30Rnd_65x39_caseless_mag", "", 100, -1 },
			{ "30Rnd_556x45_Stanag", "", 100, -1 },
			{ "30Rnd_556x45_Stanag_Tracer_Green", "", 100, -1 },
            { "20Rnd_762x54_Mag", "", 80, -1 }
        };
    };
	
	class cop_hauptkom {
        name = "Polizeihauptkommissar Einsatzwaffen";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 6, "Du bist kein Hauptkommissar" };
        items[] = {
            { "arifle_MXC_F", "Taser Gewehr", 25000, -1 },
            { "hgun_P07_snds_F", "Taser Pistol", 2000, -1 },
            { "SMG_02_F", "", 30000, -1 },
			{ "arifle_MX_F", "Gummi MX", 35000, -1 },
			{ "arifle_MX_SW_F", "", 45000, -1 },
			{ "arifle_MXM_F", "", 45000, -1 },
			{ "srifle_EBR_F", "", 45000, -1 },
			{ "srifle_DMR_03_tan_F", "", 50000, -1 },
			{ "hgun_ACPC2_F", "", 17500, -1 },
		    { "arifle_Mk20_F", "", 25000, -1 },
			{ "arifle_SDAR_F", "", 45000, -1 },
            { "HandGrenade_Stone", "Flashbang", 1500, -1 },
			{ "SmokeShellGreen", "Tränengas", 1500, -1 }
        };   
		accs[] = {
			{ "optic_Holosight", "", 1200, -1 },
            { "optic_ARCO", "", 2500, -1 },
            { "optic_MRCO", "", 2500, -1 },	
            { "optic_ACO_grn_smg", "", 2500, -1 },
			{ "optic_DMS", "", 3500, -1 },
            { "optic_AMS_snd", "", 2500, -1 },
			{ "optic_LRPS", "", 4500, -1 },
            { "optic_NVS", "", 4500, -1 },
			{ "optic_Hamr", "", 2500, -1 },
			{ "optic_SOS", "", 3500, -1 },
			{ "bipod_02_F_tan", "", 1000, -1 },
			{ "bipod_02_F_blk", "", 1000, -1 },
			{ "muzzle_snds_L", "", 650, -1 },
			{ "muzzle_snds_M", "", 950, -1 },
            { "muzzle_snds_H", "", 2750, -1 },
			{ "muzzle_snds_B", "", 2750, -1 },
			{ "muzzle_snds_H_MG", "", 2750, -1 },
			{ "acc_pointer_IR", "", 1000, -1 },
			{ "acc_flashlight", "", 750, -1 }
        };
        mags[] = {
            { "9Rnd_45ACP_Mag", "", 45, -1 },
			{ "16Rnd_9x21_Mag", "", 25, -1 },
			{ "20Rnd_762x51_Mag", "", 80, -1 },
            { "30Rnd_65x39_caseless_mag", "Taser Gewehr Munition", 45, -1 },
			{ "30Rnd_65x39_caseless_mag", "Gummi Munition", 60, -1 },
			{ "100Rnd_65x39_caseless_mag", "", 160, -1 },
            { "30Rnd_9x21_Mag", "", 60, -1 },
            { "30Rnd_65x39_caseless_mag", "", 100, -1 },
			{ "30Rnd_556x45_Stanag", "", 100, -1 },
			{ "30Rnd_556x45_Stanag_Tracer_Green", "", 100, -1 },
            { "20Rnd_762x54_Mag", "", 80, -1 },
			{ "10Rnd_762x54_Mag", "", 70, -1 }
        };
    };
	
	class cop_bundescop {
        name = "Bundespolizist Dienstwaffen";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 7, "Du bist kein Bundespolizist" };
        items[] = {
            { "arifle_MXC_F", "Taser Gewehr", 25000, -1 },
            { "hgun_P07_snds_F", "Taser Pistol", 2000, -1 },
            { "SMG_02_F", "", 30000, -1 },
			{ "arifle_MX_F", "Gummi MX", 35000, -1 },
			{ "arifle_MX_SW_F", "", 45000, -1 },
			{ "arifle_MXM_F", "", 45000, -1 },
			{ "srifle_EBR_F", "", 45000, -1 },
			{ "srifle_DMR_03_tan_F", "", 50000, -1 },
			{ "srifle_DMR_02_F", "", 80000, -1 },
			{ "srifle_DMR_02_sniper_F", "", 80000, -1 }	,		
			{ "hgun_ACPC2_F", "", 17500, -1 },
		    { "arifle_Mk20_F", "", 25000, -1 },
			{ "arifle_SDAR_F", "", 45000, -1 },
            { "HandGrenade_Stone", "Flashbang", 1500, -1 },
			{ "SmokeShellGreen", "Tränengas", 1500, -1 },
			{ "B_UavTerminal", "", 1500, -1 }
        };   
		accs[] = {
			{ "optic_Holosight", "", 1200, -1 },
            { "optic_ARCO", "", 2500, -1 },
            { "optic_MRCO", "", 2500, -1 },	
            { "optic_ACO_grn_smg", "", 2500, -1 },
			{ "optic_DMS", "", 3500, -1 },
			{ "optic_AMS_snd", "", 2500, -1 },
			{ "optic_AMS", "", 2500, -1 },
			{ "optic_AMS_base", "", 2500, -1 },
			{ "optic_AMS_khk", "", 2500, -1 },
			{ "optic_LRPS", "", 4500, -1 },
            { "optic_NVS", "", 4500, -1 },
			{ "optic_Hamr", "", 2500, -1 },
			{ "optic_SOS", "", 3500, -1 },
			{ "bipod_02_F_tan", "", 1000, -1 },
			{ "bipod_02_F_blk", "", 1000, -1 },
			{ "muzzle_snds_L", "", 650, -1 },
			{ "muzzle_snds_M", "", 950, -1 },
            { "muzzle_snds_H", "", 2750, -1 },
			{ "muzzle_snds_B", "", 2750, -1 },
			{ "muzzle_snds_H_MG", "", 2750, -1 },
			{ "acc_pointer_IR", "", 1000, -1 },
			{ "acc_flashlight", "", 750, -1 }
        };
        mags[] = {
            { "9Rnd_45ACP_Mag", "", 45, -1 },
			{ "16Rnd_9x21_Mag", "", 25, -1 },
			{ "20Rnd_762x51_Mag", "", 80, -1 },
            { "30Rnd_65x39_caseless_mag", "Taser Gewehr Munition", 45, -1 },
			{ "30Rnd_65x39_caseless_mag", "Gummi Munition", 60, -1 },
			{ "100Rnd_65x39_caseless_mag", "", 160, -1 },
            { "30Rnd_9x21_Mag", "", 60, -1 },
            { "30Rnd_65x39_caseless_mag", "", 100, -1 },
			{ "30Rnd_556x45_Stanag", "", 100, -1 },
			{ "30Rnd_556x45_Stanag_Tracer_Green", "", 100, -1 },
            { "20Rnd_762x54_Mag", "", 80, -1 },
			{ "10Rnd_762x54_Mag", "", 70, -1 },
			{ "10Rnd_338_Mag", "", 100, -1 }
        };
    };
	
	
class cop_sek {
        name = "SEK Einsatzmittel";
        side = "cop";
        license = "sek";
        level[] =  { -1, -1, -1, -1 };
        items[] = {
			{ "arifle_MXC_Black_F", "Taser Gewehr", 25000, -1 },
            { "hgun_P07_snds_F", "Taser Pistol", 2000, -1 },
            { "SMG_02_F", "", 30000, -1 },
			{ "arifle_MX_Black_F", "Gummi MX", 35000, -1 },
			{ "arifle_MX_SW_Black_F", "", 45000, -1 },
			{ "arifle_MX_GL_Black_F", "", 75000, -1 },
			{ "arifle_MXM_Black_F", "", 45000, -1 },
			{ "srifle_EBR_F", "", 45000, -1 },
			{ "srifle_DMR_03_F", "", 50000, -1 },
			{ "srifle_DMR_06_olive_F", "", 45000, -1 },
			{ "srifle_DMR_02_F", "", 80000, -1 },
			{ "srifle_DMR_02_camo_F", "", 80000, -1 },
			{ "srifle_DMR_02_sniper_F", "", 80000, -1 },
			{ "LMG_Mk200_BI_F", "", 50000, -1 },
			{ "hgun_ACPC2_F", "", 17500, -1 },
		    { "arifle_Mk20_F", "", 25000, -1 },
			{ "arifle_SDAR_F", "", 45000, -1 },
            { "HandGrenade_Stone", "Flashbang", 1500, -1 },
			{ "SmokeShellGreen", "Tränengas", 1500, -1 },
			{ "MiniGrenade", "", 4000, -1 },
			{ "SmokeShell", "", 200, -1 },
			{ "B_UavTerminal", "", 1500, -1 }
		};	
		accs[] = {
			{ "optic_Holosight", "", 1200, -1 },
            { "optic_ARCO", "", 2500, -1 },
            { "optic_MRCO", "", 2500, -1 },	
            { "optic_ACO_grn_smg", "", 2500, -1 },
			{ "optic_DMS", "", 3500, -1 },
			{ "optic_AMS_snd", "", 2500, -1 },
			{ "optic_AMS", "", 2500, -1 },
			{ "optic_AMS_base", "", 2500, -1 },
			{ "optic_AMS_khk", "", 2500, -1 },
			{ "optic_LRPS", "", 4500, -1 },
            { "optic_NVS", "", 4500, -1 },
			{ "optic_Hamr", "", 2500, -1 },
			{ "optic_SOS", "", 3500, -1 },
            { "bipod_02_F_tan", "", 1000, -1 },
			{ "bipod_02_F_blk", "", 1000, -1 },			
			{ "muzzle_snds_L", "", 650, -1 },
			{ "muzzle_snds_M", "", 950, -1 },
            { "muzzle_snds_H", "", 2750, -1 },
			{ "muzzle_snds_B", "", 2750, -1 },
			{ "muzzle_snds_H_MG", "", 2750, -1 },
			{ "acc_pointer_IR", "", 1000, -1 },
			{ "acc_flashlight", "", 750, -1 }
        };
        mags[] = {
             { "9Rnd_45ACP_Mag", "", 45, -1 },
			{ "16Rnd_9x21_Mag", "", 25, -1 },
            { "30Rnd_65x39_caseless_mag", "Taser Gewehr Munition", 45, -1 },
			{ "30Rnd_65x39_caseless_mag", "Gummi Munition", 60, -1 },
			{ "100Rnd_65x39_caseless_mag", "", 160, -1 },
            { "30Rnd_9x21_Mag", "", 60, -1 },
            { "30Rnd_65x39_caseless_mag", "", 100, -1 },
			{ "30Rnd_556x45_Stanag", "", 100, -1 },
			{ "30Rnd_556x45_Stanag_Tracer_Green", "", 100, -1 },
            { "20Rnd_762x54_Mag", "", 80, -1 },
			{ "10Rnd_762x54_Mag", "", 70, -1 },
			{ "20Rnd_762x51_Mag", "", 80, -1 },
			{ "10Rnd_338_Mag", "", 100, -1 },
			{ "200Rnd_65x39_cased_Box", "", 150, -1 },
			{ "1Rnd_SmokeGreen_Grenade_shell", "Tränengas", 40, -1 },
			{ "1Rnd_Smoke_Grenade_shell", "", 40, -1 },
			{ "3Rnd_UGL_FlareWhite_F", "Flashbang", 250, -1 }      //--------------> wenn möglich!
        };
    };
	
	class cop_kripo {
        name = "Kripo Dienstwaffen";
        side = "cop";
        license = "kripo";
        level[] =  { -1, -1, -1, -1 };
        items[] = {
            { "arifle_MXC_Black_F", "Taser Gewehr", 35000, -1 },
            { "hgun_P07_snds_F", "Taser Pistol", 2000, -1 },
            { "hgun_P07_F", "", 7500, -1 },
			{ "hgun_ACPC2_F", "", 17500, -1 },
            { "SMG_02_ACO_F", "", 30000, -1 },
			{ "arifle_MX_Black_F", "", 35000, -1 },
            { "arifle_MX_SW_Black_F", "", 35000, -1 },
            { "arifle_MXM_Black_F", "", 35000, -1 },
			{ "arifle_Mk20_F", "", 38000, -1 }, 
			{ "arifle_TRG21_F", "", 40000, -1 },  
			{ "arifle_SDAR_F", "", 45000, -1 },
			{ "srifle_EBR_F", "", 50000, -1 },
			{ "srifle_LRR_F", "", 60000, -1 },
			{ "srifle_DMR_04_F", "", 72500, -1 },
            { "HandGrenade_Stone", "Flashbang", 1700, -1 },
            { "MiniGrenade", "", 1000, -1 },
			{ "SmokeShell", "", 200, -1 },
			{ "B_UavTerminal", "", 1500, -1 }
		};	
		accs[] = {
			{ "optic_Holosight", "", 2500, -1 },
			{ "optic_ACO_smg", "", 2500, -1 },
			{ "optic_ARCO", "", 2500, -1 },
			{ "optic_MRCO", "", 2500, -1 },
			{ "optic_LRPS", "", 2500, -1 },
			{ "optic_Hamr", "", 2500, -1 },
			{ "optic_DMS", "", 3500, 350 },
            { "optic_AMS", "", 3500, 350 },
			{ "optic_NVS", "", 3500, 350 },
			{ "optic_SOS", "", 3500, 350 },
			{ "bipod_02_F_tan", "", 1000, -1 },
			{ "bipod_02_F_blk", "", 1000, -1 },
			{ "muzzle_snds_L", "", 650, -1 },
			{ "muzzle_snds_M", "", 950, -1 },
            { "muzzle_snds_H", "", 2750, -1 },
			{ "muzzle_snds_B", "", 2750, -1 },
			{ "muzzle_snds_H_MG", "", 2750, -1 }
        };
        mags[] = {
             { "9Rnd_45ACP_Mag", "", 45, -1 },
			{ "16Rnd_9x21_Mag", "", 25, -1 },
            { "30Rnd_65x39_caseless_mag", "Taser Gewehr Munition", 45, -1 },
            { "20Rnd_762x51_Mag", "", 150, -1 },
            { "30Rnd_9x21_Mag", "", 60, -1 },
			{ "30Rnd_556x45_Stanag", "", 60, -1 },
            { "30Rnd_65x39_caseless_mag", "", 100, -1 },
			{ "7Rnd_408_Mag", "", 150, -1 },
			{ "10Rnd_127x54_Mag", "", 200, -1 }
        };
    };
	
	class cop_chefstv {
        name = "Dienstwaffen Polizei Leitung";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 8, "Du bist nicht in der Leitung" };
        items[] = {
            { "arifle_MXC_F", "Taser Gewehr", 25000, -1 },
            { "hgun_P07_snds_F", "Taser Pistol", 2000, -1 },
            { "SMG_02_F", "", 30000, -1 },
			{ "arifle_MX_F", "Gummi MX", 35000, -1 },
			{ "arifle_MX_SW_F", "", 45000, -1 },
			{ "arifle_MXM_F", "", 45000, -1 },
			{ "srifle_EBR_F", "", 45000, -1 },
			{ "srifle_DMR_03_tan_F", "", 50000, -1 },
			{ "srifle_DMR_02_F", "", 80000, -1 },
			{ "srifle_DMR_02_sniper_F", "", 80000, -1 },
			{ "srifle_LRR_F", "", 80000, -1 },
			{ "hgun_ACPC2_F", "", 17500, -1 },
		    { "arifle_Mk20_F", "", 25000, -1 },
			{ "arifle_SDAR_F", "", 45000, -1 },
            { "HandGrenade_Stone", "Flashbang", 1500, -1 },
			{ "SmokeShellGreen", "Tränengas", 1500, -1 },
			{ "SmokeShell", "", 200, -1 },
			{ "MiniGrenade", "", 4000, -1 },
			{ "B_UavTerminal", "", 1500, -1 }
        };   
		accs[] = {
			{ "optic_Holosight", "", 1200, -1 },
            { "optic_ARCO", "", 2500, -1 },
            { "optic_MRCO", "", 2500, -1 },	
            { "optic_ACO_grn_smg", "", 2500, -1 },
			{ "optic_DMS", "", 3500, -1 },
            { "optic_AMS_snd", "", 2500, -1 },
			{ "optic_AMS", "", 2500, -1 },
			{ "optic_AMS_base", "", 2500, -1 },
			{ "optic_AMS_khk", "", 2500, -1 },
			{ "optic_LRPS", "", 4500, -1 },
            { "optic_NVS", "", 4500, -1 },
			{ "optic_Hamr", "", 2500, -1 },
			{ "optic_SOS", "", 3500, -1 },
			{ "bipod_02_F_tan", "", 1000, -1 },
			{ "bipod_02_F_blk", "", 1000, -1 },
			{ "muzzle_snds_L", "", 650, -1 },
			{ "muzzle_snds_M", "", 950, -1 },
            { "muzzle_snds_H", "", 2750, -1 },
			{ "muzzle_snds_B", "", 2750, -1 },
			{ "muzzle_snds_H_MG", "", 2750, -1 },
			{ "acc_pointer_IR", "", 1000, -1 },
			{ "acc_flashlight", "", 750, -1 }
        };
        mags[] = {
            { "9Rnd_45ACP_Mag", "", 45, -1 },
			{ "16Rnd_9x21_Mag", "", 25, -1 },
			{ "20Rnd_762x51_Mag", "", 80, -1 },
            { "30Rnd_65x39_caseless_mag", "Taser Gewehr Munition", 45, -1 },
			{ "30Rnd_65x39_caseless_mag", "Gummi Munition", 60, -1 },
			{ "100Rnd_65x39_caseless_mag", "", 160, -1 },
            { "30Rnd_9x21_Mag", "", 60, -1 },
            { "30Rnd_65x39_caseless_mag", "", 100, -1 },
			{ "30Rnd_556x45_Stanag", "", 100, -1 },
			{ "30Rnd_556x45_Stanag_Tracer_Green", "", 100, -1 },
            { "20Rnd_762x54_Mag", "", 80, -1 },
			{ "10Rnd_762x54_Mag", "", 70, -1 },
			{ "10Rnd_338_Mag", "", 100, -1 },
			{ "7Rnd_408_Mag", "", 100, -1 }
        };
    };
	
	class cop_chef {
        name = "Dienstwaffen Polizei Leitung";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 9, "Du bist in der Leitung" };
        items[] = {
            { "arifle_MXC_F", "Taser Gewehr", 25000, -1 },
            { "hgun_P07_snds_F", "Taser Pistol", 2000, -1 },
            { "SMG_02_F", "", 30000, -1 },
			{ "arifle_MX_F", "Gummi MX", 35000, -1 },
			{ "arifle_MX_SW_F", "", 45000, -1 },
			{ "arifle_MXM_F", "", 45000, -1 },
			{ "srifle_EBR_F", "", 45000, -1 },
			{ "srifle_DMR_03_tan_F", "", 50000, -1 },
			{ "srifle_DMR_02_F", "", 80000, -1 },
			{ "srifle_DMR_02_sniper_F", "", 80000, -1 },
			{ "srifle_LRR_F", "", 80000, -1 },
			{ "hgun_ACPC2_F", "", 17500, -1 },
		    { "arifle_Mk20_F", "", 25000, -1 },
			{ "arifle_SDAR_F", "", 45000, -1 },
            { "HandGrenade_Stone", "Flashbang", 1500, -1 },
			{ "SmokeShellGreen", "Tränengas", 1500, -1 },
			{ "MiniGrenade", "", 4000, -1 }
        };   
		accs[] = {
			{ "optic_Holosight", "", 1200, -1 },
            { "optic_ARCO", "", 2500, -1 },
            { "optic_MRCO", "", 2500, -1 },	
			{ "optic_Hamr", "", 2500, -1 },
            { "optic_ACO_grn_smg", "", 2500, -1 },
			{ "optic_DMS", "", 3500, -1 },
            { "optic_AMS_snd", "", 2500, -1 },
			{ "optic_AMS", "", 2500, -1 },
			{ "optic_AMS_base", "", 2500, -1 },
			{ "optic_AMS_khk", "", 2500, -1 },
			{ "optic_LRPS", "", 4500, -1 },
            { "optic_NVS", "", 4500, -1 },
			{ "optic_SOS", "", 3500, -1 },
			{ "bipod_02_F_tan", "", 1000, -1 },
			{ "bipod_02_F_blk", "", 1000, -1 },
			{ "muzzle_snds_L", "", 650, -1 },
			{ "muzzle_snds_M", "", 950, -1 },
            { "muzzle_snds_H", "", 2750, -1 },
			{ "muzzle_snds_B", "", 2750, -1 },
			{ "muzzle_snds_H_MG", "", 2750, -1 },
			{ "acc_pointer_IR", "", 1000, -1 },
			{ "acc_flashlight", "", 750, -1 }
        };
        mags[] = {
            { "9Rnd_45ACP_Mag", "", 45, -1 },
			{ "16Rnd_9x21_Mag", "", 25, -1 },
            { "30Rnd_65x39_caseless_mag", "Taser Gewehr Munition", 45, -1 },
			{ "30Rnd_65x39_caseless_mag", "Gummi Munition", 60, -1 },
			{ "100Rnd_65x39_caseless_mag", "", 160, -1 },
            { "30Rnd_9x21_Mag", "", 60, -1 },
			{ "20Rnd_762x51_Mag", "", 30000, -1 },
            { "30Rnd_65x39_caseless_mag", "", 100, -1 },
			{ "30Rnd_556x45_Stanag", "", 100, -1 },
			{ "30Rnd_556x45_Stanag_Tracer_Green", "", 100, -1 },
            { "20Rnd_762x54_Mag", "", 80, -1 },
			{ "10Rnd_762x54_Mag", "", 70, -1 },
			{ "10Rnd_338_Mag", "", 100, -1 },
			{ "7Rnd_408_Mag", "", 100, -1 }
        };
    };

    //Medic Shops
    class med_basic {
        name = "store";
        side = "med";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "ItemGPS", "", 100, 45 },
            { "Binocular", "", 150, -1 },
            { "FirstAidKit", "", 150, 65 },
			{ "NVGoggles_OPFOR", "", 1200, 980 },
			{ "NVGoggles_INDEP", "", 1200, 980 },
            { "NVGoggles", "", 1200, 980 }
        };
        mags[] = {};
        accs[] = {};
    };
	
    //Medic civ Shops
    class medciv_shop {
        name = "store";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "FirstAidKit", "", 150, 65 },
			{ "Chemlight_red", "", 150, 65 },
			{ "Chemlight_yellow", "", 150, 65 },
			{ "Chemlight_green", "", 150, 65 },
			{ "Chemlight_blue", "", 150, 65 },
        };
        mags[] = {};
        accs[] = {};
    };
};
