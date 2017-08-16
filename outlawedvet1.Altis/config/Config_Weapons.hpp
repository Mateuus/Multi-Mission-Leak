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
            { "hgun_Rook40_F", "", 6500, -1 },
            { "hgun_Pistol_heavy_02_F", "", 9850, -1 },
            { "hgun_ACPC2_F", "", 11500, -1 },
            { "hgun_PDW2000_F", "", 20000, -1 }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 25 },
            { "6Rnd_45ACP_Cylinder", "", 50 },
            { "9Rnd_45ACP_Mag", "", 45 },
            { "30Rnd_9x21_Mag", "", 75 }
        };
        accs[] = {
            { "optic_ACO_grn_smg", "", 2500 }
        };
    };
	
	
	class swat_ammo {
        name = "Swat Ammo";
        side = "cop";
        license = "";
        level[] = { "life_swatlevel", "SCALAR", 0, "You are not in Swat!" };
        items[] = {
            { "30Rnd_9x21_Mag", "", 300 },
            { "11Rnd_45ACP_Mag", "", 500 },
            { "30Rnd_45ACP_Mag_SMG_01", "", 500 },
            { "30Rnd_9x21_Mag_SMG_02", "", 500 },
            { "30Rnd_556x45_Stanag_Tracer_Red", "", 600 },
            { "150Rnd_556x45_Drum_Mag_Tracer_F", "", 1500 },
            { "20Rnd_762x51_Mag", "", 1250 },
			{ "20Rnd_762x51_Mag", "", 1000 },
			{ "200Rnd_65x39_cased_Box", "", 1500 },
			{ "150Rnd_762x51_Box", "", 1500 },
			{ "optic_Arco", "", 4500 },  
			{ "HandGrenade_Stone", "Flashbang", 1500, 0 },
            { "SmokeShellBlue", "TearGas", 50000, 0 }
        };
        mags[] = {
        };
        accs[] = {
        };
    };
	
	class army_weaponary {
        name = "Army Weaponary Shop";
        side = "cop";
        license = "";
        level[] = { "life_armylevel", "SCALAR", 0, "You are not in Army!" };
        items[] = {
			{ "srifle_LRR_camo_F", "", 125000, 0 },
			{ "LMG_Zafir_pointer_F", "", 90000, 0 },
			{ "arifle_MX_GL_F", "", 80000, 0 },
			{ "srifle_DMR_06_camo_F", "", 90000, 0 },
			{ "launch_RPG32_F", "", 150000, 0 },
			{ "hgun_Pistol_heavy_01_F", "", 30000, 0 },
			{ "HandGrenade_Stone", "Flashbang", 1500, 0 },
			{ "MiniGrenade", "", 30000, 0 },
			{ "optic_tws", "", 125000, 0 },
			{ "optic_NVS", "", 75000, 0 }
        };
        mags[] = {
			{ "30Rnd_65x39_caseless_mag", "", 500, 0 },
			{ "30Rnd_9x21_Mag", "", 250, 0 },
            { "20Rnd_762x51_Mag", "", 700, 0 },
			{ "150Rnd_762x54_Box", "", 1000, 0 },
			{ "10Rnd_127x54_Mag", "", 1000, 0 },
			{ "7Rnd_408_Mag", "", 1200, 0 },
			{ "RPG32_F", "", 10000, 0 },
			{ "11Rnd_45ACP_Mag", "", 250, 0 },
			{ "1Rnd_HE_Grenade_shell", "", 40000, 0 }
        };
        accs[] = {
			{ "optic_tws", "", 125000, 0 },
			{ "optic_NVS", "Flashbang", 75000, 0 },
            { "optic_ACO_grn", "", 5000, 0 },
            { "optic_Aco", "", 5000, 0 },
            { "optic_Aco_smg", "", 2500, 0 },
            { "optic_ACO_grn_smg", "", 2500, 0 },
            { "optic_Holosight", "", 5000, 0 },
            { "optic_SOS", "", 5000, 0 },
            { "optic_Hamr", "", 7000, 0 },
            { "optic_Arco", "", 8000, 0 },
            { "optic_MRCO", "", 8000, 0 },
            { "optic_AMS_khk", "", 9000, 0 },
            { "optic_KHS_hex", "", 9000, 0 },
            { "optic_Yorris", "", 7500, 0 },              
            { "optic_MRD", "", 7500, 0 },
            { "acc_flashlight", "", 2500, 0 },
            { "acc_pointer_IR", "", 2500, 0 },
            { "bipod_02_F_hex", "", 10000, 0 },
            { "bipod_02_F_tan", "", 10000, 0 }
        };
    };
	
	class rebel_equipment {
        name = "Rebel Equipment Shop";
        side = "civ";
        license = "rebel";
        level[] = { "", "", -1, "" };
        items[] = {
			{ "muzzle_snds_L", "", 4000, 0 },
            { "muzzle_snds_acp", "", 4000, 0 },
            { "muzzle_snds_M", "", 5000, 0 },
            { "muzzle_snds_H", "", 5000, 0 },
            { "muzzle_snds_H_MG", "", 7000, 0 },
            { "muzzle_snds_93mmg", "", 7000, 0 },
            { "muzzle_snds_93mmg_tan", "", 7000, 0 },
            { "muzzle_snds_B", "", 7000, 0 },
            { "optic_ACO_grn", "", 5000, 0 },
            { "optic_Aco", "", 5000, 0 },
            { "optic_Aco_smg", "", 2500, 0 },
            { "optic_ACO_grn_smg", "", 2500, 0 },
            { "optic_Holosight", "", 5000, 0 },
            { "optic_SOS", "", 5000, 0 },
            { "optic_Hamr", "", 7000, 0 },
            { "optic_Arco", "", 8000, 0 },
            { "optic_MRCO", "", 8000, 0 },
			{ "optic_ERCO_blk_F", "", 15000, 0 },
            { "optic_AMS_khk", "", 9000, 0 },
            { "optic_KHS_hex", "", 9000, 0 },
            { "optic_Yorris", "", 7500, 0 },              
            { "optic_MRD", "", 7500, 0 },
            { "acc_flashlight", "", 2500, 0 },
            { "acc_pointer_IR", "", 2500, 0 },
            { "bipod_02_F_hex", "", 10000, 0 },
            { "bipod_02_F_tan", "", 10000, 0 },
            { "ToolKit", "", 5000, 0 },
            { "FirstAidKit", "", 3000, 0 },
            { "NVGoggles_OPFOR", "", 5000, 0 },
			{ "NVGoggles_tna_F", "", 5000, 0 },
			{ "NVGoggles_INDEP", "", 5000, 0 },
			{ "NVGoggles", "", 5000, 0 },
			{ "O_NVGoggles_ghex_F", "", 5000, 0 },
			{ "O_NVGoggles_hex_F", "", 5000, 0 },
			{ "O_NVGoggles_urb_F", "", 5000, 0 },
            { "ItemMap", "", 50, 0 },
			{ "ItemGPS", "", 3000, 0 },
			{ "Binocular", "", 4000, 0 },
            { "Rangefinder", "", 5000, 0 }
        };
    };

    class rebel_weapons {
        name = "Alberto Weaponary Shop";
        side = "civ";
        license = "rebel";
        level[] = { "", "", -1, "" };
        items[] = {
			{ "hgun_PDW2000_F", "", 30000, -1 },
			{ "SMG_05_F", "", 35000, -1 },
			{ "SMG_01_F", "", 37000, -1 },
			{ "SMG_02_F", "", 37000, -1 },
            { "arifle_TRG20_F", "", 40000, -1 },
			{ "arifle_TRG21_F", "", 45000, -1 },
			{ "arifle_Mk20_F", "", 45000, -1 },
			{ "arifle_Mk20C_F", "", 45000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 50000, -1 },
			{ "arifle_SPAR_01_khk_F", "", 50000, -1 },
			{ "arifle_SPAR_01_snd_F", "", 50000, -1 },
			{ "arifle_SPAR_02_blk_F", "", 80000, -1 },
			{ "arifle_SPAR_02_khk_F", "", 80000, -1 },
			{ "arifle_CTAR_blk_F", "", 50000, -1 },
			{ "arifle_MXC_khk_F", "", 55000, -1 },
			{ "arifle_MXC_F", "", 55000, -1 },
			{ "arifle_MX_khk_F", "", 60000, -1 },
			{ "arifle_MX_F", "", 60000, -1 },
			{ "arifle_MXM_khk_F", "", 65000, -1 },
			{ "arifle_MXM_F", "", 65000, -1 },
			{ "arifle_MX_SW_khk_F", "", 80000, -1 },
			{ "arifle_MX_SW_pointer_F", "", 80000, -1 },
			{ "LMG_Mk200_F", "", 130000, -1 },
			{ "arifle_CTAR_hex_F", "", 60000, -1 },
			{ "arifle_Katiba_F", "", 60000, -1 },
			{ "arifle_Katiba_C_F", "", 60000, -1 },
			{ "arifle_AKS_F", "", 55000, -1 },
			{ "arifle_AKM_F", "", 85000, -1 },
			{ "srifle_EBR_F", "", 100000, -1 },
			{ "srifle_DMR_01_F", "", 80000, -1 },
			{ "srifle_DMR_06_camo_F", "", 120000, -1 },
			{ "srifle_DMR_07_ghex_F", "", 120000, -1 },
			{ "arifle_SPAR_03_blk_F", "", 120000, -1 },
			{ "arifle_SPAR_03_khk_F", "", 120000, -1 },
			{ "arifle_CTARS_hex_F", "", 85000, -1 },
			{ "arifle_SDAR_F", "", 25000, -1 },
			{ "hgun_Pistol_heavy_02_F", "", 30000, -1 },
			{ "hgun_ACPC2_F", "", 25000, -1 },
			{ "hgun_Rook40_F", "", 15000, -1 },
			{ "hgun_P07_F", "", 15000, -1 },
			{ "hgun_P07_khk_F", "", 15000, -1 },
			{ "Binocular", "", 2000, -1 },
            { "ItemGPS", "", 5000, -1 },
            { "FirstAidKit", "", 3000, -1 },
            { "NVGoggles", "", 2500, -1 }
        };
        mags[] = {
			{ "30Rnd_45ACP_Mag_SMG_01", "", 300 },
			{ "6Rnd_45ACP_Cylinder", "", 600 },
			{ "9Rnd_45ACP_Mag", "", 300 },
			{ "30Rnd_9x21_Mag", "", 500 },
			{ "20Rnd_556x45_UW_mag", "", 500 },
            { "30Rnd_556x45_Stanag", "", 500 },
			{ "30Rnd_9x21_Mag_SMG_02", "", 500 },
			{ "30Rnd_580x42_Mag_F", "", 600 },
			{ "30Rnd_545x39_Mag_F", "", 700 },
            { "30Rnd_65x39_caseless_green", "", 850 },
			{ "30Rnd_65x39_caseless_green_mag_Tracer", "", 850 },
			{ "30Rnd_65x39_caseless_mag", "", 850 },
			{ "20Rnd_650x39_Cased_Mag_F", "", 900 },
			{ "10Rnd_762x54_Mag", "", 900 },
		    { "30Rnd_762x39_Mag_F", "", 1000 },
			{ "20Rnd_762x51_Mag", "", 1000 },
			{ "150Rnd_556x45_Drum_Mag_F", "", 1000 },
			{ "100Rnd_65x39_caseless_mag_Tracer", "", 1250 },
			{ "200Rnd_65x39_cased_Box", "", 1500 },
			{ "100Rnd_580x42_Mag_F", "", 1250 }
        };
        accs[] = {
			{ "muzzle_snds_L", "", 4000, 0 },
            { "muzzle_snds_acp", "", 4000, 0 },
            { "muzzle_snds_M", "", 5000, 0 },
            { "muzzle_snds_H", "", 5000, 0 },
            { "muzzle_snds_H_MG", "", 7000, 0 },
            { "muzzle_snds_93mmg", "", 7000, 0 },
            { "muzzle_snds_93mmg_tan", "", 7000, 0 },
            { "muzzle_snds_B", "", 7000, 0 },
            { "optic_ACO_grn", "", 5000, 0 },
            { "optic_Aco", "", 5000, 0 },
            { "optic_Aco_smg", "", 2500, 0 },
            { "optic_ACO_grn_smg", "", 2500, 0 },
            { "optic_Holosight", "", 5000, 0 },
            { "optic_SOS", "", 5000, 0 },
            { "optic_Hamr", "", 7000, 0 },
            { "optic_Arco", "", 8000, 0 },
            { "optic_MRCO", "", 8000, 0 },
			{ "optic_ERCO_blk_F", "", 15000, 0 },
            { "optic_AMS_khk", "", 9000, 0 },
            { "optic_KHS_hex", "", 9000, 0 },
            { "optic_Yorris", "", 7500, 0 },              
            { "optic_MRD", "", 7500, 0 },
            { "acc_flashlight", "", 2500, 0 },
            { "acc_pointer_IR", "", 2500, 0 },
            { "bipod_02_F_hex", "", 10000, 0 },
            { "bipod_02_F_tan", "", 10000, 0 },
            { "ToolKit", "", 5000, 0 },
            { "FirstAidKit", "", 3000, 0 },
            { "NVGoggles_OPFOR", "", 5000, 0 },
            { "ItemMap", "", 50, 0 },
            { "Rangefinder", "", 5000, 0 }
        };
    };
	
	//Explosive
	class explosive {
        name = "Special Explosives Shop";
        side = "civ";
        license = "explosive";
        level[] = { "", "", -1, "" };
        items[] = {	
			{ "B_IR_Grenade", "IR Grenade", 5000, 0 },
            { "MiniGrenade", "Mini Grenade", 20000, 0 },
            { "HandGrenade", "Hand Grenade", 30000, 0 },
            { "RPG32_F", "", 7500, 0 },
            { "5Rnd_127x108_APDS_Mag", "AP Rounds", 25000, 0 },
            { "APERSBoundingMine_Range_Mag", "Anti personal mine", 100000, 0 },
            { "IEDUrbanBig_Remote_Mag", "Large IED", 150000, 0 },
            { "IEDLandBig_Remote_Mag", "Large IED Dug in", 150000, 0 },
            { "IEDUrbanSmall_Remote_Mag", "Small IED", 100000, 0 },
            { "IEDLandSmall_Remote_Mag", "Small IED Dug in", 100000, 0 },
            { "SmokeShellYellow", "", 5000, 0 },
            { "SmokeShellGreen", "", 5000, 0 },
            { "SmokeShellRed", "", 5000, 0 },
            { "SmokeShellPurple", "", 5000, 0 },
            { "SmokeShellOrange", "", 5000, 0 },
            { "SmokeShellBlue", "TearGas", 150000, 0 }
        };
    };
	
    class gang {
        name = "Hideout Armament";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
			{ "V_PlateCarrierIAGL_oli", "" , 25000, 0 },
			{ "V_PlateCarrierGL_mtp", "" , 25000, 0 },
			{ "V_PlateCarrierGL_blk", "" , 25000, 0 },
			{ "U_O_CombatUniform_ocamo", "" , 9000, 0 },
			{ "U_O_T_Soldier_F", "" , 9000, 0 },
            { "U_O_SpecopsUniform_ocamo", "" , 9000, 0 },
            { "U_B_SpecopsUniform_sgg", "" , 9000, 0 },
            { "U_O_CombatUniform_oucamo", "" , 9000, 0 },
			{ "U_I_GhillieSuit", "" , 17500, 0 },
			{ "U_O_GhillieSuit", "" , 17500, 0 },
			{ "U_B_GhillieSuit", "" , 17500, 0 },
			{ "H_CrewHelmetHeli_O", "" , 2500, 0 },
            { "H_CrewHelmetHeli_B", "" , 2500, 0 },
            { "H_CrewHelmetHeli_I", "" , 2500, 0 },
            { "H_Watchcap_camo", "" , 2500, 0 },
            { "H_HelmetSpecB_paint1", "" , 10000, 0 },
			{ "H_HelmetSpecB_snakeskin", "" , 10000, 0 },
			{ "H_HelmetSpecB_sand", "" , 10000, 0 },
            { "B_Carryall_khk", "" , 7000, 0 },
            { "B_Carryall_mcamo", "" , 9000, 0 },
            { "B_Carryall_oucamo", "" , 9000, 0 }, 
			{ "B_Bergen_dgtl_F", "" , 25000, 0 },
			{ "B_Bergen_hex_F", "" , 25000, 0 }, 
			{ "B_Bergen_mcamo_F", "" , 25000, 0 }, 			
            { "G_Balaclava_TI_G_blk_F", "" , 3500, 0 },
			{ "G_Balaclava_combat", "" , 3500, 0 },
            { "G_Bandanna_beast", "" , 3500, 0 },
            { "hgun_Pistol_heavy_01_F", "" , 40000, 0 },
            { "11Rnd_45ACP_Mag", "" , 1000, 0 },
            { "launch_RPG32_F", "" , 180000, 0 },		
            { "RPG32_F", "" , 25000, 0 },
			{ "launch_RPG7_F", "", 150000, -1 },
			{ "RPG7_F", "", 20000 },
			{ "arifle_AK12_F", "", 80000, -1 },
			{ "LMG_03_F", "", 90000, -1 },
            { "srifle_DMR_03_multicam_F", "" , 100000, 0 },
            { "srifle_LRR_camo_F", "" , 175000, 0 },
            { "srifle_DMR_02_camo_F", "" , 150000, 0 },
            { "srifle_GM6_camo_F", "" , 300000, 0 },
            { "srifle_DMR_04_Tan_F", "" , 120000, 0 },
			{ "srifle_DMR_05_DMS_F", "" , 125000, 0 },
            { "LMG_Zafir_pointer_F", "" , 100000, 0 },
            { "MMG_02_camo_F", "" , 200000, 0 },
            { "optic_SOS", "" , 5000, 0 },
            { "optic_Hamr", "" , 7000, 0 },
            { "optic_LRPS", "" , 5000, 0 },                   
            { "optic_DMS", "" , 5000, 0 },                                        
            { "optic_SOS", "" , 5000, 0 },
            { "optic_KHS_tan", "" , 9000, 0 },
            { "optic_AMS_snd", "" , 9000, 0 },
			{ "optic_ERCO_blk_F", "", 15000, 0 },
            { "optic_NVS", "" , 150000, 0 },
			{ "optic_Nightstalker", "" , 275000, 0 },
            { "optic_tws", "" , 300000, 0 },
            { "FirstAidKit", "", 3000, 0 },
            { "NVGoggles_OPFOR", "", 5000, 0 },
			{ "NVGoggles_tna_F", "", 5000, 0 },
			{ "NVGoggles_INDEP", "", 5000, 0 },
			{ "NVGoggles", "", 5000, 0 },
			{ "O_NVGoggles_ghex_F", "", 5000, 0 },
			{ "O_NVGoggles_hex_F", "", 5000, 0 },
			{ "O_NVGoggles_urb_F", "", 5000, 0 },
            { "SatchelCharge_Remote_Mag", "" , 125000, 0 }
        };
			mags[] = {
			{ "30Rnd_762x39_Mag_F", "", 1000 },
			{ "200Rnd_556x45_Box_F", "", 1500 },
			{ "20Rnd_762x51_Mag", "" , 800 },
			{ "7Rnd_408_Mag", "" , 2000},
			{ "10Rnd_338_Mag", "" , 3500 },
			{ "5Rnd_127x108_Mag", "" , 5000 },
			{ "10Rnd_127x54_Mag", "" , 3000 },
			{ "150Rnd_762x54_Box", "" , 2000 },
			{ "150Rnd_762x54_Box_Tracer", "" , 2000 },
			{ "130Rnd_338_Mag", "" , 2200 },
			{ "10Rnd_93x64_DMR_05_Mag", "" , 1000 },
			{ "RPG7_F", "", 25000 }
		};   
		accs[] = {
			{ "optic_ACO_grn", "", 5000 },
            { "optic_Holosight_khk_F", "", 5000 },
            { "optic_Hamr_khk_F", "", 7500 },
			{ "optic_Arco_ghex_F", "", 7500 },
			{ "optic_ERCO_khk_F", "", 7500 },
			{ "muzzle_snds_B_khk_F", "", 6000 },
			{ "muzzle_snds_H_MG_khk_F", "", 6000 },
			{ "muzzle_snds_L", "", 6000 },
 			{ "bipod_01_F_khk", "", 5000 },
			{ "acc_pointer_IR", "", 5000 },
            { "acc_flashlight", "", 5000 }
        };
    };
	
	class PMC_weapons {
        name = "BlackWater PMC Weapon Shop";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = {
			{ "arifle_AK12_GL_F", "", 90000, -1 },
			{ "1Rnd_HE_Grenade_shell", "", 25000 },
			{ "srifle_DMR_05_hex_F", "", 130000, -1 },
			{ "srifle_LRR_tna_F", "", 175000, -1 },
			{ "srifle_GM6_ghex_F", "", 250000, -1 },
			{ "MMG_01_hex_F", "", 180000, -1 },
			{ "launch_NLAW_F", "", 600000, -1 }
        };
        mags[] = {
        { "30Rnd_762x39_Mag_F", "", 1000 },
		{ "1Rnd_HE_Grenade_shell", "", 25000 },
		{ "7Rnd_408_Mag", "", 2500 },
		{ "5Rnd_127x108_Mag", "", 3000 },
		{ "10Rnd_93x64_DMR_05_Mag", "", 2000 },
		{ "150Rnd_93x64_Mag", "", 2000 },
		{ "NLAW_F", "", 40000 }
        };
        accs[] = {
			{ "optic_ACO_grn", "", 5000 },
            { "optic_Holosight_khk_F", "", 5000 },
            { "optic_Hamr_khk_F", "", 7500 },
			{ "optic_Arco_ghex_F", "", 7500 },
			{ "optic_ERCO_khk_F", "", 7500 },
			{ "optic_tws", "", 250000 },
			{ "muzzle_snds_B_khk_F", "", 6000 },
			{ "muzzle_snds_H_MG_khk_F", "", 6000 },
			{ "muzzle_snds_L", "", 6000 },
			{ "muzzle_snds_93mmg_tan", "", 6000 },
 			{ "bipod_01_F_khk", "", 5000 },
			{ "acc_pointer_IR", "", 5000 },
            { "acc_flashlight", "", 5000 }
        };
    };
	
	class blackm {
        name = "Black Market Armament";
        side = "civ";
        license = "blackmarket";
        level[] = { "", "", -1, "" };
        items[] = {
			{ "SMG_05_F", "", 35000, -1 },
			{ "arifle_SPAR_01_khk_F", "", 55000, -1 },
			{ "arifle_SPAR_01_GL_khk_F", "", 60000, -1 },
			{ "arifle_SPAR_02_khk_F", "", 90000, -1 },
			{ "arifle_SPAR_03_khk_F", "", 110000, -1 },
			{ "srifle_DMR_03_woodland_F", "", 110000, -1 },
			{ "srifle_DMR_05_hex_F", "", 120000, -1 },
			{ "arifle_MX_GL_F", "", 150000, -1 },
            { "MMG_01_hex_F", "", 180000, -1 }
        };
        mags[] = {
			{ "30Rnd_9x21_Mag_SMG_02", "", 500 },
            { "30Rnd_556x45_Stanag", "", 1000 },
			{ "150Rnd_556x45_Drum_Mag_F", "", 1500 },
			{ "20Rnd_762x51_Mag", "", 1100 },
			{ "3Rnd_HE_Grenade_shell", "", 100000 },
			{ "30Rnd_65x39_caseless_mag", "", 500 },
			{ "150Rnd_93x64_Mag", "", 2500 },
			{ "10Rnd_93x64_DMR_05_Mag", "", 1200 }
        };
        accs[] = {
			{ "optic_ACO_grn", "", 5000 },
            { "optic_Holosight_khk_F", "", 5000 },
            { "optic_Hamr_khk_F", "", 7500 },
			{ "optic_Arco_ghex_F", "", 7500 },
			{ "optic_ERCO_khk_F", "", 7500 },
			{ "muzzle_snds_L", "", 6000 },
			{ "muzzle_snds_H_khk_F", "", 6000 },
			{ "muzzle_snds_58_wdm_F", "", 6000 },
			{ "muzzle_snds_L", "", 6000 },
 			{ "bipod_01_F_khk", "", 5000 },
			{ "acc_pointer_IR", "", 5000 },
            { "acc_flashlight", "", 5000 }
        };
    };
	
	class blackm_ammo {
        name = "Black Market Ammo";
        side = "civ";
        license = "blackmarket";
        level[] = { "", "", -1, "" };
        items[] = {
			{ "1Rnd_HE_Grenade_shell", "" ,20000, 0 },
            { "1Rnd_SmokeRed_Grenade_shell", "" ,5000, 0 },
            { "10Rnd_93x64_DMR_05_Mag", "" ,1000, 0 },
            { "10Rnd_338_Mag", "" ,900, 0 },
            { "10Rnd_127x54_Mag", "" ,1000, 0 },
            { "150Rnd_93x64_Mag", "" ,2000, 0 },
            { "10Rnd_338_Mag", "" ,3500, 0 },
            { "1Rnd_HE_Grenade_shell", "" ,20000, 0 },
            { "1Rnd_SmokeRed_Grenade_shell", "" ,5000, 0 },
            { "5Rnd_127x108_Mag", "" ,5000, 0 }, 
            { "5Rnd_127x108_APDS_Mag", "AP Rounds" ,25000, 0 },
            { "RPG32_F", "" ,11000, 0 },
            { "NLAW_F", "" ,25000, 0 },
            { "MiniGrenade", "" ,20000, 0 },
            { "SatchelCharge_Remote_Mag", "" ,200000, 0 },
            { "APERSMine_Range_Mag", "Anti personal mine" ,150000, 0 },
            { "APERSTripMine_Wire_Mag", "Trip mine" ,150000, 0 }
        };
    };
	
	class assassin {
        name = "Assassins Store";
        side = "civ";
        license = "assassin";
        level[] = { "", "", -1, "" };
        items[] = {
            { "arifle_ARX_blk_F", "", 980000, -1 },
            { "arifle_Katiba_GL_F", "", 550000, -1 },
            { "hgun_ACPC2_F", "", 11500, -1 },
            { "hgun_PDW2000_F", "", 20000, -1 }
        };
        mags[] = {
            { "30Rnd_65x39_caseless_green", "", 2500 },
            { "10Rnd_50BW_Mag_F", "", 275000 },
            { "9Rnd_45ACP_Mag", "", 450 },
            { "30Rnd_9x21_Mag", "", 750 }
        };
        accs[] = {
            { "optic_ACO_grn_smg", "", 2500 },
			{ "muzzle_snds_65_TI_blk_F", "", 165000 },
			{ "10Rnd_50BW_Mag_F", "", 275000 },
			{ "optic_tws_mg", "", 300000 },
			{ "optic_Holosight_blk_F", "", 5000 },
			{ "optic_Holosight_smg_blk_F", "", 5000 }
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
            { "Chemlight_red", "", 1500, -1 },
            { "Chemlight_yellow", "", 1500, 50 },
            { "Chemlight_green", "", 1500, 50 },
            { "Chemlight_blue", "", 1500, 50 }
        };
        mags[] = {};
        accs[] = {};
    };

    //Cop Shops

	class cop_public_weapon {
        name = "Altis Patrol Officer Shop";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "EQUAL", 0, "" };
        items[] = {
            { "hgun_PDW2000_F", "Taser", 25000, -1 },
            { "SMG_02_F", "", 27500, -1 },
            { "SMG_05_F", "", 27500, -1 },
            { "SMG_01_F", "", 30000, -1 },
            { "arifle_Mk20_plain_F", "", 35000, -1 },
			{ "FirstAidKit", "", 3000, -1 }
        };
        mags[] = {
			{ "30Rnd_9x21_Mag", "", 250},
            { "30Rnd_9x21_Mag_SMG_02", "", 250 },
			{ "30Rnd_45ACP_Mag_SMG_01", "", 300},
			{ "30Rnd_556x45_Stanag", "", 400}
        };
        accs[] = {
			{ "muzzle_snds_L", "", 4000, 0 },
            { "muzzle_snds_acp", "", 4000, 0 },
            { "muzzle_snds_M", "", 5000, 0 },
            { "muzzle_snds_H", "", 5000, 0 },
            { "muzzle_snds_H_MG", "", 7000, 0 },
            { "muzzle_snds_93mmg", "", 7000, 0 },
            { "muzzle_snds_93mmg_tan", "", 7000, 0 },
            { "muzzle_snds_B", "", 7000, 0 },
            { "optic_ACO_grn", "", 5000, 0 },
            { "optic_Aco", "", 5000, 0 },
            { "optic_Aco_smg", "", 2500, 0 },
            { "optic_ACO_grn_smg", "", 2500, 0 },
            { "optic_Holosight", "", 5000, 0 },
            { "optic_SOS", "", 5000, 0 },
            { "optic_Hamr", "", 7000, 0 },
            { "optic_Arco", "", 8000, 0 },
            { "optic_MRCO", "", 8000, 0 },
            { "optic_AMS_khk", "", 9000, 0 },
            { "optic_KHS_hex", "", 9000, 0 },
            { "optic_Yorris", "", 7500, 0 },              
            { "optic_MRD", "", 7500, 0 },
            { "acc_flashlight", "", 2500, 0 },
            { "acc_pointer_IR", "", 2500, 0 },
            { "bipod_02_F_hex", "", 10000, 0 },
            { "bipod_02_F_tan", "", 10000, 0 },
            { "ToolKit", "", 5000, 0 },
            { "FirstAidKit", "", 3000, 0 },
            { "NVGoggles_OPFOR", "", 5000, 0 },
            { "ItemMap", "", 50, 0 },
            { "Rangefinder", "", 5000, 0 }
        };
    };
	
	class cop_recruit_weapon {
        name = "Recruit Weapons";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "EQUAL", 1, "You must be a Whitelisted Police officer!" };
        items[] = {
            { "hgun_PDW2000_F", "Taser", 25000, -1 },
            { "SMG_02_F", "", 27500, -1 },
            { "SMG_05_F", "", 27500, -1 },
            { "SMG_01_F", "", 30000, -1 },
            { "arifle_Mk20_plain_F", "", 35000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 40000, -1 },
			{ "FirstAidKit", "", 3000, -1 }
        };
        mags[] = {
			{ "30Rnd_9x21_Mag", "", 250},
            { "30Rnd_9x21_Mag_SMG_02", "", 250 },
			{ "30Rnd_45ACP_Mag_SMG_01", "", 300},
			{ "30Rnd_556x45_Stanag", "", 400}
        };
        accs[] = {
			{ "muzzle_snds_L", "", 4000, 0 },
            { "muzzle_snds_acp", "", 4000, 0 },
            { "muzzle_snds_M", "", 5000, 0 },
            { "muzzle_snds_H", "", 5000, 0 },
            { "muzzle_snds_H_MG", "", 7000, 0 },
            { "muzzle_snds_93mmg", "", 7000, 0 },
            { "muzzle_snds_93mmg_tan", "", 7000, 0 },
            { "muzzle_snds_B", "", 7000, 0 },
            { "optic_ACO_grn", "", 5000, 0 },
            { "optic_Aco", "", 5000, 0 },
            { "optic_Aco_smg", "", 2500, 0 },
            { "optic_ACO_grn_smg", "", 2500, 0 },
            { "optic_Holosight", "", 5000, 0 },
            { "optic_SOS", "", 5000, 0 },
            { "optic_Hamr", "", 7000, 0 },
            { "optic_Arco", "", 8000, 0 },
            { "optic_MRCO", "", 8000, 0 },
            { "optic_AMS_khk", "", 9000, 0 },
            { "optic_KHS_hex", "", 9000, 0 },
            { "optic_Yorris", "", 7500, 0 },              
            { "optic_MRD", "", 7500, 0 },
            { "acc_flashlight", "", 2500, 0 },
            { "acc_pointer_IR", "", 2500, 0 },
            { "bipod_02_F_hex", "", 10000, 0 },
            { "bipod_02_F_tan", "", 10000, 0 },
            { "ToolKit", "", 5000, 0 },
            { "FirstAidKit", "", 3000, 0 },
            { "NVGoggles_OPFOR", "", 5000, 0 },
            { "ItemMap", "", 50, 0 },
            { "Rangefinder", "", 5000, 0 }
        };
    };
	
	
	class cop_patrol_weapon {
        name = "Patrol Officer Weapons";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "EQUAL", 2, "You must be a Patrol Officer Rank!" };
        items[] = {
            { "hgun_PDW2000_F", "Taser", 25000, -1 },
            { "SMG_02_F", "", 27500, -1 },
            { "SMG_05_F", "", 27500, -1 },
            { "SMG_01_F", "", 30000, -1 },
            { "arifle_Mk20_plain_F", "", 35000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 40000, -1 },
			{ "arifle_MXC_Black_F", "", 35000, -1 },
			{ "FirstAidKit", "", 3000, -1 }
        };
        mags[] = {
			{ "30Rnd_9x21_Mag", "", 250},
            { "30Rnd_9x21_Mag_SMG_02", "", 250 },
			{ "30Rnd_45ACP_Mag_SMG_01", "", 300},
			{ "30Rnd_556x45_Stanag", "", 400},
			{ "30Rnd_65x39_caseless_mag", "", 500}
        };
        accs[] = {
			{ "muzzle_snds_L", "", 4000, 0 },
            { "muzzle_snds_acp", "", 4000, 0 },
            { "muzzle_snds_M", "", 5000, 0 },
            { "muzzle_snds_H", "", 5000, 0 },
            { "muzzle_snds_H_MG", "", 7000, 0 },
            { "muzzle_snds_93mmg", "", 7000, 0 },
            { "muzzle_snds_93mmg_tan", "", 7000, 0 },
            { "muzzle_snds_B", "", 7000, 0 },
            { "optic_ACO_grn", "", 5000, 0 },
            { "optic_Aco", "", 5000, 0 },
            { "optic_Aco_smg", "", 2500, 0 },
            { "optic_ACO_grn_smg", "", 2500, 0 },
            { "optic_Holosight", "", 5000, 0 },
            { "optic_SOS", "", 5000, 0 },
            { "optic_Hamr", "", 7000, 0 },
            { "optic_Arco", "", 8000, 0 },
            { "optic_MRCO", "", 8000, 0 },
            { "optic_AMS_khk", "", 9000, 0 },
            { "optic_KHS_hex", "", 9000, 0 },
            { "optic_Yorris", "", 7500, 0 },              
            { "optic_MRD", "", 7500, 0 },
            { "acc_flashlight", "", 2500, 0 },
            { "acc_pointer_IR", "", 2500, 0 },
            { "bipod_02_F_hex", "", 10000, 0 },
            { "bipod_02_F_tan", "", 10000, 0 },
            { "ToolKit", "", 5000, 0 },
            { "FirstAidKit", "", 3000, 0 },
            { "NVGoggles_OPFOR", "", 5000, 0 },
            { "ItemMap", "", 50, 0 },
            { "Rangefinder", "", 5000, 0 }
        };
    };
	
	class cop_sergeant_weapon {
        name = "Sergeant Weapons";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "EQUAL", 3, ""  };
        items[] = {
            { "hgun_PDW2000_F", "Taser", 25000, -1 },
            { "SMG_02_F", "", 27500, -1 },
            { "SMG_05_F", "", 27500, -1 },
            { "SMG_01_F", "", 30000, -1 },
            { "arifle_Mk20_plain_F", "", 35000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 40000, -1 },
			{ "arifle_MXC_Black_F", "", 35000, -1 },
			{ "arifle_MX_Black_F", "", 40000, -1 },
			{ "arifle_MXM_Black_F", "", 45000, -1 },
			{ "arifle_SPAR_02_blk_F", "", 100000, -1 },
			{ "FirstAidKit", "", 3000, -1 }
        };
        mags[] = {
			{ "30Rnd_9x21_Mag", "", 250},
            { "30Rnd_9x21_Mag_SMG_02", "", 250 },
			{ "30Rnd_45ACP_Mag_SMG_01", "", 300},
			{ "30Rnd_556x45_Stanag", "", 400},
			{ "30Rnd_65x39_caseless_mag", "", 500},
			{ "150Rnd_556x45_Drum_Mag_F", "", 1500},
			{ "200Rnd_556x45_Box_F", "", 2000}
        };
        accs[] = {
			{ "muzzle_snds_L", "", 4000, 0 },
            { "muzzle_snds_acp", "", 4000, 0 },
            { "muzzle_snds_M", "", 5000, 0 },
            { "muzzle_snds_H", "", 5000, 0 },
            { "muzzle_snds_H_MG", "", 7000, 0 },
            { "muzzle_snds_93mmg", "", 7000, 0 },
            { "muzzle_snds_93mmg_tan", "", 7000, 0 },
            { "muzzle_snds_B", "", 7000, 0 },
            { "optic_ACO_grn", "", 5000, 0 },
            { "optic_Aco", "", 5000, 0 },
            { "optic_Aco_smg", "", 2500, 0 },
            { "optic_ACO_grn_smg", "", 2500, 0 },
            { "optic_Holosight", "", 5000, 0 },
            { "optic_SOS", "", 5000, 0 },
            { "optic_Hamr", "", 7000, 0 },
            { "optic_Arco", "", 8000, 0 },
            { "optic_MRCO", "", 8000, 0 },
            { "optic_AMS_khk", "", 9000, 0 },
            { "optic_KHS_hex", "", 9000, 0 },
            { "optic_Yorris", "", 7500, 0 },              
            { "optic_MRD", "", 7500, 0 },
            { "acc_flashlight", "", 2500, 0 },
            { "acc_pointer_IR", "", 2500, 0 },
            { "bipod_02_F_hex", "", 10000, 0 },
            { "bipod_02_F_tan", "", 10000, 0 },
            { "ToolKit", "", 5000, 0 },
            { "FirstAidKit", "", 3000, 0 },
            { "NVGoggles_OPFOR", "", 5000, 0 },
            { "ItemMap", "", 50, 0 },
            { "Rangefinder", "", 5000, 0 }
        };
    };
	
	class cop_lieutenant_weapon {
        name = "Lieutenant Weapons";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "EQUAL", 4, ""  };
        items[] = {
            { "hgun_PDW2000_F", "Taser", 25000, -1 },
            { "SMG_02_F", "", 27500, -1 },
            { "SMG_05_F", "", 27500, -1 },
            { "SMG_01_F", "", 30000, -1 },
            { "arifle_Mk20_plain_F", "", 35000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 40000, -1 },
			{ "arifle_MXC_Black_F", "", 35000, -1 },
			{ "arifle_MX_Black_F", "", 40000, -1 },
			{ "arifle_MXM_Black_F", "", 45000, -1 },
			{ "arifle_MX_SW_Black_F", "", 50000, -1 },
			{ "arifle_SPAR_02_blk_F", "", 50000, -1 },
			{ "LMG_03_F", "", 75000, -1 },
			{ "LMG_Mk200_F", "", 90000, -1 },
			{ "FirstAidKit", "", 3000, -1 }
        };
        mags[] = {
			{ "30Rnd_9x21_Mag", "", 250},
            { "30Rnd_9x21_Mag_SMG_02", "", 250 },
			{ "30Rnd_45ACP_Mag_SMG_01", "", 300},
			{ "30Rnd_556x45_Stanag", "", 400},
			{ "30Rnd_65x39_caseless_mag", "", 500},
			{ "100Rnd_65x39_caseless_mag_Tracer", "", 1500},
			{ "150Rnd_556x45_Drum_Mag_F", "", 1500},
			{ "200Rnd_556x45_Box_F", "", 2000},
			{ "200Rnd_65x39_cased_Box", "", 2200}
        };
        accs[] = {
			{ "muzzle_snds_L", "", 4000, 0 },
            { "muzzle_snds_acp", "", 4000, 0 },
            { "muzzle_snds_M", "", 5000, 0 },
            { "muzzle_snds_H", "", 5000, 0 },
            { "muzzle_snds_H_MG", "", 7000, 0 },
            { "muzzle_snds_93mmg", "", 7000, 0 },
            { "muzzle_snds_93mmg_tan", "", 7000, 0 },
            { "muzzle_snds_B", "", 7000, 0 },
            { "optic_ACO_grn", "", 5000, 0 },
            { "optic_Aco", "", 5000, 0 },
            { "optic_Aco_smg", "", 2500, 0 },
            { "optic_ACO_grn_smg", "", 2500, 0 },
            { "optic_Holosight", "", 5000, 0 },
            { "optic_SOS", "", 5000, 0 },
            { "optic_Hamr", "", 7000, 0 },
            { "optic_Arco", "", 8000, 0 },
            { "optic_MRCO", "", 8000, 0 },
            { "optic_AMS_khk", "", 9000, 0 },
            { "optic_KHS_hex", "", 9000, 0 },
            { "optic_Yorris", "", 7500, 0 },              
            { "optic_MRD", "", 7500, 0 },
            { "acc_flashlight", "", 2500, 0 },
            { "acc_pointer_IR", "", 2500, 0 },
            { "bipod_02_F_hex", "", 10000, 0 },
            { "bipod_02_F_tan", "", 10000, 0 },
            { "ToolKit", "", 5000, 0 },
            { "FirstAidKit", "", 3000, 0 },
            { "NVGoggles_OPFOR", "", 5000, 0 },
            { "ItemMap", "", 50, 0 },
            { "Rangefinder", "", 5000, 0 }
        };
    };
	
	class cop_captain_weapon {
        name = "Captain Weapons";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "EQUAL", 5, ""  };
        items[] = {
            { "hgun_PDW2000_F", "Taser", 25000, -1 },
            { "SMG_02_F", "", 27500, -1 },
            { "SMG_05_F", "", 27500, -1 },
            { "SMG_01_F", "", 30000, -1 },
            { "arifle_Mk20_plain_F", "", 35000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 40000, -1 },
			{ "arifle_MXC_Black_F", "", 35000, -1 },
			{ "arifle_MX_Black_F", "", 40000, -1 },
			{ "arifle_MXM_Black_F", "", 45000, -1 },
			{ "arifle_MX_SW_Black_F", "", 50000, -1 },
			{ "arifle_SPAR_02_blk_F", "", 90000, -1 },
			{ "LMG_03_F", "", 60000, -1 },
			{ "LMG_Mk200_F", "", 100000, -1 },
			{ "arifle_SPAR_03_blk_F", "", 70000, -1 },
			{ "srifle_DMR_03_F", "", 70000, -1 },
			{ "FirstAidKit", "", 3000, -1 }
        };
        mags[] = {
			{ "30Rnd_9x21_Mag", "", 250},
            { "30Rnd_9x21_Mag_SMG_02", "", 250 },
			{ "30Rnd_45ACP_Mag_SMG_01", "", 300},
			{ "30Rnd_556x45_Stanag", "", 400},
			{ "30Rnd_65x39_caseless_mag", "", 500},
			{ "100Rnd_65x39_caseless_mag_Tracer", "", 1500},
			{ "150Rnd_556x45_Drum_Mag_F", "", 1500},
			{ "200Rnd_556x45_Box_F", "", 2000},
			{ "200Rnd_65x39_cased_Box", "", 2200},
			{ "20Rnd_762x51_Mag", "", 1000},
			{ "30Rnd_762x39_Mag_F", "", 1250}
        };
        accs[] = {
			{ "muzzle_snds_L", "", 4000, 0 },
            { "muzzle_snds_acp", "", 4000, 0 },
            { "muzzle_snds_M", "", 5000, 0 },
            { "muzzle_snds_H", "", 5000, 0 },
            { "muzzle_snds_H_MG", "", 7000, 0 },
            { "muzzle_snds_93mmg", "", 7000, 0 },
            { "muzzle_snds_93mmg_tan", "", 7000, 0 },
            { "muzzle_snds_B", "", 7000, 0 },
            { "optic_ACO_grn", "", 5000, 0 },
            { "optic_Aco", "", 5000, 0 },
            { "optic_Aco_smg", "", 2500, 0 },
            { "optic_ACO_grn_smg", "", 2500, 0 },
            { "optic_Holosight", "", 5000, 0 },
            { "optic_SOS", "", 5000, 0 },
            { "optic_Hamr", "", 7000, 0 },
            { "optic_Arco", "", 8000, 0 },
            { "optic_MRCO", "", 8000, 0 },
            { "optic_AMS_khk", "", 9000, 0 },
            { "optic_KHS_hex", "", 9000, 0 },
            { "optic_Yorris", "", 7500, 0 },              
            { "optic_MRD", "", 7500, 0 },
            { "acc_flashlight", "", 2500, 0 },
            { "acc_pointer_IR", "", 2500, 0 },
            { "bipod_02_F_hex", "", 10000, 0 },
            { "bipod_02_F_tan", "", 10000, 0 },
            { "ToolKit", "", 5000, 0 },
            { "FirstAidKit", "", 3000, 0 },
            { "NVGoggles_OPFOR", "", 5000, 0 },
            { "ItemMap", "", 50, 0 },
            { "Rangefinder", "", 5000, 0 }
        };
    };
	
	class cop_major_weapon {
        name = "Major Weapons";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "EQUAL", 6, ""  };
        items[] = {
            { "hgun_PDW2000_F", "Taser", 25000, -1 },
            { "SMG_02_F", "", 27500, -1 },
            { "SMG_05_F", "", 27500, -1 },
            { "SMG_01_F", "", 30000, -1 },
            { "arifle_Mk20_plain_F", "", 35000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 40000, -1 },
			{ "arifle_MXC_Black_F", "", 35000, -1 },
			{ "arifle_MX_Black_F", "", 40000, -1 },
			{ "arifle_MXM_Black_F", "", 45000, -1 },
			{ "arifle_MX_SW_Black_F", "", 50000, -1 },
			{ "arifle_SPAR_02_blk_F", "", 50000, -1 },
			{ "LMG_03_F", "", 60000, -1 },
			{ "LMG_Mk200_F", "", 90000, -1 },
			{ "arifle_SPAR_03_blk_F", "", 70000, -1 },
			{ "srifle_DMR_03_F", "", 70000, -1 },
			{ "arifle_AK12_F", "", 75000, -1 },
			{ "LMG_Zafir_F", "", 130000, -1 },
			{ "srifle_DMR_02_F", "", 100000, -1 },
			{ "srifle_DMR_05_blk_F", "", 120000, -1 },
			{ "launch_RPG32_F", "", 150000, -1 },
			{ "FirstAidKit", "", 3000, -1 }
        };
        mags[] = {
			{ "30Rnd_9x21_Mag", "", 250},
            { "30Rnd_9x21_Mag_SMG_02", "", 250 },
			{ "30Rnd_45ACP_Mag_SMG_01", "", 300},
			{ "30Rnd_556x45_Stanag", "", 400},
			{ "30Rnd_65x39_caseless_mag", "", 500},
			{ "100Rnd_65x39_caseless_mag_Tracer", "", 1500},
			{ "150Rnd_556x45_Drum_Mag_F", "", 1500},
			{ "200Rnd_556x45_Box_F", "", 2000},
			{ "200Rnd_65x39_cased_Box", "", 2200},
			{ "20Rnd_762x51_Mag", "", 1000},
			{ "30Rnd_762x39_Mag_F", "", 1250},
			{ "150Rnd_762x54_Box", "", 1750, -1 },
			{ "10Rnd_338_Mag", "", 1100, -1 },
			{ "10Rnd_93x64_DMR_05_Mag", "", 1200, -1 },
			{ "RPG32_F", "", 25000, -1 }
        };
        accs[] = {
			{ "muzzle_snds_L", "", 4000, 0 },
            { "muzzle_snds_acp", "", 4000, 0 },
            { "muzzle_snds_M", "", 5000, 0 },
            { "muzzle_snds_H", "", 5000, 0 },
            { "muzzle_snds_H_MG", "", 7000, 0 },
            { "muzzle_snds_93mmg", "", 7000, 0 },
            { "muzzle_snds_93mmg_tan", "", 7000, 0 },
            { "muzzle_snds_B", "", 7000, 0 },
            { "optic_ACO_grn", "", 5000, 0 },
            { "optic_Aco", "", 5000, 0 },
            { "optic_Aco_smg", "", 2500, 0 },
            { "optic_ACO_grn_smg", "", 2500, 0 },
            { "optic_Holosight", "", 5000, 0 },
            { "optic_SOS", "", 5000, 0 },
            { "optic_Hamr", "", 7000, 0 },
            { "optic_Arco", "", 8000, 0 },
            { "optic_MRCO", "", 8000, 0 },
            { "optic_AMS_khk", "", 9000, 0 },
            { "optic_KHS_hex", "", 9000, 0 },
            { "optic_Yorris", "", 7500, 0 },              
            { "optic_MRD", "", 7500, 0 },
            { "acc_flashlight", "", 2500, 0 },
            { "acc_pointer_IR", "", 2500, 0 },
            { "bipod_02_F_hex", "", 10000, 0 },
            { "bipod_02_F_tan", "", 10000, 0 },
            { "ToolKit", "", 5000, 0 },
            { "FirstAidKit", "", 3000, 0 },
            { "NVGoggles_OPFOR", "", 5000, 0 },
            { "ItemMap", "", 50, 0 },
            { "Rangefinder", "", 5000, 0 }
        };
    };
	
	class cop_colonel_weapon {
        name = "Colonel Weapons";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "EQUAL", 7, ""  };
        items[] = {
            { "hgun_PDW2000_F", "Taser", 25000, -1 },
            { "SMG_02_F", "", 27500, -1 },
            { "SMG_05_F", "", 27500, -1 },
            { "SMG_01_F", "", 30000, -1 },
            { "arifle_Mk20_plain_F", "", 35000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 40000, -1 },
			{ "arifle_MXC_Black_F", "", 35000, -1 },
			{ "arifle_MX_Black_F", "", 40000, -1 },
			{ "arifle_MXM_Black_F", "", 45000, -1 },
			{ "arifle_MX_SW_Black_F", "", 50000, -1 },
			{ "arifle_SPAR_02_blk_F", "", 50000, -1 },
			{ "LMG_03_F", "", 60000, -1 },
			{ "LMG_Mk200_F", "", 90000, -1 },
			{ "arifle_SPAR_03_blk_F", "", 70000, -1 },
			{ "srifle_DMR_03_F", "", 70000, -1 },
			{ "arifle_AK12_F", "", 75000, -1 },
			{ "LMG_Zafir_F", "", 130000, -1 },
			{ "srifle_DMR_02_F", "", 100000, -1 },
			{ "srifle_DMR_05_blk_F", "", 120000, -1 },
			{ "launch_RPG32_F", "", 150000, -1 },
			{ "MMG_02_black_F", "", 150000, -1 },
			{ "srifle_LRR_F", "", 150000, -1 },
			{ "FirstAidKit", "", 3000, -1 }
			
        };
        mags[] = {
			{ "30Rnd_9x21_Mag", "", 250},
            { "30Rnd_9x21_Mag_SMG_02", "", 250 },
			{ "30Rnd_45ACP_Mag_SMG_01", "", 300},
			{ "30Rnd_556x45_Stanag", "", 400},
			{ "30Rnd_65x39_caseless_mag", "", 500},
			{ "100Rnd_65x39_caseless_mag_Tracer", "", 1500},
			{ "150Rnd_556x45_Drum_Mag_F", "", 1500},
			{ "200Rnd_556x45_Box_F", "", 2000},
			{ "200Rnd_65x39_cased_Box", "", 2200},
			{ "20Rnd_762x51_Mag", "", 1000},
			{ "30Rnd_762x39_Mag_F", "", 1250},
			{ "150Rnd_762x54_Box", "", 1750, -1 },
			{ "10Rnd_338_Mag", "", 1100, -1 },
			{ "10Rnd_93x64_DMR_05_Mag", "", 1200, -1 },
			{ "RPG32_F", "", 25000, -1 },
			{ "130Rnd_338_Mag", "", 2750, -1 },
			{ "7Rnd_408_Mag", "", 3000, -1 }
        };
        accs[] = {
			{ "muzzle_snds_L", "", 4000, 0 },
            { "muzzle_snds_acp", "", 4000, 0 },
            { "muzzle_snds_M", "", 5000, 0 },
            { "muzzle_snds_H", "", 5000, 0 },
            { "muzzle_snds_H_MG", "", 7000, 0 },
            { "muzzle_snds_93mmg", "", 7000, 0 },
            { "muzzle_snds_93mmg_tan", "", 7000, 0 },
            { "muzzle_snds_B", "", 7000, 0 },
            { "optic_ACO_grn", "", 5000, 0 },
            { "optic_Aco", "", 5000, 0 },
            { "optic_Aco_smg", "", 2500, 0 },
            { "optic_ACO_grn_smg", "", 2500, 0 },
            { "optic_Holosight", "", 5000, 0 },
            { "optic_SOS", "", 5000, 0 },
            { "optic_Hamr", "", 7000, 0 },
            { "optic_Arco", "", 8000, 0 },
            { "optic_MRCO", "", 8000, 0 },
            { "optic_AMS_khk", "", 9000, 0 },
            { "optic_KHS_hex", "", 9000, 0 },
            { "optic_Yorris", "", 7500, 0 },              
            { "optic_MRD", "", 7500, 0 },
            { "acc_flashlight", "", 2500, 0 },
            { "acc_pointer_IR", "", 2500, 0 },
            { "bipod_02_F_hex", "", 10000, 0 },
            { "bipod_02_F_tan", "", 10000, 0 },
            { "ToolKit", "", 5000, 0 },
            { "FirstAidKit", "", 3000, 0 },
            { "NVGoggles_OPFOR", "", 5000, 0 },
            { "ItemMap", "", 50, 0 },
            { "Rangefinder", "", 5000, 0 }
        };
    };
	
	class cop_general_weapon {
        name = "General Weapons";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "EQUAL", 8, ""  };
        items[] = {
            { "hgun_PDW2000_F", "Taser", 25000, -1 },
            { "SMG_02_F", "", 27500, -1 },
            { "SMG_05_F", "", 27500, -1 },
            { "SMG_01_F", "", 30000, -1 },
            { "arifle_Mk20_plain_F", "", 35000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 40000, -1 },
			{ "arifle_MXC_Black_F", "", 35000, -1 },
			{ "arifle_MX_Black_F", "", 40000, -1 },
			{ "arifle_MXM_Black_F", "", 45000, -1 },
			{ "arifle_MX_SW_Black_F", "", 50000, -1 },
			{ "arifle_SPAR_02_blk_F", "", 50000, -1 },
			{ "LMG_03_F", "", 60000, -1 },
			{ "LMG_Mk200_F", "", 90000, -1 },
			{ "arifle_SPAR_03_blk_F", "", 70000, -1 },
			{ "srifle_DMR_03_F", "", 70000, -1 },
			{ "arifle_AK12_F", "", 75000, -1 },
			{ "LMG_Zafir_F", "", 130000, -1 },
			{ "srifle_DMR_02_F", "", 100000, -1 },
			{ "srifle_DMR_05_blk_F", "", 120000, -1 },
			{ "launch_RPG32_F", "", 150000, -1 },
			{ "MMG_02_black_F", "", 150000, -1 },
			{ "srifle_LRR_F", "", 150000, -1 },
			{ "MMG_01_tan_F", "", 150000, -1 },
			{ "srifle_GM6_F", "", 200000, -1 },
			{ "FirstAidKit", "", 3000, -1 }
        };
        mags[] = {
			{ "30Rnd_9x21_Mag", "", 250},
            { "30Rnd_9x21_Mag_SMG_02", "", 250 },
			{ "30Rnd_45ACP_Mag_SMG_01", "", 300},
			{ "30Rnd_556x45_Stanag", "", 400},
			{ "30Rnd_65x39_caseless_mag", "", 500},
			{ "100Rnd_65x39_caseless_mag_Tracer", "", 1500},
			{ "150Rnd_556x45_Drum_Mag_F", "", 1500},
			{ "200Rnd_556x45_Box_F", "", 2000},
			{ "200Rnd_65x39_cased_Box", "", 2200},
			{ "20Rnd_762x51_Mag", "", 1000},
			{ "30Rnd_762x39_Mag_F", "", 1250},
			{ "150Rnd_762x54_Box", "", 1750, -1 },
			{ "10Rnd_338_Mag", "", 1100, -1 },
			{ "10Rnd_93x64_DMR_05_Mag", "", 1200, -1 },
			{ "RPG32_F", "", 25000, -1 },
			{ "130Rnd_338_Mag", "", 2750, -1 },
			{ "7Rnd_408_Mag", "", 3000, -1 },
			{ "150Rnd_93x64_Mag", "", 3000},
			{ "5Rnd_127x108_Mag", "", 4000}
        };
        accs[] = {
			{ "muzzle_snds_L", "", 4000, 0 },
            { "muzzle_snds_acp", "", 4000, 0 },
            { "muzzle_snds_M", "", 5000, 0 },
            { "muzzle_snds_H", "", 5000, 0 },
            { "muzzle_snds_H_MG", "", 7000, 0 },
            { "muzzle_snds_93mmg", "", 7000, 0 },
            { "muzzle_snds_93mmg_tan", "", 7000, 0 },
            { "muzzle_snds_B", "", 7000, 0 },
            { "optic_ACO_grn", "", 5000, 0 },
            { "optic_Aco", "", 5000, 0 },
            { "optic_Aco_smg", "", 2500, 0 },
            { "optic_ACO_grn_smg", "", 2500, 0 },
            { "optic_Holosight", "", 5000, 0 },
            { "optic_SOS", "", 5000, 0 },
            { "optic_Hamr", "", 7000, 0 },
            { "optic_Arco", "", 8000, 0 },
            { "optic_MRCO", "", 8000, 0 },
            { "optic_AMS_khk", "", 9000, 0 },
            { "optic_KHS_hex", "", 9000, 0 },
            { "optic_Yorris", "", 7500, 0 },              
            { "optic_MRD", "", 7500, 0 },
            { "acc_flashlight", "", 2500, 0 },
            { "acc_pointer_IR", "", 2500, 0 },
            { "bipod_02_F_hex", "", 10000, 0 },
            { "bipod_02_F_tan", "", 10000, 0 },
            { "ToolKit", "", 5000, 0 },
            { "FirstAidKit", "", 3000, 0 },
            { "NVGoggles_OPFOR", "", 5000, 0 },
            { "ItemMap", "", 50, 0 },
            { "Rangefinder", "", 5000, 0 }
        };
    };
	
	class cop_marshal_weapon {
        name = "Marshal Weapons";
        side = "cop";
        license = "";
        level[] = { "life_coplevel", "EQUAL", 9, ""  };
        items[] = {
            { "hgun_PDW2000_F", "Taser", 25000, -1 },
            { "SMG_02_F", "", 27500, -1 },
            { "SMG_05_F", "", 27500, -1 },
            { "SMG_01_F", "", 30000, -1 },
            { "arifle_Mk20_plain_F", "", 35000, -1 },
			{ "arifle_SPAR_01_blk_F", "", 40000, -1 },
			{ "arifle_MXC_Black_F", "", 35000, -1 },
			{ "arifle_MX_Black_F", "", 40000, -1 },
			{ "arifle_MXM_Black_F", "", 45000, -1 },
			{ "arifle_MX_SW_Black_F", "", 50000, -1 },
			{ "arifle_SPAR_02_blk_F", "", 50000, -1 },
			{ "LMG_03_F", "", 60000, -1 },
			{ "LMG_Mk200_F", "", 90000, -1 },
			{ "arifle_SPAR_03_blk_F", "", 70000, -1 },
			{ "srifle_DMR_03_F", "", 70000, -1 },
			{ "arifle_AK12_F", "", 75000, -1 },
			{ "LMG_Zafir_F", "", 130000, -1 },
			{ "srifle_DMR_02_F", "", 100000, -1 },
			{ "srifle_DMR_05_blk_F", "", 120000, -1 },
			{ "launch_RPG32_F", "", 150000, -1 },
			{ "MMG_02_black_F", "", 150000, -1 },
			{ "srifle_LRR_F", "", 150000, -1 },
			{ "MMG_01_tan_F", "", 150000, -1 },
			{ "srifle_GM6_F", "", 200000, -1 },
			{ "FirstAidKit", "", 3000, -1 }
        };
        mags[] = {
			{ "30Rnd_9x21_Mag", "", 250},
            { "30Rnd_9x21_Mag_SMG_02", "", 250 },
			{ "30Rnd_45ACP_Mag_SMG_01", "", 300},
			{ "30Rnd_556x45_Stanag", "", 400},
			{ "30Rnd_65x39_caseless_mag", "", 500},
			{ "100Rnd_65x39_caseless_mag_Tracer", "", 1500},
			{ "150Rnd_556x45_Drum_Mag_F", "", 1500},
			{ "200Rnd_556x45_Box_F", "", 2000},
			{ "200Rnd_65x39_cased_Box", "", 2200},
			{ "20Rnd_762x51_Mag", "", 1000},
			{ "30Rnd_762x39_Mag_F", "", 1250},
			{ "150Rnd_762x54_Box", "", 1750, -1 },
			{ "10Rnd_338_Mag", "", 1100, -1 },
			{ "10Rnd_93x64_DMR_05_Mag", "", 1200, -1 },
			{ "RPG32_F", "", 25000, -1 },
			{ "130Rnd_338_Mag", "", 2750, -1 },
			{ "7Rnd_408_Mag", "", 3000, -1 },
			{ "150Rnd_93x64_Mag", "", 3000},
			{ "5Rnd_127x108_Mag", "", 4000}
        };
        accs[] = {
			{ "muzzle_snds_L", "", 4000, 0 },
            { "muzzle_snds_acp", "", 4000, 0 },
            { "muzzle_snds_M", "", 5000, 0 },
            { "muzzle_snds_H", "", 5000, 0 },
            { "muzzle_snds_H_MG", "", 7000, 0 },
            { "muzzle_snds_93mmg", "", 7000, 0 },
            { "muzzle_snds_93mmg_tan", "", 7000, 0 },
            { "muzzle_snds_B", "", 7000, 0 },
            { "optic_ACO_grn", "", 5000, 0 },
            { "optic_Aco", "", 5000, 0 },
            { "optic_Aco_smg", "", 2500, 0 },
            { "optic_ACO_grn_smg", "", 2500, 0 },
            { "optic_Holosight", "", 5000, 0 },
            { "optic_SOS", "", 5000, 0 },
            { "optic_Hamr", "", 7000, 0 },
            { "optic_Arco", "", 8000, 0 },
            { "optic_MRCO", "", 8000, 0 },
            { "optic_AMS_khk", "", 9000, 0 },
            { "optic_KHS_hex", "", 9000, 0 },
            { "optic_Yorris", "", 7500, 0 },              
            { "optic_MRD", "", 7500, 0 },
            { "acc_flashlight", "", 2500, 0 },
            { "acc_pointer_IR", "", 2500, 0 },
            { "bipod_02_F_hex", "", 10000, 0 },
            { "bipod_02_F_tan", "", 10000, 0 },
            { "ToolKit", "", 5000, 0 },
            { "FirstAidKit", "", 3000, 0 },
            { "NVGoggles_OPFOR", "", 5000, 0 },
            { "ItemMap", "", 50, 0 },
            { "Rangefinder", "", 5000, 0 }
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
            { "NVGoggles", "", 1200, 980 }
        };
        mags[] = {};
        accs[] = {};
    };
};
