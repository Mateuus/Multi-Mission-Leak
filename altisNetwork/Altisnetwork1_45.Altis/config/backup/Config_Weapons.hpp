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
        name = "Legal Firearms";
        side = "civ";
        license = "gun";
        level[] = { "", "", -1, "" };
        items[] = {
            { "hgun_Rook40_F", "", 12500, -1 },
            { "hgun_ACPC2_F", "", 15000, -1 },
            { "hgun_Pistol_heavy_01_F", "", 20000, -1 },
            { "hgun_Pistol_heavy_02_F", "", 25000, -1 }
        };
            mags[] = {
            { "9Rnd_45ACP_Mag", "", 500 },
            { "11Rnd_45ACP_Mag", "", 500 },
            { "6Rnd_45ACP_Cylinder", "", 500 },
            { "16Rnd_9x21_Mag", "", 500 },
            { "30Rnd_9x21_Mag", "", 500 },
            { "30Rnd_45ACP_Mag_SMG_01", "", 500 },
            { "30Rnd_9x21_Mag_SMG_02", "", 500 }
        };
        accs[] = {
            { "optic_Arco", "Yorris", 2000 },
            { "optic_Hamr", "Yorris", 2000 },
            { "optic_Aco", "Yorris", 2000 },
            { "optic_ACO_grn", "Yorris", 2000 },
            { "optic_Aco_smg", "Yorris", 2000 },
            { "optic_ACO_grn_smg", "Yorris", 2000 },
            { "optic_Holosight", "Yorris", 2000 },
            { "optic_Holosight_smg", "Yorris", 2000 },
            { "optic_DMS", "Yorris", 2000 },
            { "optic_Yorris", "Yorris", 2000 },
            { "optic_MRD", "Yorris", 2000 },
            { "acc_flashlight", "flashlight", 9000 },
            { "acc_pointer_IR", "IR Pointer", 9000 },
            { "bipod_01_F_khk", "Khaki Bipod", 25000 },
            { "bipod_01_F_snd", "Sand Bipod", 25000 },
            { "bipod_01_F_blk", "Sand Bipod", 25000 }
        };
    };
     
    class blackmarket {
     name = "Blackmarket";
     side = "civ";
     license = "gun";
     level[] = { "", "", -1, "" };
     items[] = {
            { "Binocular", "", 150, -1 },
            { "ItemGPS", "", 100, 45 },
            { "ItemMap", "", 50, 35 },
            { "ItemCompass", "", 50, 25 },
            { "ItemWatch", "", 50, -1 },
            { "FirstAidKit", "", 150, 65 },
            { "NVGoggles", "", 2000, 980 },
            { "ItemRadio", "CellPhone", 300, 50 },
            { "arifle_SDAR_F", "", 135000, -1},
            { "arifle_Mk20C_F", "", 150000, -1},
            { "arifle_TRG21_F", "", 165000, -1},
            { "arifle_AKM_F", "", 195000, -1},
            { "arifle_MXC_F", "", 202000, -1},
            { "arifle_Katiba_C_F", "", 202000, -1},
            { "arifle_CTAR_hex_F", "", 240000, -1},
            { "arifle_MX_F", "", 232000, -1},
            { "arifle_Katiba_F", "", 232000, -1},
            { "srifle_DMR_01_F", "", 270000, -1},
            { "hgun_Rook40_F", "", 15000, -1 }
        };
        mags[] = {
            { "30Rnd_762x39_Mag_Green_F", "AKM Ammo", 5000 },
            { "10Rnd_762x54_Mag", "Rahim Ammo", 5000 },
            { "30Rnd_580x42_Mag_Tracer_F", "CAR-95 Ammo", 5000 },
            { "30Rnd_65x39_caseless_mag_Tracer", "MX Ammo", 5000 },
            { "30Rnd_545x39_Mag_Green_F", "AKS-74U Ammo", 5000 },
            { "30Rnd_556x45_Stanag_Tracer_Red", "TRG-21 Ammo", 5000 },
            { "30Rnd_556x45_Stanag_Tracer_Red", "Mk20C Ammo", 5000 },
            { "20Rnd_556x45_UW_mag", "SDAR-UW Ammo", 5000 },
            { "30Rnd_65x39_caseless_green_mag_Tracer", "Katiba Carbine Ammo", 5000 },
            { "20Rnd_762x51_Mag", "Mk18 ABR Ammo", 5000 },
            { "200Rnd_65x39_cased_Box_Tracer", "Mk200 Ammo", 5000 },
            { "100Rnd_65x39_caseless_mag_Tracer", "MX SW Ammo", 5000 },
            { "20Rnd_762x51_Mag", "Mk-I EMR Ammo", 5000 },
            { "20Rnd_762x51_Mag", "Mk14 Ammo", 5000 },
            { "10Rnd_93x64_DMR_05_Mag", "Cyrus Ammo", 5000 },
            { "30Rnd_762x39_Mag_Tracer_Green_F", "AK-12 Ammo", 5000 },
            { "30Rnd_556x45_Stanag_Tracer_Yellow", "SPAR-16 Ammo", 5000 },
            { "150Rnd_556x45_Drum_Mag_Tracer_F", "SPAR-16S Ammo", 5000 },
            { "20Rnd_762x51_Mag", "SPAR-17 Ammo", 5000 },
            { "6Rnd_45ACP_Cylinder", "Zubr Ammo", 5000 },
            { "9Rnd_45ACP_Mag", "ACP-C2 Ammo", 5000 },
            { "30Rnd_9x21_Red_Mag", "Rook Ammo", 5000 }
        };
        accs[] = {
            { "optic_Arco", "Yorris", 2000 },
            { "optic_Hamr", "Yorris", 2000 },
            { "optic_Aco", "Yorris", 2000 },
            { "optic_ACO_grn", "Yorris", 2000 },
            { "optic_Aco_smg", "Yorris", 2000 },
            { "optic_ACO_grn_smg", "Yorris", 2000 },
            { "optic_Holosight", "Yorris", 2000 },
            { "optic_Holosight_smg", "Yorris", 2000 },
            { "optic_DMS", "Yorris", 2000 },
            { "optic_Yorris", "Yorris", 2000 },
            { "optic_MRD", "Yorris", 2000 },
            { "acc_flashlight", "flashlight", 9000 },
            { "acc_pointer_IR", "IR Pointer", 9000 },
            { "bipod_01_F_khk", "Khaki Bipod", 25000 },
            { "bipod_01_F_snd", "Sand Bipod", 25000 },
            { "bipod_01_F_blk", "Sand Bipod", 25000 }
        };
    };
 
    class gangbaseweb {
     name = "Gang Base Weapons";
     side = "civ";
     license = "gangmember";
     level[] = { "", "", -1, "" };
     items[] = {
            { "Binocular", "", 150, -1 },
            { "ItemGPS", "", 100, 45 },
            { "ItemMap", "", 50, 35 },
            { "ItemCompass", "", 50, 25 },
            { "ItemWatch", "", 50, -1 },
            { "FirstAidKit", "", 150, 65 },
            { "NVGoggles", "", 2000, 980 },
            { "ItemRadio", "CellPhone", 300, 50 },
            { "arifle_AKM_F", "", 350000, -1},
            { "srifle_DMR_01_F", "", 450000, -1},
            { "arifle_CTAR_hex_F", "", 450000, -1},
            { "arifle_MXM_F", "", 350000, -1},
            { "arifle_MX_F", "", 325000, -1},
            { "arifle_MXC_F", "", 350000, -1},
            { "arifle_AKS_F", "", 450000, -1},
            { "arifle_TRG21_F", "", 130000, -1},
            { "hgun_Pistol_heavy_01_F", "", 50000, -1},
            { "hgun_Pistol_01_F", "", 60000, -1 },
            { "hgun_Rook40_F", "", 40000, -1 }
        };
        mags[] = {
            { "30Rnd_762x39_Mag_Green_F", "AKM Ammo", 5000 },
            { "10Rnd_762x54_Mag", "Rahim Ammo", 5000 },
            { "30Rnd_580x42_Mag_Tracer_F", "CAR-95 Ammo", 5000 },
            { "30Rnd_65x39_caseless_mag_Tracer", "MX Ammo", 5000 },
            { "30Rnd_545x39_Mag_Green_F", "AKS-74U Ammo", 5000 },
            { "30Rnd_556x45_Stanag_Tracer_Red", "TRG-21 Ammo", 5000 },
            { "30Rnd_556x45_Stanag_Tracer_Red", "Mk20C Ammo", 5000 },
            { "20Rnd_556x45_UW_mag", "SDAR-UW Ammo", 5000 },
            { "30Rnd_65x39_caseless_green_mag_Tracer", "Katiba Carbine Ammo", 5000 },
            { "20Rnd_762x51_Mag", "Mk18 ABR Ammo", 5000 },
            { "200Rnd_65x39_cased_Box_Tracer", "Mk200 Ammo", 5000 },
            { "100Rnd_65x39_caseless_mag_Tracer", "MX SW Ammo", 5000 },
            { "20Rnd_762x51_Mag", "Mk-I EMR Ammo", 5000 },
            { "20Rnd_762x51_Mag", "Mk14 Ammo", 5000 },
            { "10Rnd_93x64_DMR_05_Mag", "Cyrus Ammo", 5000 },
            { "30Rnd_762x39_Mag_Tracer_Green_F", "AK-12 Ammo", 5000 },
            { "30Rnd_556x45_Stanag_Tracer_Yellow", "SPAR-16 Ammo", 5000 },
            { "150Rnd_556x45_Drum_Mag_Tracer_F", "SPAR-16S Ammo", 5000 },
            { "20Rnd_762x51_Mag", "SPAR-17 Ammo", 5000 },
            { "6Rnd_45ACP_Cylinder", "Zubr Ammo", 5000 },
            { "9Rnd_45ACP_Mag", "ACP-C2 Ammo", 5000 },
            { "30Rnd_9x21_Red_Mag", "Rook Ammo", 5000 }
        };
        accs[] = {
            { "optic_MRD", "MRD", 2000 },
            { "optic_Yorris", "Yorris", 2000 },
            { "optic_Aco", "ACO", 5000 },
            { "optic_Holosight", "Holosight", 9000 },
            { "optic_MRCO", "MRCO", 15000 },
            { "optic_Hamr", "RCO", 15000 },
            { "optic_Arco", "RCO", 15000 },
            { "optic_Arco_blk_F", "RCO", 15000 },
            { "optic_ERCO_snd_F", "ERCO", 15000 },
            { "optic_DMS", "DMS", 25000 },
            { "optic_NVS", "NVS", 25000 },
            { "optic_SOS", "SOS", 28000 },
            { "optic_LRPS", "LRPS", 25000 },
            { "bipod_01_F_blk", "Sand Bipod", 25000 },
            { "bipod_01_F_snd", "Sand Bipod", 25000 },
            { "muzzle_snds_H_MG", "", 175000 },
            { "muzzle_snds_H_snd_F", "", 175000 },
            { "muzzle_snds_B_snd_F", "", 175000 },
            { "muzzle_snds_58_blk_F", "", 100000 },
            { "muzzle_snds_H", "", 100000 },
            { "muzzle_snds_B", "", 90000 },
            { "muzzle_snds_M", "", 75000 },
            { "muzzle_snds_L", "", 30000 }
        };
    };
     
    class rebel {
        name = "Rebel Armoury";
        side = "civ";
        license = "rebel";
        level[] = { "", "", -1, "" };
        items[] = {
            { "Binocular", "", 150, -1 },
            { "ItemGPS", "", 100, 45 },
            { "ItemMap", "", 50, 35 },
            { "ItemCompass", "", 50, 25 },
            { "ItemWatch", "", 50, -1 },
            { "FirstAidKit", "", 150, 65 },
            { "NVGoggles", "", 2000, 980 },
            { "ItemRadio", "CellPhone", 300, 50 },
            { "arifle_SDAR_F", "", 90000, -1},
            { "arifle_Mk20C_F", "", 100000, -1},
            { "arifle_TRG21_F", "", 110000, -1},
            { "arifle_AKM_F", "", 130000, -1},
            { "arifle_MXC_F", "", 135000, -1},
            { "arifle_Katiba_C_F", "", 135000, -1},
            { "arifle_CTAR_hex_F", "", 140000, -1},
            { "arifle_MX_F", "", 155000, -1},
            { "arifle_Katiba_F", "", 155000, -1},
            { "srifle_DMR_01_F", "", 180000, -1},
            { "hgun_Rook40_F", "", 15000, -1 }
        };
        mags[] = {
            { "30Rnd_762x39_Mag_Green_F", "AKM Ammo", 2500 },
            { "10Rnd_762x54_Mag", "Rahim Ammo", 2500 },
            { "30Rnd_580x42_Mag_Tracer_F", "CAR-95 Ammo", 2500 },
            { "30Rnd_65x39_caseless_mag_Tracer", "MX Ammo", 2500 },
            { "30Rnd_545x39_Mag_Green_F", "AKS-74U Ammo", 2500 },
            { "30Rnd_556x45_Stanag_Tracer_Red", "TRG-21 Ammo", 2500 },
            { "30Rnd_556x45_Stanag_Tracer_Red", "Mk20C Ammo", 2500 },
            { "20Rnd_556x45_UW_mag", "SDAR-UW Ammo", 2500 },
            { "30Rnd_65x39_caseless_green_mag_Tracer", "Katiba Carbine Ammo", 2500 },
            { "20Rnd_762x51_Mag", "Mk18 ABR Ammo", 2500 },
            { "200Rnd_65x39_cased_Box_Tracer", "Mk200 Ammo", 2500 },
            { "100Rnd_65x39_caseless_mag_Tracer", "MX SW Ammo", 2500 },
            { "20Rnd_762x51_Mag", "Mk-I EMR Ammo", 2500 },
            { "20Rnd_762x51_Mag", "Mk14 Ammo", 2500 },
            { "10Rnd_93x64_DMR_05_Mag", "Cyrus Ammo", 5500 },
            { "30Rnd_762x39_Mag_Tracer_Green_F", "AK-12 Ammo", 2500 },
            { "30Rnd_556x45_Stanag_Tracer_Yellow", "SPAR-16 Ammo", 2500 },
            { "150Rnd_556x45_Drum_Mag_Tracer_F", "SPAR-16S Ammo", 2500 },
            { "20Rnd_762x51_Mag", "SPAR-17 Ammo", 2500 },
            { "6Rnd_45ACP_Cylinder", "Zubr Ammo", 2500 },
            { "9Rnd_45ACP_Mag", "ACP-C2 Ammo", 2500 },
            { "30Rnd_9x21_Red_Mag", "Rook Ammo", 2500 }
        };
        accs[] = {
            { "optic_Arco", "Yorris", 2000 },
            { "optic_Hamr", "Yorris", 2000 },
            { "optic_Aco", "Yorris", 2000 },
            { "optic_ACO_grn", "Yorris", 2000 },
            { "optic_Aco_smg", "Yorris", 2000 },
            { "optic_ACO_grn_smg", "Yorris", 2000 },
            { "optic_Holosight", "Yorris", 2000 },
            { "optic_Holosight_smg", "Yorris", 2000 },
            { "optic_DMS", "Yorris", 2000 },
            { "optic_Yorris", "Yorris", 2000 },
            { "optic_MRD", "Yorris", 2000 },
            { "acc_flashlight", "flashlight", 9000 },
            { "acc_pointer_IR", "IR Pointer", 9000 },
            { "bipod_01_F_khk", "Khaki Bipod", 25000 },
            { "bipod_01_F_snd", "Sand Bipod", 25000 },
            { "bipod_01_F_blk", "Sand Bipod", 25000 }
        };
    };
 
    class rebel_adv {
        name = "Advanced Rebel Armoury";
        side = "civ";
        license = "advrebel";
        level[] = { "", "", -1, "" };
        items[] = {
            { "Binocular", "", 150, -1 },
            { "ItemGPS", "", 100, 45 },
            { "ItemMap", "", 50, 35 },
            { "ItemCompass", "", 50, 25 },
            { "ItemWatch", "", 50, -1 },
            { "FirstAidKit", "", 150, 65 },
            { "NVGoggles", "", 2000, 980 },
            { "ItemRadio", "CellPhone", 300, 50 },
            { "arifle_SDAR_F", "", 67000, -1},
            { "arifle_Mk20C_F", "", 75000, -1},
            { "arifle_MXC_F", "", 101000, -1},
            { "arifle_Katiba_C_F", "", 101000, -1},
            { "arifle_AKM_F", "", 105000, -1},
            { "arifle_TRG21_F", "", 110000, -1},
            { "arifle_MX_F", "", 116000, -1},
            { "arifle_Katiba_F", "", 116000, -1},
            { "srifle_DMR_01_F", "", 135000, -1},
            { "arifle_CTAR_hex_F", "", 140000, -1},
            { "arifle_SPAR_01_snd_F", "SPAR-16", 150000, -1},
            { "arifle_MX_SW_F", "MX SW", 195000, -1},
            { "srifle_EBR_F", "Mk18 ABR", 200000, -1},
            { "srifle_DMR_03_khaki_F", "Mk-I EMR", 200000, -1},
            { "srifle_DMR_06_camo_F", "Mk14", 200000, -1},
            { "arifle_SPAR_03_snd_F", "SPAR-17", 210000, -1},
            { "arifle_SPAR_02_snd_F", "SPAR-16S", 220000, -1},
            { "LMG_Mk200_F", "Mk200", 250000, -1},
            { "SmokeShellRed", "Red Smoke", 75000, -1 }
        };
        mags[] = {
            { "RPG7_F", "RPG7 Ammo", 900000 },
            { "RPG32_F", "RPG32 Ammo", 900000 },
            { "30Rnd_762x39_Mag_Green_F", "AKM Ammo", 2500 },
            { "10Rnd_762x54_Mag", "Rahim Ammo", 2500 },
            { "30Rnd_580x42_Mag_Tracer_F", "CAR-95 Ammo", 2500 },
            { "30Rnd_65x39_caseless_mag_Tracer", "MX Ammo", 2500 },
            { "30Rnd_545x39_Mag_Green_F", "AKS-74U Ammo", 2500 },
            { "30Rnd_556x45_Stanag_Tracer_Red", "TRG-21 Ammo", 2500 },
            { "30Rnd_556x45_Stanag_Tracer_Red", "Mk20C Ammo", 2500 },
            { "20Rnd_556x45_UW_mag", "SDAR-UW Ammo", 2500 },
            { "30Rnd_65x39_caseless_green_mag_Tracer", "Katiba Carbine Ammo", 2500 },
            { "20Rnd_762x51_Mag", "Mk18 ABR Ammo", 2500 },
            { "200Rnd_65x39_cased_Box_Tracer", "Mk200 Ammo", 2500 },
            { "100Rnd_65x39_caseless_mag_Tracer", "MX SW Ammo", 2500 },
            { "20Rnd_762x51_Mag", "Mk-I EMR Ammo", 2500 },
            { "20Rnd_762x51_Mag", "Mk14 Ammo", 2500 },
            { "10Rnd_93x64_DMR_05_Mag", "Cyrus Ammo", 5500 },
            { "30Rnd_762x39_Mag_Tracer_Green_F", "AK-12 Ammo", 2500 },
            { "30Rnd_556x45_Stanag_Tracer_Yellow", "SPAR-16 Ammo", 2500 },
            { "150Rnd_556x45_Drum_Mag_Tracer_F", "SPAR-16S Ammo", 2500 },
            { "20Rnd_762x51_Mag", "SPAR-17 Ammo", 2500 },
            { "10Rnd_127x54_Mag", "ASP Ammo", 2500 },
            { "6Rnd_45ACP_Cylinder", "Zubr Ammo", 2500 },
            { "9Rnd_45ACP_Mag", "ACP-C2 Ammo", 2500 },
            { "30Rnd_9x21_Red_Mag", "Rook Ammo", 2500 }
           
        };
        accs[] = {
            { "optic_Arco", "Yorris", 2000 },
            { "optic_Hamr", "Yorris", 2000 },
            { "optic_Aco", "Yorris", 2000 },
            { "optic_ACO_grn", "Yorris", 2000 },
            { "optic_Aco_smg", "Yorris", 2000 },
            { "optic_ACO_grn_smg", "Yorris", 2000 },
            { "optic_Holosight", "Yorris", 2000 },
            { "optic_Holosight_smg", "Yorris", 2000 },
            { "optic_DMS", "Yorris", 2000 },
            { "optic_Yorris", "Yorris", 2000 },
            { "optic_MRD", "Yorris", 2000 },
            { "acc_flashlight", "flashlight", 9000 },
            { "acc_pointer_IR", "IR Pointer", 9000 },
            { "bipod_01_F_khk", "Khaki Bipod", 25000 },
            { "bipod_01_F_snd", "Sand Bipod", 25000 },
            { "bipod_01_F_blk", "Sand Bipod", 25000 }
        };
    };
     
    class bounty_hunter_w {
        name = "Bounty Hunter Armoury";
        side = "civ";
        license = "bountyhunter";
        level[] = { "", "", -1, "" };
        items[] = {
            { "SMG_01_F", "Taser Rifle", 0, -1},
            { "hgun_P07_snds_F", "Taser Pistol", 0, -1},
            { "NVGoggles", "", 0, 0 }
        };
        mags[] = {
            { "30Rnd_45ACP_Mag_SMG_01_Tracer_Green", "Taser Rifle Mag", 0 },
            { "16Rnd_9x21_Mag", "Taser Mag", 0 }
        };
        accs[] = {
            { "muzzle_snds_acp", "Pistol Silencer", 0 },
            { "optic_ACO_grn_smg", "", 0 },
            { "optic_Aco_smg", "", 0 }
        };
    };
     
    class advbounty_hunter_w {
        name = "Adv Bounty Hunter Armoury";
        side = "civ";
        license = "bountyhunter";
        level[] = { "", "", -1, "" };
        items[] = {
            { "SMG_01_F", "Taser Rifle", 0, -1},
            { "hgun_P07_snds_F", "Taser Pistol", 0, -1},
            { "NVGoggles", "", 0, 0 }
        };
        mags[] = {
            { "30Rnd_45ACP_Mag_SMG_01_Tracer_Green", "Taser Rifle Mag", 0 },
            { "16Rnd_9x21_Mag", "Taser Mag", 0 }
        };
        accs[] = {
            { "muzzle_snds_acp", "Pistol Silencer", 0 },
            { "optic_ACO_grn_smg", "", 0 },
            { "optic_Aco_smg", "", 0 }
        };
    };
     
    class corp {
        name = "Syndicate Armoury";
        side = "civ";
        license = "corp";
        level[] = { "", "", -1, "" };
        items[] = {
            { "arifle_ARX_ghex_F", "", 400000, -1},
            { "arifle_SPAR_03_khk_F", "", 300000, -1},
            { "arifle_SPAR_01_khk_F", "", 150000, -1},
            { "arifle_MX_khk_F", "", 200000, -1},
            { "arifle_MXC_khk_F", "", 125000, -1},
            { "arifle_Mk20C_F", "", 70000, -1},
            { "SMG_02_F", "", 50000, -1},
            { "hgun_Pistol_heavy_01_F", "", 20000, -1},
            { "hgun_Pistol_heavy_02_F", "", 30000, -1},
            { "hgun_Pistol_01_F", "", 17000, -1 },
            { "hgun_P07_khk_F", "", 17000, -1},
            { "hgun_Rook40_F", "", 13000, -1 }
    };
        mags[] = {
            //{ "20Rnd_762x51_Mag", "", 1500 },
            { "30Rnd_65x39_caseless_mag", "", 2400 },
            { "10Rnd_9x21_Mag", "", 1000 },
            { "30Rnd_65x39_caseless_green", "", 2400 },
            { "30Rnd_556x45_Stanag", "", 2400 },
            { "30Rnd_9x21_Mag_SMG_02", "", 1800 },
            { "30Rnd_9x21_Mag", "", 900 },
            { "16Rnd_9x21_Mag", "", 500 },
            { "9Rnd_45ACP_Mag", "", 500 },
            { "10Rnd_9x21_Mag", "", 1000 },
            { "11Rnd_45ACP_Mag", "", 1000 },
            { "6Rnd_45ACP_Cylinder", "", 2000 }
        };
        accs[] = {
            { "optic_Yorris", "Yorris", 2000 },
            { "optic_ACO_grn_smg", "SMG Green ACO", 3000 },
            { "optic_Aco_smg", "SMG Red ACO", 3000 },
            { "optic_Aco", "Red ACO", 5000 },
            { "optic_ACO_grn", "Green ACO", 5000 },
            { "optic_Holosight_smg", "SMG Holosight", 7000 },
            { "optic_Holosight", "Holosight", 9000 },
            { "optic_Holosight_khk_F", "Holosightk", 9000 },
            { "optic_MRCO", "MRCO", 15000 },
            { "optic_Hamr", "RCO", 15000 },
            { "optic_Hamr_khk_F", "RCOk", 15000 },
            { "optic_Arco_blk_F", "Black ARCO", 15000 },
            { "optic_Arco_ghex_F", "Green ARCO", 15000 },
            { "optic_ERCO_blk_F", "ERCO", 15000 },
            { "optic_ERCO_khk_F", "Khaki ERCO", 15000 },
            { "optic_DMS", "DMS", 25000 },
            { "optic_DMS_ghex_F", "Green DMS", 25000 },
            { "optic_AMS", "AMS", 25000 },
            { "optic_AMS_khk", "Khaki AMS", 25000 },
            { "optic_NVS", "NVS", 25000 },
            { "optic_SOS", "SOS", 28000 },
            { "optic_SOS_khk_F", "Green SOS", 28000 },
            { "optic_LRPS", "LRPS", 25000 },
            { "optic_LRPS_tna_F", "Green LRPS", 25000 },
            { "bipod_01_F_blk", "Bipod", 25000 },
            { "bipod_01_F_khk", "Bipod", 25000 }
        };
    };
 
    class corp_adv {
        name = "Advanced Syndicate Armoury";
        side = "civ";
        license = "advcorp";
        level[] = { "", "", -1, "" };
        items[] = {
            { "srifle_DMR_03_khaki_F", "", 600000, -1},
            { "srifle_DMR_06_olive_F", "", 500000, -1},
            { "srifle_EBR_F", "", 450000, -1},
            { "arifle_ARX_ghex_F", "", 400000, -1},
            { "arifle_SPAR_03_khk_F", "", 300000, -1},
            { "arifle_MX_SW_khk_F", "", 375000, -1},
            { "arifle_SPAR_02_khk_F", "", 300000, -1},
            { "arifle_SPAR_01_GL_khk_F", "", 200000, -1},
            { "arifle_SPAR_01_khk_F", "", 150000, -1},
            { "arifle_Mk20_GL_F", "", 110000, -1},
            { "arifle_Mk20C_F", "", 75000, -1},
            { "arifle_MX_GL_khk_F", "", 200000, -1},
            { "arifle_MXM_khk_F", "", 200000, -1},
            { "SMG_02_F", "", 50000, -1},
            { "hgun_Pistol_heavy_01_F", "", 20000, -1},
            { "hgun_Pistol_heavy_02_F", "", 30000, -1},
            { "hgun_Pistol_01_F", "", 17000, -1 },
            { "hgun_P07_khk_F", "", 17000, -1},
            { "hgun_Rook40_F", "", 13000, -1 },
            { "", "===Special Mags===", 999999, -1 },
      //{ "10Rnd_50BW_Mag_F", "", 50000 },
            { "UGL_FlareWhite_F", "", 15000 },
            { "UGL_FlareGreen_F", "", 15000 },
            { "UGL_FlareRed_F", "", 15000 },
            { "1Rnd_Smoke_Grenade_shell", "", 15000 },
            { "1Rnd_SmokeRed_Grenade_shell", "", 15000 },
            { "1Rnd_SmokeGreen_Grenade_shell", "", 15000}
        };
        mags[] = {
            //{ "10Rnd_50BW_Mag_F", "", 50000 },
            { "20Rnd_762x51_Mag", "", 5000 },
            { "100Rnd_65x39_caseless_mag", "", 4500 },
            { "150Rnd_556x45_Drum_Mag_F", "", 4500 },
            { "10Rnd_9x21_Mag", "", 1000 },
            { "30Rnd_65x39_caseless_green", "", 2500 },
            { "30Rnd_556x45_Stanag", "", 1800 },
            { "30Rnd_65x39_caseless_mag", "", 2400 },
            { "30Rnd_9x21_Mag_SMG_02", "", 1800 },
            { "30Rnd_9x21_Mag", "", 900 },
            { "16Rnd_9x21_Mag", "", 500 },
            { "11Rnd_45ACP_Mag", "", 500 },
            { "9Rnd_45ACP_Mag", "", 500 },
            { "6Rnd_45ACP_Cylinder", "", 500 },
            { "UGL_FlareWhite_F", "", 15000 },
            { "UGL_FlareGreen_F", "", 15000 },
            { "UGL_FlareRed_F", "", 15000 },
            { "1Rnd_Smoke_Grenade_shell", "", 15000 },
            { "1Rnd_SmokeRed_Grenade_shell", "", 15000 },
            { "1Rnd_SmokeGreen_Grenade_shell", "", 15000}
        };
        accs[] = {
            { "optic_Yorris", "Yorris", 2000 },
            { "optic_ACO_grn_smg", "SMG Green ACO", 3000 },
            { "optic_Aco_smg", "SMG Red ACO", 3000 },
            { "optic_Aco", "Red ACO", 5000 },
            { "optic_ACO_grn", "Green ACO", 5000 },
            { "optic_Holosight_smg", "SMG Holosight", 7000 },
            { "optic_Holosight", "Holosight", 9000 },
            { "optic_Holosight_khk_F", "Holosightk", 9000 },
            { "optic_MRCO", "MRCO", 15000 },
            { "optic_Hamr", "RCO", 15000 },
            { "optic_Hamr_khk_F", "RCOk", 15000 },
            { "optic_Arco_blk_F", "Black ARCO", 15000 },
            { "optic_Arco_ghex_F", "Green ARCO", 15000 },
            { "optic_ERCO_blk_F", "ERCO", 15000 },
            { "optic_ERCO_khk_F", "Khaki ERCO", 15000 },
            { "optic_DMS", "DMS", 25000 },
            { "optic_DMS_ghex_F", "Green DMS", 25000 },
            { "optic_AMS", "AMS", 25000 },
            { "optic_AMS_khk", "Khaki AMS", 25000 },
            { "optic_NVS", "NVS", 25000 },
            { "optic_SOS", "SOS", 28000 },
            { "optic_SOS_khk_F", "Green SOS", 28000 },
            { "optic_LRPS", "LRPS", 25000 },
            { "optic_LRPS_tna_F", "Green LRPS", 25000 },
            { "bipod_01_F_khk", "Khaki Bipod", 25000 },
            { "bipod_01_F_snd", "Sand Bipod", 25000 },
            { "muzzle_snds_B_khk_F", "", 175000 },
            { "muzzle_snds_B", "", 175000 },
            { "muzzle_snds_m_khk_F", "", 100000 },
            { "muzzle_snds_H_khk_F", "", 90000 },
            { "muzzle_snds_M", "", 75000 },
            { "muzzle_snds_m_khk_F", "", 50000 },
            { "muzzle_snds_L", "", 10000 }
        };
    };
     
    class gang {
        name = "Hideout Weapons";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "Binocular", "", 150, -1 },
            { "ItemGPS", "", 100, 45 },
            { "ItemMap", "", 50, 35 },
            { "ItemCompass", "", 50, 25 },
            { "ItemWatch", "", 50, -1 },
            { "FirstAidKit", "", 150, 65 },
            { "NVGoggles", "", 2000, 980 },
            { "ItemRadio", "CellPhone", 300, 50 },
            { "arifle_SDAR_F", "", 130000, -1},
            { "arifle_Mk20C_F", "", 200000, -1},
            { "arifle_TRG21_F", "", 210000, -1},
            { "arifle_AKM_F", "", 230000, -1},
            { "arifle_MXC_F", "", 235000, -1},
            { "arifle_Katiba_C_F", "", 235000, -1},
            { "hgun_Rook40_F", "", 25000, -1 }
        };
        mags[] = {
            { "30Rnd_762x39_Mag_Green_F", "AKM Ammo", 2500 },
            { "10Rnd_762x54_Mag", "Rahim Ammo", 2500 },
            { "30Rnd_580x42_Mag_Tracer_F", "CAR-95 Ammo", 2500 },
            { "30Rnd_65x39_caseless_mag_Tracer", "MX Ammo", 2500 },
            { "30Rnd_545x39_Mag_Green_F", "AKS-74U Ammo", 2500 },
            { "30Rnd_556x45_Stanag_Tracer_Red", "TRG-21 Ammo", 2500 },
            { "30Rnd_556x45_Stanag_Tracer_Red", "Mk20C Ammo", 2500 },
            { "20Rnd_556x45_UW_mag", "SDAR-UW Ammo", 2500 },
            { "30Rnd_65x39_caseless_green_mag_Tracer", "Katiba Carbine Ammo", 2500 },
            { "20Rnd_762x51_Mag", "Mk18 ABR Ammo", 2500 },
            { "200Rnd_65x39_cased_Box_Tracer", "Mk200 Ammo", 2500 },
            { "100Rnd_65x39_caseless_mag_Tracer", "MX SW Ammo", 2500 },
            { "20Rnd_762x51_Mag", "Mk-I EMR Ammo", 2500 },
            { "20Rnd_762x51_Mag", "Mk14 Ammo", 2500 },
            { "10Rnd_93x64_DMR_05_Mag", "Cyrus Ammo", 5500 },
            { "30Rnd_762x39_Mag_Tracer_Green_F", "AK-12 Ammo", 2500 },
            { "30Rnd_556x45_Stanag_Tracer_Yellow", "SPAR-16 Ammo", 2500 },
            { "150Rnd_556x45_Drum_Mag_Tracer_F", "SPAR-16S Ammo", 2500 },
            { "20Rnd_762x51_Mag", "SPAR-17 Ammo", 2500 },
            { "6Rnd_45ACP_Cylinder", "Zubr Ammo", 2500 },
            { "9Rnd_45ACP_Mag", "ACP-C2 Ammo", 2500 },
            { "30Rnd_9x21_Red_Mag", "Rook Ammo", 2500 }
        };
        accs[] = {
            { "optic_Arco", "Yorris", 2000 },
            { "optic_Hamr", "Yorris", 2000 },
            { "optic_Aco", "Yorris", 2000 },
            { "optic_ACO_grn", "Yorris", 2000 },
            { "optic_Aco_smg", "Yorris", 2000 },
            { "optic_ACO_grn_smg", "Yorris", 2000 },
            { "optic_Holosight", "Yorris", 2000 },
            { "optic_Holosight_smg", "Yorris", 2000 },
            { "optic_DMS", "Yorris", 2000 },
            { "optic_Yorris", "Yorris", 2000 },
            { "optic_MRD", "Yorris", 2000 },
            { "acc_flashlight", "flashlight", 9000 },
            { "acc_pointer_IR", "IR Pointer", 9000 },
            { "bipod_01_F_khk", "Khaki Bipod", 25000 },
            { "bipod_01_F_snd", "Sand Bipod", 25000 },
            { "bipod_01_F_blk", "Sand Bipod", 25000 }
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
            { "FirstAidKit", "", 150, 65 },
            { "NVGoggles", "", 2000, 980 },
            { "ItemRadio", "CellPhone", 300, 50 }
        };
        mags[] = {};
        accs[] = {};
    };
     
    class Corp_genstore {
        name = "Syndicate General Store";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "Binocular", "", 150, -1 },
            { "ItemGPS", "", 100, 45 },
            { "ItemMap", "", 50, 35 },
            { "ItemCompass", "", 50, 25 },
            { "ItemWatch", "", 50, -1 },
            { "FirstAidKit", "", 150, 65 },
            { "NVGoggles", "", 2000, 980 },
            { "Chemlight_red", "", 300, -1 },
            { "Chemlight_yellow", "", 300, 50 },
            { "Chemlight_green", "", 300, 50 },
            { "ItemRadio", "CellPhone", 300, 50 },
            { "Chemlight_blue", "", 300, 50 }
        };
        mags[] = {};
        accs[] = {};
    };
     
    class bounty_genstore {
        name = "Bounty Hunter General Store";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "Binocular", "", 150, -1 },
            { "ItemGPS", "", 100, 45 },
            { "ItemMap", "", 50, 35 },
            { "ItemCompass", "", 50, 25 },
            { "ItemWatch", "", 50, -1 },
            { "FirstAidKit", "", 150, 65 },
            { "NVGoggles", "", 2000, 980 },
            { "Chemlight_red", "", 300, -1 },
            { "Chemlight_yellow", "", 300, 50 },
            { "Chemlight_green", "", 300, 50 },
            { "ItemRadio", "CellPhone", 300, 50 },
            { "Chemlight_blue", "", 300, 50 }
        };
        mags[] = {};
        accs[] = {};
    };
     
    class cop_genstore {
        name = "Police General Store";
        side = "cop";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "Rangefinder", "", 750, -1 },
            { "ItemGPS", "", 500, 45 },
            { "ItemMap", "", 250, 35 },
            { "ItemCompass", "", 250, 25 },
            { "ItemWatch", "", 250, -1 },
            { "NVGoggles_OPFOR", "", 1000, 980 },
            { "ItemRadio", "CellPhone", 300, 50 },
            { "Medikit", "",0, -1 }
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
            { "ItemRadio", "CellPhone", 300, 50 }
        };
        mags[] = {};
        accs[] = {};
    };
//-- Public Police
 
    //Cadet
    class cop_1 {
        name = "Police Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 1, "You must be a Cadet!" };
        items[] = {
            { "hgun_P07_snds_F", "Tazer Pistol", 0 },
            { "SMG_01_F", "Vermin", 0 }
        };
        mags[] = {
            { "30Rnd_45ACP_Mag_SMG_01", "VerminAmmo", 0 },
            { "16Rnd_9x21_Mag", "Tazer Rounds", 0 }
        };
    };
   // Officer
    class cop_2 {
        name = "Police Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 2, "You must be a Police Officer!" };
        items[] = {
            { "hgun_P07_snds_F", "Tazer Pistol", 0 },
            { "SMG_01_F", "Vermin", 0 },
            { "arifle_MXC_Black_F", "MXC", 0 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "Tazer Rounds", 0 },
            { "30Rnd_45ACP_Mag_SMG_01", "VerminAmmo", 0 },
            { "30Rnd_556x45_Stanag", "MK20Ammo", 0 },
            { "30Rnd_65x39_caseless_mag", "MXAmmo", 0 },
            { "30Rnd_65x39_caseless_green", "ARXAmmo", 0 },
            { "30Rnd_556x45_Stanag", "Spar16Ammo", 0 },
            { "30Rnd_65x39_caseless_mag", "Type115 Ammo", 0},
            { "150Rnd_556x45_Drum_Mag_F", "Spar16SAmmo", 0 }
        };
        accs[] = {
            { "optic_Arco", "Yorris", 2000 },
            { "optic_Hamr", "Yorris", 2000 },
            { "optic_Aco", "Yorris", 2000 },
            { "optic_ACO_grn", "Yorris", 2000 },
            { "optic_Aco_smg", "Yorris", 2000 },
            { "optic_ACO_grn_smg", "Yorris", 2000 },
            { "optic_Holosight", "Yorris", 2000 },
            { "optic_Holosight_smg", "Yorris", 2000 },
            { "optic_Yorris", "Yorris", 2000 },
            { "optic_MRD", "Yorris", 2000 },
            { "acc_flashlight", "flashlight", 9000 },
            { "acc_pointer_IR", "IR Pointer", 9000 },
            { "bipod_01_F_khk", "Khaki Bipod", 25000 },
            { "bipod_01_F_snd", "Sand Bipod", 25000 },
            { "bipod_01_F_blk", "Sand Bipod", 25000 }
        };
    };
    // Corporal
    class cop_3 {
        name = "Police Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 3, "You must be a SPC!" };
        items[] = {
            { "hgun_P07_snds_F", "Tazer Pistol", 0 },
            { "SMG_01_F", "Vermin", 0 },
            { "arifle_MXC_Black_F", "MXC", 0 },
            { "arifle_MX_Black_F", "MX", 0 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "Tazer Rounds", 0 },
            { "30Rnd_45ACP_Mag_SMG_01", "VerminAmmo", 0 },
            { "30Rnd_556x45_Stanag", "MK20Ammo", 0 },
            { "30Rnd_65x39_caseless_mag", "MXAmmo", 0 },
            { "30Rnd_65x39_caseless_green", "ARXAmmo", 0 },
            { "30Rnd_556x45_Stanag", "Spar16Ammo", 0 },
            { "150Rnd_556x45_Drum_Mag_F", "Spar16SAmmo", 0 }
        };
        accs[] = {
            { "optic_Arco", "Yorris", 2000 },
            { "optic_Hamr", "Yorris", 2000 },
            { "optic_Aco", "Yorris", 2000 },
            { "optic_ACO_grn", "Yorris", 2000 },
            { "optic_Aco_smg", "Yorris", 2000 },
            { "optic_ACO_grn_smg", "Yorris", 2000 },
            { "optic_Holosight", "Yorris", 2000 },
            { "optic_Holosight_smg", "Yorris", 2000 },
            { "optic_DMS", "Yorris", 2000 },
            { "optic_Yorris", "Yorris", 2000 },
            { "optic_MRD", "Yorris", 2000 },
            { "acc_flashlight", "flashlight", 9000 },
            { "acc_pointer_IR", "IR Pointer", 9000 },
            { "bipod_01_F_khk", "Khaki Bipod", 25000 },
            { "bipod_01_F_snd", "Sand Bipod", 25000 },
            { "bipod_01_F_blk", "Sand Bipod", 25000 }
        };
    };
    // Sergeant
    class cop_4 {
        name = "Police Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 4, "You must be a A/Sgt!" };
        items[] = {
            { "hgun_P07_snds_F", "Tazer Pistol", 0 },
            { "SMG_01_F", "Vermin", 0 },
            { "arifle_MXC_Black_F", "MXC", 0 },
            { "arifle_MX_Black_F", "MX", 0 },
            { "arifle_MX_SW_Black_F", "MXSW", 0 }
             
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "Tazer Rounds", 0 },
            { "30Rnd_45ACP_Mag_SMG_01", "VerminAmmo", 0 },
            { "30Rnd_556x45_Stanag", "MK20Ammo", 0 },
            { "30Rnd_65x39_caseless_mag", "MXAmmo", 0 },
            { "100Rnd_65x39_caseless_mag", "MXSWAmmo", 0 },
            { "30Rnd_65x39_caseless_green", "ARXAmmo", 0 },
            { "30Rnd_556x45_Stanag", "Spar16Ammo", 0 },
            { "150Rnd_556x45_Drum_Mag_F", "Spar16SAmmo", 0 }
        };
        accs[] = {
            { "optic_Arco", "Yorris", 2000 },
            { "optic_Hamr", "Yorris", 2000 },
            { "optic_Aco", "Yorris", 2000 },
            { "optic_ACO_grn", "Yorris", 2000 },
            { "optic_Aco_smg", "Yorris", 2000 },
            { "optic_ACO_grn_smg", "Yorris", 2000 },
            { "optic_Holosight", "Yorris", 2000 },
            { "optic_Holosight_smg", "Yorris", 2000 },
            { "optic_DMS", "Yorris", 2000 },
            { "optic_Yorris", "Yorris", 2000 },
            { "optic_MRD", "Yorris", 2000 },
            { "acc_flashlight", "flashlight", 9000 },
            { "acc_pointer_IR", "IR Pointer", 9000 },
            { "bipod_01_F_khk", "Khaki Bipod", 25000 },
            { "bipod_01_F_snd", "Sand Bipod", 25000 },
            { "bipod_01_F_blk", "Sand Bipod", 25000 }
        };
    };
    // Lieutenant
    class cop_5 {
        name = "Police Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 5, "You must be a SGT!" };
        items[] = {
            { "hgun_P07_snds_F", "Tazer Pistol", 0 },
            { "SMG_01_F", "Vermin", 0 },
            { "arifle_MXC_Black_F", "MXC", 0 },
            { "arifle_MX_Black_F", "MX", 0 },
            { "arifle_MX_SW_Black_F", "MXSW", 0 },
            { "arifle_SPAR_01_blk_F", "Spar16", 20000 },
            { "arifle_ARX_blk_F", "Type 115", 20000 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "Tazer Rounds", 0 },
            { "30Rnd_45ACP_Mag_SMG_01", "VerminAmmo", 0 },
            { "30Rnd_556x45_Stanag", "MK20Ammo", 0 },
            { "30Rnd_65x39_caseless_mag", "MXAmmo", 0 },
            { "100Rnd_65x39_caseless_mag", "MXSWAmmo", 0 },
            { "30Rnd_65x39_caseless_green", "ARXAmmo", 0 },
            { "30Rnd_556x45_Stanag", "Spar16Ammo", 0 },
            { "150Rnd_556x45_Drum_Mag_F", "Spar16SAmmo", 0 }
        };
        accs[] = {
            { "optic_Arco", "Yorris", 2000 },
            { "optic_Hamr", "Yorris", 2000 },
            { "optic_Aco", "Yorris", 2000 },
            { "optic_ACO_grn", "Yorris", 2000 },
            { "optic_Aco_smg", "Yorris", 2000 },
            { "optic_ACO_grn_smg", "Yorris", 2000 },
            { "optic_Holosight", "Yorris", 2000 },
            { "optic_Holosight_smg", "Yorris", 2000 },
            { "optic_DMS", "Yorris", 2000 },
            { "optic_Yorris", "Yorris", 2000 },
            { "optic_MRD", "Yorris", 2000 },
            { "acc_flashlight", "flashlight", 9000 },
            { "acc_pointer_IR", "IR Pointer", 9000 },
            { "bipod_01_F_khk", "Khaki Bipod", 25000 },
            { "bipod_01_F_snd", "Sand Bipod", 25000 },
            { "bipod_01_F_blk", "Sand Bipod", 25000 }
        };
    };
    // Captain
    class cop_6 {
        name = "Police Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 6, "You must be a Ins!" };
        items[] = {
            { "hgun_P07_snds_F", "Tazer Pistol", 0 },
            { "SMG_01_F", "Vermin", 0 },
            { "arifle_MXC_Black_F", "MXC", 0 },
            { "arifle_MX_Black_F", "MX", 0 },
            { "arifle_MXM_Black_F", "MXM", 0 },
            { "arifle_MX_SW_Black_F", "MXSW", 0 },
            { "arifle_ARX_blk_F", "ARX", 20000 },
            { "arifle_SPAR_01_blk_F", "Spar16", 20000 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "Tazer Rounds", 0 },
            { "30Rnd_45ACP_Mag_SMG_01", "VerminAmmo", 0 },
            { "30Rnd_556x45_Stanag", "MK20Ammo", 0 },
            { "30Rnd_65x39_caseless_mag", "MXAmmo", 0 },
            { "100Rnd_65x39_caseless_mag", "MXSWAmmo", 0 },
            { "30Rnd_65x39_caseless_green", "ARXAmmo", 0 },
            { "30Rnd_556x45_Stanag", "Spar16Ammo", 0 },
            { "150Rnd_556x45_Drum_Mag_F", "Spar16SAmmo", 0 },
            { "20Rnd_762x51_Mag", "7.62Ammo", 0 }
        };
        accs[] = {
            { "optic_Arco", "Yorris", 2000 },
            { "optic_Hamr", "Yorris", 2000 },
            { "optic_Aco", "Yorris", 2000 },
            { "optic_ACO_grn", "Yorris", 2000 },
            { "optic_Aco_smg", "Yorris", 2000 },
            { "optic_ACO_grn_smg", "Yorris", 2000 },
            { "optic_Holosight", "Yorris", 2000 },
            { "optic_Holosight_smg", "Yorris", 2000 },
            { "optic_DMS", "Yorris", 2000 },
            { "optic_Yorris", "Yorris", 2000 },
            { "optic_MRD", "Yorris", 2000 },
            { "acc_flashlight", "flashlight", 9000 },
            { "acc_pointer_IR", "IR Pointer", 9000 },
            { "bipod_01_F_khk", "Khaki Bipod", 25000 },
            { "bipod_01_F_snd", "Sand Bipod", 25000 },
            { "bipod_01_F_blk", "Sand Bipod", 25000 }
        };
    };
    class cop_7 {
        name = "Police Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 7, "You must be a CI!" };
        items[] = {
            { "hgun_P07_snds_F", "Tazer Pistol", 0 },
            { "SMG_01_F", "Vermin", 0 },
            { "arifle_MXC_Black_F", "MXC", 0 },
            { "arifle_MX_Black_F", "MX", 0 },
            { "arifle_MXM_Black_F", "MXM", 0 },
            { "arifle_MX_SW_Black_F", "MXSW", 0 },
            { "arifle_ARX_blk_F", "ARX", 20000 },
            { "arifle_SPAR_01_blk_F", "Spar16", 20000 },
            { "srifle_EBR_F", "MK18", 20000 },
            { "arifle_SPAR_03_blk_F", "Spar17", 20000 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "Tazer Rounds", 0 },
            { "30Rnd_45ACP_Mag_SMG_01", "VerminAmmo", 0 },
            { "30Rnd_556x45_Stanag", "MK20Ammo", 0 },
            { "30Rnd_65x39_caseless_mag", "MXAmmo", 0 },
            { "100Rnd_65x39_caseless_mag", "MXSWAmmo", 0 },
            { "30Rnd_65x39_caseless_green", "ARXAmmo", 0 },
            { "30Rnd_556x45_Stanag", "Spar16Ammo", 0 },
            { "150Rnd_556x45_Drum_Mag_F", "Spar16SAmmo", 0 },
            { "20Rnd_762x51_Mag", "7.62Ammo", 0 }
        };
        accs[] = {
            { "optic_Arco", "Yorris", 2000 },
            { "optic_Hamr", "Yorris", 2000 },
            { "optic_Aco", "Yorris", 2000 },
            { "optic_ACO_grn", "Yorris", 2000 },
            { "optic_Aco_smg", "Yorris", 2000 },
            { "optic_ACO_grn_smg", "Yorris", 2000 },
            { "optic_Holosight", "Yorris", 2000 },
            { "optic_Holosight_smg", "Yorris", 2000 },
            { "optic_DMS", "Yorris", 2000 },
            { "optic_Yorris", "Yorris", 2000 },
            { "optic_MRD", "Yorris", 2000 },
            { "acc_flashlight", "flashlight", 9000 },
            { "acc_pointer_IR", "IR Pointer", 9000 },
            { "bipod_01_F_khk", "Khaki Bipod", 25000 },
            { "bipod_01_F_snd", "Sand Bipod", 25000 },
            { "bipod_01_F_blk", "Sand Bipod", 25000 }
        };
    };
    class cop_8 {
        name = "Police Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 8, "You must be a SI!" };
        items[] = {
            { "hgun_P07_snds_F", "Tazer Pistol", 0 },
            { "SMG_01_F", "Vermin", 0 },
            { "arifle_MXC_Black_F", "MXC", 0 },
            { "arifle_MX_Black_F", "MX", 0 },
            { "arifle_MXM_Black_F", "MXM", 0 },
            { "arifle_MX_SW_Black_F", "MXSW", 0 },
            { "arifle_ARX_blk_F", "ARX", 20000 },
            { "arifle_SPAR_01_blk_F", "Spar16", 20000 },
            { "srifle_EBR_F", "MK18", 20000 },
            { "arifle_SPAR_03_blk_F", "Spar17", 20000 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "Tazer Rounds", 0 },
            { "30Rnd_45ACP_Mag_SMG_01", "VerminAmmo", 0 },
            { "30Rnd_556x45_Stanag", "MK20Ammo", 0 },
            { "30Rnd_65x39_caseless_mag", "MXAmmo", 0 },
            { "100Rnd_65x39_caseless_mag", "MXSWAmmo", 0 },
            { "30Rnd_65x39_caseless_green", "ARXAmmo", 0 },
            { "30Rnd_556x45_Stanag", "Spar16Ammo", 0 },
            { "150Rnd_556x45_Drum_Mag_F", "Spar16SAmmo", 0 },
            { "10Rnd_93x64_DMR_05_Mag", "CyrusAmmo", 0 },
            { "20Rnd_762x51_Mag", "7.62Ammo", 0 }
        };
        accs[] = {
        { "optic_Arco", "Yorris", 2000 },
            { "optic_Hamr", "Yorris", 2000 },
            { "optic_Aco", "Yorris", 2000 },
            { "optic_ACO_grn", "Yorris", 2000 },
            { "optic_Aco_smg", "Yorris", 2000 },
            { "optic_ACO_grn_smg", "Yorris", 2000 },
            { "optic_Holosight", "Yorris", 2000 },
            { "optic_Holosight_smg", "Yorris", 2000 },
            { "optic_DMS", "Yorris", 2000 },
            { "optic_Yorris", "Yorris", 2000 },
            { "optic_MRD", "Yorris", 2000 },
            { "acc_flashlight", "flashlight", 9000 },
            { "acc_pointer_IR", "IR Pointer", 9000 },
            { "muzzle_snds_M", "5.5 Sus", 9000 },
            { "bipod_01_F_khk", "Khaki Bipod", 25000 },
            { "bipod_01_F_snd", "Sand Bipod", 25000 },
            { "bipod_01_F_blk", "Sand Bipod", 25000 }
        };
    };
    class cop_9 {
        name = "Police Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 9, "You must be a CSI!" };
        items[] = {
            { "hgun_P07_snds_F", "Tazer Pistol", 0 },
            { "SMG_01_F", "Vermin", 0 },
            { "arifle_MXC_Black_F", "MXC", 0 },
            { "arifle_MX_Black_F", "MX", 0 },
            { "arifle_MXM_Black_F", "MXM", 0 },
            { "arifle_MX_SW_Black_F", "MXSW", 0 },
            { "arifle_ARX_blk_F", "ARX", 20000 },
            { "arifle_SPAR_01_blk_F", "Spar16", 20000 },
            { "srifle_EBR_F", "MK18", 20000 },
            { "arifle_SPAR_03_blk_F", "Spar17", 20000 }
        };
        mags[] = {
             { "16Rnd_9x21_Mag", "Tazer Rounds", 0 },
            { "30Rnd_45ACP_Mag_SMG_01", "VerminAmmo", 0 },
            { "30Rnd_556x45_Stanag", "MK20Ammo", 0 },
            { "30Rnd_65x39_caseless_mag", "MXAmmo", 0 },
            { "100Rnd_65x39_caseless_mag", "MXSWAmmo", 0 },
            { "30Rnd_65x39_caseless_green", "ARXAmmo", 0 },
            { "30Rnd_556x45_Stanag", "Spar16Ammo", 0 },
            { "150Rnd_556x45_Drum_Mag_F", "Spar16SAmmo", 0 },
            { "10Rnd_93x64_DMR_05_Mag", "CyrusAmmo", 0 },
            { "20Rnd_762x51_Mag", "7.62Ammo", 0 }
        };
        accs[] = {
            { "optic_Arco", "Yorris", 2000 },
            { "optic_Hamr", "Yorris", 2000 },
            { "optic_Aco", "Yorris", 2000 },
            { "optic_ACO_grn", "Yorris", 2000 },
            { "optic_Aco_smg", "Yorris", 2000 },
            { "optic_ACO_grn_smg", "Yorris", 2000 },
            { "optic_Holosight", "Yorris", 2000 },
            { "optic_Holosight_smg", "Yorris", 2000 },
            { "optic_DMS", "Yorris", 2000 },
            { "optic_Yorris", "Yorris", 2000 },
            { "optic_MRD", "Yorris", 2000 },
            { "acc_flashlight", "flashlight", 9000 },
            { "acc_pointer_IR", "IR Pointer", 9000 },
            { "muzzle_snds_M", "5.5 Sus", 9000 },
            { "muzzle_snds_H", "6.5 Sus", 9000 },
            { "bipod_01_F_khk", "Khaki Bipod", 25000 },
            { "bipod_01_F_snd", "Sand Bipod", 25000 },
            { "bipod_01_F_blk", "Sand Bipod", 25000 }
        };
    };
    // Assistant Chief
    class cop_10 {
        name = "Police Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 10, "You must be a Cmd!" };
        items[] = {
           { "hgun_P07_snds_F", "Tazer Pistol", 0 },
            { "SMG_01_F", "Vermin", 0 },
            { "arifle_MXC_Black_F", "MXC", 0 },
            { "arifle_MX_Black_F", "MX", 0 },
            { "arifle_MXM_Black_F", "MXM", 0 },
            { "arifle_MX_SW_Black_F", "MXSW", 0 },
            { "arifle_ARX_blk_F", "ARX", 20000 },
            { "arifle_SPAR_01_blk_F", "Spar16", 20000 },
            { "srifle_EBR_F", "MK18", 20000 },
            { "arifle_SPAR_03_blk_F", "Spar17", 20000 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "Tazer Rounds", 0 },
            { "30Rnd_45ACP_Mag_SMG_01", "VerminAmmo", 0 },
            { "30Rnd_556x45_Stanag", "MK20Ammo", 0 },
            { "30Rnd_65x39_caseless_mag", "MXAmmo", 0 },
            { "100Rnd_65x39_caseless_mag", "MXSWAmmo", 0 },
            { "30Rnd_65x39_caseless_green", "ARXAmmo", 0 },
            { "30Rnd_556x45_Stanag", "Spar16Ammo", 0 },
            { "150Rnd_556x45_Drum_Mag_F", "Spar16SAmmo", 0 },
            { "10Rnd_93x64_DMR_05_Mag", "CyrusAmmo", 0 },
            { "10Rnd_127x54_Mag", "ASPAmmo", 0 },
            { "20Rnd_762x51_Mag", "7.62Ammo", 0 }
        };
        accs[] = {
            { "optic_Arco", "Yorris", 2000 },
            { "optic_Hamr", "Yorris", 2000 },
            { "optic_Aco", "Yorris", 2000 },
            { "optic_ACO_grn", "Yorris", 2000 },
            { "optic_Aco_smg", "Yorris", 2000 },
            { "optic_ACO_grn_smg", "Yorris", 2000 },
            { "optic_Holosight", "Yorris", 2000 },
            { "optic_Holosight_smg", "Yorris", 2000 },
            { "optic_DMS", "Yorris", 2000 },
            { "optic_Yorris", "Yorris", 2000 },
            { "optic_MRD", "Yorris", 2000 },
            { "acc_flashlight", "flashlight", 9000 },
            { "acc_pointer_IR", "IR Pointer", 9000 },
            { "muzzle_snds_M", "5.5 Sus", 9000 },
            { "muzzle_snds_H", "6.5 Sus", 9000 },
            { "bipod_01_F_khk", "Khaki Bipod", 25000 },
            { "bipod_01_F_snd", "Sand Bipod", 25000 },
            { "bipod_01_F_blk", "Sand Bipod", 25000 }
        };
    };
    class cop_11 {
        name = "Police Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 11, "You must be a AComm!" };
        items[] = {
            { "hgun_P07_snds_F", "Tazer Pistol", 0 },
            { "SMG_01_F", "Vermin", 0 },
            { "arifle_MXC_Black_F", "MXC", 0 },
            { "arifle_MX_Black_F", "MX", 0 },
            { "arifle_MXM_Black_F", "MXM", 0 },
            { "arifle_MX_SW_Black_F", "MXSW", 0 },
            { "arifle_ARX_blk_F", "ARX", 20000 },
            { "arifle_SPAR_01_blk_F", "Spar16", 20000 },
            { "srifle_EBR_F", "MK18", 20000 },
            { "arifle_SPAR_03_blk_F", "Spar17", 20000 }
        };
        mags[] = {
             { "16Rnd_9x21_Mag", "Tazer Rounds", 0 },
            { "30Rnd_45ACP_Mag_SMG_01", "VerminAmmo", 0 },
            { "30Rnd_556x45_Stanag", "MK20Ammo", 0 },
            { "30Rnd_65x39_caseless_mag", "MXAmmo", 0 },
            { "100Rnd_65x39_caseless_mag", "MXSWAmmo", 0 },
            { "30Rnd_65x39_caseless_green", "ARXAmmo", 0 },
            { "30Rnd_556x45_Stanag", "Spar16Ammo", 0 },
            { "150Rnd_556x45_Drum_Mag_F", "Spar16SAmmo", 0 },
            { "10Rnd_93x64_DMR_05_Mag", "CyrusAmmo", 0 },
            { "10Rnd_127x54_Mag", "ASPAmmo", 0 },
            { "20Rnd_762x51_Mag", "7.62Ammo", 0 }
        };
        accs[] = {
            { "optic_Arco", "Yorris", 2000 },
            { "optic_Hamr", "Yorris", 2000 },
            { "optic_Aco", "Yorris", 2000 },
            { "optic_ACO_grn", "Yorris", 2000 },
            { "optic_Aco_smg", "Yorris", 2000 },
            { "optic_ACO_grn_smg", "Yorris", 2000 },
            { "optic_Holosight", "Yorris", 2000 },
            { "optic_Holosight_smg", "Yorris", 2000 },
            { "optic_DMS", "Yorris", 2000 },
            { "optic_Yorris", "Yorris", 2000 },
            { "optic_MRD", "Yorris", 2000 },
            { "acc_flashlight", "flashlight", 9000 },
            { "acc_pointer_IR", "IR Pointer", 9000 },
            { "muzzle_snds_M", "5.5 Sus", 9000 },
            { "muzzle_snds_H", "6.5 Sus", 9000 },
            { "bipod_01_F_khk", "Khaki Bipod", 25000 },
            { "bipod_01_F_snd", "Sand Bipod", 25000 },
            { "bipod_01_F_blk", "Sand Bipod", 25000 }
        };
    };
    class cop_12 {
        name = "Police Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 12, "You must be a DComm!" };
        items[] = {
            { "hgun_P07_snds_F", "Tazer Pistol", 0 },
            { "SMG_01_F", "Vermin", 0 },
            { "arifle_MXC_Black_F", "MXC", 0 },
            { "arifle_MX_Black_F", "MX", 0 },
            { "arifle_MXM_Black_F", "MXM", 0 },
            { "arifle_MX_SW_Black_F", "MXSW", 0 },
            { "arifle_ARX_blk_F", "ARX", 20000 },
            { "arifle_SPAR_01_blk_F", "Spar16", 20000 },
            { "srifle_EBR_F", "MK18", 20000 },
            { "arifle_SPAR_03_blk_F", "Spar17", 20000 }
        };
        mags[] = {
             { "16Rnd_9x21_Mag", "Tazer Rounds", 0 },
            { "30Rnd_45ACP_Mag_SMG_01", "VerminAmmo", 0 },
            { "30Rnd_556x45_Stanag", "MK20Ammo", 0 },
            { "30Rnd_65x39_caseless_mag", "MXAmmo", 0 },
            { "100Rnd_65x39_caseless_mag", "MXSWAmmo", 0 },
            { "30Rnd_65x39_caseless_green", "ARXAmmo", 0 },
            { "30Rnd_556x45_Stanag", "Spar16Ammo", 0 },
            { "150Rnd_556x45_Drum_Mag_F", "Spar16SAmmo", 0 },
            { "10Rnd_93x64_DMR_05_Mag", "CyrusAmmo", 0 },
            { "10Rnd_127x54_Mag", "ASPAmmo", 0 },
            { "20Rnd_762x51_Mag", "7.62Ammo", 0 }
        };
        accs[] = {
        { "optic_Arco", "Yorris", 2000 },
            { "optic_Hamr", "Yorris", 2000 },
            { "optic_Aco", "Yorris", 2000 },
            { "optic_ACO_grn", "Yorris", 2000 },
            { "optic_Aco_smg", "Yorris", 2000 },
            { "optic_ACO_grn_smg", "Yorris", 2000 },
            { "optic_Holosight", "Yorris", 2000 },
            { "optic_Holosight_smg", "Yorris", 2000 },
            { "optic_DMS", "Yorris", 2000 },
            { "optic_Yorris", "Yorris", 2000 },
            { "optic_MRD", "Yorris", 2000 },
            { "acc_flashlight", "flashlight", 9000 },
            { "acc_pointer_IR", "IR Pointer", 9000 },
            { "muzzle_snds_M", "5.5 Sus", 9000 },
            { "muzzle_snds_H", "6.5 Sus", 9000 },
            { "bipod_01_F_khk", "Khaki Bipod", 25000 },
            { "bipod_01_F_snd", "Sand Bipod", 25000 },
            { "bipod_01_F_blk", "Sand Bipod", 25000 }
        };
    };
    // Chief
    class cop_13 {
        name = "Police Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 13, "You must be a Comm" };
        items[] = {
            { "hgun_P07_snds_F", "Tazer Pistol", 0 },
            { "SMG_01_F", "Vermin", 0 },
            { "arifle_MXC_Black_F", "MXC", 0 },
            { "arifle_MX_Black_F", "MX", 0 },
            { "arifle_MXM_Black_F", "MXM", 0 },
            { "arifle_MX_SW_Black_F", "MXSW", 0 },
            { "arifle_ARX_blk_F", "ARX", 20000 },
            { "arifle_SPAR_01_blk_F", "Spar16", 20000 },
            { "srifle_EBR_F", "MK18", 20000 },
            { "arifle_SPAR_03_blk_F", "Spar17", 20000 }
        };
        mags[] = {
             { "16Rnd_9x21_Mag", "Tazer Rounds", 0 },
            { "30Rnd_45ACP_Mag_SMG_01", "VerminAmmo", 0 },
            { "30Rnd_556x45_Stanag", "MK20Ammo", 0 },
            { "30Rnd_65x39_caseless_mag", "MXAmmo", 0 },
            { "100Rnd_65x39_caseless_mag", "MXSWAmmo", 0 },
            { "30Rnd_65x39_caseless_green", "ARXAmmo", 0 },
            { "30Rnd_556x45_Stanag", "Spar16Ammo", 0 },
            { "150Rnd_556x45_Drum_Mag_F", "Spar16SAmmo", 0 },
            { "10Rnd_93x64_DMR_05_Mag", "CyrusAmmo", 0 },
            { "10Rnd_127x54_Mag", "ASPAmmo", 0 },
            { "20Rnd_762x51_Mag", "7.62Ammo", 0 }
        };
        accs[] = {
            { "optic_Arco", "Yorris", 2000 },
            { "optic_Hamr", "Yorris", 2000 },
            { "optic_Aco", "Yorris", 2000 },
            { "optic_ACO_grn", "Yorris", 2000 },
            { "optic_Aco_smg", "Yorris", 2000 },
            { "optic_ACO_grn_smg", "Yorris", 2000 },
            { "optic_Holosight", "Yorris", 2000 },
            { "optic_Holosight_smg", "Yorris", 2000 },
            { "optic_DMS", "Yorris", 2000 },
            { "optic_Yorris", "Yorris", 2000 },
            { "optic_MRD", "Yorris", 2000 },
            { "acc_flashlight", "flashlight", 9000 },
            { "acc_pointer_IR", "IR Pointer", 9000 },
            { "muzzle_snds_M", "5.5 Sus", 9000 },
            { "muzzle_snds_H", "6.5 Sus", 9000 },
            { "bipod_01_F_khk", "Khaki Bipod", 25000 },
            { "bipod_01_F_snd", "Sand Bipod", 25000 },
            { "bipod_01_F_blk", "Sand Bipod", 25000 }
        };
    };
    // SWAT
    class cop_SCO19 {
        name = "SCO Armoury";
        side = "cop";
        level[] = { "", "", -1, "" };
        items[] = {
            { "hgun_P07_snds_F", "Tazer Pistol", 0 },
            { "SMG_01_F", "Vermin", 0 },
            { "arifle_MXC_Black_F", "MXC", 0 },
            { "arifle_MX_Black_F", "MX", 0 },
            { "arifle_MXM_Black_F", "MXM", 0 },
            { "arifle_MX_SW_Black_F", "MXSW", 0 },
            { "arifle_ARX_blk_F", "ARX", 20000 },
            { "arifle_SPAR_01_blk_F", "Spar16", 20000 },
            { "srifle_EBR_F", "MK18", 20000 },
            { "arifle_SPAR_03_blk_F", "Spar17", 20000 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "Tazer Rounds", 0 },
            { "30Rnd_45ACP_Mag_SMG_01", "VerminAmmo", 0 },
            { "30Rnd_9x21_Mag", "StingAmmo", 0 },
            { "30Rnd_556x45_Stanag", "MK20Ammo", 0 },
            { "30Rnd_556x45_Stanag_Tracer_Green", "MK20Ammo", 0 },
            { "30Rnd_65x39_caseless_mag", "MXAmmo", 0 },
            { "30Rnd_65x39_caseless_green", "ARXAmmo", 0 },
            { "30Rnd_556x45_Stanag", "Spar16Ammo", 0 },
            { "150Rnd_556x45_Drum_Mag_F", "Spar16SAmmo", 0 },
            { "10Rnd_127x54_Mag", "ASPAmmo", 0 },
            { "10Rnd_93x64_DMR_05_Mag", "CyrusAmmo", 0 },
            { "B_9x21_Ball", "Tazer Rifle Ammo", 0 },
            { "B_556x45_dual", "Tazer Rifle Ammo Dual", 0 },
            { "Titan_AA", "", 0 },
            { "NLAW_F", "", 0 },
            { "20Rnd_762x51_Mag", "7.62Ammo", 0 }
        };
        accs[] = {
            { "optic_Arco", "Yorris", 2000 },
            { "optic_Hamr", "Yorris", 2000 },
            { "optic_Aco", "Yorris", 2000 },
            { "optic_ACO_grn", "Yorris", 2000 },
            { "optic_Aco_smg", "Yorris", 2000 },
            { "optic_ACO_grn_smg", "Yorris", 2000 },
            { "optic_Holosight", "Yorris", 2000 },
            { "optic_Holosight_smg", "Yorris", 2000 },
            { "optic_DMS", "Yorris", 2000 },
            { "optic_Yorris", "Yorris", 2000 },
            { "optic_MRD", "Yorris", 2000 },
            { "acc_flashlight", "flashlight", 9000 },
            { "acc_pointer_IR", "IR Pointer", 9000 },
            { "muzzle_snds_M", "5.5 Sus", 9000 },
            { "muzzle_snds_H", "6.5 Sus", 9000 },
            { "bipod_01_F_khk", "Khaki Bipod", 25000 },
            { "bipod_01_F_snd", "Sand Bipod", 25000 },
            { "bipod_01_F_blk", "Sand Bipod", 25000 }
        };
    };
 
    //Medic Shops
    class med_basic {
        name = "store";
        side = "med";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "Binocular", "", 0 },
            { "ItemGPS", "", 0 },
            { "ItemWatch", "", 0 },
            { "ItemCompass", "", 0 },
            { "ItemMap", "", 0 },
            { "FirstAidKit", "", 0 },
            { "Medikit", "", 0 },
            { "NVGoggles", "", 0 }
        };
    };
};