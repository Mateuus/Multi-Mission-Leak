class CarShops {
    /*
    *    ARRAY FORMAT:
    *        0: STRING (Classname)
    *        1: SCALAR (Rental Price)
    *        2: ARRAY (license required)
    *            Ex: { "driver", "trucking", "rebel" }
    *        3: ARRAY (This is for limiting items to certain things)
    *            0: Variable to read from
    *            1: Variable Value Type (SCALAR / BOOL /EQUAL)
    *            2: What to compare to (-1 = Check Disabled)
    *
    *   BLUFOR Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_WEST
    *   OPFOR Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_EAST
    *   Independent Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_GUER
    *   Civilian Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_CIV
    */

    class kart_shop {
        side = "civ";
        vehicles[] = {
            { "C_Kart_01_Blu_F", 15000 , { "driver" }, { "", "", -1 } },
            { "C_Kart_01_Fuel_F", 15000, { "driver" }, { "", "", -1 } },
            { "C_Kart_01_Red_F", 15000, { "driver" }, { "", "", -1 } },
            { "C_Kart_01_Vrana_F", 15000, { "driver" }, { "", "", -1 } }
        };
    };
	
    class civ_car {
        side = "civ";
        vehicles[] = {
            { "B_Quadbike_01_F", 2750, { "" }, { "", "", -1 } },
            { "C_Hatchback_01_F", 7500, { "driver" }, { "", "", -1 } },
            { "C_Offroad_01_F", 12500, { "driver" }, { "", "", -1 } },
            { "C_SUV_01_F", 30000, { "driver" }, { "", "", -1 } },
            { "C_Van_01_transport_F", 60000, { "driver" }, { "", "", -1 } },
            { "C_Hatchback_01_sport_F", 100000, { "driver" }, { "", "", -1 } }
        };
    };

    class civ_truck {
        side = "civ";
        vehicles[] = {
            { "C_Van_01_fuel_F", 65000, { "truck" }, { "", "", -1 } },
            { "C_Van_01_box_F", 75000, { "truck" }, { "", "", -1 } },
            { "I_Truck_02_transport_F", 175000, { "truck" }, { "", "", -1 } },
            { "I_Truck_02_covered_F", 250000, { "truck" }, { "", "", -1 } },
            { "I_Truck_02_fuel_F", 275000, { "truck" }, { "", "", -1 } },
            { "O_Truck_03_transport_F", 550000, { "truck" }, { "", "", -1 } },
            { "O_Truck_03_covered_F", 650000, { "truck" }, { "", "", -1 } },
            { "O_Truck_03_fuel_F", 675000, { "truck" }, { "", "", -1 } },
            { "B_Truck_01_transport_F", 650000, { "truck" }, { "", "", -1 } },
            { "B_Truck_01_covered_F", 850000, { "truck" }, { "", "", -1 } },
            { "B_Truck_01_fuel_F", 1050000, { "truck" }, { "", "", -1 } },
            { "O_Truck_03_device_F", 1300000, { "truck" }, { "", "", -1 } },
            { "B_Truck_01_box_F", 1500000, { "truck" }, { "", "", -1 } }
        };
    };
	
    class don_silber {
        side = "civ";
        vehicles[] = {
            { "C_SUV_01_F", 30000, { "" }, { "life_donatorlvl", "SCALAR", 1 } }
        };
    };
	
    class don_gold {
        side = "civ";
        vehicles[] = {
            { "C_SUV_01_F", 30000, { "" }, { "life_donatorlvl", "SCALAR", 2 } },
            { "B_Heli_Light_01_F", 425000, { "" }, { "life_donatorlvl", "SCALAR", 2 } },
            { "B_Heli_Transport_03_unarmed_F", 2800000, { "" }, { "life_donatorlvl", "SCALAR", 2 } }
        };
    };
	
    class don_platin {
        side = "civ";
        vehicles[] = {
            { "B_MRAP_01_F", 3000000, { "" }, { "life_donatorlvl", "SCALAR", 3 } },
            { "O_MRAP_02_F", 3000000, { "" }, { "life_donatorlvl", "SCALAR", 3 } },
            { "I_MRAP_03_F", 3000000, { "" }, { "life_donatorlvl", "SCALAR", 3 } },
            { "B_Heli_Transport_03_unarmed_F", 2800000, { "" }, { "life_donatorlvl", "SCALAR", 3 } }
        };
    };

    class med_shop {
        side = "med";
        vehicles[] = {
            { "B_Quadbike_01_F", 1000, { "" }, { "", "", -1 } },
            { "C_Offroad_01_repair_F", 5000, { "" }, { "life_mediclevel", "SCALAR", 2 } },
            { "C_SUV_01_F", 5000, { "" }, { "life_mediclevel", "SCALAR", 3 } },
            { "B_Truck_01_mover_F", 40000, { "" }, { "life_mediclevel", "SCALAR", 3 } }
        };
    };

    class med_air {
        side = "med";
        vehicles[] = {
            { "B_Heli_Light_01_F", 15000, { "" }, { "life_mediclevel", "SCALAR", 4 } },
            { "O_Heli_Transport_04_F", 60000, { "" }, { "life_mediclevel", "SCALAR", 4 } },
            { "I_Heli_Transport_02_F", 50000, { "" }, { "life_mediclevel", "SCALAR", 6 } }
        };
    };

    class reb_car {
        side = "civ";
        vehicles[] = {
            { "B_Quadbike_01_F", 2750, { "" }, { "", "", -1 } },
            { "B_G_Offroad_01_F", 15000, { "" }, { "", "", -1 } },
            { "B_G_Offroad_01_repair_F", 15000, { "" }, { "", "", -1 } },
            { "B_G_Van_01_transport_F", 60000, { "" }, { "", "", -1 } },
            { "B_G_Van_01_fuel_F", 65000, { "" }, { "", "", -1 } },
			{ "B_G_Offroad_01_armed_F", 750000, { "rebel" }, { "", "", -1 } },
			{ "O_MRAP_02_F", 3000000, { "" }, { "rebel", "", -1 } },
			{ "B_Heli_Light_01_F", 425000, { "rebel" }, { "", "", -1 } },
			{ "B_MRAP_01_F", 3000000, { "rebel" }, { "", "", -1 } },
			{ "I_MRAP_03_F", 3000000, { "rebel" }, { "", "", -1 } },
			{ "I_Heli_light_03_unarmed_F", 1500000, { "rebel" }, { "", "", -1 } },
			{ "B_Heli_Transport_03_unarmed_F", 2800000, { "rebel" }, { "", "", -1 } },
			{ "O_Heli_Transport_04_F", 1500000, { "rebel" }, { "", "", -1 } },
			{ "O_Heli_Transport_04_bench_F", 1000000, { "rebel" }, { "", "", -1 } },
			{ "O_Heli_Transport_04_box_F", 2600000, { "rebel" }, { "", "", -1 } },
			{ "O_Heli_Transport_04_fuel_F", 1750000, { "rebel" }, { "", "", -1 } },
			{ "C_Heli_Light_01_civil_F", 425000, { "rebel" }, { "", "", -1 } }
        };
    };

    class black_car {
        side = "civ";
        vehicles[] = {
            { "B_Quadbike_01_F", 2750, { "" }, { "", "", -1 } },
            { "B_G_Offroad_01_F", 15000, { "" }, { "", "", -1 } },
            { "B_G_Offroad_01_repair_F", 15000, { "" }, { "", "", -1 } },
            { "B_G_Van_01_transport_F", 60000, { "" }, { "", "", -1 } },
            { "B_G_Van_01_fuel_F", 65000, { "" }, { "", "", -1 } },
			{ "B_G_Offroad_01_armed_F", 750000, { "black" }, { "", "", -1 } },
			{ "B_Heli_Light_01_F", 425000, { "black" }, { "", "", -1 } }
        };
    };

    class cop_car {
        side = "cop";
        vehicles[] = {
            { "B_Quadbike_01_F", 1000, { "" }, { "", "", -1 } },
            { "C_Offroad_01_F", 5000, { "" }, { "", "", -1 } },
            { "C_SUV_01_F", 5000, { "" }, { "", "", -1 } },
            { "C_Hatchback_01_F", 5000, { "" }, { "life_coplevel", "SCALAR", 2 } },
            { "C_Hatchback_01_sport_F", 25000, { "" }, { "life_coplevel", "SCALAR", 3 } },
            { "B_MRAP_01_F", 50000, { "" }, { "life_coplevel", "SCALAR", 4 } },
            { "O_MRAP_02_F", 50000, { "" }, { "life_coplevel", "SCALAR", 7 } },
            { "I_MRAP_03_F", 50000, { "" }, { "life_coplevel", "SCALAR", 7 } },
            { "B_MRAP_01_hmg_F", 100000, { "" }, { "life_coplevel", "SCALAR", 7 } }
        };
    };

    class civ_air {
        side = "civ";
        vehicles[] = {
			{ "B_Heli_Light_01_F", 425000, { "pilot" }, { "", "", -1 } },
            { "C_Heli_Light_01_civil_F", 425000, { "pilot" }, { "", "", -1 } },
            { "O_Heli_Light_02_unarmed_F", 750000, { "pilot" }, { "", "", -1 } },
            { "I_Heli_Transport_02_F", 1000000, { "pilot" }, { "", "", -1 } }
        };
    };

    class cop_airhq {
        side = "cop";
        vehicles[] = {
			{ "B_Heli_Light_01_F", 50000, { "" }, { "life_coplevel", "SCALAR", 2 } },
			{ "I_Heli_light_03_unarmed_F", 100000, { "" }, { "life_coplevel", "SCALAR", 5 } },
			{ "I_Heli_Transport_02_F", 100000, { "" }, { "life_coplevel", "SCALAR", 5 } },
			{ "O_Heli_Light_02_unarmed_F", 100000, { "" }, { "life_coplevel", "SCALAR", 5 } },
			{ "B_Heli_Transport_03_unarmed_F", 100000, { "" }, { "life_coplevel", "SCALAR", 6 } },
			{ "O_Heli_Transport_04_F", 100000, { "" }, { "life_coplevel", "SCALAR", 6 } },
			{ "O_Heli_Transport_04_bench_F", 100000, { "" }, { "life_coplevel", "SCALAR", 6 } },
			{ "B_Heli_Transport_01_F", 100000, { "" }, { "life_coplevel", "SCALAR", 6 } },
			{ "B_Heli_Transport_01_camo_F", 100000, { "" }, { "life_coplevel", "SCALAR", 6 } }
        };
    };

    class dea_veh {
        side = "cop";
        vehicles[] = {
			{ "B_Heli_Light_01_F", 50000, { "dea" }, { "life_coplevel", "SCALAR", 3 } },
			{ "B_MRAP_01_F", 50000, { "dea" }, { "life_coplevel", "SCALAR", 3 } },
			{ "I_MRAP_03_F", 50000, { "dea" }, { "life_coplevel", "SCALAR", 3 } },
			{ "I_Heli_light_03_unarmed_F", 100000, { "dea" }, { "life_coplevel", "SCALAR", 3 } },
			{ "B_Heli_Transport_01_F", 100000, { "dea" }, { "life_coplevel", "SCALAR", 3 } }
        };
    };

    class fahnder_veh {
        side = "cop";
        vehicles[] = {
			{ "C_SUV_01_F", 5000, { "civ" }, { "", "", -1 } },
			{ "B_G_Offroad_01_F", 15000, { "civ" }, { "", "", -1 } },
			{ "C_Hatchback_01_sport_F", 25000, { "civ" }, { "", "", -1 } },
			{ "B_Heli_Light_01_F", 50000, { "civ" }, { "life_coplevel", "SCALAR", 2 } }
        };
    };

    class civ_ship {
        side = "civ";
        vehicles[] = {
			{ "C_Rubberboat",5000, { "boat" }, { "", "", -1 } },
            { "O_SDV_01_F", 100000, { "boat" }, { "", "", -1 } },
            { "C_Boat_Civil_01_F", 22000, { "boat" }, { "", "", -1 } }
        };
    };

    class cop_ship {
        side = "cop";
        vehicles[] = {
            { "B_Boat_Transport_01_F", 5000, { "" }, { "", "", -1 } },
            { "C_Boat_Civil_01_police_F", 10000, { "" }, { "", "", -1 } },
            { "B_Boat_Armed_01_minigun_F", 100000, { "" }, { "life_coplevel", "SCALAR", 3 } },
            { "B_SDV_01_F", 50000, { "" }, { "", "", -1 } }
        };
    };
};

class LifeCfgVehicles {
    /*
    *    Vehicle Configs (Contains textures and other stuff)
    *
    *    storageFee (Getting vehicles out of garage) format:
    *        INDEX 0: Civilian Price
    *        INDEX 1: Cop Price
    *        INDEX 2: EMS Price
    *        INDEX 3: OPFOR Price (Not implemented in vanilla but still leaving support
    *
    *    garageSell (Selling vehicles from garage) format:
    *        INDEX 0: Civilian Price
    *        INDEX 1: Cop Price
    *        INDEX 2: EMS Price
    *        INDEX 3: OPFOR Price (Not implemented in vanilla but still leaving support
    *
    *    Textures config follows { Texture Name, side, {texture(s)path}}
    *    Texture(s)path follows this format:
    *    INDEX 0: Texture Layer 0
    *    	INDEX 1: Texture Layer 1
    *    INDEX 2: Texture Layer 2
    *    etc etc etc
    */

    class Default {
        vItemSpace = -1;
        storageFee[] = { 1000, 1000, 1000, 1000 };
        garageSell[] = { 0, 0, 0, 0 };
        insurance = 2500;
        chopShop = 1200;
        textures[] = {};
    };

    class C_Rubberboat {
        vItemSpace = 45;
        storageFee[] = { 400, 300, 0, 0 };
        garageSell[] = { 950, 350, 0, 0 };
        insurance = 2500;
        chopShop = 950;
        textures[] = { };
    };

    class B_Heli_Transport_01_F {
        vItemSpace = 100;
        storageFee[] = { 0, 0, 0, 0 };
        garageSell[] = { 0, 0, 0, 0 };
        insurance = 16000;
        chopShop = 0;
        textures[] = {
			{ "Polizei", "cop", {
                "textures\air\gh_polizei_front.paa",
				"textures\air\gh_polizei_back.paa"
            } },
            { "DEA", "dea", {
                "textures\air\ghost_dea_0.paa",
				"textures\air\ghost_dea_1.paa"
            } }
		};
    };

    class B_Heli_Transport_01_camo_F {
        vItemSpace = 100;
        storageFee[] = { 0, 0, 0, 0 };
        garageSell[] = { 0, 0, 0, 0 };
        insurance = 16000;
        chopShop = 0;
        textures[] = {};
    };

    class B_Heli_Transport_03_unarmed_F {
        vItemSpace = 500;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 600000, 0, 0, 0 };
        insurance = 16000;
        chopShop = 600000;
        textures[] = {
			{ "Schwarz", "reb", {
                "\A3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext01_black_co.paa",
				"\A3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext02_black_co.paa"
            } },
            { "VIP Sand Digi", "don2", {
                "textures\vip\gold\huron_digi_0.paa",
				"textures\vip\gold\huron_digi_1.paa"
            } },
            { "VIP Orange Camo", "don3", {
                "textures\vip\platin\huron_orangecamo_0.paa",
				"textures\vip\platin\huron_orangecamo_1.paa"
            } },
			{ "Polizei", "cop", {
                "\A3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext01_black_co.paa",
				"\A3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext02_black_co.paa"
            } },
			{ "Dark Green", "reb", {
                "\A3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext01_co.paa",
				"\A3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext02_co.paa"
            } }
		};
    };

    class O_Heli_Transport_04_F {
        vItemSpace = 100;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 600000, 0, 0, 0 };
        insurance = 16000;
        chopShop = 600000;
        textures[] = {
			{ "Camo", "reb", {
                "\A3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_co.paa",
				"\A3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_02_co.paa"
            } },
            { "Black", "cop", {
                "\A3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_01_black_co.paa",
				"\A3\air_f_heli\Heli_Transport_04\Data\heli_transport_04_base_02_black_co.paa"
            } },
            { "THW", "med", {
                "textures\air\taru_thw_0.paa",
				"textures\air\taru_thw_1.paa"
            } }
		};
    };

    class O_Heli_Transport_04_bench_F {
        vItemSpace = 250;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 120000, 0, 0, 0 };
        insurance = 16000;
        chopShop = 120000;
        textures[] = { };
    };

    class O_Heli_Transport_04_box_F {
        vItemSpace = 700;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 300000, 0, 0, 0 };
        insurance = 16000;
        chopShop = 300000;
        textures[] = { };
    };

    class O_Heli_Transport_04_fuel_F {
        vItemSpace = 500;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 225000, 0, 0, 0 };
        insurance = 16000;
        chopShop = 225000;
        textures[] = { };
    };

    class O_Heli_Transport_04_medevac_F {
        vItemSpace = 300;
        storageFee[] = { 0, 0, 0, 0 };
        garageSell[] = { 0, 0, 0, 0 };
        insurance = 16000;
        chopShop = 0;
        textures[] = { };
    };

    class O_Heli_Transport_04_repair_F {
        vItemSpace = 100;
        storageFee[] = { 0, 0, 0, 0 };
        garageSell[] = { 0, 0, 0, 0 };
        insurance = 16000;
        chopShop = 0;
        textures[] = { };
    };

    class O_Heli_Transport_04_covered_F {
        vItemSpace = 100;
        storageFee[] = { 0, 0, 0, 0 };
        garageSell[] = { 0, 0, 0, 0 };
        insurance = 16000;
        chopShop = 0;
        textures[] = { };
    };

    class B_MRAP_01_hmg_F {
        vItemSpace = 100;
        storageFee[] = { 1000, 1000, 1000, 1000 };
        garageSell[] = { 0, 0, 0, 0 };
        insurance = 2500;
        chopShop = 0;
        textures[] = {
            { "Black", "cop", {
                "textures\car\cop\hunter_cop_0.paa",
				"textures\car\cop\hunter_cop_1.paa",
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } }
        };
    };

    class B_Boat_Armed_01_minigun_F {
        vItemSpace = 100;
        storageFee[] = { 0, 1000, 0, 0 };
        garageSell[] = { 0, 0, 0, 0 };
        insurance = 2500;
        chopShop = 0;
        textures[] = { };
    };

    class B_Boat_Transport_01_F {
        vItemSpace = 45;
        storageFee[] = { 0, 450, 0, 0 };
        garageSell[] = { 0, 0, 0, 0 };
        insurance = 2500;
        chopShop = 0;
        textures[] = { };
    };

    class O_Truck_03_transport_F {
        vItemSpace = 400;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 150000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 150000;
        textures[] = { };
    };

    class O_Truck_03_device_F {
        vItemSpace = 900;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 325000, 0, 0, 0 };
        insurance = 25000;
        chopShop = 325000;
        textures[] = { };
    };

    class Land_CargoBox_V1_F {
        vItemSpace = 5000;
        storageFee[] = { 1000, 1000, 1000, 1000 };
        garageSell[] = { 0, 0, 0, 0 };
        insurance = 2500;
        chopShop = 1200;
        textures[] = {};
    };

    class Box_IND_Grenades_F {
        vItemSpace = 350;
        storageFee[] = { 1000, 1000, 1000, 1000 };
        garageSell[] = { 0, 0, 0, 0 };
        insurance = 2500;
        chopShop = 1200;
        textures[] = {};
    };

    class B_supplyCrate_F {
        vItemSpace = 750;
        storageFee[] = { 1000, 1000, 1000, 1000 };
        garageSell[] = { 0, 0, 0, 0 };
        insurance = 2500;
        chopShop = 1200;
        textures[] = {};
    };

    class B_G_Offroad_01_F {
        vItemSpace = 90;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 3500, 0, 0, 0 };
        insurance = 2500;
        chopShop = 3500;
        textures[] = { };
    };
	
    class B_G_Offroad_01_repair_F {
        vItemSpace = 90;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 3500, 0, 0, 0 };
        insurance = 2500;
        chopShop = 3500;
        textures[] = { };
    };

    class B_G_Offroad_01_armed_F {
        vItemSpace = 65;
        storageFee[] = { 1500, 0, 0, 0 };
        garageSell[] = { 4000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 100000;
        textures[] = { };
    };

    class C_Boat_Civil_01_F {
        vItemSpace = 85;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 6800, 0, 0, 0 };
        insurance = 2500;
        chopShop = 6800;
        textures[] = { };
    };

    class C_Boat_Civil_01_police_F {
        vItemSpace = 85;
        storageFee[] = { 0, 1000, 0, 0 };
        garageSell[] = { 0, 4950, 0, 0 };
        insurance = 2500;
        chopShop = 4950;
        textures[] = { };
    };

    class B_Truck_01_transport_F {
        vItemSpace = 500;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 150000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 150000;
        textures[] = { };
    };

    class B_Truck_01_box_F {
        vItemSpace = 1200;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 425000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 425000;
        textures[] = { };
    };

    class B_Truck_01_covered_F {
        vItemSpace = 600;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 200000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 200000;
        textures[] = { };
    };

    class B_Truck_01_fuel_F {
        vItemSpace = 750;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 150000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 150000;
        textures[] = { };
    };

    class B_Truck_01_mover_F {
        vItemSpace = 100;
        storageFee[] = { 0, 0, 0, 0 };
        garageSell[] = { 0, 0, 0, 0 };
        insurance = 2500;
        chopShop = 0;
        textures[] = {
			{ "THW", "med", {
                "textures\car\THW\hemmt_thw_0.paa",
				"textures\car\THW\hemmt_thw_1.paa"
            } }
		};
    };

    class O_MRAP_02_F {
        vItemSpace = 100;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 1000000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 1000000;
        textures[] = {
			{ "Flecktarn Rot", "reb", {
                "textures\car\civ\ifrit_r1.paa",
				"textures\car\civ\ifrit_r2.paa"
            } },
            { "Rebellen Tarnung", "reb", {
                "\A3\Soft_F\MRAP_02\data\mrap_02_ext_01_co.paa",
				"\A3\Soft_F\MRAP_02\data\mrap_02_ext_02_co.paa"
            } },
            { "Polizei", "cop", {
                "textures\car\cop\ifrit_cop_0.paa",
				"textures\car\cop\ifrit_cop_1.paa"
            } },
            { "VIP Grün Camo", "don3", {
                "textures\vip\platin\Ifrit_greencamo_0.paa",
				"textures\vip\platin\Ifrit_greencamo_1.paa"
            } },
            { "VIP Orange Camo", "don3", {
                "textures\vip\platin\Ifrit_orangecamo_0.paa",
				"textures\vip\platin\Ifrit_orangecamo_1.paa"
            } }
		};
    };

    class I_MRAP_03_F {
        vItemSpace = 100;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 1000000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 1000000;
        textures[] = {
			{ "Flecktarn Grau", "reb", {
                "textures\car\civ\strider.paa"
            } },
            { "Polizei", "cop", {
                "textures\car\cop\cop_strider.paa"
            } },
            { "Braun", "reb", {
                "\a3\soft_f_beta\MRAP_03\Data\mrap_03_ext_co.paa"
            } },
            { "Camo", "reb", {
                "textures\car\civ\strider_camo.paa"
            } },
            { "VIP Gruen Camo", "don3", {
                "textures\vip\platin\Strider_greencamo.paa"
            } },
            { "VIP Orange Camo", "don3", {
                "textures\vip\platin\Strider_orangecamo.paa"
            } },
            { "DEA", "dea", {
                "textures\car\cop\strider_dea.paa"
            } },
            { "Grün Digital", "reb", {
                "\a3\soft_f_beta\MRAP_03\Data\mrap_03_ext_indp_co.paa"
            } }
		};
    };

    class C_Offroad_01_F {
        vItemSpace = 90;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 3500, 0, 0, 0 };
        insurance = 1000;
        chopShop = 3500;
        textures[] = {
            { "Rot", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"
            } },
            { "Beige", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa"
            } },
            { "Weiß", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa"
            } },
            { "Blau", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa"
            } },
            { "Dunkelrot", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa"
            } },
            { "Blau / Weiß", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa"
            } },
            { "LEER", "fed", {
                "#(ai,64,64,1)Fresnel(0.3,3)"
            } },
            { "Polizei", "cop", {
                "textures\car\cop\offroad.paa"
            } },
            { "Gelb", "civ", {
                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            } },
            { "Leer", "fed", {
                "#(ai,64,64,1)Fresnel(1.3,7)"
            } },
            { "Black", "fed", {
                "#(ai,64,64,1)Fresnel(1.3,7)"
            } },
            { "", "", {
                "textures\car\civ\offroad_weed.paa"
            } },
            { "Monsterenergy", "civ", {
                "textures\car\civ\monsterenergy_off.paa"
            } },
            { "Hawaii Look", "civ", {
                "textures\car\civ\hawaii_off.paa"
            } },
            { "Hawaii Look", "fed", {
                "textures\car\civ\hawaii_off.paa"
            } }
        };
    };

    class C_Offroad_01_repair_F {
        vItemSpace = 90;
        storageFee[] = { 0, 0, 0, 0 };
        garageSell[] = { 0, 0, 0, 0 };
        insurance = 0;
        chopShop = 0;
        textures[] = {
            { "THW", "med", {
                "textures\car\THW\offroad_thw.paa"
            } }
        };
    };

    class C_Kart_01_Blu_F {
        vItemSpace = 20;
        storageFee[] = { 750, 0, 0, 0 };
        garageSell[] = { 3500, 0, 0, 0 };
        inusrance = 1650;
        chopShop = 3500;
        textures[] = {};
    };

    class C_Kart_01_Fuel_F {
        vItemSpace = 20;
        storageFee[] = { 750, 0, 0, 0 };
        garageSell[] = { 3500, 0, 0, 0 };
        inusrance = 1650;
        chopShop = 3500;
        textures[] = {};
    };

    class C_Kart_01_Red_F {
        vItemSpace = 20;
        storageFee[] = { 750, 0, 0, 0 };
        garageSell[] = { 3500, 0, 0, 0 };
        inusrance = 1650;
        chopShop = 3500;
        textures[] = {};
    };

    class C_Kart_01_Vrana_F {
        vItemSpace = 20;
        storageFee[] = { 750, 0, 0, 0 };
        garageSell[] = { 3500, 0, 0, 0 };
        inusrance = 1650;
        chopShop = 3500;
        textures[] = {};
    };

    class C_Hatchback_01_sport_F {
        vItemSpace = 50;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 7500, 0, 0, 0 };
        insurance = 7500;
        chopShop = 7500;
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
            { "White", "cop", {
                "textures\car\cop\hatchback_white.paa"
            } },
            { "White", "fed", {
                "textures\car\cop\hatchback_white.paa"
            } },
            { "Monsterenergy", "civ", {
                "textures\car\civ\hatchback_sport_ken_block.paa"
            } },
            { "Rockstar", "civ", {
                "textures\car\civ\rockstar_hatchback.paa"
            } },
            { "Zivilfahnder", "fahnder", {
                "textures\car\civ\hatchback_sport_ken_block.paa"
            } },
            { "Rebel", "civ", {
                "textures\car\civ\hatchback_rebel.paa"
            } }
        };
    };

    class B_Quadbike_01_F {
        vItemSpace = 45;
        storageFee[] = { 500, 0, 0, 0 };
        garageSell[] = { 1000, 0, 0, 0 };
        insurance = 100;
        chopShop = 1000;
        textures[] = {
            { "Digi Desert", "civ", {
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
            { "Digi Green", "reb", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa"
            } },
            { "Hunter Camo", "reb", {
                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
            } },
            { "Rebel Camo", "reb", {
                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
            } },
            { "Polizei", "cop", {
                "textures\car\cop\cop_quad.paa"
            } },
            { "THW", "med", {
                "textures\car\THW\thw_quad.paa"
            } }
        };
    };

    class I_Truck_02_covered_F {
        vItemSpace = 300;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 42000, 0, 0, 0 };
        insurance = 6500;
        chopShop = 42000;
        textures[] = {
            { "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
				"\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            } },
            { "Black", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } },
            { "Redbull", "civ", {
                "textures\car\civ\zamak_redbull_0.paa",
				"textures\car\civ\zamak_redbull_1.paa"
            } },
            { "Barbie", "civ", {
                "textures\car\civ\truck_02_kab_co.paa",
				"textures\car\civ\truck_02_kuz_co.paa"
            } },
            { "Digi Green", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_indp_co.paa",
				"\a3\soft_f_beta\Truck_02\data\truck_02_kuz_indp_co.paa"
            } },
            { "Desert Digi", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_opfor_co.paa",
				"\a3\soft_f_beta\Truck_02\data\truck_02_kuz_opfor_co.paa"
            } }
        };
    };

    class I_Truck_02_fuel_F {
        vItemSpace = 300;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 42000, 0, 0, 0 };
        insurance = 6500;
        chopShop = 42000;
        textures[] = {
            { "Zivil", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_indp_co.paa",
				"\a3\soft_f_beta\Truck_02\data\truck_02_fuel_co.paa"
            } },
            { "Digi Green", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_indp_co.paa",
				"\a3\soft_f_beta\Truck_02\data\truck_02_fuel_indp_co.paa"
            } },
            { "Desert Digi", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_opfor_co.paa",
				"\a3\soft_f_beta\Truck_02\data\truck_02_fuel_opfor_co.paa"
            } }
		};
    };

    class I_Truck_02_transport_F {
        vItemSpace = 250;
        storageFee[] = { 12000, 0, 0, 0 };
        garageSell[] = { 39800, 0, 0, 0 };
        insurance = 6500;
        chopShop = 39800;
        textures[] = {
            { "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            } },
            { "Black", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } },
            { "Digi Green", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_indp_co.paa",
				"\a3\soft_f_beta\Truck_02\data\truck_02_kuz_indp_co.paa"
            } },
            { "Desert Digi", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_opfor_co.paa",
				"\a3\soft_f_beta\Truck_02\data\truck_02_kuz_opfor_co.paa"
            } }
        };
    };

    class O_Truck_03_covered_F {
        vItemSpace = 500;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 150000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 150000;
        textures[] = {};
    };

    class O_Truck_03_fuel_F {
        vItemSpace = 500;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 150000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 150000;
        textures[] = {};
    };

    class C_Hatchback_01_F {
        vItemSpace = 50;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 4500, 0, 0, 0 };
        insurance = 2500;
        chopShop = 4500;
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
            { "Schwarz", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa"
            } },
            { "Polizei", "cop", {
                "textures\car\cop\hatchback_white.paa"
            } }
        };
    };

    class C_SUV_01_F {
        vItemSpace = 90;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 7000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 7000;
        textures[] = {
            { "Highway", "fed", {
                "textures\car\cop\suv_white.paa"
            } },
            { "Silver", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"
            } },
            { "Orange", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"
            } },
            { "White", "cop", {
                "textures\car\cop\suv_white.paa"
            } },
            { "THW", "med", {
				"textures\car\THW\suv_thw.paa"
            } },
            { "Adler", "civ", {
                "textures\car\civ\suv_eagle.paa"
            } },
            { "Sticker", "civ", {
                "textures\car\civ\suv_sticker.paa"
            } },
            { "Camara", "civ", {
                "textures\car\civ\suv_camara.paa"
            } },
            { "Asiimov", "civ", {
                "textures\car\civ\suv_asiimov.paa"
            } },
            { "VIP Playboy", "don1", {
                "textures\vip\silber\suv_playboy.paa"
            } },
            { "Hyper Beast", "civ", {
                "textures\car\civ\hyperbeast_suv.paa"
            } },
            { "Landschaft", "civ", {
                "textures\car\civ\landschaft_suv.paa"
            } },
            { "Star Wars", "civ", {
                "textures\car\civ\suv_starwars.paa"
            } },
            { "Hawaii", "civ", {
                "textures\car\civ\suv_hawaii.paa"
            } },
            { "VIP Race", "don1", {
                "textures\vip\silber\suv_race.paa"
            } },
            { "VIP Im rich", "don2", {
                "textures\vip\gold\suv_gold.paa"
            } },
            { "Zivilfahnder", "fahnder", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"
            } }
        };
    };

    class C_Van_01_transport_F {
        vItemSpace = 120;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 25000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 25000;
        textures[] = {
            { "Weiß", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
            { "Rot", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } }
        };
    };
	
    class B_G_Van_01_transport_F {
        vItemSpace = 120;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 25000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 25000;
        textures[] = {};
    };
	
    class C_Van_01_fuel_F {
        vItemSpace = 125;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 25000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 25000;
        textures[] = {
            { "Weiß", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
            { "Rot", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } }
        };
    };
	
    class B_G_Van_01_fuel_F {
        vItemSpace = 125;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 25000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 25000;
        textures[] = {};
    };

    class C_Van_01_box_F {
        vItemSpace = 150;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 25000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 25000;
        textures[] = {
            { "Weiß", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
            { "Rot", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } }
        };
    };

    class B_MRAP_01_F {
        vItemSpace = 100;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 1000000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 1000000;
        textures[] = {
            { "Flecktarn-Grün", "reb", {
                "textures\car\civ\rebell_hunter_typ2_teil1.paa"
            } },
            { "Polizei-blau", "cop", {
                "textures\car\cop\hunter_cop_0.paa",
				"textures\car\cop\hunter_cop_1.paa"
            } },
            { "Urban", "reb", {
                "textures\car\civ\hunter_urban_front.paa",
				"textures\car\civ\hunter_urban_back.paa"
            } },
            { "Flecktarn-Grau", "reb", {
                "textures\car\civ\hunter_front.paa",
				"textures\car\civ\hunter_hinten.paa"
            } },
            { "Braun", "reb", {
                "\a3\soft_f\MRAP_01\Data\mrap_01_base_co.paa",
				"\a3\soft_f\MRAP_01\Data\mrap_01_adds_co.paa"
            } },
            { "DEA", "dea", {
                "textures\car\cop\hunter_dea_0.paa",
				"textures\car\cop\hunter_dea_1.paa"
            } },
            { "VIP Grün Camo", "don3", {
                "textures\vip\platin\hunter_greencamo_0.paa",
				"textures\vip\platin\hunter_greencamo_1.paa"
            } },
            { "VIP Orange Camo", "don3", {
                "textures\vip\platin\hunter_orangecamo_0.paa",
				"textures\vip\platin\hunter_orangecamo_1.paa"
            } }
        };
    };

    class B_Heli_Light_01_F {
        vItemSpace = 100;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 200000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 200000;
        textures[] = {
            { "Black", "reb", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa"
            } },
            { "Sheriff", "cop", {
                "textures\air\police_heli.paa"
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
            { "THW", "med", {
                "textures\air\humming_thw.paa"
            } },
            { "Redbull", "civ", {
                "textures\air\civ_hummingbird_redbull.paa"
            } },
            { "Hyper Beast", "civ", {
                "textures\air\humming_hyper.paa"
            } },
            { "DEA", "dea", {
                "textures\air\humming_dea.paa"
            } },
            { "VIP Asiimov", "don2", {
                "textures\vip\gold\humming_asiimov.paa"
            } },
            { "Zivilfahnder", "fahnder", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa"
            } },
            { "Wespe", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa"
            } },
            { "Rebel Digital Green", "reb", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa"
            } }
        };
    };

    class C_Heli_Light_01_civil_F {
        vItemSpace = 100;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 200000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 200000;
        textures[] = {
            { "Hyper Beast", "civ", {
                "textures\air\humming_hyper.paa"
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
            { "Redbull", "civ", {
                "textures\air\civ_hummingbird_redbull.paa"
            } },
            { "Hyper Beast", "civ", {
                "textures\air\humming_hyper.paa"
            } },
            { "VIP Asiimov", "don2", {
                "textures\vip\gold\humming_asiimov.paa"
            } },
            { "Wespe", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa"
            } },
            { "Rebel Digital Green", "reb", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa"
            } }
		};
    };

    class O_Heli_Light_02_unarmed_F {
        vItemSpace = 300;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 350000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 350000;
        textures[] = {
            { "Black", "civ", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa"
            } },
            { "White / Blue", "civ", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"
            } },
            { "Digi Green", "civ", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"
            } },
            { "Desert Digi", "civ", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa"
            } },
            { "Orca", "civ", {
                "\A3\air_f_heli\Heli_Light_02\Data\heli_light_02_ext_opfor_v2_co.paa"
            } },
            { "Leer", "fed", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa"
            } },
            { "Polizei", "cop", {
                "textures\air\cop_orca.paa"
            } }
        };
    };

    class I_Heli_Transport_02_F {
        vItemSpace = 400;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 120000, 0, 0, 0 };
        insurance = 120000;
        chopShop = 120000;
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
            { "THW", "med", {
                "textures\air\mohawk_thw_0.paa",
				"textures\air\mohawk_thw_1.paa",
				"textures\air\mohawk_thw_2.paa"
            } },
            { "Polizei", "cop", {
                "#(ai,64,64,1)Fresnel(1.3,7)",
                "#(argb,8,8,3)color(1,1,1,0.8)",
                "#(ai,64,64,1)Fresnel(1.3,7)"
            } },
            { "Digi Green", "civ", {
                "\a3\air_f_beta\Heli_Transport_02\Data\heli_transport_02_1_indp_co.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\heli_transport_02_2_indp_co.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\heli_transport_02_3_indp_co.paa"
            } }
        };
    };
	
	class I_Heli_light_03_unarmed_F {
        vItemSpace = 350;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 350000, 0, 0, 0 };
        insurance = 6500;
        chopShop = 350000;
        textures[] = {
            { "Leer", "fed", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } },
            { "Polizei", "fed", {
                "textures\air\Polizei_hellcat.paa"
            } },
            { "Grün", "reb", {
                "\a3\air_f_epb\Heli_Light_03\data\heli_light_03_base_co.paa"
            } },
            { "Grün Digi", "reb", {
                "\a3\air_f_epb\Heli_Light_03\data\heli_light_03_base_indp_co.paa"
            } },
            { "DEA", "dea", {
                "textures\air\hellcat_dea.paa"
            } }
        };
    };

    class B_SDV_01_F {
        vItemSpace = 10;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 25000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 25000;
        textures[] = {};
    };

    class O_SDV_01_F {
        vItemSpace = 10;
        storageFee[] = { 1000, 0, 0, 0 };
        garageSell[] = { 25000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 25000;
        textures[] = {};
    };
};
