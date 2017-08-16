/*
	File: fn_vehicleWeightCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for vehicle weight.
*/
private["_className"];
_className = [_this,0,"",[""]] call BIS_fnc_param;

switch (_className) do
{
	case "B_Quadbike_01_F": {35};
	case "C_Quadbike_01_F": {35};	
	case "C_Quadbike_01_black_F": {20};
	case "C_Hatchback_01_F": {65};
	case "C_Hatchback_01_sport_F": {65};
	case "C_Offroad_01_F": {135};
	case "B_G_Offroad_01_F": {135};
	case "B_G_Offroad_01_armed_F": {135};
	case "I_G_Offroad_01_armed_F": {135};
	case "C_SUV_01_F": {100};
	case "C_Van_01_transport_F": {200};
	case "C_Van_01_box_F": {260};
	case "C_Van_01_fuel_F": {260};
	case "O_Truck_02_fuel_F": {550};
	case "I_Truck_02_transport_F": {400};
	case "I_Truck_02_covered_F": {550};
	case "O_Truck_03_fuel_F": {1600};
	case "O_Truck_03_transport_F": {1500};
	case "O_Truck_03_covered_F": {1800};
	case "O_Truck_03_ammo_F": {2250};
	case "O_Truck_03_device_F": {1300};
	case "B_Truck_01_fuel_F": {1200};
	case "B_Truck_01_transport_F": {1000};
	case "B_Truck_01_covered_F": {1300};
	case "B_Truck_01_ammo_F": {2000};
	case "B_Truck_01_box_F": {2500};
	case "B_MRAP_01_F": {180};
	case "I_MRAP_03_F": {220};
	case "O_MRAP_02_F": {220};
	case "B_Heli_Light_01_armed_F": {25}; //Pawnee
	case "B_Heli_Transport_01_F": {100};
	case "B_Heli_Transport_01_camo_F": {100};
	case "B_Heli_Transport_03_F": {450};
	case "B_Heli_Transport_03_unarmed_F": {950}; //Huron
	case "O_Heli_Transport_04_box_F": {1400}; //Taru
	case "O_Heli_Transport_04_bench_F": {250}; //Taru
	case "O_Heli_Transport_04_covered_F": {750}; //Taru
	case "O_Heli_Transport_04_medevac_F": {200}; //Taru
	case "O_Heli_Transport_04_repair_F": {200}; //Taru
    case "I_Heli_light_03_F": {100}; //Hellcat
	case "C_Heli_Light_01_civil_F": {100}; //M-900
	case "O_Heli_Attack_02_F": {180};
	case "O_Heli_Attack_02_black_F": {220};
	case "B_Heli_Attack_01_F": {25};
	case "B_Heli_Light_01_F": {25}; //MH-9 Hummingbird
	case "O_Heli_Light_02_unarmed_F": {250};
	case "I_Heli_light_03_unarmed_F": {75};
	case "I_Heli_Transport_02_F": {500};
	case "B_Plane_CAS_01_F": {1750}; //Jet
	case "Land_PlasticCase_01_large_F": {700};
	case "CargoNet_01_box_F": {1000};
	case "C_Rubberboat": {75};
	case "C_Boat_Civil_01_F": {450};
	case "C_Boat_Civil_01_police_F": {150};
	case "C_Boat_Civil_01_rescue_F": {600};
	case "O_Boat_Armed_01_hmg_F": {275};
	case "B_Boat_Armed_01_minigun_F": {275};
	case "B_SDV_01_F": {550};
	case "I_Boat_Armed_01_minigun_F": {275};
	case "B_G_Boat_Transport_01_F": {75};
	case "B_Boat_Transport_01_F": {75};
	case "O_Lifeboat": {50};
	case "I_G_Offroad_01_F": {135};
	case "Land_Cargo40_military_green_F": {20000};
	case "B_Slingload_01_Cargo_F": {450};
	case "B_Slingload_01_Fuel_F": {450};
	case "B_Slingload_01_Ammo_F": {450};
	case "B_Slingload_01_Medevac_F": {450};
	case "B_Slingload_01_Repair_F": {450};
	case "C_Offroad_02_unarmed_F": {170}; //Apex...
	case "O_T_LSV_02_unarmed_F": {240};
	case "B_T_LSV_01_unarmed_F": {240};
	case "C_Scooter_Transport_01_F": {50};
	case "I_C_Boat_Transport_02_F": {475};
	case "C_Plane_Civil_01_F": {150};
	case "C_Plane_Civil_01_racing_F": {150};
	case "B_T_VTOL_01_infantry_F": {1600};
	case "B_T_VTOL_01_vehicle_F": {200};
	case "Land_Suitcase_F": {50000};
	default {-1};
};