/*
	File: fn_vehicleWeightCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration for vehicle weight.
*/
private["_className"];
_className = param [0,"",[""]];

switch (_className) do
{
	case "C_Offroad_01_F": {65};
	case "B_G_Offroad_01_F": {65};
	case "B_Quadbike_01_F": {25};
	case "I_Truck_02_covered_F": {250};
	case "I_Truck_02_transport_F": {200};
	case "C_Hatchback_01_F": {40};
	case "C_Hatchback_01_sport_F": {45};
	case "C_SUV_01_F": {50};
	case "C_Van_01_transport_F": {100};
	case "I_G_Van_01_transport_F": {100};
	case "C_Van_01_box_F": {150};
	case "C_Boat_Civil_01_F": {210}; // Gewicht geändert
	case "C_Boat_Civil_01_police_F": {85};
	case "C_Boat_Civil_01_rescue_F": {85};
	case "B_Truck_01_box_F": {450};
	case "B_Truck_01_transport_F": {325};
	case "B_MRAP_01_F": {65};
	case "O_MRAP_02_F": {60};
	case "I_MRAP_03_F": {58};
	case "B_Heli_Light_01_F": {90};
	case "O_Heli_Light_02_unarmed_F": {210};
	case "I_Heli_Transport_02_F": {300}; // 375
	case "C_Rubberboat": {65}; // Gewicht geändert
	case "O_Boat_Armed_01_hmg_F": {175};
	case "B_Boat_Armed_01_minigun_F": {175};
	case "I_Boat_Armed_01_minigun_F": {175};
	case "B_G_Boat_Transport_01_F": {45};
	case "B_Boat_Transport_01_F": {45};
	case "O_Truck_03_transport_F": {285};
	case "O_Truck_03_covered_F": {300};
	case "O_Truck_03_device_F": {350};
	case "Land_CargoBox_V1_F": {5000};
	case "Box_IND_Grenades_F": {350};
	case "B_supplyCrate_F": {700};
	case "B_Heli_Transport_03_unarmed_F": {325};
	case "O_Heli_Transport_04_bench_f": {150};//erhöht von 50
	case "O_Heli_Transport_04_F": {100};
	case "B_Heli_Transport_01_camo_F": {100};//GH Tarnfleck
	case "O_MRAP_02_hmg_F": {70};//Ifrit HMG
	case "I_Truck_02_medical_F" : {300};
	case "O_Truck_03_medical_F" : {300};
	case "B_Truck_01_medical_F" : {300};
	case "I_Truck_02_box_F" : {450};
	case "I_Truck_02_ammo_F" : {360};  //METH Truck
	case "B_SDV_01_F" : {250};  //U-Boot
	case "Land_Pallet_MilBoxes_F" : {200};  // Louis Box - Bank Heist Only !!!
	case "Land_Pod_Heli_Transport_04_covered_F" : {20};
	case "O_supplyCrate_F" : {50};
	case "Land_Pod_Heli_Transport_04_box_F" : {100};
	case "Box_IND_AmmoVeh_F" : {150};
	case "B_Slingload_01_Cargo_F" : {200};
	default {-1};
};