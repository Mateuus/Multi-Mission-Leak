class WeaponShops {
	//Armory Shops
	class gun {
		name = "Vendeur d'armes";
		side = "civ";
		license = "gun";
		level[] = { "", "", -1, "" };
		items[] = {
			{ "hgun_Pistol_Signal_F", "", 32000 }, //signal pistol
			{ "hgun_Rook40_F", "", 6500, 500 },
			{ "hgun_P07_F", "", 6500, 500 },
			{ "hgun_Pistol_heavy_02_F", "", 9850, -1 },
			{ "hgun_Pistol_heavy_01_F", "", 12850, -1 },
			{ "arifle_SDAR_F", "", 29850, -1 },
			{ "hgun_ACPC2_F", "", 11500, -1 },
			{ "hgun_PDW2000_F", "", 20000, -1 },
			{ "Binocular", "", 150, -1 },
			{ "ItemGPS", "", 100, 45 },
			{ "ItemMap", "", 50, 35 },
			{ "ItemCompass", "", 50, 25 },
			{ "ItemWatch", "", 50, -1 },
			{ "ToolKit", "", 7500, 75 },
			{ "FirstAidKit", "", 150, 65 },
			{ "NVGoggles", "", 2000, 980 },
			{ "Chemlight_red", "", 300, -1 },
			{ "Chemlight_yellow", "", 300, 50 },
			{ "Chemlight_green", "", 300, 50 },
			{ "Chemlight_blue", "", 300, 50 }
		};
		mags[] = {
			{ "6Rnd_45ACP_Cylinder", "", 150 },
			{ "30Rnd_556x45_Stanag", "", 200 },
			{ "9Rnd_45ACP_Mag", "", 135 },
			{ "11Rnd_45ACP_Mag", "", 145 },
			{ "16Rnd_9x21_Mag", "", 75 },
			{ "30Rnd_9x21_Mag", "", 225 },
			{ "20Rnd_556x45_UW_mag", "", 225 },
			{ "30Rnd_556x45_Stanag_Tracer_Red", "", 225 },
			{ "30Rnd_556x45_Stanag_Tracer_Green", "", 225 },
			{ "30Rnd_556x45_Stanag_Tracer_Yellow", "", 225 },
			{ "6Rnd_GreenSignal_F", "", 225 },
			{ "6Rnd_RedSignal_F", "", 225 }
		};
		accs[] = {
            { "optic_ACO_grn_smg", "", 2500, 250 },
			{ "optic_Arco", "", 2500, 250 },
			{ "optic_MRD", "", 2500, 250 },
			{ "optic_Yorris", "Yorris Rook40", 2500, 250 },
			{ "optic_Holosight_smg", "Holosight PDW2000", 1500 },
			{ "acc_flashlight", "", 800 },//lampe
			{ "acc_pointer_IR", "", 1500 },
			{ "", "-------------------------------------------------", 0, 0 },
			{ "muzzle_snds_acp", "Silencieux .45", 2500 },
			{ "muzzle_snds_L", "Silencieux 9 mm", 2500 },
			{ "muzzle_snds_M", "Silencieux 5.56 mm", 2500 },
			{ "muzzle_snds_H", "Silencieux 6.5 mm", 2500 },
			{ "muzzle_snds_B", "Silencieux 7.62 mm", 2500 }
        };
	};

	class rebel {
		name = "Vendeur d'armes";
		side = "civ";
		license = "rebel";
		level[] = { "", "", -1, "" };
		items[] = {
			{ "", "----ARMES DE POING----", 0, 0 },
			{ "hgun_Pistol_Signal_F", "", 32000 }, //signal pistol
			{ "hgun_P07_khk_F", "", 14500 }, //P07 9mm (Khaki)
			{ "hgun_Pistol_01_F", "", 10000 }, //PM 9
			{ "SMG_01_F", "", 47500 }, //vermin
			{ "SMG_05_F", "", 35000 }, // Protector 9mm
			{ "", "----FUSILS ASSAULT----", 0, 0 },
			{ "arifle_SDAR_F", "", 60000 }, //sdar
			{ "arifle_TRG20_F", "", 110000 }, //trg20
			{ "arifle_TRG21_F", "", 140000 }, //trg21
			{ "arifle_AKS_F","",125000},// AKS74U
			{ "arifle_Katiba_F", "", 270000 }, //katiba
			{ "arifle_ARX_ghex_F", "", 300000 }, //Type 115 6.5 mm (Green Hex)
			{ "arifle_ARX_hex_F", "", 300000 }, //Type 115 6.5 mm (Hex)
			{ "arifle_MXC_khk_F", "", 350000}, //MXC
			{ "arifle_MX_khk_F", "", 300000}, //MX 6.5 mm (Khaki)
			{ "arifle_MXM_khk_F", "", 375000}, //MXM 6.5 mm (Khaki)
			{ "arifle_SPAR_01_khk_F", "", 180000 }, //SPAR-16 5.56 mm (Khaki)
			{ "arifle_AKM_F","",350000},// AKM
			{ "arifle_AK12_F","",550000},// ak12
			{ "", "----FUSILS DE PRECISION----", 0, 0 },
			{ "srifle_DMR_07_ghex_F", "", 350000}, //CMR-76 6.5 mm (Green Hex)
			{ "srifle_DMR_07_hex_F", "", 350000}, //CMR-76 6.5 mm (Hex)
			{ "srifle_DMR_06_camo_F", "", 450000}, //MK14
			{ "srifle_DMR_03_woodland_F", "", 500000}, //mk1 EMR
			{ "srifle_DMR_03_multicam_F", "", 500000},//mk1 EMR
			{ "srifle_DMR_03_khaki_F", "", 500000},//mk1 EMR
			{ "srifle_EBR_F", "", 500000 }, //Mk18 ABR 7.62 mm
			{ "arifle_SPAR_03_khk_F", "", 650000}, //spar 17
			{ "arifle_SPAR_03_snd_F", "", 650000}, //spar 17 camo
			{ "srifle_DMR_01_F", "", 400000 }, //rahim
			{ "srifle_DMR_02_camo_F", "", 735000 }, //MAR-10
			{ "srifle_DMR_05_hex_F", "", 1200000 }, // Cyrus 9.3mm
			{ "srifle_DMR_05_tan_f", "", 1200000 }, // Cyrus 9.3mm
			{ "srifle_LRR_tna_F", "", 1500000 }, // M320 .408mm
			{ "srifle_GM6_ghex_F", "", 2000000 }, // Lynx 12.7mm
			{ "", "----ARMES LOURDES----", 0, 0 },
			{ "LMG_03_F", "", 650000 }, //LIM-85 5.56
			{ "arifle_MX_SW_F", "", 800000}, //MX SW 6.5 mm (Beige)
			{ "arifle_SPAR_02_snd_F", "", 450000}, //spar 16 s
			{ "LMG_Mk200_F", "", 850000 }, //mk200
			{ "LMG_Zafir_F", "", 1200000 }, //zaphir
			{ "", "-------------------------------------------------", 0, 0 },
			{ "Rangefinder", "", 150, -1 },
			{ "Binocular", "", 150, -1 },
			{ "ItemGPS", "", 100, 45 },
			{ "ItemRadio", "", 100, 45 },
			{ "ItemMap", "", 50, 35 },
			{ "ItemCompass", "", 50, 25 },
			{ "ItemWatch", "", 50, -1 },
			{ "ToolKit", "", 7500, 75 },
			{ "FirstAidKit", "", 150, 65 },
			{ "NVGoggles", "", 3000, 980 },
			{ "NVGoggles_tna_F", "", 4500, 1980 },
			{ "Chemlight_red", "", 300, 50 },
			{ "Chemlight_yellow", "", 300, 50 },
			{ "Chemlight_green", "", 300, 50 },
			{ "Chemlight_blue", "", 300, 50 },
			{ "SmokeShell", "", 3000, 50 },
			{ "SmokeShellYellow", "", 2000, 500 },
			{ "SmokeShellGreen", "", 2000, 500 },
			{ "SmokeShellRed", "", 2000, 500 },
			{ "SmokeShellPurple", "", 2000, 500 },
			{ "SmokeShellOrange", "", 2000, 500 },
			{ "SmokeShellBlue", "", 2000, 500 },
			{ "MiniGrenade", "", 800000, 100000 }

		};
		mags[] = {
			{"16Rnd_9x21_Mag", "", 60 }, //p07
			{"30Rnd_9x21_Mag", "", 60 }, //P07
			{"10Rnd_9x21_Mag", "", 60 }, //Pm9
			{"6Rnd_45ACP_Cylinder", "", 60 }, //zubr
			{"30Rnd_45ACP_Mag_SMG_01", "", 300 }, //vermin
			{"30Rnd_556x45_Stanag", "", 200 }, //sdar
			{"20Rnd_762x51_Mag", "", 200 }, //mk18
			{"10Rnd_762x54_Mag", "", 100 }, //rahim
			{"150Rnd_762x54_Box", "", 1500 }, //zaphir
			{"150Rnd_762x54_Box_Tracer", "", 1900 }, //zaphir
			{"200Rnd_65x39_cased_Box", "", 2000 }, //mk200
			{"200Rnd_65x39_cased_Box_Tracer", "", 2500 }, //mk200
			{"100Rnd_65x39_caseless_mag_Tracer", "", 2500 }, //mx sw
			{"30Rnd_545x39_Mag_F","",500},
			{"150Rnd_556x45_Drum_Mag_F","",500},
			{"150Rnd_556x45_Drum_Mag_Tracer_F","",1500},//Chargeur SPAR 16s
			{"200Rnd_556x45_Box_F","",500},
			{"200Rnd_556x45_Box_Red_F","",700},
			{"200Rnd_556x45_Box_Tracer_F","",1500},
			{"200Rnd_556x45_Box_Tracer_Red_F","",1500},
			{"20Rnd_650x39_Cased_Mag_F","",500},
			{"30Rnd_545x39_Mag_Green_F","",500},
			{"30Rnd_545x39_Mag_Tracer_F","",1500},
			{"30Rnd_545x39_Mag_Tracer_Green_F","",1500},
			{"30Rnd_556x45_Stanag_green","",500},
			{"30Rnd_556x45_Stanag_red","",500},
			{"30Rnd_556x45_Stanag_Tracer_Green","",1500},
			{"30Rnd_556x45_Stanag_Tracer_Red","",1500},
			{"30Rnd_556x45_Stanag_Tracer_Yellow","",1500},
			{"10Rnd_338_Mag","",800},
			{"30Rnd_580x42_Mag_F","",500},
			{"30Rnd_580x42_Mag_Tracer_F","",1500},
			{"100Rnd_580x42_Mag_F","",2500},
			{"100Rnd_580x42_Mag_Tracer_F","",4500},
			{"30Rnd_65x39_caseless_green_mag_Tracer","",1500},
			{"30Rnd_762x39_Mag_F","",500},
			{"30Rnd_762x39_Mag_Green_F","",500},
			{"30Rnd_762x39_Mag_Tracer_F","",1500},
			{"30Rnd_762x39_Mag_Tracer_Green_F","",1500},
			{"30Rnd_9x21_Mag_SMG_02","",500},
			{"30Rnd_9x21_Mag_SMG_02_Tracer_Green","",1500},
			{"30Rnd_9x21_Mag_SMG_02_Tracer_Red","",1500},
			{"30Rnd_9x21_Mag_SMG_02_Tracer_Yellow","",1500},
			{"30Rnd_65x39_caseless_green", "", 300 }, //katiba
			{"6Rnd_GreenSignal_F", "", 225 },
			{"6Rnd_RedSignal_F", "", 225 },
			{"30Rnd_65x39_caseless_mag", "", 1000 },
			{"30Rnd_65x39_caseless_mag_Tracer", "", 1500 },
			{"5Rnd_127x108_Mag", "", 1200 }, // Lynx 12.7mm
			{"10Rnd_93x64_DMR_05_Mag", "", 1400 }, // Cyrus 9.3mm
			{"7Rnd_408_Mag", "", 1400 } // M320 .408mm
		};
		accs[] = {
			{ "optic_Yorris", "", 2000 },//zubr
			{ "optic_Holosight", "", 5000 },
			{ "optic_ACO_grn_smg", "", 5000 },
			{ "optic_Aco_smg", "", 5000 },
			{ "optic_ACO_grn", "", 5000 },
			{ "optic_Aco", "", 5000 },
			{ "optic_MRCO", "", 7500 },
			{ "optic_Hamr", "", 7500 },
			{ "optic_Hamr_khk_F", "", 7900 },
			{ "optic_Arco", "", 7500 },
			{ "optic_Arco_blk_F", "", 7900 },
			{ "optic_DMS_ghex_F", "", 7900 },
			{ "optic_DMS", "", 10000 },
			{ "optic_NVS", "", 12000 },
			{ "optic_SOS", "", 38700 },
			{ "optic_SOS_khk_F", "", 42300 },
			{ "optic_AMS", "", 27500 },
			{ "optic_AMS_khk", "", 27500 },
			{ "optic_KHS_blk", "", 37500 },
			{ "optic_KHS_hex", "", 37500 },
			{ "optic_KHS_old", "", 37500 },
			{ "optic_KHS_tan", "", 37500 },
			{ "optic_ERCO_blk_F", "", 20000 },
			{ "optic_ERCO_khk_F", "", 7900 },
			{ "optic_Holosight_blk_F", "", 7900 },
			{ "optic_Holosight_khk_F", "", 7900 },
			{ "optic_LRPS_ghex_F", "", 7900 },
			{ "optic_LRPS_tna_F", "", 7900 },
			{ "acc_flashlight", "", 2000 },//lampe
			{ "acc_pointer_IR", "", 2000 },//pointer ir
			{ "", "-------------------------------------------------", 0, 0 },
			{ "muzzle_snds_acp", "Silencieux .45", 2500 },
			{ "muzzle_snds_L", "Silencieux 9 mm", 2500 },
			{ "muzzle_snds_93mmg", "Silencieux 9.3 mm Noir", 2500 },
			{ "muzzle_snds_93mmg_tan", "Silencieux 9.3 mm Tan", 2500 },
			{ "muzzle_snds_M", "Silencieux 5.56 mm", 2500 },
			{ "muzzle_snds_58_wdm_F", "", 2700 },
			{ "muzzle_snds_H", "Silencieux 6.5 mm", 2500 },
			{ "muzzle_snds_65_TI_blk_F", "", 2700 },
			{ "muzzle_snds_65_TI_ghex_F", "", 4700 },
			{ "muzzle_snds_65_TI_hex_F", "", 4700 },
			{ "muzzle_snds_338_green", "Silencieux .338 mm", 2500 },
			{ "muzzle_snds_338_black", "Silencieux .338 mm", 2500 },
			{ "muzzle_snds_B", "Silencieux 7.62 mm", 2500 },
			{ "muzzle_snds_B_khk_F", "Silencieux 7.62 mm", 2500 },
			{ "", "-------------------------------------------------", 0, 0 },
			{ "bipod_01_F_mtp", "", 1000 },
			{ "bipod_01_F_khk", "", 1100 },
			{ "bipod_01_F_blk", "", 1000 },
			{ "bipod_02_F_tan", "", 1000 },
			{ "bipod_02_F_hex", "", 1000 },
			{ "bipod_02_F_blk", "", 1000 },
			{ "bipod_03_F_oli", "", 1000 },
			{ "bipod_03_F_blk", "", 1000 }
        };
	};

	class gang {
		name = "Armurerie du Repère";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = {
			{ "hgun_Rook40_F", "", 6500, 500 },
			{ "hgun_P07_F", "", 6500, 500 },
			{ "hgun_Pistol_heavy_02_F", "", 9850, -1 },
			{ "hgun_ACPC2_F", "", 11500, -1 },
			{ "hgun_PDW2000_F", "", 20000, -1 }
		};
		mags[] = {
			{ "16Rnd_9x21_Mag", "", 75 },
			{ "6Rnd_45ACP_Cylinder", "", 150 },
			{ "9Rnd_45ACP_Mag", "", 135 },
			{ "30Rnd_9x21_Mag", "", 225 }
		};
		accs[] = {
            { "optic_ACO_grn_smg", "", 2500, 250 },
			{ "optic_Arco", "", 2500, 250 }
        };
	};

	//Basic Shops
	class genstore {
		name = "Magasin général";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = {
			{ "Binocular", "", 150, -1 },
			{ "ItemGPS", "", 100, 45 },
			{ "ItemRadio", "", 100, 45 },
			{ "ItemMap", "", 50, 35 },
			{ "ItemCompass", "", 50, 25 },
			{ "ItemWatch", "", 50, -1 },
			{ "ToolKit", "", 7500, 75 },
			{ "FirstAidKit", "", 150, 65 },
			{ "NVGoggles", "", 2000, 980 },
			{ "Chemlight_red", "", 300, -1 },
			{ "Chemlight_yellow", "", 300, 50 },
			{ "Chemlight_green", "", 300, 50 },
			{ "Chemlight_blue", "", 300, 50 }
		};
		mags[] = {};
	};

	//Basic Shops
	class depanneur {
		name = "Quincaillerie Dépanneur";
		side = "civ";
		license = "depanneur";
		level[] = { "", "", -1, "" };
		items[] = {
			{ "Binocular", "", 150, -1 },
			{ "ItemGPS", "", 100, 45 },
			{ "ItemRadio", "", 100, 45 },
			{ "ItemMap", "", 50, 35 },
			{ "ItemCompass", "", 50, 25 },
			{ "ItemWatch", "", 50, -1 },
			{ "ToolKit", "", 7500, 50 },
			{ "FirstAidKit", "", 150, 65 },
			{ "NVGoggles", "", 1000, 980 },
			{ "Chemlight_red", "", 300, -1 },
			{ "Chemlight_yellow", "", 300, 50 },
			{ "Chemlight_green", "", 300, 50 },
			{ "Chemlight_blue", "", 300, 50 }
		};
		mags[] = {};
	};

	class f_station_store {
		name = "Magasin station service";
		side = "";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = {
			{ "Binocular", "", 750, -1 },
			{ "ItemGPS", "", 500, 45 },
			{ "ItemRadio", "", 100, 45 },
			{ "ItemMap", "", 250, 35 },
			{ "ItemCompass", "", 250, 25 },
			{ "ItemWatch", "", 250, -1 },
			{ "ToolKit", "", 9500, 75 },
			{ "FirstAidKit", "", 750, 65 },
			{ "NVGoggles", "", 10000, 980 },
			{ "Chemlight_red", "", 1500, -1 },
			{ "Chemlight_yellow", "", 1500, 50 },
			{ "Chemlight_green", "", 1500, 50 },
			{ "Chemlight_blue", "", 1500, 50 }
		};
		mags[] = {};
	};

	////Recrue 1, Brigadier 2, Maréchal des Logis 3, Adjudant 4, Major 5, Lieutenant 6, Capitaine 7, Commandant 8, Lieutenant-Colonel 9, Colonel 10, Général 11
	class cop_basic {
		name = "Equipement de la Gendarmerie";
		side = "cop";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = {
			{ "", "Utilitaires", 0, 0 },
			{ "ItemMap", "", 20, 10 },
			{ "ItemGPS", "", 20, 10 },
			{ "ItemRadio", "", 100, 45 },
			{ "Rangefinder", "", 260, 130 },
			{ "NVGoggles_OPFOR", "", 150, 75 },
			{ "FirstAidKit", "", 70, 35 },
			{ "ToolKit", "", 5000, 250 },
			{ "B_UavTerminal", "", 2000, 750, { "life_coplevel", 5 } }, //Major
			{ "SmokeShell", "Fumigène (blanche)", 100, 50 },
			{ "HandGrenade_Stone", "Flashbang", 100, 50 },
			{ "SatchelCharge_Remote_Mag", "", 50000, 25000, { "life_coplevel", 7 } }, //Capitaine
			{ "", "----ARMES DE POING----", 0, 0 },
			{ "hgun_P07_snds_F", "Pistolet paralysant (9mm)", 10000, 2500 },
			{ "arifle_SDAR_F", "Arme Anti Troll", 15000, 2500 },
			{ "", "----FUSILS ASSAULT----", 0, 0 },
			{ "SMG_02_F", "Sting (9mm)", 5000, 2500 },
			{ "SMG_05_F", "Protector (9mm)", 5000, 2500 },
			{ "arifle_Mk20_plain_F", "Mk20 (5.56)", 50000, 25000 },
			{ "arifle_Mk20C_plain_F", "Mk20C (5.56)", 50000, 25000 },
			{ "LMG_Mk200_F", "MK200 (6.5)", 80000, 40000, { "life_coplevel", 3 } },
			{ "arifle_Katiba_F", "Katiba (6.5mm)", 55000, 27500, { "life_coplevel", 2 } },
			{ "arifle_SPAR_01_blk_F", "SPAR-16 APEX (5.56)", 50000, 25000 },
			{ "arifle_MX_F", "MX (6.5)", 60000, 30000, { "life_coplevel", 2 } },
			{ "arifle_MXC_F", "MXC (6.5)", 60000, 30000, { "life_coplevel", 2 } },
			{ "arifle_MXM_F", "MXM (6.5)", 60000, 30000, { "life_coplevel", 2 } },
			{ "arifle_CTAR_blk_F", "CAR-95 APEX (5.8)", 55000, 27500, { "life_coplevel", 2 } },
			{ "arifle_CTARS_blk_F", "CAR-95-1 APEX (5.8 LMG)", 60000, 30000, { "life_coplevel", 2 } },
			{ "", "----FUSILS DE PRECISION----", 0, 0 },
			{ "srifle_DMR_07_blk_F", "CMR-76 APEX (6.5)", 25000, 32500, { "life_coplevel", 4 } },
			{ "arifle_SPAR_03_blk_F", "SPAR-17 APEX (7.62)", 60000, 30000, { "life_coplevel", 4 } },
			{ "srifle_EBR_F", "Mk18 (7.62)", 60000, 30000, { "life_coplevel", 4 } },
			{ "srifle_DMR_03_F", "Mk-I MARK (7.62)", 60000, 30000, { "life_coplevel", 4 } },
			{ "srifle_DMR_05_blk_F", "Cyrus MARK (9.3)", 90000, 45000, { "life_coplevel", 6 } },
			{ "srifle_DMR_02_F", "MAR-10 MARK (.338)", 90000, 45000, { "life_coplevel", 7 } },
			{ "srifle_LRR_F", "M320 (.408)", 80000, 40000, { "life_coplevel", 7 } },
			{ "srifle_GM6_F", "Lynx (12.7)", 200000, 100000, { "life_coplevel", 7 } },
			{ "", "----ARMES LOURDES----", 0, 0 },
			{ "arifle_MX_SW_Black_F", "MX SW (6.5 LMG)", 70000, 35000, { "life_coplevel", 2 } },
			{ "arifle_ARX_blk_F", "Type-115 APEX (6.5)", 65000, 32500, { "life_coplevel", 4 } },
			{ "LMG_Mk200_BI_F", "Mk200 (6.5 LMG)", 70000, 35000, { "life_coplevel", 4 } },
			{ "LMG_Zafir_F", "Zafir (7.62 LMG)", 70000, 35000, { "life_coplevel", 5 } },
		};
		mags[] = {
			{ "16Rnd_9x21_Mag", "Chargeur 9mm (16)", 10, 5 },
			{ "30Rnd_9x21_Mag_SMG_02", "Chargeur 9mm (30)", 10, 5 },
			{ "30Rnd_9x21_Mag", "Chargeur 9mm (30)", 10, 5 },
			{ "20Rnd_556x45_UW_mag", "Munition Anti Troll", 225, 5 },
			{ "30Rnd_556x45_Stanag", "Chargeur 5.56 (30)", 20, 10 },
			{ "30Rnd_580x42_Mag_F", "Chargeur 5.8 (30)", 30, 15 },
			{ "100Rnd_580x42_Mag_F", "Chargeur 5.8 LMG (100)", 40, 20 },
			{ "30Rnd_65x39_caseless_mag", "Chargeur 6.5 (30)", 50, 25 },
			{ "30Rnd_65x39_caseless_green", "Chargeur 6.5 (30)", 50, 25 },
			{ "20Rnd_650x39_Cased_Mag_F", "Chargeur 6.5 (20)", 60, 30 },
			{ "100Rnd_65x39_caseless_mag", "Chargeur 6.5 LMG (100)", 70, 35 },
			{ "200Rnd_65x39_cased_Box", "Chargeur 6.5 LMG (200)", 80, 40 },
			{ "20Rnd_762x51_Mag", "Chargeur 7.62 (20)", 90, 45 },
			{ "200Rnd_65x39_cased_Box", "Chargeur 6.5 (200)", 90, 45 },
			{ "200Rnd_65x39_cased_Box_Tracer", "Chargeur 6.5 (200)", 90, 45 },
			{ "10Rnd_93x64_DMR_05_Mag", "Chargeur 9.3 (10)", 100, 50 },
			{ "150Rnd_762x54_Box", "", 100, 50 },
			{ "150Rnd_93x64_Mag", "Chargeur Navid 9.3", 110, 55 },
			{ "10Rnd_338_Mag", "Chargeur .338 (10)", 120, 60 },
			{ "7Rnd_408_Mag", "Chargeur .408 (7)", 130, 65 },
			{ "5Rnd_127x108_Mag", "Chargeur 12.7 (5)", 140, 70 }
		};
		accs[] = {
            { "optic_Aco", "", 50, 25 },
            { "optic_ACO_grn", "", 50, 25 },
			{ "optic_Aco_smg", "", 50, 25 },
			{ "optic_Holosight", "", 70, 35 },
			{ "optic_Arco", "", 100, 50 },
			{ "optic_Hamr", "", 100, 50 },
			{ "optic_MRCO", "", 80, 40 },
			{ "optic_DMS", "", 110, 55 },
			{ "optic_SOS", "", 120, 60 },
			{ "optic_LRPS", "", 150, 75 },
			{ "optic_ERCO_blk_F", "", 200, 100 },
			{ "optic_KHS_blk", "", 200, 100 },
			{ "optic_AMS", "", 200, 100 },
			{ "optic_Hamr", "", 200, 100 },
			{ "optic_NVS", "", 200, 100 },
			{ "acc_flashlight", "", 2000 },//lampe
			{ "acc_pointer_IR", "", 2000 },//pointer ir
			{ "", "-------------------------------------------------", 0, 0 },
			{ "muzzle_snds_M", "Silencieux (5.56)", 2000, 1000 },
			{ "muzzle_snds_58_blk_F", "Silencieux (5.8)", 2000, 1000, { "life_coplevel", 2 } },
			{ "muzzle_snds_H", "Silencieux (6.5)", 2000, 1000, { "life_coplevel", 2 } },
			{ "muzzle_snds_338_black", "", 2000, 1000, { "life_coplevel", 2 } },
			{ "muzzle_snds_65_TI_blk_F", "Silencieux APEX (6.5)", 2000, 1000, { "life_coplevel", 8 } },
			{ "muzzle_snds_H_MG", "Silencieux (6.5 LMG)", 2000, 1000, { "life_coplevel", 4 } },
			{ "muzzle_snds_B", "Silencieux (7.62)", 2000, 1000, { "life_coplevel", 5 } },
			{ "muzzle_snds_93mmg", "Silencieux (9.3)", 2000, 1000, { "life_coplevel", 6 } },
			{ "", "-------------------------------------------------", 0, 0 },
			{ "bipod_01_F_blk", "", 2000, 1000, { "life_coplevel", 2 } }
        };
	};

	class cop_gign {
		name = "Equipement de la Gendarmerie";
		side = "cop";
		license = "";
		level[] = { "life_coplevel", "SCALAR", 11, "" };
		items[] = {
			{ "", "Utilitaires", 0, 0 },
			{ "ItemMap", "", 20, 10 },
			{ "ItemGPS", "", 20, 10 },
			{ "ItemRadio", "", 100, 45 },
			{ "Rangefinder", "", 260, 130 },
			{ "NVGoggles_OPFOR", "", 150, 75 },
			{ "FirstAidKit", "", 70, 35 },
			{ "ToolKit", "", 5000, 250 },
			{ "B_UavTerminal", "", 2000, 750 }, //Major
			{ "SmokeShell", "Fumigène (blanche)", 100, 50 },
			{ "HandGrenade_Stone", "Flashbang", 100, 50 },
			{ "SatchelCharge_Remote_Mag", "", 50000, 25000 }, //Capitaine
			{ "", "----ARMES DE POING----", 0, 0 },
			{ "hgun_P07_snds_F", "Pistolet paralysant (9mm)", 10000, 2500 },
			{ "arifle_SDAR_F", "Arme Anti Troll", 15000, 2500 },
			{ "", "----FUSILS ASSAULT----", 0, 0 },
			{ "arifle_Mk20_plain_F", "Mk20 (5.56)", 50000, 25000 },
			{ "arifle_Mk20C_plain_F", "Mk20C (5.56)", 50000, 25000 },
			{ "arifle_SPAR_01_blk_F", "SPAR-16 APEX (5.56)", 50000, 25000 },
			{ "arifle_MX_F", "MX (6.5)", 60000, 30000 },
			{ "arifle_MXC_F", "MXC (6.5)", 60000, 30000 },
			{ "arifle_MXM_F", "MXM (6.5)", 60000, 30000 },
			{ "arifle_CTAR_blk_F", "CAR-95 APEX (5.8)", 55000, 27500 },
			{ "arifle_CTARS_blk_F", "CAR-95-1 APEX (5.8 LMG)", 60000, 30000 },
			{ "", "----FUSILS DE PRECISION----", 0, 0 },
			{ "srifle_DMR_07_blk_F", "CMR-76 APEX (6.5)", 25000, 0 },
			{ "arifle_SPAR_03_blk_F", "SPAR-17 APEX (7.62)", 60000, 0 },
			{ "srifle_EBR_F", "Mk18 (7.62)", 60000, 0 },
			{ "srifle_DMR_03_F", "Mk-I MARK (7.62)", 60000, 0 },
			{ "srifle_DMR_05_blk_F", "Cyrus MARK (9.3)", 90000, 45000 },
			{ "srifle_DMR_02_F", "MAR-10 MARK (.338)", 90000, 0 },
			{ "srifle_LRR_F", "M320 (.408)", 80000, 0 },
			{ "srifle_GM6_F", "Lynx (12.7)", 200000, 0 },
			{ "", "----ARMES LOURDES----", 0, 0 },
			{ "arifle_MX_SW_Black_F", "MX SW (6.5 LMG)", 70000, 35000 },
			{ "arifle_ARX_blk_F", "Type-115 APEX (6.5)", 65000, 0 },
			{ "LMG_Mk200_BI_F", "Mk200 (6.5 LMG)", 70000, 0 },
			{ "LMG_Zafir_F", "Zafir (7.62 LMG)", 70000, 0 },
		};
		mags[] = {
			{ "16Rnd_9x21_Mag", "Chargeur 9mm (16)", 10, 5 },
			{ "20Rnd_556x45_UW_mag", "Munition Anti Troll", 225, 5 },
			{ "30Rnd_556x45_Stanag", "Chargeur 5.56 (30)", 20, 10 },
			{ "30Rnd_580x42_Mag_F", "Chargeur 5.8 (30)", 30, 15 },
			{ "100Rnd_580x42_Mag_F", "Chargeur 5.8 LMG (100)", 40, 20 },
			{ "30Rnd_65x39_caseless_mag", "Chargeur 6.5 (30)", 50, 25 },
			{ "30Rnd_65x39_caseless_green", "Chargeur 6.5 (30)", 50, 25 },
			{ "20Rnd_650x39_Cased_Mag_F", "Chargeur 6.5 (20)", 60, 30 },
			{ "100Rnd_65x39_caseless_mag", "Chargeur 6.5 LMG (100)", 70, 35 },
			{ "200Rnd_65x39_cased_Box", "Chargeur 6.5 LMG (200)", 80, 40 },
			{ "20Rnd_762x51_Mag", "Chargeur 7.62 (20)", 90, 45 },
			{ "10Rnd_93x64_DMR_05_Mag", "Chargeur 9.3 (10)", 100, 50 },
			{ "150Rnd_762x54_Box", "", 100, 50 },
			{ "150Rnd_93x64_Mag", "Chargeur Navid 9.3", 110, 55 },
			{ "10Rnd_338_Mag", "Chargeur .338 (10)", 120, 60 },
			{ "7Rnd_408_Mag", "Chargeur .408 (7)", 130, 65 },
			{ "5Rnd_127x108_Mag", "Chargeur 12.7 (5)", 140, 70 },
			{ "30Rnd_9x21_Mag", "Chargeur 12.7 (5)", 140, 70 }
		};
		accs[] = {
            { "optic_Aco", "", 50, 25 },
			{ "optic_Aco_smg", "", 50, 25 },
			{ "optic_Holosight", "", 70, 35 },
			{ "optic_Arco", "", 100, 50 },
			{ "optic_Hamr", "", 100, 50 },
			{ "optic_MRCO", "", 80, 40 },
			{ "optic_DMS", "", 110, 55 },
			{ "optic_SOS", "", 120, 60 },
			{ "optic_LRPS", "", 150, 75 },
			{ "optic_ERCO_blk_F", "", 200, 100 },
			{ "optic_KHS_blk", "", 200, 100 },
			{ "optic_AMS", "", 200, 100 },
			{ "optic_Hamr", "", 200, 100 },
			{ "optic_NVS", "", 200, 100 },
			{ "acc_flashlight", "", 2000 },//lampe
			{ "acc_pointer_IR", "", 2000 },//pointer ir
			{ "", "-------------------------------------------------", 0, 0 },
			{ "muzzle_snds_M", "Silencieux (5.56)", 2000, 1000 },
			{ "muzzle_snds_58_blk_F", "Silencieux (5.8)", 2000, 1000 },
			{ "muzzle_snds_H", "Silencieux (6.5)", 2000, 1000 },
			{ "muzzle_snds_338_black", "", 2000, 1000 },
			{ "muzzle_snds_65_TI_blk_F", "Silencieux APEX (6.5)", 2000, 1000 },
			{ "muzzle_snds_H_MG", "Silencieux (6.5 LMG)", 2000, 1000 },
			{ "muzzle_snds_B", "Silencieux (7.62)", 2000, 1000 },
			{ "muzzle_snds_93mmg", "Silencieux (9.3)", 2000, 1000 },
			{ "", "-------------------------------------------------", 0, 0 },
			{ "bipod_01_F_blk", "", 2000, 1000 }
        };
	};

  //Armer
  class armer_weapon {
		name = "Equipement de la Gendarmerie";
		side = "";
		license = "";
		level[] = { "life_armerlevel", "SCALAR", 1, "" };
		items[] = {
			{ "", "Utilitaires", 0, 0 },
			{ "ItemMap", "", 20, 10 },
			{ "ItemGPS", "", 20, 10 },
			{ "ItemRadio", "", 100, 45 },
      { "ItemCompass", "", 50, 25 },
			{ "Rangefinder", "", 260, 130 },
			{ "NVGoggles_OPFOR", "", 150, 75 },
			{ "FirstAidKit", "", 70, 35 },
			{ "ToolKit", "", 5000, 250 },
			{ "SmokeShell", "Fumigène (blanche)", 100, 50 },
			{ "HandGrenade_Stone", "Flashbang", 100, 50 },
			{ "SatchelCharge_Remote_Mag", "", 50000, 25000 },
			{ "", "----ARMES DE POING----", 0, 0 },
      { "hgun_Rook40_F", "", 6500, 500 },
			{ "hgun_P07_F", "", 6500, 500 },
			{ "hgun_Pistol_heavy_02_F", "", 9850, -1 },
			{ "hgun_ACPC2_F", "", 11500, -1 },
			{ "hgun_PDW2000_F", "", 20000, -1 },
			{ "", "----FUSILS ASSAULT----", 0, 0 },
			{ "SMG_02_F", "Sting (9mm)", 5000, 2500 },
			{ "SMG_05_F", "Protector (9mm)", 5000, 2500 },
			{ "arifle_Mk20_plain_F", "Mk20 (5.56)", 50000, 25000 },
			{ "arifle_Mk20C_plain_F", "Mk20C (5.56)", 50000, 25000 },
			{ "LMG_Mk200_F", "MK200 (6.5)", 80000, 40000 },
			{ "arifle_Katiba_F", "Katiba (6.5mm)", 55000, 27500 },
			{ "arifle_SPAR_01_blk_F", "SPAR-16 APEX (5.56)", 50000, 25000 },
			{ "arifle_MX_F", "MX (6.5)", 60000, 30000 },
			{ "arifle_MXC_F", "MXC (6.5)", 60000, 30000 },
			{ "arifle_MXM_F", "MXM (6.5)", 60000, 30000 },
			{ "arifle_CTAR_blk_F", "CAR-95 APEX (5.8)", 55000, 27500 },
			{ "arifle_CTARS_blk_F", "CAR-95-1 APEX (5.8 LMG)", 60000, 30000 },
			{ "", "----FUSILS DE PRECISION----", 0, 0 },
			{ "srifle_DMR_07_blk_F", "CMR-76 APEX (6.5)", 25000, 32500 },
			{ "arifle_SPAR_03_blk_F", "SPAR-17 APEX (7.62)", 60000, 30000 },
			{ "srifle_EBR_F", "Mk18 (7.62)", 60000, 30000 },
			{ "srifle_DMR_03_F", "Mk-I MARK (7.62)", 60000, 30000 },
			{ "srifle_DMR_05_blk_F", "Cyrus MARK (9.3)", 90000, 45000 },
			{ "srifle_DMR_02_F", "MAR-10 MARK (.338)", 90000, 45000 },
			{ "srifle_LRR_F", "M320 (.408)", 80000, 40000 },
			{ "srifle_GM6_F", "Lynx (12.7)", 200000, 100000 },
			{ "", "----ARMES LOURDES----", 0, 0 },
			{ "arifle_MX_SW_Black_F", "MX SW (6.5 LMG)", 70000, 35000 },
			{ "arifle_ARX_blk_F", "Type-115 APEX (6.5)", 65000, 32500 },
			{ "LMG_Mk200_BI_F", "Mk200 (6.5 LMG)", 70000, 35000 },
			{ "LMG_Zafir_F", "Zafir (7.62 LMG)", 70000, 35000 }
		};
		mags[] = {
			{ "6Rnd_45ACP_Cylinder", "", 150 },
			{ "9Rnd_45ACP_Mag", "", 135 },
			{ "16Rnd_9x21_Mag", "Chargeur 9mm (16)", 10, 5 },
			{ "30Rnd_9x21_Mag_SMG_02", "Chargeur 9mm (30)", 10, 5 },
			{ "30Rnd_9x21_Mag", "Chargeur 9mm (30)", 10, 5 },
			{ "20Rnd_556x45_UW_mag", "Munition Anti Troll", 225, 5 },
			{ "30Rnd_556x45_Stanag", "Chargeur 5.56 (30)", 20, 10 },
			{ "30Rnd_580x42_Mag_F", "Chargeur 5.8 (30)", 30, 15 },
			{ "100Rnd_580x42_Mag_F", "Chargeur 5.8 LMG (100)", 40, 20 },
			{ "30Rnd_65x39_caseless_mag", "Chargeur 6.5 (30)", 50, 25 },
			{ "30Rnd_65x39_caseless_green", "Chargeur 6.5 (30)", 50, 25 },
			{ "20Rnd_650x39_Cased_Mag_F", "Chargeur 6.5 (20)", 60, 30 },
			{ "100Rnd_65x39_caseless_mag", "Chargeur 6.5 LMG (100)", 70, 35 },
			{ "200Rnd_65x39_cased_Box", "Chargeur 6.5 LMG (200)", 80, 40 },
			{ "20Rnd_762x51_Mag", "Chargeur 7.62 (20)", 90, 45 },
			{ "200Rnd_65x39_cased_Box", "Chargeur 6.5 (200)", 90, 45 },
			{ "200Rnd_65x39_cased_Box_Tracer", "Chargeur 6.5 (200)", 90, 45 },
			{ "10Rnd_93x64_DMR_05_Mag", "Chargeur 9.3 (10)", 100, 50 },
			{ "150Rnd_762x54_Box", "", 100, 50 },
			{ "150Rnd_93x64_Mag", "Chargeur Navid 9.3", 110, 55 },
			{ "10Rnd_338_Mag", "Chargeur .338 (10)", 120, 60 },
			{ "7Rnd_408_Mag", "Chargeur .408 (7)", 130, 65 },
			{ "5Rnd_127x108_Mag", "Chargeur 12.7 (5)", 140, 70 }

		};
		accs[] = {
      { "optic_Aco", "", 50, 25 },
      { "optic_ACO_grn", "", 50, 25 },
			{ "optic_Aco_smg", "", 50, 25 },
			{ "optic_Holosight", "", 70, 35 },
			{ "optic_Arco", "", 100, 50 },
			{ "optic_Hamr", "", 100, 50 },
			{ "optic_MRCO", "", 80, 40 },
			{ "optic_DMS", "", 110, 55 },
			{ "optic_SOS", "", 120, 60 },
			{ "optic_LRPS", "", 150, 75 },
			{ "optic_ERCO_blk_F", "", 200, 100 },
			{ "optic_KHS_blk", "", 200, 100 },
			{ "optic_AMS", "", 200, 100 },
			{ "optic_Hamr", "", 200, 100 },
			{ "optic_NVS", "", 200, 100 },
			{ "acc_flashlight", "", 2000 },
			{ "acc_pointer_IR", "", 2000 },
			{ "", "-------------------------------------------------", 0, 0 },
			{ "muzzle_snds_M", "Silencieux (5.56)", 2000, 1000 },
			{ "muzzle_snds_58_blk_F", "Silencieux (5.8)", 2000, 1000 },
			{ "muzzle_snds_H", "Silencieux (6.5)", 2000, 1000 },
			{ "muzzle_snds_338_black", "", 2000, 1000 },
			{ "muzzle_snds_65_TI_blk_F", "Silencieux APEX (6.5)", 2000, 1000 },
			{ "muzzle_snds_H_MG", "Silencieux (6.5 LMG)", 2000, 1000 },
			{ "muzzle_snds_B", "Silencieux (7.62)", 2000, 1000 },
			{ "muzzle_snds_93mmg", "Silencieux (9.3)", 2000, 1000 },
			{ "", "-------------------------------------------------", 0, 0 },
			{ "bipod_01_F_blk", "", 2000, 1000 }
    };
	};

	//Medic Shops
	class med_basic {
		name = "Quincaillerie";
		side = "med";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = {
			{ "ItemMap", "", 20, 10 },
			{ "ItemGPS", "", 100, 45 },
			{ "ItemRadio", "", 100, 45 },
			{ "Binocular", "", 150, -1 },
			{ "ToolKit", "", 5000, 75 },
			{ "FirstAidKit", "", 150, 65 },
			{ "Medikit", "", 500, 450 },
			{ "NVGoggles", "", 1200, 980 }
		};
		mags[] = {
			{ "30Rnd_9x21_Mag", "Chargeur pour Tazer", 250, 125 }
		};
	};
};