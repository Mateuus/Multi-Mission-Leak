class CarShops {

    class civ_car {
        side = "civ";
        vehicles[] = {
            { "B_Quadbike_01_F", { "", "", -1 } },
            { "C_Offroad_01_F", { "", "", -1 } },
            { "C_Offroad_02_unarmed_F", { "", "", -1 } },
            { "C_SUV_01_F", { "", "", -1 } },
            { "C_Hatchback_01_F", { "", "", -1 } },
            { "C_Hatchback_01_sport_F", { "", "", -1 } },
			{ "C_Van_01_transport_F", { "", "", -1 } },
            { "C_Van_01_box_F", { "", "", -1 } }
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
            { "I_Truck_02_transport_F", { "", "", -1 } },
            { "I_Truck_02_covered_F", { "", "", -1 } },
            { "O_Truck_03_transport_F", { "", "", -1 } },
			{ "O_Truck_03_covered_F", { "", "", -1 } },
            { "B_Truck_01_transport_F", { "", "", -1 } },
			{ "B_Truck_01_covered_F", { "", "", -1 } },
            { "B_Truck_01_box_F", { "", "", -1 } },
            { "O_Truck_03_device_F", { "", "", -1 } }
        };
    };
	
    class civ_car_vip {
        side = "civ";
        vehicles[] = {
            { "C_Offroad_01_F", { "driver" }, { "life_donorlevel", "SCALAR", 1 } },
			{ "C_Hatchback_01_F", { "driver" }, { "life_donorlevel", "SCALAR", 1 } }
        };
    };
    class civ_car_vip2 {
        side = "civ";
        vehicles[] = {
            { "C_SUV_01_F", { "driver" }, { "life_donorlevel", "SCALAR", 2 } },
			{ "I_Truck_02_covered_F", { "driver" }, { "life_donorlevel", "SCALAR", 2 } }
        };
    };
    class civ_car_vip3 {
        side = "civ";
        vehicles[] = {
            { "C_SUV_01_F", { "driver" }, { "life_donorlevel", "SCALAR", 3 } },
			{ "B_Truck_01_transport_F", {"driver"}, {"life_donorlevel", "SCALAR", 3}}
        };
    };
    class civ_car_vip4 {
        side = "civ";
        vehicles[] = {
            { "C_SUV_01_F", { "driver" }, { "life_donorlevel", "SCALAR", 4 } }
        };
    };
	
	//Container
	class civ_container {
		side = "civ";
		vehicles[] = {
            { "Land_CargoBox_V1_F", { "", "", -1 } },
            { "Land_WaterTank_F", { "", "", -1 } },
            { "Land_Cargo20_yellow_F", { "", "", -1 } }
		};
	};

    class civ_oil {
        side = "civ";
        vehicles[] = {
            { "C_Van_01_fuel_F", { "", "", -1 } },
            { "I_Truck_02_fuel_F", { "", "", -1 } },
            { "B_Truck_01_fuel_F", { "", "", -1 } }
        };
    };
	
	
    class civ_air {
        side = "civ";
        vehicles[] = {
			{ "B_Heli_Light_01_F", { "pilot" }, { "", "", -1 } },
            { "C_Heli_Light_01_civil_F", { "pilot" }, { "", "", -1 } },
            { "O_Heli_Light_02_unarmed_F", { "pilot" }, { "", "", -1 } },
            { "I_Heli_Transport_02_F", { "pilot" }, { "", "", -1 } },
            { "O_Heli_Transport_04_box_F", { "bigpilot" }, { "", "", -1 } },
            { "B_Heli_Transport_03_unarmed_F", { "bigpilot" }, { "", "", -1 } }
        };
    };

     class civ_ship {
        side = "civ";
        vehicles[] = {
            { "C_Scooter_Transport_01_F", { "", "", -1 } },
            { "C_Rubberboat", { "", "", -1 } },
            { "C_Boat_Civil_01_F", { "", "", -1 } }
 
        };
    };

    class rebellen_auto {
        side = "civ";
        vehicles[] = {
            { "B_Quadbike_01_F", { "", "", -1 } },
            { "B_G_Offroad_01_F", { "", "", -1 } },
            { "I_MRAP_03_F", { "", "", -1 } },  	
            { "O_MRAP_02_F", { "", "", -1 } },
            { "B_T_LSV_01_unarmed_F", { "", "", -1 } },
            { "O_T_LSV_02_unarmed_F", { "", "", -1 } },
            { "O_Heli_Light_02_unarmed_F", { "pilot" }, { "", "", -1 } },
			{ "B_T_VTOL_01_infantry_F", { "bigpilot" }, { "", "", -1 } },
			{ "O_Heli_Transport_04_F", { "bigpilot" }, { "", "", -1 } },
			{ "O_Heli_Transport_04_bench_F", { "bigpilot" }, { "", "", -1 } }
        };
    };

    class med_shop {
        side = "med";      
        vehicles[] = {
			{ "C_Offroad_01_F", { "", "", -1 } },
			{ "C_SUV_01_F", { "", "", -1 } }
        };
    };

    class med_air_hs {
        side = "med";
        vehicles[] = {
            { "B_Heli_Light_01_F", { "life_mediclevel", "SCALAR", 1 } },
            { "O_Heli_Light_02_unarmed_F", { "life_mediclevel", "SCALAR", 2 } }
        };
    };

    class cop_car {
        side = "cop";
        vehicles[] = {
            { "C_Offroad_01_F", { "", "", -1 } },
            { "C_SUV_01_F", { "life_coplevel", "SCALAR", 3 } },
            { "C_Hatchback_01_sport_F", {"life_coplevel", "SCALAR", 4 } },
			{ "I_Truck_02_covered_F", { "life_coplevel", "SCALAR", 5 } },
            { "I_MRAP_03_F", { "", "", -1 } },
            { "B_MRAP_01_F", {"", "", -1 } },
			{ "B_Quadbike_01_F", {"life_coplevel", "SCALAR", 8 } }
        };
    };

    class cop_air {
        side = "cop"; 
        vehicles[] = {
            { "B_Heli_Light_01_F", { "life_coplevel", "SCALAR", 3 } },
			{ "O_Heli_Light_02_unarmed_F", { "life_coplevel", "SCALAR", 4 } },
            { "I_Heli_light_03_unarmed_F", { "life_coplevel", "SCALAR", 5 } },
			{ "B_Heli_Transport_03_unarmed_F", { "life_coplevel", "SCALAR", 7 } },
			{ "B_T_VTOL_01_infantry_F", { "life_coplevel", "SCALAR", 8 } },
			{ "B_Heli_Attack_01_F", { "life_coplevel", "SCALAR", 8 } } 
        };
    };

    class cop_ship {
        side = "cop";
        vehicles[] = {
            { "B_Boat_Transport_01_F", { "life_coplevel", "SCALAR", 2 } },
            { "C_Boat_Civil_01_police_F", { "life_coplevel", "SCALAR", 4 } },
            { "B_Boat_Armed_01_minigun_F", { "life_coplevel", "SCALAR", 8 } },
            { "B_SDV_01_F", { "life_coplevel", "SCALAR", 6 } }
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
        price = 25000;
        textures[] = {};
    };
	
    class B_Heli_Transport_03_unarmed_F {          
        vItemSpace = 200;
        licenses[] = { {"bigpilot"}, {""}, {""}, {""} };
        price = 6500000;
        textures[] = {};
    };
	
    class O_Heli_Transport_04_box_F {
        vItemSpace = 150;
        licenses[] = { {"bigpilot"}, {""}, {""}, {""} };
        price = 3500000;
        textures[] = {};
    };
	
    class C_Scooter_Transport_01_F {
        vItemSpace = 25;
        licenses[] = { {"boat"}, {""}, {""}, {""} };
        price = 5000;
        textures[] = {};
    };
	
    class C_Boat_Transport_02_F {
        vItemSpace = 1000;
        licenses[] = { {"boat"}, {""}, {""}, {""} };
        price = 190000;
        textures[] = {};         
    };
	
    class B_T_LSV_01_unarmed_F {                   
        vItemSpace = 50;
        licenses[] = { {"rebel"}, {""}, {""}, {""} };
        price = 2000000;
        textures[] = {};         
    };
	
    class O_T_LSV_02_unarmed_F {                   
        vItemSpace = 50;
        licenses[] = { {"rebel"}, {""}, {""}, {""} };
        price = 2000000;
        textures[] = {};
    };
	
	//Kleiner Container
	class Land_CargoBox_V1_F {
        vItemSpace = 50;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 80000;
        textures[] = {};
    };
	
	//Mittlerer Container
	class Land_WaterTank_F {
        vItemSpace = 125;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 140000;
        textures[] = {};
    };
	
	//Großer Container
	class Land_Cargo20_yellow_F {
        vItemSpace = 250;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 250000;
        textures[] = {};
    };

    class I_Heli_Transport_02_F {
        vItemSpace = 60;
        licenses[] = { {"pilot"}, {""}, {""}, {""} };
        price = 1500000;
        textures[] = {};
    };
	
	class O_Heli_Light_02_F {
        vItemSpace = 50;
        licenses[] = { {"pilot"}, {""}, {""}, {""} };        
        price = 1200000;
        textures[] = {};
    };
	
	class B_T_VTOL_01_infantry_F {
        vItemSpace = 400;
        licenses[] = { {"rebel"}, {""}, {""}, {""} };        
        price = 50000000;
        textures[] = {};
    };
	
	class O_Heli_Transport_04_F {
        vItemSpace = 75;
        licenses[] = { {"bigpilot"}, {""}, {""}, {""} };        
        price = 10000000;
        textures[] = {};
    };
	
	class O_Heli_Transport_04_bench_F {
        vItemSpace = 100;
        licenses[] = { {"rebel"}, {""}, {""}, {""} };        
        price = 8000000;
        textures[] = {};
    };
	
	
	class B_Heli_Attack_01_F {
        vItemSpace = 75;
        licenses[] = { {""}, {""}, {""}, {""} };        
        price = 50000000;
        textures[] = {};
    };
	
    class O_Truck_03_medical_F {
        vItemSpace = 200;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 45000;
        textures[] = {};
    };

    class B_Truck_01_medical_F {
        vItemSpace = 250;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 60000;
        textures[] = {};
    };

    class C_Rubberboat {
        vItemSpace = 75;
        licenses[] = { {"boat"}, {""}, {""}, {""} };
        price = 10000;
        textures[] = { };
    };

    class B_Heli_Transport_01_F {
        vItemSpace = 50;
        licenses[] = { {"pilot"}, {""}, {""}, {""} };
        price = 200000;
        textures[] = {};
    };

    class B_MRAP_01_hmg_F {
        vItemSpace = 100;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 750000;
        textures[] = {
            { "Black", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } }
        };
    };

    class B_Boat_Armed_01_minigun_F {
        vItemSpace = 175;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 75000;
        textures[] = { };
    };

    class B_Boat_Transport_01_F {
        vItemSpace = 45;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 3000;
        textures[] = { };
    };

    class O_Truck_03_transport_F {
        vItemSpace = 350;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 950000;
        textures[] = { };
    };
	

    class O_Truck_03_device_F {
        vItemSpace = 1000;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 16000000;
        textures[] = { };
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
        vItemSpace = 60;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 15000;
        textures[] = { };
    };

    class C_Boat_Civil_01_F {
        vItemSpace = 175;
        licenses[] = { {"boat"}, {""}, {""}, {""} };
        price = 250000;
        textures[] = { };
    };

    class C_Boat_Civil_01_police_F {
        vItemSpace = 175;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 250000;
        textures[] = { };
    };

    class B_Truck_01_box_F {
        vItemSpace = 750;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 5250000;
        textures[] = {};
    };
	
	class B_Truck_01_covered_F {
        vItemSpace = 650;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 3750000;
        textures[] = { };
    };
	

    class B_Truck_01_transport_F {
        vItemSpace = 550;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 2500000;
        textures[] = {
			{ "Grün", "civ", {
                "\A3\Soft_F_Beta\Truck_01\data\truck_01_ext_01_co.paa",
                "\A3\Soft_F_beta\Truck_01\data\truck_01_ext_02_co.paa"
            } },
			{ "LadyCamo", "vip3", {
				"textures\civ\DON\DONhemmtfront3.paa",
				"textures\civ\DON\DONhemmtback3.paa"
				}}
		};
    };

    class O_MRAP_02_F {
        vItemSpace = 60;
        licenses[] = { {"rebel"}, {""}, {""}, {""} };
        price = 4000000;
        textures[] = { };
    };
	//Strider
    class I_MRAP_03_F {
        vItemSpace = 60;
        licenses[] = { {"rebel"}, {"swat"}, {""}, {""} };
        price = 7000000;
        textures[] = {
            { "SWAT", "cop", {
                "textures\cop\Autos\Strider\sekstrider.paa"
            } },
			{ "Zivilschutz", "cop", {
                "textures\cop\Autos\Strider\zivilschutzstrider.paa"
            } },
            { "Rebellen", "civ", {
                "textures\civ\Helikopter\Hummingbird\rebel.paa"
            } }
        };
    };
	//Offroader
    class C_Offroad_01_F {
        vItemSpace = 60;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 15000;
        textures[] = {
            { "Rot", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"
            } },
            { "Gelb", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa"
            } },
            { "Weiss", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa"
            } },
            { "Blau", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa"
            } },
            { "Dodge Charger", "civ", {
                "textures\civ\Autos\Offroader\dogdeoffroader.paa"
            } },
            { "Donator", "vip", {
                "textures\civ\don\DONoffroad1.paa"
            } },			
            { "WEED <3", "civ", {
                "textures\civ\Autos\Offroader\weedoffroader.paa"
            } },
            { "State Police", "cop", {
                "textures\cop\Autos\Offroader\polizeioffroader.paa"
            } },
            { "FARA", "med", {
                "textures\med\Autos\Offroader\FARAoffroad.paa"
            } },
            { "FARA-Towing", "med", {
                "textures\med\Autos\Offroader\FARAoffroadTOWING.paa"
            } }
        };
    };
	
    class C_Offroad_02_unarmed_F {
        vItemSpace = 60;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 15000;
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
	        { "Rot", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa"
            } },			
	        { "Weiß", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa"
            } }	

        };
    };
	
    class I_Heli_light_03_unarmed_F {
        vItemSpace = 50;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 200000;
        textures[] = {
	        { "State Police", "cop", {
                "textures\cop\Helikopter\Hellcat\cop_Hellcat.paa"
            } },
	        { "SWAT", "cop", {
                "textures\cop\Helikopter\Hellcat\SWATHellcat.paa"
            } },
	        { "Rebel", "civ", {
                "\a3\air_f_epb\Heli_Light_03\Data\heli_light_03_base_co.paa"
            } }
        };
    };
	
    class I_Heli_light_03_F {
        vItemSpace = 50;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 200000;
        textures[] = {
	        { "State Police", "cop", {
                "textures\cop\Helikopter\Hellcat\cop_Hellcat.paa"
            } },
	        { "Rebel", "civ", {
                "\a3\air_f_epb\Heli_Light_03\Data\heli_light_03_base_co.paa"
            } }
        };
    };

    class C_Kart_01_Blu_F {
        vItemSpace = 10;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 20000;
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
	
	//Hatchback Sport
    class C_Hatchback_01_sport_F {
        vItemSpace = 40;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 300000;
        textures[] = {
            { "Grün", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa"
            } },
            { "Schwarz", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa"
            } },
            { "Red Gull", "civ", {
                "textures\civ\Autos\Hatchback\redgullhatchback.paa"
            } },
            { "Monster", "civ", {
                "textures\civ\Autos\Hatchback\monsterhatchback.paa"
            } },
            { "Feuerwehr", "med", {
                "textures\med\Autos\Hatchback\feuerwehrhatchback.paa"
            } },
            { "State Police", "cop", {
                "textures\cop\Autos\Hatchback\polizeihatchback.paa"
            } },
            { "SWAT", "cop", {
                "textures\cop\Autos\Hatchback\SWAThatchback.paa"
            } },
            { "FBI-Grün", "cop", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa"
            } },
            { "FBI-Schwarz", "cop", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa"
            } }
        };
    };
	//Quadbike
    class B_Quadbike_01_F {
        vItemSpace = 25;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 3000;
        textures[] = {
            { "Braun", "cop", {
                "\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa"
            } },
            { "Wüste", "reb", {
                "\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa"
            } },
            { "Schwarz", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa"
            } },
            { "Blau", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa"
            } },
            { "Rot", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa"
            } },
            { "weiss", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa"
            } },
            { "Grün", "civ", {
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
        vItemSpace = 275;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 450000;
        textures[] = {
            { "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            } },
            { "Black", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } },
			{ "Woodchuck", "vip2", {
				"textures\civ\DON\DONzamakfront2.paa",
				"textures\civ\DON\DONzamakback2.paa"
			} }
        };
    };

    class I_Truck_02_transport_F {
        vItemSpace = 200;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 250000;
        textures[] = {
            { "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            } },
            { "Schwarz", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } }
        };
    };

    class O_Truck_03_covered_F {
        vItemSpace = 450;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 1500000;
        textures[] = {};
    };

    class C_Hatchback_01_F {
        vItemSpace = 40;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 50000;
        textures[] = {
            { "Grün", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa"
            } },
            { "Schwarz", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa"
            } },
            { "Red Gull", "civ", {
                "textures\civ\Autos\Hatchback\redgullhatchback.paa"
            } },
            { "Monster", "civ", {
                "textures\civ\Autos\Hatchback\monsterhatchback.paa"
            } },
			{ "Donator", "vip", {
                "textures\civ\don\DONhatchback1.paa"
            } },
            { "State Police", "cop", {
                "textures\cop\Autos\Hatchback\polizeihatchback.paa"
            } }
        };
    };
	//SUV
    class C_SUV_01_F {
        vItemSpace = 45;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 65000;
        textures[] = {
            { "Mercedes Benz", "civ", {
                "textures\civ\Autos\SUV\benzsuv.paa"
            } },
            { "Subaru", "civ", {
                "textures\civ\Autos\SUV\subarusuv.paa"
            } },
            { "Orange", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"
            } },
            { "Batman", "civ", {
                "textures\civ\Autos\SUV\batmansuv.paa"
            } },
            { "Taxi", "civ", {
                "textures\civ\Autos\SUV\taxisuv.paa"
            } },
            { "Poly", "civ", {
                "textures\civ\Autos\SUV\polysuv.paa"
            } },
			{ "Hello-Miche", "civ", {
                "textures\civ\Autos\SUV\hellomiche.paa"
            } },
			{ "Donator", "vip2", {
                "textures\civ\don\DONsuv2.paa"
            } },
			{ "Donator", "vip3", {
                "textures\civ\don\DONsuv3.paa"
            } },
			{ "Donator", "vip4", {
                "textures\civ\don\DONsuv4.paa"
            } },			
            { "State Police", "cop", {
                "textures\cop\Autos\SUV\polizeisuv.paa"
            } },
            { "FBI", "cop", {
                "textures\cop\Autos\SUV\fbisuv.paa"
            } },
            { "SWAT", "cop", {
                "textures\cop\Autos\SUV\SWATsuv.paa"
            } },
            { "Fara-Medic", "med", {
                "textures\med\Autos\SUV\faramedicalsuv.paa"
            } },
            { "Fara-Towing", "med", {
                "textures\med\Autos\SUV\faratowingsuv.paa"
            } },
            { "FBI-Mercedes Benz", "cop", {
                "textures\civ\Autos\SUV\benzsuv.paa"
            } }
        };
    };

    class C_Van_01_transport_F {
        vItemSpace = 100;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 100000;
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
        price = 150000;
        textures[] = {
            { "Weiss", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
            { "Rot", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } },
            { "Feuerwehr", "med", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            } }
        };
    };
	
		
    class B_MRAP_01_F {
        vItemSpace = 50;
        licenses[] = { {""}, {"swat"}, {""}, {""} };
        price = 3000000;
        textures[] = {
            { "SWAT", "cop", {
                "textures\cop\Autos\Hunter\sekhunter1.paa",
                "textures\cop\Autos\Hunter\sekhunter2.paa"
            } }
        };
    };

     class B_Heli_Light_01_stripped_F {
        vItemSpace = 10;
        licenses[] = { {"rebel"}, {""}, {""}, {""} };
        price = 500000;
        textures[] = {
            { "Rebel Digital", "reb", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
            } }
        };
    };
	
     class B_G_Offroad_01_armed_F {
        vItemSpace = 60;
        licenses[] = { {"rebel"}, {""}, {""}, {""} };
        price = 1000000;
        textures[] = {
			{ "State Police", "cop", {
	            "textures\cop\Autos\Offroader\polizeioffroader.paa",
	            "textures\cop\Autos\Offroader\polizeioffroader.paa"
            } },
			{ "Rebelle", "civ", {
                "textures\civ\Autos\Offroader\rebellenoffroader.paa",
                "textures\civ\Autos\Offroader\rebellenoffroader.paa"
            } }
		};
    };

    class B_Heli_Light_01_F {
        vItemSpace = 10;
        licenses[] = { {"pilot"}, {""}, {""}, {""} };
        price = 500000;
        textures[] = {
            { "State Police", "cop", {
                "textures\cop\Helikopter\Hummingbird\cop_Hummingbird.paa"
            } },
            { "SWAT", "cop", {
                "textures\cop\Helikopter\Hummingbird\swat_Hummingbird.paa"
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
            { "GoldenBird", "vip4", {
                "textures\civ\don\DONhummingbird4.paa"
            } },
            { "Rebel Digital", "reb", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
            } },
            { "Digi Green", "reb", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa"
            } },
            { "FARA", "med", {
                "textures\med\Helikopter\Hummingbird\farahumming.paa"
            } }
        };
    };

    class C_Heli_Light_01_civil_F : B_Heli_Light_01_F {
        vItemSpace = 25;
        price = 480000;
    };

    class O_Heli_Light_02_unarmed_F {
        vItemSpace = 50;
        licenses[] = { {"pilot" }, {""}, {""}, {""} };
        price = 1200000;
        textures[] = {
            { "White / Blue", "civ", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"
            } },
            { "Digi Green", "civ", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"
            } },
            { "State Police", "cop", {
                "textures\cop\Helikopter\Orca\cop_orca.paa"
            } },
            { "FARA", "med", {
                "textures\med\Helikopter\Orca\Faraorca.paa"
            } },
            { "Desert Digi", "reb", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa"
            } }
        };
    };
	
    class B_Heli_Light_01_armed_F {
        vItemSpace = 10;
        licenses[] = { {"" }, {""}, {""}, {""} };
        price = 15000000;
        textures[] = {
            { "State Police", "cop", {
                "textures\cop\Helikopter\Hummingbird\cop_Hummingbird.paa"
            } },
            { "Rebel Digital", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
            } },
            { "Digi Green", "civ", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa"
            } }
        };
    };

    class B_SDV_01_F {
        vItemSpace = 50;
        licenses[] = { {"boat"}, {""}, {""}, {""} };
        price = 500000;
        textures[] = {};
    };

        class C_Van_01_fuel_F {
        vItemSpace = 50;
        vFuelSpace = 4900;
        licenses[] = { {"oiltrucking"}, {""}, {""}, {""} };
        price = 150000;
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
        vItemSpace = 50;
        vFuelSpace = 6200;
        licenses[] = { {"oiltrucking"}, {""}, {""}, {""} };
        price = 320000;
        textures[] = {
            { "Weiss", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_fuel_co.paa"
            } }
        };
    };

    class B_Truck_01_fuel_F {
        vItemSpace = 50;
        vFuelSpace = 9000;
        licenses[] = { {"oiltrucking"}, {""}, {""}, {""} };
        price = 1000000;
        textures[] = {};
    };
};