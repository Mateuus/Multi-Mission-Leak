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
            { "RH_m9", "", 6500, 500 },
            { "RH_python", "", 6500, 500 },
            { "RH_g17", "", 6500, 500 },
            { "hgun_P07_F", "", 6500, 500 },
            { "RH_m1911", "", 6500, 500 }
        };
        mags[] = {
            { "RH_15Rnd_9x19_M9", "", 6500, 500 },
            { "RH_6Rnd_357_Mag", "", 6500, 500 },
            { "RH_17Rnd_9x19_g17", "", 6500, 500 },
            { "16Rnd_9x21_red_Mag", "", 6500, 500 },
            { "RH_7Rnd_45cal_m1911", "", 6500, 500 }
        };
    };

    class rebel {
        name = "Mohammed's Jihadi Shop";
        side = "civ";
        license = "rebel";
        level[] = { "", "", -1, "" };
        items[] = {
            { "arifle_TRG20_F", "", 25000, 2500 },
            { "arifle_Katiba_F", "", 30000, 5000 },
            { "srifle_DMR_01_F", "", 50000, -1 },
            { "arifle_SDAR_F", "", 20000, 7500 },
            { "optic_ACO_grn", "", 3500, 350 },
            { "optic_Holosight", "", 3600, 275 },
            { "optic_Hamr", "", 7500, -1 },
            { "acc_flashlight", "", 1000, 100 }
        };
        mags[] = {
            { "30Rnd_556x45_Stanag", "", 300 },
            { "30Rnd_65x39_caseless_green", "", 275 },
            { "10Rnd_762x54_Mag", "", 500 },
            { "20Rnd_556x45_UW_mag", "", 125 }
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
            { "hgun_PDW2000_F", "", 9500, -1 },
            { "optic_ACO_grn_smg", "", 950, 250 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 25 },
            { "6Rnd_45ACP_Cylinder", "", 50 },
            { "9Rnd_45ACP_Mag", "", 45 },
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
			
            { "ACE_EntrenchingTool", "", 100, 45 },
            { "ACE_IR_Strobe_Item", "", 100, 45 },
            { "ACE_IR_Strobe_Item", "", 100, 45 },
            { "ACE_MapTools", "", 1, 45 },
			
			
            { "hst_life_phone_phone", "", 200, 980 },
            { "Mattaust_Phone", "", 1000, 980 },
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
            { "Binocular", "", 750, -1 },
            { "ItemGPS", "", 500, 45 },
            { "ItemMap", "", 250, 35 },
            { "ItemCompass", "", 250, 25 },
            { "ItemWatch", "", 250, -1 },
            { "ToolKit", "", 1250, 75 },
            { "FirstAidKit", "", 750, 65 },
            { "Chemlight_red", "", 1500, -1 },
            { "Chemlight_yellow", "", 1500, 50 },
            { "Chemlight_green", "", 1500, 50 },
            { "Chemlight_blue", "", 1500, 50 }
        };
        mags[] = {};
    };

    //Cop Shops
    class cop_basic {
        name = "Kelleys Island Cop Shop";
        side = "cop";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "cl3_taserM26_Yellow", "Taser", 75, 7500 },
            { "RH_m9", "M9", 75, 650 },
            { "RH_g17", "Glock 17", 75, 1500 },
            { "RH_g19", "Glock 19", 75, -1 },
            { "RH_cz75", "CZ-75", 75, -1 },
			{ "RH_fn57", "FN Five-seveN", 75, -1 },
			{ "RH_fnp45", "FNP-45", 75, -1 },
			{ "RH_kimber_nw", "Kimber Night warrior", 75, -1 },
			{ "RH_m1911", "Colt M1911", 75, -1 },
			{ "RH_p226", "P226", 75, -1 },
			{ "RH_usp", "USP 45ACP", 75, -1 },
            { "Binocular", "", 150, -1 },
            { "ItemGPS", "", 100, 45 },
            { "ToolKit", "", 250, 75 },
            { "ACE_fieldDressing", "", 1, -1 },
            { "ACE_elasticBandage", "", 1, -1 },
            { "ACE_quikclot", "", 1, -1 },
            { "ACE_packingBandage", "", 1, -1 },
            { "tf_anprc152", "", 1, -1 }			
        };
        mags[] = {
            { "15Rnd_9x19_M9", "", 25 },
            { "cl3_taserm26mag_mpx", "Taser Magazine", 45 },
            { "RH_17Rnd_9x19_g17", "", 25 },
            { "RH_16Rnd_9x19_CZ", "", 25 },
			{ "RH_20Rnd_57x28_FN", "", 25 },
			{ "RH_15Rnd_45cal_fnp", "", 25 },
			{ "RH_7Rnd_45cal_m1911", "", 25 },	
			{ "RH_15Rnd_9x19_SIG", "", 25 },	
			{ "RH_12Rnd_45cal_usp", "", 25 }	
        };
    };

    class cop_patrol {
        name = "Kelleys Island Patrol Officer Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 2, "You must be a Patrol Officer Rank!" };
        items[] = {};
        mags[] = {};
    };

    class cop_sergeant {
        name = "Kelleys Island Sergeant Officer Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 3, "You must be a Sergeant Rank!" };
        items[] = {};
        mags[] = {};
    };
	class cop_ChiefofPolice {
        name = "Kelleys Island Chief of Police Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "SCALAR", 8, "You must be a CHIEF OF POLICE!" };
        items[] = {
            { "hgun_ACPC2_F", "", 17500, -1 },
            { "SMG_02_ACO_F", "", 15000, -1 },
            { "arifle_MXC_F", "", 30000, 5000 },
            { "HandGrenade_Stone", "Flashbang", 1700, -1 },
            { "optic_Arco", "", 2500, -1 },
            { "muzzle_snds_H", "", 2750, -1 }
        };
        mags[] = {
            { "9Rnd_45ACP_Mag", "", 200 },
            { "30Rnd_9x21_Mag", "", 60 },
            { "30Rnd_65x39_caseless_mag", "", 100, -1 }
        };
    };

    //Medic Shops
    class med_basic {
        name = "Store";
        side = "med";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "ItemGPS", "", 100, 45 },
            { "Binocular", "", 150, -1 },
            { "ToolKit", "", 250, 75 },
            { "FirstAidKit", "", 150, 65 },
            { "Medikit", "", 500, 450 },
            { "NVGoggles", "", 1200, 980 },
            { "ACE_fieldDressing", "", 1, -1 },
            { "ACE_elasticBandage", "", 1, -1 },
            { "ACE_quikclot", "", 1, -1 },
            { "ACE_packingBandage", "", 1, -1 },
            { "ACE_tourniquet", "", 1, -1 },
            { "ACE_morphine", "", 1, -1 },
            { "ACE_atropine", "", 1, -1 },
            { "ACE_epinephrine", "", 1, -1 },
            { "ACE_adenosine", "", 1, -1 },
            { "ACE_plasmaIV_500", "", 1, -1 },
            { "ACE_salineIV_500", "", 1, -1 },
            { "ACE_bloodIV_500", "", 1, -1 },
            { "ACE_bodyBag", "", 1, -1 },
            { "ACE_surgicalKit", "", 1, -1 },
            { "ACE_personalAidKit", "", 1, -1 },
            { "ACE_SpraypaintRed", "", 1, -1 },
            { "ACE_SpraypaintBlack", "", 1, -1 },
            { "ACE_wirecutter", "", 1, -1 },
            { "cl_FlashLight", "", 1, -1 },
            { "tf_anprc152", "", 1, -1 },
            { "CG_Pro_Item_i", "", 1, -1 },
            { "CG_Lockpick", "", 1, -1 },
            { "ToolKit", "", 1200, 980 }
        };
        mags[] = {};
    };
};
