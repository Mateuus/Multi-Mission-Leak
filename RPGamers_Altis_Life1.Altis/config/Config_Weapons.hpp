/*
*    FORMAT:
*        STRING (Conditions) - Must return boolean :
*            String can contain any amount of conditions, aslong as the entire
*            string returns a boolean. This allows you to check any levels, licenses etc,
*            in any combination. For example:
*                "call life_coplevel && license_civ_someLicense"
*            This will also let you call any other function.
*            
*
*    ARRAY FORMAT:
*        0: STRING (Classname): Item Classname
*        1: STRING (Nickname): Nickname that will appear purely in the shop dialog
*        2: SCALAR (Buy price)
*        3: SCALAR (Sell price): To disable selling, this should be -1
*        4: STRING (Conditions): Same as above conditions string
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
        conditions = "license_civ_gun";
        items[] = {
            { "hgun_Rook40_F", "", 6500, 500, "" },
            { "hgun_Pistol_heavy_02_F", "", 9850, -1, "" },
            { "hgun_ACPC2_F", "", 11500, -1, "" },
            { "hgun_PDW2000_F", "", 20000, -1, "" }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 25, "" },
            { "6Rnd_45ACP_Cylinder", "", 50, "" },
            { "9Rnd_45ACP_Mag", "", 45, "" },
            { "30Rnd_9x21_Mag", "", 75, "" }
        };
        accs[] = {
            { "optic_ACO_grn_smg", "", 2500, 250, "" },
            { "optic_Aco", "", 2500, 250, "" }
        };
    };

    class donator { // EDIT!!
        name = "Donator Firearms";
        side = "civ";
        license = "";
        conditions = "call life_donorlevel >= 1";
        items[] = {
            { "hgun_Rook40_F", "", 6500, 500, "" },
            { "hgun_Pistol_heavy_02_F", "", 9850, -1, "" },
            { "hgun_ACPC2_F", "", 11500, -1, "" },
            { "hgun_PDW2000_F", "", 20000, -1, "" }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 25, "" },
            { "6Rnd_45ACP_Cylinder", "", 50, "" },
            { "9Rnd_45ACP_Mag", "", 45, "" },
            { "30Rnd_9x21_Mag", "", 75, "" }
        };
        accs[] = {
            { "optic_ACO_grn_smg", "", 2500, 250, "" },
            { "optic_Aco", "", 2500, 250, "" }
        };
    };

    class rebel {
        name = "Mohammed's Jihadi Shop";
        side = "civ";
        conditions = "license_civ_rebel";
        items[] = { 
            //{ "srifle_DMR_02_F", "", 100000, -1 }, //MAR-10
            //{ "srifle_DMR_04_F", "", 60000, -1, "" },
            { "arifle_AKM_F", "", 60000, -1, "" },
            { "srifle_DMR_01_F", "", 50000, -1, "" },
            { "arifle_Katiba_F", "", 30000, 5000, "" },
            { "arifle_AKS_F", "", 25000, 5000, "" },
            { "arifle_TRG20_F", "", 25000, 2500, "" },
            { "arifle_SDAR_F", "", 20000, 7500, "" },
            { "launch_RPG32_F", "", 450000, 200000, "" }
            //{ "tf_anprc152_1", "", 150, 65 },
            //{ "tf_rt1523g_black", "", 5000, 2000 }
        };
        mags[] = {
            { "RPG32_F", "", 50000, "" },
            //{ "10Rnd_127x54_Mag", "", 350, "" },
            { "30Rnd_762x39_Mag_F", "", 500, "" },
            { "11Rnd_45ACP_Mag", "", 40, "" },
            { "30Rnd_556x45_Stanag", "", 300, "" },
            { "30Rnd_545x39_Mag_F", "", 300, "" },
            { "30Rnd_65x39_caseless_green", "", 275, "" },
            { "10Rnd_762x54_Mag", "", 500, "" },
            { "20Rnd_556x45_UW_mag", "", 125, "" }
            //{ "10Rnd_338_Mag", "", 750, "" }
        };
        accs[] = {
            { "optic_ACO_grn", "", 3500, 350, "" },
            { "optic_Aco", "", 3500, 350, "" },
            { "optic_Holosight", "", 3600, 275, "" },
            { "optic_Hamr", "", 7500, -1, "" },
            { "acc_flashlight", "", 1000, 100, "" }
        };
    };

    class gang {
        name = "Hideout Armament";
        side = "civ";
        conditions = "";
        items[] = {
            { "hgun_Rook40_F", "", 1500, 500, "" },
            { "hgun_Pistol_heavy_02_F", "", 2500, -1, "" },
            { "hgun_ACPC2_F", "", 4500, -1, "" },
            { "hgun_PDW2000_F", "", 9500, -1, "" },
            { "ToolKit", "", 5000, 4000, "" },
            { "FirstAidKit", "", 150, 65, "" }
            //{ "tf_anprc152_1", "", 150, 65 },
            //{ "tf_rt1523g_black", "", 5000, 2000 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 25, "" },
            { "6Rnd_45ACP_Cylinder", "", 50, "" },
            { "9Rnd_45ACP_Mag", "", 45, "" },
            { "30Rnd_9x21_Mag", "", 75, "" }
        };
        accs[] = {
            { "optic_ACO_grn_smg", "", 950, 250, "" }
        };
    };

    //Basic Shops
    class genstore {
        name = "Altis General Store";
        side = "civ";
        conditions = "";
        items[] = {
            { "ToolKit", "", 5000, 4000, "" },
            { "FirstAidKit", "", 150, 65, "" },
            { "ItemRadio", "Cell Phone", 600, 80, "" },
            { "ItemGPS", "", 100, 45, "" },
            { "ItemMap", "", 50, 35, "" },
            { "ItemCompass", "", 50, 25, "" },
            { "ItemWatch", "", 50, -1, "" },
            //{ "tf_anprc152_1", "", 150, 65 },
            { "NVGoggles", "", 2000, 980, "" },
            { "Binocular", "", 150, -1, "" },
            { "Chemlight_red", "", 300, -1, "" },
            { "Chemlight_yellow", "", 300, 50, "" },
            { "Chemlight_green", "", 300, 50, "" },
            { "Chemlight_blue", "", 300, 50, "" }
        };
        mags[] = {};
        accs[] = {};
    };

    class f_station_store {
        name = "Altis Fuel Station Store";
        side = "";
        conditions = "";
        items[] = {
            { "Binocular", "", 750, -1, "" },
            { "ItemRadio", "Cell Phone", 800, 80, "" },
            { "ItemGPS", "", 500, 45, "" },
            { "ItemMap", "", 250, 35, "" },
            { "ItemCompass", "", 250, 25, "" },
            { "ItemWatch", "", 250, -1, "" },
            { "ToolKit", "", 5000, 4000, "" },
            { "FirstAidKit", "", 750, 65, "" },
            { "NVGoggles", "", 10000, 980, "" },
            { "Chemlight_red", "", 1500, -1, "" },
            { "Chemlight_yellow", "", 1500, 50, "" },
            { "Chemlight_green", "", 1500, 50, "" },
            { "Chemlight_blue", "", 1500, 50, "" }
        };
        mags[] = {};
        accs[] = {};
    };

    //Cop Shops
    class cop_basic {
        name = "Altis Cadet Shop";
        side = "cop";
        conditions = "";
        items[] = {
            { "arifle_sdar_F", "Taser Rifle", 20000, 7500, "" },
            { "hgun_P07_snds_F", "Taser", 2000, 650, "" },
            { "hgun_Pistol_heavy_01_F", "", 3000, 650, "" },
            { "HandGrenade_Stone", "Flashbang", 1700, -1, "" },
            //{ "tf_anprc152_1", "", 65, 30 },
            { "ToolKit", "", 1000, 450, "" },
            { "FirstAidKit", "", 150, 65, "" },
            //{ "tf_rt1523g_black", "", 150, 65 },
            { "ItemRadio", "Cell Phone", 200, 80, "" },
            { "ItemGPS", "", 100, 45, "" },
            { "NVGoggles", "", 2000, 980, "" },
            { "Binocular", "", 150, -1, "" },
            { "ItemMap", "", 50, 35, "" },
            { "ItemCompass", "", 50, 25, "" },
            { "ItemWatch", "", 50, -1, "" }
        };
        mags[] = {
            { "11Rnd_45ACP_Mag", "", 60, -1, "" },
            { "16Rnd_9x21_Mag", "Rubber Bullets (16 Rounds)", 25, -1, "" },
            { "20Rnd_556x45_UW_mag", "Taser Rifle Magazine", 45, -1, "" }
        };
        accs[] = {
            { "optic_MRD", "", 200, -1, "" },
            { "muzzle_snds_L", "", 650, -1, "" }
        };
    };

    class cop_patrol {
        name = "Altis Patrol Officer Shop";
        side = "cop";
        conditions = "call life_coplevel >= 2";
        items[] = {
            { "arifle_SPAR_01_blk_F", "", 10000, 5000, "" },
            { "SMG_05_F", "", 6000, 5000, "" },
            { "SMG_02_F", "", 6000, -1, "" },
            { "hgun_Pistol_heavy_01_F", "", 3000, 650, "" },
            { "arifle_sdar_F", "Taser Rifle", 5000, 7500, "" },
            { "hgun_P07_snds_F", "Taser", 1000, 650, "" },
            { "HandGrenade_Stone", "Flashbang", 1700, -1, "" },
            //{ "tf_anprc152_1", "", 65, 30 },
            { "ToolKit", "", 1000, 450, "" },
            { "FirstAidKit", "", 150, 65, "" },
            //{ "tf_rt1523g_black", "", 150, 65 },
            { "ItemRadio", "Cell Phone", 200, 80, "" },
            { "ItemGPS", "", 100, 45, "" },
            { "NVGoggles", "", 2000, 980, "" },
            { "Binocular", "", 150, -1, "" },
            { "MineDetector", "", 1000, 500, "" },
            { "ItemMap", "", 50, 35, "" },
            { "ItemCompass", "", 50, 25, "" },
            { "ItemWatch", "", 50, -1, "" }
        };
        mags[] = {
            { "30Rnd_556x45_Stanag", "", 210, -1, "" },
            { "11Rnd_45ACP_Mag", "", 60, -1, "" },
            { "30Rnd_9x21_Mag_SMG_02", "", 80, -1, "" },
            { "16Rnd_9x21_Mag", "Rubber Bullets (16 Rounds)", 25, -1, "" },
            { "20Rnd_556x45_UW_mag", "Taser Rifle Magazine", 45, -1, "" }
        };
        accs[] = {
            { "muzzle_snds_L", "", 650, -1, "" },
            { "muzzle_snds_H", "", 2750, -1, "" },
            { "acc_flashlight", "", 750, 100, "" },
            { "optic_MRCO", "", 3000, -1, "" },
            { "optic_Hamr", "", 3000, -1, "" },
            { "optic_Holosight", "", 1200, 275, "" },
            { "optic_ACO_grn", "", 1000, -1, "" },
            { "optic_Aco", "", 1000, -1, "" },
            { "optic_MRD", "", 200, -1, "" }
        };
    };

     class cop_sergeant {
        name = "Altis Sergeant Shop";
        side = "cop";
        conditions = "call life_coplevel >= 3";
        items[] = { 
            //{ "srifle_DMR_05_blk_F", "", 60000, 30000 },
            { "arifle_MXM_Black_F", "", 20000, 15000, "" },
            { "arifle_MX_F", "", 15000, 7500, "" },
            { "arifle_SPAR_01_blk_F", "", 10000, 5000, "" },
            { "SMG_05_F", "", 6000, 5000, "" },
            { "SMG_02_F", "", 6000, -1, "" },
            { "hgun_Pistol_heavy_01_F", "", 3000, 650, "" },
            { "arifle_sdar_F", "Taser Rifle", 5000, 7500, "" },
            { "hgun_P07_snds_F", "Taser", 1000, 650, "" },
            { "HandGrenade_Stone", "Flashbang", 1700, -1, "" },
            //{ "tf_anprc152_1", "", 65, 30 },
            { "ToolKit", "", 1000, 450, "" },
            { "FirstAidKit", "", 150, 65, "" },
            //{ "tf_rt1523g_black", "", 150, 65 },
            { "ItemRadio", "Cell Phone", 200, 80, "" },
            { "ItemGPS", "", 100, 45, "" },
            { "NVGoggles", "", 2000, 980, "" },
            { "Binocular", "", 150, -1, "" },
            { "MineDetector", "", 1000, 500, "" },
            { "ItemMap", "", 50, 35, "" },
            { "ItemCompass", "", 50, 25, "" },
            { "ItemWatch", "", 50, -1, "" }
        };
        mags[] = {
            { "30Rnd_65x39_caseless_mag", "", 130, -1, "" },
            { "11Rnd_45ACP_Mag", "", 60, -1, "" },
            { "30Rnd_556x45_Stanag", "", 210, -1, "" },
            { "30Rnd_9x21_Mag_SMG_02", "", 80, -1, "" },
            { "16Rnd_9x21_Mag", "Rubber Bullets (16 Rounds)", 25, -1, "" },
            { "20Rnd_556x45_UW_mag", "Taser Rifle Magazine", 45, -1, "" }
        };
        accs[] = {
            { "muzzle_snds_L", "", 650, -1, "" },
            { "muzzle_snds_H", "", 2750, -1, "" },
            { "muzzle_snds_B", "", 3000, -1, "" },
            { "acc_flashlight", "", 750, 100, "" },
            { "optic_MRCO", "", 3000, -1, "" },
            { "optic_Hamr", "", 3000, -1, "" },
            { "optic_Holosight", "", 1200, 275, "" },
            { "optic_Arco", "", 2500, -1, "" },
            { "optic_ACO_grn", "", 1000, -1, "" },
            { "optic_Aco", "", 1000, -1, "" },
            { "optic_MRD", "", 200, -1, "" }
        };
    };

     class cop_lieutenant {
        name = "Altis Lieutenant Shop";
        side = "cop";
        conditions = "call life_coplevel >= 4";
        items[] = { 
            //{ "srifle_DMR_05_blk_F", "", 60000, 30000 },
            { "arifle_AK12_F", "", 30000, 25000, "" },
            { "srifle_DMR_06_camo_F", "", 25000, 20000, "" },
            { "srifle_EBR_F", "", 25000, 20000, "" },
            { "arifle_MXM_Black_F", "", 20000, 15000, "" },
            { "arifle_MX_F", "", 15000, 7500, "" },
            { "arifle_SPAR_01_blk_F", "", 10000, 5000, "" },
            { "SMG_05_F", "", 6000, 5000, "" },
            { "SMG_02_F", "", 6000, -1, "" },
            { "hgun_Pistol_heavy_01_F", "", 3000, 650, "" },
            { "arifle_sdar_F", "Taser Rifle", 5000, 7500, "" },
            { "hgun_P07_snds_F", "Taser", 1000, 650, "" },
            { "HandGrenade_Stone", "Flashbang", 1700, -1, "" },
            //{ "tf_anprc152_1", "", 65, 30 },
            { "ToolKit", "", 1000, 450, "" },
            { "FirstAidKit", "", 150, 65, "" },
            //{ "tf_rt1523g_black", "", 150, 65 },
            { "ItemRadio", "Cell Phone", 200, 80, "" },
            { "ItemGPS", "", 100, 45, "" },
            { "NVGoggles", "", 2000, 980, "" },
            { "Binocular", "", 150, -1, "" },
            { "MineDetector", "", 1000, 500, "" },
            { "ItemMap", "", 50, 35, "" },
            { "ItemCompass", "", 50, 25, "" },
            { "ItemWatch", "", 50, -1, "" }
        };
        mags[] = {
            { "11Rnd_45ACP_Mag", "", 60, -1, "" },
            { "30Rnd_762x39_Mag_F", "", 350, -1, "" },
            { "10Rnd_93x64_DMR_05_Mag", "", 350, -1, "" },
            { "30Rnd_556x45_Stanag", "", 210, -1, "" },
            { "20Rnd_762x51_Mag", "", 250, -1, "" },
            { "30Rnd_65x39_caseless_mag", "", 130, -1, "" },
            { "30Rnd_9x21_Mag_SMG_02", "", 80, -1, "" },
            { "16Rnd_9x21_Mag", "Rubber Bullets (16 Rounds)", 25, -1, "" },
            { "20Rnd_556x45_UW_mag", "Taser Rifle Magazine", 45, -1, "" }
        };
        accs[] = {
            { "muzzle_snds_L", "", 650, -1, "" },
            { "muzzle_snds_H", "", 2750, -1, "" },
            { "muzzle_snds_B", "", 3000, -1, "" },
            { "acc_flashlight", "", 750, 100, "" },
            { "optic_MRCO", "", 3000, -1, "" },
            { "optic_Hamr", "", 3000, -1, "" },
            { "optic_Holosight", "", 1200, 275, "" },
            { "optic_Arco", "", 2500, -1, "" },
            { "optic_ACO_grn", "", 1000, -1, "" },
            { "optic_Aco", "", 1000, -1, "" },
            { "optic_MRD", "", 200, -1, "" }
        };
    };

    //Medic Shops
    class med_basic {
        name = "store";
        side = "med";
        conditions = "";
        items[] = {
            //{ "tf_anprc152_1", "", 65, 30 },
            { "ToolKit", "", 1000, 450, "" },
            { "Medikit", "", 500, 450, "" },
            { "FirstAidKit", "", 150, 65, "" },
            { "Binocular", "", 150, -1, "" },
            //{ "tf_rt1523g_black", "", 150, 65 },
            { "NVGoggles", "", 1200, 980, "" },
            { "B_Bergen_sgg", "", 3000, -1, "" },
            { "ItemRadio", "Cell Phone", 200, 80, "" },
            { "ItemGPS", "", 100, 45, "" },
            { "ItemMap", "", 50, 35, "" },
            { "ItemCompass", "", 50, 25, "" },
            { "ItemWatch", "", 50, -1, "" }
        };
        mags[] = {};
        accs[] = {};
    };
};