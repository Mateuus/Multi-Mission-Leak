class CarShops {
    /*
    *    ARRAY FORMAT:
    *        0: STRING (Classname)
    *        1: ARRAY (This is for limiting items to certain things)
    *            0: Variable to read from
    *            1: Variable Value Type (SCALAR / BOOL /EQUAL)
    *            2: What to compare to (-1 = Check Disabled)
    *
    *   BLUFOR Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_WEST
    *   OPFOR Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_EAST
    *   Independent Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_GUER
    *   Civilian Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_CIV
    */
    class civ_car {
        side = "civ";
        vehicles[] = {
            { "B_Quadbike_01_F", { "", "", -1 } },
            { "C_Hatchback_01_F", { "", "", -1 } },
            { "C_Offroad_01_F", { "", "", -1 } },
            { "C_SUV_01_F", { "", "", -1 } },
            { "C_Hatchback_01_sport_F", { "", "", -1 } },
            { "C_Van_01_transport_F", { "", "", -1 } }
        };
    };

    class kart_shop {
        side = "civ";
        vehicles[] = {
            { "C_Kart_01_Blu_F", { "", "", -1 } },
            { "C_Kart_01_Fuel_F", { "", "", -1 } },
            { "C_Kart_01_Red_F", { "", "", -1 } },
            { "C_Kart_01_Vrana_F", { "", "", -1 } }
        };
    };

    class civ_truck {
        side = "civ";
        vehicles[] = {
            { "C_Van_01_box_F", { "", "", -1 } },
            { "C_Van_01_fuel_F", { "", "", -1 } },
			{ "I_Truck_02_covered_F", { "", "", -1 } },
			{ "O_Truck_02_fuel_F", { "", "", -1 } },
			{ "O_Truck_03_transport_F", { "", "", -1 } },
			{ "O_Truck_03_fuel_F", { "", "", -1 } },
			{ "O_Truck_03_device_F", { "", "", -1 } },
			{ "B_Truck_01_covered_F", { "", "", -1 } },
			{ "B_Truck_01_box_F", { "", "", -1 } }, 
			{ "B_Truck_01_ammo_F", { "", "", -1 } }
        };
    };

    class civ_air {
        side = "civ";
        vehicles[] = {
            { "C_Heli_Light_01_civil_F", { "", "", -1 } },
            { "O_Heli_Light_02_unarmed_F", { "", "", -1 } },
            { "I_Heli_Transport_02_F", { "", "", -1 } },
			{ "O_Heli_Transport_04_F", { "", "", -1 } },
			{ "O_Heli_Transport_04_box_F", { "", "", -1 } },
			{ "B_Heli_Transport_03_unarmed_F", { "", "", -1 } }
        };
    };

     class civ_ship {
        side = "civ";
        vehicles[] = {
            { "C_Rubberboat", { "", "", -1 } },
            { "C_Boat_Civil_01_F", { "", "", -1 } },
            { "B_SDV_01_F", { "", "", -1 } }
        };
    };

    class reb_car {
        side = "civ";
        vehicles[] = {
            { "B_Quadbike_01_F", { "", "", -1 } },
            { "B_G_Offroad_01_F", { "", "", -1 } },
			{ "O_MRAP_02_hmg_F", { "", "", -1 } },
            { "O_MRAP_02_F", { "", "", -1 } },
            { "B_G_Offroad_01_armed_F", { "", "", -1 } },
			{ "I_MRAP_03_F", { "", "", -1 } },
			{ "B_Heli_Light_01_stripped_F", { "", "", -1 } },
            { "O_Heli_Light_02_unarmed_F", { "", "", -1 } },
            { "I_Heli_Transport_02_F", { "", "", -1 } },
			{ "O_Heli_Transport_04_F", { "", "", -1 } },
			{ "O_Heli_Transport_04_box_F", { "", "", -1 } },
			{ "B_Heli_Transport_03_unarmed_F", { "", "", -1 } },
			{ "I_Heli_light_03_unarmed_F", { "", "", -1 } }
        };
    };

    class med_shop {
        side = "med";
        vehicles[] = {
			{ "C_Offroad_01_F", { "life_mediclevel", "SCALAR", 2 } },
			{ "C_SUV_01_F", { "life_mediclevel", "SCALAR", 5 } },
			{ "C_Van_01_box_F", { "life_mediclevel", "SCALAR", 3 } },
			{ "C_Van_01_fuel_F", { "life_mediclevel", "SCALAR", 3 } },
			{ "C_Hatchback_01_F", { "life_mediclevel", "SCALAR", 3 } },
			{ "C_Hatchback_01_sport_F", { "life_mediclevel", "SCALAR", 6 } },
			{ "I_Truck_02_transport_F", { "life_mediclevel", "SCALAR", 3 } },
			{ "O_Truck_03_transport_F", { "life_mediclevel", "SCALAR", 4 } }			
        };
    };

	class mtd_shop {
        side = "med";
        vehicles[] = {
			{ "C_Offroad_01_F", { "life_mediclevel", "SCALAR", 2 } },
			{ "C_SUV_01_F", { "life_mediclevel", "SCALAR", 5 } },
			{ "C_Van_01_box_F", { "life_mediclevel", "SCALAR", 3 } },
			{ "C_Van_01_fuel_F", { "life_mediclevel", "SCALAR", 3 } },
			{ "C_Hatchback_01_F", { "life_mediclevel", "SCALAR", 3 } },
			{ "C_Hatchback_01_sport_F", { "life_mediclevel", "SCALAR", 6 } },
			{ "I_Truck_02_transport_F", { "life_mediclevel", "SCALAR", 3 } },
			{ "O_Truck_03_transport_F", { "life_mediclevel", "SCALAR", 4 } }			
        };
    };

    class med_air_hs {
        side = "med";
        vehicles[] = {
            { "B_Heli_Light_01_F", { "life_mediclevel", "SCALAR", 6 } },
            { "O_Heli_Light_02_unarmed_F", { "life_mediclevel", "SCALAR", 3 } },
			{ "B_Heli_Transport_03_unarmed_F", { "life_mediclevel", "SCALAR", 4 } }
        };
    };
	
	class mtd_heli {
        side = "med";
        vehicles[] = {
            { "B_Heli_Light_01_F", { "life_mediclevel", "SCALAR", 6 } },
            { "O_Heli_Light_02_unarmed_F", { "life_mediclevel", "SCALAR", 3 } },
			{ "B_Heli_Transport_03_unarmed_F", { "life_mediclevel", "SCALAR", 4 } }
        };
    };

    class cop_car {
        side = "cop";
        vehicles[] = {
			{ "B_Quadbike_01_F", { "life_coplevel", "SCALAR", 1 } },
            { "C_Offroad_01_F", { "life_coplevel", "SCALAR", 1 } },
            { "C_SUV_01_F", { "life_coplevel", "SCALAR", 3 } },
            { "C_Hatchback_01_sport_F", { "life_coplevel", "SCALAR", 3 } },
			{ "C_Hatchback_01_F", { "life_coplevel", "SCALAR", 2 } },
            { "B_MRAP_01_F", { "life_coplevel", "SCALAR", 4 } },
            { "B_MRAP_01_hmg_F", { "life_coplevel", "SCALAR", 3 } },
			{ "I_Truck_02_box_F", { "life_coplevel", "SCALAR", 5 } },
			{ "I_MRAP_03_F", { "life_coplevel", "SCALAR", 6 } },
			{ "I_MRAP_03_hmg_F", { "life_coplevel", "SCALAR", 8 } },
			//Kripo Car
			{ "C_Van_01_box_F", { "life_coplevel", "SCALAR", 9 } },
			{ "C_Van_01_fuel_F", { "life_coplevel", "SCALAR", 9 } },
			{ "I_Truck_02_transport_F", { "life_coplevel", "SCALAR", 9 } },
			{ "I_Truck_02_covered_F", { "life_coplevel", "SCALAR", 9 } },
			{ "O_Truck_02_fuel_F", { "life_coplevel", "SCALAR", 9 } },
			{ "O_Truck_03_transport_F", { "life_coplevel", "SCALAR", 9 } },
			{ "O_Truck_03_covered_F", { "life_coplevel", "SCALAR", 9 } },
			{ "O_Truck_03_fuel_F", { "life_coplevel", "SCALAR", 9 } },
			{ "O_Truck_03_device_F", { "life_coplevel", "SCALAR", 9 } },
			{ "B_Truck_01_transport_F", { "life_coplevel", "SCALAR", 9 } },
			{ "B_Truck_01_covered_F", { "life_coplevel", "SCALAR", 9 } },
			{ "B_Truck_01_fuel_F", { "life_coplevel", "SCALAR", 9 } },
			{ "B_Truck_01_box_F", { "life_coplevel", "SCALAR", 9 } }			
        };
    };

    class cop_air {
        side = "cop";
        vehicles[] = {
            { "B_Heli_Light_01_F", { "life_coplevel", "SCALAR", 2 } },
            { "O_Heli_Light_02_unarmed_F", { "life_coplevel", "SCALAR", 3 } },
			{ "I_Heli_light_03_unarmed_F", { "life_coplevel", "SCALAR", 4 } },
			{ "B_Heli_Transport_01_F", { "life_coplevel", "SCALAR", 5 } }
        };
    };

    class cop_ship {
        side = "cop";
        vehicles[] = {
            { "B_Boat_Transport_01_F", { "life_coplevel", "SCALAR", 2 } },
            { "C_Boat_Civil_01_police_F", { "life_coplevel", "SCALAR", 2 } },
            { "B_Boat_Armed_01_minigun_F", { "life_coplevel", "SCALAR", 3 } },
            { "B_SDV_01_F", { "life_coplevel", "SCALAR", 3 } }
        };
    };
	
	class donator {
        side = "civ";
        vehicles[] = {
            { "B_Boat_Transport_01_F", { "life_donorlevel", "SCALAR", 1 } },
            { "C_Boat_Civil_01_police_F", { "life_donorlevel", "SCALAR", 2 } },
            { "B_Boat_Armed_01_minigun_F", { "life_donorlevel", "SCALAR", 3 } },
            { "B_SDV_01_F", { "life_donorlevel", "SCALAR", 3 } }
        };
    };
};

class LifeCfgVehicles {
    /*
    *    Vehicle Configs (Contains textures and other stuff)
    *       1: ARRAY (Rental Price)
    *         Ex: { 200, 200 , 200 , 200 } //civilian, west, independent, east
    *       2: ARRAY (license required)
    *         Ex: { "driver", "" , "" , "" } //civilian, west, independent, east
    *         licenses[] = { {"CIV"}, {"COP"}, {"MEDIC"}, {"EAST"} };
    *    Textures config follows { Texture Name, side, {texture(s)path}}
    *    Texture(s)path follows this format:
    *    INDEX 0: Texture Layer 0
    *    INDEX 1: Texture Layer 1
    *    INDEX 2: Texture Layer 2
    *    etc etc etc
    *
    */

    class Default {
        vItemSpace = -1;
        licenses[] = { {""}, {""}, {""}, {""} };
        rentalprice[] = { -1, -1, -1, -1 };
        textures[] = {};
    };

    class I_Truck_02_medical_F {
        vItemSpace = 150;
        licenses[] = { {""}, {""}, {""}, {""} };
        rentalprice[] = { -1, -1, 25000, -1 };
        textures[] = {};
    };

    class O_Truck_03_medical_F {
        vItemSpace = 200;
        licenses[] = { {""}, {""}, {""}, {""} };
        rentalprice[] = { -1, -1, 45000, -1 };
        textures[] = {};
    };

    class B_Truck_01_medical_F {
        vItemSpace = 250;
        licenses[] = { {""}, {""}, {""}, {""} };
        rentalprice[] = { -1, -1, 60000, -1 };
        textures[] = {};
    };

    class C_Rubberboat {
        vItemSpace = 45;
        licenses[] = { {"boat"}, {""}, {""}, {""} };
        rentalprice[] = { 5000, -1, -1, -1 };
        textures[] = { };
    };

    class B_Heli_Transport_01_F {
        vItemSpace = 200;
        licenses[] = { {""}, {"cAir"}, {""}, {""} };
        rentalprice[] = { -1, 200000, -1, -1 };
        textures[] = { 
				{ "SEK", "cop", {
					"a3\air_f_beta\Heli_Transport_01\data\heli_transport_01_ext01_co.paa",
					"a3\air_f_beta\Heli_Transport_01\data\heli_transport_01_ext02_co.paa"
				}	},
				{ "Polizei", "cop", {
					"textures\cop\fahrzeuge\heli_ghost1.paa",
					"textures\cop\fahrzeuge\heli_ghost2.paa"
				}	}
		};		
    };
		
	class I_Truck_02_box_F {
        vItemSpace = 200;
        licenses[] = { {""}, {"ctrucking"}, {""}, {""} };
        rentalprice[] = { -1, 80000, -1, -1 };
        textures[] = { 
				{ "Polizei", "cop", {
					"textures\cop\fahrzeuge\polizei_zamak_0.paa",
					"textures\cop\fahrzeuge\polizei_zamak_1.paa"
            } }
		};		
    };
	
	class I_MRAP_03_hmg_F {
        vItemSpace = 100;
        licenses[] = { {""}, {"cdriver"}, {""}, {""} };
        rentalprice[] = { -1, 180000, -1, -1 };
        textures[] = { 
				{ "SEK", "sek", {
                "textures\cop\fahrzeuge\sek_strider.paa"
            } }
		};		
    };
	
	class I_Heli_light_03_unarmed_F {
        vItemSpace = 170;
        licenses[] = { {"rebel"}, {"cAir"}, {""}, {""} };
        rentalprice[] = { 1830000, 40000, -1, -1 };
        textures[] = { 
			{ "Polizei", "cop", {
	           "textures\cop\fahrzeuge\polizei_hellcat.paa"
            } },
			{ "Digi Grün", "reb", {
                "\a3\air_f_epb\Heli_Light_03\Data\heli_light_03_base_indp_co.paa"
            } }
		};		
    };

    class B_Heli_Transport_03_unarmed_F {
        vItemSpace = 750;
        licenses[] = { {"pilot"}, {"cAir"}, {"mAir"}, {""} };
        rentalprice[] = { 15300000, 200000, 80000, -1 };
        textures[] = { 
				{ "Schwarz", "civ", {
                "a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext01_black_co.paa",
				"a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext02_black_co.paa"
				} },
				{ "Grün", "civ", {
					"a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext01_co.paa",
					"a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext02_co.paa"
				} },
				{ "Grün", "reb", {
					"a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext01_co.paa",
					"a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext02_co.paa"
				} },
				{ "SEK", "cop", {
					"a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext01_black_co.paa",
					"a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext02_black_co.paa"
				} },
				{ "MTD Luftrettung", "med", {
					"textures\mtd\fahrzeuge\mtd_huron0.paa",
					"textures\mtd\fahrzeuge\mtd_huron1.paa"
				} }
		};		
    };
	

    class B_MRAP_01_hmg_F {
        vItemSpace = 100;
        licenses[] = { {""}, {"ctrucking"}, {""}, {""} };
        rentalprice[] = { -1, 75000, -1, -1 };
        textures[] = {
            { "Polizei", "cop", {
                "textures\cop\fahrzeuge\sek_hunter_0.paa",
				"textures\cop\fahrzeuge\sek_hunter_1.paa"
            } }
        };
    };
	
	class O_MRAP_02_hmg_F {
        vItemSpace = 60;
        licenses[] = { {"rebel"}, {""}, {""}, {""} };
        rentalprice[] = { 13000000, -1, -1, -1 };
        textures[] = { };
    };
	
	class O_Truck_02_fuel_F {
        vItemSpace = 450;
        licenses[] = { {"trucking"}, {"kripo"}, {""}, {""} };
        rentalprice[] = { 4500000, 20000, -1, -1 };
        textures[] = { };
    };
	
	class I_MRAP_03_F {
        vItemSpace = 50;
        licenses[] = { {"rebel"}, {"ctrucking"}, {""}, {""} };
        rentalprice[] = { 6800000, 250000, -1, -1 };
        textures[] = {
           { "Polizei", "cop", {
                "textures\cop\fahrzeuge\polizei_strider.paa"
            } },
            { "SEK", "cop", {
                "textures\cop\fahrzeuge\sek_strider.paa"
            } },
			{ "Tarn Rebelle", "reb", {
                "textures\civi\fahrzeuge\reb\reb_strider.jpg"
            } }
        };
    };

    class B_Boat_Armed_01_minigun_F {
        vItemSpace = 175;
        licenses[] = { {""}, {"cboat"}, {""}, {""} };
        rentalprice[] = { -1, 75000, -1, -1 };
        textures[] = { 
			{ "Polizei", "cop", {
	                "textures\cop\fahrzeuge\polizei_gunboot.paa"
            } }
		};
    };

    class B_Boat_Transport_01_F {
        vItemSpace = 75;
        licenses[] = { {""}, {"cboat"}, {""}, {""} };
        rentalprice[] = { -1, 3000, -1, -1 };
        textures[] = { 
			{ "Polizei", "cop", {
	                "textures\cop\fahrzeuge\polizei_Schlauchboot.paa"
            } }
		};
    };

    class O_Truck_03_transport_F {
        vItemSpace = 600;
        licenses[] = { {"trucking"}, {"kripo"}, {"mtrucking"}, {""} };
        rentalprice[] = { 953000, 30000, 35000, -1 };
        textures[] = { };
    };
	
	class O_Truck_03_fuel_F {
        vItemSpace = 750;
        licenses[] = { {"trucking"}, {"kripo"}, {""}, {""} };
        rentalprice[] = { 1300000, 20000, -1, -1 };
        textures[] = { };
    };

    class O_Truck_03_device_F {
        vItemSpace = 400;
        licenses[] = { {"trucking"}, {"kripo"}, {""}, {""} };
        rentalprice[] = { 4300000, 40000, -1, -1 };
        textures[] = { };
    };
	
	class B_Truck_01_covered_F {
        vItemSpace = 650;
        licenses[] = { {"trucking"}, {"kripo"}, {""}, {""} };
        rentalprice[] = { 8640000, 30000, -1, -1 };
        textures[] = { };
    };
	
	class B_Truck_01_ammo_F {
        vItemSpace = 1000;
        licenses[] = { {"trucking"}, {"kripo"}, {""}, {""} };
        rentalprice[] = { 15500000, 20000, -1, -1 };
        textures[] = { 
			{ "Radioaktiv", "civ", {
                "textures\civi\fahrzeuge\hemtt\CIV_radioaktiv_front.paa",
                "\a3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa",
				"textures\civi\fahrzeuge\hemtt\CIV_radioaktiv_hinten.paa"
            } }
		};
    };

    class Land_CargoBox_V1_F {
        vItemSpace = 500;
        licenses[] = { {""}, {""}, {""}, {""} };
        rentalprice[] = { -1, -1, -1, -1 };
        textures[] = {};
    };

    class Box_IND_Grenades_F {
        vItemSpace = 350;
        licenses[] = { {""}, {""}, {""}, {""} };
        rentalprice[] = { -1, -1, -1, -1 };
        textures[] = {};
    };

    class B_supplyCrate_F {
        vItemSpace = 700;
        licenses[] = { {""}, {""}, {""}, {""} };
        rentalprice[] = { -1, -1, -1, -1 };
        textures[] = {};
    };

    class B_G_Offroad_01_F {
        vItemSpace = 65;
        licenses[] = { {""}, {""}, {""}, {""} };
        rentalprice[] = { 15000, -1, -1, -1 };
        textures[] = { 
			{ "Rebel", "reb", {
                "a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_01_co.paa"
            } }
		};
    };

    class B_G_Offroad_01_armed_F {
        vItemSpace = 45;
        licenses[] = { {"rebel"}, {""}, {""}, {""} };
        rentalprice[] = { 3500000, -1, -1, -1 };
        textures[] = { 
			{ "Rebel", "reb", {
                "a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_01_co.paa"
            } }
		};
    };

    class C_Boat_Civil_01_F {
        vItemSpace = 90;
        licenses[] = { {"boat"}, {"kripo"}, {""}, {""} };
        rentalprice[] = { 22000, 2000, -1, -1 };
        textures[] = { };
    };

    class C_Boat_Civil_01_police_F {
        vItemSpace = 150;
        licenses[] = { {""}, {"cboat"}, {""}, {""} };
        rentalprice[] = { -1, 20000, -1, -1 };
        textures[] = { 
			{ "Polizei", "cop", {
	                "textures\cop\fahrzeuge\polizei_speedboot.paa"
            } }
		};
    };

    class B_Truck_01_box_F {
        vItemSpace = 800;
        licenses[] = { {"trucking"}, {"kripo"}, {""}, {""} };
        rentalprice[] = { 12500000, 20000, -1, -1 };
        textures[] = { };
    };

    class B_Truck_01_transport_F {
        vItemSpace = 1000;
        licenses[] = { {"trucking"}, {"kripo"}, {""}, {""} };
        rentalprice[] = { 275000, 30000, -1, -1 };
        textures[] = { 
			{ "Grün", "civ", {
                "\A3\Soft_F_Beta\Truck_01\data\truck_01_ext_01_co.paa",
				"\A3\Soft_F_Beta\Truck_01\data\truck_01_ext_02_co.paa"
            } } 
		};
    };

    class O_MRAP_02_F {
        vItemSpace = 60;
        licenses[] = { {"rebel"}, {""}, {""}, {""} };
        rentalprice[] = { 5000000, -1, -1, -1 };
        textures[] = { 
			{ "Hexa Tarn", "reb", {
                "\a3\soft_f\MRAP_02\Data\mrap_02_ext_01_co.paa",
				"\a3\soft_f\MRAP_02\Data\mrap_02_ext_02_co.paa"
            } },
			{ "Grau", "reb", {
                "textures\civi\fahrzeuge\reb\ifrit_grey_front.jpg",
				"textures\civi\fahrzeuge\reb\ifrit_grey_back.jpg"
            } },
			{ "Tarn Rot", "reb", {
                "textures\civi\fahrzeuge\reb\rebell_ifrit_typ4_teil1.jpg",
				"textures\civi\fahrzeuge\reb\rebell_ifrit_typ4_teil2.jpg"
            } },
			{ "Tarn Grün", "reb", {
                "textures\civi\fahrzeuge\reb\ifrit_forest_front.jpg",
				"textures\civi\fahrzeuge\reb\ifrit_forest_back.jpg"
            } }
		};
    };

    class C_Offroad_01_F {
        vItemSpace = 65;
        licenses[] = { {"driver"}, {"cdriver"}, {"mdriver"}, {""} };
        rentalprice[] = { 21500, 10000, 10000, -1 };
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
            { "Taxi", "civ", {
                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            } },
			{ "Polizei", "cop", {
	                "textures\cop\fahrzeuge\polizei_offroad.paa"
            } },
			{ "SEK", "cop", {
					"textures\cop\fahrzeuge\sek_offroad.paa"
            } },			
			{ "Dodge", "civ", {
	                "textures\civi\fahrzeuge\off\civ_offroad_dodge.jpg"
            } },
			{ "Rockstar", "civ", {
	                "textures\civi\fahrzeuge\off\civ_offroad_rockstargelb.jpg"
            } },
			{ "Monster Energy", "civ", {
	                "textures\civi\fahrzeuge\off\monsterenergy_off.jpg"
            } },
			{ "Badmobil", "civ", {
	                "textures\civi\fahrzeuge\off\offroad_badmobil.jpg"
            } },
			{ "Cyan", "civ", {
	                "textures\civi\fahrzeuge\off\offroad_cyan.jpg"
            } },
			{ "Typ 1", "civ", {
	                "textures\civi\fahrzeuge\off\offroader_civ.jpg"
            } },
			{ "Pokemon", "civ", {
	                "textures\civi\fahrzeuge\off\pokemon.jpg"
            } },
			{ "MTD Dienstfahrzeug", "med", {
	                "textures\mtd\fahrzeuge\mtd_offroad.paa"
            } }
        };
    };

    class C_Kart_01_Blu_F {
        vItemSpace = 20;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        rentalprice[] = { 15000, -1, -1, -1 };
        textures[] = {};
    };
/*
To edit another information in this classes you can use this exemple.
class C_Kart_01_Fuel_F : C_Kart_01_Blu_F{
    vItemSpace = 40;
    rentalprice[] = { 25000, -1, -1, -1 };
};

will modify the virtual space and the price of the vehicle, but other information such as license and textures will pick up the vehicle declare at : Vehicle {};
*/
    class C_Kart_01_Fuel_F : C_Kart_01_Blu_F{}; // Get all information of C_Kart_01_Blu_F
    class C_Kart_01_Red_F  : C_Kart_01_Blu_F{};
    class C_Kart_01_Vrana_F : C_Kart_01_Blu_F{};

    class C_Hatchback_01_sport_F {
        vItemSpace = 45;
        licenses[] = { {"driver"}, {"cAir"}, {"mAir"}, {""} };
        rentalprice[] = { 52500, 35000, 35000, -1 };
        textures[] = {
            { "Rot", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"
            } },
			{ "Blau", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"
            } },
			{ "Orange", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport03_co.paa"
            } },
			{ "Schwarz/Weiss", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa"
            } },
			{ "Beige", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport05_co.paa"
            } },
			{ "Grün", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport06_co.paa"
            } },
        	{ "Polizei", "cop", {
					"textures\cop\fahrzeuge\polizei_hatchback.paa"
            } },
			{ "Ghost", "civ", {
                "textures\civi\fahrzeuge\hatch\ghost_hatchback_sport.jpg"
            } },
			{ "Ken", "civ", {
                "textures\civi\fahrzeuge\hatch\hatchback_sport_ken_block.jpg"
            } },
			{ "Redbull", "civ", {
                "textures\civi\fahrzeuge\hatch\redgull_hatchback_sport.jpg"
            } },
			{ "Rally", "civ", {
                "textures\civi\fahrzeuge\hatch\rally.jpg"
            } },
			{ "MTD Dienstfahrzeug", "med", {
                "textures\mtd\fahrzeuge\mtd_limousine.paa"
            } }
        };
    };

    class B_Quadbike_01_F {
        vItemSpace = 25;
        licenses[] = { {"driver"}, {"cdriver"}, {""}, {""} };
        rentalprice[] = { 7500, 2500, -1, -1 };
        textures[] = {
            { "Polizei", "cop", {
                "textures\cop\fahrzeuge\polizei_quad.paa"
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
            } }
        };
    };

    class I_Truck_02_covered_F {
        vItemSpace = 420;
        licenses[] = { {"trucking"}, {"kripo"}, {""}, {""} };
        rentalprice[] = { 440000, 30000, -1, -1 };
        textures[] = {
            { "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            } },
            { "Orange", "cop", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            } },
			{ "Black", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } }
        };
    };

    class I_Truck_02_transport_F {
        vItemSpace = 250;
        licenses[] = { {"trucking"}, {"kripo"}, {"mtrucking"}, {""} };
        rentalprice[] = { 75000, 20000, 35000, -1 };
        textures[] = {
           { "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            } },
			{ "MTD Dienstfarzeug", "med", {
                "textures\mtd\fahrzeuge\mtd_zamak.paa",
				"textures\mtd\fahrzeuge\mtd_zamakh.paa"
            } }
        };
    };

    class O_Truck_03_covered_F {
        vItemSpace = 300;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        rentalprice[] = { 250000, -1, -1, -1 };
        textures[] = {};
    };
	
	class I_Heli_Transport_02_F {
        vItemSpace = 320;
        licenses[] = { {"pilot"}, {""}, {""}, {""} };
        rentalprice[] = { 4500000, -1, -1, -1 };
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
            } },
            { "Digi grün", "civ", {
                "\a3\air_f_beta\Heli_Transport_02\Data\heli_transport_02_1_indp_co.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\heli_transport_02_2_indp_co.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\heli_transport_02_3_indp_co.paa"
            } }
		};
    };
	
	class O_Heli_Transport_04_F {
        vItemSpace = 220;
        licenses[] = { {"pilot"}, {""}, {""}, {""} };
        rentalprice[] = { 4330000, -1, -1, -1 };
        textures[] = {
			{ "Hexa Tarn", "civ", {
                "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_co.paa",
                "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_co.paa"
            } },
            { "Schwarz", "civ", {
                "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_black_co.paa",
                "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_black_co.paa"
            } }
		};
    };
	
	class O_Heli_Transport_04_box_F {
        vItemSpace = 450;
        licenses[] = { {"pilot"}, {""}, {""}, {""} };
        rentalprice[] = { 8700000, -1, -1, -1 };
        textures[] = {
			{ "Hexa Tarn", "civ", {
                "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_co.paa",
                "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_co.paa",
				"a3\air_f_heli\heli_transport_04\data\heli_transport_04_pod_ext01_co.paa",
				"a3\air_f_heli\heli_transport_04\data\heli_transport_04_pod_ext02_co.paa"

            } },
            { "Grau", "civ", {
                "textures\civi\fahrzeuge\taru\CIV_Taru_Grau_0.paa",
                "textures\civi\fahrzeuge\taru\CIV_Taru_Grau_1.paa",
				"#(rgb,8,8,3)color(0.1,0.1,0.1,1)",
				"#(rgb,8,8,3)color(0.1,0.1,0.1,1)"
            } },
            { "Skycrane", "civ", {
                "textures\civi\fahrzeuge\taru\CIV_Taru_Skycrane_0.paa",
                "textures\civi\fahrzeuge\taru\CIV_Taru_Skycrane_1.paa",
				"#(rgb,8,8,3)color(1,0.15,0,1)",
				"#(rgb,8,8,3)color(1,0.15,0,1)"
            } },
            { "Schwarz", "civ", {
                "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_black_co.paa",
                "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_black_co.paa",
				"a3\air_f_heli\heli_transport_04\data\heli_transport_04_pod_ext01_black_co.paa",
				"a3\air_f_heli\heli_transport_04\data\heli_transport_04_pod_ext02_black_co.paa"
            } }
		};
    };

    class C_Hatchback_01_F {
        vItemSpace = 40;
        licenses[] = { {"driver"}, {"cdriver"}, {"mdriver"}, {""} };
        rentalprice[] = { 15500, 45000, 45000, -1 };
        textures[] = {
            { "Polizei", "cop", {
                "textures\cop\fahrzeuge\polizei_hatchback.paa"
            } },
			{ "Grün", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa"
            } },
			{ "Blau", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa"
            } },
			{ "Dunkelblau", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa"
            } },
			{ "Gelb", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa"
            } },
			{ "Weiss", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa"
            } },
			{ "Grau", "civ", {
	                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa"
            } },
            { "Schwarz", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa"
            } },
			{ "Feuer", "civ", {
                "textures\civi\fahrzeuge\hatch\Fire_hatchback.jpg"
            } },
			{ "Rockstar", "civ", {
                "textures\civi\fahrzeuge\hatch\Rockstar_Hatchback.jpg"
            } },
			{ "Rally", "civ", {
                "textures\civi\fahrzeuge\hatch\rally.jpg"
            } },
			{ "Mario", "civ", {
                "textures\civi\fahrzeuge\hatch\hatchbackv1.jpg"
            } },
			{ "MTD Dienstfahrzeug", "med", {
                "textures\mtd\fahrzeuge\mtd_limousine.paa"
            } }
        };
    };

    class C_SUV_01_F {
        vItemSpace = 50;
        licenses[] = { {"driver"}, {"cdriver"}, {"mdriver"}, {""} };
        rentalprice[] = { 30000, 15000, 15000, -1 };
        textures[] = {
            { "Polizei", "cop", {
                "textures\cop\fahrzeuge\polizei_suv.paa"
            } },
			{ "Polizei Zivil", "cop", {
	                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa"
            } },
			{ "SEK", "cop", {
                "textures\cop\fahrzeuge\polizei_sek.paa"
            } },
			{ "Dunkel Rot", "civ", { 
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"
            } },
			{ "Silber", "civ", {
	                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"
            } },
			{ "Orange", "civ", {
	                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"
            } },          
			{ "Ghostrider", "civ", {
                "textures\civi\fahrzeuge\suv\suv_Ghostrider.jpg"
            } },
			{ "Triad", "civ", {
                "textures\civi\fahrzeuge\suv\Triad.paa"
            } },
			{ "Schwarz / Weiss", "civ", {
                "textures\civi\fahrzeuge\suv\bluewhite.paa"
            } },
			{ "Racing", "civ", {
                "textures\civi\fahrzeuge\suv\suv_race.jpg"
            } },
			{ "Monster", "civ", {
                "textures\civi\fahrzeuge\suv\suv_monster.jpg"
            } },
			{ "Carbon", "civ", {
                "textures\civi\fahrzeuge\suv\carbon_suv.jpg"
            } },
			{ "Ferrari", "civ", {
                "textures\civi\fahrzeuge\suv\civ_suv_ferrari.jpg"
            } },
			{ "Skull", "civ", {
                "textures\civi\fahrzeuge\suv\civ_suv_skull.jpg"
            } },
			{ "MTD Dienstfahrzeug", "med", {
                "textures\mtd\fahrzeuge\mtd_suv.paa"
            } }
        };
    };

    class C_Van_01_transport_F {
        vItemSpace = 100;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        rentalprice[] = { 45000, -1, -1, -1 };
        textures[] = {
            { "Weiss", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
            { "Rot", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } },
            { "Schwarz", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_black_co.paa"
            } }
        };
    };

    class C_Van_01_box_F {
        vItemSpace = 140;
        licenses[] = { {"driver"}, {"kripo"}, {"mtrucking"}, {""} };
        rentalprice[] = { 156000, 20000, 25000, -1 };
        textures[] = {
            { "White", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } },
			{ "MTD Dienstfahrzeug", "med", {
				"textures\mtd\fahrzeuge\mtd_tank0.paa",
				"textures\mtd\fahrzeuge\mtd_van.paa"
            } }
        };
    };

    class B_MRAP_01_F {
        vItemSpace = 35;
        licenses[] = { {""}, {"ctrucking"}, {""}, {""} };
        rentalprice[] = { -1, 30000, -1, -1 };
        textures[] = {
            { "Polizei", "cop", {
                "textures\cop\fahrzeuge\polizei_Hunter_0.paa",
				"textures\cop\fahrzeuge\polizei_hunter_1.paa"
            } }
        };
    };

     class B_Heli_Light_01_stripped_F {
        vItemSpace = 90;
        licenses[] = { {"rebel"}, {""}, {""}, {""} };
        rentalprice[] = { 1200000, -1, -1, -1 };
        textures[] = {
            { "Rebel Digital", "reb", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
            } }
        };
    };

    class B_Heli_Light_01_F {
        vItemSpace = 90;
        licenses[] = { {"pilot"}, {"cAir"}, {"mAir"}, {""} };
        rentalprice[] = { 800000, 40000, 40000, -1 };
        textures[] = {
            { "Beige", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa"
            } },
			{ "Schwarz", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa"
            } },
			{ "Blau-Hell-Dunkel", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"
            } },
			{ "Rot", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"
            } },
			{ "Digi Grün", "donate", {
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
			{ "Wespe", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa"
            } },
			{ "Rebel Digital", "reb", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
            } },
			{ "Polizei", "cop", {
                "textures\cop\fahrzeuge\polizei_hummingbird.paa"
            } },
			{ "MTD Luftrettung", "med", {
                "textures\mtd\fahrzeuge\mtd_hummingbird.paa"
            } }
        };
    };

    class C_Heli_Light_01_civil_F {
        vItemSpace = 75;
		licenses[] = { {"pilot" }, {""}, {""}, {""} };
        rentalprice[] = { 700000, -1, -1, -1 };
		textures[] = {
            { "RedBull", "civ", {
                "textures\civi\fahrzeuge\hum\civ_hummingbird_redbull.jpg"
            } },
            { "Monster", "civ", {
                "textures\civi\fahrzeuge\hum\hummingbird_monster.jpg"
            } },
			{ "Kitty", "civ", {
                "textures\civi\fahrzeuge\hum\kitty_heli.jpg"
            } }
		};	
    };

    class O_Heli_Light_02_unarmed_F {
        vItemSpace = 210;
        licenses[] = { {"pilot" }, {"cAir"}, {"mAir"}, {""} };
        rentalprice[] = { 3600000, 55000, 55000, -1 };
        textures[] = {
           { "Schwarz", "civ", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa"
            } },
			{ "Schwarz", "reb", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa"
            } },
			{ "Weiss / Blau", "civ", {
	                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"
            } },
			{ "Orca", "civ", {
	                "a3\air_f_heli\heli_light_02\data\heli_light_02_ext_opfor_v2_co.paa"
            } },
			{ "Digi Green", "reb", {
	                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"
            } },
			{ "Desert Digi", "reb", {
	                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa"
            } },
            { "MTD Luftrettung", "med", {
                "textures\mtd\fahrzeuge\mtd_orca.paa"
            } }
        };
    };

    class B_SDV_01_F {
        vItemSpace = 60;
        licenses[] = { {"boat"}, {"cboat"}, {""}, {""} };
        rentalprice[] = { 1000000, 80000, -1, -1 };
        textures[] = {
			{ "U-Boot", "civ", {
	                "\a3\boat_f_beta\SDV_01\Data\sdv_ext_co.paa"
            } },
			{ "Polizei", "cop", {
	                "textures\cop\fahrzeuge\polizei_uboot.paa"
            } }
		};
    };
	
	   class I_Boat_Armed_01_minigun_F {
        vItemSpace = 175;
        licenses[] = { {""}, {"cboat"}, {""}, {""} };
        rentalprice[] = { -1, 100000, -1, -1 };
        textures[] = {};
    };

        class C_Van_01_fuel_F {
        vItemSpace = 20;
        vFuelSpace = 19500;
        licenses[] = { {"driver"}, {"kripo"}, {"mtrucking"}, {""} };
        rentalprice[] = { 184000, 20000, 25000, -1 };
        textures[] = {
            { "White", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } },
			{ "MTD Dienstfahrzeug", "med", {
               "textures\mtd\fahrzeuge\mtd_tank0.paa",
			   "textures\mtd\fahrzeuge\mtd_tank1.paa"
            } }
        };
    };

    class I_Truck_02_fuel_F {
        vItemSpace = 40;
        vFuelSpace = 42000;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        rentalprice[] = { 200000, -1, -1, -1 };
        textures[] = {
            { "White", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_fuel_co.paa"
            } }
        };
    };

    class B_Truck_01_fuel_F {
        vItemSpace = 1000;
        vFuelSpace = 50000;
        licenses[] = { {"trucking"}, {"kripo"}, {""}, {""} };
        rentalprice[] = { 250000, 20000, -1, -1 };
        textures[] = {};
    };
};
