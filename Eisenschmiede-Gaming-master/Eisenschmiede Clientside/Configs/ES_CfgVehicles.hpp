class CarShops {
	/*
	 *	ARRAY FORMAT:
	 *		0: STRING (Classname) rental price, license required, { varname, >= value } }
	 *		1: SCALAR (Rental Price)
	 *		4: ARRAY (This is for limiting items to certain things)
	 *			0: Variable to read from
	 *			1: Variable Value Type (SCALAR / BOOL)
	 *			2: What to compare to (-1 = Check Disabled)
	 */

	class civ_car {
		side = "civ";
		vehicles[] = {
			{ "B_Quadbike_01_F", 2500, { "" }, { "", "", -1 } }, 
			{ "C_Hatchback_01_F", 9500, { "driver" }, { "", "", -1 } }, 
			{ "C_Offroad_01_F", 12500, { "driver" }, { "", "", -1 } },
			{ "C_Offroad_02_unarmed_F", 120000, { "driver" }, { "", "", -1 } },
			{ "C_SUV_01_F", 30000, { "driver" }, { "", "", -1 } },
			{ "C_Hatchback_01_sport_F", 40000, { "driver" }, { "", "", -1 } },
			{ "C_Van_01_transport_F", 45000, { "driver" }, { "", "", -1 } }
		};
	};
	
	class civ_air {
		side = "civ";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 253000, { "pilot" }, { "", "", -1 } },
			{ "O_Heli_Light_02_unarmed_F", 750000, { "pilot" }, { "", "", -1 } },
			{ "C_Plane_Civil_01_F", 750000, { "pilot" }, { "", "", -1 } }
		};
	};
	
	class civ_truck {
		side = "civ";
		vehicles[] = {
			{ "C_Van_01_box_F", 60000, { "trucking" }, { "", "", -1 } },
			{ "I_Truck_02_transport_F", 175000, { "trucking" }, { "", "", -1 } },
			{ "I_Truck_02_covered_F", 300000, { "trucking" }, { "", "", -1 } },
			{ "B_Truck_01_transport_F", 475000, { "trucking" }, { "", "", -1 } },
			{ "O_Truck_03_transport_F", 500000, { "trucking" }, { "", "", -1 } },
			{ "O_Truck_03_covered_F", 1250000, { "trucking" }, { "", "", -1 } },
			{ "B_Truck_01_box_F", 1350000, { "trucking" }, { "", "", -1 } },
			{ "O_Truck_03_device_F", 1450000, { "trucking" }, { "", "", -1 } }
		};
	};

	class kart_shop {
		side = "civ";
		vehicles[] = {
			{ "C_Kart_01_Blu_F", 15000, { "driver" }, { "", "", -1 } },
			{ "C_Kart_01_Fuel_F", 15000, { "driver" }, { "", "", -1 } },
			{ "C_Kart_01_Red_F", 15000, { "driver" }, { "", "", -1 } },
			{ "C_Kart_01_Vrana_F", 15000, { "driver" }, { "", "", -1 } }
		};
	};

	class med_shop {
		side = "med";
		vehicles[] = {
			{ "B_Quadbike_01_F", 10000, { "" }, { "ES_mediclevel", "SCALAR", 1 } },
			{ "C_Offroad_01_F", 20000, { "" }, { "ES_mediclevel", "SCALAR", 1 } },
			{ "C_Van_01_box_F", 120000, { "" }, { "ES_mediclevel", "SCALAR", 2 } },
			{ "B_Truck_01_transport_F", 80000, { "" }, { "ES_mediclevel", "SCALAR", 1 } },
			{ "C_Hatchback_01_F", 40000, { "" }, { "ES_mediclevel", "SCALAR", 2 } },
			{ "I_G_Van_01_fuel_F", 30000, { "" }, { "ES_mediclevel", "SCALAR", 3 } },
			{ "C_Offroad_02_unarmed_F", 50000, { "" }, { "ES_mediclevel", "SCALAR", 3 } },
			{ "C_SUV_01_F", 20000, { "" }, { "ES_mediclevel", "SCALAR", 2 } },
			{ "I_Truck_02_box_F", 65000, { "" }, { "ES_mediclevel", "SCALAR", 3 } },
			{ "B_Truck_01_mover_F", 40000, { "" }, { "ES_mediclevel", "SCALAR", 3 } },
			{ "C_Hatchback_01_sport_F", 50000, { "" }, { "ES_mediclevel", "SCALAR", 3 } },
			{ "I_MRAP_03_F", 40000, { "" }, { "ES_mediclevel", "SCALAR", 5 } }
		};
	};

	class med_air_hs {
		side = "med";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 50000, { "mAir" }, { "ES_mediclevel", "SCALAR", 1 } },
			{ "O_Heli_Light_02_unarmed_F", 75000, { "mAir" }, { "ES_mediclevel", "SCALAR", 2 } },
			{ "I_Heli_light_03_unarmed_F", 75000, { "mAir" }, { "ES_mediclevel", "SCALAR", 1 } },
			{ "O_Heli_Transport_04_F", 75000, { "mAir" }, { "ES_mediclevel", "SCALAR", 4 } },
			{ "B_Heli_Transport_03_unarmed_F", 75000, { "mAir" }, { "ES_mediclevel", "SCALAR", 4 } }
		};
	};
	
	class med_air {
		side = "med";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 50000, { "mAir" }, { "ES_mediclevel", "SCALAR", 1 } },
			{ "O_Heli_Light_02_unarmed_F", 75000, { "mAir" }, { "ES_mediclevel", "SCALAR", 2 } },
			{ "I_Heli_light_03_unarmed_F", 75000, { "mAir" }, { "ES_mediclevel", "SCALAR", 1 } },
			{ "O_Heli_Transport_04_F", 75000, { "mAir" }, { "ES_mediclevel", "SCALAR", 4 } },
			{ "B_Heli_Transport_03_unarmed_F", 75000, { "mAir" }, { "ES_mediclevel", "SCALAR", 4 } }
		};
	};

	class reb_car {
		side = "civ";
		vehicles[] = {
			{ "B_Quadbike_01_F", 2500, { "" }, { "", "", -1 } },
			{ "B_G_Offroad_01_F", 15000, { "" }, { "", "", -1 } },
			{ "C_SUV_01_F", 15000, { "" }, { "", "", -1 } },
			
			{ "C_Offroad_02_unarmed_F", 100000, { "" }, { "", "", -1 } },			
			{ "B_T_LSV_01_unarmed_F", 200000, { "" }, { "", "", -1 } },
			{ "O_T_LSV_02_unarmed_F", 250000, { "" }, { "", "", -1 } },
			
			{ "B_Truck_01_transport_F", 250000, { "" }, { "", "", -1 } },
			{ "O_Truck_03_covered_F", 200000, { "" }, { "", "", -1 } },
			{ "B_Truck_01_box_F", 250000, { "" }, { "", "", -1 } },
			{ "O_Truck_03_device_F", 2750000, { "" }, { "", "", -1 } },
			{ "B_MRAP_01_F", 1000000, { "" }, { "", "", -1 } },
			{ "O_MRAP_02_F", 1000000, { "" }, { "", "", -1 } },
			{ "B_G_Offroad_01_armed_F", 250000, { "rebel" }, { "", "", -1 } }
		};
	};
	
	class reb_don {
		side = "civ";
		vehicles[] = {
			{ "B_Quadbike_01_F", 2500, { "rebel" }, { "", "", -1 } },
			{ "B_G_Offroad_01_F", 15000, { "rebel" }, { "", "", -1 } },
			{ "C_SUV_01_F", 15000, { "rebel" }, { "", "", -1 } },
			
			{ "C_Offroad_02_unarmed_F", 100000, { "rebel" }, { "", "", -1 } },			
			{ "B_T_LSV_01_unarmed_F", 200000, { "rebel" }, { "", "", -1 } },
			{ "O_T_LSV_02_unarmed_F", 250000, { "rebel" }, { "", "", -1 } },
			
			
			{ "B_Truck_01_transport_F", 250000, { "rebel" }, { "", "", -1 } },
			{ "O_Truck_03_covered_F", 200000, { "rebel" }, { "", "", -1 } },
			{ "B_Truck_01_box_F", 250000, { "rebel" }, { "", "", -1 } },
			{ "O_Truck_03_device_F", 2750000, { "rebel" }, { "", "", -1 } },
			{ "B_MRAP_01_F", 1000000, { "rebel" }, { "", "", -1 } },
			{ "O_MRAP_02_F", 1000000, { "rebel" }, { "", "", -1 }},
			{ "B_G_Offroad_01_armed_F", 250000, { "rebel" }, { "", "", -1 } }
		};
	};
	
	class reb2 {
		side = "civ";
		vehicles[] = {
			{ "B_Quadbike_01_F", 1000, { "soeldner" }, { "", "", -1 } },
			{ "C_Offroad_01_F", 12500, { "soeldner" }, { "", "", -1 } },
			{ "B_G_Offroad_01_armed_F", 150000, { "soeldner" }, { "", "", -1 } },
			{ "C_SUV_01_F", 15000, { "soeldner" }, { "", "", -1 } },
			{ "C_Hatchback_01_sport_F", 100000, { "soeldner" }, { "", "", -1 } },
			
			{ "C_Offroad_02_unarmed_F", 100000, { "soeldner" }, { "", "", -1 } },			
			{ "B_T_LSV_01_unarmed_F", 200000, { "soeldner" }, { "", "", -1 } },
			{ "O_T_LSV_02_unarmed_F", 250000, { "soeldner" }, { "", "", -1 } },
			{ "O_T_LSV_02_armed_F", 2800000, { "soeldner" }, { "", "", -1 } },
			
			{ "C_Van_01_Fuel_F", 7500, { "soeldner" }, { "", "", -1 } },
			{ "B_Truck_01_fuel_F", 155000, { "soeldner" }, { "", "", -1 } },
			{ "B_Truck_01_ammo_F", 175000, { "soeldner" }, { "", "", -1 }},
			{ "B_Truck_01_transport_F", 250000, { "soeldner" }, { "", "", -1 } },
			{ "O_Truck_03_covered_F", 200000, { "soeldner" }, { "", "", -1 } },
			{ "B_Truck_01_box_F", 250000, { "soeldner" }, { "", "", -1 } },
			{ "O_Truck_03_device_F", 2750000, { "soeldner" }, { "", "", -1 } },
			{ "B_MRAP_01_F", 1000000, { "soeldner" }, { "", "", -1 } },
			{ "O_MRAP_02_F", 1000000, { "soeldner" }, { "", "", -1 } },
			{ "O_MRAP_02_hmg_F", 5000000, { "soeldner" }, { "", "", -1 } },
			{ "O_APC_Wheeled_02_rcws_F", 6500000, { "soeldner" }, { "", "", -1 } }
		};
	};
	
	class reb_don2 {
		side = "civ";
		vehicles[] = {
			{ "B_Quadbike_01_F", 1000, { "soeldner" }, { "", "", -1 } },
			{ "C_Offroad_01_F", 12500, { "soeldner" }, { "", "", -1 } },
			{ "B_G_Offroad_01_armed_F", 150000, { "" }, { "", "", -1 } },
			{ "C_SUV_01_F", 15000, { "soeldner" }, { "", "", -1 } },
			{ "C_Hatchback_01_sport_F", 100000, { "" }, { "", "", -1 } },
			
			{ "C_Offroad_02_unarmed_F", 100000, { "soeldner" }, { "", "", -1 } },			
			{ "B_T_LSV_01_unarmed_F", 200000, { "soeldner" }, { "", "", -1 } },
		
			{ "O_T_LSV_02_unarmed_F", 250000, { "soeldner" }, { "", "", -1 } },
			{ "O_T_LSV_02_armed_F", 2400000, { "soeldner" }, { "", "", -1 } },
			
			{ "C_Van_01_Fuel_F", 7500, { "soeldner" }, { "", "", -1 } },
			{ "B_Truck_01_fuel_F", 155000, { "soeldner" }, { "", "", -1 } },
			{ "B_Truck_01_ammo_F", 175000, { "soeldner" }, { "", "", -1 } },
			{ "B_Truck_01_transport_F", 250000, { "soeldner" }, { "", "", -1 } },
			{ "O_Truck_03_covered_F", 200000, { "soeldner" }, { "", "", -1 } },
			{ "B_Truck_01_box_F", 250000, { "soeldner" }, { "", "", -1 } },
			{ "O_Truck_03_device_F", 2750000, { "soeldner" }, { "", "", -1 } },
			{ "B_MRAP_01_F", 1000000, { "soeldner" }, { "", "", -1 } },
			{ "O_MRAP_02_F", 1000000, { "soeldner" }, { "", "", -1 } },
			{ "O_MRAP_02_hmg_F", 5000000, { "soeldner" }, { "", "", -1 } },
			{ "O_APC_Wheeled_02_rcws_F", 6500000, { "soeldner" }, { "", "", -1 } }
		};
	};
	
	class reb3 {
		side = "civ";
		vehicles[] = {			
			{ "B_Quadbike_01_F", 1000, { "millitear" }, { "", "", -1 } },
			{ "C_Offroad_01_F", 12500, { "millitear" }, { "", "", -1 } },
			{ "B_G_Offroad_01_armed_F", 150000, { "millitear" }, { "", "", -1 } },
			{ "C_SUV_01_F", 15000, { "millitear" }, { "", "", -1 } },
			{ "C_Hatchback_01_sport_F", 100000, { "millitear" }, { "", "", -1 } },
			
			{ "C_Offroad_02_unarmed_F", 100000, { "millitear" }, { "", "", -1 } },			
			{ "B_T_LSV_01_unarmed_F", 200000, { "millitear" }, { "", "", -1 } },
			{ "B_T_LSV_01_armed_F", 4000000, { "millitear" }, { "", "", -1 } },
			{ "O_T_LSV_02_unarmed_F", 250000, { "millitear" }, { "", "", -1 } },
			{ "O_T_LSV_02_armed_F", 2400000, { "millitear" }, { "", "", -1 } },
			
			{ "B_Truck_01_box_F", 250000, { "millitear" }, { "", "", -1 } },
			{ "C_Van_01_Fuel_F", 75000, { "millitear" }, { "", "", -1 } },
			{ "C_Van_01_box_F", 155000, { "millitear" }, { "", "", -1 } },
			{ "I_Truck_02_box_F", 250000, { "millitear" }, { "", "", -1 } },
			{ "B_Truck_01_transport_F", 250000, { "millitear" }, { "", "", -1 } },
			{ "B_Truck_01_fuel_F", 155000, { "millitear" }, { "", "", -1 } },
			{ "B_Truck_01_ammo_F", 175000, { "millitear" }, { "", "", -1 } },
			{ "O_Truck_03_covered_F", 200000, { "millitear" }, { "", "", -1 } },
			{ "O_Truck_03_device_F", 2750000, { "millitear" }, { "", "", -1 } },
			{ "B_MRAP_01_F", 1000000, { "millitear" }, { "", "", -1 } },
			{ "O_MRAP_02_F", 1000000, { "millitear" }, { "", "", -1 } },
			{ "I_MRAP_03_F", 1000000, { "millitear" }, { "", "", -1 } },
			{ "O_MRAP_02_hmg_F", 5000000, { "millitear" }, { "", "", -1 } },
			{ "B_MRAP_01_hmg_F", 5500000, { "millitear" }, { "", "", -1 } },
			{ "O_APC_Wheeled_02_rcws_F", 5500000, { "millitear" }, { "", "", -1 } }
		};
	};
	
	class reb_don3 {
		side = "civ";
		vehicles[] = {
			{ "B_Quadbike_01_F", 1000, { "" }, { "", "", -1 } },
			{ "C_Offroad_01_F", 12500, { "" }, { "", "", -1 } },
			{ "B_G_Offroad_01_armed_F", 150000, { "" }, { "", "", -1 } },
			{ "C_SUV_01_F", 15000, { "" }, { "", "", -1 } },
			{ "C_Hatchback_01_sport_F", 100000, { "" }, { "", "", -1 } },
			
			{ "C_Offroad_02_unarmed_F", 100000, { "" }, { "", "", -1 } },			
			{ "B_T_LSV_01_unarmed_F", 200000, { "" }, { "", "", -1 } },
			{ "B_T_LSV_01_armed_F", 4000000, { "" }, { "", "", -1 } },
			{ "O_T_LSV_02_unarmed_F", 250000, { "" }, { "", "", -1 } },
			{ "O_T_LSV_02_armed_F", 2400000, { "" }, { "", "", -1 } },
			
			{ "B_Truck_01_box_F", 250000, { "" }, { "", "", -1 } },
			{ "I_Truck_02_box_F", 250000, { "" }, { "", "", -1 } },
			{ "B_Truck_01_transport_F", 250000, { "" }, { "", "", -1 } },
			{ "C_Van_01_Fuel_F", 75000, { "" }, { "", "", -1 } },
			{ "C_Van_01_box_F", 155000, { "" }, { "", "", -1 } },
			{ "B_Truck_01_fuel_F", 155000, { "" }, { "", "", -1 } },
			{ "B_Truck_01_ammo_F", 175000, { "" }, { "", "", -1 } },
			{ "O_Truck_03_covered_F", 200000, { "" }, { "", "", -1 } },
			{ "O_Truck_03_device_F", 2750000, { "" }, { "", "", -1 } },
			{ "B_MRAP_01_F", 1000000, { "" }, { "", "", -1 } },
			{ "O_MRAP_02_F", 1000000, { "" }, { "", "", -1 } },
			{ "I_MRAP_03_F", 1000000, { "" }, { "", "", -1 } },
			{ "O_MRAP_02_hmg_F", 5000000, { "" }, { "", "", -1 } },
			{ "B_MRAP_01_hmg_F", 5500000, { "" }, { "", "", -1 }},
			{ "O_APC_Wheeled_02_rcws_F", 5500000, { "" }, { "", "", -1 } }
		};
	};
	
	class reb_air {
		side = "civ";
		vehicles[] = {
			{ "C_Plane_Civil_01_F", 500000, { "rebel" }, { "", "", -1 } },					
			{ "B_Heli_Light_01_F", 200000, { "rebel" }, { "", "", -1 } },
			{ "O_Heli_Light_02_unarmed_F", 600000, { "rebel" }, { "", "", -1 } },
			{ "I_Heli_Transport_02_F", 2000000, { "rebel" }, { "", "", -1 } },	
			{ "I_Heli_light_03_unarmed_F", 750000, { "" }, { "", "", -1 } },
			{ "I_Plane_Fighter_03_AA_F", 20000000, { "rebel" }, { "", "", -1 } }
		};
	};
	
	class donair {
		side = "civ";
		vehicles[] = {
			{ "C_Plane_Civil_01_F", 500000, { "rebel" }, { "", "", -1 } },	
			{ "B_Heli_Light_01_F", 200000, { "rebel" }, { "", "", -1 } },
			{ "O_Heli_Light_02_unarmed_F", 600000, { "rebel" }, { "", "", -1 } },
			{ "I_Heli_Transport_02_F", 2000000, { "rebel" }, { "", "", -1 } },	
			{ "I_Heli_light_03_unarmed_F", 750000, { "" }, { "", "", -1 } },
			{ "I_Plane_Fighter_03_AA_F", 20000000, { "rebel" }, { "", "", -1 } }
		};
	};
	
	class rebair2 {
		side = "civ";
		vehicles[] = {
			{ "C_Plane_Civil_01_F", 500000, { "rebel" }, { "", "", -1 } },							
			{ "B_Heli_Light_01_F", 200000, { "rebel" }, { "", "", -1 } },
			{ "O_Heli_Light_02_unarmed_F", 600000, { "rebel" }, { "", "", -1 } },
			{ "I_Heli_Transport_02_F", 2000000, { "rebel" }, { "", "", -1 } },
			{ "O_Heli_Attack_02_black_F", 1550000, { "rebel" }, { "", "", -1 } },
			{ "O_Heli_Transport_04_covered_F", 4000000, { "rebel" }, { "", "", -1 } },
			{ "B_Heli_Transport_03_unarmed_F", 3000000, { "rebel" }, { "", "", -1 } },
			{ "B_Heli_Transport_01_camo_F", 5900000, { "rebel" }, { "", "", -1 } },
			{ "B_T_VTOL_01_infantry_F", 9500000, { "rebel" }, { "", "", -1 } },
			{ "I_Plane_Fighter_03_AA_F", 20000000, { "rebel" }, { "", "", -1 } }
		};
	};
	
	class donair2 {
		side = "civ";
		vehicles[] = {
			{ "C_Plane_Civil_01_F", 500000, { "rebel" }, { "", "", -1 } },			
			{ "B_Heli_Light_01_F", 200000, { "rebel" }, { "", "", -1 } },
			{ "O_Heli_Light_02_unarmed_F", 600000, { "rebel" }, { "", "", -1 } },
			{ "I_Heli_Transport_02_F", 2000000, { "rebel" }, { "", "", -1 } },
			{ "O_Heli_Attack_02_black_F", 1550000, { "rebel" }, { "", "", -1 } },
			{ "O_Heli_Transport_04_covered_F", 4000000, { "rebel" }, { "", "", -1 } },
			{ "B_Heli_Transport_03_unarmed_F", 3000000, { "rebel" }, { "", "", -1 } },
			{ "B_Heli_Transport_01_camo_F", 5900000, { "rebel" }, { "", "", -1 } },
			{ "B_T_VTOL_01_infantry_F", 9500000, { "rebel" }, { "", "", -1 } },
			{ "I_Plane_Fighter_03_AA_F", 20000000, { "rebel" }, { "", "", -1 } }
		};
	};
	
	class rebair3 {
		side = "civ";
		vehicles[] = {		

			{ "C_Plane_Civil_01_F", 500000, { "rebel" }, { "", "", -1 } },			
			{ "B_Heli_Light_01_F", 200000, { "" }, { "", "", -1 } },
			{ "O_Heli_Light_02_unarmed_F", 600000, { "" }, { "", "", -1 } },
			{ "I_Heli_light_03_unarmed_F", 750000, { "" }, { "", "", -1 } },
			{ "I_Heli_Transport_02_F", 2000000, { "" }, { "", "", -1 } },
			{ "O_Heli_Transport_04_box_F", 3000000, { "" }, { "", "", -1 } },
			{ "B_Heli_Attack_01_F", 950000, { "" }, { "", "", -1 } },
			{ "O_Heli_Attack_02_black_F", 1550000, { "" }, { "", "", -1 } },
			{ "O_Heli_Transport_04_covered_F", 4000000, { "" }, { "", "", -1 } },
			{ "B_Heli_Transport_03_F", 6000000, { "" }, { "", "", -1 } },
			{ "B_Heli_Transport_03_unarmed_F", 3000000, { "" }, { "", "", -1 } },
			{ "B_Heli_Transport_01_camo_F", 5900000, { "" }, { "", "", -1 } },
			{ "O_Heli_Transport_04_F", 4500000, { "" }, { "", "", -1 } },
			{ "B_T_VTOL_01_infantry_F", 9500000, { "" }, { "", "", -1 } },
			{ "B_T_VTOL_01_vehicle_F", 9500000, { "" }, { "", "", -1 } },
			{ "I_Plane_Fighter_03_AA_F", 20000000, { "" }, { "", "", -1 } }
		};
	};
	
	class donair3 {
		side = "civ";
		vehicles[] = {		
			{ "C_Plane_Civil_01_F", 500000, { "rebel" }, { "", "", -1 } },	
			{ "B_Heli_Light_01_F", 200000, { "" }, { "", "", -1 } },
			{ "O_Heli_Light_02_unarmed_F", 600000, { "" }, { "", "", -1 } },
			{ "I_Heli_light_03_unarmed_F", 750000, { "" }, { "", "", -1 } },
			{ "I_Heli_Transport_02_F", 2000000, { "" }, { "", "", -1 } },
			{ "O_Heli_Transport_04_box_F", 3000000, { "" }, { "", "", -1 }},
			{ "B_Heli_Attack_01_F", 950000, { "" }, { "", "", -1 }},
			{ "O_Heli_Attack_02_black_F", 1550000, { "" }, { "", "", -1 }},
			{ "O_Heli_Transport_04_covered_F", 4000000, { "" }, { "", "", -1 }},
			{ "B_Heli_Transport_03_F", 6000000, { "" }, { "", "", -1 } },
			{ "B_Heli_Transport_03_unarmed_F", 3000000, { "" }, { "", "", -1 } },
			{ "B_Heli_Transport_01_camo_F", 5900000, { "" }, { "", "", -1 } },
			{ "O_Heli_Transport_04_F", 4500000, { "" }, { "", "", -1 } },
			{ "B_T_VTOL_01_infantry_F", 9500000, { "" }, { "", "", -1 } },
			{ "B_T_VTOL_01_vehicle_F", 9500000, { "" }, { "", "", -1 } },
			{ "I_Plane_Fighter_03_AA_F", 20000000, { "" }, { "", "", -1 } }
		};
	};
	
	class markt {
		side = "civ";
		vehicles[] = {		

			{ "C_Plane_Civil_01_F", 500000, { "rebel" }, { "", "", -1 } },			
			{ "B_Heli_Light_01_F", 200000, { "" }, { "", "", -1 } },
			{ "O_Heli_Light_02_unarmed_F", 600000, { "" }, { "", "", -1 } },
			{ "I_Heli_light_03_unarmed_F", 750000, { "" }, { "", "", -1 } },
			{ "I_Heli_Transport_02_F", 2000000, { "" }, { "", "", -1 } },
			{ "O_Heli_Transport_04_box_F", 3000000, { "" }, { "", "", -1 } },
			{ "B_Heli_Attack_01_F", 950000, { "" }, { "", "", -1 } },
			{ "O_Heli_Attack_02_black_F", 1550000, { "" }, { "", "", -1 } },
			{ "O_Heli_Transport_04_covered_F", 4000000, { "" }, { "", "", -1 } },
			{ "B_Heli_Transport_03_F", 6000000, { "" }, { "", "", -1 } },
			{ "B_Heli_Transport_03_unarmed_F", 3000000, { "" }, { "", "", -1 } },
			{ "B_Heli_Transport_01_camo_F", 5900000, { "" }, { "", "", -1 } },
			{ "O_Heli_Transport_04_F", 4500000, { "" }, { "", "", -1 } },
			{ "B_T_VTOL_01_infantry_F", 9500000, { "" }, { "", "", -1 } },
			{ "B_T_VTOL_01_vehicle_F", 9500000, { "" }, { "", "", -1 } },
			//{ "O_T_VTOL_02_infantry_F", 12000000, { "" }, { "", "", -1 } },
			{ "I_Plane_Fighter_03_AA_F", 20000000, { "" }, { "", "", -1 } }
		};
	};

	class cop_car {
		side = "cop";
		vehicles[] = {
			{ "C_Offroad_01_F", 45000, { "" }, { "", "", -1 } },
			{ "C_SUV_01_F", 45000, { "" }, { "", "", -1 } },	
			{ "C_Offroad_02_unarmed_F", 55000, { "" }, { "ES_coplevel", "SCALAR", 2 } },		
			{ "C_Hatchback_01_F", 30000, { "" }, { "ES_coplevel", "SCALAR", 2 } },
			{ "C_Hatchback_01_sport_F", 70000, { "" }, { "ES_coplevel", "SCALAR", 3 } },
			{ "B_T_LSV_01_unarmed_F", 195000, { "" }, { "ES_coplevel", "SCALAR", 5 } },
			{ "B_MRAP_01_F", 900000, { "" }, { "ES_coplevel", "SCALAR", 6 } },
			{ "I_MRAP_03_F", 1100000, { "" }, { "ES_coplevel", "SCALAR", 6 } }
		};
	};
	
	class cop_air {
		side = "cop";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 75000, { "cAir" }, { "", "", -1 } },			
			{ "C_Plane_Civil_01_F", 220000, { "cAir" }, { "ES_coplevel", "SCALAR", 3 } },
			{ "B_T_VTOL_01_infantry_F", 9000000, { "cAir" }, { "ES_coplevel", "SCALAR", 12 } },			
			{ "I_Heli_light_03_unarmed_F", 200000, { "cAir" }, { "ES_coplevel", "SCALAR", 2 } },
			{ "O_Heli_Transport_04_black_F", 200000, { "cAir" }, { "ES_coplevel", "SCALAR", 4 } },
			{ "B_Heli_Transport_01_F", 800000, { "cAir" }, { "ES_coplevel", "SCALAR", 4 } },
			{ "O_Heli_Transport_04_ammo_black_F", 200000, { "cAir" }, { "ES_coplevel", "SCALAR", 5 } },
			{ "B_Heli_Transport_01_camo_F", 3200000, { "cAir" }, { "ES_coplevel", "SCALAR", 5 } },
			{ "B_Heli_Transport_03_unarmed_F", 3200000, { "cAir" }, { "ES_coplevel", "SCALAR", 5 } }
		};
	};

	class cop_airhq {
		side = "civ";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 75000, { "cAir" }, { "", "", -1 } },
			{ "B_Heli_Transport_01_F", 200000, { "cAir" }, { "ES_coplevel", "SCALAR", 3 } },
			{ "B_MRAP_01_hmg_F", 750000, { "" }, { "ES_coplevel", "SCALAR", 3 } }
		};
	};
	
	class tdf_car {
		side = "civ";
		vehicles[] = {
			{ "C_Offroad_01_F", 45000, { "tdf" }, { "", "", -1 } },
			{ "C_SUV_01_F", 45000, { "tdf" }, { "", "", -1 } },
			{ "B_T_LSV_01_unarmed_F", 145000, { "tdf" }, { "", "", -1 } },
			{ "C_Offroad_02_unarmed_F", 55000, { "tdf" }, { "", "", -1 } },
			{ "C_Hatchback_01_F", 30000, { "tdf" }, { "", "", -1 } },
			{ "C_Hatchback_01_sport_F", 70000, { "tdf" }, { "", "", -1 } },
			{ "B_MRAP_01_F", 1500000, { "tdf" }, { "", "", -1 } },
			{ "I_MRAP_03_F", 1800000, { "tdf" }, { "", "", -1 } }
		};
	};
	
	class tdf_air {
		side = "civ";
		vehicles[] = {
			{ "B_Heli_Light_01_F", 75000, { "tdf" }, { "", "", -1 } },	
			{ "C_Plane_Civil_01_F", 220000, { "tdf" }, { "", "", -1 } },
			{ "I_Heli_light_03_unarmed_F", 200000, { "tdf" }, { "", "", -1 } },
			{ "O_Heli_Transport_04_black_F", 200000, { "tdf" }, { "", "", -1 } },
			{ "B_Heli_Transport_01_F", 800000, { "tdf" }, { "", "", -1 } },
			{ "O_Heli_Transport_04_ammo_black_F", 200000, { "tdf" }, { "", "", -1 } },
			{ "B_Heli_Transport_01_camo_F", 3200000, { "tdf" }, { "", "", -1 } },
			{ "B_Heli_Transport_03_unarmed_F", 3200000, { "tdf" }, { "", "", -1 } }
		};
	};
	
	class unit {
		side = "civ";
		vehicles[] = {
			{ "C_SUV_01_F", 15000, { "unit" }, { "", "", -1 } },
			{ "C_Hatchback_01_sport_F", 100000, { "unit" }, { "", "", -1 } },
			{ "B_Heli_Light_01_F", 200000, { "unit" }, { "", "", -1 } },
			{ "I_Heli_light_03_unarmed_F", 750000, { "unit" }, { "", "", -1 } },
			{ "B_MRAP_01_F", 1000000, { "unit" }, { "", "", -1 } },
			{ "I_MRAP_03_F", 1000000, { "unit" }, { "", "", -1 } }
		};
	};
	
	class faa {
		side = "civ";
		vehicles[] = {
			{ "I_MRAP_03_F", 1000000, { "faa" }, { "", "", -1 } }
		};
	};
	
	class ai {
		side = "civ";
		vehicles[] = {
			{  "B_Heli_Transport_01_camo_F", 5900000, { "aiskin" }, { "", "", -1 } },		
			{  "O_Heli_Attack_02_black_F", 1550000, { "aiskin" }, { "", "", -1 } },
			{  "B_Heli_Transport_03_F", 6000000, { "aiskin" }, { "", "", -1 } },
			{ "B_MRAP_01_F", 1000000, { "aiskin" }, { "", "", -1 } },
			{  "O_MRAP_02_F", 1000000, { "aiskin" }, { "", "", -1 } },
			{ "I_MRAP_03_F", 1000000, { "aiskin" }, { "", "", -1 } }
		};
	};
	
	class ksk {
		side = "civ";
		vehicles[] = {
			{  "C_Offroad_01_F", 15000, { "kskskin" }, { "", "", -1 } },
			{  "O_Heli_Attack_02_black_F", 1550000, { "kskskin" }, { "", "", -1 } },
			{  "I_MRAP_03_F", 1000000, { "kskskin" }, { "", "", -1 } },
			{  "O_MRAP_02_F", 1000000, { "kskskin" }, { "", "", -1 } },		
			{ "O_MRAP_02_hmg_F", 5000000, { "kskskin" }, { "", "", -1 } },
			{  "O_APC_Wheeled_02_rcws_F", 5500000, { "kskskin" }, { "", "", -1 } }
		};
	};
	
	class ksk1 {
		side = "civ";
		vehicles[] = {
			{  "C_SUV_01_F", 15000, { "kskskin" }, { "", "", -1 } },
			{  "C_Offroad_01_F", 15000, { "kskskin" }, { "", "", -1 } }
		};
	};
	
	class ksk2 {
		side = "civ";
		vehicles[] = {
			{  "O_Heli_Attack_02_black_F", 1550000, { "kskskin" }, { "", "", -1 } },
			{  "O_MRAP_02_F", 1000000, { "kskskin" }, { "", "", -1 } },		
			{ "O_MRAP_02_hmg_F", 5000000, { "kskskin" }, { "", "", -1 } },
			{  "O_APC_Wheeled_02_rcws_F", 5500000, { "kskskin" }, { "", "", -1 } }
		};
	};
	
	class army {
		side = "civ";
		vehicles[] = {
			{  "B_Heli_Light_01_F", 200000, { "armyskin" }, { "", "", -1 } },
			{  "I_Heli_light_03_unarmed_F", 750000, { "armyskin" }, { "", "", -1 } },
			{  "B_MRAP_01_F", 1000000, { "armyskin" }, { "", "", -1 } }
		};
	};
	
	class sk {
		side = "civ";
		vehicles[] = {
			{  "O_Heli_Attack_02_black_F", 1550000, { "skskins" }, { "", "", -1 } },
			{  "I_MRAP_03_F", 1000000, { "skskins" }, { "", "", -1 } }
		};
	};
	
	class gis {
		side = "civ";
		vehicles[] = {
			{  "B_MRAP_01_F", 1000000, { "gisskins" }, { "", "", -1 } },
			{  "I_MRAP_03_F", 1000000, { "gisskins" }, { "", "", -1 } }
		};
	};
	
	class ac {
		side = "civ";
		vehicles[] = {
			{ "C_SUV_01_F", 15000, { "acskin" }, { "", "", -1 } }
		};
	};

	class cop_ship {
		side = "cop";
		vehicles[] = {
			{ "B_Boat_Transport_01_F", 3000, { "cg" }, { "", "", -1 } },
			{ "C_Boat_Civil_01_police_F", 20000, { "cg" }, { "", "", -1 } },		
			{ "I_C_Boat_Transport_02_F", 140000, { "cg" }, { "", "", -1 } },		
			{ "B_Boat_Armed_01_minigun_F", 75000, { "cg" }, { "", "", -1 } },
			{ "B_SDV_01_F", 100000, { "cg" }, { "", "", -1 } }
		};
	};

	class civ_ship {
		side = "civ";
		vehicles[] = {
			{ "C_Scoooter_Transport_01_F", 5000, { "boat" }, { "", "", -1 } },
			{ "C_Rubberboat", 7000, { "boat" }, { "", "", -1 } },
			{ "C_Boat_Civil_01_F", 22000, { "boat" }, { "", "", -1 } },
			{ "I_C_Boat_Transport_02_F", 122000, { "boat" }, { "", "", -1 } },
			{ "B_SDV_01_F", 150000, { "boat" }, { "", "", -1 } }
		};
	};

	class med_ship {
		side = "med";
		vehicles[] = {
			{ "O_Lifeboat", 10000, { "" }, { "ES_medicLevel", "SCALAR", 2 } }
		};
	};
};