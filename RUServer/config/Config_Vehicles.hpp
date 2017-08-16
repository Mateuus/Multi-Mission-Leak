class CarShops {
    /*
    *    ARRAY FORMAT:
    *        0: STRING (Classname)
    *        1: STRING (Condition)
    *    FORMAT:
    *        STRING (Conditions) - Must return boolean :
    *            String can contain any amount of conditions, aslong as the entire
    *            string returns a boolean. This allows you to check any levels, licenses etc,
    *            in any combination. For example:
    *                "call life_coplevel && license_civ_someLicense"
    *            This will also let you call any other function.
    *
    *   BLUFOR Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_WEST
    *   OPFOR Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_EAST
    *   Independent Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_GUER
    *   Civilian Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_CIV
    */
    class civ_car {
        side = "civ";
        conditions = "";
        vehicles[] = {
         { "B_Quadbike_01_F", "" },
         { "C_Hatchback_01_F", "" },
         { "C_Offroad_01_F", "" },
			   { "C_Offroad_02_unarmed_F", "" },
         { "C_SUV_01_F", "" },
         { "C_Hatchback_01_sport_F", "" },
         { "C_Van_01_transport_F", "" }

        };
    };

    class kart_shop {
        side = "civ";
        conditions = "";
        vehicles[] = {
         { "C_Kart_01_Blu_F", "" },
         { "C_Kart_01_Fuel_F", "" },
         { "C_Kart_01_Red_F", "" },
         { "C_Kart_01_Vrana_F", "" },
         { "B_Quadbike_01_F", "" }
        };
    };

    class civ_truck {
        side = "civ";
        conditions = "";
        vehicles[] = {
         { "C_Van_01_box_F", "" },
			   { "C_Van_01_fuel_F", "" },
         { "I_Truck_02_transport_F", "" },
         { "I_Truck_02_covered_F", "" },
			   { "I_Truck_02_fuel_F", "" },
         { "B_Truck_01_transport_F", "" },
			   { "B_Truck_01_covered_F", "" },
			   { "B_Truck_01_box_F", "" },
			   { "B_Truck_01_fuel_F", "" },
         { "O_Truck_03_transport_F", "" },
         { "O_Truck_03_covered_F", "" },
         { "O_Truck_03_device_F", "" }
      };
    };

    class civ_air {
        side = "civ";
        conditions = "";
        vehicles[] = {
            { "B_Heli_Light_01_F", "" },
			      { "C_Heli_Light_01_civil_F", "" },
			      { "C_Plane_Civil_01_F", "" },
            { "O_Heli_Light_02_unarmed_F", "" },
			      { "I_Heli_Transport_02_F", "" },
			      { "B_Heli_Transport_03_unarmed_F", "" },
			      { "O_Heli_Transport_04_F", "" },
			      { "B_T_VTOL_01_infantry_olive_F", "" },
            { "B_T_VTOL_01_vehicle_olive_F", "" },
			      { "O_T_VTOL_02_vehicle_hex_F", "" }
        };
    };

     class civ_ship {
        side = "civ";
        conditions = "";
        vehicles[] = {
          { "C_Rubberboat", "" },
          { "C_Boat_Civil_01_F", "" },
          { "B_SDV_01_F", "" },
			    { "C_Boat_Transport_02_F", "" },
          { "C_Scooter_Transport_01_F", "" }
       };
    };

    class reb_car {
        side = "civ";
        conditions = "";
        vehicles[] = {
            { "B_Quadbike_01_F", "" },
            { "B_G_Offroad_01_F", "" },
			      { "B_MRAP_01_F", "" },
			      { "O_MRAP_02_F", "" },
			      { "I_MRAP_03_F", "" },
			      { "B_Heli_Light_01_F", "" },
			      { "I_Heli_light_03_unarmed_F", "" },
			      { "O_Heli_Attack_02_F", "" },
			      { "B_Heli_Attack_01_F", "" }
        };
    };

    class med_shop {
        side = "med";
        conditions = "";
        vehicles[] = {
            { "C_Offroad_01_F", "call life_mediclevel >= 1" },
			      { "C_SUV_01_F", "call life_mediclevel >= 2" },
            { "C_Van_01_box_F", "call life_mediclevel >= 2" },
			      { "C_Hatchback_01_sport_F", "call life_mediclevel >= 3" },
            { "I_Truck_02_ammo_F", "call life_mediclevel >= 4" },
			      { "B_MRAP_01_F", "call life_mediclevel >= 5" }
        };
    };

    class med_air_hs {
        side = "med";
        conditions = "";
        vehicles[] = {
            { "B_Heli_Light_01_F", "call life_mediclevel >= 1" },
            { "O_Heli_Light_02_unarmed_F", "call life_mediclevel >= 2" },
			      { "I_Heli_light_03_unarmed_F", "call life_mediclevel >= 3" },
			      { "B_Heli_Transport_03_unarmed_F", "call life_mediclevel >= 4" },
			      { "O_Heli_Transport_04_medevac_F", "call life_mediclevel >= 5" }
        };
    };

    class cop_car {
        side = "cop";
        conditions = "";
        vehicles[] = {
          { "C_Offroad_01_F", "call life_coplevel >= 1" },
			    { "C_Hatchback_01_F", "call life_coplevel >= 2" },
          { "C_SUV_01_F", "call life_coplevel >= 3" },
			    { "C_Hatchback_01_sport_F", "call life_coplevel >= 4" },
			    { "B_MRAP_01_F", "call life_coplevel >= 5" },
			    { "I_MRAP_03_F", "call life_coplevel >= 7" }
        };
    };

    class cop_air {
        side = "cop";
        conditions = "call life_coplevel >= 3 && {license_cop_cAir} || {license_cop_cAirSamll}";
        vehicles[] = {
          { "B_Heli_Light_01_F", "call life_coplevel >= 3" },
			    { "I_Heli_light_03_unarmed_F", "call life_coplevel >= 4" },
		      { "B_Heli_Transport_03_unarmed_F", "call life_coplevel >= 5" },
			    { "B_Heli_Transport_01_F", "call life_coplevel >= 6" },
			    { "B_Heli_Attack_01_F", "call life_coplevel >= 7" },
			    { "B_T_VTOL_01_vehicle_blue_F", "call life_coplevel >= 6" },
			    { "O_T_VTOL_02_infantry_grey_F", "call life_coplevel >= 6" }
        };
    };

    class cop_ship {
        side = "cop";
        conditions = "license_cop_cg";
        vehicles[] = {
            { "B_Boat_Transport_01_F", "" },
			      { "C_Boat_Transport_02_F", "" },
            { "C_Boat_Civil_01_police_F", "" },
            { "B_SDV_01_F", "" }
        };
    };

    class psm_car {
        side = "psm";
        conditions = "";
        vehicles[] = {
          { "C_Offroad_01_F", "call life_psmlevel >= 1" },
			    { "C_Hatchback_01_F", "call life_psmlevel >= 2" },
          { "C_SUV_01_F", "call life_psmlevel >= 3" },
			    { "C_Hatchback_01_sport_F", "call life_psmlevel >= 4" },
			    { "B_MRAP_01_F", "call life_psmlevel >= 5" },
			    { "I_MRAP_03_F", "call life_psmlevel >= 7" }
        };
    };

    class psm_air {
        side = "psm";
        conditions = "call life_psmlevel >= 3";
        vehicles[] = {
            { "B_Heli_Light_01_F", "call life_psmlevel >= 3" },
			      { "I_Heli_light_03_unarmed_F", "call life_psmlevel >= 4" },
		        { "B_Heli_Transport_03_unarmed_F", "call life_psmlevel >= 5" },
			      { "B_Heli_Transport_01_F", "call life_psmlevel >= 6" },
			      { "B_Heli_Attack_01_F", "call life_psmlevel >= 7" },
			      { "B_T_VTOL_01_vehicle_blue_F", "call life_psmlevel >= 6" },
			      { "O_T_VTOL_02_infantry_grey_F", "call life_psmlevel >= 6" }
        };
    };

    class psm_ship {
        side = "psm";
        conditions = "license_psm_cg";
        vehicles[] = {
            { "B_Boat_Transport_01_F", "" },
			      { "C_Boat_Transport_02_F", "" },
            { "C_Boat_Civil_01_police_F", "" },
            { "B_SDV_01_F", "" }
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
    *       1: STRING (Condition)
    *    Textures config follows { Texture Name, side, {texture(s)path}, Condition}
    *    Texture(s)path follows this format:
    *    INDEX 0: Texture Layer 0
    *    INDEX 1: Texture Layer 1
    *    INDEX 2: Texture Layer 2
    *    etc etc etc
    *
    */

    class Default {
        vItemSpace = -1;
        conditions = "";
        price = -1;
        textures[] = {};
    };

    class I_Truck_02_ammo_F {	//Zamack Ammo
        vItemSpace = 150;
        conditions = "";
        price = 25000;
        textures[] = {
			      { "Feuerwehr", "med", {
				       "textures\vehicles\rw_fahrgestell15.paa",
				       "textures\vehicles\rw_aufbau13.paa"
			      }, ""}
		      };
    };

	class C_Boat_Transport_02_F {	//RHIB
        vItemSpace = 200;
        conditions = "license_civ_boat || {license_cop_cg}";
        price = 150000;
        textures[] = {
			         { "Civilian", "civ", {
                "\A3\Boat_F_Exp\Boat_Transport_02\Data\Boat_Transport_02_exterior_civilian_CO.paa"
            },"" },
            { "Black", "cop", {
                "\A3\Boat_F_Exp\Boat_Transport_02\Data\Boat_Transport_02_exterior_CO.paa"
            }, "" }
		};
    };

	class C_Scooter_Transport_01_F {	//Scooter
        vItemSpace = 10;
        conditions = "license_civ_boat";
        price = 6000;
        textures[] = {
			         { "Black", "civ", {
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Black_CO.paa",
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Black_CO.paa"
            }, "" },
            { "Blue", "civ", {
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Blue_co.paa",
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Blue_co.paa"
            }, "" },
            { "Grey", "civ", {
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Grey_co.paa",
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Grey_co.paa"
            }, "" },
            { "Green", "civ", {
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Lime_co.paa",
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Lime_co.paa"
            }, "" },
            { "Red", "civ", {
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Red_CO.paa",
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_CO.paa"
            }, "" },
            { "White", "civ", {
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_CO.paa",
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_CO.paa"
            }, "" },
            { "Yellow", "civ", {
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Yellow_CO.paa",
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Yellow_CO.paa"
            }, "" }
		};
    };

	class C_Plane_Civil_01_F {	//Chessnar
        vItemSpace = 75;
        conditions = "license_civ_pilot";
        price = 250000;
        textures[] = {
			         { "Racing (Tan Interior)", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
            }, "" },
            { "Racing", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
            }, "" },
            { "Red Line (Tan Interior)", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
            }, "" },
            { "Red Line", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
            }, "" },
            { "Tribal (Tan Interior)", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
            }, "" },
            { "Tribal", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
            }, "" },
            { "Blue Wave (Tan Interior)", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
            }, "" },
            { "Blue Wave", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
			}, "" }
		};
    };

	class C_Offroad_02_unarmed_F {	//Jeep
        vItemSpace = 55;
        conditions = "license_civ_driver || {playerSide != civilian}";
        price = 30000;
        textures[] = {
        			{ "Schwarz", "civ", {
        				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa"
        			}, ""},
        			{ "Blau", "civ", {
        				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa"
        			}, ""},
        			{ "Grün", "civ", {
        				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa"
        			}, ""},
        			{ "Orange", "civ", {
        				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_orange_co.paa"
        			}, ""},
        			{ "Rot", "civ", {
        				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa"
        			}, ""},
        			{ "Weiß", "civ", {
        				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_whithe_co.paa"
        			}, ""},
        			{ "Braun", "civ", {
        				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_brown_co.paa"
        			}, ""},
        			{ "Olive", "civ", {
        				"\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_olive_co.paa"
        			}, ""}
        		};
    };

    class C_Rubberboat {	//Schlauchboot
        vItemSpace = 75;
        conditions = "license_civ_boat || {playerSide != civilian}";
        price = 15000;
        textures[] = { };
    };

    class B_Heli_Transport_01_F {	//Ghost Hawk
        vItemSpace = 200;
        conditions = "license_cop_cAir";
        price = 200000;
        textures[] = {
       			{ "Police", "cop", {
       				"textures\vehicles\polizei_ghost1.jpg",
       				"textures\vehicles\polizei_ghost2.jpg"
       			}, "" }
		      };
    };

    class B_Boat_Transport_01_F {	//Schlauchboot
        vItemSpace = 45;
        conditions = "license_cop_cg";
        price = 3000;
        textures[] = { };
    };

    class O_Truck_03_transport_F {	//Tempest tranport
        vItemSpace = 500;
        conditions = "license_civ_trucking || {playerSide != civilian}";
        price = 2500000;
        textures[] = {};
    };

    class O_Truck_03_device_F {		//Tempest Gerät
        vItemSpace = 450;
        conditions = "license_civ_trucking || {playerSide != civilian}";
        price = 4000000;
        textures[] = {};
    };

    class Land_CargoBox_V1_F {	//Tresor
        vItemSpace = 50000;
        conditions = "";
        price = -1;
        textures[] = {};
    };

    class Box_IND_Grenades_F {	//Kleine Box
        vItemSpace = 1500;
        conditions = "";
        price = -1;
        textures[] = {};
    };

    class B_supplyCrate_F {	//Große Box
        vItemSpace = 3000;
        conditions = "";
        price = -1;
        textures[] = {};
    };

    class B_G_Offroad_01_F {	//Reb Offroad
        vItemSpace = 65;
        conditions = "";
        price = 25000;
        textures[] = {
         			{ "Rebel 1", "reb", {
                         "\A3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa"
                     }, "" },
         			{ "Rebel 2", "reb", {
                         "\A3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_IG_02_CO.paa"
                     }, "" },
         			{ "Rebel 3", "reb", {
                         "\A3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_IG_03_CO.paa"
                     }, "" },
         			{ "Rebel 4", "reb", {
                         "\A3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_IG_04_CO.paa"
                     }, "" },
         			{ "Rebel 5", "reb", {
                         "\A3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_IG_05_CO.paa"
                     }, "" },
         			{ "Rebel 6", "reb", {
                         "\A3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_IG_06_CO.paa"
                     }, "" },
         			{ "Rebel 7", "reb", {
                         "\A3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_IG_07_CO.paa"
                     }, "" },
         			{ "Rebel 8", "reb", {
                         "\A3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_IG_08_CO.paa"
                     }, "" },
         			{ "Rebel 9", "reb", {
                         "\A3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_IG_09_CO.paa"
                     }, "" },
         			{ "Rebel 10", "reb", {
                         "\A3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_IG_10_CO.paa"
                     }, "" },
         			{ "Rebel 11", "reb", {
                         "\A3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_IG_11_CO.paa"
                     }, "" },
         			{ "Rebel 12", "reb", {
                         "\A3\soft_f_bootcamp\Offroad_01\Data\offroad_01_ext_IG_12_CO.paa"
                     }, "" },
         			{ "Rebel 13", "reb", {
                         "\A3\soft_f_gamma\Offroad_01\Data\offroad_01_ext_IG01_CO.paa"
                     }, "" }
         		};
    };

    class C_Boat_Civil_01_F {	//Motorboot
        vItemSpace = 100;
        conditions = "license_civ_boat || {playerSide != civilian}";
        price = 45000;
        textures[] = { };
    };

    class C_Boat_Civil_01_police_F { //Polizeiboot
        vItemSpace = 100;
        conditions = "license_cop_cg";
        price = 20000;
        textures[] = { };
    };

    class B_Truck_01_transport_F {	//Hemmt transport
        vItemSpace = 275;
        conditions = "license_civ_trucking || {playerSide != civilian}";
        price = 500000;
        textures[] = { };
    };

	class B_Truck_01_covered_F {	//Hemmt abgedeckt
        vItemSpace = 550;
        conditions = "license_civ_trucking || {playerSide != civilian}";
        price = 1450000;
        textures[] = {};
    };

	class B_Truck_01_box_F {	//Hemmt Box
        vItemSpace = 600;
        conditions = "license_civ_trucking || {playerSide != civilian}";
        price = 2200000;
        textures[] = {};
    };

    class O_MRAP_02_F {		//Ifrit
        vItemSpace = 60;
        conditions = "license_civ_driver";
        price = 4500000;
        textures[] = {};
    };

    class C_Offroad_01_F {		//Offroader
        vItemSpace = 65;
        conditions = "license_civ_driver || {playerSide != civilian}";
        price = 25000;
        textures[] = {
            { "Red", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"
            }, "" },
            { "Yellow", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa"
            }, "" },
            { "White", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa"
            }, "" },
            { "Blue", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa"
            }, "" },
            { "Dark Red", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa"
            }, "" },
            { "Blue / White", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa"
            }, "" },
            { "Taxi", "civ", {
                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            }, "" },
            { "Polizei", "cop", {
                "textures\vehicles\polizei_offroad.jpg"
            }, "" },
			         { "Feuerwehr", "med", {
                "textures\vehicles\Offrad_Medic.jpg"
            }, "" }
        };
    };

    class C_Kart_01_Blu_F {		//Kart
        vItemSpace = 20;
        conditions = "license_civ_driver";
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
    class C_Kart_01_Red_F : C_Kart_01_Blu_F{};
    class C_Kart_01_Vrana_F : C_Kart_01_Blu_F{};

    class C_Hatchback_01_sport_F {		// Sporti
        vItemSpace = 45;
        conditions = "license_civ_driver || {playerSide != civilian}";
        price = 80000;
        textures[] = {
			{ "Silber", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_CO.paa"
            }, "" },
			{ "Beige", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE01_CO.paa"
            }, "" },
			{ "Grün", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE02_CO.paa"
            }, "" },
			{ "Hell Blau", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE03_CO.paa"
            }, "" },
			{ "Dunkel Blau", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE04_CO.paa"
            }, "" },
			{ "Hell Beige", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE05_CO.paa"
            }, "" },
			{ "Gelb", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE06_CO.paa"
            }, "" },
			{ "Grau", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE07_CO.paa"
            }, "" },
			{ "Dunkel Grau", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE08_CO.paa"
            }, "" },
			{ "Schwarz", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE09_CO.paa"
            }, "" },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"
            }, "" },
            { "Dark Blue", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"
            }, "" },
            { "Orange", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport03_co.paa"
            }, "" },
            { "Black / White", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa"
            }, "" },
            { "Beige", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport05_co.paa"
            }, "" },
            { "Green", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport06_co.paa"
            }, "" },
            { "Polizei", "cop", {
				           "textures\vehicles\polizei_hatchback.jpg"
			         }, "" },
			         { "Feuerwehr", "med", {
                "textures\vehicles\Sporti_Medic.jpg"
            }, "" }
        };
    };

    class B_Quadbike_01_F {		//Quad
        vItemSpace = 25;
        conditions = "license_civ_driver || {playerSide != civilian}";
        price = 5000;
        textures[] = {
            { "Brown", "civ", {
                "\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa"
            }, "" },
            { "Digi Desert", "civ", {
                "\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa"
            }, "" },
            { "Black", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa"
            }, "" },
            { "Blue", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa"
            }, "" },
            { "Red", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa"
            }, "" },
            { "White", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa"
            }, "" },
            { "Digi Green", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa"
            }, "" },
			{ "Fleck Tarn", "civ", {
                "\A3\soft_f_gamma\Quadbike_01\Data\quadbike_01_IG_co.paa"
            }, "" },
			{ "Tarn", "civ", {
                "\A3\Soft_F_bootcamp\Quadbike_01\Data\quadbike_01_IG_co.paa"
            }, "" },
			{ "Tarn", "civ", {
                "\A3\Soft_F_bootcamp\Quadbike_01\Data\quadbike_01_INDP_Hunter_co.paa"
            }, "" },
            { "Rebel Camo", "civ", {
                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
            }, "" }
        };
    };

    class I_Truck_02_covered_F {	//Zamack abgedeckt
        vItemSpace = 250;
        conditions = "license_civ_trucking || {playerSide != civilian}";
        price = 175000;
        textures[] = {
            { "Orange / Blau", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            }, "" },
			{ "Blau", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_blue_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_blue_co.paa"
            }, "" },
			{ "Digi Grün", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_INDP_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_INDP_co.paa"
            }, "" },
			{ "Desert Tarn", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_OPFOR_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_OPFOR_co.paa"
            }, "" },
			{ "Olive", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_blue_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_olive_co.paa"
            }, "" },
            { "Black", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            }, "" }
        };
    };

    class I_Truck_02_transport_F {	//Zamack transport
        vItemSpace = 200;
        conditions = "license_civ_trucking || {playerSide != civilian}";
        price = 135000;
        textures[] = {
            { "Orange / Blau", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            }, "" },
			{ "Blau", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_blue_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_blue_co.paa"
            }, "" },
			{ "Digi Grün", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_INDP_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_INDP_co.paa"
            }, "" },
			{ "Desert Tarn", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_OPFOR_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_OPFOR_co.paa"
            }, "" },
			{ "Olive", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_blue_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_olive_co.paa"
            }, "" },
            { "Black", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            }, "" }
        };
    };

    class O_Truck_03_covered_F {	//Tempest abgedeckt
        vItemSpace = 600;
        conditions = "license_civ_trucking || {playerSide != civilian}";
        price = 3500000;
        textures[] = {};
    };

    class C_Hatchback_01_F {		//Hatchback
        vItemSpace = 40;
        conditions = "license_civ_driver || {playerSide != civilian}";
        price = 20000;
        textures[] = {
            { "Silber", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_CO.paa"
            }, "" },
			      { "Beige", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE01_CO.paa"
            }, "" },
			      { "Grün", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE02_CO.paa"
            }, "" },
			      { "Hell Blau", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE03_CO.paa"
            }, "" },
			      { "Dunkel Blau", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE04_CO.paa"
            }, "" },
			      { "Hell Beige", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE05_CO.paa"
            }, "" },
			      { "Gelb", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE06_CO.paa"
            }, "" },
			      { "Grau", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE07_CO.paa"
            }, "" },
			      { "Dunkel Grau", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE08_CO.paa"
            }, "" },
			      { "Schwarz", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_BASE09_CO.paa"
            }, "" },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"
            }, "" },
            { "Dark Blue", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"
            }, "" },
            { "Orange", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport03_co.paa"
            }, "" },
            { "Black / White", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa"
            }, "" },
            { "Beige", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport05_co.paa"
            }, "" },
            { "Green", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport06_co.paa"
            }, "" },
            { "Police", "cop", {
				"textures\vehicles\polizei_hatchback.jpg"
			}, "" },
			{ "Medic", "med", {
                "textures\vehicles\medic_hatchback.paa"
            }, "" }
        };
    };

    class C_SUV_01_F {		//SUV
        vItemSpace = 50;
        conditions = "license_civ_driver || {playerSide != civilian}";
        price = 60000;
        textures[] = {
            { "Dark Red", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"
            }, "" },
			{ "Schwarz", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa"
            }, "" },
            { "Silber", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"
            }, "" },
            { "Orange", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"
            }, "" },
			{ "Asiimov", "civ", {
                "textures\vehicles\suvASIIMOV.paa"
            }, "" },
			{ "Hyper", "civ", {
                "textures\vehicles\suvHYPER.paa"
            }, "" },
			{ "Sticker Bomb", "civ", {
                "textures\vehicles\suvSTICKER.paa"
            }, "" },
            { "Polizei", "cop", {
                "textures\vehicles\pol_SUV.jpg"
            }, "" },
			{ "Feuerwehr", "med", {
                "textures\vehicles\SUV mEDIC.jpg"
            }, "" }
        };
    };

    class C_Van_01_transport_F {	//Truck
        vItemSpace = 100;
        conditions = "license_civ_driver || {playerSide != civilian}";
        price = 45000;
        textures[] = {
            { "White", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            }, "" },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            }, "" },
			{ "Tarn", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            }, "" },
			{ "Schwarz", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_IG_co.paa"
            }, "" }
        };
    };

    class C_Van_01_box_F {		//Truck Boxer
        vItemSpace = 150;
        conditions = "license_civ_trucking || {playerSide != civilian}";
        price = 75000;
        textures[] = {
            { "White", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            }, "" },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            }, "" },
			      { "Tarn", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_IG_co.paa"
            }, "" },
			      { "Schwarz", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_black_co.paa"
            }, "" },
            { "Feuerwehr", "med", {
                "textures\vehicles\RTW_1.jpg",
                "textures\vehicles\RTW_2.jpg",
            }, "" }
        };
    };

    class B_MRAP_01_F {		//Hunter
        vItemSpace = 65;
        conditions = "license_civ_driver || {playerSide != civilian}";
        price = 5500000;
        textures[] = {
     			{ "Rebel", "reb", {
     				"textures\vehicles\reb_hunter.jpg",
     				"textures\vehicles\reb_hunter2.jpg"
     			}, "" },
     			{ "Polizei", "cop", {
     				"textures\vehicles\pol_hunter.jpg",
     				"textures\vehicles\pol_hunter2.jpg"
     			}, " call life_coplevel >= 5 " },
     			{ "SEK", "cop", {
     				"textures\vehicles\hunter_sek_front1.paa",
     				"textures\vehicles\hunter_sek_hinten1.paa"
     			}, "call life_coplevel >= 7" },
     			{ "Feuerwehr", "med", {
     				"textures\vehicles\Hunter_Medic.paa",
     				"textures\vehicles\Hunter_Medic_2.paa"
     			}, ""},
          { "Admin", "reb", {
     				"textures\vehicles\bw_hunter_front.paa",
     				"textures\vehicles\bw_hunter_back.paa"
     			}, "call life_adminlevel >= 4" }
             };
         };

	class I_MRAP_03_F {		//Strider
        vItemSpace = 65;
        conditions = "license_civ_driver || {playerSide != civilian}";
        price = 7500000;
        textures[] = {
        			{ "Rebel Digi", "reb", {
        				"\a3\soft_f_beta\MRAP_03\Data\MRAP_03_ext_INDP_CO.paa"
        			}, "" },
              { "Rebel Dunkel", "reb", {
        				"\a3\soft_f_beta\MRAP_03\Data\MRAP_03_ext_CO.paa"
        			}, "" },
        			{ "Polizei", "cop", {
        				"textures\vehicles\pol_Strider.jpg"
        			}, " call life_coplevel >= 7 " },
        			{ "SEK", "cop", {
        				"textures\vehicles\strider_sek.paa"
        			}, " call life_coplevel >= 7 && {license_cop_sek}" }
		     };
    };

    class B_Heli_Light_01_F {	//Hummingbird
        vItemSpace = 90;
        conditions = "license_civ_pilot || {license_cop_cAir} || {license_cop_cAirSmall} || {license_med_mAir}";
        price = 250000;
        textures[] = {
			         { "Polizei", "cop", {
                "textures\vehicles\pol_humming.jpg"
            }, "" },
            { "Sheriff", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa"
            }, "" },
            { "Civ Blue", "civ", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"
            }, "" },
            { "Civ Red", "civ", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"
            }, "" },
            { "Blueline", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"
            }, "" },
            { "Elliptical", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"
            }, "" },
            { "Furious", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"
            }, "" },
            { "Jeans Blue", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"
            }, "" },
            { "Speedy Redline", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"
            }, "" },
            { "Sunset", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"
            }, "" },
            { "Vrana", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"
            }, "" },
            { "Waves Blue", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"
            }, "" },
			{ "Gray Watcher", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_graywatcher_co.paa"
            }, "" },
			{ "Light", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_light_co.paa"
            }, "" },
			{ "Shadow", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_shadow_co.paa"
            }, "" },
			{ "Wasp", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa"
            }, "" },
            { "Rebel Digital", "reb", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
            }, "" },
            { "Digi Green", "reb", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa"
            }, "" },
            { "EMS White", "med", {
                "textures\vehicles\Humming_Medic.jpg"
            }, "" }
        };
    };

	class I_Heli_Transport_02_F {	//Mohhawk
        vItemSpace = 250;
        conditions = "license_civ_pilot";
        price = 1500000;
        textures[] = {
			{ "Dahoman", "civ", {
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\Heli_Transport_02_1_dahoman_CO.paa",
				"\a3\air_f_beta\Heli_Transport_02\Data\Skins\Heli_Transport_02_2_dahoman_CO.paa",
				"\a3\air_f_beta\Heli_Transport_02\Data\Skins\Heli_Transport_02_3_dahoman_CO.paa"
            }, "" },
			{ "Ion", "civ", {
                "\a3\air_f_beta\Heli_Transport_02\Data\Skins\Heli_Transport_02_1_ion_CO.paa",
				"\a3\air_f_beta\Heli_Transport_02\Data\Skins\Heli_Transport_02_2_ion_CO.paa",
				"\a3\air_f_beta\Heli_Transport_02\Data\Skins\Heli_Transport_02_3_ion_CO.paa"
            }, "" }
		};
	};

    class C_Heli_Light_01_civil_F : B_Heli_Light_01_F {
        vItemSpace = 10;
        price = 220000;
    };

    class O_Heli_Light_02_unarmed_F {	//Orca
        vItemSpace = 175;
        conditions = "license_civ_pilot || {license_cop_cAir} || {license_med_mAir}";
        price = 1100000;
        textures[] = {
            { "Black", "cop", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa"
            }, "" },
            { "White / Blue", "civ", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"
            }, "" },
            { "Schwarz", "civ", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa"
            }, "" },
            { "Medic", "med", {
                "textures\vehicles\medic_Orca.jpg"
            }, "" }
        };
    };

	class I_Heli_light_03_unarmed_F {	//Hellcat
        vItemSpace = 125;
        conditions = "license_civ_pilot || {playerSide != civilian}";
        price = 4500000;
        textures[] = {
			{ "Digi Grün", "reb", {
				"\a3\air_f_epb\Heli_Light_03\Data\Heli_Light_03_base_INDP_CO.paa"
			}, "" },
			{ "Medic", "med", {
				"textures\vehicles\medic_hellcat.paa"
			}, "" },
			{ "Polizei", "cop", {
				"textures\vehicles\pol_hellcat.jpg"
			}, "" },
			{ "SEK", "cop", {
				"textures\vehicles\hellcat_sek.paa"
			}, "call life_coplevel >= 7 && {license_cop_sek}" }
		};
	};

    class B_SDV_01_F {		//U-Boot
        vItemSpace = 350;
        conditions = "license_civ_boat || {license_cop_cg}";
        price = 1000000;
        textures[] = {};
    };

        class C_Van_01_fuel_F {		//Truck fuel
        vItemSpace = 35;
        vFuelSpace = 5000;
        conditions = "license_civ_trucking || {playerSide != civilian}";
        price = 250000;
        textures[] = {
            { "White", "civ", {
                "\A3\soft_f_gamma\Van_01\data\van_01_ext_co.paa",
                "\A3\soft_f_gamma\Van_01\data\van_01_tank_co.paa"
            }, "" },
            { "Red", "civ", {
                "\A3\soft_f_gamma\Van_01\data\van_01_ext_red_co.paa",
                "\A3\soft_f_gamma\Van_01\data\van_01_tank_red_co.paa"
            }, "" }
        };
    };

    class I_Truck_02_fuel_F {	//Zamack fuel
        vItemSpace = 50;
        vFuelSpace = 10000;
        conditions = "license_civ_trucking || {playerSide != civilian}";
        price = 850000;
        textures[] = {
            { "White", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_fuel_co.paa"
            }, "" }
        };
    };

    class B_Truck_01_fuel_F {	//Hemmt fuel
        vItemSpace = 75;
        vFuelSpace = 30000;
        conditions = "license_civ_trucking || {playerSide != civilian}";
        price = 2500000;
        textures[] = {};
    };

	class B_Heli_Transport_03_unarmed_F {	//Huron
        vItemSpace = 350;
        conditions = "license_civ_pilot || {license_cop_cAir} || {license_med_mAir}";
        price = 2000000;
        textures[] = {
       			{ "Grün", "civ", {
       				"\a3\air_f_heli\heli_transport_03\Data\Heli_Transport_03_ext01_CO.paa",
       				"\a3\air_f_heli\heli_transport_03\Data\Heli_Transport_03_ext02_CO.paa"
       			}, "" },
       			{ "Schwarz", "civ", {
       				"\a3\air_f_heli\Heli_Transport_03\Data\Heli_Transport_03_ext01_black_CO.paa",
       				"\a3\air_f_heli\Heli_Transport_03\Data\Heli_Transport_03_ext02_black_CO.paa"
       			}, "" },
       			{ "Polizei", "cop", {
       				"textures\vehicles\pol_huron1.jpg",
       				"textures\vehicles\pol_huron2.jpg"
       			}, "" },
       			{ "Feuerwehr", "med", {
       				"textures\vehicles\medic_huron1.jpg",
       				"textures\vehicles\medic_huron2.jpg"
       			}, "" }
		};
	};

	class O_Heli_Transport_04_F {	//Taru
        vItemSpace = 100;
        conditions = "license_civ_pilot";
        price = 4500000;
        textures[] = {
			{ "Desert Tarn", "civ", {
				"\a3\air_f_heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_CO.paa",
				"\a3\air_f_heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_CO.paa"
			}, "" },
			{ "Schwarz", "civ", {
				"\a3\air_f_heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_black_CO.paa",
				"\a3\air_f_heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_black_CO.paa"
			}, "" }
		};
	};

	class O_Heli_Transport_04_medevac_F {	//Taru medic
        vItemSpace = 150;
        conditions = "license_med_mAir";
        price = 650000;
        textures[] = {};
	};

	class B_Heli_Attack_01_F {	//Blackfoot
        vItemSpace = 75;
        conditions = "license_civ_pilot || {playerSide != civilian}";
        price = 5500000;
        textures[] = {
			{ "Rebel", "reb", {
				"\A3\air_f_beta\Heli_Attack_01\Data\Heli_Attack_01_CO.paa"
			}, "" },
			{ "Police", "cop", {
				"textures\vehicles\polizei_blackfoot.paa"
			}, "" }
		};
	};

	class O_Heli_Attack_02_F {		//Kajman
        vItemSpace = 100;
        conditions = "license_civ_pilot || {playerSide != civilian}";
        price = 6500000;
        textures[] = {
			{ "Rebel", "reb", {
				"\A3\air_f_beta\Heli_Attack_02\Data\Heli_Attack_02_body1_black_CO.paa",
				"\A3\air_f_beta\Heli_Attack_02\Data\Heli_Attack_02_body2_black_CO.paa"
			}, "" },
		};
	};

	class B_T_VTOL_01_infantry_olive_F {		//Blackfish trupp
        vItemSpace = 350;
        conditions = "license_civ_pilot || {playerSide != civilian}";
        price = 4500000;
        textures[] = {};
	};

	class B_T_VTOL_01_vehicle_blue_F {		//Blackfish vehicle
        vItemSpace = 450;
        conditions = "license_civ_pilot || {playerSide != civilian}";
        price = 5500000;
        textures[] = {};
	};

  class B_T_VTOL_01_vehicle_olive_F {		//Blackfish vehicle
        vItemSpace = 450;
        conditions = "license_civ_pilot || {playerSide != civilian}";
        price = 5500000;
        textures[] = {};
	};

	class O_T_VTOL_02_vehicle_hex_F {		//Xian vehicle
        vItemSpace = 200;
        conditions = "license_civ_pilot || {playerSide != civilian}";
        price = 4250000;
        textures[] = {};
	};

	class O_T_VTOL_02_infantry_grey_F {		//Xian Trupp
        vItemSpace = 200;
        conditions = "license_civ_pilot || {playerSide != civilian}";
        price = 4250000;
        textures[] = {};
	};

  class Land_Wreck_Traw_F {		//Schipwreck
        vItemSpace = 10000000;
        conditions = "";
        price = -1;
        textures[] = {};
	};

  class Land_Wreck_Traw2_F {		//Schipwreck
        vItemSpace = 10000000;
        conditions = "";
        price = -1;
        textures[] = {};
	};
};
