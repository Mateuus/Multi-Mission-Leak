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
		title = "Zivilisten Fahrzeuge";
        conditions = "license_civ_driver";
        vehicles[] = {
            {
                "C_Offroad_01_F",
                ""
            },
            {
                "C_SUV_01_F",
                ""
            },
            {
                "C_Hatchback_01_F",
                ""
            },
            {
                "C_Hatchback_01_sport_F",
                ""
            },
            {
                "C_Offroad_02_unarmed_F",
                ""
            }, //Apex DLC
            {
                "C_Van_01_box_F",
                ""
            },
            {
                "C_Van_01_transport_F",
                ""
            },
            {
                "C_Van_01_fuel_F",
                ""
            }
        };
    };

    class kart_shop {
        side = "civ";
		title = "Kart Shop";
        conditions = "";
        vehicles[] = {
            {
                "C_Kart_01_Blu_F",
                ""
            },
            {
                "C_Kart_01_Fuel_F",
                ""
            },
            {
                "C_Kart_01_Red_F",
                ""
            },
            {
                "C_Kart_01_Vrana_F",
                ""
            },
            {
              "C_Kart_01_F",
              ""
            },
            {
              "C_Kart_01_green_F",
              ""
            },
            {
              "C_Kart_01_orange_F",
              ""
            },
            {
              "C_Kart_01_white_F",
              ""
            },
            {
              "C_Kart_01_yellow_F",
              ""
            },
            {
              "C_Kart_01_black_F",
              ""
            }
        };
    };

    class civ_truck {
        side = "civ";
		title = "Zivilisten Lastkraftwagen";
        conditions = "license_civ_trucking";
        vehicles[] = {
            {
                "I_Truck_02_covered_F",
                ""
            },
            {
                "I_Truck_02_fuel_F",
                ""
            },
            {
                "I_Truck_02_transport_F",
                ""
            },
            {
                "B_Truck_01_box_F",
                ""
            },
            {
                "B_Truck_01_transport_F",
                ""
            },
            {
                "B_Truck_01_fuel_F",
                ""
            },
            {
                "B_Truck_01_covered_F",
                ""
            },
            {
              "B_Truck_01_ammo_F",
              ""
            },
            {
              "O_Truck_03_transport_F",
              ""
            },
            {
              "O_Truck_03_covered_F",
              ""
            },
            {
              "O_Truck_03_fuel_F",
              ""
            },
            {
              "O_Truck_03_ammo_F",
              ""
            },
            {
              "O_Truck_03_device_F",
              ""
            }
        };
    };

    class civ_air {
        side = "civ";
		title = "Zivilisten Luftfahrzeuge";
        conditions = "license_civ_pilot";
        vehicles[] = {
            {
                "C_Heli_Light_01_civil_F",
                ""
            },
            {
                "O_Heli_Light_02_unarmed_F",
                ""
            },
            {
                "I_Heli_Transport_02_F",
                ""
            },
            {
                "B_Heli_Transport_03_unarmed_F",
                ""
            },
            {
                "C_Plane_Civil_01_F",
                ""
            }, //Apex DLC
            {
                "C_Plane_Civil_01_racing_F",
                ""
            }, //Apex DLC
            {
                "B_Heli_Light_01_F",
                ""
            }
        };
    };

    class civ_ship {
        side = "civ";
		title = "Zivilisten Bootshop";
        conditions = "license_civ_boat";
        vehicles[] = {
            {
                "C_Rubberboat",
                ""
            },
            {
                "C_Boat_Civil_01_F",
                ""
            },
            {
                "C_Boat_Transport_02_F",
                ""
            }, //Apex DLC
            {
                "C_Scooter_Transport_01_F",
                ""
            } //Apex DLC
        };
    };

    class reb_car {
        side = "civ";
		title = "Rebellen Fahrzeuge";
        conditions = "license_civ_rebel";
        vehicles[] = {
            {
              "C_Hatchback_01_F",
              ""
            },
            {
              "I_G_Offroad_01_F",
              ""
            },
            {
              "I_C_Van_01_transport_F",
              ""
            },
            {
              "I_G_Van_01_fuel_F",
              ""
            },
            {
              "C_Hatchback_01_sport_F",
              ""
            },
            {
                "O_MRAP_02_F",
                ""
            },
            {
                "O_MRAP_02_hmg_F",
                ""
            },
            {
                "O_T_LSV_02_unarmed_F",
                ""
            }, //Apex DLC
            {
                "O_T_LSV_02_armed_F",
                ""
            },
            {
              "B_MRAP_01_F",
              ""
            },
            {
              "I_MRAP_03_F",
              ""
            },
            {
              "B_G_Offroad_01_armed_F",
              ""
            },
            {
              "B_T_LSV_01_unarmed_F",
              ""
            }
        };
    };

    class reb_air {
        side = "civ";
		title = "Rebellen Luftfahrzeuge";
        conditions = "license_civ_rebel";
        vehicles[] = {
            {
                "O_T_VTOL_02_infantry_F",
                ""
            }, //Apex DLC
            {
                "O_Heli_Transport_04_bench_F",
                ""
            },
            {
                "O_Heli_Transport_04_covered_F",
                ""
            },
            {
                "O_Heli_Transport_04_fuel_F",
                ""
            },
            {
                "O_Heli_Transport_04_F",
                ""
            },
            {
                "O_Heli_Light_02_unarmed_F",
                ""
            },
            {
                "B_Heli_Light_01_F",
                ""
            },
            {
                "O_T_VTOL_02_vehicle_F",
                ""
            },
            {
              "B_T_VTOL_01_infantry_F",
              ""
            },
            {
              "B_T_VTOL_01_vehicle_F",
              ""
            }
        };
    };

    class med_shop {
        side = "med";
		title = "Feuerwehr Fahrzeuge";
        conditions = "";
        vehicles[] = {
            {
                "C_Offroad_01_F",
                "call life_mediclevel >= 1"
            }, //Apex DLC
            {
                "C_Offroad_02_unarmed_F",
                "call life_mediclevel >= 1"
            }, //Apex DLC
            {
                "C_SUV_01_F",
                "call life_mediclevel >= 3"
            },
            {
                "B_MRAP_01_F",
                "call life_mediclevel >= 6"
            },
            {
                "C_Hatchback_01_sport_F",
                "call life_mediclevel >= 4"
            },
            {
                "O_Truck_03_repair_F",
                "call life_mediclevel >= 6"
            },
        };
    };

    class med_air {
        side = "med";
		title = "Feuerwehr Luftfahrzeuge";
        conditions = "license_med_mAir";
        vehicles[] = {
            {
                "B_Heli_Light_01_F",
                "call life_mediclevel >= 1"
            },
            {
                "O_Heli_Light_02_unarmed_F",
                "call life_mediclevel >= 2"
            },
            {
                "I_Heli_light_03_unarmed_F",
                "call life_mediclevel >= 4"
            },
            {
                "O_T_VTOL_02_infantry_F",
                "call life_mediclevel >= 5"
            }
        };
    };

    class cop_car {
        side = "cop";
		title = "Polizei Fahrzeuge";
        conditions = "";
        vehicles[] = {
            {
                "C_Offroad_01_F",
                ""
            },
            {
              "C_Offroad_02_unarmed_F",
              "call life_coplevel >= 2"
            },
            {
                "C_SUV_01_F",
                "call life_coplevel >= 2"
            },
            {
                "C_Hatchback_01_sport_F",
                "call life_coplevel >= 3"
            },
            {
                "B_MRAP_01_F",
                "call life_coplevel >= 4"
            },
            {
                "B_MRAP_01_hmg_F",
                "call life_coplevel >= 6"
            },
            {
                "B_T_LSV_01_unarmed_F",
                "call life_coplevel >= 4"
            },
            {
                "B_Quadbike_01_F",
                "call life_coplevel >= 7"
            },
            {
                "I_MRAP_03_F",
                "call life_coplevel >= 5"
            },
            {
                "O_MRAP_02_F",
                "call life_coplevel >= 6"
            }
        };
    };

    class cop_air {
        side = "cop";
		title = "Polizei Luftfahrzeuge";
        conditions = "license_cop_cAir";
        vehicles[] = {
            {
                "B_Heli_Light_01_F",
                "call life_coplevel >= 2"
            },
            {
                "I_Heli_light_03_unarmed_F",
                "call life_coplevel >= 3"
            },
            {
                "C_Plane_Civil_01_racing_F",
                "call life_coplevel >= 4"
            },
            {
                "B_Heli_Transport_01_F",
                "call life_coplevel >= 5"
            },
            {
                "B_Heli_Transport_03_unarmed_F",
                "call life_coplevel >= 5"
            },
            {
                "B_Heli_Attack_01_F",
                "call life_coplevel >= 7"
            },
            {
              "B_T_VTOL_01_infantry_F",
              "call life_coplevel >= 7"
            },
            {
              "B_T_VTOL_01_vehicle_F",
              "call life_coplevel >= 7"
            }
        };
    };

    class cop_ship {
        side = "cop";
		title = "Polizei Bootshop";
        conditions = "";
        vehicles[] = {
            {
                "B_Boat_Armed_01_minigun_F",
                "call life_coplevel >= 3"
            },
            {
                "B_Boat_Transport_01_F",
                "call life_coplevel >= 3"
            }
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
        conditions = "";
        price_civ = -1;
        price_cop = -1;
        price_med = -1;
        textures[] = {};
    };

    // Apex DLC
    class C_Boat_Transport_02_F {
        vItemSpace = 100;
        conditions = "license_civ_boat";
        price_civ = 10000;
        price_cop = 10000;
        price_med = 10000;
        textures[] = {
            {
                "Blau_Weiß",
                "civ",
                {
                    "a3\boat_f_exp\boat_transport_02\data\boat_transport_02_exterior_civilian_co.paa",
                    "a3\boat_f_exp\boat_transport_02\data\boat_transport_02_interior_2_civilian_co.paa"
                }
            }
        };
    };

    // Apex DLC
    class C_Offroad_02_unarmed_F {
        vItemSpace = 200;
        conditions = "license_civ_driver";
        price_civ = 45000;
        price_cop = 30000;
        price_med = 30000;
        textures[] = {
            {
                "Schwarz",
                "civ",
                {
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_ext_black_co.paa",
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_ext_black_co.paa",
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_int_black_co.paa",
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_int_black_co.paa"
                }
            },
            {
                "Blau",
                "civ",
                {
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_ext_blue_co.paa",
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_ext_blue_co.paa",
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_int_blue_co.paa",
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_int_blue_co.paa"
                }
            },

            {
                "Grün",
                "civ",
                {
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_ext_green_co.paa",
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_ext_green_co.paa",
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_int_green_co.paa",
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_int_green_co.paa"
                }
            },
            {
                "Orange",
                "civ",
                {
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_ext_orange_co.paa",
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_ext_orange_co.paa",
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_int_orange_co.paa",
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_int_orange_co.paa"
                }
            },
            {
                "Rot",
                "civ",
                {
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_ext_red_co.paa",
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_ext_red_co.paa",
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_int_red_co.paa",
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_int_red_co.paa"
                }
            },
            {
                "Weiß",
                "civ",
                {
                    "a3\soft_f_exp\offroad_02\data\offroad_02_ext_white_co.paa",
                    "a3\soft_f_exp\offroad_02\data\offroad_02_ext_white_co.paa",
                    "a3\soft_f_exp\offroad_02\data\offroad_02_int_white_co.paa",
                    "a3\soft_f_exp\offroad_02\data\offroad_02_int_white_co.paa"
                }
            },
            {
                "Polizei",
                "cop",
                {
                    "texture\cop\pol_jeep.jpg"
                }
            },
            {
                "Feuerwehr",
                "med",
                {
                    "texture\fw\fw_jeep.jpg"
                }
            }
        };
    };

    // Apex DLC
    class C_Plane_Civil_01_F {
        vItemSpace = 150;
        conditions = "license_civ_pilot";
        price_civ = 400000;
        price_cop = 400000;
        price_med = 400000;
        textures[] = {
            {
                "Rennen (Tan Interior)",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
                }
            },
            {
                "Rennen",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
                }
            },
            {
                "Red Line (Tan Interior)",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
                }
            },
            {
                "Red Line",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
                }
            },
            {
                "Tribal (Tan Interior)",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
                }
            },
            {
                "Tribal",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
                }
            },
            {
                "Blue Wave (Tan Interior)",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
                }
            },
            {
                "Blue Wave",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
                }
            }
        };
    };

    // Apex DLC
    class C_Plane_Civil_01_racing_F {
        vItemSpace = 150;
        conditions = "license_civ_pilot";
        price_civ = 600000;
        price_cop = 600000;
        price_med = 600000;
        textures[] = {
            {
                "Rennen (Tan Interior)",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
                }
            },
            {
                "Rennen",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
                }
            },
            {
                "Red Line (Tan Interior)",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
                }
            },
            {
                "Red Line",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
                }
            },
            {
                "Tribal (Tan Interior)",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
                }
            },
            {
                "Tribal",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
                }
            },
            {
                "Blue Wave (Tan Interior)",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
                }
            },
            {
                "Blue Wave",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
                }
            }
        };
    };

    // Apex DLC
    class C_Scooter_Transport_01_F {
        vItemSpace = 30;
        conditions = "";
        price_civ = 25000;
        price_cop = 25000;
        price_med = 25000;
        textures[] = {
            {
                "Rot",
                "civ",
                {
                    "\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_co.paa",
                    "\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_vp_co.paa"
                }
            },
            {
                "Blau",
                "civ",
                {
                    "\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_blue_co.paa",
                    "\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_vp_blue_co.paa"
                }
            },
            {
                "Schwarz",
                "civ",
                {
                    "\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_black_co.paa",
                    "\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_vp_black_co.paa"
                }
            },
            {
                "Grün",
                "civ",
                {
                    "\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_lime_co.paa",
                    "\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_vp_lime_co.paa"
                }
            },
            {
                "Grau",
                "civ",
                {
                    "\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_grey_co.paa",
                    "\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_vp_grey_co.paa"
                }
            },
        };
    };

    // Apex DLC
    class O_T_LSV_02_unarmed_F {
        vItemSpace = 100;
        conditions = "license_civ_driver";
        price_civ = 1500000;
        price_cop = 1500000;
        price_med = 1500000;
        textures[] = {
            {
                "Grüne Tarnung",
                "civ",
                {
                    "a3\soft_f_exp\lsv_02\data\csat_lsv_01_ghex_co.paa",
                    "a3\soft_f_exp\lsv_02\data\csat_lsv_02_ghex_co.paa",
                }
            },
            {
                "Trockene Tarnung",
                "civ",
                {
                    "a3\soft_f_exp\lsv_02\data\csat_lsv_01_arid_co.paa",
                    "a3\soft_f_exp\lsv_02\data\csat_lsv_02_arid_co.paa",
                }
            }
        };
    };

    // Apex DLC
    class O_T_LSV_02_armed_F {
        vItemSpace = 100;
        conditions = "license_civ_driver";
        price_civ = 8500000;
        price_cop = 8500000;
        price_med = 8500000;
        textures[] = {
          {
              "Grüne Tarnung",
              "civ",
              {
                  "a3\soft_f_exp\lsv_02\data\csat_lsv_01_ghex_co.paa",
                  "a3\soft_f_exp\lsv_02\data\csat_lsv_02_ghex_co.paa",
                  "a3\soft_f_exp\lsv_02\data\csat_lsv_03_ghex_co.paa"
              }
          },
          {
              "Trockene Tarnung",
              "civ",
              {
                  "a3\soft_f_exp\lsv_02\data\csat_lsv_01_arid_co.paa",
                  "a3\soft_f_exp\lsv_02\data\csat_lsv_02_arid_co.paa",
                  "a3\soft_f_exp\lsv_02\data\csat_lsv_03_arid_co.paa"
              }
          }
        };
    };

    // Apex DLC
    class B_T_VTOL_01_vehicle_F {
        vItemSpace = 2500;
        conditions = "license_civ_pilot || {license_cop_cAir}";
        price_civ = 35000000;
        price_cop = 3500000;
        price_med = 3500000;
        textures[] = {
            {
                "Olive",
                "cop",
                {
                    "a3\air_f_exp\vtol_01\data\vtol_01_ext01_olive_co.paa",
                    "a3\air_f_exp\vtol_01\data\vtol_01_ext02_olive_co.paa",
                    "a3\air_f_exp\vtol_01\data\vtol_01_ext03_olive_co.paa",
                    "a3\air_f_exp\vtol_01\data\vtol_01_ext04_olive_co.paa"
                }
            },
            {
                "Olive",
                "civ",
                {
                    "a3\air_f_exp\vtol_01\data\vtol_01_ext01_olive_co.paa",
                    "a3\air_f_exp\vtol_01\data\vtol_01_ext02_olive_co.paa",
                    "a3\air_f_exp\vtol_01\data\vtol_01_ext03_olive_co.paa",
                    "a3\air_f_exp\vtol_01\data\vtol_01_ext04_olive_co.paa"
                }
            },
            {
                "Blau",
                "cop",
                {
                    "a3\air_f_exp\vtol_01\data\vtol_01_ext01_blue_co.paa",
                    "a3\air_f_exp\vtol_01\data\vtol_01_ext02_blue_co.paa",
                    "a3\air_f_exp\vtol_01\data\vtol_01_ext03_blue_co.paa",
                    "a3\air_f_exp\vtol_01\data\vtol_01_ext04_blue_co.paa"
                }
            }
        };
    };

    class B_T_VTOL_01_infantry_F {
        vItemSpace = 2000;
        conditions = "license_civ_pilot || {license_cop_cAir}";
        price_civ = 30000000;
        price_cop = 3500000;
        price_med = 3500000;
        textures[] = {
            {
                "Olive",
                "cop",
                {
                    "a3\air_f_exp\vtol_01\data\vtol_01_ext01_olive_co.paa",
                    "a3\air_f_exp\vtol_01\data\vtol_01_ext02_olive_co.paa",
                    "a3\air_f_exp\vtol_01\data\vtol_01_ext03_olive_co.paa",
                    "a3\air_f_exp\vtol_01\data\vtol_01_ext04_olive_co.paa"
                }
            },
            {
                "Olive",
                "civ",
                {
                    "a3\air_f_exp\vtol_01\data\vtol_01_ext01_olive_co.paa",
                    "a3\air_f_exp\vtol_01\data\vtol_01_ext02_olive_co.paa",
                    "a3\air_f_exp\vtol_01\data\vtol_01_ext03_olive_co.paa",
                    "a3\air_f_exp\vtol_01\data\vtol_01_ext04_olive_co.paa"
                }
            },
            {
                "Blau",
                "cop",
                {
                    "a3\air_f_exp\vtol_01\data\vtol_01_ext01_blue_co.paa",
                    "a3\air_f_exp\vtol_01\data\vtol_01_ext02_blue_co.paa",
                    "a3\air_f_exp\vtol_01\data\vtol_01_ext03_blue_co.paa",
                    "a3\air_f_exp\vtol_01\data\vtol_01_ext04_blue_co.paa"
                }
            }
        };
    };


    class O_Truck_03_repair_F {
        vItemSpace = 50;
        conditions = "";
        price_civ = 2500000;
        price_cop = 2500000;
        price_med = 250000;
        textures[] = {
            {
                "Feuerwehr",
                "fed",
                {
                    "texture\med\truck_03_ext01_co.paa",
                    "texture\med\truck_03_ext02_co.paa",
                    "texture\med\truck_03_ammo_co.paa",
                    "texture\med\truck_03_cargo_co.paa"
                }
            }
        };
    };

    class O_Heli_Transport_04_covered_F {
        vItemSpace = 1000;
        conditions = "license_civ_pilot || {license_med_mAir}";
        price_civ = 13000000;
        price_cop = 13000000;
        price_med = 13000000;
        textures[] = {
            {
                "Braune Tarnung",
                "civ",
                {
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_co.paa",
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_co.paa",
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_pod_ext01_co.paa",
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_pod_ext02_co.paa"
                }
            },
            {
                "Schwarz",
                "civ",
                {
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_black_co.paa",
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_black_co.paa",
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_pod_ext01_black_co.paa",
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_pod_ext02_black_co.paa"
                }
            }
        };
    };

    class O_Heli_Transport_04_bench_F {
        vItemSpace = 950;
        conditions = "license_civ_pilot";
        price_civ = 12000000;
        price_cop = 12000000;
        price_med = 12000000;
        textures[] = {
            {
                "Braune Tarnung",
                "civ",
                {
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_co.paa",
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_co.paa",
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_bench_co.paa"
                }
            },
            {
                "Schwarz",
                "civ",
                {
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_black_co.paa",
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_black_co.paa",
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_bench_black_co.paa"
                }
            }
        };
    };

    class O_Heli_Transport_04_fuel_F {
        vItemSpace = 950;
        conditions = "license_civ_pilot";
        price_civ = 12000000;
        price_cop = 12000000;
        price_med = 12000000;
        textures[] = {
            {
                "Braune Tarnung",
                "civ",
                {
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_co.paa",
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_co.paa",
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_fuel_co.paa"
                }
            },
            {
                "Schwarz",
                "civ",
                {
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_black_co.paa",
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_black_co.paa",
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_fuel_black_co.paa"
                }
            }
        };
    };

    class O_Heli_Transport_04_F {
        vItemSpace = 900;
        conditions = "license_civ_pilot";
        price_civ = 11000000;
        price_cop = 11000000;
        price_med = 11000000;
        textures[] = {
            {
                "Braune Tarnung",
                "civ",
                {
                    "\A3\air_f_heli\Heli_Transport_04\data\heli_transport_04_base_01_co.paa",
                    "\A3\air_f_heli\Heli_Transport_04\data\heli_transport_04_base_02_co.paa"
                }
            },
            {
                "Schwarz",
                "civ",
                {
                    "\A3\air_f_heli\Heli_Transport_04\data\heli_transport_04_base_01_black_co.paa",
                    "\A3\air_f_heli\Heli_Transport_04\data\heli_transport_04_base_02_black_co.paa"
                }
            }
        };
    };

    class I_MRAP_03_F {
        vItemSpace = 50;
        conditions = "";
        price_civ = 6500000;
        price_cop = 950000;
        price_med = 950000;
        textures[] = {
            {
                "Polizei",
                "cop",
                {
                    "texture\cop\pol_strider.jpg"
                }
            },
            {
                "Grau",
                "civ",
                {
                    "\A3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa",
                    "\A3\data_f\vehicles\turret_co.paa"
                }
            },
            {
              "Grüne Tarnung",
              "a3\soft_f_beta\mrap_03\data\mrap_03_ext_indp_co.paa",
              "a3\data_f\vehicles\turret_indp_co.paa"
            }
        };
    };

    class B_T_LSV_01_unarmed_F {
        vItemSpace = 350;
        conditions = "";
        price_civ = 2000000;
        price_cop = 100000;
        price_med = 100000;
        textures[] = {
            {
                "Polizei",
                "fed",
                {
                    "texture\cop\prowler_mp_1.paa",
                    "texture\cop\prowler_mp_2.paa",
                    "texture\cop\prowler_mp_3.paa",
                    "texture\cop\prowler_mp_4.paa"
                }
            },
            {
                "Grün",
                "civ",
                {
                    "a3\soft_f_exp\lsv_01\data\nato_lsv_01_olive_co.paa",
                    "a3\soft_f_exp\lsv_01\data\nato_lsv_02_olive_co.paa",
                    "a3\soft_f_exp\lsv_01\data\nato_lsv_03_olive_co.paa",
                    "a3\soft_f_exp\lsv_01\data\nato_lsv_adds_olive_co.paa"
                }
            },
            {
                "Sand",
                "civ",
                {
                    "a3\soft_f_exp\lsv_01\data\nato_lsv_01_sand_co.paa",
                    "a3\soft_f_exp\lsv_01\data\nato_lsv_02_sand_co.paa",
                    "a3\soft_f_exp\lsv_01\data\nato_lsv_03_sand_co.paa",
                    "a3\soft_f_exp\lsv_01\data\nato_lsv_adds_sand_co.paa"
                }
            },
            {
                "Schwarz",
                "civ",
                {
                    "a3\soft_f_exp\lsv_01\data\nato_lsv_01_black_co.paa",
                    "a3\soft_f_exp\lsv_01\data\nato_lsv_02_black_co.paa",
                    "a3\soft_f_exp\lsv_01\data\nato_lsv_03_black_co.paa",
                    "a3\soft_f_exp\lsv_01\data\nato_lsv_adds_black_co.paa"
                }
            }
        };
    };

    class C_Rubberboat {
        vItemSpace = 45;
        conditions = "license_civ_boat";
        price_civ = 5000;
        price_cop = 5000;
        price_med = 5000;
        textures[] = {
            {
                "Orange",
                "civ",
                {
                    "\A3\boat_f\Boat_Transport_01\data\boat_transport_01_rescue_co.paa"
                }
            }
        };
    };

    class B_Heli_Transport_01_F {
        vItemSpace = 200;
        conditions = "license_civ_pilot || {license_cop_cAir}";
        price_civ = 9000000;
        price_cop = 500000;
        price_med = 500000;
        textures[] = {
            {
                "Schwarz",
                "cop",
                {
                    "a3\air_f_beta\heli_transport_01\data\heli_transport_01_ext01_co.paa",
                    "a3\air_f_beta\heli_transport_01\data\heli_transport_01_ext02_co.paa"
                }
            },
            {
                "Olive",
                "cop",
                {
                    "a3\air_f_beta\heli_transport_01\data\heli_transport_01_ext01_blufor_co.paa",
                    "a3\air_f_beta\heli_transport_01\data\heli_transport_01_ext02_blufor_co.paa"
                }
            },
            {
                "Olive Gemustert",
                "cop",
                {
                    "a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_tropic_co.paa",
                    "a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext02_tropic_co.paa"
                }
            },
            {
                "Sand Gemustert",
                "cop",
                {
                    "a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext01_sand_co.paa",
                    "a3\air_f_exp\heli_transport_01\data\heli_transport_01_ext02_sand_co.paa"
                }
            }
        };
    };

    class B_MRAP_01_hmg_F {
        vItemSpace = 100;
        conditions = "";
        price_civ = 10000000;
        price_cop = 950000;
        price_med = 500000;
        textures[] = {
            {
                "Polizei",
                "cop",
                {
                    "texture\cop\pol_hunterv.jpg",
                    "texture\cop\pol_hunterh.jpg",
                    "a3\data_f\vehicles\turret_co.paa"
                }
            }
        };
    };

    class B_Boat_Armed_01_minigun_F {
        vItemSpace = 175;
        conditions = "license_cop_cg";
        price_civ = 100000;
        price_cop = 50000;
        price_med = 500000;
        textures[] = {};
    };

    class B_Boat_Transport_01_F {
        vItemSpace = 45;
        conditions = "license_cop_cg";
        price_civ = 10000;
        price_cop = 5000;
        price_med = 50000;
        textures[] = {};
    };

    class O_Truck_03_transport_F {
        vItemSpace = 1200;
        conditions = "license_civ_trucking";
        price_civ = 3500000;
        price_cop = 3500000;
        price_med = 3500000;
        textures[] = {
            {
                "Braune Tarnung",
                "civ",
                {
                    "a3\soft_f_epc\truck_03\data\truck_03_ext01_co.paa",
                    "a3\soft_f_epc\truck_03\data\truck_03_ext02_co.paa",
                    "a3\soft_f_epc\truck_03\data\truck_03_cargo_co.paa"
                }
            },
            {
                "Grüne Tarnung",
                "civ",
                {
                    "a3\soft_f_exp\truck_03\data\truck_03_ext01_ghex_co.paa",
                    "a3\soft_f_epc\truck_03\data\truck_03_ext02_ghex_co.paa",
                    "a3\soft_f_epc\truck_03\data\truck_03_cargo_ghex_co.paa"
                }
            }
        };
    };

    class O_Truck_03_device_F {
        vItemSpace = 1300;
        conditions = "license_civ_trucking";
        price_civ = 20000000;
        price_cop = 20000000;
        price_med = 20000000;
        textures[] = {
            {
                "Braune Tarnung",
                "civ",
                {
                    "a3\soft_f_epc\truck_03\data\truck_03_ext01_co.paa",
                    "a3\soft_f_epc\truck_03\data\truck_03_ext02_co.paa",
                    "a3\soft_f_epc\truck_03\data\truck_03_cargo_co.paa",
                    "a3\structures_f_epc\items\electronics\data\the_device_02_co.paa",
                    "a3\structures_f_epc\items\electronics\data\the_device_03_co.paa"
                }
            },
            {
                "Grüne Tarnung",
                "civ",
                {
                    "a3\soft_f_epc\truck_03\data\truck_03_ext01_ghex_co.paa",
                    "a3\soft_f_epc\truck_03\data\truck_03_ext02_ghex_co.paa",
                    "a3\soft_f_epc\truck_03\data\truck_03_cargo_ghex_co.paa",
                    "a3\structures_f_epc\items\electronics\data\the_device_02_co.paa",
                    "a3\structures_f_epc\items\electronics\data\the_device_03_co.paa"
                }
            }
        };
    };

    class O_Truck_03_fuel_F {
        vItemSpace = 1600;
        conditions = "license_civ_trucking";
        price_civ = 3500000;
        price_cop = 3500000;
        price_med = 3500000;
        textures[] = {
            {
                "Braune Tarnung",
                "civ",
                {
                    "a3\soft_f_epc\truck_03\data\truck_03_ext01_co.paa",
                    "a3\soft_f_epc\truck_03\data\truck_03_ext02_co.paa",
                    "a3\soft_f_epc\truck_03\data\truck_03_fuel_co.paa"
                }
            },
            {
                "Grüne Tarnung",
                "civ",
                {
                    "a3\soft_f_epc\truck_03\data\truck_03_ext01_ghex_co.paa",
                    "a3\soft_f_epc\truck_03\data\truck_03_ext02_ghex_co.paa",
                    "a3\soft_f_epc\truck_03\data\truck_03_fuel_ghex_co.paa"
                }
            }
        };
    };

    class Land_CargoBox_V1_F {
        vItemSpace = 5000;
        conditions = "";
        price_civ = -1;
        price_cop = -1;
        price_med = -1;
        textures[] = {};
    };

    class Box_IND_Grenades_F {
        vItemSpace = 700;
        conditions = "";
        price_civ = -1;
        price_cop = -1;
        price_med = -1;
        textures[] = {};
    };

    class B_supplyCrate_F {
        vItemSpace = 1700;
        conditions = "";
        price_civ = -1;
        price_cop = -1;
        price_med = -1;
        textures[] = {};
    };

    class B_G_Offroad_01_F {
        vItemSpace = 65;
        conditions = "";
        price_civ = 45000;
        price_cop = 30000;
        price_med = 30000;
        textures[] = {};
    };

    class B_G_Offroad_01_armed_F {
        vItemSpace = 65;
        conditions = "license_civ_rebel";
        price_civ = 8500000;
        price_cop = 8500000;
        price_med = 8500000;
        textures[] = {
            {
                "Grüne Tarnung",
                "civ",
                {
                    "a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_04_co.paa",
                    "a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_04_co.paa"
                }
            },
            {
                "Olive Tarnung",
                "civ",
                {
                    "a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_05_co.paa",
                    "a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_05_co.paa"
                }
            },
            {
                "Braune Tarnung",
                "civ",
                {
                    "a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_06_co.paa",
                    "a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_06_co.paa"
                }
            },
            {
                "Jäger Tarnung",
                "civ",
                {
                    "a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_12_co.paa",
                    "a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_12_co.paa"
                }
            }
        };
    };

    class C_Boat_Civil_01_F {
        vItemSpace = 85;
        conditions = "license_civ_boat";
        price_civ = 22000;
        price_cop = 22000;
        price_med = 22000;
        textures[] = {
            {
                "Braun Gelb",
                "civ",
                {
                    "\A3\boat_f_gamma\Boat_Civil_01\data\boat_civil_01_ext_co.paa"
                }
            },
            {
                "Orange",
                "civ",
                {
                    "\A3\boat_f_gamma\Boat_Civil_01\data\boat_civil_01_ext_rescue_co.paa"
                }
            }
        };
    };

    class C_Boat_Civil_01_police_F {
        vItemSpace = 85;
        conditions = "license_cop_cg";
        price_civ = 22000;
        price_cop = 22000;
        price_med = 22000;
        textures[] = {
            {
                "Polizei",
                "fed",
                {
                    "\A3\boat_f_gamma\Boat_Civil_01\data\boat_civil_01_ext_police_co.paa"
                }
            }
        };
    };

    class B_Truck_01_box_F {
        vItemSpace = 2000;
        conditions = "license_civ_trucking";
        price_civ = 4000000;
        price_cop = 4000000;
        price_med = 4000000;
        textures[] = {};
    };

    class B_Truck_01_transport_F {
        vItemSpace = 2500;
        conditions = "license_civ_trucking";
        price_civ = 5000000;
        price_cop = 5000000;
        price_med = 5000000;
        textures[] = {};
    };

    class O_MRAP_02_F {
        vItemSpace = 200;
        conditions = "license_civ_driver";
        price_civ = 5000000;
        price_cop = 900000;
        price_med = 10000;
        textures[] = {
            {
                "Grüne Tarnung",
                "civ",
                {
                    "a3\soft_f_exp\mrap_02\data\mrap_02_ext_01_ghex_co.paa",
                    "a3\soft_f_exp\mrap_02\data\mrap_02_ext_02_ghex_co.paa"
                }
            },
            {
                "Braune Tarnung",
                "civ",
                {
                    "a3\soft_f\mrap_02\data\mrap_02_ext_01_co.paa",
                    "a3\soft_f\mrap_02\data\mrap_02_ext_02_co.paa"
                }
            },
            {
                "Polizei",
                "cop",
                {
                    "\A3\soft_f\MRAP_02\data\mrap_02_ext_01_co.paa",
                    "\A3\soft_f\MRAP_02\data\mrap_02_ext_02_co.paa"
                }
            }
        };
    };

    class O_MRAP_02_hmg_F {
        vItemSpace = 100;
        conditions = "license_civ_driver";
        price_civ = 10000000;
        price_cop = 10000000;
        price_med = 10000000;
        textures[] = {
            {
                "Grüne Tarnung",
                "civ",
                {
                    "a3\soft_f_exp\mrap_02\data\mrap_02_ext_01_ghex_co.paa",
                    "a3\soft_f_exp\mrap_02\data\mrap_02_ext_02_ghex_co.paa",
                    "a3\data_f_exp\vehicles\turret_ghex_co.paa"
                }
            },
            {
                "Braune Tarnung",
                "civ",
                {
                    "a3\soft_f\mrap_02\data\mrap_02_ext_01_co.paa",
                    "a3\soft_f\mrap_02\data\mrap_02_ext_02_co.paa",
                    "a3\data_f\vehicles\turret_co.paa"
                }
            }
        };
    };

    class C_Offroad_01_F {
        vItemSpace = 200;
        conditions = "license_civ_driver";
        price_civ = 50000;
        price_cop = 30000;
        price_med = 30000;
        textures[] = {
            {
                "Rot",
                "civ",
                {
                    "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa",
                    "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"
                }
            },
            {
                "Gelb",
                "civ",
                {
                    "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa",
                    "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa"
                }
            },
            {
                "Weiss",
                "civ",
                {
                    "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa",
                    "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa"
                }
            },
            {
                "Blau",
                "civ",
                {
                    "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa",
                    "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa"
                }
            },
            {
                "Dunkelrot",
                "civ",
                {
                    "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa",
                    "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa"
                }
            },
            {
                "Blau/Weiss",
                "civ",
                {
                    "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa",
                    "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa"
                }
            },
            {
                "Benjaminblümchen",
                "civ",
                {
                    "texture\civ\offroad_benjamin.paa"
                }
            },
            {
                "Polizei",
                "cop",
                {
                    "texture\cop\pol_offroader.jpg"
                }
            },
            {
                "Feuerwehr",
                "med",
                {
                    "texture\fw\fw_offroader.jpg"
                }
            }
        };
    };

    class C_Kart_01_Blu_F {
        vItemSpace = 10;
        conditions = "license_civ_driver";
        price_civ = 45000;
        price_cop = 45000;
        price_med = 45000;
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
    class C_Kart_01_Fuel_F: C_Kart_01_Blu_F {}; // Get all information of C_Kart_01_Blu_F
    class C_Kart_01_Red_F: C_Kart_01_Blu_F {};
    class C_Kart_01_Vrana_F: C_Kart_01_Blu_F {};
    class C_Kart_01_F: C_Kart_01_Blu_F {};
    class C_Kart_01_green_F: C_Kart_01_Blu_F {};
    class C_Kart_01_orange_F: C_Kart_01_Blu_F {};
    class C_Kart_01_white_F: C_Kart_01_Blu_F {};
    class C_Kart_01_yellow_F: C_Kart_01_Blu_F {};
    class C_Kart_01_black_F: C_Kart_01_Blu_F {};

    class C_Hatchback_01_sport_F {
        vItemSpace = 150;
        conditions = "license_civ_driver";
        price_civ = 350000;
        price_cop = 35000;
        price_med = 35000;
        textures[] = {
            {
                "Rot",
                "civ",
                {
                    "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"
                }
            },
            {
                "Dunkelblau",
                "civ",
                {
                    "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"
                }
            },
            {
                "Orange",
                "civ",
                {
                    "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport03_co.paa"
                }
            },
            {
                "Schwarz/Weiss",
                "civ",
                {
                    "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa"
                }
            },
            {
                "Beige",
                "civ",
                {
                    "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport05_co.paa"
                }
            },
            {
                "Grün",
                "civ",
                {
                    "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport06_co.paa"
                }
            },
            {
                "Polizei",
                "cop",
                {
                    "texture\cop\pol_limo.jpg"
                }
            },
            {
                "Feuerwehr",
                "med",
                {
                    "texture\fw\fw_limo.jpg"
                }
            }
        };
    };

    class B_Quadbike_01_F {
        vItemSpace = 25;
        conditions = "license_civ_driver";
        price_civ = 3500;
        price_cop = 10000;
        price_med = 10000;
        textures[] = {
            {
                "Polizei",
                "cop",
                {
                    "\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa"
                }
            }
        };
    };

    class I_Truck_02_covered_F {
        vItemSpace = 1200;
        conditions = "license_civ_trucking";
        price_civ = 2500000;
        price_cop = 2500000;
        price_med = 2500000;
        textures[] = {
            {
                "Orange",
                "civ",
                {
                    "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                    "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
                }
            },
            {
                "Orange/Oliv",
                "civ",
                {
                    "a3\soft_f_beta\truck_02\data\truck_02_kab_co.paa",
                    "a3\soft_f_beta\truck_02\data\truck_02_kuz_olive_co.paa"
                }
            },
            {
                "Blau",
                "civ",
                {
                    "a3\soft_f_beta\truck_02\data\truck_02_kab_blue_co.paa",
                    "a3\soft_f_beta\truck_02\data\truck_02_kuz_co.paa"
                }
            },
            {
                "Blau/Oliv",
                "civ",
                {
                    "a3\soft_f_beta\truck_02\data\truck_02_kab_blue_co.paa",
                    "a3\soft_f_beta\truck_02\data\truck_02_kuz_olive_co.paa"
                }
            },
            {
                "Pittiplatsch",
                "civ",
                {
                    "texture\civ\zamak_pittiplatsch_1.paa",
                    "texture\civ\zamak_pittiplatsch_2.paa"
                }
            },
            {
                "Trabi",
                "civ",
                {
                    "texture\civ\zamak_trabi_1.paa",
                    "texture\civ\zamak_trabi_2.paa"
                }
            }
        };
    };

    class I_Truck_02_transport_F {
        vItemSpace = 1000;
        conditions = "license_civ_trucking";
        price_civ = 2000000;
        price_cop = 2000000;
        price_med = 2000000;
        textures[] = {
            {
                "Orange",
                "civ",
                {
                    "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                    "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
                }
            },
            {
                "Blau",
                "civ",
                {
                    "a3\soft_f_beta\truck_02\data\truck_02_kab_blue_co.paa",
                    "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
                }
            }
        };
    };

    class O_Truck_03_covered_F {
        vItemSpace = 2500;
        conditions = "license_civ_trucking";
        price_civ = 5000000;
        price_cop = 5000000;
        price_med = 5000000;
        textures[] = {
            {
                "Braune Tarnung",
                "civ",
                {
                    "a3\soft_f_epc\truck_03\data\truck_03_ext01_co.paa",
                    "a3\soft_f_epc\truck_03\data\truck_03_ext02_co.paa",
                    "a3\soft_f_epc\truck_03\data\truck_03_cargo_co.paa",
                    "a3\soft_f_epc\truck_03\data\truck_03_cover_co.paa"
                }
            },
            {
                "Grüne Tarnung",
                "civ",
                {
                    "a3\soft_f_exp\truck_03\data\truck_03_ext01_ghex_co.paa",
                    "a3\soft_f_exp\truck_03\data\truck_03_ext02_ghex_co.paa",
                    "a3\soft_f_exp\truck_03\data\truck_03_cargo_ghex_co.paa",
                    "a3\soft_f_exp\truck_03\data\truck_03_cover_ghex_co.paa"
                }
            }
        };
    };

    class C_Hatchback_01_F {
        vItemSpace = 100;
        conditions = "license_civ_driver";
        price_civ = 100000;
        price_cop = 100000;
        price_med = 100000;
        textures[] = {
            {
                "Beige",
                "civ",
                {
                    "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa"
                }
            },
            {
                "Grün",
                "civ",
                {
                    "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa"
                }
            },
            {
                "Blau",
                "civ",
                {
                    "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa"
                }
            },
            {
                "Dunkelblau",
                "civ",
                {
                    "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa"
                }
            },
            {
                "Gelb",
                "civ",
                {
                    "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa"
                }
            },
            {
                "Weiss",
                "civ",
                {
                    "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa"
                }
            },
            {
                "Grau",
                "civ",
                {
                    "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa"
                }
            },
            {
                "Schwarz",
                "civ",
                {
                    "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa"
                }
            }
        };
    };

    class C_SUV_01_F {
        vItemSpace = 150;
        conditions = "license_civ_driver";
        price_civ = 75000;
        price_cop = 45000;
        price_med = 45000;
        textures[] = {
            {
                "Dunkelrot",
                "civ",
                {
                    "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"
                }
            },
            {
                "Silber",
                "civ",
                {
                    "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"
                }
            },
            {
                "Orange",
                "civ",
                {
                    "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"
                }
            },
            {
                "Feuerwehr",
                "med",
                {
                    "texture\fw\fw_suv.jpg"
                }
            },
            {
                "Bienen Mobil",
                "civ",
                {
                    "texture\civ\suv_biene.paa"
                }
            },
            {
                "Polizei",
                "cop",
                {
                    "texture\cop\pol_suv.jpg"
                }
            }
        };
    };

    class C_Van_01_transport_F {
        vItemSpace = 400;
        conditions = "license_civ_driver";
        price_civ = 1000000;
        price_cop = 1000000;
        price_med = 1000000;
        textures[] = {
            {
                "Weiss",
                "civ",
                {
                    "a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa",
                    "a3\soft_f_gamma\van_01\data\van_01_adds_co.paa",
                    "a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"
                }
            },
            {
                "Rot",
                "civ",
                {
                    "a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa",
                    "a3\soft_f_gamma\van_01\data\van_01_adds_co.paa",
                    "a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"
                }
            },
            {
                "Schwarz",
                "civ",
                {
                    "a3\soft_f_gamma\van_01\data\van_01_ext_black_co.paa",
                    "a3\soft_f_gamma\van_01\data\van_01_adds_co.paa",
                    "a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"
                }
            }
        };
    };

    class C_Van_01_box_F {
        vItemSpace = 550;
        conditions = "license_civ_driver";
        price_civ = 1500000;
        price_cop = 1500000;
        price_med = 1500000;
        textures[] = {
            {
                "Weiss",
                "civ",
                {
                    "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
                }
            },
            {
                "Rot",
                "civ",
                {
                    "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
                }
            },
            {
                "Schwarz",
                "civ",
                {
                    "a3\soft_f_gamma\van_01\data\van_01_ext_black_co.paa",
                    "a3\soft_f_gamma\van_01\data\van_01_adds_co.paa"
                }
            },
            {
                "Feuerwehr",
                "med",
                {
                    "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
                }
            }
        };
    };

    class B_MRAP_01_F {
        vItemSpace = 65;
        conditions = "";
        price_civ = 7500000;
        price_cop = 500000;
        price_med = 500000;
        textures[] = {
			{
                "Feuerwehr",
                "med",
                {
                    "texture\fw\fw_hunterv.jpg",
                    "texture\fw\fw_hunterh.jpg"
                }
            },
            {
                "Polizei",
                "cop",
                {
                    "texture\cop\pol_hunterv.jpg",
                    "texture\cop\pol_hunterh.jpg"
                }
            },
            {
                "Grau",
                "civ",
                {
                    "a3\soft_f\mrap_01\data\mrap_01_base_co.paa",
                    "a3\soft_f\mrap_01\data\mrap_01_adds_co.paa"
                }
            }
        };
    };

    class B_Heli_Transport_03_unarmed_F {
        vItemSpace = 750;
        conditions = "license_civ_pilot || {license_cop_cAir}";
        price_civ = 10000000;
        price_cop = 150000;
        price_med = 10000000;
        textures[] = {
            {
                "Schwarz",
                "civ",
                {
                    "\A3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext01_black_co.paa",
                    "\A3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext02_black_co.paa"
                }
            },
            {
                "Grün",
                "civ",
                {
                    "a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext01_co.paa",
                    "a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext02_co.paa"
                }
            },
            {
                "Polizei",
                "cop",
                {
                    "\A3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext01_co.paa",
                    "\A3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext02_co.paa"
                }
            }
        };
    };

    class B_Heli_Light_01_F {
        vItemSpace = 90;
        conditions = "license_civ_pilot || {license_cop_cAir}";
        price_civ = 1500000;
        price_cop = 75000;
        price_med = 75000;
        textures[] = {
            {
                "Blau",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"
                }
            },
            {
                "Rot",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"
                }
            },
            {
                "Blueline",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"
                }
            },
            {
                "Elliptical",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"
                }
            },
            {
                "Furious",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"
                }
            },
            {
                "Jeans Blue",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"
                }
            },
            {
                "Speedy Redline",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"
                }
            },
            {
                "Sunset",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"
                }
            },
            {
                "Vrana",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"
                }
            },
            {
                "Waves Blue",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"
                }
            },
            {
                "Digital Tarnung",
                "reb",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
                }
            },
            {
                "Digi Green",
                "reb",
                {
                    "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa"
                }
            },
            {
                "Polizei",
                "cop",
                {
                    "texture\cop\pol_humming.jpg"
                }
            },
            {
                "Feuerwehr",
                "med",
                {
                    "texture\fw\fw_humming.jpg"
                }
            }
        };
    };

    class C_Heli_Light_01_civil_F {
        vItemSpace = 200;
        conditions = "license_civ_pilot || {license_med_mAir}";
        price_civ = 1500000;
        price_cop = 75000;
        price_med = 75000;
        textures[] = {
            {
                "Blueline",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"
                }
            },
            {
                "Elliptical",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"
                }
            },
            {
                "Furious",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"
                }
            },
            {
                "Jeans Blue",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"
                }
            },
            {
                "Speedy Redline",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"
                }
            },
            {
                "Sunset",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"
                }
            },
            {
                "Vrana",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"
                }
            },
            {
                "Waves Blue",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"
                }
            }
        };
    };

    class I_Heli_Transport_02_F {
        vItemSpace = 850;
        conditions = "license_civ_pilot";
        price_civ = 12000000;
        price_cop = 75000;
        price_med = 75000;
        textures[] = {
            {
                "Dahoman",
                "civ",
                {
                    "\A3\air_f_beta\Heli_Transport_02\data\skins\heli_transport_02_1_dahoman_co.paa",
                    "\A3\air_f_beta\Heli_Transport_02\data\skins\heli_transport_02_2_dahoman_co.paa",
                    "\A3\air_f_beta\Heli_Transport_02\data\skins\heli_transport_02_3_dahoman_co.paa"
                }
            },
            {
                "Ion",
                "civ",
                {
                    "\A3\air_f_beta\Heli_Transport_02\data\skins\heli_transport_02_1_ion_co.paa",
                    "\A3\air_f_beta\Heli_Transport_02\data\skins\heli_transport_02_2_ion_co.paa",
                    "\A3\air_f_beta\Heli_Transport_02\data\skins\heli_transport_02_3_ion_co.paa"
                }
            }
        };
    };

    class O_T_VTOL_02_infantry_F {
        vItemSpace = 1000;
        conditions = "license_civ_pilot || {license_med_mAir}";
        price_civ = 30000000;
        price_cop = 175000;
        price_med = 175000;
        textures[] = {
            {
                "Graue Tarnung",
                "civ",
                {
                    "a3\air_f_exp\vtol_02\data\vtol_02_ext01_co.paa",
                    "a3\air_f_exp\vtol_02\data\vtol_02_ext02_co.paa",
                    "a3\air_f_exp\vtol_02\data\vtol_02_ext03_l_co.paa",
                    "a3\air_f_exp\vtol_02\data\vtol_02_ext03_r_co.paa"
                }
            },
            {
                "Braune Tarnung",
                "civ",
                {
                    "a3\air_f_exp\vtol_02\data\vtol_02_ext01_bhex_co.paa",
                    "a3\air_f_exp\vtol_02\data\vtol_02_ext02_bhex_co.paa",
                    "a3\air_f_exp\vtol_02\data\vtol_02_ext03_l_bhex_co.paa",
                    "a3\air_f_exp\vtol_02\data\vtol_02_ext03_r_bhex_co.paa"
                }
            },
            {
                "Grüne Tarnung",
                "civ",
                {
                    "a3\air_f_exp\vtol_02\data\vtol_02_ext01_ghex_co.paa",
                    "a3\air_f_exp\vtol_02\data\vtol_02_ext02_ghex_co.paa",
                    "a3\air_f_exp\vtol_02\data\vtol_02_ext03_l_ghex_co.paa",
                    "a3\air_f_exp\vtol_02\data\vtol_02_ext03_r_ghex_co.paa"
                }
            },
            {
                "Feuerwehr",
                "med",
                {
                    "a3\air_f_exp\vtol_02\data\vtol_02_ext01_ghex_co.paa",
                    "a3\air_f_exp\vtol_02\data\vtol_02_ext02_ghex_co.paa",
                    "a3\air_f_exp\vtol_02\data\vtol_02_ext03_l_ghex_co.paa",
                    "a3\air_f_exp\vtol_02\data\vtol_02_ext03_r_ghex_co.paa"
                }
            }
        };
    };

    class O_T_VTOL_02_vehicle_F {
        vItemSpace = 1000;
        conditions = "license_civ_pilot";
        price_civ = 30000000;
        price_cop = 175000;
        price_med = 175000;
        textures[] = {
          {
              "Graue Tarnung",
              "civ",
              {
                  "a3\air_f_exp\vtol_02\data\vtol_02_ext01_co.paa",
                  "a3\air_f_exp\vtol_02\data\vtol_02_ext02_co.paa",
                  "a3\air_f_exp\vtol_02\data\vtol_02_ext03_l_co.paa",
                  "a3\air_f_exp\vtol_02\data\vtol_02_ext03_r_co.paa"
              }
          },
          {
              "Braune Tarnung",
              "civ",
              {
                  "a3\air_f_exp\vtol_02\data\vtol_02_ext01_bhex_co.paa",
                  "a3\air_f_exp\vtol_02\data\vtol_02_ext02_bhex_co.paa",
                  "a3\air_f_exp\vtol_02\data\vtol_02_ext03_l_bhex_co.paa",
                  "a3\air_f_exp\vtol_02\data\vtol_02_ext03_r_bhex_co.paa"
              }
          },
          {
              "Grüne Tarnung",
              "civ",
              {
                  "a3\air_f_exp\vtol_02\data\vtol_02_ext01_ghex_co.paa",
                  "a3\air_f_exp\vtol_02\data\vtol_02_ext02_ghex_co.paa",
                  "a3\air_f_exp\vtol_02\data\vtol_02_ext03_l_ghex_co.paa",
                  "a3\air_f_exp\vtol_02\data\vtol_02_ext03_r_ghex_co.paa"
              }
          }
        };
    };

    class O_Heli_Light_02_unarmed_F {
        vItemSpace = 750;
        conditions = "license_civ_pilot || {license_med_mAir}";
        price_civ = 3000000;
        price_cop = 175000;
        price_med = 175000;
        textures[] = {
            {
                "Weiss / Blau",
                "civ",
                {
                    "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"
                }
            },
            {
                "Grüne Tarnung",
                "civ",
                {
                    "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"
                }
            },
            {
                "Braune Tarnung",
                "civ",
                {
                    "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa"
                }
            },
            {
                "Feuerwehr",
                "med",
                {
                    "texture\med\EMS_Orka.paa"
                }
            }
        };
    };

    class B_SDV_01_F {
        vItemSpace = 50;
        conditions = "license_civ_boat || {license_cop_cg}";
        price_civ = 150000;
        price_cop = 25000;
        price_med = 25000;
        textures[] = {};
    };

    class C_Van_01_fuel_F {
        vItemSpace = 400;
        vFuelSpace = 19500;
        conditions = "license_civ_driver";
        price_civ = 1000000;
        price_cop = 1000000;
        price_med = 1000000;
        textures[] = {
            {
                "Weiss",
                "civ",
                {
                    "a3\soft_f_gamma\van_01\data\van_01_ext_co.paa",
                    "a3\soft_f_gamma\van_01\data\van_01_tank_red_co.paa"
                }
            },
            {
                "Rot",
                "civ",
                {
                    "a3\soft_f_gamma\van_01\data\van_01_ext_red_co.paa",
                    "a3\soft_f_gamma\van_01\data\van_01_tank_red_co.paa"
                }
            },
            {
                "Schwarz",
                "civ",
                {
                    "a3\soft_f_gamma\van_01\data\van_01_ext_black_co.paa",
                    "a3\soft_f_gamma\van_01\data\van_01_tank_red_co.paa"
                }
            }
        };
    };

    class I_Truck_02_fuel_F {
        vItemSpace = 1000;
        vFuelSpace = 42000;
        conditions = "license_civ_trucking";
        price_civ = 2000000;
        price_cop = 2000000;
        price_med = 2000000;
        textures[] = {
            {
                "Weiss",
                "civ",
                {
                    "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                    "\A3\Soft_F_Beta\Truck_02\data\truck_02_fuel_co.paa"
                }
            },
            {
                "Blau",
                "civ",
                {
                    "a3\soft_f_beta\truck_02\data\truck_02_kab_blue_co.paa",
                    "\A3\Soft_F_Beta\Truck_02\data\truck_02_fuel_co.paa"
                }
            }
        };
    };

    class I_Heli_light_03_unarmed_F {
        vItemSpace = 100;
        conditions = "license_cop_cAir";
        price_civ = 2000000;
        price_cop = 200000;
        price_med = 200000;
        textures[] = {
            {
                "Polizei",
                "cop",
                {
                    "texture\cop\heli_light_03_base_co.paa"
                }
            },
            {
                "Feuerwehr",
                "med",
                {
                    "texture\cop\heli_light_03_base_co.paa"
                }
            }
        };
    };

    class I_G_Van_01_fuel_F {
        vItemSpace = 400;
        vFuelSpace = 19500;
        conditions = "license_civ_driver";
        price_civ = 1000000;
        price_cop = 1000000;
        price_med = 1000000;
        textures[] = {
            {
                "Grüne Tarnung",
                "civ",
                {
                    "\A3\soft_f_bootcamp\Van_01\data\van_01_ext_ig_01_co.paa",
                    "\A3\soft_f_bootcamp\van_01\data\van_01_tank_ig_01_co.paa"
                }
            },
            {
                "Weisse Tarnung",
                "civ",
                {
                    "\A3\soft_f_bootcamp\Van_01\data\van_01_ext_ig_02_co.paa",
                    "\A3\soft_f_bootcamp\van_01\data\van_01_tank_ig_02_co.paa"
                }
            },
            {
                "Braune Tarnung",
                "civ",
                {
                    "\A3\soft_f_bootcamp\Van_01\data\van_01_ext_ig_03_co.paa",
                    "\A3\soft_f_bootcamp\van_01\data\van_01_tank_ig_03_co.paa"
                }
            }
        };
    };

    class I_C_Van_01_transport_F {
        vItemSpace = 400;
        conditions = "license_civ_driver";
        price_civ = 1000000;
        price_cop = 1000000;
        price_med = 1000000;
        textures[] = {
            {
                "Grüne Tarnung",
                "civ",
                {
                    "\A3\soft_f_bootcamp\Van_01\data\van_01_ext_ig_01_co.paa",
                    "\A3\soft_f_bootcamp\van_01\data\van_01_adds_ig_01_co.paa"
                }
            },
            {
                "Weisse Tarnung",
                "civ",
                {
                    "\A3\soft_f_bootcamp\Van_01\data\van_01_ext_ig_02_co.paa",
                    "\A3\soft_f_bootcamp\van_01\data\van_01_adds_ig_02_co.paa"
                }
            },
            {
                "Braune Tarnung",
                "civ",
                {
                    "\A3\soft_f_bootcamp\Van_01\data\van_01_ext_ig_03_co.paa",
                    "\A3\soft_f_bootcamp\van_01\data\van_01_adds_ig_03_co.paa"
                }
            }
        };
    };

    class I_G_Offroad_01_F {
        vItemSpace = 65;
        conditions = "license_civ_driver";
        price_civ = 45000;
        price_cop = 30000;
        price_med = 30000;
        textures[] = {
            {
                "Grüne Tarnung",
                "civ",
                {
                    "\A3\soft_f_bootcamp\Offroad_01\data\offroad_01_ext_ig_01_co.paa",
                }
            },
            {
                "Braune Tarnung",
                "civ",
                {
                    "\A3\soft_f_bootcamp\Offroad_01\data\offroad_01_ext_ig_03_co.paa",
                }
            },
            {
                "Wüsten Tarnung",
                "civ",
                {
                    "\A3\soft_f_bootcamp\Offroad_01\data\offroad_01_ext_ig_06_co.paa",
                }
            }
        };
    };

    class B_Truck_01_ammo_F {
        vItemSpace = 1900;
        conditions = "";
        price_civ = 3800000;
        price_cop = 3800000;
        price_med = 3800000;
        textures[] = {};
    };

    class B_Truck_01_covered_F {
        vItemSpace = 2500;
        conditions = "license_civ_trucking";
        price_civ = 5000000;
        price_cop = 5000000;
        price_med = 5000000;
        textures[] = {};
    };

    class B_Truck_01_fuel_F {
        vItemSpace = 1700;
        vFuelSpace = 50000;
        conditions = "license_civ_trucking";
        price_civ = 3900000;
        price_cop = 3900000;
        price_med = 3900000;
        textures[] = {};
    };

    class B_Heli_Attack_01_F {
        vItemSpace = 100;
        conditions = "license_cop_cAir";
        price_civ = 15000000;
        price_cop = 1500000;
        price_med = 1500000;
        textures[] = {
            {
                "Polizei",
                "cop",
                {
                    "a3\air_f_beta\heli_attack_01\data\heli_attack_01_co.paa"
                }
            }
        };
    };

    class O_Truck_03_ammo_F {
        vItemSpace = 1900;
        conditions = "license_civ_trucking";
        price_civ = 3800000;
        price_cop = 3800000;
        price_med = 3800000;
        textures[] = {
            {
                "Braune Tarnung",
                "civ",
                {
                    "a3\soft_f_epc\truck_03\data\truck_03_ext01_co.paa",
                    "a3\soft_f_epc\truck_03\data\truck_03_ext02_co.paa",
                    "a3\soft_f_epc\truck_03\data\truck_03_cargo_co.paa",
                    "a3\structures_f\data\metal\containers\containers_02_set_co.paa"
                }
            },
            {
                "Grüne Tarnung",
                "civ",
                {
                    "a3\soft_f_exp\truck_03\data\truck_03_ext01_ghex_co.paa",
                    "a3\soft_f_exp\truck_03\data\truck_03_ext02_ghex_co.paa",
                    "a3\soft_f_exp\truck_03\data\truck_03_cargo_ghex_co.paa",
                    "a3\structures_f\data\metal\containers\containers_colors_05_co.paa"
                }
            }
        };
    };
};
