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
            { "B_Quadbike_01_F", { "", "", -1 } }, // Quad
			{ "C_Offroad_02_unarmed_F", { "", "", -1 } }, // Jeep 4WD
			{ "C_Offroad_01_F", { "", "", -1 } }, // Offroader
            { "C_Hatchback_01_F", { "", "", -1 } }, // Limousine
			{ "C_Hatchback_01_sport_F", { "", "", -1 } }, // Sportlimo
            { "C_SUV_01_F", { "", "", -1 } } // SUV
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
			{ "C_Van_01_transport_F", { "", "", -1 } }, // Truck
			{ "C_Van_01_box_F", { "", "", -1 } }, // Truck Boxer
			{ "I_Truck_02_transport_F", { "", "", -1 } }, // Zamak Transport
			{ "I_Truck_02_covered_F", { "", "", -1 } }, // Zamak Transport abgedeckt
			{ "B_Truck_01_transport_F", { "", "", -1 } }, // HEMTT Transport
			{ "B_Truck_01_covered_F", { "", "", -1 } }, // HEMTT Transport abgedeckt
			{ "O_Truck_03_transport_F", { "", "", -1 } }, // Tempest Transport
			{ "O_T_Truck_03_transport_ghex_F", { "", "", -1 } }, //Tempest Transport Ghex Skin
			{ "O_Truck_03_covered_F", { "", "", -1 } }, // Tempest Transport abgedeckt
			{ "O_T_Truck_03_covered_ghex_F", { "", "", -1 } }, //Tempest Transport abgedeckt Ghex Skin
			{ "C_Van_01_fuel_F", { "", "", -1 } }, // Fuel Truck
			{ "I_Truck_02_fuel_F", { "", "", -1 } }, // Zamak Fuel
			{ "B_Truck_01_fuel_F", { "", "", -1 } }, // HEMTT Fuel
			{ "O_Truck_03_fuel_F", { "", "", -1 } }, // Tempest Fuel
			{ "O_T_Truck_03_fuel_ghex_F", { "", "", -1 } } //Tempest Fuel Ghex Skin
        };
    };

    class civ_air {
        side = "civ";
        vehicles[] = {
            { "B_Heli_Light_01_F", { "", "", -1 } }, //Hummingbird
			{ "C_Plane_Civil_01_F", { "", "", -1 } }, //Cessna
			{ "C_Plane_civil_01_racing_F", { "", "", -1 } }, //Cessna
            { "O_Heli_Light_02_unarmed_F", { "", "", -1 } }, //Orca
			{ "I_Heli_Transport_02_F", { "", "", -1 } }, //Mohawk
			{ "B_Heli_Transport_03_unarmed_F", { "", "", -1 } }, //Huron
			{ "O_Heli_Transport_04_F", { "", "", -1 } }, //Taru
			{ "B_supplyCrate_F", { "", "", -1 } } //box
        };
    };

     class civ_ship {
        side = "civ";
        vehicles[] = {
            { "C_Rubberboat", { "", "", -1 } },
            { "C_Boat_Civil_01_F", { "", "", -1 } },
            { "B_SDV_01_F", { "", "", -1 } },
            { "C_Boat_Transport_02_F", { "", "", -1 } }, //Apex DLC
            { "C_Scooter_Transport_01_F", { "", "", -1 } } //Apex DLC

        };
    };

    class reb_car {
        side = "civ";
        vehicles[] = {
            { "B_Quadbike_01_F", { "", "", -1 } }, //Quad
            { "B_G_Offroad_01_F", { "", "", -1 } }, //Offroader
            { "B_Heli_Light_01_stripped_F", { "", "", -1 } }, //Hummingbird
			{ "O_T_LSV_02_unarmed_arid_F", { "", "", -1 } }, //Quilin
			{ "O_T_LSV_02_unarmed_ghex_F", { "", "", -1 } } //Quilin
        };
    };

	class neureich {
        side = "civ";
        vehicles[] = {
			{ "O_MRAP_02_F", { "", "", -1 } }, //Ifrit
			{ "O_T_MRAP_02_ghex_F", { "", "", -1 } }, //Ifrit Ghex
			{ "I_MRAP_03_F", { "", "", -1 } }, //Strider
			{ "B_Truck_01_box_F", { "", "", -1 } }, // HEMTT Box
			{ "O_Truck_03_device_F", { "", "", -1 } }, // Tempest Gerät
			{ "O_Heli_Transport_04_box_F", { "", "", -1 } }, //Taru Box
			{ "B_T_VTOL_01_vehicle_olive_F", { "", "", -1 } }, //Blackfish olive Vehicle
			{ "B_T_VTOL_01_infantry_olive_F", { "", "", -1 } } //Blackfish olive Infantry
        };
    };

    class med_shop {
        side = "med";
        vehicles[] = {
            { "C_Offroad_01_F", { "life_mediclevel", "SCALAR", 1 } },
			{ "C_SUV_01_F", {"life_mediclevel", "SCALAR", 3 } },
            { "C_Hatchback_01_sport_F", {"life_mediclevel", "SCALAR", 4 } },
			{ "C_Van_01_box_F", {"life_mediclevel", "SCALAR", 1 } }
        };
    };

    class med_air {
        side = "med";
        vehicles[] = {
            { "B_Heli_Light_01_F", { "life_mediclevel", "SCALAR", 2 } },
            { "O_Heli_Light_02_unarmed_F", { "life_mediclevel", "SCALAR", 3 } },
            { "I_Heli_Light_03_unarmed_F", { "life_mediclevel", "SCALAR", 5 } },
			{ "O_Heli_Transport_04_F", { "life_mediclevel", "SCALAR", 5 } },
			{ "O_Heli_Transport_04_medevac_F", { "life_mediclevel", "SCALAR", 7 } }
        };
    };

    class cop_car {
        side = "cop";
        vehicles[] = {
            { "C_Offroad_01_F", { "", "", -1 } },
            { "C_SUV_01_F", { "", "", -1 } },
            { "C_Hatchback_01_sport_F", { "life_coplevel", "SCALAR", 1 } },
			{ "B_T_LSV_01_unarmed_olive_F", { "life_coplevel", "SCALAR", 5 } },
			{ "B_T_LSV_01_unarmed_sand_F", { "life_coplevel", "SCALAR", 5 } },
            { "B_MRAP_01_F", { "life_coplevel", "SCALAR", 7 } },
            { "I_MRAP_03_F", { "life_coplevel", "SCALAR", 15 } },
			{ "B_T_APC_Tracked_01_CRV_F", { "life_coplevel", "SCALAR", 15 } },
			{ "B_T_APC_Wheeled_01_cannon_F", { "life_coplevel", "SCALAR", 15 } }
        };
    };

    class cop_air {
        side = "cop";
        vehicles[] = {
            { "B_Heli_Light_01_F", { "", "", -1 } }, // Hummingbird
            { "B_Heli_Transport_01_F", { "life_coplevel", "SCALAR", 9 } }, //Ghosthawk
			{ "I_Heli_Light_03_unarmed_F", { "life_coplevel", "SCALAR", 8 } }, //Hellcat
			{ "I_Heli_Transport_02_F", { "life_coplevel", "SCALAR", 4 } }, //Mohawk
			{ "O_Heli_Light_02_unarmed_F", { "life_coplevel", "SCALAR", 5 } }, //Orca
			{ "B_Heli_Transport_03_unarmed_F", { "life_coplevel", "SCALAR", 12 } }, //Huron
			{ "O_T_VTOL_02_infantry_F", { "life_coplevel", "SCALAR", 12 } } //Huron
        };
    };

    class cop_ship {
        side = "cop";
        vehicles[] = {
            { "B_Boat_Transport_01_F", { "", "", -1 } },
            { "C_Boat_Civil_01_police_F", { "", "", -1 } },
            { "B_SDV_01_F", { "", "", -1 } }
        };
    };
	class adac {
		side = "adac";
		vehicles[] = {
            { "C_Offroad_01_F", { "", "", -1 } },
            { "C_SUV_01_F", { "", "", -1 } },
            { "B_Truck_01_transport_F", { "", "", -1 } },
            { "I_Heli_Transport_02_F", { "", "", -1 } }
        };
	};
};

class LifeCfgVehicles {
    /*
    *    Vehicle Configs (Contains textures and other stuff)
    *
    *    "price" is the price before any multipliers set in Master_Config are applied.
    *
    *    Default Multiplier Values & Calculations:
    *       Civilian [Purchase, Sell]: [1.0, 0.5]
    *       Cop [Purchase, Sell]: [0.5, 0.5]
    *       Medic [Purchase, Sell]: [0.75, 0.5]
    *       ChopShop: Payout = price * 0.25
    *       GarageSell: Payout = price * [0.5, 0.5, 0.5, -1]
    *       Cop Impound: Payout = price * 0.1
    *       Pull Vehicle from Garage: Cost = price * [1, 0.5, 0.75, -1] * [0.5, 0.5, 0.5, -1]
    *           -- Pull Vehicle & GarageSell Array Explanation = [civ,cop,medic,east]
    *
    *       1: ARRAY (license required)
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
        price = -1;
        textures[] = {};
    };
	
	class O_T_VTOL_02_infantry_F {
        vItemSpace = -1;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 50000000;
        textures[] = {};
    };
	class B_T_APC_Tracked_01_CRV_F {
        vItemSpace = -1;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 50000000;
        textures[] = {};
    };

    // Apex DLC
    class C_Boat_Transport_02_F // RHIB Boot
	{
        vItemSpace = 100;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 10000;
        textures[] = {};
    };

    // Apex DLC
    class C_Scooter_Transport_01_F // Jetski
	{
        vItemSpace = 30;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 5200;
        textures[] = {};
    };

    // Apex DLC
    class O_T_LSV_02_unarmed_arid_F // Quilin Arid
	{
        vItemSpace = 50;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 100000;
        textures[] = {};
    };

	class O_T_LSV_02_unarmed_ghex_F // Quilin Ghex
	{
        vItemSpace = 50;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 100000;
        textures[] = {};
    };

	class B_T_LSV_01_unarmed_black_F // Prawler Black
	{
        vItemSpace = 50;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 100000;
        textures[] = {};
    };

	class B_T_LSV_01_unarmed_olive_F // Prawler Olive
	{
        vItemSpace = 50;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 100000;
        textures[] = {};
    };

	class B_T_LSV_01_unarmed_sand_F // Prawler Sand
	{
        vItemSpace = 50;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 100000;
        textures[] = {};
    };

    class B_Heli_Transport_01_F // Ghosthawk
	{
        vItemSpace = 50;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 500000;
        textures[] = {
			{ "Polizei", "cop", {
				"textures\cop\vehicle\polizei_ghost1.jpg",
                "textures\cop\vehicle\polizei_ghost2.jpg"
            } }
		};
    };

	class B_T_VTOL_01_vehicle_olive_F // Blackfish Olive Vehicle
	{
        vItemSpace = 3000;
        licenses[] = { {"neureich"}, {""}, {""}, {""} };
        price = 5000000;
        textures[] = {};
    };

	class B_T_VTOL_01_infantry_olive_F // Blackfish Olive Infantry
	{
        vItemSpace = 3000;
        licenses[] = { {"neureich"}, {""}, {""}, {""} };
        price = 5000000;
        textures[] = {};
    };

	class B_T_VTOL_01_vehicle_blue_F // Blackfish Blue Vehicle
	{
        vItemSpace = 1000;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 5000000;
        textures[] = {};
    };

	class B_T_VTOL_01_infantry_blue_F // Blackfish Blue Infantry
	{
        vItemSpace = 1000;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 5000000;
        textures[] = {};
    };



    class B_Boat_Armed_01_minigun_F // Boot armed
	{
        vItemSpace = 175;
        licenses[] = { {""}, {"cg"}, {""}, {""} };
        price = 75000;
        textures[] = { };
    };

    class B_Boat_Transport_01_F // Assault Boot
	{
        vItemSpace = 45;
        licenses[] = { {""}, {"cg"}, {""}, {""} };
        price = 3000;
        textures[] = { };
    };

	class C_Van_01_transport_F // Truck
	{
        vItemSpace = 150;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 45000;
        textures[] = {
            { "White", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } }
        };
    };

    class C_Van_01_box_F // Truck Boxer
	{
        vItemSpace = 200;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 55000;
        textures[] = {
            { "White", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } },
			{ "EMS", "med", {
                "textures\med\vehicle\rtwfront.paa",
                "textures\med\vehicle\rtwback.paa"
            } }
        };
    };


	class I_Truck_02_transport_F // Zamak Transport
	{
        vItemSpace = 300;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 200000;
        textures[] = {
            { "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            } }
        };
    };

	class I_Truck_02_covered_F // Zamak Transport abgedeckt
	{
        vItemSpace = 450;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 300000;
        textures[] = {
            { "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            } }
        };
    };

    class B_Truck_01_transport_F // HEMTT Transport
	{
        vItemSpace = 500;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 550000;
        textures[] = { 
			{ "Standart", "civ", {
                "\A3\soft_f_beta\Truck_01\data\Truck_01_ext_01_CO.paa",
                "\A3\soft_f_beta\Truck_01\data\Truck_01_ext_02_CO.paa"
            } },
			{ "adac", "adac", {
                "textures\adac\vehicle\adac_hemtt.jpg"
            } }
		};
    };

	class B_Truck_01_covered_F // HEMTT Transport abgedeckt
	{
        vItemSpace = 650;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 700000;
        textures[] = { };
    };

    class B_Truck_01_box_F // HEMTT Box
	{
        vItemSpace = 1500;
        licenses[] = { {"neureich"}, {""}, {""}, {""} };
        price = 1000000;
        textures[] = { };
    };

    class O_Truck_03_transport_F // Tempest Transport
	{
        vItemSpace = 500;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 600000;
        textures[] = { };
    };

	class O_T_Truck_03_transport_ghex_F // Tempest Transport Ghex Skin
	{
        vItemSpace = 500;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 600000;
        textures[] = { };
    };

	class O_Truck_03_covered_F // Tempest Transport abgedeckt
	{
        vItemSpace = 650;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 750000;
        textures[] = {};
    };

	class O_T_Truck_03_covered_ghex_F // Tempest Transport abgedeckt Ghex Skin
	{
        vItemSpace = 650;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 750000;
        textures[] = {};
    };

    class O_Truck_03_device_F // Tempest Gerät
	{
        vItemSpace = 1000;
        licenses[] = { {"neureich"}, {""}, {""}, {""} };
        price = 1650000;
        textures[] = {};
    };

	class O_T_Truck_03_device_ghex_F // Tempest Gerät Ghex Skin
	{
        vItemSpace = 1000;
        licenses[] = { {"neureich"}, {""}, {""}, {""} };
        price = 1650000;
        textures[] = {};
    };

    class Land_CargoBox_V1_F // Cargo Box
	{
        vItemSpace = 500;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 50000;
        textures[] = {};
    };

    class B_supplyCrate_F // Supply Box
	{
        vItemSpace = 400;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 25000;
        textures[] = {};
    };

    class B_G_Offroad_01_F // Offroader
	{
        vItemSpace = 85;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 12500;
        textures[] = {};
    };

    class C_Boat_Civil_01_F // Motorboot
	{
        vItemSpace = 100;
        licenses[] = { {"boat"}, {""}, {""}, {""} };
        price = 12000;
        textures[] = { };
    };

    class C_Boat_Civil_01_police_F // Motorboot Polizei
	{
        vItemSpace = 85;
        licenses[] = { {""}, {"cg"}, {""}, {""} };
        price = 10000;
        textures[] = { };
    };

    class O_MRAP_02_F // Ifrit
	{
        vItemSpace = 100;
        licenses[] = { {"neureich"}, {""}, {""}, {""} };
        price = 100000;
        textures[] = {
			{ "Totenkopf", "civ", {
				"textures\civ\vehicle\ifritTotenkopf1.jpg",
				"textures\civ\vehicle\ifritTotenkopf2.jpg"
			} },
			{ "Red Camo", "civ", {
				"textures\civ\vehicle\ifrit_r1.jpg",
				"textures\civ\vehicle\ifrit_r2.jpg"
			} },
			{ "Rebellen Tarnung", "civ", {
                "\A3\Soft_F\MRAP_02\data\mrap_02_ext_01_co.paa",
				"\A3\Soft_F\MRAP_02\data\mrap_02_ext_02_co.paa"
            } }
		};
    };

	class O_T_MRAP_02_ghex_F // Ifrit Ghex Skin
	{
        vItemSpace = 100;
        licenses[] = { {"neureich"}, {""}, {""}, {""} };
        price = 100000;
        textures[] = {};
    };

	class  I_MRAP_03_F  // Strider
	{
        vItemSpace = 100;
        licenses[] = { {"neureich"}, {""}, {""}, {""} };
        price = 3000000;
        textures[] = {
			{ "Silver Camo", "civ", {
				"textures\civ\vehicle\strider_civ.jpg"
			} },
			{ "SEK", "cop", {
				"textures\cop\vehicle\strider_sek.jpg"
			} },
			{ "Leitung", "cop", {
				"textures\cop\vehicle\Vehic.jpg"
			} }
		}; 
	};


    class C_Offroad_01_F // Offroader
	{
        vItemSpace = 100;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 12500;
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
			{ "Monsterenergy", "civ", {
				"textures\civ\vehicle\monsterenergy_off.paa"
			} },
			{ "Polizei", "cop", {
                "textures\cop\vehicle\Police_Offroader_german.jpg"
            } },
			{ "Red", "cop", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"
            } },
            { "Yellow", "cop", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa"
            } },
            { "White", "cop", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa"
            } },
            { "Blue", "cop", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa"
            } },
            { "Dark Red", "cop", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa"
            } },
            { "Blue / White", "cop", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa"
            } },
			{ "Monsterenergy", "cop", {
				"textures\civ\vehicle\monsterenergy_off.paa"
			} },
			{ "Notarzt", "med", {
				"textures\med\vehicle\Medic_Offroader.paa"
			} },
			{ "ADAC", "adac", {
				"textures\adac\vehicle\adac_offroad.jpg"
			} }
        };
    };

    class C_Kart_01_Blu_F // Kart
	{
        vItemSpace = 0;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 15000;
        textures[] = {};
    };
/*
To edit another information in this classes you can use this exemple.
class C_Kart_01_Fuel_F : C_Kart_01_Blu_F{
    vItemSpace = 40;
    price = ;
};

will modify the virtual space and the price of the vehicle, but other information such as license and textures will pick up the vehicle declare at : Vehicle {};
*/
    class C_Kart_01_Fuel_F : C_Kart_01_Blu_F{}; // Get all information of C_Kart_01_Blu_F
    class C_Kart_01_Red_F  : C_Kart_01_Blu_F{};
    class C_Kart_01_Vrana_F : C_Kart_01_Blu_F{};

    class C_Hatchback_01_sport_F // Sportlimo
	{
        vItemSpace = 60;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 75000;
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
            { "Polizei", "cop", {
                "textures\cop\vehicle\polizei_hatchback.jpg"
            } },
			{ "Red", "cop", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"
            } },
            { "Dark Blue", "cop", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"
            } },
            { "Orange", "cop", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport03_co.paa"
            } },
            { "Black / White", "cop", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa"
            } },
            { "Beige", "cop", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport05_co.paa"
            } },
            { "Green", "cop", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport06_co.paa"
            } },
            { "Ghost Hunters", "civ", {
                "textures\civ\vehicle\ghost_hatchback_sport.paa"
            } },
			{ "Sportlimo", "med", {
                "textures\med\vehicle\sportlimoMedic.paa"
            } }
        };
    };

    class B_Quadbike_01_F // Quad
	{
        vItemSpace = 40;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 2500;
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
            } }
        };
    };

    class C_Hatchback_01_F // Limo
	{
        vItemSpace = 50;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 9500;
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
			{ "Polizei", "cop", {
                "textures\cop\vehicle\polizei_hatchback.jpg"
            } },
			{ "Badmobil", "civ", {
                "textures\civ\vehicle\hatchback_badmobil.paa"
            } },
			{ "Hello Kittie", "civ", {
                "textures\civ\vehicle\hello_hatch.paa"
            } },
			{ "Beige", "cop", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa"
            } },
            { "Green", "cop", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa"
            } },
            { "Blue", "cop", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa"
            } },
            { "Dark Blue", "cop", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa"
            } },
            { "Yellow", "cop", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa"
            } },
            { "White", "cop", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa"
            } },
            { "Grey", "cop", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa"
            } }
        };
    };

    class C_SUV_01_F // SUV
	{
        vItemSpace = 70;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 20000;
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
            { "Polizei", "cop", {
                "textures\cop\vehicle\Police_Suv_german.jpg"
            } },
			{ "Dark Red", "cop", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"
            } },
            { "Silver", "cop", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"
            } },
            { "Orange", "cop", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"
            } },
			{ "Notarzt", "med", {
                "textures\med\vehicle\Medic_suv.paa"
            } },
			{ "Hyperbeast", "civ", {
				"textures\civ\vehicle\HyperbeastSuv.jpg"
            } },
			{ "Joker", "civ", {
                "textures\civ\vehicle\Joker_Suv.jpg"
            } },
			{ "Minecraft", "civ", {
                "textures\civ\vehicle\minecraft_suv.paa"
            } },
			{ "Sticker", "civ", {
                "textures\civ\vehicle\sticker_suv.paa"
            } },
			{ "Hello Kittie", "civ", {
                "textures\civ\vehicle\suv_kitty.paa"
            } },
			{ "Nightforce", "civ", {
                "textures\civ\vehicle\Nightforce_SUV.jpg"
            } },
			{ "Predator", "civ", {
                "textures\civ\vehicle\Predator_SUV.jpg"
            } },
			{ "Camo", "civ", {
                "textures\civ\vehicle\camo_suv.paa"
            } },
			{ "Blue Fire", "civ", {
                "textures\civ\vehicle\civ_suv_v2.paa"
            } },
			{ "Ferari", "civ", {
                "textures\civ\vehicle\ferrari_suv.paa"
            } },
			{ "ADAC", "adac", {
                "textures\adac\vehicle\adac_suv.jpg"
            } }
        };
    };

    class B_MRAP_01_F // Hunter
	{
        vItemSpace = 100;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 50000;
        textures[] = {
            { "Polizei", "cop", {
                "textures\cop\vehicle\Police_hunter1_german.jpg",
                "textures\cop\vehicle\Police_hunter2_german.jpg"
            } },
			{ "Braun", "reb", {
                "\a3\soft_f\MRAP_01\Data\mrap_01_base_co.paa",
				"\a3\soft_f\MRAP_01\Data\mrap_01_adds_co.paa"
            } }
        };
    };

     class B_Heli_Light_01_stripped_F // Hummingbird
	 {
        vItemSpace = 50;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 450000;
        textures[] = {
            { "Rebel Digital", "reb", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
            } },
            { "Designed Rebel", "reb", {
                "textures\civ\vehicle\heli_humm2.paa"
            } },
			{ "Polizei", "cop", {
                "textures\cop\vehicle\Police_hummingbird_german.jpg"
            } }
        };
    };

    class B_Heli_Light_01_F // Hummingbird
	{
        vItemSpace = 50;
        licenses[] = { {"pilot"}, {""}, {""}, {""} };
        price = 450000;
        textures[] = {
			{ "Polizei", "cop", {
                "textures\cop\vehicle\Police_hummingbird_german.jpg"
            } },
            { "Sheriff", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa"
            } },
            { "Civ Blue", "civ", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"
            } },
            { "Civ Red", "civ", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"
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
            { "Digi Green", "reb", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa"
            } },
            { "Medic", "med", {
                "textures\med\vehicle\medic_littlebird.paa"
            } }
        };
    };

    class O_Heli_Light_02_unarmed_F // Orca
	{
        vItemSpace = 200;
        licenses[] = { {"pilot" }, {""}, {""}, {""} };
        price = 900000;
        textures[] = {
            { "Polizei", "cop", {
                "textures\cop\vehicle\polizei_orca.jpg"
            } },
            { "White / Blue", "civ", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"
            } },
            { "Digi Green", "civ", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"
            } },
            { "Desert Digi", "reb", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa"
            } },
            { "Medic", "med", {
                "textures\med\vehicle\medic_orca.paa"
            } }
        };
    };

	class I_Heli_Light_03_unarmed_F // Hellcat
	{
        vItemSpace = 50;
        licenses[] = { {"" }, {""}, {""}, {""} };
        price = 850000;
        textures[] = {
            { "Notarzt", "med", {
                "textures\med\vehicle\Notarzt_hellcat.paa"
            } },
			{ "Polizei", "cop", {
                "textures\cop\vehicle\polizei_hellcat.jpg"
            } }
        };
    };

	class I_Heli_Transport_02_F // Mohawk
	{
        vItemSpace = 600;
        licenses[] = { {"pilot"}, {""}, {""}, {""} };
        price = 2500000;
        textures[] = {
			{ "Polizei", "cop", {
                "textures\cop\vehicle\polizei_mohawk1.jpg",
                "textures\cop\vehicle\polizei_mohawk2.jpg",
                "textures\cop\vehicle\polizei_mohawk3.jpg"
            } },
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
            { "ADAC", "adac", {
                "textures\adac\vehicle\adac_mohawk_1.jpg",
                "textures\adac\vehicle\adac_mohawk_2.jpg",
                "textures\adac\vehicle\adac_mohawk_3.jpg"
            } }
		};
    };

	class B_Heli_Transport_03_unarmed_F // Huron
	{
        vItemSpace = 900;
        licenses[] = { {"pilot"}, {""}, {""}, {""} };
        price = 3000000;
        textures[] = {
			{ "Polizei", "cop", {
                "textures\cop\vehicle\polizei_huron1.jpg",
                "textures\cop\vehicle\polizei_huron2.jpg"
            } },
			{ "Schwarz", "civ", {
                "\A3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext01_black_co.paa",
				"\A3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext02_black_co.paa"
            } },
		};
    };

	class O_Heli_Transport_04_F // Taru
	{
        vItemSpace = 250;
        licenses[] = { {"pilot"}, {""}, {""}, {""} };
        price = 2500000;
        textures[] = {
			{ "Camo", "reb", {
                "\A3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_co.paa",
				"\A3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_02_co.paa"
            } },
			{ "Medic", "med", {
                "textures\med\vehicle\taruMedic_1.paa",
                "textures\med\vehicle\taruMedic_2.paa",
				"textures\med\vehicle\taruMedic_3.paa"
            } }
		};
    };

	class O_Heli_Transport_04_box_F // Taru Box
	{
        vItemSpace = 700;
        licenses[] = { {"neureich"}, {""}, {""}, {""} };
        price =2500000 ;
        textures[] = {};
    };

    class B_SDV_01_F // U Boot
	{
        vItemSpace = 50;
        licenses[] = { {"boat"}, {"cg"}, {""}, {""} };
        price = 15000;
        textures[] = {};
    };

    class C_Van_01_fuel_F // Fuel Truck
	{
        vItemSpace = 25;
        vFuelSpace = 19500;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 120000;
        textures[] = {
            { "White", "civ", {
                "\A3\soft_f_gamma\Van_01\data\van_01_ext_co.paa",
                "\A3\soft_f_gamma\Van_01\data\van_01_tank_co.paa"
            } },
            { "Red", "civ", {
                "\A3\soft_f_gamma\Van_01\data\van_01_ext_red_co.paa",
                "\A3\soft_f_gamma\Van_01\data\van_01_tank_red_co.paa"
            } }
        };
    };

    class I_Truck_02_fuel_F // Zamak Fuel
	{
        vItemSpace = 25;
        vFuelSpace = 42000;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 200000;
        textures[] = {
            { "White", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_fuel_co.paa"
            } }
        };
    };
	
    class B_T_APC_Wheeled_01_cannon_F // Marshal
	{
        vItemSpace = 25;
        vFuelSpace = 42000;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 2000000;
        textures[] = {
            { "Cop", "cop", {
                "textures\cop\vehicle\marshall\cop_marshall.jpg",
                "textures\cop\vehicle\marshall\cop_marshall_back.jpg",
				"textures\cop\vehicle\marshall\nero_co.jpg"
            } }
        };
    };

    class B_Truck_01_fuel_F // HEMTT Fuel
	{
        vItemSpace = 25;
        vFuelSpace = 64000;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 350000;
        textures[] = {};
    };

	class O_Truck_03_fuel_F // Tempest Fuel
	{
        vItemSpace = 25;
        vFuelSpace = 85000;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 550000;
        textures[] = {};
    };

	class O_T_Truck_03_fuel_ghex_F // Tempest Fuel Ghex Skin
	{
        vItemSpace = 25;
        vFuelSpace = 85000;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 550000;
        textures[] = {};
    };

	class C_Offroad_02_unarmed_F {
		vItemSpace = 60;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 20000;
        textures[] = {
			{ "Schwarz", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa"
            } },
			{ "Blau", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa"
            } },
			{ "Grün", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa"
            } },
			{ "Orange", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_orange_co.paa"
            } },
			{ "Captian Morgan", "civ", {
                "textures\civ\vehicle\captain_offroad.paa"
            } },
			{ "Rot", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa"
            } }
		};
    };

    class I_C_Offroad_02_unarmed_F {
        vItemSpace = 100;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 20000;
        textures[] = {
			{ "Braun", "reb", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_brown_co.paa"
            } },
			{ "Oliv", "reb", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_olive_co.paa"
            } },
			{ "Weiß", "reb", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa"
            } }
		};
    };

	class C_Plane_civil_01_F {
        vItemSpace = 90;
        licenses[] = { {"pilot"}, {""}, {""}, {""} };
        price = 250000;
        textures[] = {
			{ "Rennen (Hellbrauner Innenraum)", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
            } },
            { "Rennen", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
            } },
            { "Rote Linie (Hellbrauner Innenraum)", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
            } },
            { "Rote Linie", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
            } },
            { "Stamm (Hellbrauner Innenraum)", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
            } },
            { "Stamm", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
            } },
            { "Blaue Welle (Hellbrauner Innenraum)", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
            } },
            { "Blaue Welle", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"}
			}
		};
    };

    class C_Plane_civil_01_racing_F {
        vItemSpace = 90;
        licenses[] = { {"pilot"}, {""}, {""}, {""} };
        price = 250000;
        textures[] = {
			{ "Rennen (Hellbrauner Innenraum)", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
            } },
            { "Rennen", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
            } },
            { "Rote Linie (Hellbrauner Innenraum)", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
            } },
            { "Rote Linie", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
            } },
            { "Stamm (Hellbrauner Innenraum)", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
            } },
            { "Stamm", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
            } },
            { "Blaue Welle (Hellbrauner Innenraum)", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
            } },
            { "Blaue Welle", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"}
			}
		};
	};
};
