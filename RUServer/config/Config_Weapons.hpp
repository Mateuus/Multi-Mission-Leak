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
            { "hgun_PDW2000_F", "", 20000, -1, "" },
            { "SMG_02_F", "", 25000, -1, "" },
            { "SMG_01_F", "", 25000, -1, "" }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 25, 100, "" },
            { "6Rnd_45ACP_Cylinder", "", 50, 100, "" },
            { "9Rnd_45ACP_Mag", "", 45, 100, "" },
            { "30Rnd_9x21_Mag", "", 75, 100, "" },
            { "30Rnd_9x21_Mag_SMG_02", "", 75, 100, "" },
            { "30Rnd_45ACP_Mag_SMG_01", "", 75, 100, "" }
        };
        accs[] = {
            { "optic_ACO_grn_smg", "", 2500, 100, "" },
            { "optic_Aco_smg", "", 2500, 100, "" },
            { "optic_Holosight_blk_F", "", 5000, 100, "" }
        };
    };

    class rebel {
        name = "Mohammed's Jihadi Shop";
        side = "civ";
        conditions = "license_civ_rebel";
        items[] = {
   		         { "Rangefinder", "", 25000, 100, "" },
			         { "ItemGPS", "", 2500, 45, "" },
			         { "ItemRadio", "Smartphone", 3000, 45, "" },
               { "FirstAidKit", "", 10000, 65, "" },
			         { "NVGoggles", "", 20000, 980, "" },
			         //{ "O_NVGoggles_hex_F", "", 50000, 980, "" },
               { "arifle_TRG20_F", "", 150000, 2500, "" },
               { "arifle_TRG21_F", "", 175000, 2500, "" },
               { "arifle_Mk20_F", "", 175000, 2500, "" },
               { "arifle_SDAR_F", "", 150000, 7500, "" },
			         { "arifle_SPAR_01_snd_F", "", 200000, 5000, "" },
               { "arifle_Katiba_F", "", 300000, 5000, "" },
               { "arifle_Katiba_C_F", "", 300000, 5000, "" },
			         { "arifle_CTAR_hex_F", "", 300000, 5000, "" },
			         { "arifle_MXC_F", "", 400000, 5000, "" },
			         { "arifle_MX_F", "", 400000, 5000, "" },
			         { "arifle_MXM_F", "", 500000, 5000, "" },
               { "arifle_SPAR_03_khk_F", "", 500000, 5000, "" },
               { "arifle_SPAR_03_snd_F", "", 500000, 5000, "" },
			         { "arifle_AK12_F", "", 900000, 5000, "" },
			         { "arifle_AKM_F", "", 1000000, 5000, "" },
               { "srifle_DMR_01_F", "", 750000, 5000, "" },
               { "srifle_DMR_06_camo_khs_F", "", 775000, 5000, "" },
			         { "srifle_DMR_03_tan_F", "", 2000000, 5000, "" },
               { "srifle_LRR_F", "", 5000000, 5000, "" }

        };
        mags[] = {
              { "30Rnd_556x45_Stanag", "", 500, 100, "" },
			         { "20Rnd_556x45_UW_mag", "", 500, 100, "" },
               { "30Rnd_65x39_caseless_green", "", 500, 100, "" },
			         { "30Rnd_580x42_Mag_F", "", 500, 100, "" },
			         { "30Rnd_65x39_caseless_mag", "", 500, 100, "" },
			         { "30Rnd_762x39_Mag_F", "", 1000, 100, "" },
               { "10Rnd_762x54_Mag", "", 2500, 100, "" },
			         { "20Rnd_762x51_Mag", "", 25000, 100, "" },
               { "7Rnd_408_Mag", "", 50000, 100, "" }
        };
        accs[] = {
			         { "acc_flashlight", "", 1000, 100, "" },
               { "optic_ACO_grn", "", 3500, 100, "" },
               { "optic_Holosight", "", 3600, 100, "" },
			         { "optic_Arco", "", 7500, 100, "" },
               { "optic_Hamr", "", 7500, 100, "" },
			         { "optic_ERCO_blk_F", "", 7500, 100, "" },
			         { "optic_MRCO", "", 7500, 100, "" },
			         { "optic_SOS", "", 7500, 100, "" },
			         { "optic_DMS", "", 7500, 100, "" },
			         { "optic_LRPS", "", 7500, 100, "" },
 			         { "optic_AMS", "", 7500, 100, "" },
			         { "optic_KHS_blk", "", 7500, 100, "" }
        };
    };

    class gang {
        name = "Hideout Armament";
        side = "civ";
        conditions = "";
        items[] = {
          { "hgun_Rook40_F", "", 1000, 500, "" },
          { "hgun_Pistol_heavy_02_F", "", 15000, -1, "" },
          { "hgun_ACPC2_F", "", 16500, -1, "" },
          { "hgun_PDW2000_F", "", 25000, -1, "" }
      };
      mags[] = {
          { "16Rnd_9x21_Mag", "", 50, 100, "" },
          { "6Rnd_45ACP_Cylinder", "", 100, 100, "" },
          { "9Rnd_45ACP_Mag", "", 75, 100, "" },
          { "30Rnd_9x21_Mag", "", 125, 100, "" }
      };
      accs[] = {
          { "optic_ACO_grn_smg", "", 4500, 100, "" }
      };
    };

    //Basic Shops
    class genstore {
        name = "Tanoa General Store";
        side = "civ";
        conditions = "";
        items[] = {
            { "Binocular", "", 150, -1, "" },
            { "ItemGPS", "", 100, 45, "" },
            { "ItemMap", "", 50, 35, "" },
            { "ItemCompass", "", 50, 25, "" },
            { "ItemWatch", "", 50, -1, "" },
			         { "ItemRadio", "Smartphone", 200, 50, "" },
            { "FirstAidKit", "", 150, 65, "" },
            { "NVGoggles", "", 2000, 980, "" },
        };
        mags[] = {};
        accs[] = {};
    };

    class f_station_store {
        name = "Tanoa Fuel Station Store";
        side = "";
        conditions = "";
        items[] = {
            { "Binocular", "", 750, -1, "" },
            { "ItemGPS", "", 500, 45, "" },
            { "ItemMap", "", 250, 35, "" },
            { "ItemCompass", "", 250, 25, "" },
            { "ItemWatch", "", 250, -1, "" },
			      { "ItemRadio", "Smartphone", 1000, 50, "" },
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
        name = "Tanoa Cop Shop";
        side = "cop";
        conditions = "";
        items[] = {
			         { "Rangefinder", "", 500, -1, "" },
               { "ItemGPS", "", 100, 45, "" },
			         { "ItemRadio", "Smartphone", 200, 50, "" },
               { "FirstAidKit", "", 150, 65, "" },
			         { "Medikit", "", 1000, 65, "" },
               { "NVGoggles", "", 1500, 980, "" },
			         { "NVGogglesB_blk_F", "", 5000, 1000, "call life_coplevel >= 5" },
               { "SmokeShellRed", "Tränengas", 1000, 200, "license_cop_sek" },
			         { "hgun_Pistol_heavy_01_snds_F", "Taser Pistol", 2000, 650, "call life_coplevel >= 1" },
		           { "arifle_SDAR_F", "", 30000, 7500, "call life_coplevel >= 3" },
               { "SMG_02_F", "", 3000, 10000, "call life_coplevel >= 2" },
	             { "arifle_Mk20_F", "", 3000, 10000, "call life_coplevel >= 2" },
			         { "arifle_SPAR_01_snd_F", "", 3200, 10000, "call life_coplevel >= 2" },
               { "arifle_MXC_F", "", 30000, 5000, "call life_coplevel >= 3" },
			         { "arifle_MXC_Black_F", "", 30000, 5000, "call life_coplevel >= 3 && {license_cop_sek}" },
			         { "arifle_MX_F", "", 35000, 7500, "call life_coplevel >= 4" },
			         { "arifle_MX_Black_F", "", 35000, 7500, "call life_coplevel >= 3 && {license_cop_sek}" },
			         { "arifle_Katiba_F", "", 35000, 7500, "call life_coplevel >= 4" },
			         { "arifle_MXM_F", "", 50000, 10000, "call life_coplevel >= 5" },
			         { "arifle_MXM_Black_F", "", 50000, 10000, "call life_coplevel >= 4 && {license_cop_sek}" },
      			   { "arifle_AK12_F", "", 75000, 10000, "call life_coplevel >= 6" },
			         { "srifle_EBR_F", "", 75000, 10000, "call life_coplevel >= 6" },
			         { "srifle_DMR_03_F", "", 100000, 10000, "call life_coplevel >= 7" },
			         { "srifle_DMR_02_F", "", 125000, 10000, "call life_coplevel >= 7 && {license_cop_sek}" }
        };
        mags[] = {
            { "11Rnd_45ACP_Mag", "Stun Pistol Magazine", 25, 20, "" },
            { "30Rnd_65x39_caseless_mag_Tracer", "Taser Rifle Magazine", 45, 20, "license_cop_sek" },
			         { "20Rnd_556x45_UW_mag", "", 300, 100, "call life_coplevel >= 3" },
			         { "30Rnd_9x21_Mag_SMG_02", "", 300, 100, "call life_coplevel >= 2" },
			         { "30Rnd_556x45_Stanag", "", 300, 100, "call life_coplevel >= 2" },
			         { "30Rnd_65x39_caseless_mag", "", 300, 100, "call life_coplevel >= 3" },
			         { "30Rnd_65x39_caseless_green", "", 300, 100, "call life_coplevel >= 4" },
			         { "30Rnd_762x39_Mag_F", "", 300, 100, "call life_coplevel >= 6" },
			         { "20Rnd_762x51_Mag", "", 300, 100, "call life_coplevel >= 6" },
			         { "10Rnd_338_Mag", "", 300, 100, "call life_coplevel >= 7" }

        };
        accs[] = {
			         { "optic_MRD", "", 100, 100, "call life_coplevel >= 1"},
            { "acc_flashlight", "", 750, 100, "call life_coplevel >= 2" },
            { "optic_Holosight", "", 1200, 100, "call life_coplevel >= 2" },
			         { "optic_MRCO", "", 3000, 100, "call life_coplevel >= 2" },
            { "optic_Arco", "", 2500, 100, "call life_coplevel >= 2" },
			         { "optic_Hamr", "", 2500, 100, "call life_coplevel >= 3" },
			         { "optic_ERCO_blk_F", "", 3000, 100, "call life_coplevel >= 4" },
			         { "muzzle_snds_H", "", 2750, 100, "call life_coplevel >= 4" },
			         { "optic_DMS", "", 3000, 100, "call life_coplevel >= 5" },
			         { "optic_SOS", "", 3000, 100, "call life_coplevel >= 5" },
			         { "optic_LRPS", "", 3000, 100, "call life_coplevel >= 5" },
			         { "optic_AMS", "", 3000, 100, "call life_coplevel >= 5" },
 			        { "optic_KHS_blk", "", 3000, 100, "call life_coplevel >= 5" },
			         { "muzzle_snds_B", "", 3250, 100, "call life_coplevel >= 6" },
			         { "optic_Nightstalker", "", 3000, 100, "call life_coplevel >= 7 && {license_cop_sek}" }
        };
    };

    class psm_basic {
        name = "Tanoa Militär Shop";
        side = "psm";
        conditions = "";
        items[] = {
			         { "Rangefinder", "", 250, -1, "" },
            { "ItemGPS", "", 100, 45, "" },
			         { "ItemRadio", "Smartphone", 200, 50, "" },
            { "FirstAidKit", "", 150, 65, "" },
			         { "Medikit", "", 250, 65, "" },
            { "NVGoggles", "", 2000, 980, "" },
			         { "NVGogglesB_blk_F", "", 5000, 1000, "call life_psmlevel >= 5" },
            { "SmokeShellRed", "Tränengas", 500, 200, "license_psm_sek" },
			         { "hgun_Pistol_heavy_01_snds_F", "Taser Pistole", 2000, 650, "call life_psmlevel >= 1" },
		          { "arifle_SDAR_F", "", 30000, 7500, "call life_psmlevel >= 3" },
            { "SMG_02_F", "", 3000, 10000, "call life_psmlevel >= 2" },
	           { "arifle_Mk20_F", "", 3000, 10000, "call life_psmlevel >= 2" },
			         { "arifle_SPAR_01_snd_F", "", 3200, 10000, "call life_psmlevel >= 2" },
            { "arifle_MXC_F", "", 30000, 5000, "call life_psmlevel >= 3" },
			         { "arifle_MXC_Black_F", "", 30000, 5000, "call life_psmlevel >= 3 && {license_psm_sf}" },
			         { "arifle_MX_F", "", 35000, 7500, "call life_psmlevel >= 4" },
			         { "arifle_MX_Black_F", "", 35000, 7500, "call life_psmlevel >= 3 && {license_psm_sf}" },
			         { "arifle_Katiba_F", "", 35000, 7500, "call life_psmlevel >= 4" },
			         { "arifle_MXM_F", "", 50000, 10000, "call life_psmlevel >= 5" },
			         { "arifle_MXM_Black_F", "", 50000, 10000, "call life_psmlevel >= 4 && {license_psm_sf}" },
      			   { "arifle_AK12_F", "", 75000, 10000, "call life_psmlevel >= 6" },
			         { "srifle_EBR_F", "", 75000, 10000, "call life_psmlevel >= 6" },
			         { "srifle_DMR_03_F", "", 100000, 10000, "call life_psmlevel >= 7" },
			         { "srifle_DMR_02_F", "", 125000, 10000, "call life_psmlevel >= 7 && {license_psm_sf}" }
        };
        mags[] = {
            { "11Rnd_45ACP_Mag", "Stun Pistol Magazine", 25, 20, "" },
            { "30Rnd_65x39_caseless_mag_Tracer", "Taser Rifle Magazine", 45, 20, "license_psm_sf" },
			         { "20Rnd_556x45_UW_mag", "", 300, 100, "call life_psmlevel >= 3" },
			         { "30Rnd_9x21_Mag_SMG_02", "", 300, 100, "call life_psmlevel >= 2" },
			         { "30Rnd_556x45_Stanag", "", 300, 100, "call life_psmlevel >= 2" },
			         { "30Rnd_65x39_caseless_mag", "", 300, 100, "call life_psmlevel >= 3" },
			         { "30Rnd_65x39_caseless_green", "", 300, 100, "call life_psmlevel >= 4" },
			         { "30Rnd_762x39_Mag_F", "", 300, 100, "call life_psmlevel >= 6" },
			         { "20Rnd_762x51_Mag", "", 300, 100, "call life_psmlevel >= 6" },
			         { "10Rnd_338_Mag", "", 300, 100, "call life_psmlevel >= 7" }

        };
        accs[] = {
			         { "optic_MRD", "", 100, 100, "call life_psmlevel >= 1"},
            { "acc_flashlight", "", 750, 100, "call life_psmlevel >= 2" },
            { "optic_Holosight", "", 1200, 100, "call life_psmlevel >= 2" },
			         { "optic_MRCO", "", 3000, 100, "call life_psmlevel >= 2" },
            { "optic_Arco", "", 2500, 100, "call life_psmlevel >= 2" },
			         { "optic_Hamr", "", 2500, 100, "call life_psmlevel >= 3" },
			         { "optic_ERCO_blk_F", "", 3000, 100, "call life_psmlevel >= 4" },
			         { "muzzle_snds_H", "", 2750, 100, "call life_psmlevel >= 4" },
			         { "optic_DMS", "", 3000, 100, "call life_psmlevel >= 5" },
			         { "optic_SOS", "", 3000, 100, "call life_psmlevel >= 5" },
			         { "optic_LRPS", "", 3000, 100, "call life_psmlevel >= 5" },
			         { "optic_AMS", "", 3000, 100, "call life_psmlevel >= 5" },
 			        { "optic_KHS_blk", "", 3000, 100, "call life_psmlevel >= 5" },
			         { "muzzle_snds_B", "", 3250, 100, "call life_psmlevel >= 6" },
			         { "optic_Nightstalker", "", 3000, 100, "call life_psmlevel >= 7 && {license_psm_sf}" }
        };
    };

    //Medic Shops
    class med_basic {
        name = "store";
        side = "med";
        conditions = "";
        items[] = {
            { "ItemGPS", "", 100, 45, "" },
			         { "ItemRadio", "Smartphone", 200, 50, "" },
            { "Binocular", "", 150, -1, "" },
            { "FirstAidKit", "", 150, 65, "" },
			         { "Medikit", "", 250, 65, "" },
            { "NVGoggles", "", 1200, 980, "" },
        };
        mags[] = {};
        accs[] = {};
    };
};
