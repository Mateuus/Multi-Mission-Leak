class WeaponShops {
    //Armory Shops
    class gun {
        name = "Billy Joe's Waffenladen";
        side = "civ";
        license = "gun";
        level = -1;
        msg = "Du hast keinen Waffenschein!";
        items[] = {
            {"hgun_Rook40_F","",10000},
			{"30Rnd_9x21_Mag","",100},
			{"hgun_Pistol_heavy_02_F","",12500},
			{"6Rnd_45ACP_Cylinder","",125},
			{"hgun_ACPC2_F","",15000},
			{"9Rnd_45ACP_Mag","",150},
			{"hgun_Pistol_heavy_01_F","",17500},
			{"11Rnd_45ACP_Mag","",175},
			{"hgun_PDW2000_F","",20000},
			{"16Rnd_9x21_Mag","",200},
			{"30Rnd_9x21_Mag","",400},
			{"SMG_01_F","",30000},
			{"hgun_PDW2000_Holo_snds_F","",20000},
			{"30Rnd_45ACP_Mag_SMG_01","",300},
			{"arifle_SDAR_F","",50000},
			{"20Rnd_556x45_UW_mag","",2500},
			{"arifle_TRG20_F","TRG-20 5.56mm",75000},
			{"30Rnd_556x45_Stanag_Tracer_Red","",3750},
			{"optic_Yorris","",2500},
			{"optic_ACO_grn_smg","",5000},
			{"optic_Holosight_smg","",5000},
			{"optic_Aco","",10000},
			{"optic_Holosight","",10000},
			{"V_Rangemaster_belt","",4900}
        };
    };
    class rebel {
        name = "Mohammed's Jihadi Shop";
        side = "civ";
        license = "rebel";
        level = -1;
        msg = "Du hast keine Rebellen Lizenz!";
        items[] = {
            {"arifle_TRG21_F","TRG-21 5.56mm",90000},
			{"arifle_Mk20_F","",100000},
			{"30Rnd_556x45_Stanag","",10000},
			{"arifle_Katiba_F","",125000},
			{"30Rnd_65x39_caseless_green","",12500},
			{"srifle_DMR_01_F","",250000},
			{"10Rnd_762x54_Mag","",25000},
			{"srifle_EBR_F","",600000},
			{"srifle_DMR_03_F","",700000},
			{"srifle_DMR_03_khaki_F","",700000},
			{"srifle_DMR_03_tan_F","",700000},
			{"srifle_DMR_03_woodland_F","",700000},
			{"srifle_DMR_03_multicam_F","",700000},
			{"srifle_DMR_06_camo_F","",710000},
			{"srifle_DMR_06_olive_F","",710000},
			{"20Rnd_762x51_Mag","",60000},
			{"SmokeShell","Rauchgranate Weiss",1250}
        };
    };
	class rebel_scopes {
        name = "Mohammed's Jihadi Shop";
        side = "civ";
        license = "rebel";
        level = -1;
        msg = "Du hast keine Rebellen Lizenz!";
        items[] = {
            {"muzzle_snds_M","",10000},
			{"muzzle_snds_H","",10000},
			{"muzzle_snds_B","",10000},
			{"optic_Yorris","",1000},
			{"optic_ACO_grn_smg","",3000},
			{"optic_Holosight_smg","",3000},
			{"optic_ACO_grn","",8000},
			{"optic_Aco","",8000},
			{"optic_Holosight","",8000},
			{"optic_Arco","",10000},
			{"optic_Hamr","",10000},
			{"optic_MRCO","",10000},
			{"optic_SOS","",20000},
			{"optic_LRPS","",20000},
			{"optic_DMS","",20000},
			{"optic_NVS","",50000},
			{"optic_AMS","",80000},
			{"optic_AMS_khk","",80000},
			{"optic_AMS_snd","",80000},
			{"acc_pointer_IR","",8000},
			{"acc_flashlight","",8000},
			{"bipod_01_F_blk","",50000},
			{"bipod_01_F_mtp","",50000},
			{"bipod_01_F_snd","",50000},
			{"bipod_02_F_hex","",50000},
			{"bipod_02_F_tan","",50000},
			{"bipod_03_F_oli","",50000},
			{"muzzle_snds_338_black","",50000},
			{"muzzle_snds_338_green","",50000},
			{"muzzle_snds_338_sand","",50000}
        };
    };
    class gang {
        name = "Gang Waffenkammer";
        side = "civ";
        license = "rebel";
        level = -1;
        msg = "Du hast keine Rebellen Lizenz!";
        items[] = {
            {"arifle_TRG21_F","TRG-21 5.56mm",90000},
			{"arifle_Mk20_F","",100000},
			{"30Rnd_556x45_Stanag","",10000},
			{"arifle_Katiba_F","",125000},
			{"30Rnd_65x39_caseless_green","",12500},
			{"srifle_DMR_01_F","",250000},
			{"10Rnd_762x54_Mag","",25000},
			{"srifle_EBR_F","",600000},
			{"srifle_DMR_03_F","",700000},
			{"srifle_DMR_03_khaki_F","",700000},
			{"srifle_DMR_03_tan_F","",700000},
			{"srifle_DMR_03_woodland_F","",700000},
			{"srifle_DMR_03_multicam_F","",700000},
			{"20Rnd_762x51_Mag","",60000},
			{"ItemRadio","Smartphone",500},
			{"NVGoggles","",2000},
			{"Rangefinder","",2000},
			{"ItemGPS","",100},
			{"ToolKit","",2500},
			{"FirstAidKit","",1500},
			{"ItemWatch","",25},
			{"ItemCompass","",25}
        };
    };
	class bm {
        name = "Schwarzmarkt";
        side = "civ";
        license = "bm";
        level = -1;
        msg = "Du brauchst eine Schwarzmarktlizenz!";
        items[] = {
            {"srifle_DMR_01_F","",275000},
			{"10Rnd_762x54_Mag","",30000},
			{"LMG_Mk200_F","",500000},
			{"200Rnd_65x39_cased_Box","",85000},
			{"srifle_EBR_F","",330000},
			{"srifle_DMR_03_F","",400000},
			{"srifle_DMR_03_khaki_F","",400000},
			{"srifle_DMR_03_tan_F","",400000},
			{"srifle_DMR_03_woodland_F","",400000},
			{"srifle_DMR_03_multicam_F","",400000},
			{"20Rnd_762x51_Mag","",33000},
			{"arifle_MXC_Black_F","",160000},
			{"arifle_MX_Black_F","",200000},
			{"arifle_MX_SW_Black_F","",380000},
			{"arifle_MXM_Black_F","",320000},
			{"30Rnd_65x39_caseless_mag","",13500},
			{"100Rnd_65x39_caseless_mag","",85000},
			{"arifle_Katiba_GL_F","",150000},
			{"30Rnd_65x39_caseless_green","",12500},
			{"1Rnd_Smoke_Grenade_shell","",15000},
			//{"srifle_DMR_02_F","",10000000},
			//{"srifle_DMR_02_camo_F","",10000000},
			//{"srifle_DMR_02_sniper_F","",10000000},
			//{"10Rnd_338_Mag","",500000},
			{"HandGrenade_Stone","Blendgranate",110000}
        };
    };
    //Basic Shops
    class genstore {
        name = "Altis General Store";
        side = "civ";
        license = "";
        level = -1;
        msg = "";
        items[] = {
        	{ "Binocular", "", 150 },
			{ "ItemGPS", "", 100 },
			{ "ToolKit", "", 5000 },
			{ "FirstAidKit", "", 150 },
			{ "NVGoggles", "", 2000 },
			{ "Chemlight_red", "", 300 },
			{ "Chemlight_yellow", "", 300 },
			{ "Chemlight_green", "", 300 },
			{ "Chemlight_blue", "", 300 },
			{"Rangefinder","",2000}
        };
    };
	class radio {
        name = "Mobicom Debiltel";
        side = "civ";
        license = "";
        level = -1;
        msg = "";
        items[] = {
			{ "ItemRadio", "Smartphone", 2000 }
        };
    };
	class taxi {
        name = "Taxi";
        side = "civ";
        license = "taxi";
        level = -1;
        msg = "";
        items[] = {
			{ "FirstAidKit", "", 0 },
			{ "ItemGPS", "", 0 },
			{ "ToolKit", "", 0 }
        };
    };
    //Cop Shops
    class cop_general {
        name = "Altis Polizeihändler";
        side = "cop";
        license = "";
        level = -1;
        msg = "";
        items[] = {
			{ "Binocular", "", 0 },
			{ "ItemGPS", "", 0 },
			{ "ToolKit", "", 0 },
			{ "FirstAidKit", "", 0 },
			{ "Medikit", "", 0 },
			{ "NVGoggles", "", 0 },
			{ "NVGoggles_OPFOR", "", 0},
			{ "Rangefinder", "", 0 },
			{ "ItemRadio", "Smartphone", 0 },
			{ "ItemWatch", "", 0 },
			{ "ItemCompass", "", 0 },
			{ "ItemMap", "", 0 }
        };
    };
	class cop_anwaerter {
        name = "Anwärter Shop";
        side = "cop";
        license = "";
        level = 1;
        msg = "Du musst Anwärter sein!";
        items[] = {
			{"hgun_P07_snds_F","Taser Pistole",0},
			{"30Rnd_9x21_Mag","Taser Pistolen Magazin",0},
			{"arifle_sdar_F","Taser Gewehr",0},
			{"20Rnd_556x45_UW_mag","Taser Gewehr Magazin",0}
        };
    };
    class cop_wachtmeister {
        name = "Wachtmeister Shop";
        side = "cop";
        license = "";
        level = 2;
        msg = "Du musst Wachtmeister sein!";
        items[] = {
        	{"SmokeShellGreen","Traenengas",0},
			{"HandGrenade_Stone","Blendgranate",0},
			{"hgun_P07_snds_F","Taser Pistole",0},
			{"30Rnd_9x21_Mag","Taser Pistolen Magazin",0},
			{"arifle_sdar_F","Taser Gewehr",1000},
			{"20Rnd_556x45_UW_mag","Taser Gewehr Magazin",0},
			{"arifle_MXC_F","Gummi MX",10000},
			{"30Rnd_65x39_caseless_mag_Tracer","Gummigeschosse",0},
			{"SMG_02_F","",0},
			{"30Rnd_9x21_Mag","",0},
			{"muzzle_snds_L","",0},
			{"muzzle_snds_H","",0},
			{"optic_Aco_smg","",0},
			{"optic_MRCO","",0},
			{"acc_flashlight","",0},
			{"acc_pointer_IR","",0}
        };
    };
    class cop_kommisar {
        name = "Kommisar Shop";
        side = "cop";
        license = "";
        level = 3;
        msg = "Du musst Kommisar sein!";
        items[] = {
            {"SmokeShellGreen","Traenengas",0},
			{"HandGrenade_Stone","Blendgranate",0},
			{"hgun_P07_snds_F","Taser Pistole",0},
			{"30Rnd_9x21_Mag","Taser Pistolen Magazin",0},
			{"arifle_sdar_F","Taser Gewehr",0},
			{"20Rnd_556x45_UW_mag","Taser Gewehr Magazin",0},
			{"arifle_MXC_F","Gummi MX",0},
			{"30Rnd_65x39_caseless_mag_Tracer","Gummigeschosse",0},
			{"SMG_02_F","",0},
			{"30Rnd_9x21_Mag","",0},
			{"arifle_MX_F","",0},
			{"30Rnd_65x39_caseless_mag","",0},
			{"arifle_MX_SW_F","",0},
			{"100Rnd_65x39_caseless_mag","",0},
			{"muzzle_snds_L","",0},
			{"muzzle_snds_H","",0},
			{"muzzle_snds_B","",0},
			{"optic_Aco_smg","",0},
			{"optic_MRCO","",0},
			{"optic_DMS","",0},
			{"optic_Hamr","",0},
			{"optic_NVS","",0},
			{"optic_Arco","",0},
			{"optic_SOS","",0},
			{"optic_LRPS","",0},
			{"optic_KHS_blk","",0},
			{"optic_AMS","",0},
			{"optic_AMS_snd","",0},
			{"bipod_01_F_blk","",0},
			{"bipod_01_F_snd","",0},
			{"acc_flashlight","",0},
			{"acc_pointer_IR","",0}
        };
    };
	class cop_oberkommisar {
        name = "Oberkommisar Shop";
        side = "cop";
        license = "";
        level = 4;
        msg = "Du musst Oberkommisar sein!";
        items[] = {
            {"SmokeShellGreen","Traenengas",0},
			{"SmokeShellBlue","Rauchgranate Blau",0},
			{"SmokeShell","Rauchgranate Weiss",0},
			{"HandGrenade_Stone","Blendgranate",0},
			{"hgun_P07_snds_F","Taser Pistole",0},
			{"30Rnd_9x21_Mag","Taser Pistolen Magazin",0},
			{"arifle_sdar_F","Taser Gewehr",0},
			{"20Rnd_556x45_UW_mag","Taser Gewehr Magazin",0},
			{"arifle_MXC_F","Gummi MX",0},
			{"30Rnd_65x39_caseless_mag_Tracer","Gummigeschosse",0},
			{"SMG_02_F","",0},
			{"30Rnd_9x21_Mag","",0},
			{"arifle_MX_F","",0},
			{"30Rnd_65x39_caseless_mag","",0},
			{"arifle_MX_SW_F","",0},
			{"100Rnd_65x39_caseless_mag","",0},
			{"srifle_DMR_03_tan_F","",0},
			{"20Rnd_762x51_Mag","",0},
			{"muzzle_snds_L","",0},
			{"muzzle_snds_H","",0},
			{"muzzle_snds_B","",0},
			{"optic_Aco_smg","",0},
			{"optic_MRCO","",0},
			{"optic_DMS","",0},
			{"optic_Hamr","",0},
			{"optic_NVS","",0},
			{"optic_Arco","",0},
			{"optic_SOS","",0},
			{"optic_LRPS","",0},
			{"optic_KHS_blk","",0},
			{"optic_AMS","",0},
			{"optic_AMS_snd","",0},
			{"bipod_01_F_blk","",0},
			{"bipod_01_F_snd","",0},
			{"acc_flashlight","",0},
			{"acc_pointer_IR","",0}
        };
    };
	class cop_hauptkommisar {
        name = "Hauptkommisar Shop";
        side = "cop";
        license = "";
        level = 5;
        msg = "Du musst Hauptkommisar sein!";
        items[] = {
            {"SmokeShellGreen","Traenengas",0},
			{"SmokeShellBlue","Rauchgranate Blau",0},
			{"SmokeShell","Rauchgranate Weiss",0},
			{"HandGrenade_Stone","Blendgranate",0},
			{"hgun_P07_snds_F","Taser Pistole",0},
			{"30Rnd_9x21_Mag","Taser Pistolen Magazin",0},
			{"arifle_sdar_F","Taser Gewehr",0},
			{"20Rnd_556x45_UW_mag","Taser Gewehr Magazin",0},
			{"arifle_MXC_F","Gummi MX",0},
			{"arifle_MXC_Black_F","Gummi MX Schwarz",0},
			{"30Rnd_65x39_caseless_mag_Tracer","Gummigeschosse",0},
			{"SMG_02_F","",0},
			{"30Rnd_9x21_Mag","",0},
			{"arifle_MX_F","",0},
			{"30Rnd_65x39_caseless_mag","",0},
			{"arifle_MXM_F","",0},
			{"arifle_MX_SW_F","",0},
			{"100Rnd_65x39_caseless_mag","",0},
			{"srifle_DMR_03_tan_F","",0},
			{"20Rnd_762x51_Mag","",0},
			{"muzzle_snds_L","",0},
			{"muzzle_snds_H","",0},
			{"muzzle_snds_B","",0},
			{"optic_Aco_smg","",0},
			{"optic_MRCO","",0},
			{"optic_DMS","",0},
			{"optic_Hamr","",0},
			{"optic_NVS","",0},
			{"optic_Arco","",0},
			{"optic_SOS","",0},
			{"optic_LRPS","",0},
			{"optic_KHS_blk","",0},
			{"optic_AMS","",0},
			{"optic_AMS_snd","",0},
			{"bipod_01_F_blk","",0},
			{"bipod_01_F_snd","",0},
			{"acc_flashlight","",0},
			{"acc_pointer_IR","",0}
        };
    };
	class cop_bundespolizist {
        name = "Bundespolizei Shop";
        side = "cop";
        license = "";
        level = 6;
        msg = "Du musst Bundespolizist sein!";
        items[] = {
            {"SmokeShellGreen","Traenengas",0},
			{"SmokeShellBlue","Rauchgranate Blau",0},
			{"SmokeShell","Rauchgranate Weiss",0},
			{"HandGrenade_Stone","Blendgranate",0},
			{"hgun_P07_snds_F","Taser Pistole",0},
			{"30Rnd_9x21_Mag","Taser Pistolen Magazin",0},
			{"arifle_sdar_F","Taser Gewehr",0},
			{"20Rnd_556x45_UW_mag","Taser Gewehr Magazin",0},
			{"arifle_MXC_F","Gummi MX",0},
			{"arifle_MXC_Black_F","Gummi MX Schwarz",0},
			{"30Rnd_65x39_caseless_mag_Tracer","Gummigeschosse",0},
			{"SMG_02_F","",0},
			{"30Rnd_9x21_Mag","",0},
			{"arifle_MX_F","",0},
			{"30Rnd_65x39_caseless_mag","",0},
			{"arifle_MXM_F","",0},
			{"arifle_MX_SW_F","",0},
			{"100Rnd_65x39_caseless_mag","",0},
			{"srifle_EBR_F","",0},
			{"srifle_DMR_03_tan_F","",0},
			{"20Rnd_762x51_Mag","",0},
			{"muzzle_snds_L","",0},
			{"muzzle_snds_H","",0},
			{"muzzle_snds_B","",0},
			{"optic_Aco_smg","",0},
			{"optic_MRCO","",0},
			{"optic_DMS","",0},
			{"optic_Hamr","",0},
			{"optic_NVS","",0},
			{"optic_Arco","",0},
			{"optic_SOS","",0},
			{"optic_LRPS","",0},
			{"optic_KHS_blk","",0},
			{"optic_AMS","",0},
			{"optic_AMS_snd","",0},
			{"bipod_01_F_blk","",0},
			{"bipod_01_F_snd","",0},
			{"acc_flashlight","",0},
			{"acc_pointer_IR","",0},
			{"B_UavTerminal","",0}
        };
    };
	class cop_polizeichef {
        name = "Polizeichef Shop";
        side = "cop";
        license = "";
        level = 7;
        msg = "Du musst Polizeichef sein!";
        items[] = {
            {"SmokeShellGreen","Traenengas",0},
			{"SmokeShellBlue","Rauchgranate Blau",0},
			{"SmokeShell","Rauchgranate Weiss",0},
			{"HandGrenade_Stone","Blendgranate",0},
			{"hgun_P07_snds_F","Taser Pistole",0},
			{"30Rnd_9x21_Mag","Taser Pistolen Magazin",0},
			{"arifle_sdar_F","Taser Gewehr",0},
			{"20Rnd_556x45_UW_mag","Taser Gewehr Magazin",0},
			{"arifle_MXC_F","Gummi MX",0},
			{"arifle_MXC_Black_F","Gummi MX Schwarz",0},
			{"30Rnd_65x39_caseless_mag_Tracer","Gummigeschosse",0},
			{"SMG_02_F","",0},
			{"30Rnd_9x21_Mag","",0},
			{"arifle_MX_F","",0},
			{"30Rnd_65x39_caseless_mag","",0},
			{"arifle_MXM_F","",0},
			{"arifle_MX_SW_F","",0},
			{"100Rnd_65x39_caseless_mag","",0},
			{"srifle_EBR_F","",0},
			{"srifle_DMR_03_tan_F","",0},
			{"20Rnd_762x51_Mag","",0},
			//{"srifle_DMR_02_F","",0},
			//{"srifle_DMR_02_camo_F","",0},
			//{"srifle_DMR_02_sniper_F","",0},
			//{"10Rnd_338_Mag","",0},
			{"muzzle_snds_338_black","",0},
			{"muzzle_snds_338_green","",0},
			{"muzzle_snds_338_sand","",0},
			{"muzzle_snds_L","",0},
			{"muzzle_snds_H","",0},
			{"muzzle_snds_B","",0},
			{"optic_Aco_smg","",0},
			{"optic_MRCO","",0},
			{"optic_DMS","",0},
			{"optic_Hamr","",0},
			{"optic_NVS","",0},
			{"optic_Arco","",0},
			{"optic_SOS","",0},
			{"optic_LRPS","",0},
			{"optic_KHS_blk","",0},
			{"optic_KHS_hex","",0},
			{"optic_KHS_old","",0},
			{"optic_KHS_tan","",0},
			{"optic_AMS","",0},
			{"optic_AMS_khk","",0},
			{"optic_AMS_snd","",0},
			{"bipod_01_F_blk","",0},
			{"bipod_01_F_mtp","",0},
			{"bipod_01_F_snd","",0},
			{"bipod_02_F_hex","",0},
			{"bipod_02_F_tan","",0},
			{"bipod_03_F_oli","",0},
			{"acc_flashlight","",0},
			{"acc_pointer_IR","",0},
			{"B_UavTerminal","",0}
        };
    };
	class cop_sek {
        name = "SEK Shop";
        side = "cop";
        license = "sek";
        level = -1;
        msg = "Du musst im SEK sein!";
        items[] = {
            {"SmokeShellGreen","Traenengas",0},
			{"SmokeShellBlue","Rauchgranate Blau",0},
			{"SmokeShell","Rauchgranate Weiss",0},
			{"HandGrenade_Stone","Blendgranate",0},
			{"hgun_P07_snds_F","Taser Pistole",0},
			{"30Rnd_9x21_Mag","Taser Pistolen Magazin",0},
			{"arifle_sdar_F","Taser Gewehr",0},
			{"20Rnd_556x45_UW_mag","Taser Gewehr Magazin",0},
			{"arifle_MXC_Black_F","Gummi MX Schwarz",0},
			{"30Rnd_65x39_caseless_mag_Tracer","Gummigeschosse",0},
			{"SMG_02_F","",0},
			{"30Rnd_9x21_Mag","",0},
			{"arifle_MX_Black_F","",0},
			{"arifle_MX_GL_F","",0},
			{"arifle_MXM_Black_F","",0},
			{"30Rnd_65x39_caseless_mag","",0},
			{"arifle_MX_SW_Black_F","",0},
			{"100Rnd_65x39_caseless_mag","",0},
			{"1Rnd_SmokeGreen_Grenade_shell","",0},
			{"1Rnd_Smoke_Grenade_shell","",0},
			{"srifle_EBR_F","",0},
			{"srifle_DMR_03_F","",0},
			{"20Rnd_762x51_Mag","",0},
			{"LMG_Mk200_F","",0},
			{"200Rnd_65x39_cased_Box","",0},
			{"srifle_DMR_02_F","",0},
			{"srifle_DMR_02_camo_F","",0},
			{"srifle_DMR_02_sniper_F","",0},
			{"10Rnd_338_Mag","",0},
			{"muzzle_snds_338_black","",0},
			{"muzzle_snds_338_green","",0},
			{"muzzle_snds_338_sand","",0},
			{"muzzle_snds_L","",0},
			{"muzzle_snds_H","",0},
			{"muzzle_snds_B","",0},
			{"muzzle_snds_H_MG","",0},
			{"optic_Aco_smg","",0},
			{"optic_MRCO","",0},
			{"optic_DMS","",0},
			{"optic_Hamr","",0},
			{"optic_NVS","",0},
			{"optic_Arco","",0},
			{"optic_SOS","",0},
			{"optic_LRPS","",0},
			{"optic_KHS_blk","",0},
			{"optic_KHS_hex","",0},
			{"optic_KHS_old","",0},
			{"optic_KHS_tan","",0},
			{"optic_AMS","",0},
			{"optic_AMS_khk","",0},
			{"optic_AMS_snd","",0},
			{"bipod_01_F_blk","",0},
			{"bipod_01_F_mtp","",0},
			{"bipod_01_F_snd","",0},
			{"bipod_02_F_hex","",0},
			{"bipod_02_F_tan","",0},
			{"bipod_03_F_oli","",0},
			{"acc_flashlight","",0},
			{"acc_pointer_IR","",0},
			{"B_UavTerminal","",0}
        };
    };
    class cop_kripo {
        name = "Kripo Shop";
        side = "cop";
        license = "kripo";
        level = -1;
        msg = "Du musst in der Kripo sein!";
        items[] = {
            {"SmokeShellGreen","Traenengas",0},
			{"SmokeShellBlue","Rauchgranate Blau",0},
			{"SmokeShell","Rauchgranate Weiss",0},
			{"HandGrenade_Stone","Blendgranate",0},
			{"hgun_P07_snds_F","Taser Pistole",0},
			{"30Rnd_9x21_Mag","Taser Pistolen Magazin",0},
			{"arifle_sdar_F","Taser Gewehr",0},
			{"20Rnd_556x45_UW_mag","Taser Gewehr Magazin",0},
			{"arifle_MXC_Black_F","Gummi MX Schwarz",0},
			{"hgun_Rook40_F","",0},
			{"30Rnd_9x21_Mag","",0},
			{"hgun_Pistol_heavy_02_F","",0},
			{"6Rnd_45ACP_Cylinder","",0},
			{"hgun_ACPC2_F","",0},
			{"9Rnd_45ACP_Mag","",0},
			{"hgun_Pistol_heavy_01_F","",0},
			{"11Rnd_45ACP_Mag","",0},
			{"hgun_PDW2000_F","",0},
			{"16Rnd_9x21_Mag","",0},
			{"30Rnd_9x21_Mag","",0},
			{"SMG_01_F","",0},
			{"30Rnd_45ACP_Mag_SMG_01","",0},
			{"arifle_SDAR_F","",0},
			{"20Rnd_556x45_UW_mag","",0},
			{"arifle_TRG20_F","TRG-20 5.56mm",0},
			{"30Rnd_556x45_Stanag_Tracer_Red","",0},
			{"srifle_EBR_F","",0},
			{"srifle_DMR_03_F","",0},
			{"srifle_DMR_03_khaki_F","",0},
			{"srifle_DMR_03_tan_F","",0},
			{"srifle_DMR_03_woodland_F","",0},
			{"srifle_DMR_03_multicam_F","",0},
			{"20Rnd_762x51_Mag","",0},
			{"LMG_Mk200_F","",0},
			{"200Rnd_65x39_cased_Box","",0},
			{"arifle_MX_F","",0},
			{"arifle_MXM_F","",0},
			{"30Rnd_65x39_caseless_mag","",0},
			{"arifle_MX_SW_F","",0},
			{"100Rnd_65x39_caseless_mag","",0},
			{"muzzle_snds_338_black","",0},
			{"muzzle_snds_338_green","",0},
			{"muzzle_snds_338_sand","",0},
			{"muzzle_snds_L","",0},
			{"muzzle_snds_H","",0},
			{"muzzle_snds_B","",0},
			{"optic_Aco_smg","",0},
			{"optic_MRCO","",0},
			{"optic_DMS","",0},
			{"optic_Hamr","",0},
			{"optic_NVS","",0},
			{"optic_Arco","",0},
			{"optic_SOS","",0},
			{"optic_LRPS","",0},
			{"optic_KHS_blk","",0},
			{"optic_KHS_tan","",0},
			{"bipod_01_F_blk","",0},
			{"bipod_01_F_mtp","",0},
			{"bipod_01_F_snd","",0},
			{"bipod_02_F_hex","",0},
			{"bipod_02_F_tan","",0},
			{"bipod_03_F_oli","",0},
			{"acc_flashlight","",0},
			{"acc_pointer_IR","",0},
			{"B_UavTerminal","",0}
        };
    };
    //Medic Shops
    class med_basic {
        name = "Medic Shop";
        side = "med";
        license = "";
        level = -1;
        items[] = {
            { "ItemGPS", "", 0 },
			{ "Binocular", "", 0 },
			{ "ToolKit", "", 0 },
			{ "FirstAidKit", "", 0 },
			{ "Medikit", "", 0 },
			{ "NVGoggles", "", 0 },
			{ "ItemRadio", "Smartphone", 0 },
			{ "ItemWatch", "", 0 },
			{ "ItemCompass", "", 0 },
			{ "ItemMap", "", 0 },
			{"SmokeShellBlue","Rauchgranate Blau",0},
			{"SmokeShell","Rauchgranate Weiss",0}
        };
    };
	class alac_basic {
        name = "ALAC Shop";
        side = "med";
        license = "";
        level = -1;
        items[] = {
            { "ItemGPS", "", 0 },
			{ "Binocular", "", 0 },
			{ "ToolKit", "", 0 },
			{ "FirstAidKit", "", 0 },
			{ "Medikit", "", 0 },
			{ "NVGoggles", "", 0 },
			{ "ItemRadio", "Smartphone", 0 },
			{ "ItemWatch", "", 0 },
			{ "ItemCompass", "", 0 },
			{ "ItemMap", "", 0 }
        };
    };
	class thw_basic {
        name = "THW Shop";
        side = "med";
        license = "";
        level = -1;
        items[] = {
            { "ItemGPS", "", 0 },
			{ "Binocular", "", 0 },
			{ "ToolKit", "", 0 },
			{ "FirstAidKit", "", 0 },
			{ "Medikit", "", 0 },
			{ "NVGoggles", "", 0 },
			{ "ItemRadio", "Smartphone", 0 },
			{ "ItemWatch", "", 0 },
			{ "ItemCompass", "", 0 },
			{ "ItemMap", "", 0 }
        };
    };
	class event_basic {
        name = "Event Shop";
        side = "med";
        license = "";
        level = -1;
        items[] = {
            { "ItemGPS", "", 0 },
			{ "Binocular", "", 0 },
			{ "Rangefinder", "", 0 },
			{ "ToolKit", "", 0 },
			{ "FirstAidKit", "", 0 },
			{ "Medikit", "", 0 },
			{ "NVGoggles", "", 0 },
			{ "ItemRadio", "Smartphone", 0 },
			{ "ItemWatch", "",0 },
			{ "ItemCompass", "", 0 },
			{ "ItemMap", "", 0 },
			{ "Chemlight_green", "", 0 },
			{ "Chemlight_red", "", 0 },
			{ "Chemlight_yellow", "", 0 },
			{ "Chemlight_blue", "", 0 },
			{"SmokeShellBlue","Rauchgranate Blau",0},
			{"SmokeShellGreen","Rauchgranate Grün",0},
			{"SmokeShellRed","Rauchgranate Rot",0},
			{"SmokeShellYellow","Rauchgranate Gelb",0},
			{"SmokeShellPurple","Rauchgranate Lila",0},
			{"SmokeShellOrange","Rauchgranate Orange",0},
			{"SmokeShell","Rauchgranate Weiss",0}
        };
    };
	class event_weapon {
        name = "Event Waffen Sorted by Bing";
        side = "med";
        license = "";
        level = -1;
        items[] = {
            {"hgun_Rook40_F","",0},
			{"30Rnd_9x21_Mag","",0},
			{"hgun_Pistol_heavy_02_F","",0},
			{"6Rnd_45ACP_Cylinder","",0},
			{"hgun_ACPC2_F","",0},
			{"9Rnd_45ACP_Mag","",0},
			{"hgun_Pistol_heavy_01_F","",0},
			{"11Rnd_45ACP_Mag","",0},
			{"hgun_PDW2000_F","",0},
			{"16Rnd_9x21_Mag","",0},
			{"SMG_01_F","",0},
			{"30Rnd_45ACP_Mag_SMG_01","",0},
			{"arifle_SDAR_F","",0},
			{"20Rnd_556x45_UW_mag","",0},
			{"arifle_TRG20_F","TRG-20 5.56mm",0},
			{"30Rnd_556x45_Stanag_Tracer_Red","",0},
			{"arifle_TRG21_F","TRG-21 5.56mm",0},
			{"arifle_Mk20_F","",0},
			{"30Rnd_556x45_Stanag","",0},
			{"arifle_Katiba_F","",0},
			{"30Rnd_65x39_caseless_green","",0},
			{"srifle_DMR_01_F","",0},
			{"10Rnd_762x54_Mag","",0},
			{"srifle_EBR_F","",0},
			{"srifle_DMR_03_F","",0},
			{"srifle_DMR_03_khaki_F","",0},
			{"srifle_DMR_03_tan_F","",0},
			{"srifle_DMR_03_woodland_F","",0},
			{"srifle_DMR_03_multicam_F","",0},
			{"srifle_DMR_06_olive_F","",0},
			{"srifle_DMR_06_camo_F","",0},
			{"20Rnd_762x51_Mag","",0},
			{"LMG_Mk200_F","",0},
			{"200Rnd_65x39_cased_Box","",0},
			{"arifle_MXC_Black_F","",0},
			{"arifle_MX_Black_F","",0},
			{"arifle_MX_SW_Black_F","",0},
			{"arifle_MXM_Black_F","",0},
			{"arifle_Katiba_GL_F","",0},
			{"30Rnd_65x39_caseless_green","",0},
			{"1Rnd_Smoke_Grenade_shell","",0},
			{"1Rnd_SmokeRed_Grenade_shell","",0},
			{"1Rnd_SmokeGreen_Grenade_shell","",0},
			{"1Rnd_SmokeYellow_Grenade_shell","",0},
			{"1Rnd_SmokePurple_Grenade_shell","",0},
			{"1Rnd_SmokeBlue_Grenade_shell","",0},
			{"1Rnd_SmokeOrange_Grenade_shell","",0},
			//{"srifle_DMR_02_F","",0},
			//{"srifle_DMR_02_camo_F","",0},
			//{"srifle_DMR_02_sniper_F","",0},
			//{"10Rnd_338_Mag","",0},
			{"30Rnd_65x39_caseless_mag","",0},
			{"100Rnd_65x39_caseless_mag","",0},
			{"HandGrenade_Stone","Blendgranate",0},
			{"optic_Yorris","",0},
			{"optic_Aco","",0},
			{"optic_ACO_grn","",0},
			{"optic_ACO_grn_smg","",0},
			{"optic_Holosight","",0},
			{"optic_Holosight_smg","",0},
			{"optic_Arco","",0},
			{"optic_Hamr","",0},
			{"optic_MRCO","",0},
			{"optic_SOS","",0},
			{"optic_LRPS","",0},
			{"optic_DMS","",0},
			{"optic_NVS","",0},
			{"optic_KHS_blk","",0},
			{"optic_AMS","",0},
			{"optic_AMS_snd","",0},
			{"acc_pointer_IR","",0},
			{"acc_flashlight","",0},
			{"bipod_01_F_blk","",0},
			{"bipod_01_F_mtp","",0},
			{"bipod_01_F_snd","",0},
			{"bipod_02_F_hex","",0},
			{"bipod_02_F_tan","",0},
			{"bipod_03_F_oli","",0},
			{"muzzle_snds_M","",0},
			{"muzzle_snds_H","",0},
			{"muzzle_snds_B","",0},
			{"muzzle_snds_338_black","",0},
			{"muzzle_snds_338_green","",0},
			{"muzzle_snds_338_sand","",0}
        };
    };
	//ASF
	class asf_basic {
        name = "ASF Shop";
        side = "asf";
        license = "";
        level = -1;
        items[] = {
            { "ItemGPS", "", 0 },
			{ "Binocular", "", 0 },
			{ "ToolKit", "", 0 },
			{ "FirstAidKit", "", 0 },
			{ "Medikit", "", 0 },
			{ "NVGoggles_OPFOR", "", 0 },
			{ "Rangefinder", "", 0 },
			{ "ItemRadio", "Smartphone", 0 },
			{ "ItemWatch", "", 0 },
			{ "ItemCompass", "", 0 },
			{ "ItemMap", "", 0 }
        };
    };
	class asf_private {
        name = "Private Shop";
        side = "asf";
        license = "";
        level = 1;
        msg = "Du musst Private sein!";
        items[] = {
            {"SmokeShellRed","",0},
			{"hgun_P07_snds_F","",0},
			{"30Rnd_9x21_Mag","",0},
			{"arifle_MXC_Black_F","Gummi MX Schwarz",0},
			{"30Rnd_65x39_caseless_mag_Tracer","Gummigeschosse",0},
			{"30Rnd_65x39_caseless_mag","",0},
			{"arifle_MX_Black_F","",0},
			{"arifle_MX_SW_Black_F","",0},
			{"100Rnd_65x39_caseless_mag","",0},
			{"muzzle_snds_H","",0},
			{"optic_Aco_smg","",0},
			{"optic_MRCO","",0},
			{"optic_DMS","",0},
			{"optic_Hamr","",0},
			{"optic_NVS","",0},
			{"optic_Arco","",0},
			{"optic_SOS","",0},
			{"optic_LRPS","",0},
			{"optic_KHS_blk","",0},
			{"optic_KHS_hex","",0},
			{"optic_KHS_old","",0},
			{"optic_KHS_tan","",0},
			{"optic_AMS","",0},
			{"optic_AMS_khk","",0},
			{"optic_AMS_snd","",0},
			{"bipod_01_F_blk","",0},
			{"bipod_01_F_mtp","",0},
			{"bipod_01_F_snd","",0},
			{"bipod_02_F_hex","",0},
			{"bipod_02_F_tan","",0},
			{"bipod_03_F_oli","",0},
			{"acc_flashlight","",0},
			{"acc_pointer_IR","",0}
        };
    };
	class asf_corporel {
        name = "Corporel Shop";
        side = "asf";
        license = "";
        level = 2;
        msg = "Du musst Corporel sein!";
        items[] = {
            {"SmokeShellRed","",0},
			{"HandGrenade_Stone","Blendgranate",0},
			{"hgun_P07_snds_F","",0},
			{"30Rnd_9x21_Mag","",0},
			{"arifle_MXC_Black_F","Gummi MX Schwarz",0},
			{"30Rnd_65x39_caseless_mag_Tracer","Gummigeschosse",0},
			{"30Rnd_65x39_caseless_mag","",0},
			{"arifle_MX_Black_F","",0},
			{"arifle_MXM_Black_F","",0},
			{"arifle_MX_SW_Black_F","",0},
			{"100Rnd_65x39_caseless_mag","",0},
			{"muzzle_snds_H","",0},
			{"optic_Aco_smg","",0},
			{"optic_MRCO","",0},
			{"optic_DMS","",0},
			{"optic_Hamr","",0},
			{"optic_NVS","",0},
			{"optic_Arco","",0},
			{"optic_SOS","",0},
			{"optic_LRPS","",0},
			{"optic_KHS_blk","",0},
			{"optic_KHS_hex","",0},
			{"optic_KHS_old","",0},
			{"optic_KHS_tan","",0},
			{"optic_AMS","",0},
			{"optic_AMS_khk","",0},
			{"optic_AMS_snd","",0},
			{"bipod_01_F_blk","",0},
			{"bipod_01_F_mtp","",0},
			{"bipod_01_F_snd","",0},
			{"bipod_02_F_hex","",0},
			{"bipod_02_F_tan","",0},
			{"bipod_03_F_oli","",0},
			{"acc_flashlight","",0},
			{"acc_pointer_IR","",0}
        };
    };
	class asf_leutnant {
        name = "Leutnant Shop";
        side = "asf";
        license = "";
        level = 3;
        msg = "Du musst Leutnant sein!";
        items[] = {
            {"SmokeShellRed","",0},
			{"HandGrenade_Stone","Blendgranate",0},
			{"hgun_P07_snds_F","",0},
			{"30Rnd_9x21_Mag","",0},
			{"hgun_Pistol_heavy_02_F","",0},
			{"6Rnd_45ACP_Cylinder","",0},
			{"arifle_MXC_Black_F","Gummi MX Schwarz",0},
			{"30Rnd_65x39_caseless_mag_Tracer","Gummigeschosse",0},
			{"30Rnd_65x39_caseless_mag","",0},
			{"arifle_SDAR_F","",0},
			{"30Rnd_556x45_Stanag","",0},
			{"arifle_MX_Black_F","",0},
			{"arifle_MXM_Black_F","",0},
			{"arifle_MX_SW_Black_F","",0},
			{"100Rnd_65x39_caseless_mag","",0},
			{"LMG_Mk200_F","",0},
			{"200Rnd_65x39_cased_Box","",0},
			{"srifle_EBR_F","",0},
			{"srifle_DMR_03_F","",0},
			{"srifle_DMR_03_khaki_F","",0},
			{"srifle_DMR_03_tan_F","",0},
			{"srifle_DMR_03_woodland_F","",0},
			{"srifle_DMR_03_multicam_F","",0},
			{"srifle_DMR_06_camo_F","",0},
			{"srifle_DMR_06_olive_F","",0},
			{"20Rnd_762x51_Mag","",0},
			{"srifle_DMR_02_F","",0},
			{"srifle_DMR_02_camo_F","",0},
			{"srifle_DMR_02_sniper_F","",0},
			{"10Rnd_338_Mag","",0},
			{"muzzle_snds_338_black","",0},
			{"muzzle_snds_338_green","",0},
			{"muzzle_snds_338_sand","",0},
			{"muzzle_snds_L","",0},
			{"muzzle_snds_H","",0},
			{"muzzle_snds_B","",0},
			{"muzzle_snds_H_MG","",0},
			{"optic_Aco_smg","",0},
			{"optic_MRCO","",0},
			{"optic_DMS","",0},
			{"optic_Hamr","",0},
			{"optic_NVS","",0},
			{"optic_Arco","",0},
			{"optic_SOS","",0},
			{"optic_LRPS","",0},
			{"optic_KHS_blk","",0},
			{"optic_KHS_hex","",0},
			{"optic_KHS_old","",0},
			{"optic_KHS_tan","",0},
			{"optic_AMS","",0},
			{"optic_AMS_khk","",0},
			{"optic_AMS_snd","",0},
			{"bipod_01_F_blk","",0},
			{"bipod_01_F_mtp","",0},
			{"bipod_01_F_snd","",0},
			{"bipod_02_F_hex","",0},
			{"bipod_02_F_tan","",0},
			{"bipod_03_F_oli","",0},
			{"acc_flashlight","",0},
			{"acc_pointer_IR","",0}
        };
    };
};
