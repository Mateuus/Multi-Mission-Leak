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
            { "C_Van_01_transport_F", { "", "", -1 } },
            { "C_Offroad_02_unarmed_F", { "", "", -1 } } //Apex DLC
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
            { "B_Truck_01_box_F", { "", "", -1 } },
            { "O_Truck_03_device_F", { "", "", -1 } },
            { "C_Van_01_fuel_F", { "", "", -1 } },
            { "I_Truck_02_fuel_F", { "", "", -1 } },
            { "B_Truck_01_fuel_F", { "", "", -1 } }
        };
    };

    class civ_air {
        side = "civ";
        vehicles[] = {
            { "B_Heli_Light_01_F", { "", "", -1 } },
            { "O_Heli_Light_02_unarmed_F", { "", "", -1 } },
            { "C_Plane_Civil_01_F", { "", "", -1 } },
			{ "B_Heli_Transport_03_unarmed_F", { "", "", -1 } },
			{ "I_Heli_Transport_02_F", { "", "", -1 } },
			{"B_T_VTOL_01_infantry_F", { "", "", -1 } }//Apex DLC
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
            { "B_Quadbike_01_F", { "", "", -1 } },
            { "B_G_Offroad_01_F", { "", "", -1 } },
            { "O_MRAP_02_F", { "", "", -1 } },
            { "B_Heli_Light_01_stripped_F", { "", "", -1 } },
            { "B_G_Offroad_01_armed_F", { "", "", -1 } },
			{ "B_MRAP_01_F", { "", "", -1 } },
            { "O_T_LSV_02_unarmed_F", { "", "", -1 } } //Apex DLC

        };
    };

    class med_shop {
        side = "med";
        vehicles[] = {
            { "C_SUV_01_F", { "", "", -1 } },
			{ "B_T_LSV_01_unarmed_F", { "", "", -1 }},
			{ "C_Offroad_01_F", { "", "", -1 } },
			{ "C_Offroad_02_unarmed_F", { "", "", -1 } }, //Apex DLC
			{ "C_Hatchback_01_sport_F", { "", "", -1 } },
			{ "C_Hatchback_01_F", { "", "", -1 } }			
        };
    };

    class med_air_hs {
        side = "med";
        vehicles[] = {
            { "O_Heli_Light_02_unarmed_F", { "", "", -1 } }
        };
    };

    class cop_car {
        side = "cop";
        vehicles[] = {
            { "C_Offroad_01_F", { "", "", -1 } },
            { "C_SUV_01_F", { "", "", -1 } },
            { "C_Hatchback_01_sport_F", { "life_coplevel", "SCALAR", 1 } },
            { "B_MRAP_01_F", { "life_coplevel", "SCALAR", 2 } },
            { "I_MRAP_03_F", { "life_coplevel", "SCALAR", 4 } },
			{ "C_Hatchback_01_F", { "life_coplevel", "SCALAR", 3 } }
        };
    };

    class cop_air {
        side = "cop";
        vehicles[] = {
            { "B_Heli_Light_01_F", { "", "", -1 } },
            { "B_Heli_Transport_01_F", { "life_coplevel", "SCALAR", 3 } }
        };
    };

    class cop_ship {
        side = "cop";
        vehicles[] = {
            { "B_Boat_Transport_01_F", { "", "", -1 } },
            { "C_Boat_Civil_01_police_F", { "", "", -1 } },
            { "B_Boat_Armed_01_minigun_F", { "life_coplevel", "SCALAR", 5 } },
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

    // Apex DLC
    class C_Boat_Transport_02_F {
        vItemSpace = 100;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 10000;
        textures[] = {};
    };

    // Apex DLC
    class C_Offroad_02_unarmed_F {
        vItemSpace = 65;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 30500;
        textures[] = {
            { "Hexa", "civ", {
                "textures\Civ\mb4\hexa.paa",
				}},
				{"Kacke", "civ",{
				"textures\Civ\mb4\kacke.paa",
				}},
				{ "Hello Kitty", "civ",{
					"textures\Civ\mb4\kitty.paa",
				}},
				{ "Mustang", "civ",{
					"textures\Civ\mb4\mustang.paa",
				}},
				{ "EMS", "med",{
					"textures\Medic\EMS-MB4WD.paa",
				}}
        };
    };

    // Apex DLC
    class C_Plane_Civil_01_F {
        vItemSpace = 75;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 150000;
        textures[] = {};
    };
	
	    class B_T_LSV_01_unarmed_F {
        vItemSpace = 75;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 15000;
        textures[] = {
            { "EMS", "med", {
                "textures\Medic\EMS-Prowler0.paa",
				"textures\Medic\EMS-Prowler1.paa",
				"textures\Medic\EMS-Prowler2.paa",
				"textures\Medic\EMS-Prowler3.paa"
            } }
			};
    };
	
	

    // Apex DLC
    class C_Scooter_Transport_01_F {
        vItemSpace = 30;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 2500;
        textures[] = {};
    };
	
	class B_T_VTOL_01_infantry_F {
        vItemSpace = 1860;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 30000000;
        textures[] = {};
    };

    // Apex DLC
    class O_T_LSV_02_unarmed_F {
        vItemSpace = 100;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 1000000;
        textures[] = {};
    };


    class I_Truck_02_medical_F {
        vItemSpace = 150;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 25000;
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
        vItemSpace = 45;
        licenses[] = { {"boat"}, {""}, {""}, {""} };
        price = 5000;
        textures[] = { };
    };

    class B_Heli_Transport_01_F {
        vItemSpace = 200;
        licenses[] = { {""}, {"cAir"}, {""}, {""} };
        price = 200000;
        textures[] = {
            { "Polizei", "cop", {
                "textures\Cop\s.w.a.t_ghosthawk1.paa",
				"textures\Cop\s.w.a.t_ghosthawk2.paa"
            } }
			};
    };

    class B_MRAP_01_hmg_F {
        vItemSpace = 100;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 750000;
        textures[] = {
            { "Police", "cop", {
                "textures\Cop\COP-Hunter.01.paa",
				"textures\Cop\COP-Hunter.02.paa"
            } }
        };
    };
	
	class I_MRAP_03_F {
        vItemSpace = 100;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 750000;
        textures[] = {
            { "Border Patrol", "cop", {
                "textures\Cop\COP-Borderpatrol.paa",
				}},
				{"S.W.A.T", "cop",{
				"textures\Cop\swat_Strider.paa",
				
            } }
        };
    };

    class B_Boat_Armed_01_minigun_F {
        vItemSpace = 175;
        licenses[] = { {""}, {"cg"}, {""}, {""} };
        price = 75000;
        textures[] = { };
    };

    class B_Boat_Transport_01_F {
        vItemSpace = 45;
        licenses[] = { {""}, {"cg"}, {""}, {""} };
        price = 3000;
        textures[] = { };
    };

    class O_Truck_03_transport_F {
        vItemSpace = 685;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 700000;
        textures[] = { 
		{ "Desert", "civ", {
                "textures\Civ\tempest\des_ext01.paa",
                "textures\Civ\tempest\des_ext02.paa",
				"textures\Civ\tempest\des_cargo.paa"
            } },
			{ "UN White", "civ", {
                "textures\Civ\tempest\UN_ext01.paa",
                "textures\Civ\tempest\UN_ext02.paa",
				"textures\Civ\tempest\UN_cargo.paa"
            } },
			{ "Green", "civ", {
                "textures\Civ\tempest\wd_ext01.paa",
                "textures\Civ\tempest\wd_ext02.paa",
				"textures\Civ\tempest\wd_cargo.paa"
            } }
		};
    };
	
	class B_Heli_Transport_03_unarmed_F {
        vItemSpace = 800;
        licenses[] = { {"pilot"}, {""}, {""}, {""} };
        price = 2000000;
        textures[] = { };
    };
	
	class I_Heli_Transport_02_F {
        vItemSpace = 650;
        licenses[] = { {"pilot"}, {""}, {""}, {""} };
        price = 1000000;
        textures[] = { };
    };
	
    class O_Truck_03_device_F {
        vItemSpace = 950;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 8450000;
        textures[] = {
			{ "Desert", "civ", {
                "textures\Civ\tempest\des_ext01.paa",
                "textures\Civ\tempest\des_ext02.paa"
            } },
			{ "UN White", "civ", {
                "textures\Civ\tempest\UN_ext01.paa",
                "textures\Civ\tempest\UN_ext02.paa"
            } },
			{ "Green", "civ", {
                "textures\Civ\tempest\wd_ext01.paa",
                "textures\Civ\tempest\wd_ext02.paa"
            } }
		};
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
        price = 12500;
        textures[] = { };
    };

    class B_G_Offroad_01_armed_F {
        vItemSpace = 65;
        licenses[] = { {"rebel"}, {""}, {""}, {""} };
        price = 3750000;
        textures[] = { };
    };

    class C_Boat_Civil_01_F {
        vItemSpace = 85;
        licenses[] = { {"boat"}, {""}, {""}, {""} };
        price = 22000;
        textures[] = { };
    };

    class C_Boat_Civil_01_police_F {
        vItemSpace = 85;
        licenses[] = { {""}, {"cg"}, {""}, {""} };
        price = 20000;
        textures[] = { };
    };

    class B_Truck_01_box_F {
        vItemSpace = 1500;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 10350000;
        textures[] = { 
            { "Devil", "civ", {
                "textures\Civ\hemmt\devil.paa",
            } },
			{ "Augenkrebs", "civ", {
				"textures\Civ\hemmt\krebs1.paa",
				"textures\Civ\hemmt\krebs2.paa",
				"textures\Civ\hemmt\krebs2.paa"
			}},
			{ "Grass", "civ", {
				"textures\Civ\hemmt\grass1.paa",
				"textures\Civ\hemmt\grass2.paa",
				"textures\Civ\hemmt\grass2.paa"
			}},
			{ "Schwarz", "civ", {
				"textures\Civ\hemmt\schwarz1.paa",
				"textures\Civ\hemmt\schwarz2.paa",
				"textures\Civ\hemmt\schwarz2.paa"
			}},
			{ "Green", "civ", {
				"textures\Civ\hemmt\zikzak1.paa",
				"textures\Civ\hemmt\zikzak2.paa",
				"textures\Civ\hemmt\zikzak2.paa"
			}}
			};
    };

    class B_Truck_01_transport_F {
        vItemSpace = 525;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 275000;
        textures[] = {
            { "Devil", "civ", {
                "textures\Civ\hemmt\devil.paa",
            } },
			{ "Augenkrebs", "civ", {
				"textures\Civ\hemmt\krebs1.paa",
				"textures\Civ\hemmt\krebs2.paa"
			}},
			{ "Grass", "civ", {
				"textures\Civ\hemmt\grass1.paa",
				"textures\Civ\hemmt\grass2.paa"
			}},
			{ "Schwarz", "civ", {
				"textures\Civ\hemmt\schwarz1.paa",
				"textures\Civ\hemmt\schwarz2.paa"
			}},
			{ "Green", "civ", {
				"textures\Civ\hemmt\zikzak1.paa",
				"textures\Civ\hemmt\zikzak2.paa"
			}},
            { "ADAC", "med", {
                "textures\Medic\hemmt_adac.paa",
            } }
			};
    };

    class O_MRAP_02_F {
        vItemSpace = 160;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 2000000;
        textures[] = { 
            { "Blau Tarn", "reb", {
                "textures\Civ\ifrit\blue1.paa",
				"textures\Civ\ifrit\blue2.paa"
            } }	,
            { "Camo", "reb", {
                "textures\Civ\ifrit\camo1.paa",
				"textures\Civ\ifrit\camo2.paa"
            } }	,
            { "Dunkel", "reb", {
                "textures\Civ\ifrit\dark1.paa",
				"textures\Civ\ifrit\dark2.paa"
            } }	,
            { "Forest", "reb", {
                "textures\Civ\ifrit\forest2.paa",
				"textures\Civ\ifrit\forest1.paa"
            } }	,
            { "Orange", "reb", {
                "textures\Civ\ifrit\orange1.paa",
				"textures\Civ\ifrit\orange2.paa"
            } },
			{ "Eis", "reb", {
                "textures\Civ\ifrit\eis1.paa",
				"textures\Civ\ifrit\eis2.paa"
            } },
			{ "Tropic", "reb", {
                "textures\Civ\ifrit\tarn1.paa",
				"textures\Civ\ifrit\tarn2.paa"
            } },
            { "Blau", "reb", {
                "textures\Civ\ifrit\rot1.paa",
				"textures\Civ\ifrit\rot2.paa"
            } }

			};
    };

    class C_Offroad_01_F {
        vItemSpace = 65;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 12500;
        textures[] = {
            { "Schwarz", "civ", {
			"textures\Civ\Offroad\black.paa"
            } },
            { "Cyan", "civ", {
                "textures\Civ\Offroad\cyan.paa"
            } },
            { "Manga", "civ", {
                "textures\Civ\Offroad\manga.paa"
            } },
            { "Tribal", "civ", {
                "textures\Civ\Offroad\tribal.paa"
            } },
            { "Weed", "civ", {
                "textures\Civ\Offroad\weed.paa"
            } },
			{ "Interceptor I", "cop", {
                "textures\Cop\COP-Pickup.weiss.paa"
            } },
			{ "Interceptor II", "cop", {
                "textures\Cop\COP-Pickup.schwarz.paa"
            } },
			{ "EMS", "med", {
                "textures\Medic\EMS-Pickup.paa"
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
        price = 25000;
        textures[] = {
            { "Ghost", "civ", {
                "textures\Civ\hb\ghost.paa"
            } },
            { "Monster", "civ", {
                "textures\Civ\hb\monster.paa"
            } },
            { "Red Gull", "civ", {
                "textures\Civ\hb\redgull.paa"
            } },
            { "Super Mario", "civ", {
                "textures\Civ\hb\smario.paa"
            } },
            { "Ghost", "cop", {
                "textures\Civ\hb\ghost.paa"
            } },
            { "Monster", "cop", {
                "textures\Civ\hb\monster.paa"
            } },
            { "Red Gull", "cop", {
                "textures\Civ\hb\redgull.paa"
            } },
            { "Super Mario", "cop", {
                "textures\Civ\hb\smario.paa"
            } },
			{ "Highspeed Interceptor", "cop", {
                "textures\Cop\COP-Hatchback.weiss.paa"
            } },
			{ "Highspeed Interceptor", "cop", {
                "textures\Cop\COP-Hatchback.schwarz.paa"
            } },
			{ "EMS", "med", {
                "textures\Medic\EMS-Hatchback.paa"
            } }
			
        };
    };

    class B_Quadbike_01_F {
        vItemSpace = 25;
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

    class I_Truck_02_covered_F {
        vItemSpace = 450;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 140000;
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
        vItemSpace = 200;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 75000;
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
        price = 200000;
        textures[] = {
            { "Desert", "civ", {
                "textures\Civ\tempest\des_ext01.paa",
                "textures\Civ\tempest\des_ext02.paa",
				"textures\Civ\tempest\des_cargo.paa",
				"textures\Civ\tempest\des_cover.paa"
            } },
			{ "UN White", "civ", {
                "textures\Civ\tempest\UN_ext01.paa",
                "textures\Civ\tempest\UN_ext02.paa",
				"textures\Civ\tempest\UN_cargo.paa",
				"textures\Civ\tempest\UN_cover.paa"
            } },
			{ "Green", "civ", {
                "textures\Civ\tempest\wd_ext01.paa",
                "textures\Civ\tempest\wd_ext02.paa",
				"textures\Civ\tempest\wd_cargo.paa",
				"textures\Civ\tempest\wd_cover.paa"
            } }
    };
	};

    class C_Hatchback_01_F {
        vItemSpace = 40;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 9500;
        textures[] = {
            { "Ghost", "civ", {
                "textures\Civ\hb\ghost.paa"
            } },
            { "Monster", "civ", {
                "textures\Civ\hb\monster.paa"
            } },
            { "Red Gull", "civ", {
                "textures\Civ\hb\redgull.paa"
            } },
            { "Super Mario", "civ", {
                "textures\Civ\hb\smario.paa"
            } },
            { "Ghost", "cop", {
                "textures\Civ\hb\ghost.paa"
            } },
            { "Monster", "cop", {
                "textures\Civ\hb\monster.paa"
            } },
            { "Red Gull", "cop", {
                "textures\Civ\hb\redgull.paa"
            } },
            { "Super Mario", "cop", {
                "textures\Civ\hb\smario.paa"
            } },
			{ "Highspeed Interceptor I", "cop", {
                "textures\Cop\COP-Hatchback.weiss.paa"
            } },
			{ "Highspeed Interceptor II", "cop", {
                "textures\Cop\COP-Hatchback.schwarz.paa"
            } },
			{ "EMS", "med", {
                "textures\Medic\EMS-Hatchback.paa"
            } }
        };
    };

    class C_SUV_01_F {
        vItemSpace = 50;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 30000;
        textures[] = {
      { "Batman", "civ", {
        "textures\Civ\SUV\batman.paa"
      } },
			{ "Camo", "civ", {
				"textures\Civ\SUV\camo.paa"
			} },
			{ "Dark Camo", "civ", {
				"textures\Civ\SUV\dcamo.paa"
			} },
			{ "Fast", "civ", {
				"textures\Civ\SUV\fast.paa"
			} },
			{ "Ferrari", "civ", {
				"textures\Civ\SUV\ferrari.paa"
			} },
			{ "Hello Kitty", "civ", {
				"textures\Civ\SUV\kitty.paa"
			} },
			{ "Monster", "civ", {
				"textures\Civ\SUV\monster.paa"
			} },
			{ "Race", "civ", {
				"textures\Civ\SUV\race.paa"
			} },
			{ "Skull", "civ", {
				"textures\Civ\SUV\skull.paa"
			} },
			{ "Taxi", "civ", {
				"textures\Civ\SUV\taxi.paa"
			} },
			{ "Zombie", "civ", {
				"textures\Civ\SUV\ZOMBIE_1.paa"
			} },
			{ "Joker", "civ", {
				"textures\Civ\SUV\Joker_Suv.paa"
			} },
			{ "Interceptor I", "cop", {
				"textures\Cop\COP-SUV.weiss.paa"
			} },
			{ "Interceptor II", "cop", {
				"textures\Cop\COP-SUV.schwarz.paa"
			}},
			{ "EMS", "med", {
				"textures\Medic\EMS-SUV.paa"
			}}
        };
    };

    class C_Van_01_transport_F {
        vItemSpace = 100;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        price = 50000;
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
        price = 60000;
        textures[] = {
            { "White", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } },
			{ "Eiswagen", "civ", {
				"textures\Civ\truck\eis1.paa",
				"textures\Civ\truck\eis2.paa"
			} }
        };
    };

    class B_MRAP_01_F {
        vItemSpace = 65;
        licenses[] = { {""}, {""}, {""}, {""} };
        price = 1500000;
        textures[] = {
            { "S.W.A.T", "cop", {
			"textures\Cop\s.w.a.t._hunter1.paa",
			"textures\Cop\s.w.a.t._hunter2.paa"
            } },
			{"Tarn Decke", "reb", {
				"textures\Civ\hunter\huntertarn1.paa",
				"textures\Civ\hunter\huntertarn2.paa"
			}},
			{"Fuck You", "reb", {
				"textures\Civ\hunter\fuck1.paa",
				"textures\Civ\hunter\fuck2.paa"
			}}			
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

    class B_Heli_Light_01_F {
        vItemSpace = 90;
        licenses[] = { {"pilot"}, {"cAir"}, {"mAir"}, {""} };
        price = 245000;
        textures[] = {
            { "Polizei", "cop", {
                "textures\Cop\COP-Hummingbird.paa"
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
                "textures\Medic\hummingbird.paa"
            } }
        };
    };

    class C_Heli_Light_01_civil_F : B_Heli_Light_01_F {
        vItemSpace = 75;
        price = 245000;
    };

    class O_Heli_Light_02_unarmed_F {
        vItemSpace = 210;
        licenses[] = { {"pilot" }, {""}, {"mAir"}, {""} };
        price = 750000;
        textures[] = {
            { "Black", "cop", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa"
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
                "textures\Medic\medorc.paa"
            } }
        };
    };

    class B_SDV_01_F {
        vItemSpace = 50;
        licenses[] = { {"boat"}, {"cg"}, {""}, {""} };
        price = 150000;
        textures[] = {};
    };

        class C_Van_01_fuel_F {
        vItemSpace = 190;
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
        vItemSpace = 340;
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
        vItemSpace = 500;
        vFuelSpace = 50000;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        price = 250000;
        textures[] = {
			{ "Schwarz", "civ", {
				"textures\Civ\hemmt\schwarz1.paa",
				"textures\Civ\hemmt\schwarz2.paa",
				"textures\Civ\hemmt\schwarz2.paa"
			}},
			{ "Green", "civ", {
				"textures\Civ\hemmt\zikzak1.paa",
				"textures\Civ\hemmt\zikzak2.paa",
				"textures\Civ\hemmt\zikzak2.paa"
			}}
			};
    };
};
