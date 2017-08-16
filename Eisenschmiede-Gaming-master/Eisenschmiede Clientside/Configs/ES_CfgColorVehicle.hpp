/*
	Vehicle Configs (Contains textures and other stuff)

	storageFee (Getting vehicles out of garage) format:
		INDEX 0: Civilian Price
		INDEX 1: Cop Price
		INDEX 3: EMS Price
		INDEX 4: OPFOR Price (Not implemented in vanilla but still leaving support

	Textures config follows { Texture Name, side, {texture(s)path}}
	Texture(s)path follows this format:
		INDEX 0: Texture Layer 0
		INDEX 1: Texture Layer 1
		INDEX 2: Texture Layer 2
		etc etc etc
*/
class CfgVehicles {
	class Default {
		vItemSpace = -1;
		storageFee[] = { 1000, 1000, 1000, 1000 };
		garageSell[] = { 0, 0, 0, 0 };
		insurance = 2500;
		chopShop = 1200;
		textures[] = {};
	};

	class I_Truck_02_medical_F : Default {
		vItemSpace = 150;
		storageFee[] = { 0, 0, 1500, 0 };
		garageSell[] = { 0, 0, 5000, 0 };
		chopShop = 3000;
	};

	class O_Truck_03_medical_F : Default {
		vItemSpace = 200;
		storageFee[] = { 0, 0, 3000, 0 };
		garageSell[] = { 0, 0, 10000, 0 };
		chopShop = 7500;
	};

	class B_Truck_01_medical_F : Default {
		vItemSpace = 250;
		storageFee[] = { 0, 0, 6500, 0 };
		garageSell[] = { 0, 0, 25000, 0 };
		chopShop = 12500;
	};

	class C_Rubberboat {
        vItemSpace = 50;
        storageFee[] = { 400, 300, 0, 0 };
		garageSell[] = { 950, 350, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class B_Heli_Transport_01_F {
		vItemSpace = 250;
		storageFee[] = { 0, 50000, 0, 0 };
		garageSell[] = { 0, 85000, 0, 0 };
		insurance = 16000;
		chopShop = 45000;
		textures[] = {
             { "Black", "cop", {
                 "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
                 "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } },
            { "Cop Heli", "cop", {
                "Images\fahrz\pol\ghost_hawk_polizei_a.paa",
                "Images\fahrz\pol\ghost_hawk_polizei_b.paa"
            } },
            { "FBI", "cop", {
                "Images\fahrz\pol\fbi_ghosthawk_1.paa",
                "Images\fahrz\pol\fbi_ghosthawk_2.paa"
            } },
            { "SWAT", "cop", {
                "Images\fahrz\pol\swat_ghosthawk_1.paa",
                "Images\fahrz\pol\swat_ghosthawk_2.paa"
            } },
            { "NCIS", "cop", {
                "Images\fahrz\pol\ncis_ghosthawk_1.paa",
                "Images\fahrz\pol\ncis_ghosthawk_2.paa"
            } },
            { "TDF", "civ", {
                "Images\clans\tdf\tdf_ghosthawk_a.jpg",
                "Images\clans\tdf\tdf_ghosthawk_b.jpg"
            } }
        };
	};

	class O_Boat_Armed_01_hmg_F {
        vItemSpace = 75;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 21000, 21000, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

     class I_G_Van_01_fuel_F {
        vItemSpace = 50;
        storageFee[] = { 1000, 1000, 1000, 1000 };
        garageSell[] = { 21000, 21000, 21000, 21000 };
        insurance = 2500;
        chopShop = 5000;
         textures[] = {
        	{ "Tanklaster", "med", {
                "Images\fahrz\feuerw\ff_van_a.jpg"
            } }
        };
    };

	class B_Boat_Armed_01_minigun_F {
        vItemSpace = 75;
        storageFee[] = { 0, 16500, 0, 0 };
		garageSell[] = { 0, 21000, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
        	{ "Boot", "cg", {
                "Images\fahrz\pol\boot_police.paa"
            } }
        };
    };
	
	class I_Truck_02_box_F {
        vItemSpace = 400;
        storageFee[] = { 0, 16500, 0, 0 };
		garageSell[] = { 0, 21000, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
        	{ "Zamak Transporter", "med", {
                "Images\fahrz\feuerw\zamak_ff_a.paa",
				"Images\fahrz\feuerw\zamak_ff_c.paa"
            } },
			{ "Black Transporter", "reb", {
				 "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
                 "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } },
			{ "ViP Transporter", "donator", {
				"Images\fahrz\don\EQT_Zamak_Mela.jpg",
				"Images\fahrz\don\EQT_Zamak_MelaBak.jpg"
            } },
			{ "ViP Transporter", "donator", {
				"Images\fahrz\don\SAF_Zamak1.jpg",
				"Images\fahrz\don\SAF_ZamakBak2.jpg"
            } }
        };
    };

	class I_Boat_Armed_01_minigun_F {
        vItemSpace = 75;
        storageFee[] = { 1000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class B_G_Boat_Transport_01_F {
        vItemSpace = 50;
        storageFee[] = { 1000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class B_Boat_Transport_01_F {
        vItemSpace = 50;
        storageFee[] = { 0, 450, 0, 0 };
		garageSell[] = { 0, 850, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
        	{ "Cop Boot", "cg", {
                "Images\fahrz\pol\boot_police.paa"
            } }
        };
    };

	class O_Truck_03_transport_F {
        vItemSpace = 500;
        storageFee[] = { 1000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class O_Truck_03_device_F {
        vItemSpace = 400;
        storageFee[] = { 95000, 0, 0, 0 };
		garageSell[] = { 185000, 0, 0, 0 };
        insurance = 25000;
        chopShop = 125000;
        textures[] = { };
    };

	class Land_CargoBox_V1_F : Default {
        vItemSpace = 5000;
    };

	class Box_IND_Grenades_F : Default {
        vItemSpace = 350;
    };

	class B_supplyCrate_F {
        vItemSpace = 700;
    };

	class B_G_Offroad_01_F {
        vItemSpace = 100;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 3500, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
      textures[] = {
        	{ "Red", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"
            } },
			{ "Yellow", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa"
            } },
			{ "White", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa"
            } },
			{ "Blue", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa"
            } },
			{ "Dark Red", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa"
            } },
			{ "Blue / White", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa"
            } },
            { "Fed", "fed", {
	                "#(ai,64,64,1)Fresnel(0.3,3)"
            } },
			{ "Police Car", "cop", {
	                "Images\fahrz\pol\offroad_police.paa"
            } },
			{ "Police Undercover", "cop", {
	                "#(ai,64,64,1)Fresnel(1.3,7)"
            } },
            { "Taxi", "civ", {
	                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            } },
			{ "Dienst Fahrzeug", "med", {
	                "Images\fahrz\feuerw\offroad_ff.paa"
            } },
			{ "ViP Bear", "donator", {
	                "Images\fahrz\don\bear_offroad.paa"
            } },	
			{ "ViP Camo", "donator", {
	                "Images\fahrz\don\civ_offroad_camo.paa"
            } },
			{ "ViP Dodge", "donator", {
	                "Images\fahrz\don\civ_offroad_dodge.jpg"
            } },
			{ "ViP Weed", "donator", {
	                "Images\fahrz\don\civ_offroad_weed.jpg"
            } },
			{ "ViP Kirche", "donator", {
	                "Images\fahrz\don\Kirchenoffroader.paa"
            } },
			{ "ViP Rockstar G", "donator", {
	                "Images\fahrz\don\civ_offroad_rockstargelb.jpg"
            } },
			{ "ViP Rockstar L", "donator", {
	                "Images\fahrz\don\civ_offroad_rockstarlila.jpg"
            } },
			{ "ViP Totenkopf", "donator", {
	                "Images\fahrz\don\EQT_offroadReb.jpg"
            } }
	    };
    };

	class B_G_Offroad_01_armed_F : B_G_Offroad_01_F {
		vItemSpace = 90;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 3500, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
		{ "Red", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"
            } },
			{ "Yellow", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa"
            } },
			{ "White", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa"
            } },
			{ "Blue", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa"
            } },
			{ "Dark Red", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa"
            } },
			{ "Blue / White", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa"
            } },
            { "Fed", "fed", {
	                "#(ai,64,64,1)Fresnel(0.3,3)"
            } },
			{ "Police Car", "cop", {
	                "Images\fahrz\pol\offroad_police.paa"
            } },
			{ "Police Undercover", "cop", {
	                "#(ai,64,64,1)Fresnel(1.3,7)"
            } },
            { "Taxi", "civ", {
	                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            } },
			{ "Dienst Fahrzeug", "med", {
	                "Images\fahrz\feuerw\offroad_ff.paa"
            } },
			{ "ViP Bear", "donator", {
	                "Images\fahrz\don\bear_offroad.paa"
            } },	
			{ "ViP Camo", "donator", {
	                "Images\fahrz\don\civ_offroad_camo.paa"
            } },
			{ "ViP Dodge", "donator", {
	                "Images\fahrz\don\civ_offroad_dodge.jpg"
            } },
			{ "ViP Weed", "donator", {
	                "Images\fahrz\don\civ_offroad_weed.jpg"
            } },
			{ "ViP Kirche", "donator", {
	                "Images\fahrz\don\civ_ofroaderkirche.jpg"
            } },			
			{ "ViP Rockstar G", "donator", {
	                "Images\fahrz\don\civ_offroad_rockstargelb.jpg"
            } },
			{ "ViP Rockstar L", "donator", {
	                "Images\fahrz\don\civ_offroad_rockstarlila.jpg"
            } },
			{ "ViP Totenkopf", "donator", {
	                "Images\fahrz\don\EQT_offroadReb.jpg"
            } }
	    };
    };

	class I_G_Van_01_transport_F {
        vItemSpace = 350;
        storageFee[] = { 1000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class C_Boat_Civil_01_F {
        vItemSpace = 90;
        storageFee[] = { 4500, 2500, 0, 0 };
		garageSell[] = { 6800, 3500, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class C_Boat_Civil_01_police_F {
        vItemSpace = 90;
        storageFee[] = { 0, 3500, 0, 0 };
		garageSell[] = { 0, 4950, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
        	{ "Cop Boot", "cg", {
                "Images\fahrz\pol\boot_police.paa"
            } }
        };
    };

	class C_Boat_Civil_01_rescue_F {
        vItemSpace = 90;
        storageFee[] = { 1000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
        	{ "Speed Boot", "civ", {
                "Images\fahrz\don\boat.jpg"
            } },
			{ "Speed Yacht", "civ", {
                "Images\fahrz\don\customboat.jpg"
            } }
        };
    };

	class B_Truck_01_box_F {
        vItemSpace = 750;
        storageFee[] = { 35000, 0, 0, 0 };
		garageSell[] = { 150000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class B_Truck_01_transport_F {
        vItemSpace = 600;
        storageFee[] = { 25650, 0, 0, 0 };
		garageSell[] = { 135000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
        	{ "Abschlepp Fahrzeug", "med", {
				"Images\fahrz\feuerw\hmmt_ff_a.jpg",
				"Images\fahrz\feuerw\hmmt_ff_b.jpg",
				"Images\fahrz\feuerw\hmmt_ff_c.jpg"
            } },
			{ "Rebellen Transporter", "reb", {
                "#(ai,64,64,1)Fresnel(1.3,7)"
            } },
			{ "CiV Transporter", "civ", {
                "#(argb,8,8,3)color(1,0,1,1)"
            } },
			{ "ViP Transporter Pink", "donator", {
                "#(argb,8,8,3)color(1,0,1,1)"
            } },
			{ "ViP Transporter Devil", "donator", {
                "Images\fahrz\don\civ_hemtt_devil_0.jpg",
				"Images\fahrz\don\civ_hemtt_devil_1.jpg"
            } },
			{ "ViP Transporter Kitty", "donator", {
                "Images\fahrz\don\civ_hemtt_kitty_0.jpg",
				"Images\fahrz\don\civ_hemtt_kitty_1.jpg"
            } },
			{ "ADAC Fahrzeug", "med", {
                "Images\fahrz\feuerw\hemtt_adac.jpg"
            } }
        };
    };

	class O_MRAP_02_F {
        vItemSpace = 160;
        storageFee[] = { 45000, 0, 0, 0 };
		garageSell[] = { 65000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
		textures[] = {
        	{ "ViP Blau Flecktarn", "donator", {
                "Images\fahrz\don\Ifrit_front.paa",
				"Images\fahrz\don\Ifrit_back.paa"
            } },
			{ "ViP Rot Flecktarn", "donator", {
                "Images\fahrz\don\ifrit_r1.paa",
				"Images\fahrz\don\ifrit_r2.paa"
            } },
			{ "ViP Mil Flecktarn Devil", "donator", {
                "Images\fahrz\don\ifritg1.paa",
				"Images\fahrz\don\ifritg2.paa"
            } },
			{ "ViP Flecktarn Grün", "donator", {
                "Images\fahrz\don\ifritrebell1.jpg",
				"Images\fahrz\don\ifrittrebell2.jpg"
            } },
			{ "Ai Fahreug", "ai", {
                "Images\clans\ai\ifrit_a_1_ai.paa",
				"Images\clans\ai\ifrit_b_1_ai.paa"
            } },
			{ "ViP Mil Tarn", "donator", {
                "Images\fahrz\don\EQT_ifritR.jpg",
				"Images\fahrz\don\EQT_ifritR2.jpg"
            } },
			{ "Miliz Fahrzeug", "ksk", {
                "Images\clans\ksk\mrap_02_ext_01_co.jpg",
				"Images\clans\ksk\mrap_02_ext_02_co.jpg"
            } },
			{ "SK Fahrzeug", "sk", {
                "Images\clans\sk\mrap_02_ext_01_co.jpg",
				"Images\clans\sk\mrap_02_ext_02_co.jpg"
            } }
        };
    };
	
	class B_Truck_01_fuel_F {
        vItemSpace = 120;
        storageFee[] = { 45000, 0, 0, 0 };
		garageSell[] = { 65000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class I_MRAP_03_F {
        vItemSpace = 45;
        storageFee[] = { 12500, 5000, 0, 0 };
		garageSell[] = { 15000, 7500, 0, 0 };
        insurance = 5500;
        chopShop = 20000;
        textures[] = {
        	{ "Police", "cop", {
                "Images\fahrz\pol\strider_police.paa"
            } },
			{ "Red", "faa", {
                "Images\clans\faa\mrap_03_ext_indp_co.jpg"
            } },
			{ "ViP Reb", "donator", {
                "Images\fahrz\don\reb_strider.paa"
            } },
			{ "ViP Gold", "donator", {
                "Images\fahrz\don\stridergold.jpg"
            } },
			{ "ViP Grau Camo", "donator", {
                "Images\fahrz\don\stridergraucamo.jpg"
            } },
			{ "Unit Fahrzeug", "unit", {
                "Images\clans\Unit\unitstrider.paa"
            } },
			{ "Ai Fahrzeug", "ai", {
                "Images\clans\ai\ai_strider.jpg"
            } },
			{ "Strider", "reb", {
                "Images\fahrz\don\reb_strider.paa"
            } },		
			{ "ViP Strider", "donator", {
                "Images\fahrz\don\EQT_r_strider.jpg"
            } },
			{ "ViP Totenkopf Strider", "donator", {
                "Images\fahrz\don\EQT_REB_STRI.jpg"
            } },
			{ "ViP Totenkopf Strider", "donator", {
                "Images\fahrz\don\EQT_REB_Strider.jpg"
            } },
			{ "Clan Strider", "ksk", {
                "Images\clans\ksk\mrap_03strider_ext_indp_co.jpg"
            } },
			{ "Dienst Fahreug", "med", {
                "Images\fahrz\feuerw\strider_ff.jpg"
            } },
            { "FBI", "cop", {
                "Images\fahrz\pol\fbi_strider.paa"
            } },
            { "SWAT", "cop", {
                "Images\fahrz\pol\swat_strider.paa"
            } },
			{ "SK Fahrzeug", "sk", {
                "Images\clans\sk\strider.jpg"
            } },
			{ "Gis Fahrzeug", "gis", {
                "Images\clans\gis\GIS Stridermrap_03_ext_co.jpg"
            } },
			{ "Legion Fahrzeug", "le", {
                "Images\clans\le\mrap_03_ext_costrider.jpg"
            } },
			{ "Barton Fahrzeug", "sk", {
                "Images\clans\sk\Miliz_Skin_Pink.jpg"
            } },
			{ "SK Fahrzeug al", "sk", {
                "Images\clans\sk\strider2.jpg"
            } },
			{ "SK Fahrzeug al", "med", {
                "Images\fahrz\feuerw\strider_kuesten.jpg"
            } },
            { "TDF Fahrzeug", "tdf", {
                "Images\clans\tdf\strider_tdf.jpg"
            } },
            { "Kartell Fahrzeug", "kartellskin", {
                "Images\clans\Kartel\strider_kartell.jpg"
            } },
			 { "SAS Fahrzeug", "sas", {
                "Images\clans\sas\strider_sas.jpg"
            } }
        };
    };

	class C_Offroad_01_F {
        vItemSpace = 65;
        storageFee[] = { 1000, 500, 650, 1000 };
		garageSell[] = { 6500, 2500, 0, 0 };
        insurance = 2500;
        chopShop = 2500;
        textures[] = {
        	{ "Red", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"
            } },
			{ "Yellow", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa"
            } },
			{ "White", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa"
            } },
			{ "Blue", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa"
            } },
			{ "Dark Red", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa"
            } },
			{ "Blue / White", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa"
            } },
            { "Fed", "fed", {
	                "#(ai,64,64,1)Fresnel(0.3,3)"
            } },
			{ "Police Car", "cop", {
	                "Images\fahrz\pol\offroad_police.paa"
            } },
			{ "Police Undercover", "cop", {
	                "#(ai,64,64,1)Fresnel(1.3,7)"
            } },
            { "Taxi", "civ", {
	                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            } },
			{ "Dienst Fahrzeug", "med", {
	                "Images\fahrz\feuerw\offroad_ff.jpg"
            } },
			{ "ViP Bear", "donator", {
	                "Images\fahrz\don\bear_offroad.paa"
            } },	
			{ "ViP Camo", "donator", {
	                "Images\fahrz\don\civ_offroad_camo.paa"
            } },
			{ "ViP Dodge", "donator", {
	                "Images\fahrz\don\civ_offroad_dodge.jpg"
            } },
			{ "ViP Weed", "donator", {
	                "Images\fahrz\don\civ_offroad_weed.jpg"
            } },
			{ "ViP Kirche", "donator", {
	                "Images\fahrz\don\civ_ofroaderkirche.jpg"
            } },
			{ "ViP Rockstar G", "donator", {
	                "Images\fahrz\don\civ_offroad_rockstargelb.jpg"
            } },
			{ "ViP Rockstar L", "donator", {
	                "Images\fahrz\don\civ_offroad_rockstarlila.jpg"
            } },
			{ "Miliz Fahrzeug", "ksk", {
	                "Images\clans\ksk\offroad_01_ext_base02_co.jpg"
            } },
			{ "ADAC Fahrzeug", "med", {
	                "Images\fahrz\feuerw\offroadadac.jpg"
            } }
	    };
    };

	class C_Kart_01_Blu_F {
		vItemSpace = 20;
		storageFee[] = { 1500, 0, 0, 0 };
		garageSell[] = { 3500, 0, 0, 0 };
		inusrance = 1650;
		chopShop = 3500;
		textures[] = {};
	};

	class C_Kart_01_Fuel_F : C_Kart_01_Blu_F {}; //Inherits everything from the above class
	class C_Kart_01_Red_F : C_Kart_01_Blu_F {}; //Inherits everything from the above class
	class C_Kart_01_Vrana_F : C_Kart_01_Blu_F {}; //Inherits everything from the above class

	class C_Hatchback_01_sport_F {
        vItemSpace = 45;
        storageFee[] = { 2500, 1000, 0, 0 };
		garageSell[] = { 15000, 7500, 0, 0 };
        insurance = 5500;
        chopShop = 4500;
        textures[] = {
        	{ "Red", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"
            } },
			{ "Dark Blue", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"
            } },
			{ "Orange", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport03_co.paa"
            } },
			{ "Black / White", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa"
            } },
			{ "Beige", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport05_co.paa"
            } },
			{ "Green", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport06_co.paa"
            } },
			{ "Police Cop", "cop", {
                "Images\fahrz\pol\hatchback_police.paa"
            } },
            { "Police Undercover", "cop", {
                "#(ai,64,64,1)Fresnel(1.3,7)"
            } },
			{ "ViP Fahrzeuge Totenkopf", "donator", {
                "Images\fahrz\don\EQT_REBhatch.jpg"
            } },
            { "Dienst Fahrzeuge", "med", {
                "Images\fahrz\feuerw\Hatchback.jpg"
            } },
			 { "Unit Fahrzeuge", "unit", {
                "Images\clans\Unit\hatchback_01_ext_base01_co.jpg"
            } },
             { "Kartell Fahrzeuge", "kartellskin", {
                "Images\clans\Kartel\limo_kartell.jpg"
            } }
        };
    };

	class B_Quadbike_01_F {
        vItemSpace = 25;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 950, 0, 0, 0 };
        insurance = 2500;
        chopShop = 1250;
        textures[] = {
        	{ "Brown", "cop", {
                "\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa"
            } },
			{ "Digi Desert", "reb", {
	                "\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa"
	        } },
			{ "Black", "civ", {
	                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa"
	        } },
			{ "Blue", "civ", {
	                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa"
	        } },
			{ "Red", "civ", {
	                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa"
	        } },
			{ "White", "civ", {
	                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa"
	        } },
			{ "Digi Green", "civ", {
	                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa"
	        } },
			{ "Hunter Camo", "civ", {
	                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
	        } },
	        { "Rebel Camo", "reb", {
                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
            } },
			 { "ViP Camo", "donator", {
                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
            } },
			{ "ViP Desert", "donator", {
	                "\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa"
	        } },
			{ "Feuerwehr Quad", "med", {
	                "Images\fahrz\feuerw\quadbike_ff.jpg"
	        } }
        };
    };

	class I_Truck_02_covered_F {
        vItemSpace = 450;
        storageFee[] = { 14500, 0, 0, 0 };
		garageSell[] = { 62000, 0, 0, 0 };
        insurance = 6500;
        chopShop = 75000;
        textures[] = {
        	{ "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            } },
            { "Black", "fed", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } }
        };
    };

	class I_Truck_02_transport_F : I_Truck_02_covered_F {
        vItemSpace = 400;
        storageFee[] = { 12000, 0, 0, 0 };
		garageSell[] = { 49800, 3500, 0, 0 };
    };

	class O_Truck_03_covered_F {
		vItemSpace = 550;
		storageFee[] = { 25000, 0, 0, 0 };
		garageSell[] = { 65000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 125000;
		textures[] = {};
	};

	class C_Hatchback_01_F {
        vItemSpace = 50;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 4500, 3500, 0, 0 };
        insurance = 2500;
        chopShop = 7500;
        textures[] = {
        	{ "Beige", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa"
            } },
			{ "Green", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa"
            } },
			{ "Blue", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa"
            } },
			{ "Dark Blue", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa"
            } },
			{ "Yellow", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa"
            } },
			{ "White", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa"
            } },
			{ "Grey", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa"
            } },
            { "Black", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa"
            } },
			{ "Cop Car", "cop", {
                "Images\fahrz\pol\hatchback_police.paa"
            } },
			{ "ViP Fahrzeuge", "donator", {
                "Images\fahrz\don\Rockstar_Hatchback.paa"
            } },
			{ "Dienst Fahrzeuge", "med", {
                "Images\fahrz\feuerw\Hatchback.jpg"
            } },
			{ "ViP Fahrzeuge Totenkopf", "donator", {
                "Images\fahrz\don\EQT_REBhatch.jpg"
            } }
        };
    };

	class C_SUV_01_F {
        vItemSpace = 50;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 15000, 7500, 0, 0 };
        insurance = 2500;
        chopShop = 9500;
        textures[] = {
        	{ "Dark Red", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"
            } },
			{ "Silver", "civ", {
	                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"
            } },
			{ "Orange", "civ", {
	                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"
            } },
			{ "Cop Car", "cop", {
			 "Images\fahrz\pol\suv_police.paa"
            } },
            { "Cop Undercover", "cop", {
                "#(ai,64,64,1)Fresnel(1.3,7)"
            } },
			{ "Dienst Fahrzeug", "med", {
			 "Images\fahrz\feuerw\medic_suv.jpg"
            } },
			{ "ViP Pokemon Fahrzeug", "donator", {
			 "Images\fahrz\don\suv_pokecenter.paa"
            } },
			{ "ViP Starwars Fahrzeug", "donator", {
			 "Images\fahrz\don\starwarscar.paa"
            } },
			{ "ViP Pacman Fahrzeug", "donator", {
			 "Images\fahrz\don\suvPacMan.paa"
            } },
			{ "ViP Unicorn Fahrzeug", "donator", {
			 "Images\fahrz\don\unicorn_suv.paa"
            } },
			{ "ViP Jaguar Fahrzeug", "donator", {
			 "Images\fahrz\don\suv_jaguar.paa"
            } },
			{ "ViP Splash Fahrzeug", "donator", {
			 "Images\fahrz\don\suvasimov.jpg"
            } },
			{ "ViP Beast Fahrzeug", "donator", {
			 "Images\fahrz\don\Suvbeast.paa"
            } },
			{ "Taxi Fahrzeug", "civ", {
			 "Images\fahrz\taxisuv.paa"
            } },
            { "FBI", "cop", {
             "Images\fahrz\pol\fbi_suv.paa"
            } },
            { "SWAT", "cop", {
             "Images\fahrz\pol\swat_suv.paa"
            } },
            { "NCIS", "cop", {
             "Images\fahrz\pol\ncis_suv.paa"
            } },
            { "Police Leadership", "cop", {
             "Images\fahrz\pol\l_suv.paa"
            } },
			 { "Squad Fahrzeug", "sq", {
             "Images\clans\sq\suv_squad_v2.jpg"
            } },
			 { "Miliz Fahrzeug", "ksk", {
             "Images\clans\ksk\MilizSUV.jpg"
            } },
			 { "Unit Fahrzeug", "unit", {
             "Images\clans\Unit\suv_01_ext_02_co.jpg"
            } },
			{ "Acient Fahrzeug", "ac", {
             "Images\clans\ac\Suv01.jpg"
            } },
			{ "Medic Fahrzeug", "med", {
             "Images\fahrz\feuerw\medic_suv1.jpg"
            } },
            { "Medic Fahrzeug", "med", {
             "Images\fahrz\feuerw\medicSuv.paa"
            } }
	    };
    };

	class C_Van_01_transport_F {
        vItemSpace = 150;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 25000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 35000;
        textures[] = {
        	{ "White", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } }
        };
    };

	class C_Van_01_box_F {
        vItemSpace = 300;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 35000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 40000;
        textures[] = {
        	{ "White", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } },
			{ "Rettungs Fahrzeug", "med", {
                "Images\fahrz\feuerw\truck_ff_a.jpg",
				"Images\fahrz\feuerw\truck_ff_b.jpg"
            } },
			{ "Burger Laden", "donator", {
                "Images\fahrz\don\pop.paa"
            } },
			{ "Bier Laden", "donator", {
                "Images\fahrz\don\van_bpils1.paa",
				 "Images\fahrz\don\van_bpils2.paa"
            } },
			{ "Eis Laden", "donator", {
                "Images\fahrz\don\vanicecream2.jpg",
				"Images\fahrz\don\vanicecream.jpg"
            } },
			{ "Eis Laden", "civ", {
                "Images\fahrz\dhl_front.jpg",
				"Images\fahrz\dhl_back.jpg"
            } },
            { "Seuchenschutz Kommando", "med", {
                "Images\fahrz\feuerw\truck_seuche_a.jpg",
                "Images\fahrz\feuerw\truck_seuche_b.jpg"
            } },
			{ "Medic Rettungsfahrzeug", "med", {
                "Images\fahrz\feuerw\rtwfront.jpg",
                "Images\fahrz\feuerw\rtwback.jpg"
            } }
        };
    };
    
	class B_MRAP_01_F {
        vItemSpace = 65;
        storageFee[] = { 0, 7500, 0, 0 };
		garageSell[] = { 0, 10000, 0, 0 };
        insurance = 2500;
        chopShop = 250000;
        textures[] = {
            { "Black", "fed", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } },
			 { "Cop Hunter", "cop", {
                "Images\fahrz\pol\hunter_polizei_a.paa",
				"Images\fahrz\pol\hunter_polizei_b.paa"
            } },
			 { "Unit Car", "unit", {
                "Images\clans\Unit\mrap_01_base_co.jpg",
				"Images\clans\Unit\mrap_01_adds_co.jpg"
            } },
			 { "ViP Hunter", "donator", {
                "Images\fahrz\don\donator_hunter_front.paa",
				"Images\fahrz\don\donator_hunter_hinten.paa"
            } },
			 { "AI Hunter", "ai", {
                "Images\clans\ai\ai_hunter_1.jpg",
				"Images\clans\ai\ai_hunter_2.jpg"
            } },
            { "FBI", "cop", {
                "Images\fahrz\pol\fbi_hunter_1.paa",
                "Images\fahrz\pol\fbi_hunter_2.paa"
            } },
            { "SWAT", "cop", {
                "Images\fahrz\pol\swat_hunter_1.paa",
                "Images\fahrz\pol\swat_hunter_2.paa"
            } },
            { "NCIS", "cop", {
                "Images\fahrz\pol\ncis_hunter_1.paa",
                "Images\fahrz\pol\ncis_hunter_2.paa"
            } },
			{ "Army Hunter", "army", {
				"Images\clans\army\mrap_01_base_co.jpg",
                "Images\clans\army\mrap_01_adds_co.jpg"
            } },
			{ "Gis Hunter", "gis", {
				"Images\clans\gis\GIS Hunter1mrap_01_adds_co.jpg",
                "Images\clans\gis\GIS Hunter2mrap_01_base_co.jpg"
            } },
            { "Kartell Hunter", "kartellskin", {
                "Images\clans\Kartel\hunter_kartell_a.jpg",
                "Images\clans\Kartel\hunter_kartell_b.jpg"
            } },
			{ "Legion Hunter", "le", {
                "Images\clans\le\Hunter_vorne.jpg",
                "Images\clans\le\Hunter_hinten.jpg"
            } } 			
        };
    };
	
	class O_Heli_Transport_04_black_F {
        vItemSpace = 100;
        storageFee[] = { 45000, 19500, 0, 0 };
		garageSell[] = { 57000, 35000, 0, 0 };
        insurance = 2500;
        chopShop = 35000;
        textures[] = {
        	{ "Sheriff", "cop", {
                "Images\fahrz\pol\taru_polizei_a.paa",
				"Images\fahrz\pol\taru_polizei_b.paa"
            } }
        };
    };

    class O_Lifeboat {
        vItemSpace = 90;
        storageFee[] = { 1000, 1000, 1000, 1000 };
        garageSell[] = { 2000, 2000, 2000, 2000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
            { "Firefighter Boot", "med", {
                "Images\fahrz\feuerw\ff_boot.jpg"
            } }
        };
    };

	class O_Heli_Transport_04_ammo_black_F {
        vItemSpace = 100;
        storageFee[] = { 45000, 19500, 0, 0 };
		garageSell[] = { 57000, 35000, 0, 0 };
        insurance = 2500;
        chopShop = 35000;
        textures[] = {
        	{ "Sheriff", "cop", {
                "Images\fahrz\pol\taru_polizei_a.paa",
				"Images\fahrz\pol\taru_polizei_b.paa"
            } },
			{ "Taru Firefighter", "med", {
                "Images\fahrz\feuerw\taru_ff_1.jpg",
				"Images\fahrz\feuerw\taru_ff_2.jpg"
            } }
        };
    };
	
	class B_Heli_Transport_03_unarmed_F {
        vItemSpace = 800;
        storageFee[] = { 45000, 19500, 0, 0 };
		garageSell[] = { 57000, 35000, 0, 0 };
        insurance = 2500;
        chopShop = 125000;
        textures[] = {
        	{ "Cop Heli", "cop", {
                "Images\fahrz\pol\huron_polizei_b.paa",
				"Images\fahrz\pol\huron_polizei_a.paa"
            } },
			{ "Firefighter Heli", "med", {
				"Images\fahrz\feuerw\huron_ff_b.jpg",
				"Images\fahrz\feuerw\huron_ff_a.jpg"
            } },
			{ "Rebell Heli", "reb", {
				"#(ai,64,64,1)Fresnel(1.3,7)",
                "#(ai,64,64,1)Fresnel(1.3,7)"
            } },
			{ "ViP Fahrzeug", "donator", {
				"Images\fahrz\don\SAF_Huron1F.jpg",
                "Images\fahrz\don\SAF_Huron2B.jpg"
            } },
			{ "Kuestenwache Fahrzeug", "med", {
				"Images\fahrz\feuerw\huron_kuestei_b.jpg",
                "Images\fahrz\feuerw\huron_kuestei_a.jpg"
            } }
        };
    };
	
	class I_Heli_light_03_unarmed_F {
        vItemSpace = 350;
        storageFee[] = { 45000, 19500, 0, 0 };
		garageSell[] = { 57000, 35000, 0, 0 };
        insurance = 2500;
        chopShop = 75000;
        textures[] = {
        	{ "Cop Heli", "cop", {
                "Images\fahrz\pol\hellcat.paa"
            } },
			{ "Einsatz Heli", "med", {
                "Images\fahrz\feuerw\hellcat_ff.jpg"
            } },
			{ "Tanoa Grün", "reb", {
                "Images\fahrz\don\Tanoa-Green.jpg"
            } },
			{ "Hellcat Unit", "unit", {
                "Images\clans\Unit\heli_light_03_base_co.paa"
            } },
			{ "Tanoa Orange", "donator", {
                "Images\fahrz\don\Tanoa-Orange.jpg"
            } },
			{ "Hellcat Grafitti", "donator", {
               "Images\fahrz\don\heli_light_03_base_co.paa"
            } },
			{ "Army Hellcat", "army", {
               "Images\clans\army\hellcat.jpg"
            } },
            { "Tanoa Aligator", "donator", {
                "Images\fahrz\don\Tanoa-Aligator.jpg"
            } },
			{ "ADAC Fahrzeug", "med", {
                "Images\fahrz\feuerw\ADAC_hellcat.jpg"
            } }
        };
    };

	class B_Heli_Light_01_F {
        vItemSpace = 250;
        storageFee[] = { 45000, 19500, 0, 0 };
		garageSell[] = { 57000, 35000, 0, 0 };
        insurance = 2500;
        chopShop = 55000;
        textures[] = {
			{ "Black", "fed", {
	                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa"
            } },
			{ "Civ Blue", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"
            } },
			{ "Civ Red", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"
            } },
			{ "Digi Green", "donator", {
	                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa"
            } },
			{ "Blueline", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"
            } },
			{ "Elliptical", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"
            } },
			{ "Furious", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"
            } },
			{ "Jeans Blue", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"
            } },
			{ "Speedy Redline", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"
            } },
			{ "Sunset", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"
            } },
			{ "Vrana", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"
            } },
			{ "Waves Blue", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"
            } },
			{ "Rebel Digital", "reb", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
            } },
            { "EMS White", "med", {
                "#(argb,8,8,3)color(1,1,1,0.8)"
            } },
			{ "Cop Heli", "cop", {
                "Images\fahrz\pol\hummingbird_polizei.paa"
            } },
			{ "Dienst Fahrzeug", "med", {
                "Images\fahrz\feuerw\hummingbird_ff.jpg"
            } },		
			{ "Dienst Fahrzeug", "donator", {
                "Images\fahrz\don\EQT_REBbird.jpg"
            } },
			{ "Dienst Fahrzeug", "donator", {
                "Images\fahrz\don\EQT_REBbird2.jpg"
            } },
            { "SWAT", "cop", {
                "Images\fahrz\pol\hummingbird_swat.paa"
            } },
			{ "Unit Fahrzeug", "unit", {
                 "Images\clans\Unit\hummingburdunit.jpg"
            } },
			{ "NCIS", "cop", {
                 "Images\fahrz\pol\ncisheli_light_01_ext_blufor_co.jpg"
            } },
			{ "Army Heli", "army", {
                 "Images\clans\army\hummingburd.jpg"
            } },
			{ "ADAC Fahrzeug", "med", {
                 "Images\fahrz\feuerw\ADAC_Hummingbird.jpg"
            } },
			{ "Medic Fahrzeug", "med", {
                 "Images\fahrz\feuerw\medic_littlebird.jpg"
            } },
            { "Kartell Fahrzeug", "kartellskin", {
                 "Images\clans\Kartel\humbinbird_kartell.jpg"
            } }
        };
    };

	class O_Heli_Light_02_unarmed_F {
        vItemSpace = 400;
        storageFee[] = { 55000, 0, 22000, 0 };
		garageSell[] = { 72500, 0, 35000, 0 };
        insurance = 2500;
        chopShop = 90000;
        textures[] = {
        	{ "Black", "fed", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa"
            } },
			{ "White / Blue", "civ", {
	                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"   
            } },
			{ "Digi Green", "donate", {
	                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"
            } },
			{ "Desert Digi", "reb", {
	                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa" 
            } },
            { "EMS White", "med", {
                "#(argb,8,8,3)color(1,1,1,0.8)"
            } },
			{ "Firefighter Fahrzeug", "med", {
                "Images\fahrz\feuerw\orca_ff.jpg"
            } },
			{ "Medic Fahrzeug", "med", {
                "Images\fahrz\feuerw\medic_orca.jpg"
            } }
        };
    };

	class I_Heli_Transport_02_F {
        vItemSpace = 650;
        storageFee[] = { 75000, 0, 0, 0 };
		garageSell[] = { 125000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 250000;
        textures[] = {
        	{ "Ion", "civ", {
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_ion_co.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_ion_co.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_ion_co.paa"
            } },
            { "Dahoman", "civ", {
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_dahoman_co.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_dahoman_co.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_dahoman_co.paa"
            } }
        };
    };
	
	class B_SDV_01_F {
        vItemSpace = 200;
        storageFee[] = { 55000, 0, 22000, 0 };
		garageSell[] = { 72500, 0, 35000, 0 };
        insurance = 2500;
        chopShop = 65000;
        textures[] = {
            { "U boot", "cq", {
                "#(argb,8,8,3)color(1,1,1,0.8)"
            } }
        };
    };
	
	class C_Van_01_Fuel_F {
        vItemSpace = 100;
		storageFee[] = { 2500, 0, 0, 0 };
		garageSell[] = { 5000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 7500;
		textures[] = {};
	};
	
	class B_Truck_01_ammo_F {
        vItemSpace = 350;
		storageFee[] = { 25000, 0, 0, 0 };
		garageSell[] = { 65000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 75000;
		textures[] = {};
	};
	
	class O_MRAP_02_hmg_F {
        vItemSpace = 160;
        storageFee[] = { 45000, 0, 0, 0 };
		garageSell[] = { 65000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 5000;
		textures[] = {
        	{ "ViP Blau Flecktarn", "donator", {
                "Images\fahrz\don\Ifrit_front.paa",
				"Images\fahrz\don\Ifrit_back.paa"
            } },
			{ "ViP Rot Flecktarn", "donator", {
                "Images\fahrz\don\ifrit_r1.paa",
				"Images\fahrz\don\ifrit_r2.paa"
            } },
			{ "ViP Mil Flecktarn Devil", "donator", {
                "Images\fahrz\don\ifritg1.paa",
				"Images\fahrz\don\ifritg2.paa"
            } },
			{ "ViP Flecktarn Grün", "donator", {
                "Images\fahrz\don\ifritrebell1.jpg",
				"Images\fahrz\don\ifrittrebell2.jpg"
            } },
			{ "ViP Mil Tarn", "donator", {
                "Images\fahrz\don\EQT_ifritR.jpg",
				"Images\fahrz\don\EQT_ifritR2.jpg"
            } },
			{ "Miliz Fahrzeug", "ksk", {
                "Images\clans\ksk\mrap_02_ext_01_co.jpg",
				"Images\clans\ksk\mrap_02_ext_02_co.jpg"
            } }
        };
    };
	
	class B_MRAP_01_hmg_F {
        vItemSpace = 150;
		storageFee[] = { 25000, 0, 0, 0 };
		garageSell[] = { 65000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 125000;
		textures[] = {};
	};
	
	class I_MRAP_03_hmg_F {
        vItemSpace = 150;
		storageFee[] = { 25000, 0, 0, 0 };
		garageSell[] = { 65000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 5000;
		textures[] = {};
	};
	
	class O_APC_Wheeled_02_rcws_F {
        vItemSpace = 1200;
		storageFee[] = { 25000, 0, 0, 0 };
		garageSell[] = { 65000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 500000;
		textures[] = {
			{ "Rebellen Fahrzeug", "reb", {
				"#(ai,64,64,1)Fresnel(1.3,7)"
            } },
			{ "Rebell Heli", "donator", {
				"#(ai,64,64,1)Fresnel(1.3,7)"
            } },
			{ "Miliz Marid", "ksk", {
				"Images\clans\ksk\apc_wheeled_02_ext_01_opfor_co.jpg"
            } }
        };
    };
	
	class O_Heli_Attack_02_black_F {
        vItemSpace = 300;
		storageFee[] = { 25000, 0, 0, 0 };
		garageSell[] = { 65000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 75000;
		textures[] = {
            { "Einsatz Fahrzeug", "med", {
				"Images\clans\ai\ai_kajman_limited_1.jpg",
                "Images\clans\ai\ai_kajman_limited_2.jpg"
            } },
			{ "Rebell Heli", "reb", {
				"#(ai,64,64,1)Fresnel(1.3,7)",
                "#(ai,64,64,1)Fresnel(1.3,7)"
            } },
			{ "Rebell Heli", "donator", {
				"#(ai,64,64,1)Fresnel(1.3,7)",
                "#(ai,64,64,1)Fresnel(1.3,7)"
            } },
			{ "Miliz Heli", "ksk", {
				"Images\clans\ksk\heli_attack_02_body1_black_co.jpg",
                "Images\clans\ksk\heli_attack_02_body2_black_co.jpg"
            } },
			{ "SK Heli", "sk", {
				"Images\clans\sk\kajman1.jpg",
                "Images\clans\sk\kajman2.jpg"
            } }
        };
    };
	
	class O_Heli_Transport_04_box_F {
        vItemSpace = 1000;
		storageFee[] = { 25000, 0, 0, 0 };
		garageSell[] = { 65000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 250000;
		textures[] = {};
	};
	
	class B_Heli_Attack_01_F {
        vItemSpace = 120;
		storageFee[] = { 25000, 0, 0, 0 };
		garageSell[] = { 65000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 125000;
		textures[] = {};
	};
	
	class O_Heli_Transport_04_covered_F {
        vItemSpace = 750;
		storageFee[] = { 25000, 0, 0, 0 };
		garageSell[] = { 65000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 95000;
		textures[] = {};
	};
	
	class B_Heli_Transport_03_F {
        vItemSpace = 750;
		storageFee[] = { 25000, 0, 0, 0 };
		garageSell[] = { 65000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 125000;
		textures[] = {
            { "Ai Fahrzeug", "ai", {
				"Images\clans\ai\heli_transport_03_ext01_black_co.jpg",
                "Images\clans\ai\heli_transport_03_ext02_black_co.jpg"
            } },
			{ "ViP Fahrzeug", "donator", {
				"Images\fahrz\don\SAF_Huron1F.jpg",
                "Images\fahrz\don\SAF_Huron2B.jpg"
            } },
			{ "Rebell Fahrzeug", "reb", {
				"#(ai,64,64,1)Fresnel(1.3,7)",
                "#(ai,64,64,1)Fresnel(1.3,7)"
            } }
        };
    };
	
    class B_Heli_Transport_01_camo_F {
        vItemSpace = 400;
        storageFee[] = { 25000, 0, 0, 0 };
        garageSell[] = { 65000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 250000;
        textures[] = {
            { "Ai Fahrzeug", "ai", {
                "Images\clans\ai\ghosthawk1.paa",
                "Images\clans\ai\ghosthawk2.paa"
            } },
            { "Cop Heli", "cop", {
                "Images\fahrz\pol\ghost_hawk_polizei_a.paa",
                "Images\fahrz\pol\ghost_hawk_polizei_b.paa"
            } },
            { "Black Heli", "reb", {
                 "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
                 "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } },
            { "Black Heli", "donator", {
                 "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
                 "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } },
            { "FBI", "cop", {
                "Images\fahrz\pol\fbi_ghosthawk_1.paa",
                "Images\fahrz\pol\fbi_ghosthawk_2.paa"
            } },
            { "SWAT", "cop", {
                "Images\fahrz\pol\swat_ghosthawk_1.paa",
                "Images\fahrz\pol\swat_ghosthawk_2.paa"
            } },
            { "NCIS", "cop", {
                "Images\fahrz\pol\ncis_ghosthawk_1.paa",
                "Images\fahrz\pol\ncis_ghosthawk_2.paa"
            } }
        };
    };
	
	class O_Heli_Transport_04_F {
        vItemSpace = 800;
		storageFee[] = { 25000, 0, 0, 0 };
		garageSell[] = { 65000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 75000;
		textures[] = {
            { "Rebell Fahrzeug", "reb", {
                "#(ai,64,64,1)Fresnel(1.3,7)",
                "#(ai,64,64,1)Fresnel(1.3,7)"
            } },
            { "Taru Firefighter", "med", {
                "Images\fahrz\feuerw\taru_ff_1.jpg",
                "Images\fahrz\feuerw\taru_ff_2.jpg"
            } },
			{ "Taru Kuestenwache", "med", {
                "Images\fahrz\feuerw\taru_kueste_1.jpg",
                "Images\fahrz\feuerw\taru_kueste_2.jpg"
            } }
        };
	};
	
	class I_Plane_Fighter_03_AA_F {
        vItemSpace = 1650;
		storageFee[] = { 25000, 0, 0, 0 };
		garageSell[] = { 65000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 0;
		textures[] = {};
	};
	
	class B_Truck_01_mover_F {
        vItemSpace = 500;
		storageFee[] = { 15000, 0, 0, 0 };
		garageSell[] = { 35000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 55000;
		textures[] = {
            { "Einsatz Fahrzeug", "med", {
                "Images\fahrz\feuerw\hmmt_ff_a.jpg",
                "Images\fahrz\feuerw\hmmt_ff_b.jpg",       
                "Images\fahrz\feuerw\hmmt_ff_c.jpg"
            } }
        };
    };
	
	
	class I_C_Boat_Transport_02_F {
        vItemSpace = 250;
		storageFee[] = { 2500, 0, 0, 0 };
		garageSell[] = { 6500, 0, 0, 0 };
		insurance = 2500;
		chopShop = 0;
		textures[] = {};
	};
	
	class B_T_LSV_01_unarmed_F {
        vItemSpace = 410;
		storageFee[] = { 2500, 0, 0, 0 };
		garageSell[] = { 6500, 0, 0, 0 };
		insurance = 2500;
		chopShop = 0;
		textures[] = {};
	};
	
	class C_Plane_Civil_01_F {
        vItemSpace = 480;
		storageFee[] = { 2500, 0, 0, 0 };
		garageSell[] = { 6500, 0, 0, 0 };
		insurance = 2500;
		chopShop = 0;
		textures[] = {};
	};
	
	class B_T_VTOL_01_infantry_F {
        vItemSpace = 950;
		storageFee[] = { 25000, 0, 0, 0 };
		garageSell[] = { 65000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 100000;
		textures[] = {};
	};
	
	class C_Offroad_02_unarmed_F {
        vItemSpace = 280;
		storageFee[] = { 2500, 0, 0, 0 };
		garageSell[] = { 6500, 0, 0, 0 };
		insurance = 2500;
		chopShop = 10000;
		textures[] = {
            { "Fahrzeug", "civ", {
                "#(ai,64,64,1)Fresnel(1.3,7)"
            } },
            { "Fahrzeug", "cop", {
                "#(ai,64,64,1)Fresnel(1.3,7)"
            } },
            { "Fahrzeug", "med", {
                "Images\fahrz\feuerw\MB4WD.jpg"
            } }
        };
	};
	
	class C_Scoooter_Transport_01_F {
        vItemSpace = 70;
		storageFee[] = { 500, 0, 0, 0 };
		garageSell[] = { 1500, 0, 0, 0 };
		insurance = 2500;
		chopShop = 100;
		textures[] = {};
	};
	
	class B_T_LSV_01_armed_F {
        vItemSpace = 450;
		storageFee[] = { 125000, 0, 0, 0 };
		garageSell[] = { 165000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 100000;
		textures[] = {};
	};
	
	class O_T_LSV_02_unarmed_F {
        vItemSpace = 380;
		storageFee[] = { 12500, 0, 0, 0 };
		garageSell[] = { 16500, 0, 0, 0 };
		insurance = 2500;
		chopShop = 100000;
		textures[] = {};
	};
	
	class O_T_LSV_02_armed_F {
        vItemSpace = 460;
		storageFee[] = { 75000, 0, 0, 0 };
		garageSell[] = { 85000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 0;
		textures[] = {};
	};
	
	class B_T_VTOL_01_vehicle_F {
        vItemSpace = 750;
		storageFee[] = { 62500, 0, 0, 0 };
		garageSell[] = { 65000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 400000;
		textures[] = {};
	};
	
	class O_T_VTOL_02_infantry_F {
        vItemSpace = 950;
		storageFee[] = { 62500, 0, 0, 0 };
		garageSell[] = { 65000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 400000;
		textures[] = {};
	};
};