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
	class army_car {
        side = "cop";
        vehicles[] = {
			{ "B_T_LSV_01_armed_F", { "life_armylevel", "SCALAR", 1 } },
			{ "B_MRAP_01_hmg_F", { "life_armylevel", "SCALAR", 1 } },
			{ "B_APC_Wheeled_01_cannon_F", { "life_armylevel", "SCALAR", 1 } },
			{ "B_APC_Tracked_01_AA_F", { "life_armylevel", "SCALAR", 1 } }
        };
    };
	
	class army_air {
        side = "cop";
        vehicles[] = {
			{ "B_CTRG_Heli_Transport_01_sand_F", { "life_armylevel", "SCALAR", 1 } },
			{ "B_Heli_Light_01_armed_F", { "life_armylevel", "SCALAR", 1 } },
			{ "B_T_VTOL_01_infantry_F", { "life_armylevel", "SCALAR", 1 } },
			{ "I_Heli_light_03_F", { "life_armylevel", "SCALAR", 1 } },
			{ "B_T_VTOL_01_vehicle_F", { "life_armylevel", "SCALAR", 1 } }
        };
    };
	
	class army_jet {
        side = "cop";
        vehicles[] = {
			{ "I_Plane_Fighter_03_CAS_F", { "life_armylevel", "SCALAR", 1 } }
        };
    };
	
	
    class civ_car {
        side = "civ";
        vehicles[] = {
            { "B_Quadbike_01_F", { "", "", -1 } },
            { "C_Hatchback_01_F", { "", "", -1 } },
            { "C_Offroad_01_F", { "", "", -1 } },
            { "C_SUV_01_F", { "", "", -1 } },
			{ "C_Offroad_02_unarmed_F", { "", "", -1 } },
            { "C_Hatchback_01_sport_F", { "", "", -1 } }
        };
    };
	
	class gang_car {
        side = "civ";
        vehicles[] = {
            { "B_Quadbike_01_F", { "", "", -1 } },
			{ "C_Offroad_02_unarmed_F", { "", "", -1 } },
            { "C_Offroad_01_F", { "", "", -1 } }
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
            { "I_Truck_02_transport_F", { "", "", -1 } },
            { "I_Truck_02_covered_F", { "", "", -1 } },
            { "B_Truck_01_transport_F", { "", "", -1 } },
            { "O_Truck_03_transport_F", { "", "", -1 } },
            { "O_Truck_03_covered_F", { "", "", -1 } },
			{ "B_Truck_01_covered_F", { "", "", -1 } },
			{ "O_Truck_03_fuel_F", { "", "", -1 } },
            { "B_Truck_01_box_F", { "", "", -1 } },
            { "O_Truck_03_device_F", { "", "", -1 } }
        };
    };

    class civ_air {
        side = "civ";
        vehicles[] = {
            { "C_Heli_Light_01_civil_F", { "", "", -1 } },
            { "B_Heli_Light_01_F", { "", "", -1 } },
            { "O_Heli_Light_02_unarmed_F", { "", "", -1 } },
			{ "B_Heli_Transport_03_unarmed_F", { "", "", -1 } },
			{ "C_Plane_Civil_01_F", { "", "", -1 } },
            { "B_T_VTOL_01_infantry_F", { "", "", -1 } },
			{ "B_T_VTOL_01_vehicle_F", { "", "", -1 } }
        };
    };
	
	class civ_jet {
        side = "civ";
        vehicles[] = {
            { "C_Plane_Civil_01_F", { "", "", -1 } },
            { "B_T_VTOL_01_infantry_F", { "", "", -1 } },
			{ "B_T_VTOL_01_vehicle_F", { "", "", -1 } }
        };
    };
	
	class reb_jet {
        side = "civ";
        vehicles[] = {
            { "C_Plane_Civil_01_F", { "", "", -1 } },
			{ "O_T_VTOL_02_infantry_F", { "", "", -1 } },
			{ "B_T_VTOL_01_infantry_F", { "", "", -1 } },
			{ "B_T_VTOL_01_vehicle_F", { "", "", -1 } },
			{ "I_Plane_Fighter_03_CAS_F", { "", "", -1 } },
			{ "O_Plane_CAS_02_F", { "", "", -1 } },
			{ "B_T_VTOL_01_armed_F", { "", "", -1 } },
			{ "B_Plane_CAS_01_F", { "", "", -1 } },
        };
    };
	
	class reb_air {
        side = "civ";
        vehicles[] = {
            { "B_Heli_Light_01_F", { "", "", -1 } },
			{ "O_Heli_Light_02_unarmed_F", { "", "", -1 } },
			{ "I_Heli_light_03_unarmed_F", { "", "", -1 } },
			{ "I_Heli_Transport_02_F", { "", "", -1 } },
			{ "O_Heli_Transport_04_F", { "", "", -1 } },
			{ "O_Heli_Transport_04_repair_F", { "", "", -1 } },
			{ "O_Heli_Transport_04_covered_F", { "", "", -1 } },
			{ "O_Heli_Transport_04_bench_F", { "", "", -1 } },
			{ "O_Heli_Transport_04_box_F", { "", "", -1 } }
        };
    };
	
	class bcm_air {
        side = "civ";
        vehicles[] = {
			{ "B_Heli_Light_01_armed_F", { "", "", -1 } },
            { "O_Heli_Light_02_F", { "", "", -1 } },
			{ "O_Heli_Attack_02_F", { "", "", -1 } }
        };
    };
	
	class bcm {
        side = "civ";
        vehicles[] = {
			{ "I_G_Offroad_01_armed_F", { "", "", -1 } },
            { "O_MRAP_02_hmg_F", { "", "", -1 } },
			{ "I_APC_tracked_03_cannon_F", { "", "", -1 } },
			{ "O_APC_Wheeled_02_rcws_F", { "", "", -1 } }
        };
    };

     class civ_ship {
        side = "civ";
        vehicles[] = {
			{ "C_Scooter_Transport_01_F", { "", "", -1 } },
            { "C_Rubberboat", { "", "", -1 } },
            { "B_SDV_01_F", { "", "", -1 } },
			{ "C_Boat_Civil_01_F", { "", "", -1 } },
			{ "I_C_Boat_Transport_02_F", { "", "", -1 } }
        };
    };

    class reb_car {
        side = "civ";
        vehicles[] = {
            { "B_Quadbike_01_F", { "", "", -1 } },
            { "B_G_Offroad_01_F", { "", "", -1 } },
		    { "C_Offroad_02_unarmed_F", { "", "", -1 } },
			{ "O_T_LSV_02_unarmed_F", { "", "", -1 } },
			{ "I_G_Offroad_01_armed_F", { "", "", -1 } },
            { "O_MRAP_02_F", { "", "", -1 } },
			{ "I_MRAP_03_F", { "", "", -1 } }
		};
    };

    class med_shop {
        side = "med";
        vehicles[] = {
			{ "C_SUV_01_F", { "", "", -1 } },
            { "C_Offroad_01_F", { "life_medicLevel", "SCALAR", 0 } },
			{ "C_Hatchback_01_F", { "life_medicLevel", "SCALAR", 0 } },
			{ "C_Van_01_box_F", { "life_medicLevel", "SCALAR", 1 } },
            { "I_Truck_02_medical_F", { "life_medicLevel", "SCALAR", 2 } },
            { "O_Truck_03_medical_F", { "life_medicLevel", "SCALAR", 2 } },
            { "B_Truck_01_medical_F", { "life_medicLevel", "SCALAR", 3 } },
			{ "I_MRAP_03_F", { "life_medicLevel", "SCALAR", 4 } }
        };
    };

    class med_air_hs {
        side = "med";
        vehicles[] = {
            { "B_Heli_Light_01_F", { "", "", -1 } },
            { "O_Heli_Light_02_unarmed_F", { "life_medicLevel", "SCALAR", 2 } },
			{ "B_Heli_Transport_03_unarmed_F", { "life_medicLevel", "SCALAR", 4 } },
			{ "O_Heli_Transport_04_medevac_F", { "life_medicLevel", "SCALAR", 4 } }
        };
    };

    class cop_car {
        side = "cop";
        vehicles[] = {	
			{ "B_Quadbike_01_F", { "", "", -1 } },
			{ "B_GEN_Offroad_01_gen_F", { "", "", -1 } },
            { "C_Hatchback_01_F", { "life_coplevel", "SCALAR", 1 } },
			{ "C_Hatchback_01_sport_F", { "life_coplevel", "SCALAR", 4 } },	
			{ "C_SUV_01_F", { "life_coplevel", "SCALAR", 1 } },	
			{ "C_Offroad_02_unarmed_F", { "", "", -1 } },
			{ "B_T_LSV_01_unarmed_F", { "life_coplevel", "SCALAR", 4 } },
			{ "O_Truck_02_covered_F", { "life_coplevel", "SCALAR", 4 } },
			{ "B_MRAP_01_F", { "", "", -1 } },
			{ "I_MRAP_03_F", { "life_swatlevel", "SCALAR", 1 } },	
			{ "B_G_Offroad_01_armed_F", { "life_swatlevel", "SCALAR", 1 } },
			{ "O_T_LSV_02_armed_black_F", { "life_swatlevel", "SCALAR", 1 } },
			{ "I_MRAP_03_hmg_F", { "life_swatlevel", "SCALAR", 1 } },
			{ "O_APC_Wheeled_02_rcws_F", { "life_swatlevel", "SCALAR", 1 } },
			{ "B_APC_Wheeled_01_cannon_F", { "life_swatlevel", "SCALAR", 1 } }
        };
    };

    class cop_air {
        side = "cop";
        vehicles[] = {
            { "B_Heli_Light_01_F", { "", "", -1 } },
			{ "O_Heli_Light_02_unarmed_F", { "life_coplevel", "SCALAR", 2 } },
			{ "B_Heli_Transport_01_F", { "life_coplevel", "SCALAR", 3 } },
			{ "B_Heli_Transport_03_unarmed_F", { "life_coplevel", "SCALAR", 5 } },
			{ "B_Heli_Light_01_armed_F", { "life_swatlevel", "SCALAR", 3 } },
			{ "B_Heli_Transport_01_camo_F", { "life_swatlevel", "SCALAR", 1 } },
			{ "B_T_VTOL_01_infantry_F", { "life_swatlevel", "SCALAR", 1 } },
			{ "B_T_VTOL_01_vehicle_F", { "life_swatlevel", "SCALAR", 1 } }
        };
    };

    class cop_ship {
        side = "cop";
        vehicles[] = {
			{ "B_Boat_Transport_01_F", { "", "", -1 } },
			{ "C_Boat_Civil_01_police_F", { "", "", -1 } },
			{ "B_SDV_01_F", { "life_coplevel", "SCALAR", 3 } },
			{ "I_C_Boat_Transport_02_F", { "life_swatlevel", "SCALAR", 1 } },
			{ "B_Boat_Armed_01_minigun_F", { "life_armylevel", "SCALAR", 1 } }
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

    class I_Truck_02_medical_F {
        vItemSpace = 150;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 80000;
        textures[] = {};
    };

    class O_Truck_03_medical_F {
        vItemSpace = 200;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 80000;
        textures[] = {};
    };

    class B_Truck_01_medical_F {
        vItemSpace = 250;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 90000;
        textures[] = {};
    };

    class C_Rubberboat {
        vItemSpace = 45;
        licenses[] = { {"boat"}, {""}, {""}, {""} };
        price = 5000;
        textures[] = { };
    };

    class B_Heli_Transport_01_F {
        vItemSpace = 200;
        licenses[] = { {""}, {"cAir"}, {""}, {""} };
        price = 900000;
        textures[] = {};
    };
	
	class B_CTRG_Heli_Transport_01_sand_F {
        vItemSpace = 200;
        licenses[] = { {""}, {"cAir"}, {""}, {""} };
        price = 900000;
        textures[] = {};
    };
	
	class B_Heli_Transport_01_camo_F {
        vItemSpace = 200;
        licenses[] = { {""}, {"cAir"}, {""}, {""} };
        price = 900000;
        textures[] = {};
    };
	
    class B_T_LSV_01_armed_F {
        vItemSpace = 80;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 200000;
        textures[] = {
            { "Army", "cop", {
				"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_olive_CO.paa",
                "\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_olive_CO.paa",
                "\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_olive_CO.paa",
                "\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_Adds_olive_CO.paa"
            } }
        };
    };
	
	class B_T_LSV_01_unarmed_F {
        vItemSpace = 60;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 75000;
        textures[] = { };
    };

	
	class B_MRAP_01_hmg_F {
        vItemSpace = 100;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 400000;
        textures[] = { };
    };

    class B_Boat_Armed_01_minigun_F {
        vItemSpace = 175;
        licenses[] = { {""}, {"cg"}, {""}, {""} };
        price = 200000;
        textures[] = { };
    };

    class B_Boat_Transport_01_F {
        vItemSpace = 25;
        licenses[] = { {""}, {"cg"}, {""}, {""} };
        price = 50000;
        textures[] = { };
    };

    class O_Truck_03_transport_F {
        vItemSpace = 285;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 400000;
        textures[] = { };
    };

    class O_Truck_03_device_F {
        vItemSpace = 500;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 1000000;
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
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 50000;
        textures[] = { };
    };

    class B_G_Offroad_01_armed_F {
        vItemSpace = 65;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 150000;
        textures[] = {
			{ "Police", "cop", {
                "#(argb,8,8,3)color(0.518,0.519,0.455,0.2)"
            } }
		};
    };
	
    class O_T_LSV_02_armed_black_F {
        vItemSpace = 65;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 175000;
        textures[] = {
			{ "Swat", "cop", {
                "#(argb,8,8,3)color(0.518,0.519,0.455,0.2)"
            } }
		};
    };
	
	class I_G_Offroad_01_armed_F {
        vItemSpace = 65;
        licenses[] = { {"rebel"}, {""}, {""}, {""} };
        price = 250000;
        textures[] = { };
    };
	
	class O_MRAP_02_hmg_F {
        vItemSpace = 60;
        licenses[] = { {"blackmarket"}, {""}, {""}, {""} };
        price = 750000;
        textures[] = { };
    };
	
	class O_APC_Wheeled_02_rcws_F {
        vItemSpace = 90;
        licenses[] = { {"blackmarket"}, {""}, {""}, {""} };
        price = 935000;
        textures[] = {
			{ "SWAT", "cop", {
                "#(argb,8,8,3)color(0.03,0.03,0.03,0.5)",
				"#(argb,8,8,3)color(0.03,0.03,0.03,0.5)",
				"#(argb,8,8,3)color(0.03,0.03,0.03,0.5)"
            } }
		};
    };
	
	class I_APC_tracked_03_cannon_F {
        vItemSpace = 130;
        licenses[] = { {"blackmarket"}, {""}, {""}, {""} };
        price = 6000000;
        textures[] = { };
    };

    class C_Boat_Civil_01_F {
        vItemSpace = 249;
        licenses[] = { {"boat"}, {""}, {""}, {""} };
        price = 685000;
        textures[] = { };
    };

    class C_Boat_Civil_01_police_F {
        vItemSpace = 85;
        licenses[] = { {""}, {"cg"}, {""}, {""} };
        price = 60000;
        textures[] = { };
    };
	
	class C_Scooter_Transport_01_F {
        vItemSpace = 5;
        licenses[] = { {"boat"}, {"cg"}, {""}, {""} };
        price = 20000;
        textures[] = { };
    };

    class B_Truck_01_box_F {
        vItemSpace = 1250;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 1500000;
        textures[] = { };
    };
	
	class O_Truck_03_fuel_F {
        vItemSpace = 100;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 1000000;
        textures[] = { };
    };

    class B_Truck_01_transport_F {
        vItemSpace = 325;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 350000;
        textures[] = { };
    };

    class O_MRAP_02_F {
        vItemSpace = 60;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 400000;
        textures[] = { };
    };
	
	class B_Truck_01_covered_F {
        vItemSpace = 160;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 600000;
        textures[] = { };
    };
	

    class C_Offroad_01_F {
        vItemSpace = 65;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 45000;
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
            { "Red", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"
            } },
			{ "Medic", "med", {
                "textures\vehicleskins\offroad_medic.jpg"
            } },
			{ "Red", "don", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"
            } },
            { "Fed", "cop", {
                "#(ai,64,64,1)Fresnel(0.3,3)"
            } },
            { "Police", "cop", {
                "textures\vehicleskins\offroad_police.paa"
            } }	
        };
    };

    class C_Kart_01_Blu_F {
        vItemSpace = 20;
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

    class C_Hatchback_01_sport_F {
        vItemSpace = 45;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 110000;
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
			{ "Rocky Star", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"
            } },
			{ "Medic", "med", {
                "textures\vehicleskins\hatchback_medic.paa"
            } },
			{ "Unicorn", "don", {
                "textures\vehicleskins\unicorn.paa"
            } },
			{ "Taxi", "don", {
                "textures\vehicleskins\hatchback_taxi.paa"
            } },
            { "Police", "cop", {
                "textures\vehicleskins\hatchback_police.paa"
            } }	
        };
    };

    class B_Quadbike_01_F {
        vItemSpace = 25;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 12500;
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

    class I_Truck_02_covered_F {
        vItemSpace = 220;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 110000;
        textures[] = {
            { "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            } },
            { "Black", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } }
        };
    };

    class I_Truck_02_transport_F {
        vItemSpace = 175;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 105000;
        textures[] = {
            { "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            } },
            { "Black", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } }
        };
    };

    class O_Truck_03_covered_F {
        vItemSpace = 300;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 425000;
        textures[] = {};
    };

    class C_Hatchback_01_F {
        vItemSpace = 40;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 60000;
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
			{ "Police", "cop", {
                "textures\vehicleskins\hatchback_police.paa"
            } },
			{ "Medic", "med", {
                "textures\vehicleskins\hatchback_medic.paa"
            } }			
        };
    };

    class C_SUV_01_F {
        vItemSpace = 50;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 65000;
        textures[] = {
            { "Dark Red", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"
            } },
            { "Black", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa"
            } },
            { "Silver", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"
            } },
            { "Orange", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"
            } },
			{ "Ghostrider", "civ", {
                "textures\vehicleskins\suv_ghostrider.paa"
            } },
			{ "Devil", "don", {
                "textures\vehicleskins\suv_devil.paa"
            } },
			{ "Taxi", "don", {
                "textures\vehicleskins\suv_taxi.paa"
            } },
            { "Police", "cop", {
                "textures\vehicleskins\suv_police.paa"
            } },
			{ "Medic", "med", {
                "textures\vehicleskins\suv_medic.paa"
            } }			
        };
    };
	
	class C_Offroad_02_unarmed_F {
        vItemSpace = 40;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 70000;
        textures[] = {
			{ "Police", "cop", {
                "#(argb,8,8,3)color(0.03,0.03,0.03,0.8)"
            } }
        };
    };

    class C_Van_01_transport_F {
        vItemSpace = 100;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 90000;
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
        vItemSpace = 150;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 75000;
        textures[] = {
            { "White", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } },
			{ "Medic", "med", {
                "textures\vehicleskins\boxtruck_medic.paa",
				"textures\vehicleskins\boxtruck_medic1.paa"
            } }
        };
    };

    class B_MRAP_01_F {
        vItemSpace = 65;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 125000;
        textures[] = {
            { "Regular", "don", {
                "\A3\Soft_F\MRAP_01\Data\mrap_01_base_co.paa"
            } },
            { "Police", "cop", {
                "textures\vehicleskins\hunter1_police.paa",
				"textures\vehicleskins\hunter2_police.paa"
            } }
        };
    };
	
	class I_MRAP_03_F {
        vItemSpace = 65;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 400000;
        textures[] = {
			{ "Regular", "civ", {
                "\A3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa"
            } },
			{ "Medic", "med", {
                "textures\vehicleskins\strider_medic.paa"
            } },
			{ "SWAT", "cop", {
                "textures\vehicleskins\strider_swat.paa",
				"#(argb,8,8,3)color(0.03,0.03,0.03,0.5)",
				"#(argb,8,8,3)color(0.03,0.03,0.03,0.5)"
            } },
			{ "Blue", "don", {
                "\A3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa"
            } },
            { "Camo", "don", {
                "\A3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa"
            } }
		};
    };
	
	class I_MRAP_03_hmg_F {
        vItemSpace = 65;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 555000;
		 textures[] = {
			{ "SWAT", "cop", {
                "textures\vehicleskins\strider_swat.paa",
				"#(argb,8,8,3)color(0.03,0.03,0.03,0.5)",
				"#(argb,8,8,3)color(0.03,0.03,0.03,0.5)"
            } }
		};
    };

     class B_Heli_Light_01_stripped_F {
        vItemSpace = 90;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 275000;
        textures[] = {
            { "Rebel Digital", "reb", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
            } }
        };
    };
	
	class O_Heli_Transport_04_medevac_F {
        vItemSpace = 110;
        licenses[] = { {"pilot"}, {"cAir"}, {"mAir"}, {""} };
        price = 1100000;
        textures[] = {};
    };
	

    class B_Heli_Light_01_F {
        vItemSpace = 90;
        licenses[] = { {"pilot"}, {"cAir"}, {"mAir"}, {""} };
        price = 400000;
        textures[] = {
            { "Sheriff", "cop", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa"
            } },
            { "Police", "cop", {
                "textures\vehicleskins\littlebird_police.paa"
            } },
            { "Civ Blue", "civ", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"
            } },
            { "Civ Red", "civ", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"
            } },
            { "Digi Green", "civ", {
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
            { "Medic", "med", {
                "textures\vehicleskins\littlebird_heli_med.jpg"
            } }
        };
    };

    class C_Heli_Light_01_civil_F : B_Heli_Light_01_F {
        vItemSpace = 75;
        price = 245000;
    };

    class O_Heli_Light_02_unarmed_F {
        vItemSpace = 210;
        licenses[] = { {"pilot" }, {"cAir"}, {"mAir"}, {""} };
        price = 750000;
        textures[] = {
            { "Police", "cop", {
                "textures\vehicleskins\orca_police.paa"
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
                "textures\vehicleskins\orca_medic.paa"
            } }
        };
    };
	
	class C_Plane_Civil_01_F {
        vItemSpace = 110;
        licenses[] = { {"pilot"}, {"cAir"}, {""}, {""} };
        price = 500000;
        textures[] = {};
    };
	
	class B_T_VTOL_01_infantry_F {
        vItemSpace = 750;
        licenses[] = { {""}, {"cAir"}, {""}, {""} };
        price = 1800000;
        textures[] = {
            { "Civilian", "civ", {
				"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT01_blue_CO.paa",
                "\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT02_blue_CO.paa",
                "\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT03_blue_CO.paa",
                "\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT04_blue_CO.paa"
            } },
            { "Army", "cop", {
				"#(argb,8,8,3)color(0.03,0.03,0.03,0.5)",
				"#(argb,8,8,3)color(0.03,0.03,0.03,0.5)",
				"#(argb,8,8,3)color(0.03,0.03,0.03,0.5)",
				"#(argb,8,8,3)color(0.03,0.03,0.03,0.5)"
            } }
        };
    };
	
	class B_T_VTOL_01_vehicle_F {
        vItemSpace = 200;
        licenses[] = { {"pilot"}, {"cAir"}, {""}, {""} };
        price = 2000000;
        textures[] = {
            { "Civilian", "civ", {
				"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT01_blue_CO.paa",
                "\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT02_blue_CO.paa",
                "\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT03_blue_CO.paa",
                "\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT04_blue_CO.paa"
            } },
            { "Army", "cop", {
				"#(argb,8,8,3)color(0.03,0.03,0.03,0.5)",
				"#(argb,8,8,3)color(0.03,0.03,0.03,0.5)",
				"#(argb,8,8,3)color(0.03,0.03,0.03,0.5)",
				"#(argb,8,8,3)color(0.03,0.03,0.03,0.5)"
            } }
        };
    };
	
	class O_T_VTOL_02_infantry_F {
        vItemSpace = 125;
        licenses[] = { {"pilot"}, {"cAir"}, {""}, {""} };
        price = 1500000;
        textures[] = {};
    };
	
	class I_Heli_Transport_02_F {
        vItemSpace = 300;
        licenses[] = { {"pilot"}, {"cAir"}, {""}, {""} };
        price = 850000;
        textures[] = {
            { "Ion", "civ", {
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_ion_co.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_ion_co.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_ion_co.paa"
            } },
			{ "Army", "cop", {
                "#(argb,8,8,3)color(0.518,0.519,0.455,0.2)",
				"#(argb,8,8,3)color(0.518,0.519,0.455,0.2)",
				"#(argb,8,8,3)color(0.518,0.519,0.455,0.2)"
            } },
            { "Dahoman", "civ", {
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_dahoman_co.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_dahoman_co.paa",
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_dahoman_co.paa"
            } }
        };
    };
	
	class I_Heli_light_03_unarmed_F {
        vItemSpace = 200;
        licenses[] = { {"pilot"}, {"cAir"}, {""}, {""} };
        price = 750000;
        textures[] = {};
    };
	
	class O_Heli_Transport_04_F {
        vItemSpace = 100;
        licenses[] = { {"pilot"}, {"cAir"}, {""}, {""} };
        price = 1100000;
        textures[] = {};
    };
	
	class O_Heli_Transport_04_repair_F {
        vItemSpace = 200;
        licenses[] = { {"pilot"}, {"cAir"}, {""}, {""} };
        price = 1100000;
        textures[] = {};
    };
	
	class O_Heli_Transport_04_covered_F {
        vItemSpace = 250;
        licenses[] = { {"pilot"}, {"cAir"}, {""}, {""} };
        price = 1100000;
        textures[] = {};
    };
	
	class O_Heli_Transport_04_bench_F {
        vItemSpace = 50;
        licenses[] = { {"pilot"}, {"cAir"}, {""}, {""} };
        price = 1100000;
        textures[] = {};
    };
	
	class O_Heli_Transport_04_box_F {
        vItemSpace = 600;
        licenses[] = { {"pilot"}, {"cAir"}, {""}, {""} };
        price = 1500000;
        textures[] = {};
    };
	
	class O_Heli_Attack_02_F {
        vItemSpace = 60;
        licenses[] = { {"blackmarket"}, {"cAir"}, {""}, {""} };
        price = 2500000;
        textures[] = {};
    };
	
	class O_Heli_Light_02_F {
        vItemSpace = 60;
        licenses[] = { {"blackmarket"}, {"cAir"}, {""}, {""} };
        price = 1600000;
        textures[] = {};
    };
	
	class B_Heli_Light_01_armed_F {
        vItemSpace = 10;
        licenses[] = { {"blackmarket"}, {"cAir"}, {""}, {""} };
        price = 1250000;
        textures[] = {};
    };
		
	class B_Heli_Transport_03_unarmed_F {
        vItemSpace = 250;
        licenses[] = { {"pilot"}, {"cAir"}, {""}, {""} };
        price = 1100000;
        textures[] = {};
    };
	
    class B_SDV_01_F {
        vItemSpace = 50;
        licenses[] = { {"boat"}, {"cg"}, {""}, {""} };
        price = 160000;
        textures[] = {};
    };
	
	class I_C_Boat_Transport_02_F {
        vItemSpace = 500;
        licenses[] = { {"boat"}, {"cg"}, {""}, {""} };
        price = 1500000;
        textures[] = {};
    };

        class C_Van_01_fuel_F {
        vItemSpace = 20;
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

    class I_Truck_02_fuel_F {
        vItemSpace = 40;
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

    class B_Truck_01_fuel_F {
        vItemSpace = 50;
        vFuelSpace = 50000;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 250000;
        textures[] = {};
    };
	
	class B_APC_Wheeled_01_cannon_F {
        vItemSpace = 90;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 1100000;
        textures[] = {
			{ "SWAT", "cop", {
                "#(argb,8,8,3)color(0.03,0.03,0.03,0.5)",
				"#(argb,8,8,3)color(0.03,0.03,0.03,0.5)",
				"#(argb,8,8,3)color(0.03,0.03,0.03,0.5)"
            } }
		};
    };
	
	class B_APC_Tracked_01_AA_F {
        vItemSpace = 25;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 1250000;
        textures[] = {};
    };
	
	class O_T_LSV_02_unarmed_F {
        vItemSpace = 50;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 175000;
        textures[] = {
            { "Camo", "civ", {
				"\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_01_ghex_CO.paa",
                "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa",
                "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_03_ghex_CO.paa"
            } }
        };
    };
	
	class O_Truck_02_covered_F {
        vItemSpace = 120;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 80000;
        textures[] = {};
    };
	
	class I_Plane_Fighter_03_CAS_F {
        vItemSpace = 0;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 5000000;
        textures[] = {
			{ "Buzzard", "civ", {
                "a3\air_f_gamma\plane_fighter_03\data\plane_fighter_03_body_1_indp_co.paa",
                "a3\air_f_gamma\plane_fighter_03\data\plane_fighter_03_body_2_indp_co.paa"
            } },
			{ "Army", "cop", {
                "#(argb,8,8,3)color(0.03,0.03,0.03,0.8)",
				"#(argb,8,8,3)color(0.03,0.03,0.03,0.8)"
            } }
		};
    };
	
	class O_Plane_CAS_02_F {
        vItemSpace = 0;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 7000000;
        textures[] = {};
    };
	
	class B_T_VTOL_01_armed_F {
        vItemSpace = 1;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 15000000;
        textures[] = {
            { "Civilian", "civ", {
				"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT01_blue_CO.paa",
                "\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT02_blue_CO.paa",
                "\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT03_blue_CO.paa",
                "\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT04_blue_CO.paa"
            } },
            { "Army", "cop", {
				"\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT01_olive_CO.paa",
                "\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT02_olive_CO.paa",
                "\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT03_olive_CO.paa",
                "\A3\Air_F_Exp\VTOL_01\Data\VTOL_01_EXT04_olive_CO.paa"
            } }
        };
    };
	
	class B_Plane_CAS_01_F {
        vItemSpace = 0;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 9000000;
        textures[] = { 
			{ "Wipeout", "civ", {
                "a3\air_f_epc\Plane_CAS_01\Data\plane_cas_01_ext01_co.paa"
            } },
			{ "Donator Wipeout", "don", {
                "a3\air_f_epc\Plane_CAS_01\Data\plane_cas_01_ext01_co.paa"
            } }
		};
    };
	
	class B_GEN_Offroad_01_gen_F {
        vItemSpace = 60;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 50000;
        textures[] = {};
    };
		
	class Land_Wreck_Traw_F {
        vItemSpace = 10000000;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 10000000;
        textures[] = {};
    };
		
	class Land_Wreck_Traw2_F {
        vItemSpace = 10000000;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 10000000;
        textures[] = {};
    };
	
	class Land_WoodenBox_F {
        vItemSpace = 10000000;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 10000000;
        textures[] = {};
    };
		
	class I_Heli_light_03_F {
        vItemSpace = 100;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 2000000;
        textures[] = {};
    };
};
