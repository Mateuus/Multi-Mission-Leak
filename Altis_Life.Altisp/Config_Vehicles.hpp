class CarShops {
    /*
    *    ARRAY FORMAT:lester zlodziej
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
            { "C_Offroad_02_unarmed_F", { "", "", -1 } },
            { "C_SUV_01_F", { "", "", -1 } },
			{ "SUV_01_base_black_F", { "", "", -1 } },
            { "C_Hatchback_01_sport_F", { "", "", -1 } },
            { "C_Van_01_transport_F", { "", "", -1 } },
			{ "I_C_Van_01_transport_brown_F", { "", "", -1 } },
			{ "I_C_Van_01_transport_F", { "", "", -1 } },
		    { "I_C_Van_01_transport_olive_F", { "", "", -1 } },
			{ "C_IDAP_Van_02_transport_F", { "", "", -1 } }
        };
    };

    class sec_car {
        side = "civ";
        vehicles[] = {
			{ "C_SUV_01_F", { "", "", -1 } }
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
            { "C_Van_01_box_F", { "", "", -1 } }, //Truck Boxer
            { "I_Truck_02_transport_F", { "", "", -1 } }, //Zamak
            { "I_Truck_02_covered_F", { "", "", -1 } }, //Zamak (Zakryty)
            { "O_Truck_03_transport_F", { "", "", -1 } }, //Tempest
            { "O_Truck_03_covered_F", { "", "", -1 } }, //Tempest (Zakryty)
            { "O_Truck_03_device_F", { "", "", -1 } }, //Tempest (Urzadzenie)
            { "B_Truck_01_transport_F", { "", "", -1 } }, //HEMTT
            { "B_Truck_01_box_F", { "", "", -1 } }, //HEMTT Box
            { "B_Truck_01_covered_F", { "", "", -1 } }, //HEMTT Zakryty
            { "C_Van_01_fuel_F", { "", "", -1 } }, //Fuel Truck
            { "I_Truck_02_fuel_F", { "", "", -1 } }, //Zamak Fuel
            { "B_Truck_01_fuel_F", { "", "", -1 } } //HEMTT Fuel
        };
    };

    class civ_air {
        side = "civ";
        vehicles[] = {
            { "C_Heli_Light_01_civil_F", { "", "", -1 } }, //M-900
            { "B_Heli_Light_01_F", { "", "", -1 } }, //MH-9 Hummingbird (Stripped)
            { "I_Heli_Transport_02_F", { "", "", -1 } },
            { "C_Plane_Civil_01_F", { "", "", -1 } }
        };
    };

     class civ_ship {
        side = "civ";
        vehicles[] = {
            { "C_Rubberlicense_civ_boat", { "", "", -1 } },
            { "C_license_civ_boat_Civil_01_F", { "", "", -1 } },
            { "C_Boat_Civil_01_F", { "", "", -1 } },
            { "B_SDV_01_F", { "", "", -1 } },
			{ "C_Scooter_Transport_01_F", { "", "", -1 } },
			{ "C_Boat_Civil_01_rescue_F", { "", "", -1 } },
			{ "C_Rubberboat", { "", "", -1 } }
        };
    };

    class reb_car {
        side = "civ";
        vehicles[] = {
            { "B_Quadbike_01_F", { "", "", -1 } }, //Quad
            { "B_G_Offroad_01_F", { "", "", -1 } }, //Offroad
            { "B_G_Offroad_01_armed_F", { "", "", -1 } }, //Offroad (Armed)
			{ "B_T_LSV_01_unarmed_F", { "", "", -1 } },
			{ "B_Heli_Light_01_F", { "", "", -1 } },
            { "O_Heli_Light_02_unarmed_F", { "", "", -1 } }, //Orca
			{ "B_Heli_Transport_03_unarmed_F", { "", "", -1 } },
            { "O_MRAP_02_F", { "", "", -1 } }, //Ifrit
            { "B_MRAP_01_F", { "", "", -1 } }, //Hunter
            { "O_Heli_Transport_04_box_F", { "", "", -1 } }, //Taru Box
            { "O_Heli_Transport_04_F", { "", "", -1 } }, //Taru
            { "O_Heli_Transport_04_bench_F", { "", "", -1 } } //Taru Ławka

        };
    };

    class don_car {
        side = "civ";
		license = "don3";
        vehicles[] = {
			{ "B_Quadbike_01_F", { "", "", -1 } },
            { "C_Hatchback_01_F", { "", "", -1 } },
            { "C_Offroad_01_F", { "", "", -1 } },
            { "C_Offroad_02_unarmed_F", { "", "", -1 } },
            { "C_SUV_01_F", { "", "", -1 } },
			{ "SUV_01_base_black_F", { "", "", -1 } },
            { "C_Hatchback_01_sport_F", { "", "", -1 } },
            { "C_Van_01_transport_F", { "", "", -1 } },
            { "B_Quadbike_01_F", { "", "", -1 } }, //Quad
            { "B_G_Offroad_01_F", { "", "", -1 } }, //Offroad
            { "B_G_Offroad_01_armed_F", { "", "", -1 } }, //Offroad (Armed)
            { "B_T_LSV_01_unarmed_F", { "", "", -1 } },
            { "B_Heli_Light_01_F", { "", "", -1 } },
            { "O_Heli_Light_02_unarmed_F", { "", "", -1 } }, //Orca
            { "B_Heli_Transport_03_unarmed_F", { "", "", -1 } },
            { "O_MRAP_02_F", { "", "", -1 } }, //Ifrit
            { "B_MRAP_01_F", { "", "", -1 } }, //Hunter
            { "I_Heli_light_03_unarmed_F", { "", "", -1 } }, //Hunter
            { "O_Heli_Transport_04_box_F", { "", "", -1 } }, //Taru Box
            { "O_Heli_Transport_04_F", { "", "", -1 } }, //Taru
            { "O_Heli_Transport_04_bench_F", { "", "", -1 } }, //Taru Ławka
            { "C_Van_01_box_F", { "", "", -1 } }, //Truck Boxer
            { "I_Truck_02_transport_F", { "", "", -1 } }, //Zamak
            { "I_Truck_02_covered_F", { "", "", -1 } }, //Zamak (Zakryty)
            { "O_Truck_03_transport_F", { "", "", -1 } }, //Tempest
            { "O_Truck_03_covered_F", { "", "", -1 } }, //Tempest (Zakryty)
            { "O_Truck_03_device_F", { "", "", -1 } }, //Tempest (Urzadzenie)
            { "B_Truck_01_transport_F", { "", "", -1 } }, //HEMTT
            { "B_Truck_01_box_F", { "", "", -1 } }, //HEMTT Box
            { "B_Truck_01_covered_F", { "", "", -1 } }, //HEMTT Zakryty
            { "C_Van_01_fuel_F", { "", "", -1 } }, //Fuel Truck
            { "I_Truck_02_fuel_F", { "", "", -1 } }, //Zamak Fuel
            { "B_Truck_01_fuel_F", { "", "", -1 } }, //HEMTT Fuel
			{ "B_Heli_Transport_01_F", { "", "", -1 } }
        };
    };

    class med_shop {
        side = "med";
        vehicles[] = {
            { "C_Offroad_01_F", { "", "", -1 } },
            { "C_SUV_01_F", { "life_medicLevel", "SCALAR", 1 } },
			{ "C_Van_01_box_F", { "", "", -1 } },
            { "C_Hatchback_01_F", { "", "", -1 } },
			{ "C_IDAP_Van_02_medevac_F", { "", "", -1 } },
            { "I_Truck_02_medical_F", { "life_medicLevel", "SCALAR", 2 } }, //Zamak Medical
			{ "C_Truck_02_box_F", { "life_medicLevel", "SCALAR", 3 } },
			{ "I_MRAP_03_F", { "life_medicLevel", "SCALAR", 4 } },
			{ "C_Hatchback_01_sport_F", { "life_medicLevel", "SCALAR", 3 } }
            //{ "C_Hatchback_01_sport_F", { "life_medicLevel", "SCALAR", 3 } }
        };
    };

    class med_air_hs {
        side = "med";
        vehicles[] = {
            { "B_Heli_Light_01_F", { "life_medicLevel", "SCALAR", 1 } },
            { "O_Heli_Light_02_unarmed_F", { "life_medicLevel", "SCALAR", 2 } },
			{ "I_Heli_light_03_unarmed_F", { "life_medicLevel", "SCALAR", 3 } },
            { "O_Heli_Transport_04_medevac_F", { "life_medicLevel", "SCALAR", 3 } },
			{ "I_Heli_Transport_02_F", { "life_medicLevel", "SCALAR", 4 } }
        };
    };

    class cop_car {
        side = "cop";
        vehicles[] = {
            { "C_Offroad_01_F", { "", "", -1 } },
            { "C_Offroad_02_unarmed_F", { "", "", -1 } },
            { "C_SUV_01_F", { "", "", -1 } },
            { "C_Hatchback_01_sport_F", { "life_coplevel", "SCALAR", 2 } },
            { "O_T_LSV_02_unarmed_black_F", { "life_coplevel", "SCALAR", 4 } },
            { "B_MRAP_01_F", { "life_coplevel", "SCALAR", 5 } }, //Hunter
            { "B_MRAP_01_hmg_F", { "life_coplevel", "SCALAR", 10 } }, //Hunter
            { "I_MRAP_03_F", { "life_coplevel", "SCALAR", 6 } }, //Strider
            { "B_T_LSV_01_armed_F", { "life_coplevel", "SCALAR", 7 } }, //Prowler Uzbrojony
            { "O_LSV_02_armed_black_F", { "life_coplevel", "SCALAR", 8 } }

        };
    };

    class boa_car {
        side = "cop";
        vehicles[] = {
            { "C_Offroad_01_F", { "", "", -1 } },
            { "C_Offroad_02_unarmed_F", { "", "", -1 } },
            { "C_SUV_01_F", { "", "", -1 } },
            { "C_Hatchback_01_sport_F", { "life_coplevel", "SCALAR", 3 } },
            { "O_T_LSV_02_unarmed_black_F", { "life_coplevel", "SCALAR", 4 } },
            { "B_MRAP_01_F", { "life_coplevel", "SCALAR", 5 } }, //Hunter
            { "I_MRAP_03_F", { "life_coplevel", "SCALAR", 6 } }, //Strider
            { "B_T_LSV_01_armed_F", { "life_coplevel", "SCALAR", 7 } } //Prowler Uzbrojony

        };
    };

    class boa_air {
        side = "cop";
        vehicles[] = {
            { "B_Heli_Light_01_F", { "life_coplevel", "SCALAR", 1 } }, //Humming
            { "O_Heli_Light_02_unarmed_F", { "life_coplevel", "SCALAR", 3 } }, //Orca
            { "B_Heli_Transport_01_F", { "life_coplevel", "SCALAR", 5 } }, //GhostHawk
            { "I_Heli_light_03_unarmed_F", { "life_coplevel", "SCALAR", 4 } }, //Hellcat
			{ "I_Heli_Transport_02_F", { "life_coplevel", "SCALAR", 4 } }
        };
    };

    class cop_air {
        side = "cop";
        vehicles[] = {
            { "B_Heli_Light_01_F", { "life_coplevel", "SCALAR", 1 } }, //Humming
            { "O_Heli_Light_02_unarmed_F", { "life_coplevel", "SCALAR", 3 } }, //Orca
            { "B_Heli_Transport_01_F", { "life_coplevel", "SCALAR", 9 } }, //GhostHawk
            { "I_Heli_light_03_unarmed_F", { "life_coplevel", "SCALAR", 4 } }, //Hellcat
			{ "I_Heli_Transport_02_F", { "life_coplevel", "SCALAR", 4 } },
			{ "B_Heli_Transport_03_unarmed_F", { "life_coplevel", "SCALAR", 7 } },
			{ "B_T_VTOL_01_vehicle_F", { "life_coplevel", "SCALAR", 11 } }
        };
    };

    class cop_ship {
        side = "cop";
        vehicles[] = {
            { "B_license_civ_boat_Transport_01_F", { "", "", -1 } },
            { "C_license_civ_boat_Civil_01_police_F", { "", "", -1 } },
            { "B_license_civ_boat_Armed_01_minigun_F", { "life_coplevel", "SCALAR", 5 } },
            { "C_Boat_Civil_01_police_F", { "life_coplevel", "SCALAR", 1 } },
            { "B_SDV_01_F", { "", "", -1 } }
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
    *         Ex: { "license_civ_driver", "" , "" , "" } //civilian, west, independent, east
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
	
	 class B_T_VTOL_01_vehicle_F {
        vItemSpace = 200;
        licenses[] = { {""}, {"license_cop_cAir"}, {""}, {""} };
        price = 1000;
        textures[] = {};
    };
	
	class C_Scooter_Transport_01_F {
        vItemSpace = 50;
        licenses[] = { {"license_civ_boat"}, {""}, {""}, {""} };
        price = 8000;
		assurPrice = 2000;
        textures[] = {};
    };

    class I_Truck_02_medical_F {
        vItemSpace = 150;
        licenses[] = { {""}, {""}, {"license_med_driverM"}, {""} };
        price = 25000;
        textures[] = {};
    };

	class SUV_01_base_black_F {
        vItemSpace = 50;
        licenses[] = { {"license_civ_driver"}, {"license_cop_driverC"}, {"license_med_driverM"}, {""} };
        price = 15000;
        textures[] = {};
    };

    class O_Truck_03_medical_F {
        vItemSpace = 200;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 20000;
        textures[] = {};
    };

	class B_Truck_01_ammo_F {
        vItemSpace = 500;
        licenses[] = { {""}, {"license_cop_driverC"}, {""}, {""} };
        price = 45000;
        textures[] = {};
    };

    class B_Truck_01_medical_F {
        vItemSpace = 250;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 60000;
        textures[] = {};
    };

    class C_Rubberlicense_civ_boat {
        vItemSpace = 40;
        licenses[] = { {"license_civ_boat"}, {""}, {""}, {""} };
        price = 10000;
        textures[] = { };
    };
	class C_Boat_Civil_01_F {
        vItemSpace = 120;
        licenses[] = { {"license_civ_boat"}, {""}, {""}, {""} };
        price = 30000;
        textures[] = { };
    };
	
	class C_Boat_Civil_01_rescue_F {
        vItemSpace = 120;
        licenses[] = { {"license_civ_boat"}, {""}, {""}, {""} };
        price = 30000;
        textures[] = { };
    };
	
	class C_Rubberboat {
        vItemSpace = 90;
        licenses[] = { {"license_civ_boat"}, {""}, {""}, {""} };
        price = 20000;
        textures[] = { };
    };

    class B_MRAP_01_hmg_F {
        vItemSpace = 65;
        licenses[] = { {""}, {"license_cop_driverC"}, {""}, {""} };
        price = 9500000;
        textures[] = {
            { "Policja", "cop", {
                "textures\Policja\cop_hunter1.paa",
                "textures\Policja\cop_hunter2.paa"
            } }
        };
    };

    class B_license_civ_boat_Armed_01_minigun_F {
        vItemSpace = 100;
        licenses[] = { {""}, {"license_cop_cg"}, {""}, {""} };
        price = 1000000;
        textures[] = { };
    };

    class B_license_civ_boat_Transport_01_F {
        vItemSpace = 40;
        licenses[] = { {""}, {"license_cop_cg"}, {""}, {""} };
        price = 10000;
        textures[] = { };
    };

    class O_Truck_03_transport_F {
        vItemSpace = 500;
        licenses[] = { {"license_civ_trucking","license_civ_don1","license_civ_don2","license_civ_don3","license_civ_don4"}, {""}, {""}, {""} };
        price = 1000000;
        textures[] = { };
    };

    class O_Truck_03_device_F {
        vItemSpace = 200;
        licenses[] = { {"license_civ_trucking","license_civ_don1","license_civ_don2","license_civ_don3","license_civ_don4"}, {""}, {""}, {""} };
        price = 5000000;
        textures[] = { };
    };

    class Land_CargoBox_V1_F {
        vItemSpace = 5000;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = -1;
        textures[] = {};
    };

    class Box_IND_Grenades_F {
        vItemSpace = 350;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = -1;
        textures[] = {};
    };

    class B_supplyCrate_F {
        vItemSpace = 700;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = -1;
        textures[] = {};
    };

    class B_G_Offroad_01_F {
        vItemSpace = 65;
        licenses[] = { {"license_civ_adv_rebel","license_civ_don1","license_civ_don2","license_civ_don3","license_civ_don4","license_civ_zolnierz"}, {""}, {""}, {""} };
        price = 12500;
        textures[] = { };
    };

    class B_G_Offroad_01_armed_F {
        vItemSpace = 65;
        licenses[] = { {"license_civ_adv_rebel","license_civ_don1","license_civ_don2","license_civ_don3","license_civ_don4","license_civ_zolnierz"}, {""}, {""}, {""} };
        price = 2800000;
        textures[] = { };
    };

    class C_license_civ_boat_Civil_01_F {
        vItemSpace = 200;
        licenses[] = { {"license_civ_boat"}, {""}, {""}, {""} };
        price = 100000;
        textures[] = { };
    };

    class C_license_civ_boat_Civil_01_police_F {
        vItemSpace = 200;
        licenses[] = { {""}, {"license_cop_cg"}, {""}, {""} };
        price = 20000;
        textures[] = { };
    };

    class B_Truck_01_box_F {
        vItemSpace = 900;
        licenses[] = { {"license_civ_trucking","license_civ_don1","license_civ_don2","license_civ_don3","license_civ_don4"}, {""}, {""}, {""} };
        price = 4000000;
        textures[] = {
            { "Diabeł", "civ", {
                "textures\Cywile\civ_hemtt_devil_0.paa",
                "textures\Cywile\civ_hemtt_devil_1.paa"
            } }
        };
    };

    class B_Truck_01_transport_F {
        vItemSpace = 700;
        licenses[] = { {"license_civ_trucking","license_civ_don1","license_civ_don2","license_civ_don3","license_civ_don4"}, {""}, {""}, {""} };
        price = 2500000;
        textures[] = {
            { "Diabeł", "civ", {
                "textures\Cywile\civ_hemtt_devil_0.paa",
                "textures\Cywile\civ_hemtt_devil_1.paa"
            } }
        };
    };

    class B_Truck_01_covered_F {
        vItemSpace = 800;
        licenses[] = { {"license_civ_trucking","license_civ_don1","license_civ_don2","license_civ_don3","license_civ_don4"}, {""}, {""}, {""} };
        price = 3500000;
        textures[] = {
            { "Diabeł", "civ", {
                "textures\Cywile\civ_hemtt_devil_0.paa",
                "textures\Cywile\civ_hemtt_devil_1.paa"
            } }
        };
    };

    class O_MRAP_02_F {
        vItemSpace = 50;
        licenses[] = { {"license_civ_adv_rebel","license_civ_don1","license_civ_don2","license_civ_don3","license_civ_don4"}, {""}, {""}, {""} };
        price = 6000000;
        textures[] = {
            { "Czerwony", "civ", {
                "textures\Cywile\ifrit_r1.paa",
                "textures\Cywile\ifrit_r2.paa"
            } }
		};
    };

    class B_T_LSV_01_unarmed_F {
        vItemSpace = 50;
        licenses[] = { {"license_civ_adv_rebel","license_civ_don1","license_civ_don2","license_civ_don3","license_civ_don4",,"license_civ_zolnierz"}, {""}, {""}, {""} };
        price = 2000000;
        textures[] = { };
    };

    class O_T_LSV_02_unarmed_black_F {
        vItemSpace = 50;
        licenses[] = { {""}, {"license_cop_driverC"}, {""}, {""} };
        price = 1000000;
        textures[] = {
            { "Policja", "cop", {
                "textures\Policja\ALN_prowler.paa"
				} }
        };
    };

    class C_Offroad_01_F {
        vItemSpace = 80;
        licenses[] = { {"license_civ_driver"}, {"license_cop_driverC"}, {"license_med_driverM"}, {""} };
        price = 20000;
        textures[] = {
            { "Czerwony", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"
            } },
            { "Żółty", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa"
            } },
            { "Biały", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa"
            } },
            { "Niebieski", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa"
            } },
            { "Bordowy", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa"
            } },
            { "Granatowy", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa"
            } },
            { "Dodge", "civ", {
                "textures\Cywile\offroad_dodge.paa"
            } },
            { "Weed", "civ", {
                "textures\Cywile\weed.offroad.paa"
            } },
            { "Panda", "civ", {
                "textures\Cywile\offroad_rl.jpg"
            } },
            { "Policja", "cop", {
                "textures\Policja\cop_offroad.paa"
            } },
			
            { "Medyczny", "med", {
                "textures\Medycy\offroad_Medyk.paa"
            } },
            { "Mechanik", "med", {
                "textures\Medycy\offroad_mechanik.paa"
            } }
        };
    };

    class C_Offroad_02_unarmed_F {
        vItemSpace = 80;
        licenses[] = { {"license_civ_driver"}, {"license_cop_driverC"}, {"license_med_driverM"}, {""} };
        price = 20000;
        textures[] = {
			{ "Policja", "cop", {
                "textures\Policja\ALN_black.paa"
            } },
            { "Niebieski", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_blue_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_blue_co.paa"
            } },
            { "Brazowy", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_brown_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_brown_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_brown_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_brown_co.paa"
            } },
            { "Zielony", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_green_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_green_co.paa"
            } },
            { "Pomarańczowy", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_orange_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_orange_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_orange_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_orange_co.paa"
            } },
            { "Czerwony", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_red_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_red_co.paa"
            } },
			{ "Biały", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_white_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_white_co.paa"
            } },
			{ "Olive", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_olive_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_olive_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa"
            } },
            { "Medyczny", "med", {
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_red_co.paa",
				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_red_co.paa"
            } }
        };
    };

    class C_Kart_01_Blu_F {
        vItemSpace = 20;
        licenses[] = { {"license_civ_driver"}, {"license_cop_driverC"}, {"license_med_driverM"}, {""} };
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

    class C_Hatchback_01_sport_F {
        vItemSpace = 45;
        licenses[] = { {"license_civ_driver"}, {"license_cop_driverC"}, {"license_med_driverM"}, {""} };
        price = 20000;
        textures[] = {
            { "Czerwony", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"
            } },
            { "Granatowy", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"
            } },
            { "Pomarańczowy", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport03_co.paa"
            } },
            { "Biały", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa"
            } },
            { "Beżowy", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport05_co.paa"
            } },
            { "Zielony", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport06_co.paa"
            } },
            { "Czarny Pasy", "civ", {
                "textures\Cywile\Czarny Pasy.paa"
            } },
            { "Polo", "civ", {
                "textures\Cywile\Polo.paa"
            } },
            { "Policja", "cop", {
                "textures\Policja\cop_hatchbacksport.paa"
            } },
            { "Medyczny", "med", {
               "textures\Medycy\medic_hatchback.paa"
            } }
        };
    };

    class B_Quadbike_01_F {
        vItemSpace = 25;
        licenses[] = { {"license_civ_driver"}, {"license_cop_driverC"}, {"license_med_driverM"}, {""} };
        price = 2500;
        textures[] = {
            { "Brazowy", "civ", {
                "\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa"
            } },
            { "Digi Pustynny", "reb", {
                "\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa"
            } },
            { "Czarny", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa"
            } },
            { "Niebieski", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa"
            } },
            { "Czerwony", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa"
            } },
            { "Policja", "cop", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa"
            } },
            { "Digi Zielony", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa"
            } },
            { "Myśliwskie camo", "civ", {
                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
            } },
            { "license_civ_rebel Camo", "reb", {
                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
            } }
        };
    };

    class I_Truck_02_covered_F {
        vItemSpace = 400;
        licenses[] = { {"license_civ_trucking","license_civ_don1","license_civ_don2","license_civ_don3","license_civ_don4"}, {""}, {""}, {""} };
        price = 500000;
        textures[] = {
            { "Pomarańczowy", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            } }
        };
    };

    class I_Truck_02_transport_F {
        vItemSpace = 300;
        licenses[] = { {"license_civ_trucking","license_civ_don1","license_civ_don2","license_civ_don3","license_civ_don4"}, {""}, {""}, {""} };
        price = 300000;
        textures[] = {
            { "Pomarańczowy", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            } }
        };
    };

    class O_Truck_03_covered_F {
        vItemSpace = 600;
        licenses[] = { {"license_civ_trucking","license_civ_don1","license_civ_don2","license_civ_don3","license_civ_don4"}, {""}, {""}, {""} };
        price = 2000000;
        textures[] = {};
    };

    class O_Heli_Transport_04_box_F {
        vItemSpace = 600;
        licenses[] = { {"license_civ_adv_rebel","license_civ_don1","license_civ_don2","license_civ_don3","license_civ_don4","license_civ_zolnierz"}, {""}, {""}, {""} };
        price = 3900000;
        textures[] = {};
    };

    class O_Heli_Transport_04_F {
        vItemSpace = 100;
        licenses[] = { {"license_civ_adv_rebel","license_civ_don1","license_civ_don2","license_civ_don3","license_civ_don4","license_civ_zolnierz"}, {""}, {""}, {""} };
        price = 1800000;
        textures[] = {};
    };

    class O_Heli_Transport_04_bench_F {
        vItemSpace = 150;
        licenses[] = { {"license_civ_adv_rebel","license_civ_don1","license_civ_don2","license_civ_don3","license_civ_don4","license_civ_zolnierz"}, {""}, {""}, {""} };
        price = 2600000;
        textures[] = {};
    };

	class B_Heli_Light_01_dynamicLoadout_F {
        vItemSpace = 50;
        licenses[] = { {"license_civ_don1","license_civ_don2","license_civ_don3","license_civ_don4"}, {""}, {""}, {""} };
        price = 23000000;
        textures[] = {};
    };
	
    class C_Hatchback_01_F {
        vItemSpace = 40;
        licenses[] = { {"license_civ_driver"}, {"license_cop_driverC"}, {"license_med_driverM"}, {""} };
        price = 9500;
        textures[] = {
            { "Beżowy", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa"
            } },
            { "Zielony", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa"
            } },
            { "Niebieski", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa"
            } },
            { "Granatowy", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa"
            } },
            { "Żółty", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa"
            } },
            { "Biały", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa"
            } },
            { "Szary", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa"
            } },
            { "Czarny", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa"
            } },
            { "Medyczny", "med", {
                "textures\Medycy\medic_hatchback.paa"
            } }
        };
    };

	class C_IDAP_Van_02_medevac_F {
        vItemSpace = 150;
        licenses[] = { {""}, {""}, {"license_med_driverM"}, {""} };
        price = 5000;
        textures[] = {};
    }; 
	
	class C_IDAP_Van_02_transport_F {
        vItemSpace = 150;
        licenses[] = { {"license_civ_driver"}, {""}, {""}, {""} };
        price = 85000;
        textures[] = {};
    }; 
	
    class C_SUV_01_F {
        vItemSpace = 50;
        licenses[] = { {"license_civ_driver"}, {"license_cop_driverC"}, {"license_med_driverM"}, {""} };
        price = 25000;
        textures[] = {
			{ "Taxi", "civ", {
                "textures\Cywile\suv_taxi.paa"
            } },
            { "Bordowy", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"
            } },
            { "Srebrny", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"
            } },
            { "Pomarańczowy", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"
            } },
            { "Sticker", "civ", {
                "textures\Cywile\suv_sticker.paa"
            } },
			{ "Ferrari", "civ", {
                "textures\Cywile\suv_ferrari.paa"
            } },
            { "Batman", "civ", {
                "textures\Cywile\batman.suv.paa"
            } },
            { "Buhu", "civ", {
                "textures\Cywile\buhu.suv.paa"
            } },
            { "jurassicpark", "civ", {
                "textures\Cywile\jurassicpark_suv.paa"
            } },
            { "Cwaniak", "civ", {
                "textures\Cywile\klA.suv.paa"
            } },
            { "Policja", "cop", {
                "textures\Policja\cop_suv.paa"
            } },
			{ "special", "cop", {
                "textures\Policja\suvbope.paa"
            } },
			{ "ochrona", "sec", {
                "textures\Cywile\ochrona.paa"
            } },
						
			{ "Medyczny", "med", {
               "textures\Medycy\medic_suv.paa"
            } }
        };
    };

    class C_Van_01_transport_F {
        vItemSpace = 150;
        licenses[] = { {"license_civ_driver"}, {"license_cop_driverC"}, {"license_med_driverM"}, {""} };
        price = 50000;
        textures[] = {
            { "Biały", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
            { "Czerwony", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } }
        };
    };
	
	class I_C_Van_01_transport_brown_F {
        vItemSpace = 150;
        licenses[] = { {"license_civ_driver"}, {"license_cop_driverC"}, {"license_med_driverM"}, {""} };
        price = 50000;
        textures[] = {};
    }; 
	
	class I_C_Van_01_transport_F {
        vItemSpace = 150;
        licenses[] = { {"license_civ_driver"}, {"license_cop_driverC"}, {"license_med_driverM"}, {""} };
        price = 50000;
        textures[] = {};
    };
	
    class I_C_Van_01_transport_olive_F {
        vItemSpace = 150;
        licenses[] = { {"license_civ_driver"}, {"license_cop_driverC"}, {"license_med_driverM"}, {""} };
        price = 50000;
        textures[] = {};
    };
		
    class C_Van_01_box_F {
        vItemSpace = 250;
        licenses[] = { {"license_civ_trucking","license_civ_don1","license_civ_don2","license_civ_don3","license_civ_don4"}, {""}, {"license_med_driverM"}, {""} };
        price = 200000;
        textures[] = {
            { "Biały", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
            { "Czerwony", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } },
            { "Medyczny", "med", {
                "textures\Medycy\rd_van.paa",
                "textures\Medycy\rd_van_adds.paa"
            } }
        };
    };

    class B_MRAP_01_F {
        vItemSpace = 50;
        licenses[] = { {"license_civ_zolnierz","license_civ_don1","license_civ_don2","license_civ_don3","license_civ_don4"}, {"license_cop_driverC","license_cop_boa"}, {""}, {""} };
        price = 6500000;
        textures[] = {
            { "Rebel", "civ", {
                "textures\Cywile\civ_hunter1.paa",
                "textures\Cywile\civ_hunter2.paa"
            } },
            { "Policyjny", "cop", {
                "textures\Policja\cop_hunter1.paa",
                "textures\Policja\cop_hunter2.paa"
            } },
			{ "Policyjny", "cop", {
                "textures\Policja\ALN_police_hunter01.paa",
                "textures\Policja\ALN_police_hunter02.paa"
            } },
			{ "ADmina", "heda", {
                "textures\hunter.paa",
                "textures\hunter1.paa"
            } }
        };
    };
		

    class B_Heli_Light_01_F {
        vItemSpace = 80;
        licenses[] = { {"license_civ_pilot","license_civ_reb_adv_rebel","license_civ_don1","license_civ_don2","license_civ_don3","license_civ_rebel","license_civ_don4","license_civ_zolnierz"}, {"license_cop_cAir"}, {"license_med_mAir"}, {""} };
        price = 500000;
        textures[] = {
            { "Policja", "cop", {
                "textures\Policja\LB_Police.paa"
            } },
            { "Sheriff", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa"
            } },
            { "Niebieski", "civ", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"
            } },
            { "Czerwony", "civ", {
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
            { "Rebeliancki", "reb", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
            } },
            { "Digi Green", "reb", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa"
            } },
            { "Medyczny", "med", {
               "textures\Medycy\LB_Med.paa"
            } }
        };
    };

    class B_Heli_Transport_01_F {
        vItemSpace = 150;
        licenses[] = { {"license_civ_don4"}, {"license_cop_cAir"}, {"license_cop_boa"}, {""} };
        price = 24000000;
        textures[] = {
			{ "Zielony", "civ", {
                "textures\cYWILE\ghosthawk_0_v1.paa",
				"textures\cYWILE\ghosthawk_1_v1.paa"
            } },
            { "Policja", "cop", {
                "textures\Policja\ghosthawk_01.paa",
                "textures\Policja\ghosthawk_02.paa"
            } }
        };
    };

    class B_T_VTOL_01_infantry_F {
        vItemSpace = 50;
        licenses[] = { {""}, {"license_cop_cAir"}, {""}, {""} };
        price = 2000000;
        textures[] = {
            { "Policja", "cop", {
                "\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT01_blue_CO.paa",
				"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT02_blue_CO.paa",
				"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT03_blue_CO.paa",
				"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT04_blue_CO.paa"
            } }
		};
    };

    class B_Heli_Light_01_armed_F {
        vItemSpace = 50;
        licenses[] = { {""}, {"license_cop_cAir"}, {""}, {""} };
        price = 2000000;
        textures[] = {
            { "Polcja", "cop", {
                "textures\Policja\cop_hummingbird.paa"
            } }
		};
    };

    class O_Heli_Transport_04_medevac_F {
        vItemSpace = 50;
        licenses[] = { {""}, {""}, {"license_med_mAir"}, {""} };
        price = 300000;
        textures[] = {};
    };

    class I_Heli_Transport_02_F {
        vItemSpace = 500;
        licenses[] = { {"license_civ_pilot","license_civ_reb_adv_rebel","license_civ_don1","license_civ_don2","license_civ_don3","license_civ_rebel","license_civ_don4","license_civ_zolnierz"}, {"license_cop_cAir"}, {"license_med_mAir"}, {""} };
        price = 2000000;
        textures[] = {
			{ "Ion", "civ", {
				"A3\Air_F_Beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_ion_co.paa",
				"A3\Air_F_Beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_ion_co.paa",
				"A3\Air_F_Beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_ion_co.paa"
			} },
			{ "Dahoman", "civ", {
				"A3\Air_F_Beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_dahoman_co.paa",
				"A3\Air_F_Beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_dahoman_co.paa",
				"A3\Air_F_Beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_dahoman_co.paa"
			} },
			{ "Policyjny", "cop", {
				"#(ai,64,64,1)Fresnel(1.3,7)",
				"#(argb,8,8,3)color(1,1,1,0.8)",
				"#(ai,64,64,1)Fresnel(1.3,7)"
			} },
			{ "Medyczny", "med", {
				"textures\Medycy\seaking1_co.paa",
				"textures\Medycy\seaking2_co.paa",
				"textures\Medycy\seaking3_co.paa"
			} }
		};
    };

    class C_Plane_Civil_01_F {
        vItemSpace = 50;
        licenses[] = { {"license_civ_pilot"}, {""}, {""}, {""} };
        price = 500000;
        textures[] = {
            { "Racing (Tan Interior)", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
            } },
			{ "Racing", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
            } },
			{ "Red Line", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
            } },
			{ "Tribal (Tan Interior)", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
            } },
			{ "Tribal", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
            } },
			{ "Blue Wave (Tan Interior)", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
            } },
			{ "Blue Wave", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa","A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
            } }
		};
    };

    class B_Heli_Transport_03_unarmed_F {
        vItemSpace = 700;
        licenses[] = { {"license_civ_rebel","license_civ_don1","license_civ_don2","license_civ_don3","license_civ_don4","license_civ_zolnierz"}, {"license_cop_cAir"}, {""}, {""} };
        price = 9500000;
        textures[] = {
            { "Zielony", "civ", {
                "\a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext01_co.paa","\a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext02_co.paa"
            } },
			{ "Policja", "cop", {
                "textures\Policja\huron1.paa",
				"textures\Policja\huron2.paa"
            } }
		};
    };

    class C_Heli_Light_01_civil_F : B_Heli_Light_01_F {
        vItemSpace = 50;
        price = 400000;
    };

    class O_Heli_Light_02_unarmed_F {
        vItemSpace = 250;
        licenses[] = { {"license_civ_rebel","license_civ_don1","license_civ_don2","license_civ_don3","license_civ_don4","license_civ_zolnierz"}, {"license_cop_cAir"}, {"license_med_mAir"}, {""} };
        price = 900000;
        textures[] = {
            { "Rebeliancka", "civ", {
                "textures\Cywile\rebel_orca.paa"
            } },
			{ "Policyjna", "cop", {
                "textures\Policja\cop_orca.paa"
            } },
            { "Medyczna", "med", {
                "textures\Medycy\orca_Medyk.paa"
            } }
		};
    };

    class B_SDV_01_F {
        vItemSpace = 50;
        licenses[] = { {"license_civ_boat"}, {"license_cop_cg"}, {""}, {""} };
        price = 500000;
        textures[] = {};
    };
	
	 class C_Truck_02_box_F {
        vItemSpace = 150;
        licenses[] = { {"license_civ_driver"}, {"license_cop_driverC"}, {"license_med_driverM"}, {""} };
        price = 25000;
        textures[] = {};
	};

    class I_MRAP_03_F {
        vItemSpace = 150;
        licenses[] = { {""}, {"license_cop_driverC","license_cop_boa"}, {"license_med_driverM"}, {""} };
        price = 6750000;
        textures[] = {
            { "Medyczny", "med", {
                "textures\Medycy\medic_strider.paa"
            } },
            { "Policja", "cop", {
                "textures\Policja\cop_strider.paa"
            } }
		};
    };

    class I_Heli_light_03_unarmed_F {
        vItemSpace = 350;
        licenses[] = { {"license_civ_don4"}, {"license_cop_cAir"}, {"license_med_mAir"}, {""} };
        price = 22000000;
        textures[] = {
            { "Medyczny", "med", {
                "textures\Medycy\medic_hellcat.paa"
            } },
            { "Policja", "cop", {
                "textures\Policja\cop_hellcat.paa"
            } },
			{ "Rebel", "civ", {
                "textures\donator_hellcat.paa"
            } }
		};
    };

        class C_Van_01_fuel_F {
        vItemSpace = 20;
        vFuelSpace = 10000;
        licenses[] = { {"license_civ_trucking","license_civ_don1","license_civ_don2","license_civ_don3","license_civ_don4"}, {""}, {""}, {""} };
        price = 100000;
        textures[] = {
            { "Biały", "civ", {
                "\A3\soft_f_gamma\Van_01\data\van_01_ext_co.paa",
                "\A3\soft_f_gamma\Van_01\data\van_01_tank_co.paa"
            } },
            { "Czerwony", "civ", {
                "\A3\soft_f_gamma\Van_01\data\van_01_ext_red_co.paa",
                "\A3\soft_f_gamma\Van_01\data\van_01_tank_red_co.paa"
            } }
        };
    };

    class I_Truck_02_fuel_F {
        vItemSpace = 40;
        vFuelSpace = 30000;
        licenses[] = { {"license_civ_trucking","license_civ_don1","license_civ_don2","license_civ_don3","license_civ_don4"}, {""}, {""}, {""} };
        price = 200000;
        textures[] = {
            { "Biały", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_fuel_co.paa"
            } }
        };
    };

    class B_Truck_01_fuel_F {
        vItemSpace = 50;
        vFuelSpace = 60000;
        licenses[] = { {"license_civ_trucking","license_civ_don1","license_civ_don2","license_civ_don3","license_civ_don4"}, {""}, {""}, {""} };
        price = 300000;
        textures[] = {
            { "Diabeł", "civ", {
                "textures\Cywile\civ_hemtt_devil_0.paa",
                "textures\Cywile\civ_hemtt_devil_1.paa"
            } }
        };
    };
	class C_Boat_Civil_01_police_F {
        vItemSpace = 50;
        licenses[] = { {""}, {"license_cop_cg"}, {""}, {""} };
        price = 80000;
        textures[] = {};
    };
	class B_T_LSV_01_armed_F {
        vItemSpace = 50;
        licenses[] = { {""}, {"license_cop_driverC"}, {""}, {""} };
        price = 5000000;
        textures[] = {};
    };
	class O_LSV_02_armed_black_F {
        vItemSpace = 50;
        licenses[] = { {""}, {"license_cop_driverC"}, {""}, {""} };
        price = 5000000;
        textures[] = {};
    };
};
