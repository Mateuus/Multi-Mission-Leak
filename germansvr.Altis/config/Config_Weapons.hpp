/*
*    Format:
*        level: ARRAY (This is for limiting items to certain things)
*            0: Variable to read from
*            1: Variable Value Type (SCALAR / BOOL / EQUAL)
*            2: What to compare to (-1 = Check Disabled)
*            3: Custom exit message (Optional)
*
*    items: { Classname,Itemname,BuyPrice,SellPrice }
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
        level[] = { "","",-1,"" };
        items[] = {
			{ "Rangefinder","",25000,10,{ "","",-1 } },
            { "hgun_Rook40_F","",6500,500,{ "","",-1 } },
            { "hgun_Pistol_Signal_F","",1000,500,{ "","",-1 } },
            { "hgun_Pistol_heavy_02_F","",9850,-1,{ "","",-1 } },
            { "hgun_ACPC2_F","",11500,-1,{ "","",-1 } },
            { "hgun_PDW2000_F","",20000,-1,{ "","",-1 } },
			{ "arifle_SDAR_F","",10000,10,{ "","",-1 } },
            { "SMG_01_F","",35000,-1,{ "","",-1 } },
            { "hgun_P07_khk_F","",21000,-1,{ "","",-1 } },//Apex DLC
            { "hgun_Pistol_01_F","",20000,-1,{ "","",-1 } },//Apex DLC
            { "SMG_05_F","",180000,-1,{ "","",-1 } } //Apex DLC
        };
        mags[] = {
            { "16Rnd_9x21_Mag","",25,100,{ "","",-1 } },
            { "6Rnd_45ACP_Cylinder","",50,100,{ "","",-1 } },
			{ "20Rnd_556x45_UW_mag","",500,100,{ "","",-1 } },
			{ "6Rnd_RedSignal_F","",500,100,{ "","",-1 } },
			{ "6Rnd_GreenSignal_F","",500,100,{ "","",-1 } },
            { "30Rnd_556x45_Stanag","",500,100,{ "","",-1 } },
            { "30Rnd_45ACP_Mag_SMG_01","",500,100,{ "","",-1 } },
            { "9Rnd_45ACP_Mag","",45,100,{ "","",-1 } },
            { "30Rnd_9x21_Mag","",75,100,{ "","",-1 } },
            { "30Rnd_9x21_Mag_SMG_02","",75,100,{ "","",-1 } },//Apex DLC
            { "10Rnd_9x21_Mag","",75,100,{ "","",-1 } } //Apex DLC - Had to guess this. Not referenced anywhere
        };
        accs[] = {
            { "optic_ACO_grn_smg","",2500,100,{ "","",-1 } }
        };
    };

    class rebel {
        name = "Mohammed's Jihadi Shop";
        side = "civ";
        license = "rebel";
        level[] = { "","",-1,"" };
        items[] = {
			{ "Rangefinder","",10000,10,{ "","",-1 } },
			{ "arifle_SDAR_F",SDAR,25000,10,{ "","",-1 } },
			{ "arifle_TRG20_F",TRG,30000,10,{ "","",-1 } },
			{ "arifle_Mk20_F",Mk20,50000,10,{ "","",-1 } },
			{ "arifle_Mk20C_F",Mk20c,75000,10,{ "","",-1 } },
			{ "arifle_CTAR_hex_F",Apex: CAR95 Hex,90000,10,{ "","",-1 } },
			{ "arifle_CTAR_ghex_F",Apex: CAR95 Green Hex,90000,10,{ "","",-1 } },
			{ "arifle_CTARS_hex_F",Apex: CAR951 Hex,120000,10,{ "","",-1 } },
			{ "arifle_CTARS_ghex_F",Apex: CAR951 Green Hex,120000,10,{ "","",-1 } },
			{ "arifle_Katiba_F",Katiba,150000,10,{ "","",-1 } },
			{ "srifle_DMR_01_F",Rahim,200000,10,{ "","",-1 } },
			{ "arifle_AKS_F",Apex: AKS,250000,10,{ "","",-1 } },
			{ "arifle_SPAR_01_khk_F",Apex: HK416 Khaki,300000,10,{ "","",-1 } },
			{ "arifle_SPAR_01_snd_F",Apex: HK416 Sandfarben,300000,10,{ "","",-1 } },
			{ "arifle_MXC_F",MXC,325000,10,{ "","",-1 } },
			{ "arifle_MXC_khk_F",Apex: MXC Khaki,325000,10,{ "","",-1 } },
			{ "arifle_MX_F",MX,350000,10,{ "","",-1 } },
			{ "arifle_MX_khk_F",Apex: MX Khaki,350000,10,{ "","",-1 } },
			{ "arifle_MXM_F",MXM,375000,10,{ "","",-1 } },
			{ "arifle_MXM_khk_F",Apex: MXM Khaki,375000,10,{ "","",-1 } },
			{ "arifle_MX_SW_F",MXSW,400000,10,{ "","",-1 } },
			{ "srifle_DMR_07_ghex_F",Apex: Cmr76 Green Hex,450000,10,{ "","",-1 } },
			{ "srifle_DMR_07_hex_F",Apex: Cmr76 Hex,450000,10,{ "","",-1 } },
			{ "srifle_EBR_F",MK18,475000,10,{ "","",-1 } },
			{ "arifle_AKM_F",Apex: AKM,500000,10,{ "","",-1 } }
        };
        mags[] = {
			{ "20Rnd_556x45_UW_mag","",500,100,{ "","",-1 } },
            { "30Rnd_556x45_Stanag","",500,100,{ "","",-1 } },
			{ "30Rnd_65x39_caseless_mag","",500,100,{ "","",-1 } },
			{ "20Rnd_762x51_Mag","",500,100,{ "","",-1 } },
			{ "20Rnd_650x39_Cased_Mag_F","",500,100,{ "","",-1 } },
			{ "30Rnd_762x39_Mag_F","",500,100,{ "","",-1 } },
			{ "30Rnd_545x39_Mag_F","",500,100,{ "","",-1 } },
			{ "30Rnd_556x45_Stanag","",500,100,{ "","",-1 } },
			{ "30Rnd_65x39_caseless_green","",500,100,{ "","",-1 } },
			{ "30Rnd_580x42_Mag_F","",500,100,{ "","",-1 } },
			{ "100Rnd_580x42_Mag_F","",500,100,{ "","",-1 } },
			{ "100Rnd_65x39_caseless_mag","",500,100,{ "","",-1 } },
			{ "200Rnd_65x39_cased_Box","",500,100,{ "","",-1 } },
			{ "10Rnd_762x54_Mag","",500,100,{ "","",-1 } }

        };
        accs[] = {
            { "optic_ACO_grn","",5000,100,{ "","",-1 } },
            { "optic_Holosight","",5000,100,{ "","",-1 } },
            { "optic_Hamr","",10000,100,{ "","",-1 } },
			{ "optic_MRCO","",10000,100,{ "","",-1 } },
			{ "optic_Arco","",10000,100,{ "","",-1 } },
			{ "optic_DMS","",25000,100,{ "","",-1 } },
			{ "optic_AMS","",50000,100,{ "","",-1 } },
			{ "optic_LRPS","",100000,100,{ "","",-1 } },
			{ "optic_SOS","",100000,100,{ "","",-1 } },
			{ "muzzle_snds_M","",100000,100,{ "","",-1 } },
			{ "muzzle_snds_H","",100000,100,{ "","",-1 } },
			{ "muzzle_snds_B","",100000,100,{ "","",-1 } },
			{ "muzzle_snds_65_TI_blk_F","",100000,100,{ "","",-1 } },
			{ "muzzle_snds_58_wdm_F","",100000,100,{ "","",-1 } },
			{ "bipod_01_F_blk","",50000,100,{ "","",-1 } },
			{ "bipod_01_F_snd","",50000,100,{ "","",-1 } },
			{ "bipod_01_F_mtp","",50000,100,{ "","",-1 } },
			{ "bipod_02_F_tan","",50000,100,{ "","",-1 } },
			{ "bipod_02_F_hex","",50000,100,{ "","",-1 } },
			{ "bipod_03_F_oli","",50000,100,{ "","",-1 } },
			{ "acc_flashlight","",1000,100,{ "","",-1 } },
			{ "acc_pointer_IR","",1000,100,{ "","",-1 } }
        };
    };
	
	class schwarzmarkt {
        name = "Dieters kleines Arsenal";
        side = "civ";
        license = "schwarzmarkt";
        level[] = { "","",-1,"" };
        items[] = {
			{ "Rangefinder","",25000,10,{ "","",-1 } },
			{ "srifle_DMR_03_khaki_F",Apex: Mk-I EMR Khaki,700000,10,{ "","",-1 } },
			{ "srifle_DMR_03_tan_F",Mk-I EMR Sandfarben,700000,10,{ "","",-1 } },
			{ "srifle_DMR_03_multicam_F",Mk-I EMR Camoflage,700000,10,{ "","",-1 } },
			{ "srifle_DMR_03_woodland_F",Mk-I EMR Woodland,700000,10,{ "","",-1 } },
			{ "arifle_SPAR_03_khk_F",Apex: HK417 Khaki,750000,10,{ "","",-1 } },
			{ "arifle_SPAR_03_snd_F",Apex HK417 Sandfarben,750000,10,{ "","",-1 } },
			{ "arifle_SPAR_02_khk_F",Apex: HK416s Khaki,800000,10,{ "","",-1 } },
			{ "arifle_SPAR_02_snd_F",Apex KK416s Sandfarben,800000,10,{ "","",-1 } },
			{ "LMG_Mk200_F",Mk200,850000,10,{ "","",-1 } },
			{ "arifle_AK12_F",Apex: Ak12,900000,10,{ "","",-1 } },
			{ "	launch_RPG32_F",Apex: Ak12,3000000,10,{ "","",-1 } },
			{ "srifle_LRR_tna_F",Lrr,3750000,10,{ "","",-1 } }
        };
        mags[] = {
            { "20Rnd_762x51_Mag","",500,100,{ "","",-1 } },
			{ "10Rnd_93x64_DMR_05_Mag","",500,100,{ "","",-1 } },
			{ "30Rnd_762x39_Mag_F","",500,100,{ "","",-1 } },
			{ "30Rnd_65x39_caseless_green","",500,100,{ "","",-1 } },
			{ "200Rnd_65x39_cased_Box","",500,100,{ "","",-1 } },
			{ "RPG32_F","",2000000,100,{ "","",-1 } },
			{ "7Rnd_408_Mag","",500,100,{ "","",-1 } }
        };
        accs[] = {
            { "optic_ACO_grn","",5000,100,{ "","",-1 } },
            { "optic_Holosight","",5000,100,{ "","",-1 } },
            { "optic_Hamr","",10000,100,{ "","",-1 } },
			{ "optic_MRCO","",10000,100,{ "","",-1 } },
			{ "optic_Arco","",10000,100,{ "","",-1 } },
			{ "optic_DMS","",25000,100,{ "","",-1 } },
			{ "optic_AMS","",50000,100,{ "","",-1 } },
			{ "optic_LRPS","",100000,100,{ "","",-1 } },
			{ "optic_SOS","",100000,100,{ "","",-1 } },
			{ "muzzle_snds_M","",100000,100,{ "","",-1 } },
			{ "muzzle_snds_H","",100000,100,{ "","",-1 } },
			{ "muzzle_snds_B","",100000,100,{ "","",-1 } },
			{ "muzzle_snds_H_MG","",100000,100,{ "","",-1 } },
			{ "muzzle_snds_65_TI_blk_F","",100000,100,{ "","",-1 } },
			{ "muzzle_snds_58_wdm_F","",100000,100,{ "","",-1 } },
			{ "bipod_01_F_blk","",50000,100,{ "","",-1 } },
			{ "bipod_01_F_snd","",50000,100,{ "","",-1 } },
			{ "bipod_01_F_mtp","",50000,100,{ "","",-1 } },
			{ "bipod_02_F_tan","",50000,100,{ "","",-1 } },
			{ "bipod_02_F_hex","",50000,100,{ "","",-1 } },
			{ "bipod_03_F_oli","",50000,100,{ "","",-1 } },
			{ "acc_flashlight","",1000,100,{ "","",-1 } },
			{ "acc_pointer_IR","",1000,100,{ "","",-1 } }
        };
    };

    class gang {
        name = "Hideout Armament";
        side = "civ";
        license = "";
        level[] = { "","",-1,"" };
        items[] = {
			{ "Rangefinder","",25000,10,{ "","",-1 } },
            { "hgun_Rook40_F","",1500,500,{ "","",-1 } },
            { "hgun_Pistol_heavy_02_F","",2500,-1,{ "","",-1 } },
            { "hgun_ACPC2_F","",4500,-1,{ "","",-1 } },
            { "hgun_PDW2000_F","",9500,-1,{ "","",-1 } },
			{ "arifle_Katiba_F",Katiba,150000,10,{ "","",-1 } },
			{ "srifle_DMR_01_F",Rahim,200000,10,{ "","",-1 } },
			{ "arifle_AKS_F",Apex: AKS,250000,10,{ "","",-1 } },
			{ "arifle_SPAR_01_khk_F",Apex: HK416 Khaki,300000,10,{ "","",-1 } },
			{ "arifle_SPAR_01_snd_F",Apex: HK416 Sandfarben,300000,10,{ "","",-1 } },
			{ "arifle_MXC_F",MXC,325000,10,{ "","",-1 } },
			{ "arifle_MXC_khk_F",Apex: MXC Khaki,325000,10,{ "","",-1 } },
			{ "arifle_MX_F",MX,350000,10,{ "","",-1 } },
			{ "arifle_MX_khk_F",Apex: MX Khaki,350000,10,{ "","",-1 } },
			{ "arifle_MXM_F",MXM,375000,10,{ "","",-1 } },
			{ "arifle_MXM_khk_F",Apex: MXM Khaki,375000,10,{ "","",-1 } },
			{ "arifle_MX_SW_F",MXSW,400000,10,{ "","",-1 } }
        };
        mags[] = {
            { "16Rnd_9x21_Mag","",25,100,{ "","",-1 } },
            { "6Rnd_45ACP_Cylinder","",50,100,{ "","",-1 } },
            { "9Rnd_45ACP_Mag","",45,100,{ "","",-1 } },
            { "30Rnd_65x39_caseless_green","",45,100,{ "","",-1 } },
            { "10Rnd_762x54_Mag","",45,100,{ "","",-1 } },
            { "30Rnd_545x39_Mag_F","",45,100,{ "","",-1 } },
            { "30Rnd_556x45_Stanag","",45,100,{ "","",-1 } },
            { "30Rnd_65x39_caseless_mag","",45,100,{ "","",-1 } },
            { "30Rnd_9x21_Mag","",75,100,{ "","",-1 } }
        };
        accs[] = {
            { "optic_ACO_grn_smg","",950,100,{ "","",-1 } }
        };
    };
	
    //Basic Shops
    class genstore {
        name = "Altis General Store";
        side = "civ";
        license = "";
        level[] = { "","",-1,"" };
        items[] = {
            { "Binocular","",150,-1,{ "","",-1 } },
			{ "Rangefinder","",25000,10,{ "","",-1 } },
            { "ItemGPS","",100,45,{ "","",-1 } },
            { "ItemMap","",50,35,{ "","",-1 } },
            { "ItemCompass","",50,25,{ "","",-1 } },
            { "ItemWatch","",50,-1,{ "","",-1 } },
            { "FirstAidKit","",150,65,{ "","",-1 } },
            { "NVGoggles","",1000,980,{ "","",-1 } },
			{ "NVGoggles_INDEP","",1000,50,{ "","",-1 } },
			{ "NVGoggles_tna_F","",1000,50,{ "","",-1 } },
            { "Chemlight_red","",300,-1,{ "","",-1 } },
            { "Chemlight_yellow","",300,50,{ "","",-1 } },
            { "Chemlight_green","",300,50,{ "","",-1 } },
            { "Chemlight_blue","",300,50,{ "","",-1 } }
        };
        mags[] = {};
        accs[] = {};
    };

    class f_station_store {
        name = "Altis Fuel Station Store";
        side = "";
        license = "";
        level[] = { "","",-1,"" };
        items[] = {
			{ "Rangefinder","",25000,10,{ "","",-1 } },
            { "Binocular","",750,-1,{ "","",-1 } },
            { "ItemGPS","",500,45,{ "","",-1 } },
            { "ItemMap","",250,35,{ "","",-1 } },
            { "ItemCompass","",250,25,{ "","",-1 } },
            { "ItemWatch","",250,-1,{ "","",-1 } },
            { "FirstAidKit","",750,65,{ "","",-1 } },
            { "NVGoggles","",1000,50,{ "","",-1 } },
			{ "NVGoggles_INDEP","",1000,50,{ "","",-1 } },
			{ "NVGoggles_tna_F","",1000,50,{ "","",-1 } },
            { "Chemlight_red","",1500,-1,{ "","",-1 } },
            { "Chemlight_yellow","",1500,50,{ "","",-1 } },
            { "Chemlight_green","",1500,50,{ "","",-1 } },
            { "Chemlight_blue","",1500,50,{ "","",-1 } }
        };
        mags[] = {};
        accs[] = {};
    };
	
    //Cop Shops
    class cop_basic {
        name = "Altis Cop Shop";
        side = "cop";
        license = "";
        level[] = { "","",-1,"" };
        items[] = {
			{ "Rangefinder","",25000,10,{ "","",-1 } },
            { "ItemGPS","",100,45,{ "","",-1 } },
            { "FirstAidKit","",150,65,{ "","",-1 } },
            { "NVGoggles_OPFOR","",2000,980,{ "","",-1 } },
            { "HandGrenade_Stone","Flashbang",2500,-1,{ "","",-1 } },
            { "hgun_P07_snds_F","Taser",1000,650,{ "","",-1 } },
            { "hgun_P07_F","",7500,1500,{ "","",-1 } },
			{ "arifle_SDAR_F","Taserrifle",7500,1500,{ "","",-1 } },
			{ "srifle_DMR_02_F","",50000,1500,{ "life_coplevel","SCALAR",5 } },
			{ "arifle_SPAR_01_blk_F","",50000,1500,{ "life_coplevel","SCALAR",1 } },
			{ "arifle_MXC_Black_F","",50000,1500,{ "life_coplevel","SCALAR",2 } },
			{ "arifle_MX_Black_F","",50000,1500,{ "life_coplevel","SCALAR",3 } },
			{ "arifle_MXM_Black_F","",50000,1500,{ "life_coplevel","SCALAR",4 } },
			{ "srifle_DMR_03_F","",50000,1500,{ "life_coplevel","SCALAR",5 } },
			{ "arifle_SPAR_02_blk_F","",50000,1500,{ "life_coplevel","SCALAR",5 } },
			{ "srifle_DMR_07_blk_F","",50000,1500,{ "life_coplevel","SCALAR",5 } },
			{ "LMG_03_F","",50000,1500,{ "life_coplevel","SCALAR",8 } },
			{ "srifle_DMR_06_olive_F","",50000,1500,{ "life_coplevel","SCALAR",11 } },
			{ "arifle_MX_SW_Black_F","",50000,1500,{ "life_coplevel","SCALAR",11 } },
			{ "srifle_GM6_ghex_F","",50000,1500,{ "life_coplevel","SCALAR",12 } },
		    { "srifle_LRR_F","",50000,1500,{ "life_coplevel","SCALAR",12 } },
		    { "srifle_LRR_F","",50000,1500,{ "life_coplevel","SCALAR",12 } },
		    { "LMG_Mk200_F","",50000,1500,{ "life_coplevel","SCALAR",12 } },
		    { "arifle_ARX_blk_F","",50000,1500,{ "life_coplevel","SCALAR",15 } }
		};
        mags[] = {
            { "16Rnd_9x21_Mag","",500,100,{ "","",-1 } },
            { "30Rnd_556x45_Stanag","",500,100,{ "","",-1 } },
			{ "30Rnd_65x39_caseless_mag","",500,100,{ "","",-1 } },
			{ "20Rnd_762x51_Mag","",500,100,{ "","",-1 } },
			{ "10Rnd_50BW_Mag_F","Gummigeschosse",500,100,{ "","",-1 } },
			{ "20Rnd_650x39_Cased_Mag_F","",500,100,{ "","",-1 } },
			{ "150Rnd_556x45_Drum_Mag_F","",500,100,{ "","",-1 } },
			{ "200Rnd_556x45_Box_F","",500,100,{ "","",-1 } },
			{ "150Rnd_556x45_Drum_Mag_F","",500,100,{ "","",-1 } },
			{ "30Rnd_65x39_caseless_green","",500,100,{ "","",-1 } },
			{ "10Rnd_338_Mag","",500,100,{ "","",-1 } },
			{ "100Rnd_65x39_caseless_mag","",500,100,{ "","",-1 } },
			{ "5Rnd_127x108_Mag","",500,100,{ "","",-1 } },
			{ "7Rnd_408_Mag","",500,100,{ "","",-1 } },
			{ "10Rnd_50BW_Mag_F","",500,100,{ "","",-1 } },
			{ "10Rnd_93x64_DMR_05_Mag","",500,100,{ "","",-1 } },
			{ "10Rnd_50BW_Mag_F","",500,100,{ "","",-1 } }
        };
        accs[] = {
            { "muzzle_snds_M","",500,100,{ "","",-1 } },
			{ "muzzle_snds_H","",500,100,{ "","",-1 } },
			{ "muzzle_snds_B","",500,100,{ "","",-1 } },
			{ "muzzle_snds_65_TI_blk_F","",500,100,{ "","",-1 } },
			{ "muzzle_snds_58_blk_F","",500,100,{ "","",-1 } },
			{ "muzzle_snds_338_black","",500,100,{ "","",-1 } },
			{ "optic_Hamr","",500,100,{ "","",-1 } },
            { "optic_MRCO","",500,100,{ "","",-1 } },
            { "optic_Arco_blk_F","",500,100,{ "","",-1 } },
            { "optic_Holosight_blk_F","",500,100,{ "","",-1 } },
			{ "optic_DMS","",500,100,{ "","",-1 } },
            { "optic_AMS","",500,100,{ "","",-1 } },
            { "optic_LRPS","",500,100,{ "","",-1 } },
			{ "bipod_01_F_blk","",500,100,{ "","",-1 } },
			{ "acc_flashlight","",500,100,{ "","",-1 } },
			{ "acc_pointer_IR","",500,100,{ "","",-1 } }
        };
    };

    //Medic Shops
    class med_basic {
        name = "store";
        side = "med";
        license = "";
        level[] = { "","",-1,"" };
        items[] = {
            { "ItemGPS","",100,45,{ "","",-1 } },
            { "ItemMap","",100,45,{ "","",-1 } },
            { "Binocular","",150,-1,{ "","",-1 } },
            { "FirstAidKit","",150,65,{ "","",-1 } },
            { "Medikit","",150,65,{ "","",-1 } },		
            { "NVGoggles","",1200,980,{ "","",-1 } },
			{ "NVGoggles_INDEP","",1000,50,{ "","",-1 } },
			{ "NVGoggles_OPFOR","",1000,50,{ "","",-1 } }
        };
        mags[] = {};
        accs[] = {};
    };
	class adac {
        name = "store";
        side = "adac";
        license = "";
        level[] = { "","",-1,"" };
        items[] = {
            { "ItemGPS","",100,45,{ "","",-1 } },
            { "ItemMap","",100,45,{ "","",-1 } },
            { "Binocular","",150,-1,{ "","",-1 } },
            { "FirstAidKit","",150,65,{ "","",-1 } },
            { "Medikit","",150,65,{ "","",-1 } },		
            { "NVGoggles","",1200,980,{ "","",-1 } },
			{ "NVGoggles_INDEP","",1000,50,{ "","",-1 } },
			{ "NVGoggles_OPFOR","",1000,50,{ "","",-1 } }
        };
        mags[] = {};
        accs[] = {};
    };
};
