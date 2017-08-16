/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Config_Shop.sqf

Description:
Shopping Config
*/
RPP_Shop_Trucks =
[
	//Classname
	["RPP_shounka_a3_dafxf_euro6_f"],
	["RPP_shounka_ivceco_noir"],
	["RPP_shounka_ivceco_bleufonce"],
	["RPP_shounka_ivceco_rouge"],
	["RPP_shounka_ivceco_jaune"],
	["RPP_shounka_ivceco_rose"],
	["RPP_shounka_ivceco_grise"],
	["RPP_shounka_ivceco_violet"],
	["RPP_Skyline_Bus_03_F"],
	["RPP_Skyline_Bus_04_F"],
	["RPP_Skyline_Bus_05_F"],
	["RPP_Skyline_Bus_06_F"],
	["RPP_Skyline_Bus_07_F"],
	["RPP_Skyline_Bus_08_F"],
	["RPP_Skyline_Bus_09_F"],
	["RPP_Skyline_Bus_10_F"],
	["RPP_Skyline_Bus_11_F"],
	["RPP_C_VAN_01_box_F"]
];
publicVariable "RPP_Shop_Trucks";
RPP_Shop_Trucks_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",256000,1000,"RPP_Shop_Trucks_ShopOwner","Empty","Truck Shop"]
];
publicVariable "RPP_Shop_Trucks_ShopOwner";

RPP_Shop_UserCars =
[
	//Classname
	["RPP_Offroad"],
	["RPP_Quadbike"],
	["RPP_Hatchback"],
	["RPP_Mrshounka_r5_noir"],
	["RPP_Mrshounka_r5_bleufonce"],
	["RPP_Mrshounka_r5_rouge"],
	["RPP_Mrshounka_r5_jaune"],
	["RPP_Mrshounka_r5_rose"],
	["RPP_MrShounka_r5_grise"],
	["RPP_Mrshounka_r5_violet"],
	["RPP_Mrshounka_r5_orange"],
	["RPP_shounka_a3_cliors_civ_noir"],
	["RPP_shounka_a3_cliors_civ_bleufonce"],
	["RPP_shounka_a3_cliors_civ_rouge"],
	["RPP_shounka_a3_cliors_civ_jaune"],
	["RPP_shounka_a3_cliors_civ_grise"],
	["RPP_shounka_a3_cliors_civ_violet"],
	["RPP_Mrshounka_a3_308_civ_noir"],
	["RPP_Mrshounka_a3_308_civ_bleufonce"],
	["RPP_Mrshounka_a3_308_civ_rouge"],
	["RPP_Mrshounka_a3_308_civ_jaune"],
	["RPP_Mrshounka_a3_308_civ_rose"],
	["RPP_Mrshounka_a3_308_civ_violet"],
	["RPP_Mrshounka_corbillard_c_noir"],
	["RPP_Mrshounka_corbillard_c_bleufonce"],
	["RPP_Mrshounka_corbillard_c_rouge"],
	["RPP_Mrshounka_corbillard_c_jaune"],
	["RPP_Mrshounka_corbillard_c_rose"],
	["RPP_Mrshounka_corbillard_c_grise"],
	["RPP_Mrshounka_corbillard_c_violet"]
];
publicVariable "RPP_Shop_UserCars";
RPP_Shop_UserCars_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",125000,1000,"RPP_Shop_UserCars_ShopOwner","Empty","User Cars Shop"]
];
publicVariable "RPP_Shop_UserCars_ShopOwner";

RPP_Shop_MediumCars =
[
	["RPP_DodgeChargerSRT8_12_White"],
	["RPP_DodgeChargerSRT8_12_Black"],
	["RPP_DodgeChargerSRT8_12_Red"],
	["RPP_DodgeChargerSRT8_12_blue"],
	["RPP_DodgeChargerSRT8_12_Green"],
	["RPP_DodgeChargerSRT8_12_Yellow"],
	["RPP_DodgeChargerSRT8_12_LightBlue"],
	["RPP_DodgeChargerSRT8_12_Pink"],
	["RPP_DodgeChargerSRT8_12_Orange"],
	["RPP_RPP_DodgeCharger15_White"],
	["RPP_RPP_DodgeCharger15_Black"],
	["RPP_RPP_DodgeCharger15_Red"],
	["RPP_RPP_DodgeCharger15_blue"],
	["RPP_RPP_DodgeCharger15_Green"],
	["RPP_RPP_CAD_Escalade_12_White"],
	["RPP_RPP_CAD_Escalade_12_Black"],
	["RPP_RPP_CAD_Escalade_12_Red"],
	["RPP_RPP_CAD_Escalade_12_Blue"],
	["RPP_RPP_CAD_Escalade_12_Yellow"],
	["RPP_RPP_CAD_Escalade_12_Green"],
	["RPP_RPP_CAD_Escalade_12_LightBlue"],
	["RPP_Mrshounka_mercedes_190_p_noir"],
	["RPP_Mrshounka_mercedes_190_p_bleufonce"],
	["RPP_Mrshounka_mercedes_190_p_rouge"],
	["RPP_Mrshounka_mercedes_190_p_jaune"],
	["RPP_Mrshounka_mercedes_190_p_rose"],
	["RPP_Mrshounka_mercedes_190_p_grise"],
	["RPP_Mrshounka_mercedes_190_p_violet"],
	["RPP_shounka_avalanche_noir"],
	["RPP_shounka_avalanche_bleufonce"],
	["RPP_shounka_avalanche_rouge"],
	["RPP_shounka_avalanche_jaune"],
	["RPP_shounka_avalanche_rose"],
	["RPP_shounka_avalanche_grise"],
	["RPP_shounka_avalanche_violet"],
	["RPP_shounka_buggy_noir"],
	["RPP_shounka_buggy_bleufonce"],
	["RPP_shounka_buggy_rouge"],
	["RPP_shounka_buggy_jaune"],
	["RPP_shounka_buggy_rose"],
	["RPP_shounka_buggy_grise"],
	["RPP_shounka_buggy_violet"],
	["RPP_Mrshounka_yamaha_p_noir"],
	["RPP_Mrshounka_yamaha_p_rose"],
	["RPP_shounka_monsteur_noir"],
	["RPP_shounka_monsteur_bleufonce"],
	["RPP_shounka_monsteur_rouge"],
	["RPP_shounka_monsteur_jaune"],
	["RPP_shounka_monsteur_rose"],
	["RPP_shounka_monsteur_grise"],
	["RPP_shounka_monsteur_violet"]
];
publicVariable "RPP_Shop_MediumCars";
RPP_Shop_MediumCars_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",160000,300,"RPP_Shop_MediumCars_ShopOwner","Empty","Medium Cars Shop"]
];
publicVariable "RPP_Shop_MediumCars_ShopOwner";

RPP_Shop_HighEnd =
[
	["red_genesis_16_black"],
	["RPP_BMW_M5_Black"],
	["RPP_BMW_M5_Red"],
	["RPP_BMW_M5_blue"],
	["RPP_BMW_M5_Green"],
	["RPP_LamboAWhite"],
	["RPP_LamboABlack"],
	["RPP_LamboARed"],
	["RPP_LamboABlue"],
	["RPP_LamboAGrey"],
	["RPP_LamboALightBlue"],
	["RPP_LamboAOrange"],
	["RPP_LamboAPink"],
	["RPP_LamboAYellow"],
	["RPP_Skyline_Mercedes_C63_01_F"],
	["RPP_Skyline_Mercedes_C63_02_F"],
	["RPP_shounka_f430_spider_noir"],
	["RPP_shounka_f430_spider_bleufonce"],
	["RPP_shounka_f430_spider_rouge"],
	["RPP_shounka_f430_spider_jaune"],
	["RPP_shounka_f430_spider_rose"],
	["RPP_shounka_f430_spider_grise"],
	["RPP_shounka_f430_spider_violet"],
	["RPP_shounka_porsche911_noir"],
	["RPP_shounka_porsche911_bleufonce"],
	["RPP_shounka_porsche911_rouge"],
	["RPP_shounka_porsche911_jaune"],
	["RPP_shounka_porsche911_rose"],
	["RPP_shounka_porsche911_grise"],
	["RPP_shounka_porsche911_violet"],
	["RPP_Mrshounka_lykan_c_rouge"],
	["RPP_Mrshounka_lykan_c_jaune"],
	["RPP_Mrshounka_lykan_c_rose"],
	["RPP_Mrshounka_lykan_c_grise"],
	["RPP_Mrshounka_lykan_c_violet"]
];
publicVariable "RPP_Shop_HighEnd";
RPP_Shop_HighEnd_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",160000,300,"RPP_Shop_HighEnd_ShopOwner","Empty","HighEnd Cars Shop"]
];
publicVariable "RPP_Shop_HighEnd_ShopOwner";

RPP_Shop_Cloth =
[
	["RPP_TRYK_U_B_PCUHsW3nh"],
	["RPP_TRYK_U_B_PCUHsW3"],
	["RPP_TRYK_U_B_PCUGs_BLK_R"],
	["RPP_TRYK_R_CAP_BLK"],
	["RPP_G_Aviator"],
	["RPP_G_Spectacles_Tinted"],
	["RPP_TRYK_Beard_BK"],
	["RPP_TRYK_Beard"],
	["RPP_TRYK_Beard_BW"],
	["RPP_TRYK_Beard_Gr"],
	["RPP_TRYK_Beard_BK2"],
	["RPP_TRYK_Beard2"],
	["RPP_TRYK_Beard_BW2"],
	["RPP_TRYK_Beard_Gr2"],
	["RPP_TRYK_Beard_BK3"],
	["RPP_TRYK_Beard3"],
	["RPP_TRYK_Beard_BW3"],
	["RPP_TRYK_Beard_Gr3"],
	["RPP_TRYK_Beard_BK4"],
	["RPP_TRYK_Beard4"],
	["RPP_TRYK_Beard_BW4"],
	["RPP_TRYK_Beard_Gr4"],
	["RPP_G_Bandanna_blk"],
	["RPP_G_Balaclava_blk"],
	["RPP_G_Bandanna_beast"],
	["RPP_G_Spectacles"],
	["RPP_G_Sport_Red"],
	["RPP_G_Sport_Blackyellow"],
	["RPP_G_Sport_BlackWhite"],
	["RPP_G_Squares_Tinted"],
	["RPP_BetaShirt_Polo"],
	["RPP_ILoveRPP_Polo"],
	["RPP_TRYK_SUITS_BLK_F"],
	["RPP_TRYK_SUITS_BR_F"],
	["RPP_TRYK_U_denim_hood_3c"],
	["RPP_TRYK_U_denim_hood_blk"],
	["RPP_TRYK_U_denim_hood_mc"],
	["RPP_TRYK_U_denim_hood_nc"],
	["RPP_TRYK_U_denim_jersey_blk"],
	["RPP_TRYK_U_denim_jersey_blu"],
	["RPP_TRYK_shirts_DENIM_od_Sleeve"],
	["RPP_TRYK_shirts_DENIM_ylb_Sleeve"],
	["RPP_TRYK_shirts_DENIM_BK_Sleeve"],
	["RPP_TRYK_shirts_DENIM_BL_Sleeve"],
	["RPP_TRYK_shirts_DENIM_BWH_Sleeve"],
	["RPP_TRYK_shirts_DENIM_R_Sleeve"],
	["RPP_TRYK_shirts_DENIM_RED2_Sleeve"],
	["RPP_TRYK_shirts_DENIM_WH_Sleeve"],
	["RPP_TRYK_shirts_DENIM_WHB_Sleeve"]
];
publicVariable "RPP_Shop_Cloth";
RPP_Shop_Cloth_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",50000,1000,"RPP_Shop_Cloth_ShopOwner","Empty","Clothing Shop"]
];
publicVariable "RPP_Shop_Cloth_ShopOwner";

RPP_Shop_SeedDealer =
[
	["RPP_LSD_Seed"],
	["RPP_Cannabis_Seed"]
];
publicVariable "RPP_Shop_SeedDealer";
RPP_Shop_SeedDealer_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",160000,300,"RPP_Shop_SeedDealer_ShopOwner","Empty","Seed Dealer"]
];
publicVariable "RPP_Shop_SeedDealer_ShopOwner";

RPP_Shop_BoatShop1 =
[
	["RPP_C_Rubberboat"],
	["RPP_C_Boat_Civil_01_F"],
	["RPP_I_G_Boat_Transport_01_F"]
];
publicVariable "RPP_Shop_BoatShop1";
RPP_Shop_BoatShop1_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",160000,300,"RPP_Shop_BoatShop1_ShopOwner","Empty","Boat Shop 1"]
];
publicVariable "RPP_Shop_BoatShop1_ShopOwner";

RPP_Shop_BoatShop1_Police =
[
	["RPP_C_Boat_Civil_01_police_F"],
	["RPP_B_SDV_01_F"],
	["RPP_I_G_Boat_Transport_01_F"]
];
publicVariable "RPP_Shop_BoatShop1_Police";
RPP_Shop_BoatShop1_Police_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",160000,300,"RPP_Shop_BoatShop1_Police_ShopOwner","Empty","Police Boat Shop"]
];
publicVariable "RPP_Shop_BoatShop1_Police_ShopOwner";

RPP_Shop_BoatShop1_EMT =
[
	["RPP_O_Lifeboat"],
	["RPP_C_Boat_Civil_01_rescue_F"]
];
publicVariable "RPP_Shop_BoatShop1_EMT";
RPP_Shop_BoatShop1_EMT_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",160000,300,"RPP_Shop_BoatShop1_EMT_ShopOwner","Empty","EMT Boat Shop"]
];
publicVariable "RPP_Shop_BoatShop1_EMT_ShopOwner";

RPP_Shop_Ilegall_Weapons =
[
	["RPP_Skyline_Aug_A1_01_F"],
	["RPP_30Rnd_556x45_Stanag"],
	["RPP_10Rnd_9x39_mag"],
	["RPP_20Rnd_9x39_mag"],
	["RPP_arifle_mas_mp40"],
	["RPP_30Rnd_mas_9x21_Stanag"],
	["RPP_hgun_mas_mp7_F"],
	["RPP_40Rnd_mas_46x30_Mag"],
	["RPP_arifle_mas_ak_74m"],
	["RPP_30Rnd_mas_545x39_mag"],
	["RPP_arifle_mas_akms"],
	["RPP_30Rnd_mas_762x39_mag"],
	["RPP_arifle_mas_bizon"],
	["RPP_64Rnd_mas_9x18_mag"],
	["RPP_arifle_mas_aks74u"],
	["RPP_30Rnd_mas_545x39_mag"],
	["RPP_hgun_mas_uzi_F"],
	["RPP_25Rnd_mas_9x19_Mag"],
	["RPP_hgun_mas_sa61_F"],
	["RPP_20Rnd_mas_765x17_Mag"],
	["RPP_srifle_mas_svd"],
	["RPP_10Rnd_mas_762x54_mag"],
	["RPP_ajx_browning_hp_F"],
	["RPP_16Rnd_9x21_Mag"],
	["RPP_RH_deagle"],
	["RPP_RH_7Rnd_50_AE"],
	["RPP_RH_deagleg"],
	["RPP_RH_7Rnd_50_AE"],
	["RPP_RH_cz75"],
	["RPP_RH_16Rnd_9x19_cz"],
	["RPP_RH_sw659"],
	["RPP_RH_14Rnd_9x19_sw"],
	["RPP_RH_mak"],
	["RPP_RH_8Rnd_9x18_Mak"],
	["RPP_RH_m1911"],
	["RPP_RH_7Rnd_45cal_m1911"],
	["RPP_RH_kimber"],
	["RPP_RH_7Rnd_45cal_m1911"],
	["RPP_RH_kimber_nw"],
	["RPP_RH_7Rnd_45cal_m1911"],
	["RPP_RH_g19"],
	["RPP_RH_17Rnd_9x19_g17"],
	["RPP_RH_g18"],
	["RPP_RH_33Rnd_9x19_g18"],
	["RPP_RH_g17"],
	["RPP_RH_17Rnd_9x19_g17"],
	["RPP_RH_tt33"],
	["RPP_RH_8Rnd_762_tt33"],
	["RPP_RH_mk2"],
	["RPP_RH_10Rnd_22LR_mk2"],
	["RPP_RH_p226"],
	["RPP_RH_15Rnd_9x19_SIG"],
	["RPP_RH_vp70"],
	["RPP_RH_18Rnd_9x19_VP"],
	["RPP_RH_mateba"],
	["RPP_RH_6Rnd_44_Mag"],
	["RPP_RH_python"],
	["RPP_RH_6Rnd_357_Mag"],
	["RPP_RH_mp412"],
	["RPP_RH_6Rnd_357_Mag"],
	["RPP_RH_bull"],
	["RPP_RH_6Rnd_454_Mag"],
	["RPP_RH_ttracker"],
	["RPP_RH_6Rnd_45ACP_Mag"],
	["RPP_RH_fnp45"],
	["RPP_RH_15Rnd_45cal_fnp"],
	["RPP_RH_fn57"],
	["RPP_RH_20Rnd_57x28_FN"],
	["RPP_RH_gsh18"],
	["RPP_RH_18Rnd_9x19_gsh"],
	["RPP_RH_tec9"],
	["RPP_RH_32Rnd_9x19_tec"],
	["RPP_RH_muzi"],
	["RPP_RH_30Rnd_9x19_UZI"],
	["RPP_RH_vz61"],
	["RPP_RH_20Rnd_32cal_vz61"],
	["RPP_optic_AMS"],
	["RPP_optic_mas_Holosight_blk"],
	["RPP_optic_Holosight_smg"],
	["RPP_optic_KHS_blk"],
	["RPP_optic_mas_aim"],
	["RPP_bipod_01_F_blk"],
	["RPP_muzzle_mas_snds_L"],
	["RPP_muzzle_mas_snds_LM"],
	["RPP_muzzle_mas_snds_C"],
	["RPP_muzzle_mas_snds_MP5SD6"],
	["RPP_muzzle_mas_snds_MP7"],
	["RPP_muzzle_mas_snds_M"],
	["RPP_muzzle_mas_snds_Mc"],
	["RPP_muzzle_mas_snds_SM"],
	["RPP_muzzle_mas_snds_SMc"],
	["RPP_muzzle_mas_snds_SH"],
	["RPP_muzzle_mas_snds_SHc"],
	["RPP_muzzle_mas_snds_SV"],
	["RPP_muzzle_mas_snds_SVc"],
	["RPP_muzzle_snds_M"]
];
publicVariable "RPP_Shop_Ilegall_Weapons";
RPP_Shop_Ilegall_Weapons_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",160000,300,"RPP_Shop_Ilegall_Weapons_ShopOwner","Empty","Ilegall Weapons Shop"]
];
publicVariable "RPP_Shop_Ilegall_Weapons_ShopOwner";

RPP_Shop_PistolShop =
[
	//Classname
	["RPP_ajx_browning_hp_F"],
	["RPP_16Rnd_9x21_Mag"],
	["RPP_RH_deagle"],
	["RPP_RH_7Rnd_50_AE"],
	["RPP_RH_deagleg"],
	["RPP_RH_7Rnd_50_AE"],
	["RPP_RH_cz75"],
	["RPP_RH_16Rnd_9x19_cz"],
	["RPP_RH_sw659"],
	["RPP_RH_14Rnd_9x19_sw"],
	["RPP_RH_mak"],
	["RPP_RH_8Rnd_9x18_Mak"],
	["RPP_RH_m1911"],
	["RPP_RH_7Rnd_45cal_m1911"],
	["RPP_RH_kimber"],
	["RPP_RH_7Rnd_45cal_m1911"],
	["RPP_RH_kimber_nw"],
	["RPP_RH_7Rnd_45cal_m1911"],
	["RPP_RH_g19"],
	["RPP_RH_17Rnd_9x19_g17"],
	["RPP_RH_g18"],
	["RPP_RH_33Rnd_9x19_g18"],
	["RPP_RH_g17"],
	["RPP_RH_17Rnd_9x19_g17"],
	["RPP_RH_tt33"],
	["RPP_RH_8Rnd_762_tt33"],
	["RPP_RH_mk2"],
	["RPP_RH_10Rnd_22LR_mk2"],
	["RPP_RH_p226"],
	["RPP_RH_15Rnd_9x19_SIG"],
	["RPP_RH_vp70"],
	["RPP_RH_18Rnd_9x19_VP"],
	["RPP_RH_mateba"],
	["RPP_RH_6Rnd_44_Mag"],
	["RPP_RH_python"],
	["RPP_RH_6Rnd_357_Mag"],
	["RPP_RH_mp412"],
	["RPP_RH_6Rnd_357_Mag"],
	["RPP_RH_bull"],
	["RPP_RH_6Rnd_454_Mag"],
	["RPP_RH_ttracker"],
	["RPP_RH_6Rnd_45ACP_Mag"],
	["RPP_RH_fnp45"],
	["RPP_RH_15Rnd_45cal_fnp"],
	["RPP_RH_fn57"],
	["RPP_RH_20Rnd_57x28_FN"],
	["RPP_RH_gsh18"],
	["RPP_RH_18Rnd_9x19_gsh"]
];
publicVariable "RPP_Shop_PistolShop";
RPP_Shop_PistolShop_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",160000,300,"RPP_Shop_PistolShop_ShopOwner","Empty","Pistol Shop"]
];
publicVariable "RPP_Shop_PistolShop_ShopOwner";

RPP_Shop_GeneralStore =
[
	//Classname
	["RPP_tf_anprc152"],
	["RPP_Release_The_Prisoners_sign"],
	["RPP_sign_Base"],
	["RPP_NewsCam"],
	["RPP_Binocular"]
];
publicVariable "RPP_Shop_GeneralStore";
RPP_Shop_GeneralStore_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",83400,300,"RPP_Shop_GeneralStore_ShopOwner","Empty","Equipment Store"]
];
publicVariable "RPP_Shop_GeneralStore_ShopOwner";

RPP_Shop_ItemShop1 =
[
	//Classname
	["RPP_Bread"],
	["RPP_Apple"],
	["RPP_Water"],
	["RPP_Redbull"],
	["RPP_RifleBag"],
	["RPP_VehicleJack"],
	["RPP_Pickaxe"]
];
publicVariable "RPP_Shop_ItemShop1";
RPP_Shop_ItemShop1_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",76000,1500,"RPP_Shop_ItemShop1_ShopOwner","Empty","Item Shop"]
];
publicVariable "RPP_Shop_ItemShop1_ShopOwner";

RPP_Shop_BlackMarketItems =
[
	//Classname
	["RPP_Bread"],
	["RPP_Apple"],
	["RPP_Water"],
	["RPP_Redbull"],
	["RPP_RifleBag"],
	["RPP_VehicleJack"],
	["RPP_Lockpick"],
	["RPP_CabelCuff"],
	["RPP_LSD"],
	["RPP_Herion"],
	["RPP_Cocaine"],
	["RPP_Weed"]
];
publicVariable "RPP_Shop_BlackMarketItems";
RPP_Shop_BlackMarketItems_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",76000,1500,"RPP_Shop_BlackMarketItems_ShopOwner","Empty","Black Market Item Shop"]
];
publicVariable "RPP_Shop_BlackMarketItems_ShopOwner";

RPP_Shop_FishingTools =
[
	//Classname
	["RPP_FishingPole"]
];
publicVariable "RPP_Shop_FishingTools";
RPP_Shop_FishingTools_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",76000,1500,"RPP_Shop_FishingTools_ShopOwner","Empty","Fishing Tools"]
];
publicVariable "RPP_Shop_FishingTools_ShopOwner";


RPP_Shop_BlueKing =
[
	//Classname
	["RPP_Burger"],
	["RPP_Cola"],
	["RPP_Water"],
	["RPP_Redbull"]
];
publicVariable "RPP_Shop_BlueKing";
RPP_Shop_BlueKing_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",65000,1000,"RPP_Shop_BlueKing_ShopOwner","Empty","Blue King"]
];
publicVariable "RPP_Shop_BlueKing_ShopOwner";

RPP_Shop_RedKing =
[
	//Classname
	["RPP_Burger"],
	["RPP_Cola"],
	["RPP_Water"],
	["RPP_Redbull"]
];
publicVariable "RPP_Shop_RedKing";
RPP_Shop_RedKing_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",65000,1000,"RPP_Shop_RedKing_ShopOwner","Empty","Red King"]
];
publicVariable "RPP_Shop_RedKing_ShopOwner";


RPP_Shop_GasStation1 =
[
	//Classname
	["RPP_Donut"],
	["RPP_Repairkit"],
	["RPP_Medkit"],
	["RPP_Water"]
];
publicVariable "RPP_Shop_GasStation1";
RPP_Shop_GasStation1_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",70000,1000,"RPP_Shop_GasStation1_ShopOwner","Empty","GasStation Shop"]
];
publicVariable "RPP_Shop_GasStation1_ShopOwner";

RPP_Shop_AirShop =
[
	//Classname
	["RPP_C_Heli_Light_01_civil_F"],
	["RPP_dezkit_b206_ls"],
	["RPP_dezkit_b206_hs"],
	["RPP_dezkit_b206_fl"],
	["RPP_dezkit_b206_news"]
];
publicVariable "RPP_Shop_AirShop";
RPP_Shop_AirShop_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",145000,1000,"RPP_Shop_AirShop_ShopOwner","Empty","Air Shop"]
];
publicVariable "RPP_Shop_AirShop_ShopOwner";

RPP_Shop_Ilegall_Helis =
[
	["RPP_O_Heli_Light_02_unarmed_F"],
	["RPP_I_Heli_Transport_02_F"]
];
publicVariable "RPP_Shop_Ilegall_Helis";
RPP_Shop_Ilegall_Helis_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",160000,300,"RPP_Shop_Ilegall_Helis_ShopOwner","Empty","Ilegall Helis Shop"]
];
publicVariable "RPP_Shop_Ilegall_Helis_ShopOwner";

RPP_Shop_ProbationaryDeputy =
[
	["RPP_tf_anprc152"],
	["RPP_A3L_EC_SOCDT"],
	["RPP_TRYK_V_tacv1_SHERIFF_BK"],
	["RPP_AM_PoliceBelt"],
	["RPP_prpl_benelli_pgs_rail"],
	["RPP_RH_SFM952V"],
	["RPP_Campaign_Hat_Washedout"],
	["RPP_prpl_8Rnd_12Gauge_Pellets"],
	["RPP_RH_g19"],
	["RPP_RH_M6X"],
	["RPP_RH_17Rnd_9x19_g17"],
	["RPP_RPP_RPP_X26Taser_F"],
	["RPP_RPP_X26Taser_cartridge"]
];
publicVariable "RPP_Shop_ProbationaryDeputy";
RPP_Shop_ProbationaryDeputy_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",160000,300,"RPP_Shop_ProbationaryDeputy_ShopOwner","Empty","Probationary Deputy Shop"]
];
publicVariable "RPP_Shop_ProbationaryDeputy_ShopOwner";

RPP_Shop_Deputy =
[
	["RPP_A3L_EC_SOCDT"],
	["RPP_TRYK_V_tacv1_SHERIFF_BK"],
	["RPP_AM_PoliceBelt"],
	["RPP_prpl_benelli_pgs_rail"],
	["RPP_RH_SFM952V"],
	["RPP_Campaign_Hat_Washedout"],
	["RPP_prpl_8Rnd_12Gauge_Pellets"],
	["RPP_RH_g19"],
	["RPP_RH_M6X"],
	["RPP_RH_17Rnd_9x19_g17"],
	["RPP_RPP_RPP_X26Taser_F"],
	["RPP_RPP_X26Taser_cartridge"]
];
publicVariable "RPP_Shop_Deputy";
RPP_Shop_Deputy_ShopOwner =
[	//name,price,stock,var,id,shopname

	["Empty",160000,300,"RPP_Shop_Deputy_ShopOwner","Empty","Deputy Shop"]
];
publicVariable "RPP_Shop_Deputy_ShopOwner";

RPP_Shop_Senior_Deputy =
[
	["RPP_A3L_EC_SOOFC"],
	["RPP_TRYK_V_tacv1_SHERIFF_BK"],
	["RPP_AM_PoliceBelt"],
	["RPP_prpl_benelli_pgs_rail"],
	["RPP_RH_SFM952V"],
	["RPP_Campaign_Hat_Washedout"],
	["RPP_prpl_8Rnd_12Gauge_Pellets"],
	["RPP_RH_g19"],
	["RPP_RH_M6X"],
	["RPP_RH_17Rnd_9x19_g17"],
	["RPP_RPP_RPP_X26Taser_F"],
	["RPP_RPP_X26Taser_cartridge"]
];
publicVariable "RPP_Shop_Senior_Deputy";
RPP_Shop_Senior_Deputy_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",160000,300,"RPP_Shop_Senior_Deputy_ShopOwner","Empty","Senior Deputy Shop"]
];
publicVariable "RPP_Shop_Senior_Deputy_ShopOwner";

RPP_Shop_Corporal =
[
	["RPP_A3L_EC_SOCPL"],
	["RPP_RH_M4A6"],
	["RPP_RH_30Rnd_68x43_FMJ"],
	["RPP_TRYK_V_tacv1_SHERIFF_BK"],
	["RPP_AM_PoliceBelt"],
	["RPP_prpl_benelli_pgs_rail"],
	["RPP_Benelli Shotgun Hard Stock"],
	["RPP_RH_SFM952V"],
	["RPP_Campaign_Hat_Washedout"],
	["RPP_prpl_8Rnd_12Gauge_Pellets"],
	["RPP_RH_g19"],
	["RPP_RH_M6X"],
	["RPP_RH_17Rnd_9x19_g17"],
	["RPP_RPP_RPP_X26Taser_F"],
	["RPP_RPP_X26Taser_cartridge"]
];
publicVariable "RPP_Shop_Corporal";
RPP_Shop_Corporal_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",160000,300,"RPP_Shop_Corporal_ShopOwner","Empty","Corporal Shop"]
];
publicVariable "RPP_Shop_Corporal_ShopOwner";


RPP_Shop_Sergeant =
[
	["RPP_A3L_EC_SOSGT"],
	["RPP_A3L_ftovest2"],
	["RPP_RH_M4A6"],
	["RPP_RH_30Rnd_68x43_FMJ"],
	["RPP_TRYK_V_tacv1_SHERIFF_BK"],
	["RPP_AM_PoliceBelt"],
	["RPP_prpl_benelli_pgs_rail"],
	["RPP_Benelli Shotgun Hard Stock"],
	["RPP_RH_SFM952V"],
	["RPP_Campaign_Hat_Washedout"],
	["RPP_prpl_8Rnd_12Gauge_Pellets"],
	["RPP_RH_g19"],
	["RPP_RH_M6X"],
	["RPP_RH_17Rnd_9x19_g17"],
	["RPP_RPP_RPP_X26Taser_F"],
	["RPP_RPP_X26Taser_cartridge"]
];
publicVariable "RPP_Shop_Sergeant";
RPP_Shop_Sergeant_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",160000,300,"RPP_Shop_Sergeant_ShopOwner","Empty","Sergeant Shop"]
];
publicVariable "RPP_Shop_Sergeant_ShopOwner";

RPP_Shop_Lieutenant =
[
	["RPP_A3L_EC_SOLT"],
	["RPP_RH_M4A6"],
	["RPP_RH_30Rnd_68x43_FMJ"],
	["RPP_TRYK_V_tacv1_SHERIFF_BK"],
	["RPP_AM_PoliceBelt"],
	["RPP_prpl_benelli_pgs_rail"],
	["RPP_Benelli Shotgun Hard Stock"],
	["RPP_RH_SFM952V"],
	["RPP_Campaign_Hat_Washedout"],
	["RPP_prpl_8Rnd_12Gauge_Pellets"],
	["RPP_RH_g19"],
	["RPP_RH_M6X"],
	["RPP_RH_17Rnd_9x19_g17"],
	["RPP_RPP_RPP_X26Taser_F"],
	["RPP_RPP_X26Taser_cartridge"]
];
publicVariable "RPP_Shop_Lieutenant";
RPP_Shop_Lieutenant_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",160000,300,"RPP_Shop_Lieutenant_ShopOwner","Empty","Lieutenant Shop"]
];
publicVariable "RPP_Shop_Lieutenant_ShopOwner";

RPP_Shop_Captain =
[
	["RPP_A3L_EC_SOCPT"],
	["RPP_RH_M4A6"],
	["RPP_RH_30Rnd_68x43_FMJ"],
	["RPP_TRYK_V_tacv1_SHERIFF_BK"],
	["RPP_AM_PoliceBelt"],
	["RPP_prpl_benelli_pgs_rail"],
	["RPP_Benelli Shotgun Hard Stock"],
	["RPP_RH_SFM952V"],
	["RPP_Campaign_Hat_Washedout"],
	["RPP_prpl_8Rnd_12Gauge_Pellets"],
	["RPP_RH_g19"],
	["RPP_RH_M6X"],
	["RPP_RH_17Rnd_9x19_g17"],
	["RPP_RPP_RPP_X26Taser_F"],
	["RPP_RPP_X26Taser_cartridge"]
];
publicVariable "RPP_Shop_Captain";
RPP_Shop_Captain_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",160000,300,"RPP_Shop_Captain_ShopOwner","Empty","Captain Shop"]
];
publicVariable "RPP_Shop_Captain_ShopOwner";

RPP_Shop_Sheriff =
[
	["RPP_A3L_EC_SOSHERIFF"],
	["RPP_TFO_TACVEST_SHERIFF"],
	["RPP_SO_SHERIFFGRN"],
	["RPP_RH_M4A6"],
	["RPP_RH_30Rnd_68x43_FMJ"],
	["RPP_TRYK_V_tacv1_SHERIFF_BK"],
	["RPP_AM_PoliceBelt"],
	["RPP_prpl_benelli_pgs_rail"],
	["RPP_Benelli Shotgun Hard Stock"],
	["RPP_RH_SFM952V"],
	["RPP_Campaign_Hat_Washedout"],
	["RPP_prpl_8Rnd_12Gauge_Pellets"],
	["RPP_RH_g19"],
	["RPP_RH_M6X"],
	["RPP_RH_17Rnd_9x19_g17"],
	["RPP_RPP_RPP_X26Taser_F"],
	["RPP_RPP_X26Taser_cartridge"]
];
publicVariable "RPP_Shop_Sheriff";
RPP_Shop_Sheriff_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",160000,300,"RPP_Shop_Sheriff_ShopOwner","Empty","Sheriff Shop"]
];
publicVariable "RPP_Shop_Sheriff_ShopOwner";

RPP_Shop_SERT =
[
	["RH_kimber_nw"],
	["RPP_RH_7Rnd_45cal_m1911"],
	["RPP_TRYK_shirts_DENIM_BWH"],
	["RPP_5Rnd_mas_762x51_Stanag"],
	["RPP_srifle_mas_m24"],
	["RPP_optic_LRPS"],
	["RPP_RH_x300"],
	["RPP_optic_mas_Holosight_blk"],
	["RPP_Fox_Sert"],
	["RPP_30Rnd_mas_556x45_Stanag"],
	["RPP_arifle_mas_l119c"],
	["RPP_acc_flashlight"],
	["RPP_hlc_30rnd_556x45_SOST"],
	["RPP_sert_uni1"],
	["RPP_hlc_30rnd_556x45_EPR"],
	["RPP_RH_15Rnd_9x19_SIG"],
	["RPP_TRYK_V_tacv1LC_SRF_OD"],
	["RPP_TRYK_H_PASGT_OD"],
	["RPP_G_Bandanna_oli"],
	["RPP_hlc_rifle_CQBR"],
	["RPP_RH_SFM952V"],
	["RPP_RH_compm4s"],
	["RPP_RH_p226"],
	["RPP_FHQ_optic_ACOG"],
	["RPP_hlc_rifle_samr2"],
	["RPP_TRYK_shirts_DENIM_RED2"],
	["RPP_SERT_FULL_VEST"],
	["RPP_SO_SERTWHITEBLKBK"],
	["RPP_RPP_RPP_X26Taser_F"],
	["RPP_RPP_X26Taser_cartridge"]
];
publicVariable "RPP_Shop_SERT";
RPP_Shop_SERT_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",160000,300,"RPP_Shop_SERT_ShopOwner","Empty","SERT Shop"]
];
publicVariable "RPP_Shop_SERT_ShopOwner";

RPP_Shop_PoliceVehicle =
[
	//Classname
	["RPP_A3L_Taurus_Sheriff_LB"],
	["RPP_A3L_TaurusUC_Black"],
	["RPP_A3L_Taurus_Sheriff_Slick"],
	["RPP_A3L_CVPI_Sheriff_LB"],
	["RPP_A3L_CVPIUC_Black"],
	["RPP_A3L_Charger_Patrol"],
	["RPP_A3L_ChargerUC"],
	["RPP_A3L_Charger_SERTGrey"],
	["RPP_A3L_GrandCaravanUC"],
	["RPP_A3L_ChargerUC_Black_New"],
	["RPP_AM_Escalade_SERT"],
	["RPP_A3L_Suburban_UM_Black"],
	["RPP_DAR_TahoeUM"],
	["RPP_DAR_ExplorerPolice"],
	["RPP_DAR_SwatPolice"],
	["RPP_Quadbike"]
];
publicVariable "RPP_Shop_PoliceVehicle";
RPP_Shop_PoliceVehicle_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",225000,2000,"RPP_Shop_PoliceVehicle_ShopOwner","Empty","Police Vehicle Shop"]
];
publicVariable "RPP_Shop_PoliceVehicle_ShopOwner";

RPP_Shop_PoliceAir =
[
	//Classname
	["RPP_C_Heli_Light_01_civil_F"],
	["RPP_dezkit_b206_police"],
	["RPP_C_Heli_light_01_sheriff_F"]
];
publicVariable "RPP_Shop_PoliceAir";
RPP_Shop_PoliceAir_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",225000,2000,"RPP_Shop_PoliceAir_ShopOwner","Empty","Police Air Shop"]
];
publicVariable "RPP_Shop_PoliceAir_ShopOwner";

RPP_Shop_VehEMT =
[
	//Classname
	["RPP_DodgeChargerSRT8_12_EMT"],
	["RPP_DodgeCharger15_EMT"]
];
publicVariable "RPP_Shop_VehEMT";
RPP_Shop_VehEMT_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",225000,2000,"RPP_Shop_VehEMT_ShopOwner","Empty","EMT Vehicle Shop"]
];
publicVariable "RPP_Shop_VehEMT_ShopOwner";

RPP_Shop_AirEMT =
[
	//Classname
	["RPP_dezkit_b206_ems"],
	["RPP_dezkit_b206_rescue"]
];
publicVariable "RPP_Shop_AirEMT";
RPP_Shop_AirEMT_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",225000,2000,"RPP_Shop_AirEMT_ShopOwner","Empty","EMT Air Shop"]
];
publicVariable "RPP_Shop_AirEMT_ShopOwner";

RPP_Shop_EMTCloth =
[
	//Classname
	["RPP_EMT_emt_uniform"],
	["RPP_EMT_emt_cap"],
	["RPP_Invisible_Carryall"]
];
publicVariable "RPP_Shop_EMTCloth";
RPP_Shop_EMTCloth_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",85000,2000,"RPP_Shop_EMTCloth_ShopOwner","Empty","EMT Clothing Shop"]
];
publicVariable "RPP_Shop_EMTCloth_ShopOwner";

RPP_Shop_EMTItems =
[
	//Classname
	["RPP_EMTKit"],
	["RPP_Repairkit"],
	["RPP_Medkit"],
	["RPP_Donut"],
	["RPP_Bread"],
	["RPP_Water"]
];
publicVariable "RPP_Shop_EMTItems";
RPP_Shop_EMTItems_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",85000,2000,"RPP_Shop_EMTItems_ShopOwner","Empty","EMT Item Shop"]
];
publicVariable "RPP_Shop_EMTItems_ShopOwner";

RPP_Shop_PoliceItem =
[
	//Classname
	["RPP_PoliceKit"],
	["RPP_Handcuff"],
	["RPP_RifleBag"],
	["RPP_Donut"],
	["RPP_Repairkit"],
	["RPP_Medkit"],
	["RPP_Water"],
	["RPP_VehicleJack"],
	["RPP_Lockpick"]
];
publicVariable "RPP_Shop_PoliceItem";
RPP_Shop_PoliceItem_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",150000,2000,"RPP_Shop_PoliceItem_ShopOwner","Empty","Police Item Shop"]
];
publicVariable "RPP_Shop_PoliceItem_ShopOwner";

RPP_Shop_PoliceWeapon =
[
	//Classname
	["RPP_tf_anprc152"],
	["RPP_V_PlateCarrierSpec_rgr"],
	["RPP_Binocular"],
	["RPP_NVGoggles"],
	["RPP_RPP_X26Taser_F"],
	["RPP_X26Taser_cartridge"],
	["RPP_RH_m9"],
	["RPP_RH_15Rnd_9x19_M9"],
	["RPP_RH_usp"],
	["RPP_RH_12Rnd_45cal_usp"],
	["RPP_RH_uspm"],
	["RPP_RH_16Rnd_40cal_usp"],
	["RPP_arifle_mas_hk416"],
	["RPP_arifle_mas_m4"],
	["RPP_arifle_mas_l119"],
	["RPP_arifle_mas_g36c"],
	["RPP_arifle_mas_mk16"],
	["RPP_30Rnd_mas_556x45_Stanag"],
	["RPP_srifle_mas_ebr"],
	["RPP_20Rnd_mas_762x51_Stanag"],
	["RPP_srifle_mas_lrr"],
	["RPP_10Rnd_mas_338_Stanag"],
	["RPP_TRYK_R_CAP_BLK"],
	["RPP_Invisible_Carryall"],
	["RPP_LBTH_police"],
	["RPP_LBT_police"],
	["RPP_belt_police"],
	["RPP_beltradio_police"],
	["RPP_TRYK_V_PlateCarrier_POLICE"],
	["RPP_NVChainBadge"],
	["RPP_TRYK_G_bala_wh_NV"],
	["RPP_TRYK_balaclava_BLACK_NV"],
	["RPP_TRYK_US_ESS_Glasses_Cover"],
	["RPP_TRYK_SPgear_PHC1_NV"],
	["RPP_TRYK_SPgear_PHC2_NV"],
	["RPP_TRYK_HRPIGEAR_NV"],
	["RPP_G_Aviator"],
	["RPP_G_Spectacles_Tinted"],
	["RPP_TRYK_kio_balaclava_BLK"],
	["RPP_TRYK_kio_balaclava_BLK_ear"],
	["RPP_TRYK_kio_balaclava_ESS"],
	["RPP_TRYK_r_cap_blk_Glasses"],
	["RPP_TRYK_r_cap_od_Glasses"],
	["RPP_TRYK_r_cap_tan_Glasses"],
	["RPP_BetaShirt_Polo"],
	["RPP_ILoveRPP_Polo"],
	["RPP_optic_AMS"],
	["RPP_optic_mas_Holosight_blk"],
	["RPP_optic_Holosight_smg"],
	["RPP_optic_KHS_blk"],
	["RPP_optic_mas_DMS"],
	["RPP_optic_mas_aim"],
	["RPP_bipod_01_F_blk"],
	["RPP_muzzle_mas_snds_L"],
	["RPP_muzzle_mas_snds_LM"],
	["RPP_muzzle_mas_snds_C"],
	["RPP_muzzle_mas_snds_M"],
	["RPP_muzzle_mas_snds_Mc"],
	["RPP_muzzle_mas_snds_SM"],
	["RPP_muzzle_mas_snds_SMc"],
	["RPP_muzzle_mas_snds_SH"],
	["RPP_muzzle_mas_snds_SHc"],
	["RPP_muzzle_mas_snds_SV"],
	["RPP_muzzle_mas_snds_SVc"],
	["RPP_muzzle_snds_M"],
	["RPP_RH_x300"],
	["RPP_acc_flashlight"]
];
publicVariable "RPP_Shop_PoliceWeapon";
RPP_Shop_PoliceWeapon_ShopOwner =
[	//name,price,stock,var,id,shopname
	["Empty",354000,2500,"RPP_Shop_PoliceWeapon_ShopOwner","Empty","Police Weapon Shop"]
];
publicVariable "RPP_Shop_PoliceWeapon_ShopOwner";

["RPP_Config_ShopManager", {
	RPP_ShopCommands =
	[
		["Buy Shop","RPP_ShopManager_BuyShop",0],
		["Add 150 Stocks","RPP_ShopManager_StockShop",3500]
	];
	publicVariable "RPP_ShopCommands";
}] call RPP_Function;
publicVariable "RPP_Config_ShopManager";

[] call RPP_Config_ShopManager;

["RPP_ShopCartVeh_Add", {
	private ["_itemClass","_amount"];
	_itemClass = _this select 0;
	_amount = _this select 1;

	[RPP_Shopping_Cart, _itemClass, _amount] call BIS_fnc_addToPairs;
}] call RPP_Function;
publicVariable "RPP_ShopCartVeh_Add";

["RPP_ShopCart_Count", {
	private ["_itemClass","_return"];
	_itemClass = _this select 0;

	_return = [RPP_Shopping_Cart, _itemClass, 0] call BIS_fnc_getFromPairs;

	_return;
}] call RPP_Function;
publicVariable "RPP_ShopCart_Count";

["RPP_ShopCart_Remove", {
	private ["_itemClass","_amount","_price","_index","_i"];
	_itemClass = _this select 0;
	_amount = _this select 1;
	_price = _this select 2;

	_index = [RPP_Shopping_Cart, _itemClass, -_amount] call BIS_fnc_addToPairs;
	RPP_Shopping_Price = RPP_Shopping_Price - _price;

	if([_itemClass] call RPP_ShopCart_Count < 1) then {
		_i = 0;
		{
			if(_itemClass == _x select 0) then {
				_index = _i;
			};
			_i = _i + 1;
		} forEach RPP_Shopping_Cart;
		RPP_Shopping_Cart set [_index, "REMOVE"];
		RPP_Shopping_Cart = RPP_Shopping_Cart - ["REMOVE"];
	};
}] call RPP_Function;
publicVariable "RPP_ShopCart_Remove";
