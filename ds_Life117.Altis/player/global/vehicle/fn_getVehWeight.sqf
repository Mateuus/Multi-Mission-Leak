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
	case "B_Quadbike_01_F": {15};
	case "C_Hatchback_01_F": {30};
	case "C_Offroad_01_F": {45};
	case "C_SUV_01_F": {30};
	case "C_Van_01_transport_F": {230};
	case "C_Hatchback_01_sport_F": {25};
	case "C_Van_01_box_F": {230};
	case "I_Truck_02_transport_F": {375};
	case "I_Truck_02_covered_F": {400};
	case "O_Truck_02_fuel_F": {75};
	case "B_Truck_01_fuel_F": {100};
	case "O_Truck_03_fuel_F": {100};
	case "O_Truck_03_repair_F": {290};
	case "O_Truck_03_medical_F": {180};
	case "B_Truck_01_transport_F": {380};
	case "B_Truck_01_covered_F": {400};
	case "B_Truck_01_box_F": {700};
	case "O_Truck_03_device_F": {500};
	case "C_Heli_Light_01_civil_F": {180};
	case "B_Heli_Light_01_F": {180};
	case "O_Heli_Light_02_unarmed_F": {180};
	case "I_Heli_Transport_02_F": {750};
	case "I_Heli_light_03_unarmed_F": {100};
	case "O_Heli_Transport_04_fuel_F": {100};
	case "O_Heli_Transport_04_F": {120};
	case "B_Heli_Transport_03_unarmed_F": {550};
	case "I_Plane_Fighter_03_AA_F": {20};
	case "B_Plane_CAS_01_F": {50};
	case "C_Rubberboat": {45};
	case "C_Boat_Civil_01_F": {175};
	case "O_SDV_01_F": {180};
	case "Land_Pod_Heli_Transport_04_box_F": {500};
	case "Land_Pod_Heli_Transport_04_covered_F": {500};
	case "B_Slingload_01_Cargo_F": {700};
	default {15};
	};
	







