class CarShops {
	/*
		Format:
		{ Classname, rental price, license required, { varname, >= value } }

		{ varname, >= value} this is a "level" requirement mainly used by cops and rebels, do not fill this in if you are not utilizing it.
	*/
	class civ_car {
		side = "civ";
		vehicles[] = {
			{ "B_Quadbike_01_F", 8813, "" },
			{ "C_Hatchback_01_F", 17517, "" },
			{ "C_Offroad_01_F", 28383, "" },
			{ "C_SUV_01_F", 28382, "" },
			{ "C_Van_01_transport_F", 57740, "" },
			{ "C_Hatchback_01_sport_F", 100000, "" }
		};
	};

	class civ_truck {
		side = "civ";
		vehicles[] = {
			{ "C_Van_01_box_F", 100000, "" },
			{ "C_Van_01_fuel_F", 130000, ""},
			{ "I_Truck_02_transport_F", 200000, "" },
			{ "I_Truck_02_covered_F", 300000, "" },
			{ "C_Truck_02_fuel_F", 350000, "" },
			{ "O_Truck_03_transport_F", 550000, "" },
			{ "O_Truck_03_covered_F", 650000, "" },
			{ "O_Truck_03_fuel_F", 700000, "" },
			{ "O_Truck_03_device_F", 4000000, "" },
			{ "B_Truck_01_transport_F", 1000000, "" },
			{ "B_Truck_01_covered_F", 1500000, "" },
			{ "B_Truck_01_fuel_F", 1700000, "" },
			{ "B_Truck_01_ammo_F", 5625000,""},
			{ "B_Truck_01_box_F", 2200000, "" }
		};
	};

	class civ_air {
		side = "civ";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 850000, "" },
			{ "C_Heli_Light_01_civil_F", 1000000, "" },
			{ "O_Heli_Light_02_unarmed_F", 2000000, "" },
			{ "I_Heli_Transport_02_F", 4000000, "" },
			{ "O_Heli_Transport_04_F", 9000000, "" },
			{ "O_Heli_Transport_04_box_F", 12000000, "" },
			{ "B_Heli_Transport_03_unarmed_F", 24666665, "" }
		};
	};

	class civ_ship {
		side = "civ";
		vehicles[] = {
			{ "C_Rubberboat", 5000, "" },
			{ "C_Boat_Civil_01_F", 22000, "" },
			{ "B_SDV_01_F", 1000000, "" }
		};
	};

	class kart_shop {
		side = "civ";
		vehicles[] = {
			{ "C_Kart_01_Blu_F", 15000 , "driver" },
			{ "C_Kart_01_Fuel_F", 15000, "driver" },
			{ "C_Kart_01_Red_F", 15000, "driver" },
			{ "C_Kart_01_Vrana_F", 15000, "driver" }
		};
	};

	class med_shop {
		side = "med";
		vehicles[] = {
			{ "C_Offroad_01_F", 0, "" },
			{ "C_SUV_01_F", 0, "", { "life_medlevel", 2 } },
			{ "C_Van_01_box_F", 0, "", { "life_medlevel", 2 } },
			{ "C_Hatchback_01_sport_F", 0, "", { "life_medlevel", 4 } },
			{ "C_Rubberboat", 0, "", { "life_medlevel", 2 } }
		};
	};

	class med_air_hs {
		side = "med";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 0, "mAir", { "life_medlevel", 2 } },
			{ "O_Heli_Light_02_unarmed_F", 0, "mAir", { "life_medlevel", 3 } },
			{ "O_Heli_Transport_04_medevac_F", 0, "mAir", { "life_medlevel", 4 } },
			{ "O_Heli_Transport_04_medevac_F", 0, "mAir", { "life_medlevel", 4 } }
		};
	};

	class alac_shop {
		side = "med";
		vehicles[] = {
			{ "C_Offroad_01_F", 0, "" },
			{ "C_SUV_01_F", 0, "", { "life_alaclevel", 2 } },
			{ "B_Truck_01_transport_F", 0, "", { "life_alaclevel", 3 } }
		};
	};

	class alac_air_hs {
		side = "med";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 0, "mAir", { "life_alaclevel", 2 } },
			{ "O_Heli_Light_02_unarmed_F", 0, "mAir", { "life_alaclevel", 3 } },
			{ "O_Heli_Transport_04_F", 0, "mAir", { "life_alaclevel", 4 } }
		};
	};

	class thw_shop {
		side = "med";
		vehicles[] = {
			{ "B_Quadbike_01_F", 0, "" },
			{ "C_Offroad_01_F", 0, "" },
			{ "C_SUV_01_F", 0, "", { "life_thwlevel", 2 } },
			{ "C_Van_01_box_F", 0, "", { "life_thwlevel", 2 } },
			{ "I_Truck_02_box_F", 0, "", { "life_thwlevel", 2 } },
			{ "B_Truck_01_transport_F", 0, "", { "life_thwlevel", 3 } },
			{ "C_Hatchback_01_sport_F", 0, "", { "life_thwlevel", 4 } },
			{ "C_Rubberboat", 0, "", { "life_thwlevel", 2 } }
		};
	};

	class thw_air_hs {
		side = "med";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 0, "mAir", { "life_thwlevel", 2 } },
			{ "O_Heli_Light_02_unarmed_F", 0, "mAir", { "life_thwlevel", 3 } },
			{ "I_Heli_Light_03_unarmed_F", 0, "mAir", { "life_thwlevel", 4 } },
			{ "I_Heli_Transport_02_F", 0, "mAir", { "life_thwlevel", 4 } },
			{ "O_Heli_Transport_04_medevac_F", 0, "mAir", { "life_thwlevel", 4 } },
			{ "O_Heli_Transport_04_F", 0, "mAir", { "life_thwlevel", 4 } }
		};
	};

	class cop_car {
		side = "cop";
		vehicles[] = {
			{ "B_Quadbike_01_F", 0, "" },
			{ "C_Offroad_01_F", 0, ""},
			{ "C_SUV_01_F", 0, "", { "life_coplevel", 3 } },
			{ "I_Truck_02_box_F", 0, "", { "life_coplevel", 3 } },
			{ "B_MRAP_01_F", 0, "", { "life_coplevel", 4 } },
			{ "C_Hatchback_01_sport_F", 0, "", { "life_coplevel", 4 } },
            { "B_G_Offroad_01_armed_F", 0, "", { "life_coplevel", 6 } },
			//{ "B_MRAP_01_hmg_F", 0, "", { "life_coplevel", 5 } },
			{ "I_MRAP_03_F", 0, "", { "life_coplevel", 6 } },
			{ "B_G_Offroad_01_F", 0, "", { "life_coplevel", 7 } }
		};
	};

	class cop_air {
		side = "cop";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 0, "cAir", { "life_coplevel", 2 } },
			{ "I_Heli_light_03_unarmed_F", 0, "cAir", { "life_coplevel", 3 } },
			{ "O_Heli_Light_02_unarmed_F", 0, "cAir", { "life_coplevel", 4 } },
			{ "B_Heli_Transport_01_F", 0, "cAir", { "life_coplevel", 6 } }
		};
	};

	class cop_ship {
		side = "cop";
		vehicles[] = {
			{ "B_Boat_Transport_01_F", 0, "" },
			{ "C_Boat_Civil_01_police_F", 0, "", { "life_coplevel", 2 } },
			{ "B_Boat_Armed_01_minigun_F", 0, "", { "life_coplevel", 3 } },
			{ "B_SDV_01_F", 0, "", { "life_coplevel", 3 } }
		};
	};

	class ASF_shop {
		side = "ASF";
		vehicles[] = {
			{ "C_Offroad_01_F", 0, "" },
			{ "C_SUV_01_F", 0, "" },
			{ "B_MRAP_01_F", 0, "", { "life_ASFlevel", 2 } }
		};
	};

	class ASF_air_hs {
		side = "ASF";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 0, "" },
			{ "I_Heli_light_03_unarmed_F", 0, "", { "life_ASFlevel", 2 } },
			{ "O_Heli_Transport_04_bench_F", 0, "", { "life_ASFlevel", 2 } },
			{ "B_Heli_Transport_03_unarmed_F", 0, "", { "life_ASFlevel", 3 } }
		};
	};

	class reb_car {
		side = "civ";
		vehicles[] = {
			{ "B_Quadbike_01_F", 7500, "" },
			{ "B_G_Offroad_01_F", 15000, "" },
			{ "C_SUV_01_F", 28382, "" },
			{ "O_MRAP_02_F", 3000000, "rebel" },
			{ "B_MRAP_01_F", 3333333, "rebel" },
			{ "B_G_Offroad_01_armed_F", 6700000, "rebel" }
		};
	};

	class reb_air {
		side = "civ";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 650000, "" },
			{ "O_Heli_Light_02_unarmed_F", 1500000, "" },
			{ "I_Heli_light_03_unarmed_F", 2666666, "rebel" },
			{ "B_Heli_Transport_03_unarmed_F", 24666665, "rebel" }
		};
	};

	class sek_hq_car {
		side = "cop";
		vehicles[] = {
			{ "I_MRAP_03_F", 0, ""},
			{ "B_MRAP_01_F", 0, "" },
			{ "C_Hatchback_01_sport_F", 0, "" }
			//{ "I_MRAP_03_hmg_F", 0, "" }
		};
	};

	class sek_hq_air {
		side = "cop";
		vehicles[] = {
			{ "B_Heli_Transport_01_F", 0, "" },
			{ "I_Heli_light_03_unarmed_F", 0, "" },
			{ "B_Heli_Transport_01_F", 0, ""},
			{ "B_Heli_Transport_03_unarmed_F", 0, "" }
		};
	};
	
	class kripo_car {
		side = "cop";
		vehicles[] = {
			{ "C_Van_01_box_F", 0, "kripo" },
			{ "C_Van_01_fuel_F", 0, "kripo"},
			{ "I_Truck_02_transport_F", 0, "kripo" },
			{ "I_Truck_02_covered_F", 0, "kripo" },
			{ "C_Truck_02_fuel_F", 0, "kripo" },
			{ "O_Truck_03_transport_F", 0, "kripo" },
			{ "O_Truck_03_covered_F", 0, "kripo" },
			{ "O_Truck_03_fuel_F", 0, "kripo" },
			{ "O_Truck_03_device_F", 0, "kripo" },
			{ "B_Truck_01_transport_F", 0, "kripo" },
			{ "B_Truck_01_covered_F", 0, "kripo" },
			{ "B_Truck_01_fuel_F", 0, "kripo" },
			{ "B_Truck_01_box_F", 0, "kripo" },
			{ "B_Truck_01_ammo_F", 0, "kripo" }
		};
	};
	
	class kripo_air {
		side = "cop";
		vehicles[] = {
			{ "I_Heli_Transport_02_F", 0, "kripo" },
			{ "O_Heli_Transport_04_F", 0, "kripo" }
		};
	};

	class event_shop {
		side = "civ";
		vehicles[] = {
			{ "C_Offroad_01_F", 0, "" },
			{ "C_Offroad_01_repair_F", 0, "" },
			{ "C_Van_01_box_F", 0, "" },
			{ "C_SUV_01_F", 0, "" },
			{ "B_Truck_01_mover_F", 0, "" },
			{ "C_Hatchback_01_sport_F", 0, "" },
			{ "B_Quadbike_01_F", 0, "" },
			{ "C_Hatchback_01_F", 0, "" },
			{ "C_Van_01_transport_F", 0, "" },
			{ "C_Van_01_fuel_F", 0, "" },
			{ "I_Truck_02_transport_F", 0, "" },
			{ "I_Truck_02_covered_F", 0, "" },
			{ "C_Truck_02_fuel_F", 0, "" },
			{ "O_Truck_03_transport_F", 0, "" },
			{ "O_Truck_03_covered_F", 0, "" },
			{ "O_Truck_03_fuel_F", 0, "" },
			{ "O_Truck_03_device_F", 0, "" },
			{ "B_Truck_01_transport_F", 0, "" },
			{ "B_Truck_01_covered_F", 0, "" },
			{ "B_Truck_01_box_F", 0, "" },
			{ "B_Truck_01_ammo_F", 0, "" },
			{ "O_MRAP_02_F", 0, "" },
			{ "B_MRAP_01_F", 0, "" },
			{ "B_MRAP_01_hmg_F", 0, "" },
			{ "I_MRAP_03_F", 0, "" },
			{ "I_MRAP_03_hmg_F", 0, "" },
			{ "B_G_Offroad_01_armed_F", 0, "" },
			{ "C_Rubberboat", 0, "" },
			{ "C_Boat_Civil_01_F", 0, "" },
			{ "B_SDV_01_F", 0, "" }
		};
	};

	class event_air_hs {
		side = "civ";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 0, "" },
			{ "C_Heli_Light_01_civil_F", 0, "" },
			{ "O_Heli_Light_02_unarmed_F", 0, "" },
			{ "I_Heli_Transport_02_F", 0, "" },
			{ "B_Heli_Transport_03_unarmed_F", 0, "" },
			{ "I_Heli_light_03_unarmed_F", 0, "" },
			{ "O_Heli_Transport_04_box_F", 0, "" },
			{ "O_Heli_Transport_04_F", 0, "" },
			{ "B_Heli_Transport_01_F", 0, "" }
		};
	};
	
	class civ_log {
		side = "civ";
		vehicles[] = {
		};
	};
};

/*
	Vehicle Configs (Contains textures and other stuff)

	storageFee (Getting vehicles out of garage) format:
		INDEX 0: Civilian Price
		INDEX 1: Cop Price
		INDEX 3: Hilfsdienste Price
		INDEX 4: ASF Price

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

	class C_Kart_01_Blu_F : Default {
		vItemSpace = 20;
		storageFee[] = { 6495, 0, 0, 0 };
		garageSell[] = { 12000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 12000;
		textures[] = {};
	};

	class C_Kart_01_Fuel_F : C_Kart_01_Blu_F {}; //Inherits everything from the above class
	class C_Kart_01_Red_F : C_Kart_01_Blu_F {}; //Inherits everything from the above class
	class C_Kart_01_Vrana_F : C_Kart_01_Blu_F {}; //Inherits everything from the above class

	class B_Quadbike_01_F : Default {
		vItemSpace = 25;
		storageFee[] = { 2643, 0, 0, 0 };
		garageSell[] = { 4413, 0, 0, 0 };
		insurance = 0;
		chopShop = 4413;
        textures[] = {
        	{ "Polizei", "cop", {
                "textures\cop\COP_Quad.paa"
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
			{ "THW", "thw", {
	                "textures\thw\THW_Quad.paa"
            } }
        };
    };

	class C_Offroad_01_F : Default {
		vItemSpace = 65;
		storageFee[] = { 6495, 0, 0, 0 };
		garageSell[] = { 14383, 0, 0, 0 };
		insurance = 2500;
		chopShop = 14383;
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
			{ "Dunkel Rot", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa"
            } },
			{ "Blau / Weiss", "civ", {
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa",
	                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa"
            } },
            { "Taxi", "civ", {
	                "textures\civ\CIV_Offroad_Taxi.paa",
	                "textures\civ\CIV_Offroad_Taxi.paa"
            } },
			{ "Rebel", "na", {
	                "textures\rebel\REBEL_Offroad.paa",
	                "textures\rebel\REBEL_Offroad.paa"
            } },
			{ "Grün", "civ", {
	                "textures\civ\CIV_Offroad_Gruen.paa",
	                "textures\civ\CIV_Offroad_Gruen.paa"
            } },
            { "Taxi", "karteileiche", {
	                "textures\civ\CIV_Offroad_taxi.paa",
	                "textures\civ\CIV_Offroad_taxi.paa"
            } },
			{ "THW", "disabled", {
	                "textures\thw\THW_Offroad.paa",
	                "textures\thw\THW_Offroad.paa"
            } },
			{ "THW", "disabled", {
	                "textures\thw\THW_Offroad.paa",
	                "textures\thw\THW_Offroad.paa"
            } },
			{ "THW", "disabled", {
	                "textures\thw\THW_Offroad.paa",
	                "textures\thw\THW_Offroad.paa"
            } },
			{ "THW", "disabled", {
	                "textures\thw\THW_Offroad.paa",
	                "textures\thw\THW_Offroad.paa"
            } },
			{ "Polizei", "cop", {
	                "textures\cop\COP_Offroad.paa",
	                "textures\cop\COP_Offroad.paa"
            } },
			{ "ASF", "asf", {
	                "textures\asf\ASF_Offroad.paa",
	                "textures\asf\ASF_Offroad.paa"
            } },
			{ "THW", "thw", {
	                "textures\thw\THW_Offroad.paa",
	                "textures\thw\THW_Offroad.paa"
            } },
			{ "Twitch", "civ", {
	                "textures\civ\CIV_Offroad_Twitch.paa",
	                "textures\civ\CIV_Offroad_Twitch.paa"
            } },
            { "Event", "event", {
                "textures\Event\Event_Offroad.paa",
				"textures\Event\Event_Offroad.paa"
            } },
			{ "Twitch", "civ", {
	                "textures\civ\CIV_Offroad_Twitch_Robkay.paa",
	                "textures\civ\CIV_Offroad_Twitch_Robkay.paa"
            } }
	    };
    };

	class B_G_Offroad_01_armed_F : Default {
        vItemSpace = 20;
        storageFee[] = { 2099497, 0, 0, 0 };
		garageSell[] = { 2500000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 2500000;
        textures[] = {
			{ "Rebel", "reb", {
                "a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_01_co.paa"
            } },
            { "Polizei", "cop", {
	                "textures\cop\COP_Offroad.paa"
            } }
		};
    };

	class B_G_Offroad_01_F : C_Offroad_01_F {
        textures[] = {
			{ "Feldjäger", "cop", {
	                "textures\cop\COP_Offroad_Jaeger.paa"
            } },
			{ "Rebel", "reb", {
                "a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_01_co.paa"
            } }
		};
    };

	class C_SUV_01_F : Default {
        vItemSpace = 50;
        storageFee[] = { 6495, 0, 0, 0 };
		garageSell[] = { 14382, 0, 0, 0 };
        insurance = 2500;
        chopShop = 14382;
        textures[] = {
        	{ "Dunkelrot", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"
            } },
			{ "Schwarz", "civ", {
	                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa"
            } },
			{ "Silber", "civ", {
	                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"
            } },
			{ "Orange", "civ", {
	                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"
            } },
			{ "Blau", "civ", {
                "textures\civ\CIV_Suv_Blau.paa"
            } },
			{ "Grün", "civ", {
                "textures\civ\CIV_Suv_Gruen.paa"
            } },
			{ "BMW", "civ", {
	                "textures\civ\CIV_Suv_Bmw.paa"
            }, true },
			{ "APD", "civ", {
	                "textures\civ\CIV_APD_Suv.paa"
            }, true },
			{ "ALG", "civ", {
	                "textures\civ\CIV_Suv_Alg.paa"
            }, true },
            { "Polizei", "cop", {
                "textures\cop\COP_Suv.paa"
            } },
            { "SEK", "sek", {
                "textures\cop\SEK_Suv.paa"
            } },
            { "THW", "thw", {
                "textures\thw\THW_Suv.paa"
            } },
            { "Notarzt", "thw", {
                "textures\thw\THW_suv_notarzt.paa"
            }, true },
            { "THW", "disabled", {
                "textures\thw\THW_Suv.paa"
            } },
            { "THW", "disabled", {
                "textures\thw\THW_Suv.paa"
            } },
            { "ASF", "asf", {
                "textures\asf\ASF_Suv.paa"
            } },
            { "Event", "event", {
                "textures\Event\Event_SUV.paa"
            } },
            { "Camo", "reb", {
                "textures\civ\CIV_suv_camo.paa"
            } },
            { "Taxi", "civ", {
                "textures\civ\CIV_Suv_Taxi.paa"
            } }
	    };
    };

	class C_Hatchback_01_F : Default {
		vItemSpace = 40;
		storageFee[] = { 6495, 0, 0, 0 };
		garageSell[] = { 9000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 9000;
        textures[] = {
        	{ "Beige", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa"
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
            { "Fire", "civ", {
                "textures\civ\CIV_Hatchback_Fire.paa"
            }, true },
            { "Taxi", "civ", {
                "textures\civ\CIV_Hatchback_Taxi.paa"
            } },
            { "Polizei", "cop", {
                "textures\cop\COP_Hatchback.paa"
            } },
            { "THW", "thw", {
                "textures\thw\THW_Hatchback.paa"
            } },
            { "Notarzt", "thw", {
                "textures\thw\THW_Hatchback_notarzt.paa"
            }, true }
        };
    };

	class C_Hatchback_01_sport_F : Default {
		vItemSpace = 45;
		storageFee[] = { 6495, 0, 0, 0 };
		garageSell[] = { 30123, 0, 0, 0 };
		insurance = 2500;
		chopShop = 40798;
        textures[] = {
        	{ "Rot", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"
            } },
			{ "Dunkelblau", "civ", {
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
            { "Taxi", "civ", {
                "textures\civ\CIV_Hatchback_Taxi.paa"
            } },
            { "Polizei", "cop", {
                "textures\cop\COP_Hatchback.paa"
            } },
            { "THW", "thw", {
                "textures\thw\THW_Hatchback.paa"
            } },
            { "Notarzt", "thw", {
                "textures\thw\THW_Hatchback_notarzt.paa"
            }, true },
            { "Fire", "civ", {
                "textures\civ\CIV_Hatchback_Fire.paa"
            }, true }
        };
    };

	class C_Van_01_transport_F : Default {
		vItemSpace = 100;
		storageFee[] = { 6495, 0, 0, 0 };
		garageSell[] = { 43248, 0, 0, 0 };
		insurance = 2500;
		chopShop = 47687;
        textures[] = {
        	{ "Weiss", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
            { "Rot", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } },
            { "Schwarz", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_black_co.paa"
            } },
            { "Event", "event", {
                "textures\Event\Event_Truck_0.paa",
				"textures\Event\Event_Truck_1.paa"
            } },
            { "THW", "thw", {
                "textures\thw\THW_boxer_0.paa",
				"textures\thw\THW_boxer_1.paa"
            } },
            { "THW", "disabled", {
                "textures\thw\THW_boxer_0.paa",
				"textures\thw\THW_boxer_1.paa"
            } },
            { "THW", "disabled", {
                "textures\thw\THW_boxer_0.paa",
				"textures\thw\THW_boxer_1.paa"
            } }
        };
    };

	class C_Van_01_box_F : C_Van_01_transport_F {
		vItemSpace = 150;
		storageFee[] = { 6495, 0, 0, 0 };
		garageSell[] = { 85000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 85000;
    };

	class C_Van_01_fuel_F : C_Van_01_transport_F {
		vItemSpace = 150;
		storageFee[] = { 6495, 0, 0, 0 };
		garageSell[] = { 110000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 110000;
		textures[] = {};
	};

	class B_Truck_01_transport_F : Default {
		vItemSpace = 1000;
		storageFee[] = { 6495, 0, 0, 0 };
		garageSell[] = { 500000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 500000;
		textures[] = {
			{ "Grün", "civ", {
                "\A3\Soft_F_Beta\Truck_01\data\truck_01_ext_01_co.paa",
				"\A3\Soft_F_Beta\Truck_01\data\truck_01_ext_02_co.paa"
            } },
            { "Nuka Cola", "civ", {
                "textures\civ\CIV_Hemtt_Cola_0.paa",
				"textures\civ\CIV_Hemtt_Cola_1.paa"
            }, true },
            { "Devil", "civ", {
                "textures\civ\CIV_Hemtt_Devil_0.paa",
				"textures\civ\CIV_Hemtt_Devil_1.paa"
            }, true },
			{ "THW", "disabled", {
                "textures\THW\THW_Hemtt_0.paa",
				"textures\THW\THW_Hemtt_1.paa"
            } },
			{ "THW", "thw", {
                "textures\THW\THW_Hemtt_0.paa",
				"textures\THW\THW_Hemtt_1.paa"
            } }
		};
	};

	class B_Truck_01_covered_F : B_Truck_01_transport_F {
		vItemSpace = 1000;
		storageFee[] = { 6495, 0, 0, 0 };
		garageSell[] = { 750000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 750000;
	};

	class B_Truck_01_box_F : B_Truck_01_transport_F {
		vItemSpace = 1500;
		storageFee[] = { 6495, 0, 0, 0 };
		garageSell[] = { 1100000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 1700000;
	};

	class B_Truck_01_fuel_F : B_Truck_01_transport_F {
		vItemSpace = 1000;
		storageFee[] = { 6495, 0, 0, 0 };
		garageSell[] = { 850000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 850000;
	};

	class B_Truck_01_ammo_F : Default {
		alias = "Castor-Transport HEMMT";
		vItemSpace = 1000;
		storageFee[] = { 6495, 0, 0, 0 };
		garageSell[] = { 1750000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 1750000;
				textures[] = {
			{ "Radioaktiv", "civ", {
                "textures\civ\CIV_Hemtt_Radio_0.paa",
                "\a3\soft_f_beta\Truck_01\data\truck_01_ext_02_co.paa",
				"textures\civ\CIV_Hemtt_Radio_2.paa"
            } }
		};
	};

	class I_Truck_02_transport_F : Default {
		vItemSpace = 250;
		storageFee[] = { 6495, 0, 0, 0 };
		garageSell[] = { 170000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 275000;
        textures[] = {
        	{ "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            } },
        	{ "Weed", "civ", {
                "textures\civ\CIV_Zamak_Weed_0.paa",
                "textures\civ\CIV_Zamak_Weed_1.paa"
            }, true },
        	{ "EREKA", "civ", {
                "textures\civ\CIV_Zamak_Ereka_0.paa",
                "textures\civ\CIV_Zamak_Ereka_1.paa"
            }, true },
        	{ "Redbull", "civ", {
                "textures\civ\CIV_Zamak_Redbull_0.paa",
                "textures\civ\CIV_Zamak_Redbull_0.paa"
            }, true }
        };
    };

	class I_Truck_02_covered_F : I_Truck_02_transport_F {
		vItemSpace = 400;
		storageFee[] = { 6495, 0, 0, 0 };
		garageSell[] = { 275000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 275000;
    };

	class C_Truck_02_fuel_F : Default {
		vItemSpace = 500;
		storageFee[] = { 6495, 0, 0, 0 };
		garageSell[] = { 275000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 275000;
	};

	class I_Truck_02_box_F : I_Truck_02_transport_F {
		vItemSpace = 400;
		storageFee[] = { 6495, 0, 0, 0 };
		garageSell[] = { 275000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 275000;
        textures[] = {
        	{ "Polizei", "cop", {
                "textures\cop\COP_Zamak_0.paa",
                "textures\cop\COP_Zamak_1.paa"
            } },
            { "THW", "thw", {
                "textures\thw\THW_Zamak_0.paa",
				"textures\thw\THW_Zamak_1.paa"
            } }
        };
    };

	class O_Truck_03_transport_F : Default {
		vItemSpace = 500;
		storageFee[] = { 6495, 0, 0, 0 };
		garageSell[] = { 275000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 275000;
        textures[] = {
        	{ "Hex-Tarn", "civ", {
                "a3\soft_f_epc\truck_03\data\truck_03_ext01_co.paa",
				"a3\soft_f_epc\truck_03\data\truck_03_ext02_co.paa",
				"a3\soft_f_epc\truck_03\data\truck_03_cargo_co.paa"
            }, true },
        	{ "Bau", "civ", {
                "textures\civ\CIV_tempest_bau_0.paa",
                "textures\civ\CIV_tempest_bau_1.paa",
                "textures\civ\CIV_tempest_bau_2.paa"
            } },
            { "Grau", "civ", {
                "textures\civ\CIV_tempest_grey_0.paa",
                "textures\civ\CIV_tempest_grey_1.paa",
                "textures\civ\CIV_tempest_grey_2.paa"
            }, true }
        };
	};

	class O_Truck_03_covered_F : O_Truck_03_transport_F {
		vItemSpace = 1000;
		storageFee[] = { 6495, 0, 0, 0 };
		garageSell[] = { 325000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 325000;
        textures[] = {
        	{ "Hex-Tarn", "civ", {
                "a3\soft_f_epc\truck_03\data\truck_03_ext01_co.paa",
				"a3\soft_f_epc\truck_03\data\truck_03_ext02_co.paa",
				"a3\soft_f_epc\truck_03\data\truck_03_cargo_co.paa",
				"a3\soft_f_epc\truck_03\data\truck_03_cover_co.paa"
            }, true },
        	{ "Bau", "civ", {
                "textures\civ\CIV_tempest_bau_0.paa",
                "textures\civ\CIV_tempest_bau_1.paa",
                "textures\civ\CIV_tempest_bau_2.paa",
				"#(argb,8,8,3)color(0.3,0.3,1,0.2)"				
            } },
            { "Play Germany", "civ", {
                "textures\civ\CIV_tempest_grey_0.paa",
                "textures\civ\CIV_tempest_grey_1.paa",
                "textures\civ\CIV_tempest_grey_2.paa",
                "textures\civ\CIV_tempest_grey_pg.paa"				
            }, true },
            { "Altis Transport", "civ", {
                "textures\civ\CIV_tempest_grey_0.paa",
                "textures\civ\CIV_tempest_grey_1.paa",
                "textures\civ\CIV_tempest_grey_2.paa",
                "textures\civ\CIV_tempest_grey_at.paa"				
            }, true },
            { "Castle", "civ", {
                "textures\civ\CIV_tempest_grey_0.paa",
                "textures\civ\CIV_tempest_grey_1.paa",
                "textures\civ\CIV_tempest_grey_2.paa",
                "textures\civ\CIV_tempest_grey_burg.paa"				
            }, true }
        };
	};

	class O_Truck_03_device_F : O_Truck_03_transport_F {
		vItemSpace = 1000;
		storageFee[] = { 6495, 0, 0, 0 };
		garageSell[] = { 1000000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 1000000;
	};

	class O_Truck_03_fuel_F : O_Truck_03_transport_F {
		vItemSpace = 750;
		storageFee[] = { 6495, 0, 0, 0 };
		garageSell[] = { 350000, 0, 0, 0 };
		insurance = 2500;
		chopShop = 350000;
        textures[] = {
        	{ "Hex-Tarn", "civ", {
                "a3\soft_f_epc\truck_03\data\truck_03_ext01_co.paa",
				"a3\soft_f_epc\truck_03\data\truck_03_ext02_co.paa",
				"a3\soft_f_epc\truck_03\data\truck_03_fuel_co.paa"				
            }, true },
        	{ "Bau", "civ", {
                "textures\civ\CIV_tempest_bau_0.paa",
                "textures\civ\CIV_tempest_bau_1.paa",
                "textures\civ\CIV_tempest_grey_fuel.paa"	
				
            } },
            { "Grau", "civ", {
                "textures\civ\CIV_tempest_grey_0.paa",
                "textures\civ\CIV_tempest_grey_1.paa",
                "textures\civ\CIV_tempest_grey_fuel.paa"		
            }, true }
		};
	};

	class B_MRAP_01_F : Default {
        vItemSpace = 10;
        storageFee[] = { 500000, 0, 0, 0 };
		garageSell[] = { 1000000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 1000000;
        textures[] = {
        	{ "Standart", "reb", {
                "\A3\Soft_F\MRAP_01\Data\mrap_01_base_co.paa",
				"\a3\soft_f\MRAP_01\Data\mrap_01_adds_co.paa"
            } },
            { "Rot", "reb", {
                "textures\rebel\REBEL_Hunter_Rot_0.paa",
				"textures\rebel\REBEL_Hunter_1.paa"
            }, true },
            { "Blau", "reb", {
                "textures\rebel\REBEL_Hunter_Blau_0.paa",
				"textures\rebel\REBEL_Hunter_1.paa"
            }, true },
            { "Grün", "reb", {
                "textures\rebel\REBEL_Hunter_Gruen_0.paa",
				"textures\rebel\REBEL_Hunter_1.paa"
            }, true },
            { "Grau", "reb", {
                "textures\rebel\REBEL_Hunter_Grau_0.paa",
				"textures\rebel\REBEL_Hunter_1.paa"
            }, true },
            { "Polizei", "cop", {
                "textures\cop\COP_Hunter_0.paa",
				"textures\cop\COP_Hunter_1.paa"
            } },
            { "SEK", "sek", {
                "textures\cop\SEK_Hunter_0.paa",
				"textures\cop\SEK_Hunter_1.paa"
            } },
            { "ASF", "asf", {
                "textures\asf\ASF_Hunter_0.paa",
				"textures\asf\ASF_Hunter_1.paa"
            } },
        	{ "Standart", "civ", {
                "\A3\Soft_F\MRAP_01\Data\mrap_01_base_co.paa",
				"\a3\soft_f\MRAP_01\Data\mrap_01_adds_co.paa"
            } }
        };
    };

	class B_MRAP_01_hmg_F : Default {
        vItemSpace = 10;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 0, 0, 0, 0 };
        insurance = 2500;
        chopShop = 0;
        textures[] = {
			{ "Regular", "civ", {
                "\A3\Soft_F\MRAP_01\Data\mrap_01_base_co.paa",
				"\a3\soft_f\MRAP_01\Data\mrap_01_adds_co.paa"
            } },
			{ "Polizei", "cop", {
                "textures\cop\COP_Hunter_0.paa",
				"textures\cop\COP_Hunter_1.paa"
            } },
            { "SEK", "sek", {
                "textures\cop\SEK_Hunter_0.paa",
				"textures\cop\SEK_Hunter_1.paa"
            } }
		};
    };

	class O_MRAP_02_F : Default {
        vItemSpace = 60;
        storageFee[] = { 399775, 0, 0, 0 };
		garageSell[] = { 888888, 0, 0, 0 };
        insurance = 2500;
        chopShop = 888888;
        textures[] = {
			{ "Hexa Tarn", "reb", {
                "\a3\soft_f\MRAP_02\Data\mrap_02_ext_01_co.paa",
				"\a3\soft_f\MRAP_02\Data\mrap_02_ext_02_co.paa"
            } },
			{ "Braun", "reb", {
                "textures\rebel\REBEL_Ifrit_Braun_0.paa",
				"textures\rebel\REBEL_Ifrit_Braun_1.paa"
            }, true },
            { "Grau", "reb", {
                "textures\rebel\REBEL_Ifrit_Grau_0.paa",
				"textures\rebel\REBEL_Ifrit_Grau_1.paa"
            }, true },
            { "Blau", "reb", {
                "textures\rebel\REBEL_Ifrit_Blau_0.paa",
				"textures\rebel\REBEL_Ifrit_Blau_1.paa"
            }, true },
            { "Rot", "reb", {
                "textures\rebel\REBEL_Ifrit_Rot_0.paa",
				"textures\rebel\REBEL_Ifrit_Rot_1.paa"
            }, true }
		};
    };

	class I_MRAP_03_F : Default {
        vItemSpace = 10;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 0, 0, 0, 0 };
        insurance = 2500;
        chopShop = 0;
        textures[] = {
			{ "Digi Green", "civ", {
	                "\A3\Soft_F_beta\MRAP_03\Data\mrap_03_ext_indp_co.paa"
	        } },
            { "Bundespolizei", "cop", {
                "textures\cop\COP_Strider.paa"
            } },
            { "SEK", "sek", {
                "textures\cop\SEK_Strider.paa"
            } },
			{ "Nato Grün", "civ", {
	                "\A3\Soft_F_beta\MRAP_03\Data\mrap_03_ext_co.paa"
	        } }
		};
    };

	class I_MRAP_03_hmg_F : Default {
        vItemSpace = 10;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 0, 0, 0, 0 };
        insurance = 2500;
        chopShop = 0;
        textures[] = {
			{ "Digi Green", "civ", {
	                "\A3\Soft_F_beta\MRAP_03\Data\mrap_03_ext_indp_co.paa"
	        } },
			{ "SEK", "sek", {
                "textures\cop\SEK_Strider.paa"
            } }
		};
    };

	class B_Heli_Light_01_F : Default {
        vItemSpace = 50;
        storageFee[] = { 143437, 0, 0, 0 };
		garageSell[] = { 425000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 425000;
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
            }, true },
			{ "Jeans Blue", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"
            }, true },
			{ "Speedy Redline", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"
            }, true },
			{ "Sunset", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"
            }, true },
			{ "Vrana", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"
            }, true },
			{ "Waves Blue", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"
            }, true },
			{ "Wespe", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa"
            }, true },
			{ "Rebel Digital", "reb", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
            } },
            { "THW", "thw", {
                "textures\THW\THW_Hummingbird.paa"
            } },
            { "THW", "disabled", {
                "textures\THW\THW_Hummingbird.paa"
            } },
            { "Polizei", "cop", {
                "textures\cop\COP_Hummingbird.paa"
            } },
            { "ASF", "asf", {
                "textures\asf\ASF_Hummingbird.paa"
            } },
            { "THW", "disabled", {
                "textures\THW\THW_Hummingbird.paa"
            } },
            { "THW", "disabled", {
                "textures\THW\THW_Hummingbird.paa"
            } },
			{ "SEK", "cop", {
	                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa"
            } },
			{ "Grün", "reb", {
	                "a3\air_f\heli_light_01\data\heli_light_01_ext_blufor_co.paa"
            } },
			{ "Vrana", "reb", {
	                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"
            } },
            { "Event", "event", {
                "textures\Event\Event_Hummingbird.paa"
            } }
        };
    };
	
	class C_Heli_Light_01_civil_F : B_Heli_Light_01_F {
        vItemSpace = 65;
        storageFee[] = { 168750, 0, 0, 0 };
		garageSell[] = { 500000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 500000;
    };

	class O_Heli_Light_02_unarmed_F : Default {
        vItemSpace = 150;
        storageFee[] = { 180000, 0, 0, 0 };
		garageSell[] = { 1000000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 1000000;
        textures[] = {
        	{ "Schwarz", "civ", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa"
            } },
			{ "Schwarz", "asf", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa"
            } },
			{ "Weiss / Blau", "civ", {
	                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"
            } },
			{ "Orca", "civ", {
	                "a3\air_f_heli\heli_light_02\data\heli_light_02_ext_opfor_v2_co.paa"
            }, true },
			{ "Digi Green", "reb", {
	                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"
            } },
			{ "Desert Digi", "reb", {
	                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa"
            } },
            { "THW", "thw", {
                "textures\THW\THW_Orca.paa"
            } },
            { "THW", "disabled", {
                "textures\THW\THW_Orca.paa"
            } },
            { "THW", "disabled", {
                "textures\THW\THW_Orca.paa"
            } },
            { "Polizei", "cop", {
                "textures\cop\COP_orca.paa"
            } }
        };
    };

	class I_Heli_light_03_unarmed_F : Default {
        vItemSpace = 100;
        storageFee[] = { 300000, 0, 0, 0 };
		garageSell[] = { 1333333, 0, 0, 0 };
        insurance = 2500;
        chopShop = 0;
        textures[] = {
			{ "Digi Grün", "reb", {
                "\a3\air_f_epb\Heli_Light_03\Data\heli_light_03_base_indp_co.paa"
            } },
			{ "ASF", "asf", {
                "textures\asf\ASF_Hellcat.paa"
            } },
			{ "Polizei", "cop", {
	                "textures\cop\COP_Hellcat.paa"
            } },
			{ "SAR", "thw", {
	                "textures\thw\THW_hellcat.paa"
            } },
            { "Event", "event", {
                "textures\Event\Event_Hellcat.paa"
            } }
		};
    };

	class B_Heli_Transport_01_F : Default {
        vItemSpace = 30;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 0, 0, 0, 0 };
        insurance = 2500;
        chopShop = 0;
        textures[] = {
			{ "Polizei", "cop", {
                "textures\cop\COP_Ghosthawk_0.paa",
				"textures\cop\COP_Ghosthawk_1.paa"
            } },
            { "SEK", "cop", {
                "a3\air_f_beta\Heli_Transport_01\data\heli_transport_01_ext01_co.paa",
				"a3\air_f_beta\Heli_Transport_01\data\heli_transport_01_ext02_co.paa"
            } },
            { "Event", "event", {
                "a3\air_f_beta\Heli_Transport_01\data\heli_transport_01_ext01_co.paa",
				"a3\air_f_beta\Heli_Transport_01\data\heli_transport_01_ext02_co.paa"
            } }
		};
    };

	class B_Heli_Transport_03_unarmed_F : Default {
        vItemSpace = 750;
        storageFee[] = { 2775000, 0, 0, 0 };
		garageSell[] = { 12333333, 0, 0, 0 };
        insurance = 2500;
        chopShop = 12333333;
        textures[] = {
			{ "Schwarz", "civ", {
                "a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext01_black_co.paa",
				"a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext02_black_co.paa"
            } },
			{ "Grün", "civ", {
                "a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext01_co.paa",
				"a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext02_co.paa"
            } },
            { "ALG", "civ", {
                "textures\civ\CIV_Huron_Alg_0.paa",
				"textures\civ\CIV_Huron_Alg_1.paa"
            } },
            { "Tarn", "reb", {
                "textures\rebel\REBEL_Huron_Tarn_0.paa",
				"textures\rebel\REBEL_Huron_Tarn_1.paa"
            } },
            { "Grün", "reb", {
                "a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext01_co.paa",
				"a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext02_co.paa"
            } },
			{ "SEK", "cop", {
				"a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext01_black_co.paa",
                "a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext02_black_co.paa"
            } },
			{ "ASF", "asf", {
                "textures\asf\ASF_Huron.paa",
                "textures\asf\ASF_Huron2.paa"
            } }
		};
    };

	class I_Heli_Transport_02_F : Default {
        vItemSpace = 300;
        storageFee[] = { 250000, 0, 0, 0 };
		garageSell[] = { 2000000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 2000000;
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
            }, true },
            { "THW", "thw", {
                "textures\THW\THW_Mowhawk_0.paa",
                "textures\THW\THW_Mowhawk_1.paa",
                "textures\THW\THW_Mowhawk_2.paa"
            } }
        };
    };

	class O_Heli_Transport_04_F : Default {
        vItemSpace = 50;
        storageFee[] = { 1012500, 0, 0, 0 };
		garageSell[] = { 4500000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 0;
        textures[] = {
			{ "Hexa Tarn", "civ", {
                "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_co.paa",
                "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_co.paa"
            } },
            { "Grau", "civ", {
                "textures\civ\CIV_Taru_Grau_0.paa",
                "textures\civ\CIV_Taru_Grau_1.paa"
            }, true },
            { "Skycrane", "civ", {
                "textures\civ\CIV_Taru_Skycrane_0.paa",
                "textures\civ\CIV_Taru_Skycrane_1.paa"
            }, true },
            { "Schwarz", "civ", {
                "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_black_co.paa",
                "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_black_co.paa"
            } },
            { "THW", "thw", {
                "textures\THW\THW_Taru_0.paa",
                "textures\THW\THW_Taru_1.paa"
            } },
            { "THW", "disabled", {
                "textures\THW\THW_Taru_0.paa",
                "textures\THW\THW_Taru_1.paa"
            } }
		};
    };

	class O_Heli_Transport_04_box_F : O_Heli_Transport_04_F {
        vItemSpace = 550;
        storageFee[] = { 1350000, 0, 0, 0 };
		garageSell[] = { 6000000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 6000000;
		textures[] = {
			{ "Hexa Tarn", "civ", {
                "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_co.paa",
                "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_co.paa",
				"a3\air_f_heli\heli_transport_04\data\heli_transport_04_pod_ext01_co.paa",
				"a3\air_f_heli\heli_transport_04\data\heli_transport_04_pod_ext02_co.paa"

            } },
            { "Grau", "civ", {
                "textures\civ\CIV_Taru_Grau_0.paa",
                "textures\civ\CIV_Taru_Grau_1.paa",
				"#(rgb,8,8,3)color(0.1,0.1,0.1,1)",
				"#(rgb,8,8,3)color(0.1,0.1,0.1,1)"
            }, true },
            { "Skycrane", "civ", {
                "textures\civ\CIV_Taru_Skycrane_0.paa",
                "textures\civ\CIV_Taru_Skycrane_1.paa",
				"#(rgb,8,8,3)color(1,0.15,0,1)",
				"#(rgb,8,8,3)color(1,0.15,0,1)"
            }, true },
            { "Schwarz", "civ", {
                "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_black_co.paa",
                "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_black_co.paa",
				"a3\air_f_heli\heli_transport_04\data\heli_transport_04_pod_ext01_black_co.paa",
				"a3\air_f_heli\heli_transport_04\data\heli_transport_04_pod_ext02_black_co.paa"
            } }
		};
    };

	class O_Heli_Transport_04_bench_F : Default {
        vItemSpace = 65;
        storageFee[] = { 10000, 0, 0, 0 };
		garageSell[] = { 0, 0, 0, 0 };
        insurance = 2500;
        chopShop = 0;
        textures[] = {
			{ "ASF", "asf", {
                "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_black_co.paa",
                "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_black_co.paa"
            } }
		};
    };

	class O_Heli_Transport_04_medevac_F : Default {
        vItemSpace = 65;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 0, 0, 0, 0 };
        insurance = 2500;
        chopShop = 0;
        textures[] = {
			{ "THW", "disabled", {
                "textures\THW\THW_Taru_0.paa",
                "textures\THW\THW_Taru_1.paa",
                "textures\THW\THW_Taru_2.paa",
                "textures\THW\THW_Taru_3.paa"
            } },
			{ "THW", "thw", {
                "textures\THW\THW_Taru_0.paa",
                "textures\THW\THW_Taru_1.paa",
                "textures\THW\THW_Taru_2.paa",
                "textures\THW\THW_Taru_3.paa"
            } }
		};
    };

	class C_Rubberboat : Default {
		vItemSpace = 75;
		storageFee[] = { 1499, 0, 0, 0 };
		garageSell[] = { 4500, 0, 0, 0 };
		insurance = 2500;
		chopShop = 4500;
		textures[] = {};
	};

	class B_Boat_Transport_01_F : Default {
        vItemSpace = 75;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 2500, 0, 0, 0 };
        insurance = 2500;
        chopShop = 0;
        textures[] = {};
    };

	class C_Boat_Civil_01_F : Default {
		vItemSpace = 500;
		storageFee[] = { 6598, 0, 0, 0 };
		garageSell[] = { 18500, 0, 0, 0 };
		insurance = 2500;
		chopShop = 18500;
		textures[] = {};
	};

	class C_Boat_Civil_01_police_F : Default {
        vItemSpace = 150;
        storageFee[] = { 10000, 0, 0, 0 };
		garageSell[] = { 0, 0, 0, 0 };
        insurance = 2500;
        chopShop = 0;
        textures[] = {
			{ "Polizei", "cop", {
	                "textures\cop\COP_Speedboot.paa"
            } }
		};
    };

	class B_Boat_Armed_01_minigun_F : Default {
        vItemSpace = 175;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 0, 0, 0, 0 };
        insurance = 2500;
        chopShop = 0;
        textures[] = {
			{ "Polizei", "cop", {
	                "textures\cop\COP_Gunboot.paa",
					"a3\boat_f\boat_armed_01\data\boat_armed_01_int_co.paa",
					""
            } },
			{ "SEK", "sek", {
	                "textures\cop\SEK_Gunboot.paa",
					"textures\cop\SEK_Gunboot_1.paa",
					""
            } }
		};
    };

	class B_SDV_01_F : Default {
        vItemSpace = 20;
        storageFee[] = { 299925, 0, 0, 0 };
		garageSell[] = { 75000, 0, 0, 0 };
        insurance = 2500;
        chopShop = 75000;
        textures[] = {
			{ "U-Boot", "civ", {
	                "\a3\boat_f_beta\SDV_01\Data\sdv_ext_co.paa"
            } },
			{ "Polizei", "cop", {
	                "textures\cop\COP_uboot.paa"
            } }
		};
    };

    class B_Slingload_01_Cargo_F : Default {
		vItemSpace = 400;
		storageFee[] = { 0, 0, 0, 0 };
		garageSell[] = { 0, 0, 0, 0 };
		insurance = 0;
		chopShop = 0;
		textures[] = {};
	};

    class B_Slingload_01_Repair_F : Default {
		vItemSpace = 3000;
		storageFee[] = { 0, 0, 0, 0 };
		garageSell[] = { 0, 0, 0, 0 };
		insurance = 0;
		chopShop = 0;
		textures[] = {};
	};

	class Box_IND_AmmoVeh_F : Default {
		vItemSpace = 150;
		storageFee[] = { 500, 0, 0, 0 };
		garageSell[] = { 4500, 0, 0, 0 };
		insurance = 0;
		chopShop = 0;
		textures[] = {};
	};
	class Box_IND_Grenades_F : Default {
		vItemSpace = 350;
	};
	
	class I_supplyCrate_F : Default {
		vItemSpace = 700;
	};
	
	class Land_Wreck_Traw_F : Default {
		vItemSpace = 10000000;
	};
	
	class Land_Wreck_Traw2_F : Default {
		vItemSpace = 10000000;
	};
};