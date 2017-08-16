/*
 * Format:
 *   level: ARRAY (This is for limiting items to certain things)
 *      0: Variable to read from
 *      1: Variable Value Type (SCALAR / BOOL)
 *      2: What to compare to (-1 = Check Disabled)
 *      3: Custom exit message (Optional)
 *
 *   items: { Classname, Itemname, price }
 *
 *   Itemname only needs to be filled if you want to rename the original object name.
 */
class WeaponShops {
    //Armory Shops
    class gun {
        name = "Stefan's besten Waffen..";
        side = "civ";
        license = "gun";
        level[] = { "", "", -1, "" };
        items[] = {
            { "hgun_Rook40_F", "", 6500 },
            { "hgun_Pistol_heavy_02_F", "", 9850 },
            { "hgun_ACPC2_F", "", 11500 },
            { "hgun_PDW2000_F", "", 20000 },
            { "optic_ACO_grn_smg", "", 2500 },
            { "V_Rangemaster_belt", "", 4900 },
            { "16Rnd_9x21_Mag", "", 25 },
            { "9Rnd_45ACP_Mag", "", 45 },
            { "6Rnd_45ACP_Cylinder", "", 50 },
            { "30Rnd_9x21_Mag", "", 75 }
        };
    };

    class rebel {
        name = "Mohammed's Jihadi Shop";
        side = "civ";
        license = "rebel";
        level[] = { "", "", -1, "" };
        items[] = {
            { "arifle_TRG20_F", "", 25000 },
            { "arifle_Katiba_F", "", 30000 },
            { "srifle_DMR_01_F", "", 50000 },
            { "arifle_SDAR_F", "", 20000 },
            { "optic_ACO_grn", "", 3500 },
            { "optic_Holosight", "", 3600 },
            { "acc_flashlight", "", 1000 },
            { "optic_Hamr", "", 7500 },
            { "30Rnd_9x21_Mag", "", 200 },
            { "20Rnd_556x45_UW_mag", "", 125 },
            { "30Rnd_556x45_Stanag", "", 300 },
            { "10Rnd_762x51_Mag", "", 500 },
            { "30Rnd_65x39_caseless_green", "", 275 }
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
            { "hgunA_CPC2_F", "", 4500 },
            { "hgun_PDW2000_F", "", 9500 },
            { "optic_ACO_grn_smg", "", 950 },
            { "V_Rangemaster_belt", "", 1900 },
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
    };

    //Cop Shops
    class cop_cadet {
        name = "Altis Cop Shop";
        side = "cop";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "hgun_P07_snds_F", "Stun Pistol", 2000 },
            { "Binocular", "", 150 },
            { "ItemGPS", "", 100 },
            { "ToolKit", "", 250 },
            { "muzzle_snds_L", "", 650 },
            { "FirstAidKit", "", 150 },
            { "Medikit", "", 1000 },
            { "NVGoggles", "", 2000 },
            { "16Rnd_9x21_Mag", "", 50 }
        };
    };

    class cop_deputy {
        name = "Altis Deputy Shop";
        side = "cop";
        license = "";
        level[] = { "ES_coplevel", "SCALAR", 2, "You must be a Deputy Officer Rank!" };
        items[] = {
            { "arifle_sdar_F", "Taser Rifle", 20000 },
            { "hgun_P07_snds_F", "Stun Pistol", 2000 },
            { "SMG_02_F", "Flashbang", 15000 },
            { "30Rnd_9x21_Mag", "", 1000 },
            { "acc_flashlight", "", 750 },
            { "optic_Holosight", "", 1200 },
            { "optic_Arco", "", 2500 },
            { "muzzle_snds_H", "", 2750 },
            { "16Rnd_9x21_Mag", "", 50 },
            { "20Rnd_556x45_UW_mag", "Taser Rifle Magazine", 125 }
        };
    };

    class cop_officer {
        name = "Altis Officer Shop";
        side = "cop";
        license = "";
        level[] = { "ES_coplevel", "SCALAR", 3, "You must be a Officer Rank!" };
        items[] = {
            { "hgun_P07_snds_F", "Stun Pistol", 2000 },
            { "arifle_sdar_F", "Taser Rifle", 20000 },
            { "SMG_02_ACO_F", "", 15000 },
            { "HandGrenade_Stone", "Flashbang", 1700 },
            { "arifle_MXC_F", "", 30000 },
            { "optic_Arco", "", 2500 },
            { "muzzle_snds_H", "", 2750 },
            { "30Rnd_65x39_caseless_mag", "", 100 },
            { "30Rnd_9x21_Mag", "", 60 },
            { "16Rnd_9x21_Mag", "", 50 },
            { "20Rnd_556x45_UW_mag", "Taser Rifle Magazine", 125 }
        };
    };

    class cop_detectiv {
        name = "Altis Detectiv Shop";
        side = "cop";
        license = "";
        level[] = { "ES_coplevel", "SCALAR", 4, "You must be a Detectiv Rank!" };
        items[] = {
            { "Rangefinder", "Range Finder", 20000 },
            { "hgun_Pistol_Signal_F", "Taser Rifle", 15000 },
            { "6Rnd_GreenSignal_F", "", 60 },
            { "6Rnd_RedSignal_F", "", 60 },
            { "SMG_02_ACO_F", "", 30000 },
            { "HandGrenade_Stone", "Flashbang", 1700 },
            { "arifle_MXC_F", "", 30000 },
            { "arifle_MX_GL_Black_F", "", 80000 },
            { "optic_Arco", "", 2500 },
            { "optic_MRCO", "", 2500 },
            { "optic_Aco", "", 2500 },
            { "optic_hamr", "", 2500 },
            { "optic_NVS", "", 2500 },
            { "muzzle_snds_H", "", 2750 },
            { "bipod_02_F_blk", "", 20000 },
            { "30Rnd_9x21_Mag", "", 60 },
            { "30Rnd_65x39_caseless_mag", "", 2500 }
        };
    };

    class cop_inspector {
        name = "Altis Inspector Shop";
        side = "cop";
        license = "";
        level[] = { "ES_coplevel", "SCALAR", 5, "You must be a Inspector Rank!" };
        items[] = {
            { "Rangefinder", "Range Finder", 20000 },
            { "hgun_Pistol_Signal_F", "Taser Rifle", 15000 },
            { "6Rnd_GreenSignal_F", "", 60 },
            { "6Rnd_RedSignal_F", "", 60 },
            { "SMG_02_ACO_F", "", 15000 },
            { "HandGrenade_Stone", "Flashbang", 1700 },
            { "arifle_MXC_F", "", 30000 },
            { "arifle_MX_GL_Black_F", "", 120000 },
            { "muzzle_snds_H", "", 2500 },
            { "optic_Aco", "", 2500 },
            { "optic_DMS", "", 2500 },
            { "optic_SOS", "", 2500 },
            { "optic_AMS", "", 2500 },
            { "optic_LRPS", "", 2500 },
            { "bipod_02_F_blk", "", 20000 },
            { "optic_MRCO", "", 2500 },
            { "optic_hamr", "", 2500 },
            { "optic_NVS", "", 2500 },
            { "30Rnd_9x21_Mag", "", 60 },
            { "30Rnd_65x39_caseless_mag", "", 2500 }
        };
    };

    class cop_commissioner {
        name = "Altis Commissioner Shop";
        side = "cop";
        license = "";
        level[] = { "ES_coplevel", "SCALAR", 6, "You must be a Commissioner Rank!" };
        items[] = {
            { "Rangefinder", "Range Finder", 20000 },
            { "hgun_Pistol_Signal_F", "Taser Rifle", 15000 },
            { "6Rnd_GreenSignal_F", "", 60 },
            { "6Rnd_RedSignal_F", "", 60 },
            { "SMG_02_ACO_F", "", 15000 },
            { "HandGrenade_Stone", "Flashbang", 1700 },
            { "arifle_MXC_F", "", 30000 },
            { "arifle_MXM_Black_F", "", 120000 },
            { "srifle_DMR_03_F", "", 120000 },
            { "srifle_EBR_F", "", 30000 },
            { "20Rnd_762x51_Mag", "", 120000 },
            { "muzzle_snds_H", "", 2500 },
            { "optic_Aco", "", 2500 },
            { "optic_DMS", "", 2500 },
            { "optic_SOS", "", 2500 },
            { "optic_AMS", "", 2500 },
            { "optic_LRPS", "", 2500 },
            { "optic_Arco", "", 2500 },
            { "bipod_02_F_blk", "", 20000 },
            { "optic_MRCO", "", 2500 },
            { "optic_hamr", "", 2500 },
            { "optic_NVS", "", 2500 },
            { "30Rnd_9x21_Mag", "", 60 },
            { "30Rnd_65x39_caseless_mag", "", 2500 }
        };
    };

    class cop_dea {
        name = "Altis DEA Shop";
        side = "cop";
        license = "";
        level[] = { "ES_coplevel", "SCALAR", 7, "You must be a DEA Rank!" };
        items[] = {
            { "Rangefinder", "Range Finder", 20000 },
            { "hgun_Pistol_Signal_F", "Taser Rifle", 15000 },
            { "6Rnd_GreenSignal_F", "", 60 },
            { "6Rnd_RedSignal_F", "", 60 },
            { "SMG_02_ACO_F", "", 15000 },
            { "HandGrenade_Stone", "Flashbang", 1700 },
            { "arifle_MXC_F", "", 30000 },
            { "arifle_MXM_Black_F", "", 120000 },
            { "srifle_DMR_03_F", "", 120000 },
            { "srifle_EBR_F", "", 30000 },
            { "20Rnd_762x51_Mag", "", 120000 },
            { "muzzle_snds_H", "", 2500 },
            { "B_UavTerminal", "", 5000 },
            { "arifle_MX_GL_Black_F", "", 60000 },
            { "1Rnd_SmokeGreen_Grenade_shell", "", 30000 },
            { "3Rnd_UGL_FlareRed_F", "", 7500 },
            { "3Rnd_SmokeRed_Grenade_shell", "", 7500 },
            { "LMG_Mk200_F", "", 180000 },
            { "200Rnd_65x39_cased_Box", "", 20000 },
            { "muzzle_snds_H_MG", "", 2500 },
            { "LMG_Zafir_F", "", 500000 },
            { "150Rnd_762x54_Box", "", 30000 },
            { "srifle_DMR_05_blk_F", "", 360000 },
            { "10Rnd_93x64_DMR_05_Mag", "", 7500 },
            { "muzzle_snds_93mmg", "", 2500 },
            { "srifle_DMR_02_F", "", 300000 },
            { "10Rnd_338_Mag", "", 7500 },
            { "muzzle_snds_338_black", "", 2500 },
            { "srifle_LRR_F", "", 540000 },
            { "srifle_LRR_camo_F", "", 540000 },
            { "7Rnd_408_Mag", "", 12500 },
            { "srifle_GM6_F", "", 600000 },
            { "5Rnd_127x108_Mag", "", 15000 },
            { "launch_RPG32_F", "", 750000 },
            { "RPG32_F", "", 90000 },
            { "RPG32_HE_F", "", 150000 },
            { "Laserdesignator", "", 9500 },
            { "DemoCharge_Remote_Mag", "", 72000 },
            { "MineDetector", "", 12500 },
            { "bipod_01_F_snd", "", 12500 },
            { "acc_flashlight", "", 3500 },
            { "acc_pointer_IR", "", 5000 },
            { "SmokeShellGreen", "Reizgas", 30000 },
            { "optic_Aco", "", 2500 },
            { "optic_DMS", "", 2500 },
            { "optic_SOS", "", 2500 },
            { "optic_AMS", "", 2500 },
            { "optic_LRPS", "", 2500 },
            { "optic_Arco", "", 2500 },
            { "bipod_02_F_blk", "", 20000 },
            { "optic_MRCO", "", 2500 },
            { "optic_hamr", "", 2500 },
            { "optic_NVS", "", 2500 },
            { "30Rnd_9x21_Mag", "", 60 },
            { "30Rnd_65x39_caseless_mag", "", 2500 }
        };
    };

    class cop_swat {
        name = "Altis S.W.A.T Shop";
        side = "cop";
        license = "";
        level[] = { "ES_coplevel", "SCALAR", 8, "You must be a S.W.A.T Rank!" };
        items[] = {
            { "Rangefinder", "Range Finder", 20000 },
            { "hgun_Pistol_Signal_F", "Taser Rifle", 15000 },
            { "6Rnd_GreenSignal_F", "", 60 },
            { "6Rnd_RedSignal_F", "", 60 },
            { "SMG_02_ACO_F", "", 15000 },
            { "HandGrenade_Stone", "Flashbang", 1700 },
            { "arifle_MXC_F", "", 30000 },
            { "arifle_MXM_Black_F", "", 120000 },
            { "srifle_DMR_03_F", "", 120000 },
            { "srifle_EBR_F", "", 30000 },
            { "20Rnd_762x51_Mag", "", 120000 },
            { "muzzle_snds_H", "", 2500 },
            { "B_UavTerminal", "", 5000 },
            { "arifle_MX_GL_Black_F", "", 60000 },
            { "1Rnd_SmokeGreen_Grenade_shell", "", 30000 },
            { "3Rnd_UGL_FlareRed_F", "", 7500 },
            { "3Rnd_SmokeRed_Grenade_shell", "", 7500 },
            { "LMG_Mk200_F", "", 180000 },
            { "200Rnd_65x39_cased_Box", "", 20000 },
            { "muzzle_snds_H_MG", "", 2500 },
            { "LMG_Zafir_F", "", 500000 },
            { "150Rnd_762x54_Box", "", 30000 },
            { "srifle_DMR_05_blk_F", "", 360000 },
            { "10Rnd_93x64_DMR_05_Mag", "", 7500 },
            { "muzzle_snds_93mmg", "", 2500 },
            { "srifle_DMR_02_F", "", 300000 },
            { "10Rnd_338_Mag", "", 7500 },
            { "muzzle_snds_338_black", "", 2500 },
            { "srifle_LRR_F", "", 540000 },
            { "srifle_LRR_camo_F", "", 540000 },
            { "7Rnd_408_Mag", "", 12500 },
            { "srifle_GM6_F", "", 600000 },
            { "5Rnd_127x108_Mag", "", 15000 },
            { "launch_RPG32_F", "", 750000 },
            { "RPG32_F", "", 90000 },
            { "RPG32_HE_F", "", 150000 },
            { "Laserdesignator", "", 9500 },
            { "DemoCharge_Remote_Mag", "", 72000 },
            { "MineDetector", "", 12500 },
            { "bipod_01_F_snd", "", 12500 },
            { "acc_flashlight", "", 3500 },
            { "acc_pointer_IR", "", 5000 },
            { "SmokeShellGreen", "Reizgas", 30000 },
            { "optic_Aco", "", 2500 },
            { "optic_DMS", "", 2500 },
            { "optic_SOS", "", 2500 },
            { "optic_AMS", "", 2500 },
            { "optic_LRPS", "", 2500 },
            { "optic_Arco", "", 2500 },
            { "bipod_02_F_blk", "", 20000 },
            { "optic_MRCO", "", 2500 },
            { "optic_hamr", "", 2500 },
            { "optic_NVS", "", 2500 },
            { "30Rnd_9x21_Mag", "", 60 },
            { "30Rnd_65x39_caseless_mag", "", 2500 }
        };
    };

    class cop_marshal {
        name = "Altis Marshal Shop";
        side = "cop";
        license = "";
        level[] = { "ES_coplevel", "SCALAR", 9, "You must be a Marshal Rank!" };
        items[] = {
            { "Rangefinder", "Range Finder", 20000 },
            { "hgun_Pistol_Signal_F", "Taser Rifle", 15000 },
            { "6Rnd_GreenSignal_F", "", 60 },
            { "6Rnd_RedSignal_F", "", 60 },
            { "SMG_02_ACO_F", "", 15000 },
            { "HandGrenade_Stone", "Flashbang", 1700 },
            { "arifle_MXC_F", "", 30000 },
            { "arifle_MXM_Black_F", "", 120000 },
            { "srifle_DMR_03_F", "", 120000 },
            { "srifle_EBR_F", "", 30000 },
            { "20Rnd_762x51_Mag", "", 120000 },
            { "muzzle_snds_H", "", 2500 },
            { "B_UavTerminal", "", 5000 },
            { "arifle_MX_GL_Black_F", "", 60000 },
            { "1Rnd_SmokeGreen_Grenade_shell", "", 30000 },
            { "3Rnd_UGL_FlareRed_F", "", 7500 },
            { "3Rnd_SmokeRed_Grenade_shell", "", 7500 },
            { "LMG_Mk200_F", "", 180000 },
            { "200Rnd_65x39_cased_Box", "", 20000 },
            { "muzzle_snds_H_MG", "", 2500 },
            { "LMG_Zafir_F", "", 500000 },
            { "150Rnd_762x54_Box", "", 30000 },
            { "srifle_DMR_05_blk_F", "", 360000 },
            { "10Rnd_93x64_DMR_05_Mag", "", 7500 },
            { "muzzle_snds_93mmg", "", 2500 },
            { "srifle_DMR_02_F", "", 300000 },
            { "10Rnd_338_Mag", "", 7500 },
            { "muzzle_snds_338_black", "", 2500 },
            { "srifle_LRR_F", "", 540000 },
            { "srifle_LRR_camo_F", "", 540000 },
            { "7Rnd_408_Mag", "", 12500 },
            { "srifle_GM6_F", "", 600000 },
            { "5Rnd_127x108_Mag", "", 15000 },
            { "launch_RPG32_F", "", 750000 },
            { "RPG32_F", "", 90000 },
            { "RPG32_HE_F", "", 150000 },
            { "Laserdesignator", "", 9500 },
            { "DemoCharge_Remote_Mag", "", 72000 },
            { "MineDetector", "", 12500 },
            { "bipod_01_F_snd", "", 12500 },
            { "acc_flashlight", "", 3500 },
            { "acc_pointer_IR", "", 5000 },
            { "SmokeShellGreen", "Reizgas", 30000 },
            { "optic_Aco", "", 2500 },
            { "optic_DMS", "", 2500 },
            { "optic_SOS", "", 2500 },
            { "optic_AMS", "", 2500 },
            { "optic_LRPS", "", 2500 },
            { "optic_Arco", "", 2500 },
            { "bipod_02_F_blk", "", 20000 },
            { "optic_MRCO", "", 2500 },
            { "optic_hamr", "", 2500 },
            { "optic_MRCO", "", 2500 },
            { "optic_NVS", "", 2500 },
            { "acc_flashlight", "", 3500 },
            { "acc_pointer_IR", "", 5000 },
            { "30Rnd_65x39_caseless_mag", "", 2500 }
        };
    };

    class cop_chief {
        name = "Altis Chief Shop";
        side = "cop";
        license = "";
        level[] = { "ES_coplevel", "SCALAR", 10, "You must be a Chief Rank!" };
        items[] = {
            { "Rangefinder", "Range Finder", 1 },
            { "hgun_Pistol_Signal_F", "Taser Rifle", 1 },
            { "6Rnd_GreenSignal_F", "", 1 },
            { "6Rnd_RedSignal_F", "", 1 },
            { "SMG_02_ACO_F", "", 1 },
            { "HandGrenade_Stone", "Flashbang", 1 },
            { "arifle_MXC_F", "", 1 },
            { "arifle_MXM_Black_F", "", 1 },
            { "srifle_DMR_03_F", "", 1 },
            { "srifle_EBR_F", "", 1 },
            { "20Rnd_762x51_Mag", "", 1 },
            { "muzzle_snds_H", "", 1 },
            { "B_UavTerminal", "", 1 },
            { "arifle_MX_GL_Black_F", "", 1 },
            { "1Rnd_SmokeGreen_Grenade_shell", "", 1 },
            { "3Rnd_UGL_FlareRed_F", "", 1 },
            { "3Rnd_SmokeRed_Grenade_shell", "", 1 },
            { "LMG_Mk200_F", "", 1 },
            { "200Rnd_65x39_cased_Box", "", 1 },
            { "muzzle_snds_H_MG", "", 1 },
            { "LMG_Zafir_F", "", 1 },
            { "150Rnd_762x54_Box", "", 1 },
            { "srifle_DMR_05_blk_F", "", 1 },
            { "10Rnd_93x64_DMR_05_Mag", "", 1 },
            { "muzzle_snds_93mmg", "", 1 },
            { "srifle_DMR_02_F", "", 1 },
            { "10Rnd_338_Mag", "", 1 },
            { "muzzle_snds_338_black", "", 1 },
            { "srifle_LRR_F", "", 1 },
            { "srifle_LRR_camo_F", "", 1 },
            { "7Rnd_408_Mag", "", 1 },
            { "srifle_GM6_F", "", 1 },
            { "5Rnd_127x108_Mag", "", 1 },
            { "launch_RPG32_F", "", 1 },
            { "RPG32_F", "", 1 },
            { "RPG32_HE_F", "", 1 },
            { "Laserdesignator", "", 1 },
            { "DemoCharge_Remote_Mag", "", 1 },
            { "MineDetector", "", 1 },
            { "bipod_01_F_snd", "", 1 },
            { "acc_flashlight", "", 1 },
            { "acc_pointer_IR", "", 1 },
            { "SmokeShellGreen", "Reizgas", 1 },
            { "optic_Aco", "", 1 },
            { "optic_DMS", "", 1 },
            { "optic_SOS", "", 1 },
            { "optic_AMS", "", 1 },
            { "optic_LRPS", "", 1 },
            { "optic_Arco", "", 1 },
            { "bipod_02_F_blk", "", 1 },
            { "optic_MRCO", "", 1 },
            { "optic_hamr", "", 1 },
            { "optic_MRCO", "", 1 },
            { "optic_NVS", "", 2500 },
            { "acc_flashlight", "", 1 },
            { "acc_pointer_IR", "", 1 },
            { "30Rnd_65x39_caseless_mag", "", 1 }
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
    };
};