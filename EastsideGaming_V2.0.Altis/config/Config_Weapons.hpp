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
        name = "Feuerwehr Ausrüstung";
        side = "med";
        conditions = "";
        level[] = { "", "", -1, "" };
        items[] = {
              { "ItemWatch", "", 100, 0, "" },
              { "ItemCompass", "", 150, 0, "" },
              { "ItemGPS", "", 300, 0, "" },
              { "ItemRadio", "", 300, 0, "" },
              { "ItemMap", "", 100, 0, "" },
              { "ItemWatch", "", 100, 0, "" },
              { "NVGoggles", "", 2500, 0, "" },
              { "Binocular", "", 10000, 0, "" },
              { "ToolKit", "", 500, 0, "" },
			  { "SmokeShellPurple", "",5000, 0, "" }
        };
    };

	class civ_gun {
        name = "Waffenladen";
        side = "civ";
        conditions = "license_civ_gun";
        level[] = { "", "", -1, "" };
        items[] = {
            { "hgun_Pistol_heavy_01_F", "", 25000, 0, "" },
            { "11Rnd_45ACP_Mag", "", 300, 0, "" },
      		{ "hgun_Pistol_01_F", "", 25000, 0, "" },
            { "10Rnd_9x21_Mag", "", 300, 0, "" },
      		{ "hgun_Rook40_F", "", 25000, 0, "" },
            { "16Rnd_9x21_Mag", "", 300, 0, "" },
            { "hgun_PDW2000_F", "", 25000, 0, "" },
            { "30Rnd_9x21_Mag", "", 300, 0, "" },
            { "SMG_01_F", "", 25000, 0, "" },
            { "30Rnd_45ACP_Mag_SMG_01", "", 300, 0, "" }
		};
	};

	class cop_weap {
        name = "Polizei Waffenladen";
        side = "cop";
        conditions = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "ItemWatch", "", 100, 0, "" },
            { "ItemCompass", "", 100, 0, "" },
            { "ItemGPS", "", 100, 0, "" },
            { "ItemRadio", "", 100, 0, "" },
            { "ItemMap", "", 100, 0, "" },
            { "ItemWatch", "", 100, 0, "" },
            { "Rangefinder", "", 2000, 0, "" },
            { "ToolKit", "", 2000, 25, "" },
            { "NVGoggles_OPFOR", "", 10, 1, "" },
            { "hgun_P07_snds_F", "", 1000, 10, "call life_coplevel >= 1" },
			      { "hgun_P07_khk_Snds_F", "", 1000, 10, "call life_coplevel >= 1" },
            {"16Rnd_9x21_Mag", "", 50, 1, ""},
      			{"30Rnd_9x21_Mag", "", 50, 1, ""},
			//LVL 1
      			{ "arifle_SDAR_F", "", 20000, 10, "call life_coplevel >= 1" },
            { "20Rnd_556x45_UW_mag", "", 1500, 1, "call life_coplevel >= 1" },
            { "30Rnd_556x45_Stanag", "", 1500, 1, "call life_coplevel >= 1" },
      			{ "SMG_01_F", "", 20000, 10, "call life_coplevel >= 1" },
            { "30Rnd_45ACP_Mag_SMG_01", "", 1500, 1, "call life_coplevel >= 1" },
      			{ "SMG_02_F", "", 20000, 10, "call life_coplevel >= 1" },
            { "30Rnd_9x21_Mag_SMG_02", "", 1500, 1, "call life_coplevel >= 1" },
      			{ "SMG_05_F", "", 20000, 10, "call life_coplevel >= 1" },
            { "30Rnd_9x21_Mag_SMG_02", "", 1500, 1, "call life_coplevel >= 1" },
      			{ "arifle_Mk20_plain_F", "", 20000, 10, "call life_coplevel >= 1" },
            { "30Rnd_556x45_Stanag", "", 1500, 1, "call life_coplevel >= 1" },
      			//LVL2
      			{ "arifle_Katiba_C_F", "", 30000, 10, "call life_coplevel >= 2" },
            { "30Rnd_65x39_caseless_green", "", 1500, 1, "call life_coplevel >= 2" },
      			{ "arifle_Katiba_F", "", 30000, 10, "call life_coplevel >= 2" },
            { "30Rnd_65x39_caseless_green", "", 1500, 1, "call life_coplevel >= 2" },
      			{ "arifle_MXC_Black_F", "", 40000, 10, "call life_coplevel >= 2" },
            { "30Rnd_65x39_caseless_mag", "", 1500, 1, "call life_coplevel >= 2" },
      			{ "arifle_MX_Black_F", "", 40000, 10, "call life_coplevel >= 2" },
            { "30Rnd_65x39_caseless_mag", "", 1500, 1, "call life_coplevel >= 2" },
      			//LVL3
      			{ "arifle_MX_SW_Black_F", "", 90000, 10, "call life_coplevel >= 3" },
            { "100Rnd_65x39_caseless_mag", "", 1500, 1, "call life_coplevel >= 3" },
      			{ "arifle_MXM_Black_F", "", 35000, 10, "call life_coplevel >= 3" },
            { "30Rnd_65x39_caseless_mag", "", 1500, 1, "call life_coplevel >= 3" },
      			{ "srifle_DMR_07_blk_F", "", 30000, 10, "call life_coplevel >= 3" },
            { "20Rnd_650x39_Cased_Mag_F", "", 1500, 1, "call life_coplevel >= 3" },
      			{ "arifle_SPAR_01_blk_F", "", 30000, 10, "call life_coplevel >= 3" },
            { "30Rnd_556x45_Stanag", "", 1500, 1, "call life_coplevel >= 3"},
      			//LVL4
      			{ "arifle_SPAR_02_blk_F", "", 60000, 10, "call life_coplevel >= 4" },
            { "150Rnd_556x45_Drum_Mag_F", "", 1500, 1, "call life_coplevel >= 4" },
      			{ "arifle_CTARS_blk_F", "", 55000, 10, "call life_coplevel >= 4" },
            { "100Rnd_580x42_Mag_F", "", 1500, 1, "call life_coplevel >= 4" },
      			{ "arifle_CTAR_blk_F", "", 35000, 10, "call life_coplevel >= 4" },
            { "30Rnd_580x42_Mag_F", "", 1500, 1, "call life_coplevel >= 4" },
      			{ "srifle_EBR_F", "", 65000, 10, "call life_coplevel >= 4" },
            { "20Rnd_762x51_Mag", "", 1500, 1, "call life_coplevel >= 4" },
      			{ "arifle_SPAR_03_blk_F", "", 65000, 10, "call life_coplevel >= 4" },
            { "20Rnd_762x51_Mag", "", 1500, 1, "call life_coplevel >= 4" },
      			{ "srifle_DMR_03_F", "", 65000, 10, "call life_coplevel >= 4" },
            { "20Rnd_762x51_Mag", "", 1500, 1, "call life_coplevel >= 4" },
            { "srifle_DMR_06_olive_F", "", 65000, 10, "call life_coplevel >= 4" },
            { "20Rnd_762x51_Mag", "", 1500, 1, "call life_coplevel >= 4" },
            { "LMG_Mk200_F", "", 100000, 10, "call life_coplevel >= 4" },
            { "200Rnd_65x39_cased_Box", "", 1500, 1, "call life_coplevel >= 4" },
      			//LVL5
      			{ "LMG_Zafir_F", "", 150000, 10, "call life_coplevel >= 5" },
            { "150Rnd_762x54_Box", "", 1500, 1, "call life_coplevel >= 5" },
      			{ "LMG_03_F", "", 100000, 10, "call life_coplevel >= 5" },
            { "200Rnd_556x45_Box_F", "", 1500, 1, "call life_coplevel >= 5" },
      			{ "srifle_DMR_05_blk_F", "", 200000, 10, "call life_coplevel >= 5" },
            { "10Rnd_93x64_DMR_05_Mag", "", 1500, 1, "call life_coplevel >= 5" },
      			{ "srifle_DMR_04_F", "", 200000, 10, "call life_coplevel >= 5" },
            { "10Rnd_127x54_Mag", "", 1500, 1, "call life_coplevel >= 5" },
            { "srifle_DMR_02_F", "", 250000, 10, "call life_coplevel >= 5" },
            { "10Rnd_338_Mag", "", 1500, 1, "call life_coplevel >= 5" },
            { "arifle_ARX_blk_F", "", 65000, 10, "call life_coplevel >= 5" },
            { "30Rnd_65x39_caseless_green", "", 1500, 1, "call life_coplevel >= 5" },
            { "arifle_AK12_F", "", 95000, 10, "call life_coplevel >= 5" },
            { "30Rnd_762x39_Mag_F", "", 1500, 1, "call life_coplevel >= 5" },
      			//LVL6
      			{ "srifle_LRR_F", "", 250000, 10, "call life_coplevel >= 6" },
            { "7Rnd_408_Mag", "", 1500, 1, "call life_coplevel >= 6" },
      			{ "srifle_GM6_F", "", 300000, 10, "call life_coplevel >= 6" },
            { "5Rnd_127x108_Mag", "", 1500, 1, "call life_coplevel >= 6" },
            { "5Rnd_127x108_APDS_Mag", "", 1500, 1, "call life_coplevel >= 7" },
      			{ "MMG_01_hex_F", "", 300000, 10, "call life_coplevel >= 6" },
            { "150Rnd_93x64_Mag", "", 1500, 1, "call life_coplevel >= 6" },
      			{ "MMG_02_black_F", "", 350000, 10, "call life_coplevel >= 6" },
            { "130Rnd_338_Mag", "", 1500, 1, "call life_coplevel >= 6" },
      			{ "launch_RPG32_F", "", 500000, 10, "call life_coplevel >= 6" },
            { "RPG32_F", "", 100000, 1, "call life_coplevel >= 6" },
            { "RPG32_HE_F", "", 100000, 1, "call life_coplevel >= 7" },
            { "HandGrenade_Stone", "", 100, 10, "call life_coplevel >= 4" },
            { "SmokeShell", "", 100, 10, "call life_coplevel >= 1" },
            { "SmokeShellOrange", "", 100, 10, "call life_coplevel >= 1" },
            { "NVGoggles_OPFOR", "", 10, 1, "" },
            { "acc_flashlight", "",  1000, 1, "" },
            { "acc_pointer_IR", "",  1000, 1, "" },
            { "bipod_01_F_blk", "",  1000, 1, "" },
            { "muzzle_snds_acp", "",  5000, 1, "" },
            { "muzzle_snds_L", "",  5000, 1, "" },
            { "muzzle_snds_H", "",  5000, 1, "" },
            { "muzzle_snds_M", "",  5000, 1, "" },
            { "muzzle_snds_58_blk_F", "",  5000, 1, "" },
            { "muzzle_snds_B", "",  5000, 1, "" },
            { "muzzle_snds_H_MG_blk_F", "",  5000, 1, "" },
            { "muzzle_snds_M", "",  5000, 1, "" },
            { "muzzle_snds_93mmg", "",  5000, 1, "" },
            { "muzzle_snds_338_black", "",  5000, 1, "" },
            { "muzzle_snds_H_snd_F", "",  5000, 1, "" },
            { "muzzle_snds_93mmg_tan", "",  5000, 1, "" },
            { "muzzle_snds_338_black", "", 5000, 1, "" },
            { "optic_Aco", "", 1000, 50, "" },
            { "optic_ACO_grn", "", 1000, 50, "" },
            { "optic_Aco_smg", "", 1000, 50, "" },
            { "optic_ACO_grn_smg", "", 1000, 50, "" },
            { "optic_Arco", "", 2000, 50, "" },
            { "optic_Hamr", "", 2000, 50, "" },
            { "optic_Hamr_khk_F", "", 2000, 50, "" },
            { "optic_Holosight", "", 2000, 50, "" },
            { "optic_Holosight_smg", "", 2000, 50, "" },
            { "optic_SOS", "", 2000, 50, "" },
            { "optic_SOS_khk_F", "", 2000, 50, "" },
            { "optic_MRCO", "", 2000, 50, "" },
            { "optic_DMS", "", 2000, 50, "" },
            { "optic_DMS_ghex_F", "", 2000, 50, "" },
            { "optic_AMS", "", 2000, 50, "" },
            { "optic_AMS_khk", "", 2000, 50, "" },
            { "optic_AMS_snd", "", 2000, 50, "" },
            { "optic_KHS_blk", "", 2000, 50, "" },
            { "optic_KHS_hex", "", 2000, 50, "" },
            { "optic_KHS_old", "", 2000, 50, "" },
            { "optic_KHS_tan", "", 2000, 50, "" },
            { "optic_ERCO_blk_F", "", 2000, 50, "" },
            { "optic_ERCO_khk_F", "", 2000, 50, "" },
            { "optic_ERCO_snd_F", "", 2000, 50, "" }
		};
	};

	class reb {
        name = "Rebellen Waffenladen";
        side = "civ";
        conditions = "license_civ_rebel";
        level[] = { "", "", -1, "" };
        items[] = {
      			{ "arifle_Katiba_F", "", 150000, 0, "" },
            { "30Rnd_65x39_caseless_green", "", 1500, 0, "" },
            { "arifle_Katiba_C_F", "", 150000, 0, "" },
            { "30Rnd_65x39_caseless_green", "", 1500, 0, "" },
            { "arifle_Mk20_F", "", 160000, 0, "" },
            { "30Rnd_556x45_Stanag", "", 1500, 0, "" },
            { "arifle_Mk20C_F", "", 160000, 0, "" },
            { "30Rnd_556x45_Stanag", "", 1500, 0, "" },
            { "arifle_MXC_F", "", 180000, 0, "" },
            { "30Rnd_65x39_caseless_mag", "", 2000, 0, "" },
            { "arifle_MX_F", "", 180000, 0, "" },
            { "30Rnd_65x39_caseless_mag", "", 2000, 0, "" },
            { "arifle_MXM_F", "", 200000, 0, "" },
            { "30Rnd_65x39_caseless_mag", "", 2000, 0, "" },
            { "arifle_MX_SW_F", "", 300000, 0, "" },
            { "30Rnd_65x39_caseless_mag", "", 2000, 0, "" },
            { "100Rnd_65x39_caseless_mag", "", 10000, 0, "" },
            { "arifle_SDAR_F", "", 100000, 0, "" },
            { "20Rnd_556x45_UW_mag", "", 1500, 0, "" },
            { "arifle_TRG21_F", "", 170000, 0, "" },
            { "30Rnd_556x45_Stanag", "", 1500, 0, "" },
            { "arifle_TRG20_F", "", 170000, 0, "" },
            { "30Rnd_556x45_Stanag", "", 1500, 0, "" },
            { "srifle_DMR_01_F", "", 220000, 0, "" },
            { "10Rnd_762x54_Mag", "", 2000, 0, "" },
            { "srifle_DMR_02_camo_F", "", 800000, 0, "" },
            { "10Rnd_762x54_Mag", "", 3500, 0, "" },
            { "srifle_DMR_02_camo_F", "", 800000, 0, "" },
            { "srifle_DMR_02_sniper_F", "", 800000, 0, "" },
            { "10Rnd_762x54_Mag", "", 3500, 0, "" },
            { "srifle_DMR_03_khaki_F", "", 700000, 0, "" },
            { "srifle_DMR_03_tan_F", "", 700000, 0, "" },
            { "srifle_DMR_03_multicam_F", "", 700000, 0, "" },
            { "srifle_DMR_03_woodland_F", "", 700000, 0, "" },
            { "20Rnd_762x51_Mag", "", 3500, 0, "" },
            { "srifle_DMR_04_Tan_F", "", 650000, 0, "" },
            { "10Rnd_127x54_Mag", "", 3500, 500, "" },
            { "srifle_DMR_05_hex_F", "", 750000, 0, "" },
            { "srifle_DMR_05_tan_f", "", 750000, 0, "" },
            { "10Rnd_93x64_DMR_05_Mag", "", 3500, 0, "" },
            { "srifle_DMR_06_camo_khs_F", "", 500000, 0, "" },
            { "20Rnd_762x51_Mag", "", 3500, 0, "" },
            { "srifle_EBR_F", "", 500000, 0, "" },
            { "20Rnd_762x51_Mag", "", 3500, 0, "" },
            { "LMG_Mk200_F", "", 1000000, 0, "" },
            { "200Rnd_65x39_cased_Box", "", 5000, 0, "" },
            { "MMG_01_hex_F", "", 5000000, 0, "" },
            { "150Rnd_93x64_Mag", "", 5000, 0, "" },
            { "MMG_02_camo_F", "", 5000000, 0, "" },
            { "MMG_02_sand_F", "", 5000000, 0, "" },
            { "130Rnd_338_Mag", "", 5000, 0, "" },
            { "srifle_LRR_F", "", 2000000, 0, "" },
            { "srifle_LRR_tna_F", "", 2000000, 0, "" },
            { "7Rnd_408_Mag", "", 5000, 0, "" },
            { "srifle_GM6_F", "", 3000000, 0, "" },
            { "srifle_GM6_ghex_F", "", 3000000, 0, "" },
            { "5Rnd_127x108_Mag", "", 5000, 0, "" },
            { "srifle_DMR_07_hex_F", "", 300000, 0, "" },
            { "srifle_DMR_07_ghex_F", "", 300000, 0, "" },
            { "20Rnd_650x39_Cased_Mag_F", "", 3500, 0, "" },
            { "LMG_03_F", "", 1000000, 0, "" },
            { "200Rnd_556x45_Box_F", "", 5000, 0, "" },
            { "arifle_AK12_F", "", 750000, 0, "" },
            { "30Rnd_762x39_Mag_F", "", 3500, 0, "" },
            { "arifle_AKM_F", "", 400000, 0, "" },
            { "30Rnd_762x39_Mag_F", "", 3500, 0, "" },
            { "arifle_AKS_F", "", 250000, 0, "" },
            { "30Rnd_545x39_Mag_F", "", 3500, 0, "" },
            { "arifle_ARX_ghex_F", "", 340000, 0, "" },
            { "arifle_ARX_hex_F", "", 340000, 0, "" },
            { "30Rnd_65x39_caseless_green", "", 3500, 0, "" },
            { "arifle_CTAR_hex_F", "", 300000, 0, "" },
            { "arifle_CTAR_ghex_F", "", 300000, 0, "" },
            { "30Rnd_580x42_Mag_F", "", 3500, 0, "" },
            { "arifle_CTARS_hex_F", "", 450000, 0, "" },
            { "arifle_CTARS_ghex_F", "", 450000, 0, "" },
            { "100Rnd_580x42_Mag_F", "", 3500, 0, "" },
            { "arifle_SPAR_01_khk_F", "", 340000, 0, "" },
            { "arifle_SPAR_01_snd_F", "", 340000, 0, "" },
            { "30Rnd_556x45_Stanag", "", 3500, 0, "" },
            { "arifle_SPAR_02_khk_F", "", 600000, 0, "" },
            { "arifle_SPAR_02_snd_F", "", 600000, 0, "" },
            { "150Rnd_556x45_Drum_Mag_F", "", 3500, 0, "" },
            { "arifle_SPAR_03_khk_F", "", 700000, 0, "" },
            { "arifle_SPAR_03_snd_F", "", 700000, 0, "" },
            { "20Rnd_762x51_Mag", "", 3500, 0, "" },
            { "launch_RPG7_F", "", 4500000, 0, "" },
            { "RPG7_F", "", 500000, 0, "" },

            { "acc_flashlight", "",  1000, 1, "" },
            { "acc_pointer_IR", "",  1000, 1, "" },
            { "bipod_01_F_blk", "",  25000, 1, "" },
            { "muzzle_snds_H", "",  15000, 1, "" },
            { "muzzle_snds_M", "",  15000, 1, "" },
            { "muzzle_snds_H_MG", "",  15000, 1, "" },
            { "muzzle_snds_B", "",  15000, 1, "" },
            { "muzzle_snds_338_green", "",  15000, 1, "" },
            { "muzzle_snds_338_sand", "",  15000, 1, "" },
            { "muzzle_snds_B_snd_F", "",  15000, 1, "" },
            { "muzzle_snds_93mmg", "",  15000, 1, "" },

            { "muzzle_snds_93mmg_tan", "",  15000, 1, "" },
            { "muzzle_snds_65_TI_hex_F", "",  15000, 1, "" },
            { "muzzle_snds_65_TI_ghex_F", "",  15000, 1, "" },
            { "muzzle_snds_H_MG_blk_F", "",  15000, 1, "" },
            { "muzzle_snds_58_hex_F", "",  15000, 1, "" },
            { "muzzle_snds_58_ghex_F", "",  15000, 1, "" },
            { "muzzle_snds_m_khk_F", "",  15000, 1, "" },
            { "muzzle_snds_m_snd_F", "",  15000, 1, "" },
            { "muzzle_snds_B_khk_F", "",  15000, 1, "" },

            { "optic_Aco", "", 1000, 5, "" },
            { "optic_ACO_grn", "", 1000, 5, "" },
            { "optic_Aco_smg", "", 1000, 5, "" },
            { "optic_ACO_grn_smg", "", 1000, 5, "" },
            { "optic_Arco", "", 2000, 5, "" },
            { "optic_Hamr", "", 2000, 5, "" },
            { "optic_Hamr_khk_F", "", 2000, 5, "" },
            { "optic_Holosight", "", 2000, 5, "" },
            { "optic_Holosight_smg", "", 2000, 5, "" },
            { "optic_SOS", "", 2000, 5, "" },
            { "optic_SOS_khk_F", "", 2000, 5, "" },
            { "optic_MRCO", "", 2000, 5, "" },
            { "optic_DMS", "", 2000, 5, "" },
            { "optic_DMS_ghex_F", "", 2000, 5, "" },
            { "optic_AMS", "", 2000, 5, "" },
            { "optic_AMS_khk", "", 2000, 5, "" },
            { "optic_AMS_snd", "", 2000, 5, "" },
            { "optic_KHS_blk", "", 2000, 5, "" },
            { "optic_KHS_hex", "", 2000, 5, "" },
            { "optic_KHS_old", "", 2000, 5, "" },
            { "optic_KHS_tan", "", 2000, 5, "" },
            { "optic_ERCO_blk_F", "", 2000, 5, "" },
            { "optic_ERCO_khk_F", "", 2000, 5, "" },
            { "optic_ERCO_snd_F", "", 2000, 5, "" }
		    };
    };

	class genstore {
        name = "Baumarkt";
        side = "civ";
        conditions = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "ItemWatch", "", 100, 0, "" },
      		{ "ItemCompass", "", 150, 0, "" },
      		{ "ItemGPS", "", 300, 0, "" },
      		{ "ItemRadio", "", 300, 0, "" },
      		{ "ItemMap", "", 100, 0, "" },
      		{ "ItemWatch", "", 100, 0, "" },
      		{ "NVGoggles", "", 25000, 0, "" },
      		{ "Binocular", "", 10000, 0, "" },
			{ "ToolKit", "", 7500, 0, "" }
		};
	};

	class gang {
        name = "Gang-Waffenarsenal";
        side = "civ";
        conditions = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "ItemWatch", "", 100, 0, "" },
            { "ItemCompass", "", 150, 0, "" },
            { "ItemGPS", "", 300, 0, "" },
            { "ItemRadio", "", 300, 0, "" },
            { "ItemMap", "", 100, 0, "" },
            { "ItemWatch", "", 100, 0, "" },
            { "NVGoggles", "", 25000, 0, "" },
            { "Binocular", "", 10000, 0, "" },
            { "ToolKit", "", 7500, 0, "" },
            { "hgun_Pistol_heavy_01_F", "", 25000, 0, "" },
            { "11Rnd_45ACP_Mag", "", 300, 0, "" },
      			{ "hgun_Pistol_01_F", "", 25000, 0, "" },
            { "10Rnd_9x21_Mag", "", 300, 0, "" },
      			{ "hgun_Rook40_F", "", 25000, 0, "" },
            { "16Rnd_9x21_Mag", "", 300, 0, "" },
            { "hgun_PDW2000_F", "", 25000, 0, "" },
            { "30Rnd_9x21_Mag", "", 300, 0, "" }
		};
	};

	class f_station_store {
        name = "Tankstellenshop";
        side = "civ";
        conditions = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "ItemWatch", "", 100, 0, "" },
            { "ItemCompass", "", 150, 0, "" },
            { "ItemGPS", "", 300, 0, "" },
            { "ItemRadio", "", 300, 0, "" },
            { "ItemMap", "", 100, 0, "" },
            { "ItemWatch", "", 100, 0, "" },
            { "NVGoggles", "", 25000, 0, "" },
            { "Binocular", "", 10000, 0, "" },
            { "ToolKit", "", 7500, 0, "" }
		   };
    };
};
