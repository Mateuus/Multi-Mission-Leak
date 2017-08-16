_ret = switch(_this select 0) do {
	case "C_Quadbike_01_black_F": {1000};
	case "C_Quadbike_01_F": {1000};
	case "B_Quadbike_01_F": {1000};
	case "C_Offroad_01_F": {4000};
	case "B_G_Offroad_01_F": {4000};
	case "I_G_Offroad_01_F": {4000};
	case "C_Offroad_02_unarmed_F": {6500};
	case "C_Hatchback_01_F": {5000};
	case "C_Hatchback_01_sport_F": {7000};
	case "C_SUV_01_F": {6000};
	case "C_Van_01_box_F": {12000};
	case "C_Van_01_transport_F": {10000};
	case "C_Van_01_fuel_F": {15000};
	case "O_MRAP_02_F": {-1};
	case "I_MRAP_03_F": {150000};
	case "B_MRAP_01_F": {150000};
	case "O_T_LSV_02_unarmed_F": {-1};
	case "B_T_LSV_01_unarmed_F": {-1};
	//Trucks
	case "I_Truck_02_fuel_F": {50000};
	case "I_Truck_02_transport_F": {30000};
	case "I_Truck_02_covered_F": {60000};
	case "B_Truck_01_fuel_F": {100000};
	case "B_Truck_01_transport_F": {120000};
	case "B_Truck_01_covered_F": {150000};
	case "B_Truck_01_box_F": {250000};
	case "O_Truck_03_device_F": {400000};
	case "I_Truck_02_box_F": {45000};
	case "B_Truck_01_mover_F": {60000};
	case "B_Truck_01_repair_F": {125000};
	case "B_Truck_01_ammo_F": {130000};
	case "B_Truck_01_medical_F": {130000};
	case "O_Truck_03_transport_F": {150000};
	case "O_Truck_03_covered_F": {170000};
	case "O_Truck_03_ammo_F": {200000};
	case "O_Truck_03_fuel_F": {120000};
	case "O_Truck_03_repair_F": {150000};
	case "O_Truck_02_fuel_F": {120000};
	//Go-Kart
	case "C_Kart_01_Fuel_F": {750};
	case "C_Kart_01_Red_F": {750};
	case "C_Kart_01_Vrana_F": {750};
	case "C_Kart_01_Blu_F": {750};
	//Boats
	case "C_Scooter_Transport_01_F": {10000};
	case "C_Boat_Civil_01_F": {30000};
	case "I_C_Boat_Transport_02_F": {35000};
	case "C_Boat_Civil_01_rescue_F": {50000};
	case "B_SDV_01_F": {100000};
	//Air
	case "B_Heli_Light_01_F": {-1};
	case "C_Heli_Light_01_civil_F": {75000};	
	case "C_Plane_Civil_01_F": {90000};
	case "C_Plane_Civil_01_racing_F": {100000};
	case "O_Heli_Light_02_unarmed_F": {100000};
	case "I_Heli_Transport_02_F": {350000};
	case "O_Heli_Transport_04_covered_F": {400000};
	case "O_Heli_Transport_04_bench_F": {400000};
	case "B_Heli_Transport_03_unarmed_F": {400000};
	case "O_Heli_Transport_04_box_F": {500000};
	case "B_Plane_CAS_01_F": {600000};
	case "B_T_VTOL_01_infantry_F": {800000};
	case "B_T_VTOL_01_vehicle_F": {200000};
	default {-1};
};

_ret;