class CarShops {
	/*
		Format:
		{ Classname, rental price, license required, { varname, >= value } }

		{ varname, >= value} this is a "level" requirement mainly used by cops and rebels, do not fill this in if you are not utilizing it.
	*/
    class civ_car {
        side = "civ";
        vehicles[] = {
            { "B_Quadbike_01_F", 5500, { "" }, { "", "", -1 } },
            { "C_Hatchback_01_F", 15500, { "driver" }, { "", "", -1 } },
            { "C_Offroad_01_F", 18500, { "driver" }, { "", "", -1 } },
            { "C_SUV_01_F", 45000, { "driver" }, { "", "", -1 } },
            { "C_Hatchback_01_sport_F", 110000, { "driver" }, { "", "", -1 } },
            { "C_Van_01_transport_F", 75000, { "driver" }, { "", "", -1 } }
        };
    };
	
	class gun_big {
        side = "civ";
        vehicles[] = {
            { "B_Quadbike_01_F", 12500, { "" }, { "", "", -1 } },
            { "B_Heli_Light_01_F", 525000, { "" }, { "", "", -1 } },
            { "C_SUV_01_F", 20000, { "" }, { "", "", -1 } },
            { "C_Offroad_01_F", 20000, { "" }, { "", "", -1 } },
            { "C_Hatchback_01_sport_F", 100000, { "" }, { "", "", -1 } },
            { "B_Truck_01_transport_F", 1000000, { "" }, { "", "", -1 } },
			{ "O_Truck_03_device_F", 1300000, { "" }, { "", "", -1 } },
			{ "B_Truck_01_covered_F", 1900000, { "" }, { "", "", -1 } }
        };
    };

    class kart_shop {
        side = "civ";
        vehicles[] = {
            { "C_Kart_01_Blu_F", 15000 , { "driver" }, { "", "", -1 } },
            { "C_Kart_01_Fuel_F", 15000, { "driver" }, { "", "", -1 } },
            { "C_Kart_01_Red_F", 15000, { "driver" }, { "", "", -1 } },
            { "C_Kart_01_Vrana_F", 15000, { "driver" }, { "", "", -1 } },
			{ "C_Offroad_luxe_F", 15000, { "presse" }, { "", "", -1 } },
			{ "SUV_01_base_black_F", 15000, { "presse" }, { "", "", -1 } }
        };
    };

    class med_shop {
        side = "med";
        vehicles[] = {
            { "B_Quadbike_01_F", 3000, { "" }, { "life_mediclevel", "SCALAR", 1 } },
            { "C_Van_01_box_F", 13000, { "" }, { "life_mediclevel", "SCALAR", 2 } },
            { "C_Offroad_01_F", 10000, { "" }, { "life_mediclevel", "SCALAR", 1 } },
            { "C_SUV_01_F", 10000, { "" }, { "life_mediclevel", "SCALAR", 3 } },
			{ "O_Truck_02_box_F", 10000, { "" }, { "life_mediclevel", "SCALAR", 3 } },
			{ "B_Truck_01_mover_F", 30000, { "" }, { "life_mediclevel", "SCALAR", 4 } },
			{ "B_MRAP_01_F", 30000, { "" }, { "life_mediclevel", "SCALAR", 5 } }
        };
    };

    class med_air_hs {
        side = "med";
        vehicles[] = {
            { "B_Heli_Light_01_F", 30000, { "" }, { "life_mediclevel", "SCALAR", 2 } },
            { "O_Heli_Light_02_unarmed_F", 50000, { "" }, { "life_mediclevel", "SCALAR", 3 } },
			{ "I_Heli_Transport_02_F", 70000, { "" }, { "life_mediclevel", "SCALAR", 4 } }
        };
    };

    class civ_truck {
        side = "civ";
        vehicles[] = {
            { "C_Van_01_box_F", 60000, { "trucking" }, { "", "", -1 } },
            { "I_G_Van_01_fuel_F", 100000, { "trucking" }, { "", "", -1 } },
            { "I_Truck_02_transport_F", 175000, { "trucking" }, { "", "", -1 } },
            { "I_Truck_02_fuel_F", 140000, { "trucking" }, { "", "", -1 } },
            { "I_Truck_02_covered_F", 245000, { "trucking" }, { "", "", -1 } },
            { "I_Truck_02_box_F", 285000, { "trucking" }, { "", "", -1 } },
            { "B_Truck_01_mover_F", 125000, { "trucking" }, { "", "", -1 } },
            { "B_Truck_01_transport_F", 1200000, { "trucking" }, { "", "", -1 } },
			{ "B_Truck_01_fuel_F", 1400000, { "trucking" }, { "", "", -1 } },
			{ "B_Truck_01_covered_F", 1500000, { "trucking" }, { "", "", -1 } },
			{ "B_Truck_01_box_F", 2500000, { "trucking" }, { "", "", -1 } },
			{ "O_Truck_03_transport_F", 810000, { "trucking" }, { "", "", -1 } },
			{ "O_Truck_03_fuel_F", 815000, { "trucking" }, { "", "", -1 } },
			{ "O_Truck_03_covered_F", 855000, { "trucking" }, { "", "", -1 } },
			{ "O_Truck_03_repair_F", 825000, { "trucking" }, { "", "", -1 } }
        };
    };
	
    class don_car {
        side = "civ";
        vehicles[] = {
            { "B_Heli_Light_01_F", 550000, { "donator" }, { "", "", -1 } },
            { "C_SUV_01_F", 10000, { "donator" }, { "", "", -1 } },
            { "C_Offroad_01_F", 7500, { "donator" }, { "", "", -1 } },
            { "C_Hatchback_01_sport_F", 50000, { "donator" }, { "", "", -1 } },
            { "B_Truck_01_transport_F", 900000, { "donator" }, { "", "", -1 } },
            { "B_Truck_01_covered_F", 800000, { "donator" }, { "", "", -1 } },
            { "O_Heli_Attack_02_F", 1000000, { "donator" }, { "", "", -1 } },
            { "I_Heli_light_03_unarmed_F", 1000000, { "donator" }, { "", "", -1 } },
			{ "B_MRAP_01_F", 1000000, { "donator" }, { "", "", -1 } }
        };
    };

    class reb_car {
        side = "civ";
        vehicles[] = {
            { "B_Quadbike_01_F", 6900, { "" }, { "", "", -1 } },
            { "B_G_Offroad_01_F", 32000, { "" }, { "", "", -1 } },
            //{ "O_MRAP_02_F", 1985000, { "" }, { "", "", -1 } },
            { "B_Heli_Light_01_F", 900000, { "" }, { "", "", -1 } },
            { "I_Heli_light_03_F", 2750000, { "rebel" }, { "", "", -1 } },
			//{ "B_Heli_Transport_03_F", 3000000, { "rebel" }, { "", "", -1 } },
			{ "O_Heli_Transport_04_bench_F", 850000, { "rebel" }, { "", "", -1 } },
			{ "O_Heli_Transport_04_box_F", 2000000, { "rebel" }, { "", "", -1 } },
			{ "O_Heli_Transport_04_F", 1600000, { "rebel" }, { "", "", -1 } },
			//{ "B_MRAP_01_F", 2000000, { "rebel" }, { "", "", -1 } },
			{ "O_Truck_03_device_F", 2200000, { "rebel" }, { "", "", -1 } },
			{ "O_Truck_03_repair_F", 710000, { "rebel" }, { "", "", -1 } },
			{ "O_Truck_03_transport_F", 750000, { "rebel" }, { "", "", -1 } },
			{ "O_Truck_03_covered_F", 825000, { "rebel" }, { "", "", -1 } },
			{ "B_G_Offroad_01_armed_F", 4000000, { "rebel" }, { "", "", -1 } }
        };
    };

    class cop_car {
        side = "cop";
        vehicles[] = {
            { "B_Quadbike_01_F", 1000, { "" }, { "", "", -1 } },
            { "C_Offroad_01_F", 1000, { "cdriver" }, { "", "", -1 } },
            { "C_SUV_01_F", 1000, { "cdriver" }, { "life_coplevel", "SCALAR", 2 } },
            { "C_Hatchback_01_sport_F", 1000, { "cdriver" }, { "life_coplevel", "SCALAR", 3 } },
            { "B_MRAP_01_F", 30000, { "cdriver" }, { "life_coplevel", "SCALAR", 3 } },
			{ "I_MRAP_03_F", 30000, { "cdriver" }, { "life_coplevel", "SCALAR", 5 } },
			{ "I_G_Offroad_01_armed_F", 75000, { "cdriver" }, { "life_coplevel", "SCALAR", 4 } },
			{ "O_MRAP_02_F", 30000, { "cdriver" }, { "life_coplevel", "SCALAR", 6 } },
			{ "B_Truck_01_transport_F", 30000, { "cdriver" }, { "life_coplevel", "SCALAR", 4 } },
			{ "B_Truck_01_mover_F", 30000, { "cdriver" }, { "life_coplevel", "SCALAR", 3 } }
        };
    };

    class civ_air {
        side = "civ";
        vehicles[] = {
            { "B_Heli_Light_01_F", 850000, { "pilot" }, { "", "", -1 } },
            { "C_Heli_Light_01_civil_F", 851000, { "pilot" }, { "", "", -1 } },
			{ "O_Heli_Light_02_unarmed_F", 1250000, { "pilot" }, { "", "", -1 } },
			{ "B_Heli_Transport_03_unarmed_F", 3000000, { "pilot" }, { "", "", -1 } },
			{ "I_Heli_Transport_02_F", 2500000, { "pilot" }, { "", "", -1 } },
			{ "O_Heli_Transport_04_box_F", 2750000, { "pilot" }, { "", "", -1 } },
			{ "O_Heli_Transport_04_covered_F", 2500000, { "pilot" }, { "", "", -1 } },
			{ "O_Heli_Transport_04_repair_F", 2250000, { "pilot" }, { "", "", -1 } },
			{ "O_Heli_Transport_04_medevac_F", 2000000, { "pilot" }, { "", "", -1 } },
			{ "O_Heli_Transport_04_fuel_F", 2000000, { "pilot" }, { "", "", -1 } },
        };
    };

    class cop_air {
        side = "cop";
        vehicles[] = {
            { "B_Heli_Light_01_F", 40000, { "cAir" }, { "", "", -1 } },
            { "O_Heli_Light_02_unarmed_F", 50000, { "cAir" }, { "life_coplevel", "SCALAR", 3 } },
			{ "I_Heli_light_03_unarmed_F", 100000, { "cAir" }, { "life_coplevel", "SCALAR", 3 } },
			{ "B_Heli_Transport_01_F", 70000, { "cAir" }, { "life_coplevel", "SCALAR", 4 } },
			{ "I_Heli_Transport_02_F", 100000, { "cAir" }, { "life_coplevel", "SCALAR", 4 } },			
			{ "I_Heli_light_03_F", 110000, { "cAir" }, { "life_coplevel", "SCALAR", 5 } },
			{ "O_Heli_Attack_02_black_F", 150000, { "cAir" }, { "life_coplevel", "SCALAR", 6 } },
			{ "O_Heli_Transport_04_covered_black_F", 50000, { "swat" }, { "life_coplevel", "SCALAR", 2 } },
			{ "O_Heli_Transport_04_bench_black_F", 50000, { "swat" }, { "life_coplevel", "SCALAR", 4 } },
			{ "B_Heli_Transport_03_F", 150000, { "swat" }, { "life_coplevel", "SCALAR", 2 } },
			{ "O_Heli_Transport_04_black_F", 50000, { "OP" }, { "life_coplevel", "SCALAR", 2 } },
        };
    };

	class cop_jet {
		side = "cop";
		vehicles[] = {
			{ "I_Plane_Fighter_03_AA_F", 50000, "OP" , { "life_coplevel", 3 }  }
		};
	};

    class cop_ship {
        side = "cop";
        vehicles[] = {
            { "B_Boat_Transport_01_F", 3000, { "cg" }, { "", "", -1 } },
            { "C_Boat_Civil_01_police_F", 20000, { "cg" }, { "", "", -1 } },
            { "B_Boat_Armed_01_minigun_F", 75000, { "swat" }, { "life_coplevel", "SCALAR", 3 } },
            { "B_SDV_01_F", 10000, { "swat" }, { "", "", -1 } }
        };
    };

    class civ_ship {
        side = "civ";
        vehicles[] = {
            { "C_Rubberboat", 15000, { "boat" }, { "", "", -1 } },
            { "C_Boat_Civil_01_F", 50000, { "boat" }, { "", "", -1 } },
            { "B_SDV_01_F", 150000, { "boat" }, { "", "", -1 } }
        };
    };
};

/*
	Vehicle Configs (Contains textures and other stuff)

	storageFee (Getting vehicles out of garage) format:
		INDEX 0: Civilian Price
		INDEX 1: Cop Price
		INDEX 3: EMS Price
		INDEX 4: OPFOR Price (Not implemented in vanilla but still leaving support

	Textures config follows { Texture Name, side, {texture(s)path}}
	Texture(s)path follows this format:
		INDEX 0: Texture Layer 0
		INDEX 1: Texture Layer 1
		INDEX 2: Texture Layer 2
		etc etc etc
*/
class LifeCfgVehicles {
	class Default {
		vItemSpace = -1;
		storageFee[] = { 1000, 1000, 1000, 1000 };
		garageSell[] = { 1, 0, 0, 0 };
		assurPrice[] = { 1000, 1000, 1000, 1000 };
		insurance = 2500;
		chopShop = 1200;
		textures[] = {};
	};

	class O_Heli_Attack_02_F {
        vItemSpace = 130;
        storageFee[] = { 45000, 100, 0, 0 };
		garageSell[] = { 57000, 100, 0, 0 };
		assurPrice[] = { 450000, 150000, 450000, 450000 };
        insurance = 2500;
        chopShop = 500000;
        textures[] = { };
    };
	
	class TrunkLocker {
        vItemSpace = 130;
    };
		
	class B_Truck_01_mover_F {
        vItemSpace = 130;
        storageFee[] = { 45000, 100, 0, 0 };
		garageSell[] = { 57000, 100, 0, 0 };
		assurPrice[] = { 19000, 19000, 19000, 19000 };
        insurance = 2500;
        chopShop = 20000;
        textures[] = {
			{ "Civ", "civ", {
                "\a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa"
				} },
			{ "med", "med", {
                "MINEFACTORY\textures\Med\hemtt_front.paa",
				"MINEFACTORY\textures\Med\hemtt_back.paa"
				} }
		};
    };
	
	class O_Truck_02_box_F {
        vItemSpace = 230;
        storageFee[] = { 1000, 100, 100, 0 };
		garageSell[] = { 1000, 100, 100, 0 };
		assurPrice[] = { 9000, 9000, 9000, 9000 };
        insurance = 2500;
        chopShop = 10000;
        textures[] = {
			{ "Medic", "med", {
                "MINEFACTORY\textures\Med\rw_fahrgestell.paa",
				"MINEFACTORY\textures\Med\rw_aufbau.paa"
				} }
		};
    };

	class O_Heli_Transport_04_fuel_F {
        vItemSpace = 150;
        storageFee[] = { 45000, 0, 0, 0 };
		garageSell[] = { 57000, 0, 0, 0 };
		assurPrice[] = { 900000, 900000, 900000, 900000 };
        insurance = 2500;
        chopShop = 1000000;
        textures[] = { };
    };
	
	class B_Heli_Light_01_armed_F {
        vItemSpace = 90;
        storageFee[] = { 70000, 0, 0, 0 };
		garageSell[] = { 57000, 0, 0, 0 };
		assurPrice[] = { 900000, 900000, 900000, 900000 };
        insurance = 2500;
        chopShop = 2000000;
        textures[] = { };
    };
	
	class O_Heli_Attack_02_black_F {
        vItemSpace = 220;
        storageFee[] = { 99000, 1000, 0, 0 };
		garageSell[] = { 57000, 0, 0, 0 };
		assurPrice[] = { 800000, 150000, 800000, 800000 };
        insurance = 2500;
        chopShop = 812000;
        textures[] = { };
    };
	
	class O_Heli_Transport_04_box_F {
        vItemSpace = 700;
        storageFee[] = { 45000, 0, 0, 0 };
		garageSell[] = { 57000, 0, 0, 0 };
		assurPrice[] = { 800000, 800000, 800000, 800000 };
        insurance = 2500;
        chopShop = 1000000;
        textures[] = { };
    };
		
	class O_Heli_Light_02_F {
        vItemSpace = 400;
        storageFee[] = { 45000, 1000, 1000, 0 };
		garageSell[] = { 57000, 1000, 0, 0 };
		assurPrice[] = { 800000, 800000, 800000, 800000 };
        insurance = 2500;
        chopShop = 1000000;
        textures[] = { };
    };
	
	class I_MRAP_03_hmg_F {
        vItemSpace =  200;
        storageFee[] = { 45000, 1500, 0, 0 };
		garageSell[] = { 57000, 1500, 0, 0 };
		assurPrice[] = { 800000, 800000, 800000, 800000 };
        insurance = 2500;
        chopShop = 3000000;
        textures[] = {
		        { "Rebell", "reb", {
                "MINEFACTORY\textures\Civ\rebell_ifrit_typ4_teil1.paa",
                "MINEFACTORY\textures\Civ\rebell_ifrit_typ4_teil2.paa"
				} }
		};
    };
	
	class B_Heli_Attack_01_F {
        vItemSpace = 50;
        storageFee[] = { 45000, 1500, 0, 0 };
		garageSell[] = { 57000, 1500, 0, 0 };
		assurPrice[] = { 5000, 5000, 5000, 5000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };
	
	class O_Heli_Transport_04_medevac_F {
        vItemSpace = 450;
        storageFee[] = { 45000, 1500, 0, 0 };
		garageSell[] = { 57000, 1500, 0, 0 };
		assurPrice[] = { 700000, 50000, 50000, 700000 };
        insurance = 2500;
        chopShop = 1000000;
        textures[] = { };
    };
	
	class O_Heli_Transport_04_covered_F {
        vItemSpace = 300;
        storageFee[] = { 45000, 1500, 0, 0 };
		garageSell[] = { 57000, 1500, 0, 0 };
		assurPrice[] = { 700000, 50000, 50000, 700000 };
        insurance = 2500;
        chopShop = 1000000;
        textures[] = { };
    };
class O_Heli_Transport_04_covered_black_F {
        vItemSpace = 300;
        storageFee[] = { 45000, 1500, 0, 0 };
		garageSell[] = { 57000, 1500, 0, 0 };		
		assurPrice[] = { 700000, 50000, 50000, 700000 };
        insurance = 2500;
        chopShop = 1000000;
        textures[] = {
				{ "Cop", "cop", {
                "\a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_black_co.paa",
				"\a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_black_co.paa",				
				"\a3\air_f_heli\heli_transport_04\data\heli_transport_04_fuel_black_co.paa"
				} },	
		};		
	};
class O_Heli_Transport_04_bench_black_F {
        vItemSpace = 300;
        storageFee[] = { 45000, 1500, 0, 0 };
		garageSell[] = { 57000, 1500, 0, 0 };		
		assurPrice[] = { 700000, 50000, 50000, 700000 };
        insurance = 2500;
        chopShop = 1000000;
        textures[] = {
				{ "Cop", "cop", {
                "\a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_black_co.paa",
				"\a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_black_co.paa",				
				"\a3\air_f_heli\heli_transport_04\data\heli_transport_04_bench_black_co.paa"
				} },	
		};		
	};
class O_Heli_Transport_04_black_F {
        vItemSpace = 300;
        storageFee[] = { 45000, 1500, 0, 0 };
		garageSell[] = { 57000, 1500, 0, 0 };
		assurPrice[] = { 700000, 50000, 50000, 700000 };
        insurance = 2500;
        chopShop = 1000000;
        textures[] = {
				{ "Cop", "cop", {
                "\a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_black_co.paa",
				"\a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_black_co.paa",				
				"\a3\air_f_heli\heli_transport_04\data\heli_transport_04_bench_black_co.paa"
				} },	
		};		
	};
class O_Heli_Transport_04_repair_F {
        vItemSpace = 200;
        storageFee[] = { 45000, 1500, 0, 0 };
		garageSell[] = { 57000, 1500, 0, 0 };
		assurPrice[] = { 700000, 50000, 50000, 700000 };
        insurance = 2500;
        chopShop = 1000000;
        textures[] = { };
    };
	
	class I_Plane_Fighter_03_AA_F {
        vItemSpace = 45;
        storageFee[] = { 45000, 1500, 0, 0 };
		garageSell[] = { 57000, 1500, 0, 0 };
		assurPrice[] = { 700000, 50000, 50000, 700000 };
        insurance = 2500;
        chopShop = 6000000;
        textures[] = { };
    };

	class I_Truck_02_medical_F : Default {
		vItemSpace = 300;
		storageFee[] = { 0, 0, 1500, 0 };
		garageSell[] = { 0, 0, 5000, 0 };
		assurPrice[] = { 2000, 2000, 2000, 2000 };
		chopShop = 3000;
	};
	
	class O_APC_Wheeled_02_rcws_F {
        vItemSpace = 150;
        storageFee[] = { 1650000, 1500, 0, 0 };
		garageSell[] = { 150000, 1500, 0, 0 };
		assurPrice[] = { 40000, 40000, 40000, 40000 };
        insurance = 2500;
        chopShop = 50000;
        textures[] = { };
    };
	
	class O_Truck_03_repair_F {
        vItemSpace = 500;
        storageFee[] = { 15000, 1500, 0, 0 };
		garageSell[] = { 150000, 1500, 0, 0 };
		assurPrice[] = { 200000, 200000, 200000, 200000 };
        insurance = 2500;
        chopShop = 400000;
        textures[] = { };
    };
	
	class I_Heli_light_03_unarmed_F : Default {
		vItemSpace = 200;
		storageFee[] = { 1000, 1000, 1000, 1000 };
		garageSell[] = { 1500, 1500, 0, 0 };
		assurPrice[] = { 200000, 200000, 200000, 200000 };
		insurance = 2500;
		chopShop = 400000;
		textures[] = {
			{ "Police", "cop", {
	                "MINEFACTORY\textures\Cop\police_hellcat.paa"
            } },
			{ "med", "med", {
	                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } },
			{ "civ", "civ", {
	                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } },	
			{ "don", "don", {
	                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } }	
		};
	};

	class O_Truck_03_medical_F : Default {
		vItemSpace = 400;
		storageFee[] = { 1500, 1000, 3000, 0 };
		garageSell[] = { 1500, 1000, 10000, 0 };
		assurPrice[] = { 5000, 5000, 5000, 5000 };
		chopShop = 7500;
	};

	class B_Truck_01_medical_F : Default {
		vItemSpace = 500;
		storageFee[] = { 1500, 1000, 6500, 0 };
		garageSell[] = { 0, 1000, 25000, 0 };
		assurPrice[] = { 8000, 8000, 8000, 8000 };
		chopShop = 12500;
	};

	class C_Rubberboat {
        vItemSpace = 90;
        storageFee[] = { 400, 300, 0, 0 };
		garageSell[] = { 950, 350, 0, 0 };
		assurPrice[] = { 1000, 1000, 1000, 1000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class B_Heli_Transport_01_F {
		vItemSpace = 400;
		storageFee[] = { 1500, 50000, 0, 0 };
		garageSell[] = { 1500, 85000, 0, 0 };
		assurPrice[] = { 12000, 12000, 12000, 12000 };
		insurance = 16000;
		chopShop = 900000;
		textures[] = {
			
			    { "Polizei", "cop", {
                "MINEFACTORY\textures\Cop\gh_polizei_front.paa",
                "MINEFACTORY\textures\Cop\gh_polizei_hinten.paa"
            } }
		};
	};
	
	class O_Heli_Transport_04_bench_F {
        vItemSpace = 50;
        storageFee[] = { 15000, 1500, 0, 0 };
		garageSell[] = { 150000, 1500, 0, 0 };
		assurPrice[] = { 200000, 200000, 200000, 200000 };
        insurance = 2500;
        chopShop = 350000;
        textures[] = { };
    };
	
	class O_Heli_Transport_04_ammo_F {
        vItemSpace = 500;
        storageFee[] = { 15000, 1500, 0, 0 };
		garageSell[] = { 150000, 1500, 0, 0 };
		assurPrice[] = { 4000, 4000, 4000, 4000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };
	
	class O_Heli_Transport_04_F {
        vItemSpace = 20;
        storageFee[] = { 15000, 1500, 0, 0 };
		garageSell[] = { 150000, 1500, 0, 0 };
		assurPrice[] = { 200000, 200000, 200000, 200000 };
        insurance = 2500;
        chopShop = 350000;
        textures[] = { };
    };
	
	class B_Truck_01_covered_F {
        vItemSpace = 1100;
        storageFee[] = { 35000, 0, 0, 0 };
		garageSell[] = { 150000, 0, 0, 0 };
		assurPrice[] = { 200000, 50000, 50000, 200000 };
        insurance = 2500;
        chopShop = 600000;
        textures[] = { };
    };

	class B_MRAP_01_hmg_F : Default {
		vItemSpace = 200;
	};

	class O_Boat_Armed_01_hmg_F {
        vItemSpace = 350;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 21000, 21000, 0, 0 };
		assurPrice[] = { 2000, 2000, 2000, 2000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class B_Boat_Armed_01_minigun_F {
        vItemSpace = 350;
        storageFee[] = { 0, 16500, 0, 0 };
		garageSell[] = { 0, 21000, 0, 0 };
		assurPrice[] = { 4000, 4000, 4000, 4000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class I_Boat_Armed_01_minigun_F {
        vItemSpace = 350;
        storageFee[] = { 1000, 1000, 0, 0 };
		garageSell[] = { 6800, 3500, 0, 0 };
		assurPrice[] = { 4000, 4000, 4000, 4000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class B_G_Boat_Transport_01_F {
        vItemSpace = 90;
        storageFee[] = { 1000, 1000, 0, 0 };
		garageSell[] = { 6800, 3500, 0, 0 };
		assurPrice[] = { 4000, 4000, 4000, 4000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class B_Boat_Transport_01_F {
        vItemSpace = 90;
        storageFee[] = { 0, 450, 0, 0 };
		garageSell[] = { 0, 850, 0, 0 };
		assurPrice[] = { 4000, 4000, 4000, 4000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class O_Truck_03_transport_F {
        vItemSpace = 600;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 6800, 3500, 0, 0 };
		assurPrice[] = { 200000, 200000, 200000, 200000 };
        insurance = 2500;
        chopShop = 250000;
        textures[] = { };
    };
	
	class O_Truck_03_fuel_F {
        vItemSpace = 660;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 6800, 3500, 0, 0 };
		assurPrice[] = { 200000, 200000, 200000, 200000 };
        insurance = 2500;
        chopShop = 230000;
        textures[] = { };
    };

	class O_Truck_03_device_F {
        vItemSpace = 350;
        storageFee[] = { 95000, 0, 0, 0 };
		garageSell[] = { 185000, 0, 0, 0 };
		assurPrice[] = { 200000, 200000, 200000, 200000 };
        insurance = 25000;
        chopShop = 125000;
        textures[] = { };
    };

	class Land_CargoBox_V1_F : Default {
        vItemSpace = 5000;
    };

	class Box_IND_Grenades_F : Default {
        vItemSpace = 700;
    };

	class I_supplyCrate_F {
        vItemSpace = 700;
    };

	class B_G_Offroad_01_F {
        vItemSpace = 65;
        storageFee[] = { 1000, 1000, 0, 0 };
		garageSell[] = { 3500, 1000, 0, 0 };
		assurPrice[] = { 500, 500, 500, 500 };
        insurance = 2500;
        chopShop = 10000;
        textures[] = { };
    };

	class B_UGV_01_rcws_F {
        vItemSpace = 65;
        storageFee[] = { 1000, 1000, 0, 0 };
		garageSell[] = { 3500, 1000, 0, 0 };
		assurPrice[] = { 4000, 4000, 4000, 4000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

		class B_UGV_01_F {
        vItemSpace = 65;
        storageFee[] = { 1000, 1000, 0, 0 };
		garageSell[] = { 3500, 1000, 0, 0 };
		assurPrice[] = { 4000, 4000, 4000, 4000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class I_APC_Wheeled_03_cannon_F {
        vItemSpace = 65;
        storageFee[] = { 1000, 1000, 0, 0 };
		garageSell[] = { 3500, 1000, 0, 0 };
		assurPrice[] = { 200000, 200000, 200000, 200000 };
        insurance = 2500;
        chopShop = 7000000;
        textures[] = { };
    };
	
	class B_APC_Wheeled_01_cannon_F {
        vItemSpace = 65;
        storageFee[] = { 1000, 1000, 0, 0 };
		garageSell[] = { 3500, 1000, 0, 0 };
		assurPrice[] = { 200000, 200000, 200000, 200000 };
        insurance = 2500;
        chopShop = 7000000;
        textures[] = { };
    };
	
	class I_G_Offroad_01_armed_F {
        vItemSpace = 70;
        storageFee[] = { 1000, 1000, 0, 0 };
		garageSell[] = { 3500, 1000, 0, 0 };
		assurPrice[] = { 40000, 40000, 40000, 40000 };
        insurance = 2500;
        chopShop = 50000;
        textures[] = { };
    };

	class B_G_Offroad_01_armed_F : B_G_Offroad_01_F {};

	class I_G_Van_01_transport_F {
        vItemSpace = 230;
        storageFee[] = { 1000, 1000, 0, 0 };
		garageSell[] = { 6800, 3500, 0, 0 };
		assurPrice[] = { 4000, 4000, 4000, 4000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class C_Boat_Civil_01_F {
        vItemSpace = 170;
        storageFee[] = { 4500, 2500, 0, 0 };
		garageSell[] = { 6800, 3500, 0, 0 };
		assurPrice[] = { 4000, 4000, 4000, 4000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class C_Boat_Civil_01_police_F {
        vItemSpace = 170;
        storageFee[] = { 0, 3500, 0, 0 };
		garageSell[] = { 0, 4950, 0, 0 };
		assurPrice[] = { 4000, 4000, 4000, 4000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class C_Boat_Civil_01_rescue_F {
        vItemSpace = 170;
        storageFee[] = { 1000, 1000, 0, 0 };
		garageSell[] = { 0, 950, 0, 0 };
		assurPrice[] = { 4000, 4000, 4000, 4000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };

	class B_Truck_01_box_F {
        vItemSpace = 1500;
        storageFee[] = { 35000, 0, 0, 0 };
		garageSell[] = { 150000, 0, 0, 0 };
		assurPrice[] = { 700000, 700000, 700000, 700000 };
        insurance = 2500;
        chopShop = 1000000;
        textures[] = { };
    };
	
	class B_Truck_01_ammo_F {
        vItemSpace = 750;
        storageFee[] = { 15000, 0, 0, 0 };
		garageSell[] = { 150000, 0, 0, 0 };
		assurPrice[] = { 40000, 40000, 40000, 40000 };
        insurance = 2500;
        chopShop = 50000;
        textures[] = { };
    };

	class B_Truck_01_transport_F {
        vItemSpace = 850;
        storageFee[] = { 25650, 0, 0, 0 };
		garageSell[] = { 135000, 0, 0, 0 };
		assurPrice[] = { 140000, 140000, 140000, 140000 };
        insurance = 2500;
        chopShop = 150000;
        textures[] = {
        	{ "FailSkin", "med", {
                "\a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa"
            } },
			{ "ADAC", "adac", {
                "\a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa"
            } }
	    };
    };
	
	class B_Truck_01_fuel_F {
        vItemSpace = 910;
        storageFee[] = { 35000, 0, 0, 0 };
		garageSell[] = { 150000, 0, 0, 0 };
		assurPrice[] = { 300000, 300000, 300000, 300000 };
        insurance = 2500;
        chopShop = 350000;
        textures[] = { };
    };

	class O_MRAP_02_F {
        vItemSpace = 200;
        storageFee[] = { 45000, 1000, 0, 0 };
		garageSell[] = { 65000, 1000, 0, 0 };
		assurPrice[] = { 800000, 800000, 800000, 800000 };
        insurance = 2500;
        chopShop = 900000;
        textures[] = { 
		        { "Rebell", "reb", {
                "MINEFACTORY\textures\Civ\rebell_ifrit_typ4_teil1.paa",
                "MINEFACTORY\textures\Civ\rebell_ifrit_typ4_teil2.paa"
				} },
				{ "Polizei", "cop", {
                "MINEFACTORY\textures\Cop\Ifrit_Polizei4_Front.paa",
                "MINEFACTORY\textures\Cop\Ifrit_Polizei4_hinten.paa"
				} },
				{ "SCI", "clan", {
                "MINEFACTORY\textures\Civ\rebell_ifrit_typ4_teil1.paa",
                "MINEFACTORY\textures\Civ\rebell_ifrit_typ4_teil2.paa"
				} }
		};
    };

	class I_MRAP_03_F {
        vItemSpace = 200;
        storageFee[] = { 45000, 1000, 0, 0 };
		garageSell[] = { 50000, 1000, 0, 0 };
		assurPrice[] = { 800000, 80000, 80000, 800000 };
        insurance = 2500;
        chopShop = 1500000;
        textures[] = {
			        { "Polizei", "cop", {
	                "MINEFACTORY\textures\Cop\polizei_strider.paa"
					} },
					{ "SEK", "cop", {
	                "MINEFACTORY\textures\Cop\strider_sek.paa"
					} }
		};
    };

	class C_Offroad_luxe_F {
        vItemSpace = 130;
        storageFee[] = { 1000, 500, 650, 1000 };
		garageSell[] = { 6500, 2500, 0, 0 };
		assurPrice[] = { 1000, 1000, 1000, 1000 };
        insurance = 2500;
        chopShop = 2500;
        textures[] = {
        	{ "PRESSE", "Civ", {
                "MINEFACTORY\textures\Civ\presse.paa"
            } }
	    };
    };	

	class C_Offroad_01_F {
        vItemSpace = 130;
        storageFee[] = { 1000, 500, 650, 1000 };
		garageSell[] = { 6500, 2500, 0, 0 };
		assurPrice[] = { 1000, 1000, 1000, 1000 };
        insurance = 2500;
        chopShop = 2500;
        textures[] = {
        	{ "Red", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"
            } },
        	{ "med", "med", {
                "MINEFACTORY\textures\Med\THWofraod.paa"
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
            { "Fed", "fed", {
	                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            } },
			{ "Polizei", "cop", {
	                "MINEFACTORY\textures\Cop\police_offroad.paa"
            } },
			{ "Police", "cop", {
	                "#(ai,64,64,1)Fresnel(1.3,7)"
            } },
            { "Taxi", "civ", {
	                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            } },
			{ "ADAC", "adac", {
	                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            } }
	    };
    };

	class C_Kart_01_Blu_F {
		vItemSpace = 40;
		storageFee[] = { 1500, 0, 0, 0 };
		garageSell[] = { 3500, 0, 0, 0 };
		assurPrice[] = { 2000, 2000, 2000, 2000 };
		inusrance = 1650;
		chopShop = 3500;
		textures[] = {};
	};
	
	class I_Heli_light_03_F {
        vItemSpace = 120;
        storageFee[] = { 75000, 0, 0, 0 };
		garageSell[] = { 520000, 0, 0, 0 };
		assurPrice[] = { 200000, 50000, 50000, 200000 };
        insurance = 2500;
        chopShop = 512000;
        textures[] = {
			{ "civ", "reb", {
	                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } },
			{ "civ", "civ", {
	                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } },	
			{ "don", "don", {
	                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } },
			{ "Police", "cop", {
	                "MINEFACTORY\textures\Cop\police_hellcat.paa"
            } }
		};
    };

	class C_Kart_01_Fuel_F : C_Kart_01_Blu_F {}; //Inherits everything from the above class
	class C_Kart_01_Red_F : C_Kart_01_Blu_F {}; //Inherits everything from the above class
	class C_Kart_01_Vrana_F : C_Kart_01_Blu_F {}; //Inherits everything from the above class

	class C_Hatchback_01_sport_F {
        vItemSpace = 90;
        storageFee[] = { 2500, 1000, 0, 0 };
		garageSell[] = { 15000, 7500, 0, 0 };
		assurPrice[] = { 5000, 5000, 5000, 5000 };
        insurance = 5500;
        chopShop = 15000;
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
            { "Police", "cop", {
                "MINEFACTORY\textures\Cop\hb_autobahn.paa"
            } },
			{ "Redgull", "civ", {
	                "MINEFACTORY\textures\Civ\hbsport_redgull.paa"
            } },
			{ "Monster", "civ", {
	                "MINEFACTORY\textures\Civ\hbsport_monster.paa"
            } }
        };
    };

	class B_Quadbike_01_F {
        vItemSpace = 50;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 950, 0, 0, 0 };
		assurPrice[] = { 400, 400, 400, 400 };
        insurance = 2500;
        chopShop = 2000;
        textures[] = {
        	{ "Polizei", "cop", {
                "MINEFACTORY\textures\Cop\cop_quad.paa"
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
	        { "Medic", "med", {
                "MINEFACTORY\textures\Med\med_quad.paa"
            } }
        };
    };

	class I_Truck_02_covered_F {
        vItemSpace = 550;
        storageFee[] = { 14500, 0, 0, 0 };
		garageSell[] = { 62000, 0, 0, 0 };
		assurPrice[] = { 50000, 50000, 50000, 50000 };
        insurance = 6500;
        chopShop = 100000;
        textures[] = {
        	{ "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            } },
            { "Black", "fed", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } }
        };
    };

	class I_Truck_02_transport_F : I_Truck_02_covered_F {
        vItemSpace = 400;
        storageFee[] = { 12000, 500, 0, 0 };
		garageSell[] = { 49800, 3500, 0, 0 };
    };
	
	class I_Truck_02_fuel_F : I_Truck_02_covered_F {
        vItemSpace = 465;
        storageFee[] = { 12000, 500, 0, 0 };
		garageSell[] = { 49800, 3500, 0, 0 };
    };
	
	class I_Truck_02_box_F : I_Truck_02_covered_F {
        vItemSpace = 640;
        storageFee[] = { 12000, 500, 0, 0 };
		garageSell[] = { 49800, 3500, 0, 0 };
    };

	class O_Truck_03_covered_F {
		vItemSpace = 950;
		storageFee[] = { 25000, 0, 0, 0 };
		garageSell[] = { 65000, 0, 0, 0 };
		assurPrice[] = { 200000, 50000, 50000, 200000 };
		insurance = 2500;
		chopShop = 300000;
		textures[] = {};
	};

	class C_Hatchback_01_F {
        vItemSpace = 80;
        storageFee[] = { 1000, 500, 0, 0 };
		garageSell[] = { 4500, 3500, 0, 0 };
		assurPrice[] = { 4000, 4000, 4000, 4000 };
        insurance = 2500;
        chopShop = 5000;
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
			{ "Redgull", "civ", {
	                "MINEFACTORY\textures\Civ\hbsport_redgull.paa"
            } },
			{ "Monster", "civ", {
	                "MINEFACTORY\textures\Civ\hbsport_monster.paa"
            } }
        };
    };

	class C_SUV_01_F {
        vItemSpace = 100;
        storageFee[] = { 1000, 500, 0, 0 };
		garageSell[] = { 15000, 7500, 0, 0 };
		assurPrice[] = { 4000, 4000, 4000, 4000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {
        	{ "Dark Red", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"
            } },
			{ "Polizei", "cop", {
	                "MINEFACTORY\textures\Cop\cop_suv.paa"
            } },
			{ "Silver", "civ", {
	                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"
            } },
			{ "Orange", "civ", {
	                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"
            } },
			{ "THW", "med", {
	                "MINEFACTORY\textures\Med\suv_thw.paa"
            } },
			{ "Nyan", "civ", {
	                "MINEFACTORY\textures\Civ\suv_nyan.paa"
            } }
	        };
    };

	class C_Van_01_transport_F {
        vItemSpace = 200;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 25000, 0, 0, 0 };
		assurPrice[] = { 6000, 6000, 6000, 6000 };
        insurance = 2500;
        chopShop = 20000;
        textures[] = {
        	{ "White", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } }
        };
    };
	
	class I_G_Van_01_fuel_F {
        vItemSpace = 400;
        storageFee[] = { 1000, 0, 0, 0 };
		garageSell[] = { 35000, 0, 0, 0 };
		assurPrice[] = { 9000, 9000, 9000, 9000 };
        insurance = 2500;
        chopShop = 35000;
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
        vItemSpace = 350;
        storageFee[] = { 1000, 100, 100, 0 };
		garageSell[] = { 35000, 100, 100, 0 };
		assurPrice[] = { 9000, 9000, 9000, 9000 };
        insurance = 2500;
        chopShop = 30000;
        textures[] = {
        	{ "White", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
			{ "med", "med", {
                "MINEFACTORY\textures\Med\med_rtwV.paa",
				"MINEFACTORY\textures\Med\med_rtwH.paa"
            } },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } }
        };
    };
	class B_MRAP_01_F {
        vItemSpace = 200;
        storageFee[] = { 1000, 7500, 0, 0 };
		garageSell[] = { 1000, 10000, 0, 0 };
		assurPrice[] = { 500000, 50000, 50000, 500000 };
        insurance = 2500;
        chopShop = 700000;
        textures[] = {
            { "Black", "fed", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } },
			{ "Tarn", "reb", {
                "MINEFACTORY\textures\Civ\rebell_hunter_typ2_teil1.paa",
				"MINEFACTORY\textures\Civ\rebell_hunter_typ2_teil2.paa"
            } },
			{ "SOS", "clan", {
                "MINEFACTORY\textures\Civ\rebell_hunter_typ2_teil1.paa",
				"MINEFACTORY\textures\Civ\rebell_hunter_typ2_teil2.paa"
            } },
			{ "BONZE", "don", {
                "MINEFACTORY\textures\Civ\donator_hunter_front.paa",
				"MINEFACTORY\textures\Civ\donator_hunter_hinten.paa"
            } },
			{ "Polizei", "cop", {
                "MINEFACTORY\textures\Cop\hunter_polizei_front1.paa",
				"MINEFACTORY\textures\Cop\hunter_polizei_hinten1.paa"
            } },
			{ "Polizei2", "cop", {
                "MINEFACTORY\textures\Cop\hunter_polizei_front1.paa"
            } },
			{ "ARK", "clan", {
                "MINEFACTORY\textures\Civ\frontsporthunter.paa",
				"MINEFACTORY\textures\Civ\rearsporthunter.paa"
            } },
			{ "RELLEY", "reb", {
                "MINEFACTORY\textures\Civ\frontsporthunter.paa",
				"MINEFACTORY\textures\Civ\rearsporthunter.paa"
            } },
			{ "Medic", "med", {
                "MINEFACTORY\textures\Med\med_HunterV.paa",
				"MINEFACTORY\textures\Med\med_HunterH.paa"
            } }
        };
    };
	
	class C_Heli_Light_01_civil_F {
        vItemSpace = 220;
        storageFee[] = { 45000, 0, 0, 0 };
		garageSell[] = { 57000, 0, 0, 0 };
		assurPrice[] = { 100000, 50000, 50000, 100000 };
        insurance = 2500;
        chopShop = 250000;
        textures[] = { };
    };
	
	class Land_Wreck_Traw_F {
        vItemSpace = 10000000;
        storageFee[] = { 45000, 0, 0, 0 };
		garageSell[] = { 57000, 0, 0, 0 };
		assurPrice[] = { 4000, 4000, 4000, 4000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };
	
	class Land_Wreck_Traw2_F {
        vItemSpace = 10000000;
        storageFee[] = { 45000, 0, 0, 0 };
		garageSell[] = { 57000, 0, 0, 0 };
		assurPrice[] = { 4000, 4000, 4000, 4000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = { };
    };
	class B_Plane_CAS_01_F {
        vItemSpace = 45;
        storageFee[] = { 45000, 0, 0, 0 };
		garageSell[] = { 57000, 0, 0, 0 };
		assurPrice[] = { 1000000, 1000000, 1000000, 1000000 };
        insurance = 2500;
        chopShop = 2000000;
        textures[] = { };
    };

	class B_Heli_Light_01_F {
        vItemSpace = 180;
        storageFee[] = { 45000, 19500, 0, 0 };
		garageSell[] = { 57000, 35000, 0, 0 };
		assurPrice[] = { 90000, 30000, 30000, 90000 };
        insurance = 2500;
        chopShop = 150000;
        textures[] = {
        	{ "Sheriff", "cop", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa"
            } },
        	{ "Polizei", "cop", {
                "MINEFACTORY\textures\Cop\police_hummingbird.paa"
            } },
			{ "Black", "fed", {
	                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa"
            } },
			{ "Civ Blue", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"
            } },
			{ "Civ Red", "civ", {
	                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"
            } },
			{ "Digi Green", "donate", {
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
                "MINEFACTORY\textures\Med\med_hummingbird.paa"
            } }
        };
    };

	class O_Heli_Light_02_unarmed_F {
        vItemSpace = 400;
        storageFee[] = { 55000, 0, 22000, 0 };
		garageSell[] = { 72500, 0, 35000, 0 };
		assurPrice[] = { 90000, 50000, 50000, 90000 };
        insurance = 2500;
        chopShop = 350000;
        textures[] = {
        	{ "Black", "fed", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa"
            } },
			{ "White / Blue", "civ", {
	                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"   
            } },
			{ "Digi Green", "donate", {
	                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"
            } },
			{ "Desert Digi", "reb", {
	                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa" 
            } },
            { "EMS White", "med", {
                "MINEFACTORY\textures\Med\orca_notarzt.paa"
            } },
			{ "Cop", "cop", {
                "MINEFACTORY\textures\Cop\orca_polizei.paa"
            } }
        };
    };

	class I_Heli_Transport_02_F {
        vItemSpace = 650;
        storageFee[] = { 75000, 0, 0, 0 };
		garageSell[] = { 125000, 0, 0, 0 };
		assurPrice[] = { 350000, 70000, 70000, 350000 };
        insurance = 2500;
        chopShop = 450000;
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
			{ "Medic", "med", {
                "MINEFACTORY\textures\Med\asar_mohawk.paa",
                "MINEFACTORY\textures\Med\asar_mohawk2.paa",
                "MINEFACTORY\textures\Med\asar_mohawk3.paa"
            } }
        };
    };

	class B_Heli_Transport_03_F {
        vItemSpace = 700;
        storageFee[] = { 75000, 0, 0, 0 };
		garageSell[] = { 125000, 0, 0, 0 };
		assurPrice[] = { 150000, 70000, 70000, 150000 };
        insurance = 2500;
        chopShop = 2000000;
        textures[] = {};
    };

	class B_SDV_01_F {
        vItemSpace = 150;
        storageFee[] = { 500, 0, 0, 0 };
		garageSell[] = { 1500, 0, 0, 0 };
		assurPrice[] = { 4000, 4000, 4000, 4000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {};
    };

	class B_Heli_Transport_03_unarmed_F {
        vItemSpace = 600;
        storageFee[] = { 75000, 0, 0, 0 };
		garageSell[] = { 125000, 0, 0, 0 };
		assurPrice[] = { 150000, 70000, 70000, 150000 };
        insurance = 2500;
        chopShop = 2000000;
        textures[] = {};
    };

	class B_Slingload_01_Cargo_F {
        vItemSpace = 800;
        storageFee[] = { 75000, 0, 0, 0 };
		garageSell[] = { 125000, 0, 0, 0 };
		assurPrice[] = { 4000, 4000, 4000, 4000 };
        insurance = 2500;
        chopShop = 5000;
        textures[] = {};
    };
	
};