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
    case "B_Quadbike_01_F": {25};
	
	case "C_SUV_01_F": {50};
	case "C_Offroad_02_unarmed_F": {70};
	case "C_Offroad_01_F": {95};
	case "O_G_Offroad_01_F": {95};
	case "O_G_Offroad_01_armed_F": {50};
	case "B_G_Offroad_01_repair_F": {100};
	
	case "C_Hatchback_01_F": {40};
	case "C_Hatchback_01_sport_F": {25};
	
	case "C_Van_01_transport_F": {100};
	case "C_Van_01_fuel_F": {130};
	case "C_Van_01_box_F": {150};
	
	case "I_Truck_02_transport_F": {350};
	case "I_Truck_02_covered_F": {400};
	
	case "B_Truck_01_transport_F": {475};
	case "B_Truck_01_covered_F": {575};
	case "B_Truck_01_ammo_F": {675};
	case "B_Truck_01_box_F": {775};
	case "B_Truck_01_fuel_F": {500};
	case "B_Truck_01_mover_F": {150};
	case "B_Truck_01_medical_F": {150};
	
	case "O_Truck_03_device_F": {400};
	case "O_Truck_03_transport_F": {475};
	case "O_Truck_03_covered_F": {575};
	case "O_Truck_03_ammo_F": {775};
	case "O_Truck_03_fuel_F": {550};
	
	case "O_Truck_02_medical_F": {150};
	case "O_Truck_02_box_F": {150};
	case "O_Truck_02_covered_F": {725};
	
	case "C_Boat_Civil_01_police_F": {150};
	case "C_Scooter_Transport_01_F": {25};
	case "I_C_Boat_Transport_02_F": {250};
	case "C_Rubberboat": {60};
	case "B_SDV_01_F": {150};
	case "C_Boat_Civil_01_F": {150};
	case "C_Boat_Civil_01_rescue_F": {150};
	
	case "O_MRAP_02_F": {150};
	case "B_MRAP_01_F": {150};
	
	case "C_Plane_Civil_01_F": {100};
	case "B_Heli_Light_01_F": {50};
	case "C_Heli_light_01_blue_F": {50};
	case "C_Heli_light_01_elliptical_F": {50};
	case "C_Heli_light_01_furious_F": {50};
	case "C_Heli_light_01_jeans_F": {50};
	case "C_Heli_light_01_speedy_F": {50};
	case "C_Heli_light_01_vrana_F": {50};
	case "C_Heli_light_01_wasp_F": {50};
	case "C_Heli_light_01_wave_F": {50};
	case "C_Heli_light_01_stripped_F": {50};
	case "O_Heli_Light_02_unarmed_F": {75};
	case "I_Heli_Transport_02_F": {100};
	case "O_Heli_Transport_04_F": {150};
	case "O_Heli_Transport_04_box_F": {200};
	case "O_Heli_Transport_04_medevac_F": {150};
	case "I_Heli_light_03_unarmed_F": {150};
	case "B_Heli_Transport_01_F": {150};
	case "B_Heli_Transport_03_unarmed_F": {200};
	case "B_Heli_Transport_01_camo_F": {150};
	
	//hauskisten
	case "Box_IND_Grenades_F": {250};
	case "B_supplyCrate_F": {500};
	case "Box_IND_AmmoVeh_F": {1000};
	default {-1};
};