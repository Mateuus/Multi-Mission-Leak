/*
*    Format:dica
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
        name = "Sklep z bronią";
        side = "civ";
        license = "bedzieszkurwodzialac";
        level[] = { "", "", -1, "" };
        items[] = {
			{ "hgun_Pistol_heavy_01_F", "", 15000, -1 },
			{ "SMG_01_F", "", 80000, -1 },

			{ "Binocular", "", 400, -1 },
            { "ItemGPS", "", 200, -1 },
            { "ItemMap", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "FirstAidKit", "", 400, -1 },
            { "NVGoggles", "", 5000, -1 }
        };
        mags[] = {
			{ "11Rnd_45ACP_Mag", "", 50 },
			{ "30Rnd_45ACP_Mag_SMG_01", "", 350 }
        };
		accs[] = {
			{ "optic_MRD", "", 2500, -1 }
        };
    };

    class sec {
        name = "Sklep ochroniarza";
        side = "civ";
        license = "sec";
        level[] = { "", "", -1, "" };
        items[] = {
			{ "hgun_Pistol_heavy_01_F", "", 25000, -1 },
			{ "SMG_01_F", "", 55000, -1 },
			{ "SMG_02_F", "", 46000, -1 },
			{ "SMG_05_F", "", 46000, -1 },
			{ "arifle_TRG20_F", "", 72000, -1 },
			{ "arifle_MXM_F", "", 150000, -1 },


			{ "Binocular", "", 400, -1 },
            { "ItemGPS", "", 200, -1 },
            { "ItemMap", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "FirstAidKit", "", 400, -1 },
            { "NVGoggles", "", 5000, -1 },
            { "Chemlight_red", "", 1000, -1 },
            { "Chemlight_yellow", "", 1000, -1 },
            { "Chemlight_green", "", 1000, -1 },
            { "Chemlight_blue", "", 1000, -1 }
        };
        mags[] = {
			{ "11Rnd_45ACP_Mag", "", 50 },
            { "30Rnd_9x21_Mag", "", 100 },
			{ "30Rnd_45ACP_Mag_SMG_01", "", 100 },
			{ "30Rnd_556x45_Stanag", "", 250 },
			{ "30Rnd_65x39_caseless_mag", "", 300 },
			{ "30Rnd_545x39_Mag_F", "", 400 }
        };
		accs[] = {
			{ "optic_Aco", "", 2000, -1 },
			{ "optic_Aco_smg", "", 2000, -1 },
			{ "optic_Holosight", "", 8000, -1 },
			{ "optic_MRCO", "", 12000, -1 },
			{ "optic_Arco", "", 24000, -1 },
			{ "optic_ERCO_blk_F", "", 24000, -1 },
			{ "optic_Hamr", "", 24000, -1 },
			{ "optic_MRCO", "", 28000, -1 },

			{ "acc_flashlight", "", 1000, -1 }
        };
    };

    class merc {
        name = "Sklep najemnika";
        side = "civ";
        license = "merc";
        level[] = { "", "", -1, "" };
        items[] = {
            { "hgun_Pistol_heavy_01_F", "", 25000, -1 },
			{ "SMG_01_F", "", 100000, -1 },
			{ "SMG_02_F", "", 100000, -1 },
			{ "arifle_Mk20C_plain_F", "", 200000, -1 },
			{ "arifle_Mk20_plain_F", "", 200000, -1 },
			{ "arifle_MXC_F", "", 300000, -1 },

			{ "Binocular", "", 400, -1 },
            { "ItemGPS", "", 200, -1 },
            { "ItemMap", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "FirstAidKit", "", 400, -1 },
            { "NVGoggles", "", 5000, -1 },
            { "Chemlight_red", "", 1000, -1 },
            { "Chemlight_yellow", "", 1000, -1 },
            { "Chemlight_green", "", 1000, -1 },
            { "Chemlight_blue", "", 1000, -1 },
			{ "SmokeShell", "", 2000, -1 }
        };
        mags[] = {
			{ "11Rnd_45ACP_Mag", "", 50 },
            { "30Rnd_9x21_Mag", "", 100 },
			{ "30Rnd_45ACP_Mag_SMG_01", "", 100 },
			{ "30Rnd_556x45_Stanag", "", 150 },
			{ "30Rnd_556x45_Stanag", "", 150 },
			{ "30Rnd_65x39_caseless_mag", "", 200 }
        };
		accs[] = {
			{ "optic_MRD", "", 2500, -1 },
			{ "optic_ACO_grn_smg", "", 2500, -1 },
			{ "optic_Holosight_smg", "", 10000, -1 },
			{ "optic_MRCO", "", 10000, -1 },

			{ "acc_flashlight", "", 1000, -1 }
        };
    };
	    
	class zolnierz {
        name = "Zolnierz";
        side = "civ";
        license = "zolnierz";
        level[] = { "", "", -1, "" };
        items[] = {
            { "hgun_ACPC2_F", "", 90000, -1 },
            { "hgun_Pistol_heavy_01_MRD_F", "", 90000, -1 },
            { "hgun_Pistol_heavy_02_F", "", 90000, -1 },
            { "hgun_Rook40_F", "", 90000, -1 },
            { "arifle_AKS_F", "", 98000, -1 },
			{ "SMG_01_F", "", 96000, -1 },
			{ "SMG_02_F", "", 90000, -1 },
		    { "SMG_05_F", "", 90000, -1 },
			{ "arifle_SDAR_F", "", 98000, -1 },
            { "arifle_TRG20_F", "", 95000, -1 },
			{ "arifle_TRG21_F", "", 90000, -1 },
            { "arifle_Mk20_F", "", 56000, -1 },
			{ "arifle_Mk20C_F", "", 45000, -1 },
			{ "arifle_MXM_Black_F", "", 400000, -1 },
			{ "arifle_MX_F", "", 400000, -1 },
			{ "arifle_MX_SW_F", "", 189000, -1 },
			{ "arifle_MXC_Black_F", "", 149000, -1 },
			{ "arifle_MXC_F", "", 149000, -1 },
			{ "arifle_AKM_F", "", 450000, -1 },
			{ "srifle_DMR_07_blk_F", "", 420000, -1 },
			{ "srifle_DMR_01_F", "", 465000, -1 },
			{ "arifle_SPAR_03_blk_F", "", 380000, -1 },
			{ "srifle_DMR_03_F", "", 380000, -1 },
			{ "srifle_DMR_03_khaki_F", "", 380000, -1 },
			{ "srifle_DMR_03_tan_F", "", 380000, -1 },
			{ "srifle_DMR_03_multicam_F", "", 380000, -1 },
			{ "srifle_DMR_03_woodland_F", "", 380000, -1 },
			{ "arifle_Katiba_C_F", "", 400000, -1 },
			{ "arifle_Katiba_F", "", 400000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 404000, -1 },
			{ "arifle_CTAR_blk_F", "", 422000, -1 },
			{ "arifle_Katiba_F", "", 402000, -1 },
			{ "arifle_AK12_F", "", 450000, -1 },
			{ "arifle_SPAR_02_blk_F", "", 400000, -1 },
			{ "arifle_CTARS_blk_F", "", 400000, -1 },
			{ "LMG_03_F", "", 200000, -1 },
			{ "LMG_Mk200_F", "", 510000, -1 },
			{ "srifle_DMR_06_camo_F", "", 600000, -1 },
            { "launch_RPG7_F", "", 440000, -1 },

			{ "Binocular", "", 400, -1 },
            { "ItemGPS", "", 200, -1 },
            { "ItemMap", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "FirstAidKit", "", 400, -1 },
            { "NVGoggles", "", 10000, -1 },
			{ "NVGoggles_tna_F", "", 10000, -1 },
            { "Chemlight_red", "", 1000, -1 },
            { "Chemlight_yellow", "", 1000, -1 },
            { "Chemlight_green", "", 1000, -1 },
            { "Chemlight_blue", "", 1000, -1 },
			{ "SmokeShell", "", 2000, -1 }
        };
        mags[] = {
            { "30Rnd_545x39_Mag_F", "", 1400 },
            { "9Rnd_45ACP_Mag", "", 100 },
            { "11Rnd_45ACP_Mag", "", 100 },
            { "6Rnd_45ACP_Cylinder", "", 100 },
            { "16Rnd_9x21_Mag", "", 100 },
            { "20Rnd_556x45_UW_mag", "", 1400 },
            { "30Rnd_9x21_Mag_SMG_02", "", 1400 },
            { "30Rnd_9x21_Mag", "", 1400 },
            { "30Rnd_556x45_Stanag", "", 1750 },
			{ "30Rnd_65x39_caseless_mag_Tracer", "", 2800 },
			{ "20Rnd_650x39_Cased_Mag_F", "", 2800 },
			{ "30Rnd_65x39_caseless_green", "", 2800 },
			{ "30Rnd_65x39_caseless_green_mag_Tracer", "", 2800 },
			{ "10Rnd_762x54_Mag", "", 2100 },
			{ "20Rnd_762x51_Mag", "", 4200 },
			{ "10Rnd_338_Mag", "", 4900 },
            { "30Rnd_580x42_Mag_Tracer_F", "", 2100 },
			{ "30Rnd_762x39_Mag_F", "", 2100 },
			{ "30Rnd_762x39_Mag_Tracer_Green_F", "", 3500 },
            { "100Rnd_580x42_Mag_Tracer_F", "", 4900 },
			{ "200Rnd_556x45_Box_Tracer_F", "", 4900 },
			{ "100Rnd_65x39_caseless_mag_Tracer", "", 4900 },
			{ "200Rnd_65x39_cased_Box_Tracer", "", 4900 },
			{ "3Rnd_Smoke_Grenade_shell", "", 10900 },
			{ "150Rnd_762x54_Box_Tracer", "", 4900 },
			{ "20Rnd_762x51_Mag", "", 4999 },
			{ "RPG7_F", "", 250000 }
        };
		accs[] = {
			{ "optic_Aco", "", 1750, -1 },
			{ "optic_Aco_smg", "", 1750, -1 },
			{ "optic_Holosight", "", 4900, -1 },
			{ "optic_MRCO", "", 10500, -1 },
			{ "optic_Arco", "", 11000, -1 },
			{ "optic_ERCO_blk_F", "", 11000, -1 },
			{ "optic_Hamr", "", 11000, -1 },
			{ "optic_DMS", "", 32000, -1 },
			{ "optic_KHS_old", "", 30000, -1 },
			{ "optic_KHS_blk", "", 300000, -1 },

			{ "bipod_02_F_blk", "", 30500, -1 },
			{ "acc_pointer_IR", "", 9900, -1 },
			{ "acc_flashlight", "", 7000, -1 }
        };
    };

    class rebel {
        name = "Rebeliant";
        side = "civ";
        license = "rebel";
        level[] = { "", "", -1, "" };
        items[] = {
            { "arifle_AKS_F", "", 100000, -1 },
			{ "arifle_SDAR_F", "", 50000, -1 },
			{ "SMG_01_F", "", 50000, -1 },
			{ "SMG_02_F", "", 40000, -1 },
			{ "SMG_05_F", "", 40000, -1 },
			{ "arifle_MXM_F", "", 70000, -1 },

			{ "Binocular", "", 400, -1 },
            { "ItemGPS", "", 200, -1 },
            { "ItemMap", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "FirstAidKit", "", 400, -1 },
            { "NVGoggles", "", 5000, -1 },
            { "Chemlight_red", "", 1000, -1 },
            { "Chemlight_yellow", "", 1000, -1 },
            { "Chemlight_green", "", 1000, -1 },
            { "Chemlight_blue", "", 1000, -1 },
			{ "SmokeShell", "", 2000, -1 }
        };
        mags[] = {
            { "30Rnd_545x39_Mag_F", "", 2000 },
            { "20Rnd_556x45_UW_mag", "", 2000 },
            { "30Rnd_9x21_Mag_SMG_02", "", 2000 },
            { "30Rnd_9x21_Mag", "", 2000 },
            { "30Rnd_45ACP_Mag_SMG_01", "", 2000 },
			{ "30Rnd_545x39_Mag_F", "", 400 }
        };
		accs[] = {
			{ "optic_Aco", "", 2500, -1 },
			{ "optic_Aco_smg", "", 2500, -1 },

			{ "acc_flashlight", "", 1000, -1 }
        };
    };

    class adv_rebel {
        name = "Zw. Rebeliant";
        side = "civ";
        license = "adv_rebel";
        level[] = { "", "", -1, "" };
        items[] = {
            { "arifle_AKS_F", "", 100000, -1 },
			{ "SMG_01_F", "", 50000, -1 },
			{ "SMG_02_F", "", 40000, -1 },
			{ "SMG_05_F", "", 40000, -1 },
			{ "arifle_SDAR_F", "", 50000, -1 },
            { "arifle_TRG20_F", "", 80000, -1 },
			{ "arifle_TRG21_F", "", 100000, -1 },
            { "arifle_Mk20_F", "", 100000, -1 },
			{ "arifle_Mk20C_F", "", 80000, -1 },


			{ "Binocular", "", 400, -1 },
            { "ItemGPS", "", 200, -1 },
            { "ItemMap", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "FirstAidKit", "", 400, -1 },
            { "NVGoggles", "", 5000, -1 },
            { "Chemlight_red", "", 1000, -1 },
            { "Chemlight_yellow", "", 1000, -1 },
            { "Chemlight_green", "", 1000, -1 },
            { "Chemlight_blue", "", 1000, -1 },
			{ "SmokeShell", "", 2000, -1 }
        };
        mags[] = {
            { "30Rnd_545x39_Mag_F", "", 2000 },
            { "20Rnd_556x45_UW_mag", "", 2000 },
            { "30Rnd_9x21_Mag_SMG_02", "", 2000 },
            { "30Rnd_9x21_Mag", "", 2000 },
            { "30Rnd_556x45_Stanag", "", 2500 }
        };
		accs[] = {
			{ "optic_Aco", "", 2500, -1 },
			{ "optic_Aco_smg", "", 2500, -1 },
			{ "optic_Holosight", "", 10000, -1 },

			{ "bipod_02_F_blk", "", 15000, -1 },
			{ "acc_pointer_IR", "", 10000, -1 },
			{ "acc_flashlight", "", 1000, -1 }
        };
    };

    class don1 {
        name = "Donatorka 1";
        side = "civ";
        license = "don1";
        level[] = { "", "", -1, "" };
        items[] = {
            { "arifle_AKS_F", "", 80000, -1 },
			{ "SMG_01_F", "", 55000, -1 },
			{ "SMG_02_F", "", 46000, -1 },
			{ "SMG_05_F", "", 46000, -1 },
			{ "arifle_SDAR_F", "", 50000, -1 },
            { "arifle_TRG20_F", "", 72000, -1 },
			{ "arifle_TRG21_F", "", 90000, -1 },
            { "arifle_Mk20_F", "", 96000, -1 },
			{ "arifle_Mk20C_F", "", 80000, -1 },
			{ "arifle_MXM_F", "", 200000, -1 },
			{ "arifle_MXM_Black_F", "", 200000, -1 },
			{ "arifle_MXM_khk_F", "", 200000, -1 },
			{ "srifle_DMR_07_blk_F", "", 240000, -1 },
			{ "srifle_DMR_07_hex_F", "", 240000, -1 },
			{ "srifle_DMR_07_ghex_F", "", 240000, -1 },
			{ "arifle_Katiba_C_F", "", 200000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 242000, -1 },
			{ "arifle_SPAR_01_khk_F", "", 242000, -1 },
			{ "arifle_SPAR_01_snd_F", "", 242000, -1 },
			{ "arifle_CTAR_blk_F", "", 256000, -1 },
			{ "arifle_CTAR_hex_F", "", 256000, -1 },
			{ "arifle_CTAR_ghex_F", "", 256000, -1 },
			{ "arifle_SPAR_02_blk_F", "", 120000, -1 },
			{ "arifle_SPAR_02_khk_F", "", 120000, -1 },
			{ "arifle_SPAR_02_snd_F", "", 120000, -1 },
			{ "arifle_CTARS_blk_F", "", 200000, -1 },
			{ "arifle_CTARS_hex_F", "", 200000, -1 },
			{ "arifle_CTARS_ghex_F", "", 200000, -1 },


			{ "Binocular", "", 460, -1 },
            { "ItemGPS", "", 180, -1 },
            { "ItemMap", "", 90, -1 },
            { "ItemCompass", "", 90, -1 },
            { "ItemWatch", "", 90, -1 },
            { "FirstAidKit", "", 460, -1 },
			{ "Medikit", "", 2000, -1 },
            { "NVGoggles", "", 2000, -1 },
            { "Chemlight_red", "", 900, -1 },
            { "Chemlight_yellow", "", 900, -1 },
            { "Chemlight_green", "", 900, -1 },
            { "Chemlight_blue", "", 900, -1 },
			{ "SmokeShell", "", 1800, -1 }
        };
        mags[] = {
            { "30Rnd_545x39_Mag_F", "", 1800 },
            { "20Rnd_556x45_UW_mag", "", 1800 },
            { "30Rnd_9x21_Mag_SMG_02", "", 1800 },
            { "30Rnd_9x21_Mag", "", 1800 },
            { "30Rnd_556x45_Stanag", "", 2250 },
			{ "30Rnd_65x39_caseless_mag_Tracer", "", 3600 },
			{ "20Rnd_650x39_Cased_Mag_F", "", 3600 },
            { "30Rnd_580x42_Mag_Tracer_F", "", 2700 },
			{ "150Rnd_556x45_Drum_Mag_Tracer_F", "", 6300 },
            { "100Rnd_580x42_Mag_Tracer_F", "", 6300 }
        };
		accs[] = {
			{ "optic_Aco", "", 2250, -1 },
			{ "optic_Aco_smg", "", 2250, -1 },
			{ "optic_Holosight", "", 9000, -1 },
			{ "optic_MRCO", "", 13500, -1 },

			{ "bipod_02_F_blk", "", 13500, -1 },
			{ "acc_pointer_IR", "", 9000, -1 },
			{ "acc_flashlight", "", 900, -1 }
        };
    };

    class don2 {
        name = "Donatorka 2";
        side = "civ";
        license = "don2";
        level[] = { "", "", -1, "" };
        items[] = {
            { "arifle_AKS_F", "", 70000, -1 },
			{ "SMG_01_F", "", 40000, -1 },
			{ "SMG_02_F", "", 32000, -1 },
			{ "SMG_05_F", "", 32000, -1 },
			{ "arifle_SDAR_F", "", 40000, -1 },
            { "arifle_TRG20_F", "", 64000, -1 },
			{ "arifle_TRG21_F", "", 80000, -1 },
            { "arifle_Mk20_F", "", 84000, -1 },
			{ "arifle_Mk20C_F", "", 70000, -1 },
			{ "arifle_MXM_F", "", 175000, -1 },
			{ "arifle_MXM_Black_F", "", 175000, -1 },
			{ "arifle_MXM_khk_F", "", 175000, -1 },
			{ "srifle_DMR_07_blk_F", "", 210000, -1 },
			{ "srifle_DMR_07_hex_F", "", 210000, -1 },
			{ "srifle_DMR_07_ghex_F", "", 210000, -1 },
			{ "srifle_DMR_01_F", "", 262500, -1 },
			{ "srifle_EBR_F", "", 315000, -1 },
			{ "arifle_SPAR_03_blk_F", "", 294000, -1 },
			{ "arifle_SPAR_03_khk_F", "", 294000, -1 },
			{ "arifle_SPAR_03_snd_F", "", 294000, -1 },
			{ "srifle_DMR_03_F", "", 420000, -1 },
			{ "srifle_DMR_03_khaki_F", "", 420000, -1 },
			{ "srifle_DMR_03_tan_F", "", 420000, -1 },
			{ "srifle_DMR_03_multicam_F", "", 420000, -1 },
			{ "srifle_DMR_03_woodland_F", "", 420000, -1 },
			{ "arifle_Katiba_C_F", "", 175000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 203000, -1 },
			{ "arifle_SPAR_01_khk_F", "", 203000, -1 },
			{ "arifle_SPAR_01_snd_F", "", 203000, -1 },
			{ "arifle_CTAR_blk_F", "", 224000, -1 },
			{ "arifle_CTAR_hex_F", "", 224000, -1 },
			{ "arifle_CTAR_ghex_F", "", 224000, -1 },
			{ "arifle_Katiba_F", "", 189000, -1 },
			{ "arifle_AKM_F", "", 280000, -1 },
			{ "arifle_SPAR_02_blk_F", "", 105000, -1 },
			{ "arifle_SPAR_02_khk_F", "", 105000, -1 },
			{ "arifle_SPAR_02_snd_F", "", 105000, -1 },
			{ "arifle_CTARS_blk_F", "", 175000, -1 },
			{ "arifle_CTARS_hex_F", "", 175000, -1 },
			{ "arifle_CTARS_ghex_F", "", 175000, -1 },
			{ "LMG_03_F", "", 245000, -1 },
			{ "arifle_MX_SW_F", "", 210000, -1 },
			{ "LMG_Mk200_F", "", 280000, -1 },


			{ "Binocular", "", 320, -1 },
            { "ItemGPS", "", 160, -1 },
            { "ItemMap", "", 80, -1 },
            { "ItemCompass", "", 80, -1 },
            { "ItemWatch", "", 80, -1 },
            { "FirstAidKit", "", 320, -1 },
			{ "Medikit", "", 2000, -1 },
            { "NVGoggles", "", 8000, -1 },
            { "Chemlight_red", "", 800, -1 },
            { "Chemlight_yellow", "", 800, -1 },
            { "Chemlight_green", "", 800, -1 },
            { "Chemlight_blue", "", 800, -1 },
			{ "SmokeShell", "", 1600, -1 }
        };
        mags[] = {
            { "30Rnd_545x39_Mag_F", "", 1600 },
            { "20Rnd_556x45_UW_mag", "", 1600 },
            { "30Rnd_9x21_Mag_SMG_02", "", 1600 },
            { "30Rnd_9x21_Mag", "", 1600 },
            { "30Rnd_556x45_Stanag", "", 2000 },
			{ "30Rnd_65x39_caseless_mag_Tracer", "", 3200 },
			{ "20Rnd_650x39_Cased_Mag_F", "", 3200 },
			{ "10Rnd_762x54_Mag", "", 2400 },
			{ "20Rnd_762x51_Mag", "", 4800 },
            { "30Rnd_580x42_Mag_Tracer_F", "", 2400 },
			{ "30Rnd_762x39_Mag_F", "", 2400 },
            { "150Rnd_556x45_Drum_Mag_Tracer_F", "", 5600 },
            { "100Rnd_580x42_Mag_Tracer_F", "", 5600 },
			{ "200Rnd_556x45_Box_Tracer_F", "", 5600 },
			{ "100Rnd_65x39_caseless_mag_Tracer", "", 5600 },
			{ "200Rnd_65x39_cased_Box_Tracer", "", 8000 }
        };
		accs[] = {
			{ "optic_Aco", "", 2000, -1 },
			{ "optic_Aco_smg", "", 2000, -1 },
			{ "optic_Holosight", "", 8000, -1 },
			{ "optic_MRCO", "", 12000, -1 },
			{ "optic_Arco", "", 24000, -1 },
			{ "optic_ERCO_blk_F", "", 24000, -1 },
			{ "optic_Hamr", "", 24000, -1 },
			{ "optic_DMS", "", 80000, -1 },
			{ "optic_MRCO", "", 28000, -1 },

			{ "bipod_02_F_blk", "", 12000, -1 },
			{ "acc_pointer_IR", "", 6400, -1 },
			{ "acc_flashlight", "", 800, -1 }
        };
    };

    class don3 {
        name = "Donatorka 3";
        side = "civ";
        license = "don3";
        level[] = { "", "", -1, "" };
        items[] = {
            { "arifle_AKS_F", "", 60000, -1 },
			{ "SMG_01_F", "", 35000, -1 },
			{ "SMG_02_F", "", 28000, -1 },
			{ "SMG_05_F", "", 28000, -1 },
			{ "arifle_SDAR_F", "", 35000, -1 },
            { "arifle_TRG20_F", "", 56000, -1 },
			{ "arifle_TRG21_F", "", 70000, -1 },
            { "arifle_Mk20_F", "", 72000, -1 },
			{ "arifle_Mk20C_F", "", 60000, -1 },
			{ "arifle_MXM_F", "", 150000, -1 },
			{ "arifle_MXM_Black_F", "", 150000, -1 },
			{ "arifle_MXM_khk_F", "", 150000, -1 },
			{ "srifle_DMR_07_blk_F", "", 180000, -1 },
			{ "srifle_DMR_07_hex_F", "", 180000, -1 },
			{ "srifle_DMR_07_ghex_F", "", 180000, -1 },
			{ "srifle_DMR_01_F", "", 225000, -1 },
			{ "srifle_EBR_F", "", 270000, -1 },
			{ "arifle_SPAR_03_blk_F", "", 252000, -1 },
			{ "arifle_SPAR_03_khk_F", "", 252000, -1 },
			{ "arifle_SPAR_03_snd_F", "", 252000, -1 },
			{ "srifle_DMR_03_F", "", 252000, -1 },
			{ "srifle_DMR_03_khaki_F", "", 252000, -1 },
			{ "srifle_DMR_03_tan_F", "", 252000, -1 },
			{ "srifle_DMR_03_multicam_F", "", 252000, -1 },
			{ "srifle_DMR_03_woodland_F", "", 252000, -1 },
			{ "arifle_Katiba_C_F", "", 150000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 174000, -1 },
			{ "arifle_SPAR_01_khk_F", "", 174000, -1 },
			{ "arifle_SPAR_01_snd_F", "", 174000, -1 },
			{ "arifle_CTAR_blk_F", "", 192000, -1 },
			{ "arifle_CTAR_hex_F", "", 192000, -1 },
			{ "arifle_CTAR_ghex_F", "", 192000, -1 },
			{ "arifle_Katiba_F", "", 162000, -1 },
			{ "arifle_AKM_F", "", 240000, -1 },
			{ "arifle_AK12_F", "", 210000, -1 },
			{ "arifle_MX_F", "", 150000, -1 },
			{ "arifle_SPAR_02_blk_F", "", 150000, -1 },
			{ "arifle_SPAR_02_khk_F", "", 150000, -1 },
			{ "arifle_SPAR_02_snd_F", "", 150000, -1 },
			{ "arifle_CTARS_blk_F", "", 150000, -1 },
			{ "arifle_CTARS_hex_F", "", 150000, -1 },
			{ "arifle_CTARS_ghex_F", "", 150000, -1 },
			{ "LMG_03_F", "", 210000, -1 },
			{ "arifle_MX_SW_F", "", 189000, -1 },
			{ "LMG_Mk200_F", "", 240000, -1 },
			{ "LMG_Zafir_F", "", 390000, -1 },
            { "launch_RPG7_F", "", 240000, -1 },


			{ "Binocular", "", 280, -1 },
            { "ItemGPS", "", 140, -1 },
            { "ItemMap", "", 70, -1 },
            { "ItemCompass", "", 70, -1 },
            { "ItemWatch", "", 70, -1 },
            { "FirstAidKit", "", 280, -1 },
            { "Medikit", "", 2000, -1 },
            { "NVGoggles", "", 7000, -1 },
            { "Chemlight_red", "", 700, -1 },
            { "Chemlight_yellow", "", 700, -1 },
            { "Chemlight_green", "", 700, -1 },
            { "Chemlight_blue", "", 700, -1 },
			{ "SmokeShell", "", 1400, -1 }
        };
        mags[] = {
            { "30Rnd_545x39_Mag_F", "", 1400 },
            { "20Rnd_556x45_UW_mag", "", 1400 },
            { "30Rnd_9x21_Mag_SMG_02", "", 1400 },
            { "30Rnd_9x21_Mag", "", 1400 },
            { "30Rnd_556x45_Stanag", "", 1750 },
			{ "30Rnd_65x39_caseless_mag_Tracer", "", 2800 },
			{ "20Rnd_650x39_Cased_Mag_F", "", 2800 },
			{ "10Rnd_762x54_Mag", "", 2100 },
			{ "20Rnd_762x51_Mag", "", 4200 },
			{ "10Rnd_338_Mag", "", 4900 },
            { "30Rnd_580x42_Mag_Tracer_F", "", 2100 },
			{ "30Rnd_762x39_Mag_F", "", 2100 },
			{ "30Rnd_762x39_Mag_Tracer_Green_F", "", 3500 },
            { "150Rnd_556x45_Drum_Mag_Tracer_F", "", 4900 },
            { "100Rnd_580x42_Mag_Tracer_F", "", 4900 },
			{ "200Rnd_556x45_Box_Tracer_F", "", 4900 },
			{ "100Rnd_65x39_caseless_mag_Tracer", "", 4900 },
			{ "200Rnd_65x39_cased_Box_Tracer", "", 4900 },
			{ "150Rnd_762x54_Box_Tracer", "", 4900 },
			{ "RPG7_F", "", 210000 }
        };
		accs[] = {
			{ "optic_Aco", "", 1750, -1 },
			{ "optic_Aco_smg", "", 1750, -1 },
			{ "optic_Holosight", "", 4900, -1 },
			{ "optic_MRCO", "", 10500, -1 },
			{ "optic_Arco", "", 21000, -1 },
			{ "optic_ERCO_blk_F", "", 21000, -1 },
			{ "optic_Hamr", "", 21000, -1 },
			{ "optic_DMS", "", 42000, -1 },
			{ "optic_KHS_old", "", 70000, -1 },
			{ "optic_KHS_blk", "", 150000, -1 },
			{ "muzzle_snds_H", "", 210000, -1 },
			{ "muzzle_snds_L", "", 210000, -1 },
			{ "muzzle_snds_M", "", 210000, -1 },
			{ "muzzle_snds_B", "", 210000, -1 },
			{ "muzzle_snds_H_MG", "", 210000, -1 },
			{ "muzzle_snds_93mmg", "", 210000, -1 },
			{ "muzzle_snds_58_blk_F", "", 210000, -1 },

			{ "bipod_02_F_blk", "", 10500, -1 },
			{ "acc_pointer_IR", "", 4900, -1 },
			{ "acc_flashlight", "", 700, -1 }
        };
    };
	class don4 {
        name = "Donatorka 4";
        side = "civ";
        license = "don4";
        level[] = { "", "", -1, "" };
        items[] = {
            { "hgun_ACPC2_F", "", 20000, -1 },
            { "hgun_Pistol_heavy_01_MRD_F", "", 20000, -1 },
            { "hgun_Pistol_heavy_02_F", "", 20000, -1 },
            { "hgun_Rook40_F", "", 20000, -1 },
            { "arifle_AKS_F", "", 48000, -1 },
			{ "SMG_01_F", "", 28000, -1 },
			{ "SMG_02_F", "", 20000, -1 },
			{ "SMG_05_F", "", 20000, -1 },
			{ "arifle_SDAR_F", "", 28000, -1 },
            { "arifle_TRG20_F", "", 45000, -1 },
			{ "arifle_TRG21_F", "", 60000, -1 },
            { "arifle_Mk20_F", "", 58000, -1 },
			{ "arifle_Mk20C_F", "", 45000, -1 },
			{ "arifle_MXM_F", "", 100000, -1 },
			{ "arifle_MXM_Black_F", "", 100000, -1 },
			{ "arifle_MXM_khk_F", "", 100000, -1 },
			{ "srifle_DMR_07_blk_F", "", 120000, -1 },
			{ "srifle_DMR_07_hex_F", "", 120000, -1 },
			{ "srifle_DMR_07_ghex_F", "", 120000, -1 },
			{ "srifle_DMR_01_F", "", 165000, -1 },
			{ "srifle_EBR_F", "", 200000, -1 },
			{ "arifle_SPAR_03_blk_F", "", 182000, -1 },
			{ "arifle_SPAR_03_khk_F", "", 182000, -1 },
			{ "arifle_SPAR_03_snd_F", "", 182000, -1 },
			{ "srifle_DMR_03_F", "", 182000, -1 },
			{ "srifle_DMR_03_khaki_F", "", 182000, -1 },
			{ "srifle_DMR_03_tan_F", "", 182000, -1 },
			{ "srifle_DMR_03_multicam_F", "", 182000, -1 },
			{ "srifle_DMR_03_woodland_F", "", 182000, -1 },
			{ "arifle_Katiba_C_F", "", 100000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 104000, -1 },
			{ "arifle_SPAR_01_khk_F", "", 104000, -1 },
			{ "arifle_SPAR_01_snd_F", "", 104000, -1 },
			{ "arifle_CTAR_blk_F", "", 122000, -1 },
			{ "arifle_CTAR_hex_F", "", 122000, -1 },
			{ "arifle_CTAR_ghex_F", "", 122000, -1 },
			{ "arifle_Katiba_F", "", 102000, -1 },
			{ "arifle_AKM_F", "", 170000, -1 },
			{ "arifle_AK12_F", "", 170000, -1 },
			{ "arifle_MX_F", "", 100000, -1 },
			{ "arifle_SPAR_02_blk_F", "", 100000, -1 },
			{ "arifle_SPAR_02_khk_F", "", 100000, -1 },
			{ "arifle_SPAR_02_snd_F", "", 100000, -1 },
			{ "arifle_CTARS_blk_F", "", 100000, -1 },
			{ "arifle_CTARS_hex_F", "", 100000, -1 },
			{ "arifle_CTARS_ghex_F", "", 100000, -1 },
			{ "srifle_DMR_02_F", "", 600000, -1 },
			{ "LMG_03_F", "", 210000, -1 },
			{ "arifle_MX_SW_F", "", 189000, -1 },
			{ "LMG_Mk200_F", "", 240000, -1 },
			{ "LMG_Zafir_F", "", 390000, -1 },
			{ "srifle_DMR_05_tan_f", "", 350000, -1 },
			{ "srifle_DMR_06_camo_F", "", 400000, -1 },
            { "launch_RPG7_F", "", 240000, -1 },


			{ "Binocular", "", 280, -1 },
            { "ItemGPS", "", 140, -1 },
            { "ItemMap", "", 70, -1 },
            { "ItemCompass", "", 70, -1 },
            { "ItemWatch", "", 70, -1 },
            { "FirstAidKit", "", 280, -1 },
            { "Medikit", "", 1000, -1 },
            { "NVGoggles", "", 7000, -1 },
            { "Chemlight_red", "", 700, -1 },
            { "Chemlight_yellow", "", 700, -1 },
            { "Chemlight_green", "", 700, -1 },
            { "Chemlight_blue", "", 700, -1 },
			{ "SmokeShell", "", 1400, -1 }
        };
        mags[] = {
            { "30Rnd_545x39_Mag_F", "", 1400 },
            { "9Rnd_45ACP_Mag", "", 100 },
            { "11Rnd_45ACP_Mag", "", 100 },
            { "6Rnd_45ACP_Cylinder", "", 100 },
            { "16Rnd_9x21_Mag", "", 100 },
            { "20Rnd_556x45_UW_mag", "", 1400 },
            { "30Rnd_9x21_Mag_SMG_02", "", 1400 },
            { "30Rnd_9x21_Mag", "", 1400 },
            { "30Rnd_556x45_Stanag", "", 1750 },
			{ "30Rnd_65x39_caseless_mag_Tracer", "", 2800 },
			{ "20Rnd_650x39_Cased_Mag_F", "", 2800 },
			{ "10Rnd_762x54_Mag", "", 2100 },
			{ "20Rnd_762x51_Mag", "", 4200 },
			{ "10Rnd_338_Mag", "", 4900 },
            { "30Rnd_580x42_Mag_Tracer_F", "", 2100 },
			{ "30Rnd_762x39_Mag_F", "", 2100 },
			{ "30Rnd_762x39_Mag_Tracer_Green_F", "", 3500 },
            { "150Rnd_556x45_Drum_Mag_Tracer_F", "", 4900 },
            { "100Rnd_580x42_Mag_Tracer_F", "", 4900 },
			{ "200Rnd_556x45_Box_Tracer_F", "", 4900 },
			{ "30Rnd_65x39_caseless_green", "", 5000 },
			{ "100Rnd_65x39_caseless_mag_Tracer", "", 4900 },
			{ "200Rnd_65x39_cased_Box_Tracer", "", 4900 },
			{ "150Rnd_762x54_Box_Tracer", "", 4900 },
			{ "10Rnd_93x64_DMR_05_Mag", "", 4900 },
			{ "20Rnd_762x51_Mag", "", 4999 },
			{ "RPG7_F", "", 150000 }
        };
		accs[] = {
			{ "optic_Aco", "", 1750, -1 },
			{ "optic_Aco_smg", "", 1750, -1 },
			{ "optic_Holosight", "", 4900, -1 },
			{ "optic_MRCO", "", 10500, -1 },
			{ "optic_Arco", "", 11000, -1 },
			{ "optic_ERCO_blk_F", "", 11000, -1 },
			{ "optic_Hamr", "", 11000, -1 },
			{ "optic_DMS", "", 32000, -1 },
			{ "optic_KHS_old", "", 50000, -1 },
			{ "optic_KHS_blk", "", 100000, -1 },
			{ "muzzle_snds_H", "", 10000, -1 },
			{ "muzzle_snds_L", "", 10000, -1 },
			{ "muzzle_snds_M", "", 10000, -1 },
			{ "muzzle_snds_B", "", 10000, -1 },
			{ "muzzle_snds_H_MG", "", 10000, -1 },
			{ "muzzle_snds_93mmg", "", 10000, -1 },
			{ "muzzle_snds_58_blk_F", "", 10000, -1 },

			{ "bipod_02_F_blk", "", 10500, -1 },
			{ "acc_pointer_IR", "", 4900, -1 },
			{ "acc_flashlight", "", 700, -1 }
        };
    };

    class reb_sniper1 {
        name = "Sniper LVL1";
        side = "civ";
        license = "reb_sniper1";
        level[] = { "", "", -1, "" };
        items[] = {
            { "arifle_AKS_F", "", 100000, -1 },
			{ "SMG_01_F", "", 50000, -1 },
			{ "SMG_02_F", "", 40000, -1 },
			{ "SMG_05_F", "", 40000, -1 },
			{ "arifle_SDAR_F", "", 75000, -1 },
            { "arifle_TRG20_F", "", 80000, -1 },
			{ "arifle_TRG21_F", "", 100000, -1 },
            { "arifle_Mk20_F", "", 120000, -1 },
			{ "arifle_Mk20C_F", "", 100000, -1 },
			{ "arifle_MXM_F", "", 250000, -1 },
			{ "arifle_MXM_Black_F", "", 250000, -1 },
			{ "arifle_MXM_khk_F", "", 250000, -1 },
			{ "srifle_DMR_07_blk_F", "", 300000, -1 },
			{ "srifle_DMR_07_hex_F", "", 300000, -1 },
			{ "srifle_DMR_07_ghex_F", "", 300000, -1 },

			{ "Binocular", "", 400, -1 },
            { "ItemGPS", "", 200, -1 },
            { "ItemMap", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "FirstAidKit", "", 400, -1 },
            { "NVGoggles", "", 5000, -1 },
            { "Chemlight_red", "", 1000, -1 },
            { "Chemlight_yellow", "", 1000, -1 },
            { "Chemlight_green", "", 1000, -1 },
            { "Chemlight_blue", "", 1000, -1 },
			{ "SmokeShell", "", 2000, -1 }
        };
        mags[] = {
            { "30Rnd_545x39_Mag_F", "", 2000 },
            { "20Rnd_556x45_UW_mag", "", 2000 },
            { "30Rnd_9x21_Mag_SMG_02", "", 2000 },
            { "30Rnd_9x21_Mag", "", 2000 },
            { "30Rnd_556x45_Stanag", "", 2500 },
			{ "30Rnd_65x39_caseless_mag_Tracer", "", 4000 },
			{ "20Rnd_650x39_Cased_Mag_F", "", 4000 }
        };
		accs[] = {
			{ "optic_Aco", "", 1750, -1 },
			{ "optic_Aco_smg", "", 1750, -1 },
			{ "optic_Holosight", "", 4900, -1 },
			{ "optic_MRCO", "", 10500, -1 },
			{ "optic_Arco", "", 11000, -1 },
			{ "optic_ERCO_blk_F", "", 11000, -1 },

			{ "bipod_02_F_blk", "", 15000, -1 },
			{ "acc_pointer_IR", "", 10000, -1 },
			{ "acc_flashlight", "", 1000, -1 }
        };
    };

    class reb_sniper2 {
        name = "Sniper LVL2";
        side = "civ";
        license = "reb_sniper2";
        level[] = { "", "", -1, "" };
        items[] = {
            { "arifle_AKS_F", "", 100000, -1 },
			{ "SMG_01_F", "", 50000, -1 },
			{ "SMG_02_F", "", 40000, -1 },
			{ "SMG_05_F", "", 40000, -1 },
			{ "arifle_SDAR_F", "", 75000, -1 },
            { "arifle_TRG20_F", "", 80000, -1 },
			{ "arifle_TRG21_F", "", 100000, -1 },
            { "arifle_Mk20_F", "", 120000, -1 },
			{ "arifle_Mk20C_F", "", 100000, -1 },
			{ "arifle_MXM_F", "", 250000, -1 },
			{ "arifle_MXM_Black_F", "", 250000, -1 },
			{ "arifle_MXM_khk_F", "", 250000, -1 },
			{ "srifle_DMR_07_blk_F", "", 300000, -1 },
			{ "srifle_DMR_07_hex_F", "", 300000, -1 },
			{ "srifle_DMR_07_ghex_F", "", 300000, -1 },
			{ "srifle_DMR_01_F", "", 375000, -1 },
			{ "srifle_EBR_F", "", 450000, -1 },
			{ "arifle_SPAR_03_blk_F", "", 420000, -1 },
			{ "arifle_SPAR_03_khk_F", "", 420000, -1 },
			{ "arifle_SPAR_03_snd_F", "", 420000, -1 },
			{ "srifle_DMR_06_camo_F", "", 600000, -1 },
			{ "srifle_DMR_06_olive_F", "", 600000, -1 },
			{ "srifle_DMR_06_camo_khs_F", "", 600000, -1 },

			{ "Binocular", "", 400, -1 },
            { "ItemGPS", "", 200, -1 },
            { "ItemMap", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "FirstAidKit", "", 400, -1 },
            { "NVGoggles", "", 5000, -1 },
            { "Chemlight_red", "", 1000, -1 },
            { "Chemlight_yellow", "", 1000, -1 },
            { "Chemlight_green", "", 1000, -1 },
            { "Chemlight_blue", "", 1000, -1 },
			{ "SmokeShell", "", 2000, -1 }
        };
        mags[] = {
            { "30Rnd_545x39_Mag_F", "", 2000 },
            { "20Rnd_556x45_UW_mag", "", 2000 },
            { "30Rnd_9x21_Mag_SMG_02", "", 2000 },
            { "30Rnd_9x21_Mag", "", 2000 },
            { "30Rnd_556x45_Stanag", "", 2500 },
			{ "30Rnd_65x39_caseless_mag_Tracer", "", 4000 },
			{ "20Rnd_650x39_Cased_Mag_F", "", 4000 },
			{ "10Rnd_762x54_Mag", "", 3000 },
			{ "20Rnd_762x51_Mag", "", 6000 }
        };
		accs[] = {
			{ "optic_Aco", "", 2500, -1 },
			{ "optic_Aco_smg", "", 2500, -1 },
			{ "optic_Holosight", "", 10000, -1 },
			{ "optic_MRCO", "", 15000, -1 },
			{ "optic_Arco", "", 30000, -1 },
			{ "optic_ERCO_blk_F", "", 30000, -1 },
			{ "optic_Hamr", "", 30000, -1 },
			{ "optic_DMS", "", 100000, -1 },

			{ "bipod_02_F_blk", "", 15000, -1 },
			{ "acc_pointer_IR", "", 10000, -1 },
			{ "acc_flashlight", "", 1000, -1 }
        };
    };

    class reb_sniper3 {
        name = "Sniper LVL3";
        side = "civ";
        license = "reb_sniper3";
        level[] = { "", "", -1, "" };
        items[] = {
            { "arifle_AKS_F", "", 100000, -1 },
			{ "SMG_01_F", "", 50000, -1 },
			{ "SMG_02_F", "", 40000, -1 },
			{ "SMG_05_F", "", 40000, -1 },
			{ "arifle_SDAR_F", "", 75000, -1 },
            { "arifle_TRG20_F", "", 80000, -1 },
			{ "arifle_TRG21_F", "", 100000, -1 },
            { "arifle_Mk20_F", "", 120000, -1 },
			{ "arifle_Mk20C_F", "", 100000, -1 },
			{ "arifle_MXM_F", "", 250000, -1 },
			{ "arifle_MXM_Black_F", "", 250000, -1 },
			{ "arifle_MXM_khk_F", "", 250000, -1 },
			{ "srifle_DMR_07_blk_F", "", 300000, -1 },
			{ "srifle_DMR_07_hex_F", "", 300000, -1 },
			{ "srifle_DMR_07_ghex_F", "", 300000, -1 },
			{ "srifle_DMR_01_F", "", 375000, -1 },
			{ "srifle_EBR_F", "", 450000, -1 },
			{ "arifle_SPAR_03_blk_F", "", 420000, -1 },
			{ "arifle_SPAR_03_khk_F", "", 420000, -1 },
			{ "arifle_SPAR_03_snd_F", "", 420000, -1 },
            { "srifle_DMR_03_F", "", 600000, -1 },
			{ "srifle_DMR_03_khaki_F", "", 600000, -1 },
			{ "srifle_DMR_03_tan_F", "", 600000, -1 },
			{ "srifle_DMR_03_multicam_F", "", 600000, -1 },
			{ "srifle_DMR_03_woodland_F", "", 600000, -1 },
			{ "srifle_DMR_02_sniper_F", "", 900000, -1 },

			{ "Binocular", "", 400, -1 },
            { "ItemGPS", "", 200, -1 },
            { "ItemMap", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "FirstAidKit", "", 400, -1 },
            { "NVGoggles", "", 5000, -1 },
            { "Chemlight_red", "", 1000, -1 },
            { "Chemlight_yellow", "", 1000, -1 },
            { "Chemlight_green", "", 1000, -1 },
            { "Chemlight_blue", "", 1000, -1 },
			{ "SmokeShell", "", 2000, -1 }
        };
        mags[] = {
            { "30Rnd_545x39_Mag_F", "", 2000 },
            { "20Rnd_556x45_UW_mag", "", 2000 },
            { "30Rnd_9x21_Mag_SMG_02", "", 2000 },
            { "30Rnd_9x21_Mag", "", 2000 },
            { "30Rnd_556x45_Stanag", "", 2500 },
			{ "30Rnd_65x39_caseless_mag_Tracer", "", 4000 },
			{ "20Rnd_650x39_Cased_Mag_F", "", 4000 },
			{ "10Rnd_762x54_Mag", "", 3000 },
			{ "20Rnd_762x51_Mag", "", 6000 },
			{ "10Rnd_338_Mag", "", 10000 }

        };
		accs[] = {
			{ "optic_Aco", "", 2500, -1 },
			{ "optic_Aco_smg", "", 2500, -1 },
			{ "optic_Holosight", "", 10000, -1 },
			{ "optic_MRCO", "", 15000, -1 },
			{ "optic_Arco", "", 30000, -1 },
			{ "optic_ERCO_blk_F", "", 30000, -1 },
			{ "optic_Hamr", "", 30000, -1 },
			{ "optic_DMS", "", 60000, -1 },
			{ "optic_KHS_old", "", 100000, -1 },
			{ "optic_KHS_blk", "", 150000, -1 },

			{ "bipod_02_F_blk", "", 15000, -1 },
			{ "acc_pointer_IR", "", 10000, -1 },
			{ "acc_flashlight", "", 1000, -1 }
        };
    };

    class reb_szturm1 {
        name = "Szturm LVL1";
        side = "civ";
        license = "reb_szturm1";
        level[] = { "", "", -1, "" };
        items[] = {
            { "arifle_AKS_F", "", 100000, -1 },
			{ "SMG_01_F", "", 50000, -1 },
			{ "SMG_02_F", "", 40000, -1 },
			{ "SMG_05_F", "", 40000, -1 },
			{ "arifle_SDAR_F", "", 75000, -1 },
            { "arifle_TRG20_F", "", 80000, -1 },
			{ "arifle_TRG21_F", "", 100000, -1 },
            { "arifle_Mk20_F", "", 120000, -1 },
			{ "arifle_Mk20C_F", "", 100000, -1 },
			{ "arifle_Katiba_C_F", "", 250000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 290000, -1 },
			{ "arifle_SPAR_01_khk_F", "", 290000, -1 },
			{ "arifle_SPAR_01_snd_F", "", 290000, -1 },
			{ "arifle_CTAR_blk_F", "", 320000, -1 },
			{ "arifle_CTAR_hex_F", "", 320000, -1 },
			{ "arifle_CTAR_ghex_F", "", 320000, -1 },

			{ "Binocular", "", 400, -1 },
            { "ItemGPS", "", 200, -1 },
            { "ItemMap", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "FirstAidKit", "", 400, -1 },
            { "NVGoggles", "", 5000, -1 },
            { "Chemlight_red", "", 1000, -1 },
            { "Chemlight_yellow", "", 1000, -1 },
            { "Chemlight_green", "", 1000, -1 },
            { "Chemlight_blue", "", 1000, -1 },
			{ "SmokeShell", "", 2000, -1 }
        };
        mags[] = {
            { "30Rnd_545x39_Mag_F", "", 2000 },
            { "20Rnd_556x45_UW_mag", "", 2000 },
            { "30Rnd_9x21_Mag_SMG_02", "", 2000 },
            { "30Rnd_9x21_Mag", "", 2000 },
            { "30Rnd_556x45_Stanag", "", 2000 },
            { "30Rnd_65x39_caseless_green_mag_Tracer", "", 3000 },
			{ "30Rnd_65x39_caseless_green", "", 5000 },
            { "30Rnd_580x42_Mag_Tracer_F", "", 3000 }

        };
		accs[] = {
			{ "optic_Aco", "", 1750, -1 },
			{ "optic_Aco_smg", "", 1750, -1 },
			{ "optic_Holosight", "", 4900, -1 },
			{ "optic_MRCO", "", 10500, -1 },
			{ "optic_Arco", "", 11000, -1 },
			{ "optic_ERCO_blk_F", "", 11000, -1 },

			{ "bipod_02_F_blk", "", 15000, -1 },
			{ "acc_pointer_IR", "", 10000, -1 },
			{ "acc_flashlight", "", 1000, -1 }
        };
    };

    class reb_szturm2 {
        name = "Szturm LVL2";
        side = "civ";
        license = "reb_szturm2";
        level[] = { "", "", -1, "" };
        items[] = {
            { "arifle_AKS_F", "", 100000, -1 },
			{ "SMG_01_F", "", 50000, -1 },
			{ "SMG_02_F", "", 40000, -1 },
			{ "SMG_05_F", "", 40000, -1 },
			{ "arifle_SDAR_F", "", 75000, -1 },
            { "arifle_TRG20_F", "", 80000, -1 },
			{ "arifle_TRG21_F", "", 120000, -1 },
            { "arifle_Mk20_F", "", 120000, -1 },
			{ "arifle_Mk20C_F", "", 100000, -1 },
			{ "arifle_Katiba_C_F", "", 200000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 290000, -1 },
			{ "arifle_SPAR_01_khk_F", "", 290000, -1 },
			{ "arifle_SPAR_01_snd_F", "", 290000, -1 },
			{ "arifle_CTAR_blk_F", "", 320000, -1 },
			{ "arifle_CTAR_hex_F", "", 320000, -1 },
			{ "arifle_CTAR_ghex_F", "", 320000, -1 },
			{ "arifle_Katiba_F", "", 270000, -1 },
			{ "arifle_AKM_F", "", 400000, -1 },

			{ "Binocular", "", 400, -1 },
            { "ItemGPS", "", 200, -1 },
            { "ItemMap", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "FirstAidKit", "", 400, -1 },
            { "NVGoggles", "", 5000, -1 },
            { "Chemlight_red", "", 1000, -1 },
            { "Chemlight_yellow", "", 1000, -1 },
            { "Chemlight_green", "", 1000, -1 },
            { "Chemlight_blue", "", 1000, -1 },
			{ "SmokeShell", "", 2000, -1 }
        };
        mags[] = {
            { "30Rnd_545x39_Mag_F", "", 2000 },
            { "20Rnd_556x45_UW_mag", "", 2000 },
            { "30Rnd_9x21_Mag_SMG_02", "", 2000 },
            { "30Rnd_9x21_Mag", "", 2000 },
            { "30Rnd_556x45_Stanag", "", 2000 },
            { "30Rnd_65x39_caseless_green_mag_Tracer", "", 3000 },
            { "30Rnd_580x42_Mag_Tracer_F", "", 3000 },
			{ "30Rnd_762x39_Mag_F", "", 3000 },
			{ "30Rnd_65x39_caseless_green", "", 5000 },
			{ "10Rnd_50BW_Mag_F", "", 3000 }

        };
		accs[] = {
			{ "optic_Aco", "", 1750, -1 },
			{ "optic_Aco_smg", "", 1750, -1 },
			{ "optic_Holosight", "", 4900, -1 },
			{ "optic_MRCO", "", 10500, -1 },
			{ "optic_Arco", "", 11000, -1 },
			{ "optic_ERCO_blk_F", "", 11000, -1 },
			{ "optic_Hamr", "", 11000, -1 },

			{ "bipod_02_F_blk", "", 100000, -1 },
			{ "acc_pointer_IR", "", 10000, -1 },
			{ "acc_flashlight", "", 1000, -1 }
        };
    };

    class reb_szturm3 {
        name = "Szturm LVL3";
        side = "civ";
        license = "reb_szturm3";
        level[] = { "", "", -1, "" };
        items[] = {
            { "arifle_AKS_F", "", 100000, -1 },
			{ "SMG_01_F", "", 50000, -1 },
			{ "SMG_02_F", "", 40000, -1 },
			{ "SMG_05_F", "", 40000, -1 },
			{ "arifle_SDAR_F", "", 75000, -1 },
            { "arifle_TRG20_F", "", 80000, -1 },
			{ "arifle_TRG21_F", "", 100000, -1 },
            { "arifle_Mk20_F", "", 120000, -1 },
			{ "arifle_Mk20C_F", "", 100000, -1 },
			{ "arifle_Katiba_C_F", "", 250000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 290000, -1 },
			{ "arifle_SPAR_01_khk_F", "", 290000, -1 },
			{ "arifle_SPAR_01_snd_F", "", 290000, -1 },
			{ "arifle_CTAR_blk_F", "", 320000, -1 },
			{ "arifle_CTAR_hex_F", "", 320000, -1 },
			{ "arifle_CTAR_ghex_F", "", 320000, -1 },
			{ "arifle_Katiba_F", "", 270000, -1 },
			{ "arifle_AKM_F", "", 400000, -1 },
			{ "arifle_AK12_F", "", 500000, -1 },
			{ "arifle_MX_F", "", 250000, -1 },

			{ "Binocular", "", 400, -1 },
            { "ItemGPS", "", 200, -1 },
            { "ItemMap", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "FirstAidKit", "", 400, -1 },
            { "NVGoggles", "", 5000, -1 },
            { "Chemlight_red", "", 1000, -1 },
            { "Chemlight_yellow", "", 1000, -1 },
            { "Chemlight_green", "", 1000, -1 },
            { "Chemlight_blue", "", 1000, -1 },
			{ "SmokeShell", "", 2000, -1 }
        };
        mags[] = {
            { "30Rnd_545x39_Mag_F", "", 2000 },
            { "20Rnd_556x45_UW_mag", "", 2000 },
            { "30Rnd_9x21_Mag_SMG_02", "", 2000 },
            { "30Rnd_9x21_Mag", "", 2000 },
            { "30Rnd_556x45_Stanag", "", 2000 },
			{ "30Rnd_65x39_caseless_mag", "", 5000 },
            { "30Rnd_580x42_Mag_Tracer_F", "", 3000 },
			{ "30Rnd_762x39_Mag_F", "", 3000 },
			{ "30Rnd_762x39_Mag_Tracer_Green_F", "", 5000 },
			{ "30Rnd_65x39_caseless_green", "", 5000 },
			{ "10Rnd_50BW_Mag_F", "", 3000 }
        };
		accs[] = {
			{ "optic_Aco", "", 2500, -1 },
			{ "optic_Aco_smg", "", 2500, -1 },
			{ "optic_Holosight", "", 10000, -1 },
			{ "optic_MRCO", "", 15000, -1 },
			{ "optic_Arco", "", 30000, -1 },
			{ "optic_ERCO_blk_F", "", 30000, -1 },
			{ "optic_Hamr", "", 30000, -1 },
			{ "optic_DMS", "", 60000, -1 },

			{ "bipod_02_F_blk", "", 100000, -1 },
			{ "acc_pointer_IR", "", 10000, -1 },
			{ "acc_flashlight", "", 1000, -1 }
        };
    };

    class reb_wsparcie1 {
        name = "Wsparcie LVL1";
        side = "civ";
        license = "reb_wsparcie1";
        level[] = { "", "", -1, "" };
        items[] = {
            { "arifle_AKS_F", "", 100000, -1 },
			{ "SMG_01_F", "", 50000, -1 },
			{ "SMG_02_F", "", 40000, -1 },
			{ "SMG_05_F", "", 40000, -1 },
			{ "arifle_SDAR_F", "", 75000, -1 },
            { "arifle_TRG20_F", "", 80000, -1 },
			{ "arifle_TRG21_F", "", 100000, -1 },
            { "arifle_Mk20_F", "", 120000, -1 },
			{ "arifle_Mk20C_F", "", 100000, -1 },
			{ "arifle_SPAR_02_blk_F", "", 150000, -1 },
			{ "arifle_SPAR_02_khk_F", "", 150000, -1 },
			{ "arifle_SPAR_02_snd_F", "", 150000, -1 },
			{ "arifle_CTARS_blk_F", "", 250000, -1 },
			{ "arifle_CTARS_hex_F", "", 250000, -1 },
			{ "arifle_CTARS_ghex_F", "", 250000, -1 },

			{ "Binocular", "", 400, -1 },
            { "ItemGPS", "", 200, -1 },
            { "ItemMap", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "FirstAidKit", "", 400, -1 },
            { "NVGoggles", "", 5000, -1 },
            { "Chemlight_red", "", 1000, -1 },
            { "Chemlight_yellow", "", 1000, -1 },
            { "Chemlight_green", "", 1000, -1 },
            { "Chemlight_blue", "", 1000, -1 },
			{ "SmokeShell", "", 2000, -1 }
        };
        mags[] = {
            { "30Rnd_545x39_Mag_F", "", 2000 },
            { "20Rnd_556x45_UW_mag", "", 2000 },
            { "30Rnd_9x21_Mag_SMG_02", "", 2000 },
            { "30Rnd_9x21_Mag", "", 2000 },
            { "30Rnd_556x45_Stanag", "", 2500 },
            { "150Rnd_556x45_Drum_Mag_Tracer_F", "", 7000 },
            { "100Rnd_580x42_Mag_Tracer_F", "", 7000 }
        };
		accs[] = {
			{ "optic_Aco", "", 2500, -1 },
			{ "optic_Aco_smg", "", 2500, -1 },
			{ "optic_Holosight", "", 10000, -1 },
			{ "optic_MRCO", "", 15000, -1 },

			{ "bipod_02_F_blk", "", 15000, -1 },
			{ "acc_pointer_IR", "", 10000, -1 },
			{ "acc_flashlight", "", 1000, -1 }
        };
    };

    class reb_wsparcie2 {
        name = "Wsparcie LVL2";
        side = "civ";
        license = "reb_wsparcie2";
        level[] = { "", "", -1, "" };
        items[] = {
            { "arifle_AKS_F", "", 100000, -1 },
			{ "SMG_01_F", "", 50000, -1 },
			{ "SMG_02_F", "", 40000, -1 },
			{ "SMG_05_F", "", 40000, -1 },
			{ "arifle_SDAR_F", "", 75000, -1 },
            { "arifle_TRG20_F", "", 80000, -1 },
			{ "arifle_TRG21_F", "", 100000, -1 },
            { "arifle_Mk20_F", "", 120000, -1 },
			{ "arifle_Mk20C_F", "", 100000, -1 },
			{ "arifle_SPAR_02_blk_F", "", 150000, -1 },
			{ "arifle_SPAR_02_khk_F", "", 150000, -1 },
			{ "arifle_SPAR_02_snd_F", "", 150000, -1 },
			{ "arifle_CTARS_blk_F", "", 250000, -1 },
			{ "arifle_CTARS_hex_F", "", 250000, -1 },
			{ "arifle_CTARS_ghex_F", "", 250000, -1 },
			{ "LMG_03_F", "", 350000, -1 },
			{ "arifle_MX_SW_F", "", 300000, -1 },
			{ "LMG_Mk200_F", "", 400000, -1 },

			{ "Binocular", "", 400, -1 },
            { "ItemGPS", "", 200, -1 },
            { "ItemMap", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "FirstAidKit", "", 400, -1 },
            { "NVGoggles", "", 5000, -1 },
            { "Chemlight_red", "", 1000, -1 },
            { "Chemlight_yellow", "", 1000, -1 },
            { "Chemlight_green", "", 1000, -1 },
            { "Chemlight_blue", "", 1000, -1 },
			{ "SmokeShell", "", 2000, -1 }
        };
        mags[] = {
            { "30Rnd_545x39_Mag_F", "", 2000 },
            { "20Rnd_556x45_UW_mag", "", 2000 },
            { "30Rnd_9x21_Mag_SMG_02", "", 2000 },
            { "30Rnd_9x21_Mag", "", 2000 },
            { "30Rnd_556x45_Stanag", "", 2500 },
            { "150Rnd_556x45_Drum_Mag_Tracer_F", "", 7000 },
            { "100Rnd_580x42_Mag_Tracer_F", "", 7000 },
			{ "200Rnd_556x45_Box_Tracer_F", "", 7000 },
			{ "100Rnd_65x39_caseless_mag_Tracer", "", 7000 },
			{ "200Rnd_65x39_cased_Box_Tracer", "", 10000 }

        };
		accs[] = {
			{ "optic_Aco", "", 2500, -1 },
			{ "optic_Aco_smg", "", 2500, -1 },
			{ "optic_Holosight", "", 10000, -1 },
			{ "optic_MRCO", "", 15000, -1 },
			{ "optic_Arco", "", 30000, -1 },
			{ "optic_ERCO_blk_F", "", 30000, -1 },

			{ "bipod_02_F_blk", "", 15000, -1 },
			{ "acc_pointer_IR", "", 10000, -1 },
			{ "acc_flashlight", "", 1000, -1 }
        };
    };

    class reb_wsparcie3 {
        name = "Wsparcie LVL3";
        side = "civ";
        license = "reb_wsparcie3";
        level[] = { "", "", -1, "" };
        items[] = {
            { "arifle_AKS_F", "", 100000, -1 },
			{ "SMG_01_F", "", 50000, -1 },
			{ "SMG_02_F", "", 40000, -1 },
			{ "SMG_05_F", "", 40000, -1 },
			{ "arifle_SDAR_F", "", 75000, -1 },
            { "arifle_TRG20_F", "", 80000, -1 },
			{ "arifle_TRG21_F", "", 100000, -1 },
            { "arifle_Mk20_F", "", 120000, -1 },
			{ "arifle_Mk20C_F", "", 100000, -1 },
			{ "arifle_SPAR_02_blk_F", "", 150000, -1 },
			{ "arifle_SPAR_02_khk_F", "", 150000, -1 },
			{ "arifle_SPAR_02_snd_F", "", 150000, -1 },
			{ "arifle_CTARS_blk_F", "", 250000, -1 },
			{ "arifle_CTARS_hex_F", "", 250000, -1 },
			{ "arifle_CTARS_ghex_F", "", 250000, -1 },
			{ "LMG_03_F", "", 350000, -1 },
			{ "arifle_MX_SW_F", "", 300000, -1 },
			{ "LMG_Mk200_F", "", 400000, -1 },
			{ "LMG_Zafir_F", "", 650000, -1 },
            { "launch_RPG7_F", "", 700000, -1 },

			{ "Binocular", "", 400, -1 },
            { "ItemGPS", "", 200, -1 },
            { "ItemMap", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "FirstAidKit", "", 400, -1 },
            { "NVGoggles", "", 5000, -1 },
            { "Chemlight_red", "", 1000, -1 },
            { "Chemlight_yellow", "", 1000, -1 },
            { "Chemlight_green", "", 1000, -1 },
            { "Chemlight_blue", "", 1000, -1 },
			{ "SmokeShell", "", 2000, -1 }
        };
        mags[] = {
            { "30Rnd_545x39_Mag_F", "", 2000 },
            { "20Rnd_556x45_UW_mag", "", 2000 },
            { "30Rnd_9x21_Mag_SMG_02", "", 2000 },
            { "30Rnd_9x21_Mag", "", 2000 },
            { "30Rnd_556x45_Stanag", "", 2500 },
            { "150Rnd_556x45_Drum_Mag_Tracer_F", "", 7000 },
            { "100Rnd_580x42_Mag_Tracer_F", "", 7000 },
			{ "200Rnd_556x45_Box_Tracer_F", "", 7000 },
			{ "100Rnd_65x39_caseless_mag_Tracer", "", 7000 },
			{ "200Rnd_65x39_cased_Box_Tracer", "", 10000 },
			{ "150Rnd_762x54_Box_Tracer", "", 10000 },
			{ "RPG7_F", "", 300000 }

        };
		accs[] = {
			{ "optic_Aco", "", 2500, -1 },
			{ "optic_Aco_smg", "", 2500, -1 },
			{ "optic_Holosight", "", 10000, -1 },
			{ "optic_MRCO", "", 15000, -1 },
			{ "optic_Arco", "", 30000, -1 },
			{ "optic_ERCO_blk_F", "", 30000, -1 },
			{ "optic_Hamr", "", 30000, -1 },

			{ "bipod_02_F_blk", "", 100000, -1 },
			{ "acc_pointer_IR", "", 10000, -1 },
			{ "acc_flashlight", "", 1000, -1 }
        };
    };

    class gang {
        name = "Kryjówka gangu";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "hgun_Pistol_heavy_02_F", "", 25000, -1 },
            { "hgun_ACPC2_F", "", 25000, -1 },
			{ "hgun_Rook40_F", "", 30000, -1 },
            { "hgun_PDW2000_F", "", 80000, -1 },

			{ "Binocular", "", 400, -1 },
            { "ItemGPS", "", 200, -1 },
            { "ItemMap", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "FirstAidKit", "", 400, -1 },
            { "NVGoggles", "", 5000, -1 },
            { "Chemlight_red", "", 1000, -1 },
            { "Chemlight_yellow", "", 1000, -1 },
            { "Chemlight_green", "", 1000, -1 },
            { "Chemlight_blue", "", 1000, -1 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 25 },
            { "6Rnd_45ACP_Cylinder", "", 50 },
            { "9Rnd_45ACP_Mag", "", 50 },
            { "30Rnd_9x21_Mag", "", 100 }
        };
		accs[] = {
			{ "optic_Aco", "", 2500, -1 },
			{ "optic_ACO_grn_smg", "", 2500, -1 },
			{ "optic_Aco_smg", "", 2500, -1 }
        };
    };

    //Basic Shops
    class genstore {
        name = "Sklep wielobranżowy";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "ItemGPS", "", 100, -1 },
            { "ItemMap", "", 50, -1 },
            { "ItemCompass", "", 50, -1 },
            { "ItemWatch", "", 50, -1 },
			{ "ItemRadio", "", 50, -1 },
            { "FirstAidKit", "", 200, -1 },
            { "NVGoggles", "", 6000, -1 },
            { "Chemlight_red", "", 500, -1 },
            { "Chemlight_yellow", "", 500, -1 },
            { "Chemlight_green", "", 500, -1 },
            { "Chemlight_blue", "", 500, -1 }
        };
        mags[] = {};
    };

    class f_station_store {
        name = "Stacja benzynowa";
        side = "";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "ItemGPS", "", 200, -1 },
            { "ItemMap", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "FirstAidKit", "", 400, -1 },
            { "NVGoggles", "", 5000, -1 },
            { "Chemlight_red", "", 1000, -1 },
            { "Chemlight_yellow", "", 1000, -1 },
            { "Chemlight_green", "", 1000, -1 },
            { "Chemlight_blue", "", 1000, -1 }
        };
        mags[] = {};
    };

    //Cop Shops
	
	class cop_boa {
        name = "AT";
        side = "cop";
        license = "boa";
        level[] = { "life_coplevel", "SCALAR", 6, "Musisz być w SPAP!" };
        items[] = {
			{ "hgun_P07_snds_F", "Paralizator", 1000, -1 },
			{ "arifle_SDAR_F", "", 1000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 1000, -1 },
			{ "arifle_MXC_Black_F", "", 1000, -1 },
			{ "arifle_MX_Black_F", "", 1000, -1 },
			{ "arifle_Katiba_F", "", 1000, -1 },
			{ "arifle_ARX_blk_F", "", 1000, -1},
			{ "arifle_AK12_GL_F", "", 1000, -1},
            { "arifle_AK12_F", "", 1000, -1 },
			{ "arifle_MXM_Black_F", "", 1000, -1 },
			{ "srifle_EBR_F", "", 1000, -1 },
            { "arifle_SPAR_02_blk_F", "", 1000, -1 },
			{ "srifle_DMR_03_F", "", 1000, -1},
			{ "arifle_SPAR_03_blk_F", "", 1000, -1 },
			{ "srifle_DMR_06_camo_F", "", 1000, -1},
			{ "srifle_DMR_02_F","",1000,-1},
			{ "srifle_DMR_05_blk_F","",1000,-1},
			{ "LMG_MK200_F", "", 1000, -1 },
			{ "arifle_MX_SW_Black_F", "", 1000, -1 },
			{ "LMG_03_F", "", 1000, -1},
			{ "arifle_CTARS_blk_F","",1000,-1},
			{ "LMG_Zafir_F","",1000,-1},
			{ "launch_B_Titan_tna_F","",1000,-1},
			{ "launch_RPG32_ghex_F","",1000,-1},
			{ "launch_NLAW_F","",1000,-1},

            { "10Rnd_50BW_Mag_F", "type 115", 100, -1 },
            { "HandGrenade_Stone", "Flashbang", 1000, -1 },
			{ "SmokeShellBlue", "Gaz łzawiący", 100, -1 },
			{ "1Rnd_SmokeBlue_Grenade_shell", "Gaz łzawiący granatnik", 100, -1 },
            { "B_UavTerminal", "", 1000, -1 },
            { "Rangefinder", "", 1000, -1 },
			{ "NVGoggles_OPFOR", "", 1000, -1 },
            { "ItemGPS", "", 100, -1 },
            { "ItemMap", "", 100, -1 },
            { "ItemRadio", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "FirstAidKit", "", 1000, -1 },
            { "Medikit", "", 1000, -1 }
			
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 25 },
            { "10Rnd_50BW_Mag_F", "", 25 },
			{ "30Rnd_9x21_Mag", "", 50 },
            { "20Rnd_556x45_UW_mag", "", 50 },
			{ "30Rnd_556x45_Stanag", "", 50 },
			{ "30Rnd_45ACP_Mag_SMG_01", "", 50 },
			{ "20Rnd_762x51_Mag", "", 200 },
			{ "100Rnd_580x42_Mag_F", "", 700 },
			{ "100Rnd_65x39_caseless_mag", "", 700 },
			{ "200Rnd_556x45_Box_F", "", 4900 },
            { "150Rnd_556x45_Drum_Mag_F", "", 50 },
			{ "150Rnd_762x54_Box","",6000},
			{ "30Rnd_65x39_caseless_mag", "", 100 },
			{ "30Rnd_762x39_Mag_F","",500},
			{ "1Rnd_SmokeBlue_Grenade_shell","gaz łzawiący",2000},
			{ "200Rnd_65x39_cased_Box", "", 4900 },
			{ "100Rnd_580x42_Mag_F","",2900},
			{ "10Rnd_338_Mag","",500},
			{ "10Rnd_93x64_DMR_05_Mag","",500},
			{ "7Rnd_408_Mag","",500},
			{ "10Rnd_50BW_Mag_F", "", 300 },
			{ "RPG32_F","",100000},
            { "RPG32_HE_F","",300000},
			{ "NLAW_F","",300000}
        };
		accs[] = {
			{ "optic_Aco", "", 240 },
			{ "optic_ACO_grn", "", 240 },
			{ "optic_Aco_smg", "", 240 },
			{ "optic_ACO_grn_smg", "", 240 },
			{ "optic_Holosight", "", 300 },
			{ "optic_Holosight_smg", "", 300 },
			{ "optic_Hamr", "", 400 },
			{ "optic_Arco_blk_F", "", 420 },
			{ "optic_ERCO_blk_F", "", 420 },
			{ "optic_MRCO", "", 440 },
			{ "optic_DMS", "", 490 },
			{ "optic_LRPS", "", 490 },
			{ "optic_NVS", "", 510 },
			{ "optic_KHS_blk", "", 690 },
			{ "muzzle_snds_65_TI_blk_F", "", 690 },
			{ "muzzle_snds_H", "", 10000, -1 },
			{ "muzzle_snds_L", "", 10000, -1 },
			{ "muzzle_snds_M", "", 10000, -1 },
			{ "muzzle_snds_B", "", 10000, -1 },
			{ "muzzle_snds_338_black", "", 10000, -1 },
			{ "muzzle_snds_93mmg", "", 10000, -1 },
			{ "muzzle_snds_58_blk_F", "", 10000, -1 },
			{ "muzzle_snds_93mmg", "", 10000, -1 },
			{ "muzzle_snds_93mmg", "", 10000, -1 },

			{ "acc_flashlight", "", 1000, -1 },
			{ "acc_pointer_IR", "", 2000, -1 },
			{ "bipod_01_F_blk", "", 1000, -1 }
        };
    };

    class cop_kadet {
        name = "Zaopatrzenie Kadeta";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 1, "Musisz mieć range Kadeta!" };
        items[] = {
            { "hgun_P07_snds_F", "Paralizator", 1000, -1 },
			{ "arifle_SDAR_F", "", 1000, -1 },
			{ "arifle_Mk20_F", "", 1000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 1000, -1 },
			{ "arifle_SPAR_02_blk_F", "", 1000, -1 },

            { "Rangefinder", "", 1000, -1 },
			{ "NVGoggles_OPFOR", "", 1000, -1 },
            { "ItemGPS", "", 100, -1 },
            { "ItemMap", "", 100, -1 },
            { "ItemRadio", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "Medikit", "", 1000, -1 }
        };
        mags[] = {
			{ "30Rnd_9x21_Mag", "", 50 },
			{ "30Rnd_556x45_Stanag", "", 75 },
			{ "20Rnd_556x45_UW_mag", "", 50 },
			{ "150Rnd_556x45_Drum_Mag_F", "", 50 },
			{ "30Rnd_45ACP_Mag_SMG_01", "", 50 }

        };
		accs[] = {
			{ "optic_Holosight", "", 450 },
			{ "optic_Holosight_smg", "", 450 },
			{ "optic_Aco", "", 2500, -1 }
        };
    };

    class cop_posterunkowy {
        name = "Zaopatrzenie posterunkowego";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 2, "Musisz mieć range starszego posterunkowego!" };
        items[] = {
            { "hgun_P07_snds_F", "Paralizator", 1000, -1 },
			{ "arifle_SDAR_F", "", 1000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 1000, -1 },
			{ "arifle_MX_Black_F", "", 1000, -1 },
			{ "arifle_SPAR_02_blk_F", "", 1000, -1 },
			{ "arifle_MX_SW_F", "", 1000, -1 },
			{ "LMG_MK200_F", "tylko na duze akcje", 1000, -1 },
            { "HandGrenade_Stone", "Flashbang", 1000, -1 },
            { "Rangefinder", "", 1000, -1 },
			{ "NVGoggles_OPFOR", "", 1000, -1 },
            { "ItemGPS", "", 100, -1 },
            { "ItemMap", "", 100, -1 },
            { "ItemRadio", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "FirstAidKit", "", 1000, -1 },
            { "Medikit", "", 1000, -1 },
			{ "SmokeShellBlue", "Gaz łzawiący", 100, -1 }
        };
        mags[] = {
			{ "30Rnd_9x21_Mag", "", 50 },
            { "20Rnd_556x45_UW_mag", "", 50 },
			{ "30Rnd_556x45_Stanag", "", 50 },
			{ "100Rnd_580x42_Mag_F", "", 700 },
			{ "150Rnd_556x45_Drum_Mag_F", "", 50 },
			{ "100Rnd_65x39_caseless_mag", "", 700 },
			{ "200Rnd_65x39_cased_Box", "", 490 },
			{ "30Rnd_65x39_caseless_mag", "", 100 }
        };
		accs[] = {
			{ "optic_Aco", "", 2500, -1 },
			{ "optic_Holosight", "", 2500, -1 },
			{ "optic_Holosight_smg", "", 2500, -1 },
			{ "optic_ACO_grn_smg", "", 2500, -1 },
			{ "optic_Arco_blk_F", "", 3500, -1 },
			{ "muzzle_snds_H", "", 10000, -1 },
			{ "muzzle_snds_L", "", 10000, -1 },
			{ "muzzle_snds_M", "", 10000, -1 },
			{ "optic_Hamr", "", 10000, -1 },
			{ "optic_SOS", "", 10000, -1 },
			{ "optic_MRCO", "", 10000, -1 },
			{ "optic_DMS", "", 10000, -1 },
			{ "optic_LRPS", "", 10000, -1 },
			{ "optic_AMS", "", 10000, -1 },
			{ "optic_KHS_blk", "", 10000, -1 },
			{ "optic_ERCO_blk_F", "", 3500, -1 },
			{ "acc_flashlight", "", 1000, -1 },
			{ "acc_pointer_IR", "", 2000, -1 },
			{ "bipod_01_F_blk", "", 1000, -1 }
        };
    };

    class cop_sierzant {
        name = "Zaopatrzenie Sierżanta";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 3, "Musisz mieć range Sierżanta!" };
        items[] = {
            { "hgun_P07_snds_F", "Paralizator", 1000, -1 },
			{ "arifle_SDAR_F", "", 1000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 1000, -1 },
			{ "arifle_MX_Black_F", "", 1000, -1 },
			{ "arifle_MXM_Black_F", "", 1000, -1 },
			{ "arifle_MX_SW_Black_F", "", 1000, -1 },
			{ "arifle_Katiba_F", "", 1000, -1 },
            { "arifle_SPAR_02_blk_F", "", 1000, -1 },
			{ "srifle_EBR_F", "", 1000, -1 },
			{ "LMG_MK200_F", "tylko na duze akcje", 1000, -1 },

            { "HandGrenade_Stone", "Flashbang", 1000, -1 },
            { "Rangefinder", "", 1000, -1 },
			{ "NVGoggles_OPFOR", "", 1000, -1 },
            { "ItemGPS", "", 100, -1 },
            { "ItemMap", "", 100, -1 },
            { "ItemRadio", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "FirstAidKit", "", 1000, -1 },
            { "Medikit", "", 1000, -1 },
			{ "SmokeShellBlue", "Gaz łzawiący", 100, -1 }
        };
        mags[] = {
			{ "16Rnd_9x21_Mag", "", 25 },
			{ "30Rnd_9x21_Mag", "", 50 },
            { "20Rnd_556x45_UW_mag", "", 50 },
			{ "30Rnd_556x45_Stanag", "", 50 },
			{ "20Rnd_762x51_Mag", "", 200 },
			{ "100Rnd_580x42_Mag_F", "", 700 },
            { "150Rnd_556x45_Drum_Mag_F", "", 50 },
			{ "100Rnd_65x39_caseless_mag", "", 700 },
			{ "200Rnd_65x39_cased_Box", "", 490 },
			{ "30Rnd_65x39_caseless_mag", "", 100 }
        };
		accs[] = {
			{ "optic_Aco", "", 2500, -1 },
			{ "optic_Holosight", "", 2500, -1 },
			{ "optic_Holosight_smg", "", 2500, -1 },
			{ "optic_ACO_grn_smg", "", 2500, -1 },
			{ "optic_Arco_blk_F", "", 3500, -1 },
			{ "optic_Hamr", "", 10000, -1 },
			{ "optic_SOS", "", 10000, -1 },
			{ "optic_MRCO", "", 10000, -1 },
			{ "optic_DMS", "", 10000, -1 },
			{ "optic_LRPS", "", 10000, -1 },
			{ "optic_AMS", "", 10000, -1 },
			{ "optic_KHS_blk", "", 10000, -1 },
			{ "optic_ERCO_blk_F", "", 3500, -1 },
			{ "acc_flashlight", "", 1000, -1 },
			{ "acc_pointer_IR", "", 2000, -1 },
			{ "muzzle_snds_H", "", 10000, -1 },
			{ "muzzle_snds_L", "", 10000, -1 },
			{ "muzzle_snds_M", "", 10000, -1 },
			{ "muzzle_snds_B", "", 10000, -1},
			{ "bipod_01_F_blk", "", 1000, -1 }
        };
    };

	class cop_stsierzant {
        name = "Zaopatrzenie starszego sierżanta";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 4, "Musisz mieć range starszego sierżanta!" };
        items[] = {
            { "hgun_P07_snds_F", "Paralizator", 1000, -1 },
			{ "arifle_SDAR_F", "", 1000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 1000, -1 },
			{ "arifle_MX_Black_F", "", 1000, -1 },
            { "arifle_SPAR_02_blk_F", "", 1000, -1 },
			{ "arifle_MXM_Black_F", "", 1000, -1 },
			{ "arifle_MX_SW_Black_F", "", 1000, -1 },
			{ "arifle_Katiba_F", "", 1000, -1 },
			{ "srifle_EBR_F", "", 1000, -1 },
			{ "LMG_MK200_F", "tylko na duze akcje", 1000, -1 },

            { "HandGrenade_Stone", "Flashbang", 1000, -1 },
            { "Rangefinder", "", 1000, -1 },
			{ "NVGoggles_OPFOR", "", 1000, -1 },
            { "ItemGPS", "", 100, -1 },
            { "ItemMap", "", 100, -1 },
            { "ItemRadio", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "Medikit", "", 1000, -1 },
			{ "SmokeShellBlue", "Gaz łzawiący", 100, -1 }
        };
        mags[] = {
			{ "30Rnd_9x21_Mag", "", 50 },
            { "20Rnd_556x45_UW_mag", "", 50 },
			{ "30Rnd_556x45_Stanag", "", 50 },
			{ "20Rnd_762x51_Mag", "", 20 },
            { "150Rnd_556x45_Drum_Mag_F", "", 50 },
			{ "100Rnd_580x42_Mag_F", "", 70 },
			{ "100Rnd_65x39_caseless_mag", "", 700 },
			{ "200Rnd_556x45_Box_F", "", 490 },
			{ "30Rnd_65x39_caseless_mag", "", 100 },
			{ "200Rnd_65x39_cased_Box", "", 490 }
        };
		accs[] = {
			{ "optic_Aco", "", 2500, -1 },
			{ "optic_Holosight", "", 2500, -1 },
			{ "optic_Holosight_smg", "", 2500, -1 },
			{ "optic_ACO_grn_smg", "", 2500, -1 },
			{ "optic_Arco_blk_F", "", 3500, -1 },
			{ "optic_Hamr", "", 10000, -1 },
			{ "optic_SOS", "", 10000, -1 },
			{ "optic_MRCO", "", 10000, -1 },
			{ "optic_DMS", "", 10000, -1 },
			{ "optic_LRPS", "", 10000, -1 },
			{ "optic_AMS", "", 10000, -1 },
			{ "optic_KHS_blk", "", 10000, -1 },
			{ "optic_ERCO_blk_F", "", 3500, -1 },
			{ "optic_NVS", "", 10000, -1},
			{ "acc_flashlight", "", 1000, -1 },
			{ "acc_pointer_IR", "", 2000, -1 },
			{ "muzzle_snds_H", "", 10000, -1 },
			{ "muzzle_snds_L", "", 10000, -1 },
			{ "muzzle_snds_M", "", 10000, -1 },
			{ "muzzle_snds_B", "", 10000, -1},
			{ "bipod_01_F_blk", "", 1000, -1 }
        };
    };

	class cop_sierzantsztabowy {
        name = "Zaopatrzenie sierżanta sztabowego";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 5, "Musisz mieć range sierżanta sztabowego!" };
        items[] = {
			{ "hgun_P07_snds_F", "Paralizator", 1000, -1 },
			{ "arifle_SDAR_F", "", 1000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 1000, -1 },
			{ "arifle_MX_Black_F", "", 1000, -1 },
			{ "arifle_Katiba_F", "", 1000, -1 },
			{ "arifle_ARX_blk_F", "", 1000, -1},
			{ "arifle_MXM_Black_F", "", 1000, -1 },
            { "arifle_SPAR_02_blk_F", "", 1000, -1 },
			{ "srifle_EBR_F", "", 1000, -1 },
			{ "srifle_DMR_03_F", "", 1000, -1},
			{ "LMG_MK200_F", "", 1000, -1 },
			{ "arifle_MX_SW_Black_F", "", 1000, -1 },

            { "HandGrenade_Stone", "Flashbang", 1000, -1 },
            { "Rangefinder", "", 1000, -1 },
			{ "NVGoggles_OPFOR", "", 1000, -1 },
            { "ItemGPS", "", 100, -1 },
            { "ItemMap", "", 100, -1 },
            { "ItemRadio", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "Medikit", "", 1000, -1 },
			{ "SmokeShellBlue", "Gaz łzawiący", 100, -1 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 25 },
			{ "30Rnd_9x21_Mag", "", 50 },
            { "20Rnd_556x45_UW_mag", "", 50 },
			{ "30Rnd_556x45_Stanag", "", 50 },
            { "150Rnd_556x45_Drum_Mag_F", "", 50 },
			{ "20Rnd_762x51_Mag", "", 200 },
			{ "100Rnd_580x42_Mag_Tracer_F", "", 70 },
			{ "100Rnd_65x39_caseless_mag", "", 70 },
			{ "200Rnd_556x45_Box_F", "", 4900 },
			{ "30Rnd_65x39_caseless_mag", "", 100 },
			{ "200Rnd_65x39_cased_Box", "", 490 }
        };
		accs[] = {
			{ "optic_Aco", "", 2500, -1 },
			{ "optic_Holosight", "", 2500, -1 },
			{ "optic_Holosight_smg", "", 2500, -1 },
			{ "optic_ACO_grn_smg", "", 2500, -1 },
			{ "optic_Arco_blk_F", "", 3500, -1 },
			{ "optic_Hamr", "", 10000, -1 },
			{ "optic_SOS", "", 10000, -1 },
			{ "optic_MRCO", "", 10000, -1 },
			{ "optic_DMS", "", 10000, -1 },
			{ "optic_LRPS", "", 10000, -1 },
			{ "optic_AMS", "", 10000, -1 },
			{ "optic_KHS_blk", "", 10000, -1 },
			{ "optic_ERCO_blk_F", "", 3500, -1 },
			{ "optic_NVS", "", 10000, -1},
			{ "acc_flashlight", "", 1000, -1 },
			{ "acc_pointer_IR", "", 2000, -1 },
			{ "muzzle_snds_H", "", 10000, -1 },
			{ "muzzle_snds_L", "", 10000, -1 },
			{ "muzzle_snds_M", "", 10000, -1 },
			{ "muzzle_snds_B", "", 10000, -1},
			{ "bipod_01_F_blk", "", 1000, -1 }
        };
	};

	class cop_aspirant {
        name = "Zaopatrzenie Aspiranta";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 6, "Musisz mieć range aspiranta!" };
        items[] = {
            { "hgun_P07_snds_F", "Paralizator", 1000, -1 },
			{ "arifle_SDAR_F", "", 1000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 1000, -1 },
			{ "arifle_MX_Black_F", "", 1000, -1 },
			{ "arifle_Katiba_F", "", 1000, -1 },
			{ "arifle_ARX_blk_F", "", 1000, -1},
			{ "arifle_MXM_Black_F", "", 1000, -1 },
            { "arifle_SPAR_02_blk_F", "", 1000, -1 },
			{ "srifle_EBR_F", "", 1000, -1 },
			{ "srifle_DMR_03_F", "", 1000, -1},
			{ "arifle_SPAR_03_blk_F", "", 1000, -1 },
			{ "LMG_MK200_F", "", 1000, -1 },
			{ "arifle_MX_SW_Black_F", "", 1000, -1 },
			{ "LMG_03_F", "", 1000, -1},
            { "LMG_Zafir_F", "", 1000, -1},
            { "launch_RPG32_ghex_F", "", 1000, -1},

            
            { "10Rnd_50BW_Mag_F", "type 115", 100, -1 },
            { "HandGrenade_Stone", "Flashbang", 1000, -1 },
            { "Rangefinder", "", 1000, -1 },
			{ "NVGoggles_OPFOR", "", 1000, -1 },
            { "ItemGPS", "", 100, -1 },
            { "ItemMap", "", 100, -1 },
            { "ItemRadio", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "Medikit", "", 1000, -1 },
			{ "SmokeShellBlue", "Gaz łzawiący", 100, -1 }
        };
        mags[] = {
            { "150Rnd_762x54_Box", "", 25 },
            { "150Rnd_762x54_Box_Tracer", "", 25 },
			{ "30Rnd_9x21_Mag", "", 50 },
            { "20Rnd_556x45_UW_mag", "", 50 },
			{ "30Rnd_556x45_Stanag", "", 50 },
			{ "30Rnd_45ACP_Mag_SMG_01", "", 50 },
            { "150Rnd_556x45_Drum_Mag_F", "", 50 },
			{ "20Rnd_762x51_Mag", "", 200 },
			{ "100Rnd_580x42_Mag_F", "", 700 },
			{ "100Rnd_65x39_caseless_mag", "", 700 },
			{ "200Rnd_556x45_Box_F", "", 4900 },
			{ "30Rnd_65x39_caseless_mag", "", 100 },
			{ "200Rnd_65x39_cased_Box", "", 4900 },
			{ "RPG32_F","",100000},
            { "RPG32_HE_F","",300000}
        };
		accs[] = {
			{ "optic_Aco", "", 2500, -1 },
			{ "optic_Holosight", "", 2500, -1 },
			{ "optic_Holosight_smg", "", 2500, -1 },
			{ "optic_ACO_grn_smg", "", 2500, -1 },
			{ "optic_Arco_blk_F", "", 3500, -1 },
			{ "optic_Hamr", "", 10000, -1 },
			{ "optic_SOS", "", 10000, -1 },
			{ "optic_MRCO", "", 10000, -1 },
			{ "optic_DMS", "", 10000, -1 },
			{ "optic_LRPS", "", 10000, -1 },
			{ "optic_AMS", "", 10000, -1 },
			{ "optic_KHS_blk", "", 10000, -1 },
			{ "optic_ERCO_blk_F", "", 3500, -1 },
			{ "optic_NVS", "", 10000, -1},
			{ "acc_flashlight", "", 1000, -1 },
			{ "acc_pointer_IR", "", 2000, -1 },
			{ "muzzle_snds_H", "", 10000, -1 },
			{ "muzzle_snds_L", "", 10000, -1 },
			{ "muzzle_snds_M", "", 10000, -1 },
			{ "muzzle_snds_B", "", 10000, -1},
			{ "bipod_01_F_blk", "", 1000, -1 }
        };
    };

	class cop_staspirant {
        name = "Zaopatrzenie St.aspirant";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 7, "Musisz mieć range starszego aspiranta!" };
        items[] = {
            { "hgun_P07_snds_F", "Paralizator", 1000, -1 },
			{ "arifle_SDAR_F", "", 1000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 1000, -1 },
			{ "arifle_MX_Black_F", "", 1000, -1 },
			{ "arifle_Katiba_F", "", 1000, -1 },
			{ "arifle_ARX_blk_F", "", 1000, -1},
            { "arifle_SPAR_02_blk_F", "", 1000, -1 },
			{ "arifle_MXM_Black_F", "", 1000, -1 },
			{ "srifle_EBR_F", "", 1000, -1 },
			{ "srifle_DMR_03_F", "", 1000, -1},
			{ "arifle_SPAR_03_blk_F", "", 1000, -1 },
			{ "srifle_DMR_05_blk_F", "", 1000, -1 },
            { "arifle_AK12_F", "", 1000, -1 },
			{ "LMG_MK200_F", "", 1000, -1 },
			{ "arifle_MX_SW_Black_F", "", 1000, -1 },
			{ "LMG_03_F", "", 1000, -1},
            { "LMG_Zafir_F", "", 1000, -1},
            { "launch_RPG32_ghex_F", "", 1000, -1},

            { "10Rnd_50BW_Mag_F", "type 115", 100, -1 },
            { "HandGrenade_Stone", "Flashbang", 1000, -1 },
            { "Rangefinder", "", 1000, -1 },
			{ "NVGoggles_OPFOR", "", 1000, -1 },
            { "ItemGPS", "", 100, -1 },
            { "ItemMap", "", 100, -1 },
            { "ItemRadio", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "Medikit", "", 1000, -1 },
			{ "SmokeShellBlue", "Gaz łzawiący", 100, -1 }
        };
        mags[] = {
            { "30Rnd_762x39_Mag_F", "", 25 },
            { "150Rnd_762x54_Box", "", 25 },
            { "150Rnd_762x54_Box_Tracer", "", 25 },
			{ "10Rnd_93x64_DMR_05_Mag", "", 50 },
			{ "30Rnd_9x21_Mag", "", 50 },
            { "20Rnd_556x45_UW_mag", "", 50 },
			{ "30Rnd_556x45_Stanag", "", 50 },
            { "150Rnd_556x45_Drum_Mag_F", "", 50 },
			{ "20Rnd_762x51_Mag", "", 200 },
			{ "100Rnd_580x42_Mag_F", "", 700 },
			{ "100Rnd_65x39_caseless_mag", "", 700 },
			{ "200Rnd_556x45_Box_F", "", 4900 },
			{ "30Rnd_65x39_caseless_mag", "", 100 },
			{ "200Rnd_65x39_cased_Box", "", 490 },
			{ "RPG32_F","",100000},
            { "RPG32_HE_F","",300000}
        };
		accs[] = {
            { "muzzle_snds_93mmg", "", 1000, -1 },
			{ "optic_Arco_blk_F", "", 3500, -1 },
			{ "optic_Hamr", "", 10000, -1 },
			{ "optic_SOS", "", 10000, -1 },
			{ "optic_MRCO", "", 10000, -1 },
			{ "optic_DMS", "", 10000, -1 },
			{ "optic_LRPS", "", 10000, -1 },
			{ "optic_AMS", "", 10000, -1 },
			{ "optic_KHS_blk", "", 10000, -1 },
			{ "optic_ERCO_blk_F", "", 3500, -1 },
			{ "optic_NVS", "", 10000, -1},
			{ "muzzle_snds_H", "", 10000, -1 },
			{ "muzzle_snds_L", "", 10000, -1 },
			{ "muzzle_snds_M", "", 10000, -1 },
			{ "muzzle_snds_B", "", 10000, -1},
			{ "bipod_01_F_blk", "", 1000, -1 }
        };
    };

    class cop_komisarz {
        name = "Zaopatrzenie Komisarza";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 8, "Musisz mieć range Komisarza!" };
        items[] = {
             { "hgun_P07_snds_F", "Paralizator", 1000, -1 },
			{ "arifle_SDAR_F", "", 1000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 1000, -1 },
			{ "arifle_MXC_Black_F", "", 1000, -1 },
			{ "arifle_MX_Black_F", "", 1000, -1 },
			{ "arifle_Katiba_F", "", 1000, -1 },
			{ "arifle_ARX_blk_F", "", 1000, -1},
            { "arifle_SPAR_02_blk_F", "", 1000, -1 },
			{ "arifle_AK12_GL_F", "", 1000, -1},
			{ "arifle_MXM_Black_F", "", 1000, -1 },
			{ "srifle_EBR_F", "", 1000, -1 },
			{ "srifle_DMR_03_F", "", 1000, -1},
			{ "arifle_SPAR_03_blk_F", "", 1000, -1 },
			{ "srifle_DMR_06_camo_F", "", 1000, -1},
            { "arifle_AK12_F", "", 1000, -1 },
			{ "LMG_MK200_F", "", 1000, -1 },
			{ "srifle_DMR_05_blk_F", "", 1000, -1 },
			{ "arifle_MX_SW_Black_F", "", 1000, -1 },
			{ "LMG_03_F", "", 1000, -1},
			{ "arifle_CTARS_blk_F","", 1000,-1},
            { "LMG_Zafir_F", "", 1000, -1},
            { "launch_RPG32_ghex_F", "", 1000, -1},

            { "10Rnd_50BW_Mag_F", "type 115", 100, -1 },
            { "HandGrenade_Stone", "Flashbang", 1000, -1 },
            { "Rangefinder", "", 1000, -1 },
			{ "NVGoggles_OPFOR", "", 1000, -1 },
            { "ItemGPS", "", 100, -1 },
            { "ItemMap", "", 100, -1 },
            { "ItemRadio", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "Medikit", "", 1000, -1 },
			{ "SmokeShellBlue", "Gaz łzawiący", 100, -1 },
			{ "1Rnd_SmokeBlue_Grenade_shell", "Gaz łzawiący granatnik", 100, -1 }
        };
        mags[] = {
            { "30Rnd_762x39_Mag_F", "", 25 },
            { "150Rnd_762x54_Box", "", 25 },
            { "150Rnd_762x54_Box_Tracer", "", 25 },
			{ "16Rnd_9x21_Mag", "", 25 },
			{ "10Rnd_338_Mag", "", 25 },
			{ "30Rnd_9x21_Mag", "", 50 },
            { "20Rnd_556x45_UW_mag", "", 50 },
			{ "30Rnd_556x45_Stanag", "", 50 },
			{ "30Rnd_45ACP_Mag_SMG_01", "", 50 },
			{ "20Rnd_762x51_Mag", "", 200 },
            { "150Rnd_556x45_Drum_Mag_F", "", 50 },
			{ "100Rnd_580x42_Mag_F", "", 700 },
			{ "100Rnd_65x39_caseless_mag", "", 700 },
			{ "200Rnd_556x45_Box_F", "", 4900 },
			{ "150Rnd_762x54_Box","",6000},
			{ "30Rnd_65x39_caseless_mag", "", 100 },
			{ "30Rnd_762x39_Mag_F","",500},
			{ "1Rnd_SmokeBlue_Grenade_shell","gaz łzawiący",2000},
			{ "200Rnd_65x39_cased_Box", "", 490 },
			{ "100Rnd_580x42_Mag_F","",290},
			{ "10Rnd_338_Mag","",500},
			{ "10Rnd_93x64_DMR_05_Mag","",50},
			{ "RPG32_F","",100000},
            { "RPG32_HE_F","",300000}
        };
		accs[] = {
			{ "optic_Aco", "", 2500, -1 },
			{ "muzzle_snds_93mmg", "", 1000, -1 },
			{ "optic_Holosight", "", 2500, -1 },
			{ "optic_Holosight_smg", "", 2500, -1 },
			{ "optic_ACO_grn_smg", "", 2500, -1 },
			{ "optic_Arco_blk_F", "", 3500, -1 },
			{ "optic_Hamr", "", 10000, -1 },
			{ "optic_SOS", "", 10000, -1 },
			{ "optic_MRCO", "", 10000, -1 },
			{ "optic_DMS", "", 10000, -1 },
			{ "optic_LRPS", "", 10000, -1 },
			{ "optic_AMS", "", 10000, -1 },
			{ "optic_KHS_blk", "", 10000, -1 },
			{ "optic_ERCO_blk_F", "", 3500, -1 },
			{ "optic_NVS", "", 10000, -1},
			{ "acc_flashlight", "", 1000, -1 },
			{ "acc_pointer_IR", "", 2000, -1 },
			{ "muzzle_snds_338_black", "", 10000, -1 },
			{ "muzzle_snds_H", "", 10000, -1 },
			{ "muzzle_snds_L", "", 10000, -1 },
			{ "muzzle_snds_M", "", 10000, -1 },
			{ "muzzle_snds_B", "", 10000, -1},
			{ "bipod_01_F_blk", "", 1000, -1 }
        };
    };

    class cop_nadkomisarz {
        name = "Zaopatrzenie Nadkomisarza";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 9, "Musisz mieć range Nadkomisarza!" };
        items[] = {
            { "hgun_P07_snds_F", "Paralizator", 1000, -1 },
			{ "arifle_SDAR_F", "", 1000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 1000, -1 },
			{ "arifle_MXC_Black_F", "", 1000, -1 },
			{ "arifle_MX_Black_F", "", 1000, -1 },
			{ "arifle_Katiba_F", "", 1000, -1 },
			{ "arifle_ARX_blk_F", "", 1000, -1},
            { "arifle_SPAR_02_blk_F", "", 1000, -1 },
			{ "arifle_AK12_GL_F", "", 1000, -1},
            { "arifle_AK12_F", "", 1000, -1 },
			{ "arifle_MXM_Black_F", "", 1000, -1 },
			{ "srifle_EBR_F", "", 1000, -1 },
            { "150Rnd_556x45_Drum_Mag_F", "", 50 },
			{ "srifle_DMR_03_F", "", 1000, -1},
			{ "arifle_SPAR_03_blk_F", "", 1000, -1 },
			{ "srifle_DMR_06_camo_F", "", 1000, -1},
			{ "LMG_MK200_F", "", 1000, -1 },
			{ "arifle_MX_SW_Black_F", "", 1000, -1 },
			{ "srifle_DMR_05_blk_F", "", 1000, -1},
			{ "LMG_03_F", "", 1000, -1},
            { "LMG_Zafir_F", "", 1000, -1},
			{ "arifle_CTARS_blk_F","",1000,-1},
			{ "launch_B_Titan_tna_F","",1000,-1},
			{ "launch_RPG32_ghex_F","",1000,-1},

            { "10Rnd_50BW_Mag_F", "type 115", 100, -1 },
            { "HandGrenade_Stone", "Flashbang", 1000, -1 },
            { "Rangefinder", "", 1000, -1 },
			{ "NVGoggles_OPFOR", "", 1000, -1 },
            { "ItemGPS", "", 100, -1 },
            { "ItemMap", "", 100, -1 },
            { "ItemRadio", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "FirstAidKit", "", 1000, -1 },
            { "Medikit", "", 1000, -1 },
			{ "SmokeShellBlue", "Gaz łzawiący", 100, -1 },
			{ "1Rnd_SmokeBlue_Grenade_shell", "Gaz łzawiący granatnik", 100, -1 }
        };
        mags[] = {
            { "150Rnd_762x54_Box", "", 25 },
            { "150Rnd_762x54_Box_Tracer", "", 25 },
             { "16Rnd_9x21_Mag", "", 25 },
			{ "30Rnd_9x21_Mag", "", 50 },
            { "20Rnd_556x45_UW_mag", "", 50 },
			{ "30Rnd_556x45_Stanag", "", 50 },
			{ "10Rnd_338_Mag", "", 50 },
			{ "20Rnd_762x51_Mag", "", 200 },
			{ "100Rnd_580x42_Mag_F", "", 700 },
			{ "100Rnd_65x39_caseless_mag", "", 700 },
			{ "200Rnd_556x45_Box_F", "", 4900 },
            { "150Rnd_556x45_Drum_Mag_F", "", 50 },
			{ "150Rnd_762x54_Box","",600},
			{ "30Rnd_65x39_caseless_mag", "", 100 },
			{ "30Rnd_762x39_Mag_F","",500},
			{ "1Rnd_SmokeBlue_Grenade_shell","gaz łzawiący",2000},
			{ "200Rnd_65x39_cased_Box", "", 490 },
			{ "100Rnd_580x42_Mag_F","",2900},
			{ "10Rnd_338_Mag","",500},
			{ "10Rnd_93x64_DMR_05_Mag","",500},
			{ "RPG32_F","",100000},
            { "RPG32_HE_F","",300000}
        };
		accs[] = {
			{ "optic_Aco", "", 1000, -1 },
			{ "optic_Holosight", "", 1000, -1 },
			{ "optic_Holosight_smg", "", 1000, -1 },
			{ "optic_ACO_grn_smg", "", 1000, -1 },
			{ "optic_Arco_blk_F", "", 1000, -1 },
			{ "optic_Hamr", "", 1000, -1 },
			{ "optic_SOS", "", 1000, -1 },
			{ "optic_MRCO", "", 1000, -1 },
			{ "optic_DMS", "", 1000, -1 },
			{ "optic_LRPS", "", 1000, -1 },
			{ "optic_AMS", "", 1000, -1 },
			{ "optic_KHS_blk", "", 1000, -1 },
			{ "optic_ERCO_blk_F", "", 1000, -1 },
			{ "optic_NVS", "", 1000, -1},
			{ "acc_flashlight", "", 1000, -1 },
			{ "acc_pointer_IR", "", 1000, -1 },
			{ "muzzle_snds_338_black", "", 1000, -1 },
			{ "muzzle_snds_93mmg", "", 1000, -1 },
			{ "muzzle_snds_H", "", 1000, -1 },
			{ "muzzle_snds_L", "", 1000, -1 },
			{ "muzzle_snds_M", "", 1000, -1 },
			{ "muzzle_snds_B", "", 1000, -1},
			{ "bipod_01_F_blk", "", 1000, -1 }
        };
    };

    class cop_inspektor {
        name = "Zaopatrzenie Inspektora";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 10, "Musisz mieć range Inspektora!" };
        items[] = {
             { "hgun_P07_snds_F", "Paralizator", 1000, -1 },
			{ "arifle_SDAR_F", "", 1000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 1000, -1 },
			{ "arifle_MXC_Black_F", "", 1000, -1 },
			{ "arifle_MX_Black_F", "", 1000, -1 },
			{ "arifle_Katiba_F", "", 1000, -1 },
			{ "arifle_ARX_blk_F", "", 1000, -1},
			{ "arifle_AK12_GL_F", "", 1000, -1},
            { "arifle_AK12_F", "", 1000, -1 },
			{ "arifle_MXM_Black_F", "", 1000, -1 },
			{ "srifle_EBR_F", "", 1000, -1 },
			{ "srifle_DMR_03_F", "", 1000, -1},
			{ "arifle_SPAR_03_blk_F", "", 1000, -1 },
			{ "srifle_DMR_06_camo_F", "", 1000, -1},
            { "arifle_SPAR_02_blk_F", "", 1000, -1 },
			{ "srifle_DMR_02_F","",1000,-1},
			{ "srifle_DMR_05_blk_F","",1000,-1},
			{ "LMG_MK200_F", "", 1000, -1 },
			{ "arifle_MX_SW_Black_F", "", 1000, -1 },
			{ "LMG_03_F", "", 1000, -1},
			{ "arifle_CTARS_blk_F","",1000,-1},
			{ "LMG_Zafir_F","",1000,-1},
			{ "launch_B_Titan_tna_F","",1000,-1},
			{ "launch_RPG32_ghex_F","",1000,-1},
			{ "launch_NLAW_F","",1000,-1},

            { "10Rnd_50BW_Mag_F", "type 115", 100, -1 },
            { "HandGrenade_Stone", "Flashbang", 1000, -1 },
            { "B_UavTerminal", "", 1000, -1 },
            { "Rangefinder", "", 1000, -1 },
			{ "NVGoggles_OPFOR", "", 1000, -1 },
            { "ItemGPS", "", 100, -1 },
            { "ItemMap", "", 100, -1 },
            { "ItemRadio", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "FirstAidKit", "", 1000, -1 },
            { "Medikit", "", 1000, -1 },
			{ "SmokeShellBlue", "Gaz łzawiący", 100, -1 },
			{ "1Rnd_SmokeBlue_Grenade_shell", "Gaz łzawiący granatnik", 100, -1 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 25 },
            { "10Rnd_50BW_Mag_F", "", 25 },
			{ "30Rnd_9x21_Mag", "", 50 },
            { "20Rnd_556x45_UW_mag", "", 50 },
			{ "30Rnd_556x45_Stanag", "", 50 },
			{ "30Rnd_45ACP_Mag_SMG_01", "", 50 },
			{ "20Rnd_762x51_Mag", "", 200 },
			{ "100Rnd_580x42_Mag_F", "", 700 },
			{ "100Rnd_65x39_caseless_mag", "", 700 },
			{ "200Rnd_556x45_Box_F", "", 4900 },
			{ "150Rnd_762x54_Box","",6000},
			{ "30Rnd_65x39_caseless_mag", "", 100 },
			{ "30Rnd_762x39_Mag_F","",500},
			{ "1Rnd_SmokeBlue_Grenade_shell","gaz łzawiący",2000},
			{ "200Rnd_65x39_cased_Box", "", 4900 },
			{ "100Rnd_580x42_Mag_F","",2900},
			{ "10Rnd_338_Mag","",500},
			{ "10Rnd_93x64_DMR_05_Mag","",500},
			{ "7Rnd_408_Mag","",500},
            { "150Rnd_556x45_Drum_Mag_F", "", 50 },
			{ "10Rnd_50BW_Mag_F", "", 300 },
			{ "RPG32_F","",100000},
            { "RPG32_HE_F","",300000},
			{ "NLAW_F","",300000}
        };
		accs[] = {
			{ "optic_Aco", "", 1000, -1 },
			{ "optic_Holosight", "", 1000, -1 },
			{ "optic_Holosight_smg", "", 1000, -1 },
			{ "optic_ACO_grn_smg", "", 1000, -1 },
			{ "optic_Arco_blk_F", "", 1000, -1 },
			{ "optic_Hamr", "", 1000, -1 },
			{ "optic_SOS", "", 1000, -1 },
			{ "optic_MRCO", "", 1000, -1 },
			{ "optic_DMS", "", 1000, -1 },
			{ "optic_LRPS", "", 1000, -1 },
			{ "optic_AMS", "", 1000, -1 },
			{ "optic_KHS_blk", "", 1000, -1 },
			{ "muzzle_snds_65_TI_blk_F", "", 1000, -1 },
			{ "optic_ERCO_blk_F", "", 1000, -1 },
			{ "optic_NVS", "", 1000, -1},
			{ "acc_flashlight", "", 1000, -1 },
			{ "acc_pointer_IR", "", 1000, -1 },
			{ "muzzle_snds_H", "", 1000, -1 },
			{ "muzzle_snds_L", "", 1000, -1 },
			{ "muzzle_snds_M", "", 1000, -1 },
			{ "muzzle_snds_B", "", 1000, -1},
			{ "muzzle_snds_93mmg","",1000,-1},
			{ "muzzle_snds_338_black","",1000,-1},
			{ "bipod_01_F_blk", "", 1000, -1 }
        };
    };

    class cop_nadinspektor {
        name = "Zaopatrzenie Nadinspektora";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 11, "Musisz mieć range Nadinspektora!" };
        items[] = {
             { "hgun_P07_snds_F", "Paralizator", 1000, -1 },
			{ "arifle_SDAR_F", "", 1000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 1000, -1 },
			{ "arifle_MXC_Black_F", "", 1000, -1 },
			{ "arifle_MX_Black_F", "", 1000, -1 },
			{ "arifle_Katiba_F", "", 1000, -1 },
			{ "arifle_ARX_blk_F", "", 1000, -1},
			{ "arifle_AK12_GL_F", "", 1000, -1},
            { "arifle_AK12_F", "", 1000, -1 },
			{ "arifle_MXM_Black_F", "", 1000, -1 },
			{ "srifle_EBR_F", "", 1000, -1 },
			{ "srifle_DMR_03_F", "", 1000, -1},
			{ "arifle_SPAR_03_blk_F", "", 1000, -1 },
			{ "srifle_DMR_06_camo_F", "", 1000, -1},
            { "arifle_SPAR_02_blk_F", "", 1000, -1 },
			{ "srifle_DMR_02_F","",1000,-1},
			{ "srifle_DMR_05_blk_F","",1000,-1},
			{ "LMG_MK200_F", "", 1000, -1 },
			{ "arifle_MX_SW_Black_F", "", 1000, -1 },
			{ "LMG_03_F", "", 1000, -1},
			{ "arifle_CTARS_blk_F","",1000,-1},
			{ "LMG_Zafir_F","",1000,-1},
			{ "launch_B_Titan_tna_F","",1000,-1},
			{ "launch_RPG32_ghex_F","",1000,-1},
			{ "launch_NLAW_F","",1000,-1},

            { "10Rnd_50BW_Mag_F", "type 115", 100, -1 },
            { "HandGrenade_Stone", "Flashbang", 1000, -1 },
            { "B_UavTerminal", "", 1000, -1 },
            { "Rangefinder", "", 1000, -1 },
			{ "NVGoggles_OPFOR", "", 1000, -1 },
            { "ItemGPS", "", 100, -1 },
            { "ItemMap", "", 100, -1 },
            { "ItemRadio", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "FirstAidKit", "", 1000, -1 },
            { "Medikit", "", 1000, -1 },
			{ "SmokeShellBlue", "Gaz łzawiący", 100, -1 },
			{ "1Rnd_SmokeBlue_Grenade_shell", "Gaz łzawiący granatnik", 100, -1 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 25 },
            { "10Rnd_50BW_Mag_F", "", 25 },
			{ "30Rnd_9x21_Mag", "", 50 },
            { "20Rnd_556x45_UW_mag", "", 50 },
			{ "30Rnd_556x45_Stanag", "", 50 },
			{ "30Rnd_45ACP_Mag_SMG_01", "", 50 },
			{ "20Rnd_762x51_Mag", "", 200 },
			{ "100Rnd_580x42_Mag_F", "", 700 },
			{ "100Rnd_65x39_caseless_mag", "", 700 },
			{ "200Rnd_556x45_Box_F", "", 4900 },
			{ "150Rnd_762x54_Box","",6000},
			{ "30Rnd_65x39_caseless_mag", "", 100 },
			{ "30Rnd_762x39_Mag_F","",500},
			{ "1Rnd_SmokeBlue_Grenade_shell","gaz łzawiący",2000},
			{ "200Rnd_65x39_cased_Box", "", 4900 },
			{ "100Rnd_580x42_Mag_F","",2900},
			{ "10Rnd_338_Mag","",500},
			{ "10Rnd_93x64_DMR_05_Mag","",500},
			{ "7Rnd_408_Mag","",500},
            { "150Rnd_556x45_Drum_Mag_F", "", 50 },
			{ "10Rnd_50BW_Mag_F", "", 300 },
			{ "RPG32_F","",100000},
            { "RPG32_HE_F","",300000},
			{ "NLAW_F","",300000}
        };
		accs[] = {
			{ "optic_Aco", "", 1000, -1 },
			{ "optic_Holosight", "", 1000, -1 },
			{ "optic_Holosight_smg", "", 1000, -1 },
			{ "optic_ACO_grn_smg", "", 1000, -1 },
			{ "optic_Arco_blk_F", "", 1000, -1 },
			{ "optic_Hamr", "", 1000, -1 },
			{ "optic_SOS", "", 1000, -1 },
			{ "optic_MRCO", "", 1000, -1 },
			{ "optic_DMS", "", 1000, -1 },
			{ "optic_LRPS", "", 1000, -1 },
			{ "optic_AMS", "", 1000, -1 },
			{ "optic_KHS_blk", "", 1000, -1 },
			{ "muzzle_snds_65_TI_blk_F", "", 1000, -1 },
			{ "optic_ERCO_blk_F", "", 1000, -1 },
			{ "optic_NVS", "", 1000, -1},
			{ "acc_flashlight", "", 1000, -1 },
			{ "acc_pointer_IR", "", 1000, -1 },
			{ "muzzle_snds_H", "", 1000, -1 },
			{ "muzzle_snds_L", "", 1000, -1 },
			{ "muzzle_snds_M", "", 1000, -1 },
			{ "muzzle_snds_B", "", 1000, -1},
			{ "muzzle_snds_93mmg","",1000,-1},
			{ "muzzle_snds_338_black","",1000,-1},
			{ "bipod_01_F_blk", "", 1000, -1 }
        };
    };

    class cop_generalnyinspektor {
        name = "Zaopatrzenie Gen.Inspektora";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 12, "Musisz mieć range generalnego inspektora!" };
        items[] = {
            { "hgun_P07_snds_F", "Paralizator", 1000, -1 },
			{ "arifle_SDAR_F", "", 1000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 1000, -1 },
			{ "arifle_MXC_Black_F", "", 1000, -1 },
			{ "arifle_MX_Black_F", "", 1000, -1 },
			{ "arifle_Katiba_F", "", 1000, -1 },
			{ "arifle_ARX_blk_F", "", 1000, -1},
			{ "arifle_AK12_GL_F", "", 1000, -1},
            { "arifle_AK12_F", "", 1000, -1 },
			{ "arifle_MXM_Black_F", "", 1000, -1 },
			{ "srifle_EBR_F", "", 1000, -1 },
            { "arifle_SPAR_02_blk_F", "", 1000, -1 },
			{ "srifle_DMR_03_F", "", 1000, -1},
			{ "arifle_SPAR_03_blk_F", "", 1000, -1 },
			{ "srifle_DMR_06_camo_F", "", 1000, -1},
			{ "srifle_DMR_02_F","",1000,-1},
			{ "srifle_DMR_05_blk_F","",1000,-1},
			{ "LMG_MK200_F", "", 1000, -1 },
			{ "arifle_MX_SW_Black_F", "", 1000, -1 },
			{ "LMG_03_F", "", 1000, -1},
			{ "arifle_CTARS_blk_F","",1000,-1},
			{ "LMG_Zafir_F","",1000,-1},
			{ "launch_B_Titan_tna_F","",1000,-1},
			{ "launch_RPG32_ghex_F","",1000,-1},
			{ "launch_NLAW_F","",1000,-1},

            { "10Rnd_50BW_Mag_F", "type 115", 100, -1 },
            { "HandGrenade_Stone", "Flashbang", 1000, -1 },
			{ "SmokeShellBlue", "Gaz łzawiący", 100, -1 },
			{ "1Rnd_SmokeBlue_Grenade_shell", "Gaz łzawiący granatnik", 100, -1 },
            { "B_UavTerminal", "", 1000, -1 },
            { "Rangefinder", "", 1000, -1 },
			{ "NVGoggles_OPFOR", "", 1000, -1 },
            { "ItemGPS", "", 100, -1 },
            { "ItemMap", "", 100, -1 },
            { "ItemRadio", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "FirstAidKit", "", 1000, -1 },
            { "Medikit", "", 1000, -1 }
			
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 25 },
            { "10Rnd_50BW_Mag_F", "", 25 },
			{ "30Rnd_9x21_Mag", "", 50 },
            { "20Rnd_556x45_UW_mag", "", 50 },
			{ "30Rnd_556x45_Stanag", "", 50 },
			{ "30Rnd_45ACP_Mag_SMG_01", "", 50 },
			{ "20Rnd_762x51_Mag", "", 200 },
			{ "100Rnd_580x42_Mag_F", "", 700 },
			{ "100Rnd_65x39_caseless_mag", "", 700 },
			{ "200Rnd_556x45_Box_F", "", 4900 },
            { "150Rnd_556x45_Drum_Mag_F", "", 50 },
			{ "150Rnd_762x54_Box","",6000},
			{ "30Rnd_65x39_caseless_mag", "", 100 },
			{ "30Rnd_762x39_Mag_F","",500},
			{ "1Rnd_SmokeBlue_Grenade_shell","gaz łzawiący",2000},
			{ "200Rnd_65x39_cased_Box", "", 4900 },
			{ "100Rnd_580x42_Mag_F","",2900},
			{ "10Rnd_338_Mag","",500},
			{ "10Rnd_93x64_DMR_05_Mag","",500},
			{ "7Rnd_408_Mag","",500},
			{ "10Rnd_50BW_Mag_F", "", 300 },
			{ "RPG32_F","",100000},
            { "RPG32_HE_F","",300000},
			{ "NLAW_F","",300000}
        };
		accs[] = {
			{ "optic_Aco", "", 240 },
			{ "optic_ACO_grn", "", 240 },
			{ "optic_Aco_smg", "", 240 },
			{ "optic_ACO_grn_smg", "", 240 },
			{ "optic_Holosight", "", 300 },
			{ "optic_Holosight_smg", "", 300 },
			{ "optic_Hamr", "", 400 },
			{ "optic_Arco_blk_F", "", 420 },
			{ "optic_ERCO_blk_F", "", 420 },
			{ "optic_MRCO", "", 440 },
			{ "optic_DMS", "", 490 },
			{ "optic_LRPS", "", 490 },
			{ "optic_NVS", "", 510 },
			{ "optic_KHS_blk", "", 690 },
			{ "muzzle_snds_65_TI_blk_F", "", 690 },
			{ "muzzle_snds_H", "", 10000, -1 },
			{ "muzzle_snds_L", "", 10000, -1 },
			{ "muzzle_snds_M", "", 10000, -1 },
			{ "muzzle_snds_B", "", 10000, -1 },
			{ "muzzle_snds_338_black", "", 10000, -1 },
			{ "muzzle_snds_93mmg", "", 10000, -1 },
			{ "muzzle_snds_58_blk_F", "", 10000, -1 },
			{ "muzzle_snds_93mmg", "", 10000, -1 },
			{ "muzzle_snds_93mmg", "", 10000, -1 },

			{ "acc_flashlight", "", 1000, -1 },
			{ "acc_pointer_IR", "", 2000, -1 },
			{ "bipod_01_F_blk", "", 1000, -1 }
        };
    };

    //Medic Shops
    class med_basic {
        name = "store";
        side = "med";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "ItemGPS", "", 100, -1 },
			{ "ItemMap", "", 100, -1 },
            { "ItemRadio", "", 100, -1 },
            { "ItemCompass", "", 100, -1 },
            { "ItemWatch", "", 100, -1 },
            { "Binocular", "", 100, -1 },
            { "Medikit", "", 500, -1 },
            { "NVGoggles_INDEP", "", 1000, -1 }
        };
        mags[] = {};
    };
};
