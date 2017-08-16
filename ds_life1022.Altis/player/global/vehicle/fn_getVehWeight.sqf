/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	returns a vehicles max weight
*/

private ["_className"];

_className = _this select 0;

switch(_className)do
	{
	case "B_Quadbike_01_F": {40};
	case "C_Hatchback_01_F": {100};
	case "C_Offroad_01_F": {150};
	case "C_SUV_01_F": {120};
	case "C_Van_01_transport_F": {300};
	case "C_Hatchback_01_sport_F": {80};
	case "C_Offroad_02_unarmed_F": {80};

	case "C_Van_01_box_F": {320};
	case "I_Truck_02_transport_F": {400};
	case "I_Truck_02_covered_F": {420};
	case "O_Truck_02_fuel_F": {150};
	case "B_Truck_01_fuel_F": {150};
	case "O_Truck_03_fuel_F": {150};
	case "O_Truck_03_repair_F": {150};
	case "O_Truck_03_medical_F": {150};
	case "B_Truck_01_transport_F": {580};
	case "B_Truck_01_covered_F": {650};
	case "B_Truck_01_box_F": {900};
	case "O_Truck_03_device_F": {500};
	case "O_Truck_03_transport_F": {750};

	case "C_Heli_Light_01_civil_F": {100};
	case "B_Heli_Light_01_F": {110};
	case "O_Heli_Light_02_unarmed_F": {180};
	case "I_Heli_Transport_02_F": {750};
	case "I_Heli_light_03_unarmed_F": {120};
	case "O_Heli_Transport_04_fuel_F": {50};
	case "O_Heli_Transport_04_F": {120};
	case "B_Heli_Transport_03_unarmed_F": {550};
	case "C_Plane_Civil_01_F": {120};
	case "C_Plane_Civil_01_racing_F": {140};

	case "C_Rubberboat": {120};
	case "C_Boat_Civil_01_F": {320};
	case "C_Scooter_Transport_01_F": {100};
	case "O_SDV_01_F": {420};
	case "I_C_Boat_Transport_02_F": {600};
	case "O_Boat_Armed_01_hmg_F": {250};

	case "B_MRAP_01_F": {100};
	case "O_T_LSV_02_unarmed_F": {100};
	case "B_T_LSV_01_unarmed_F": {100};
	case "B_MRAP_01_hmg_F": {80};
	case "O_T_LSV_02_armed_F": {80};
	case "I_APC_Wheeled_03_cannon_F": {500};
	case "I_MRAP_03_hmg_F": {100};
	case "O_G_Offroad_01_armed_F": {140};

	case "O_Heli_Transport_04_ammo_F": {130};
	case "I_MRAP_03_F": {220};
	case "O_MRAP_02_F": {220};
	case "B_Heli_Light_01_armed_F": {100};
	case "O_Heli_Light_02_F": {160};
	case "B_Heli_Transport_01_camo_F": {400};
	case "B_Heli_Transport_03_F": {300};
	case "B_G_Offroad_01_armed_F": {180};
	case "B_T_LSV_01_armed_F": {80};
	case "O_MRAP_02_hmg_F": {80};

	case "O_Truck_02_box_F": {200};
	case "B_Truck_01_mover_F": {120};

	case "Land_Pod_Heli_Transport_04_fuel_F": {200};
	case "Land_Pod_Heli_Transport_04_box_F": {500};
	case "Land_Pod_Heli_Transport_04_covered_F": {500};
	case "Land_Pod_Heli_Transport_04_medevac_F": {200};
	case "Land_Pod_Heli_Transport_04_repair_F": {200};
	case "B_Slingload_01_Cargo_F": {750};
	case "B_Slingload_01_Medevac_F": {250};
	case "B_Slingload_01_Repair_F": {250};
	case "B_Slingload_01_Fuel_F": {250};

	case "B_T_VTOL_01_infantry_F": {2500};
	case "O_T_VTOL_02_infantry_F": {2500};
	case "B_T_VTOL_01_vehicle_F": {750};
	case "O_T_VTOL_02_vehicle_F": {750};

	case "O_Truck_03_covered_F": {5000};
	case "O_APC_Wheeled_02_rcws_F": {5000};
	case "B_APC_Wheeled_01_cannon_F": {7500};

	case "Box_NATO_Ammo_F": {0};

	default {15};
	};