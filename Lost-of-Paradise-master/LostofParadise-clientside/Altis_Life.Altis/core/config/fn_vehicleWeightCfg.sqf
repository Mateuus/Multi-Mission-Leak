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
	case "C_Offroad_01_F": {80};
	case "C_Offroad_01_repair_F": {80};
	case "B_G_Offroad_01_F": {80};
	case "B_Quadbike_01_F": {25};
	case "I_Truck_02_covered_F": {350};
	case "I_Truck_02_transport_F": {300};
	case "C_Hatchback_01_F": {40};
	case "C_Hatchback_01_sport_F": {40};
	case "C_SUV_01_F": {50};
	case "C_Van_01_transport_F": {100};
	case "I_G_Van_01_transport_F": {100};
	case "C_Van_01_box_F": {150};
	case "C_Boat_Civil_01_F": {300};
	case "C_Boat_Civil_01_police_F": {85};
	case "C_Boat_Civil_01_rescue_F": {85};
	case "B_Truck_01_box_F": {800};
	case "B_Truck_01_covered_F": {500};
	case "B_MRAP_01_hmg_F": {85};
	case "O_Truck_03_transport_F": {550};
	case "O_Truck_03_repair_F": {700};
	case "O_Truck_03_device_F": {1000};
	case "O_Truck_03_covered_F": {700};
	case "B_Truck_01_fuel_F": {700};
	case "B_Truck_01_ammo_F": {650};
	case "B_Truck_01_medical_F": {500};
	case "B_Truck_01_transport_F": {400};
	case "O_Heli_Transport_04_medevac_F": {100}; //Medic
	case "O_Heli_Transport_04_F": {50}; //ADAC
	case "O_Heli_Transport_04_bench_F": {50}; // Rebellen
	case "O_Heli_Transport_04_fuel_F": {300}; //Tanker
	case "O_Heli_Transport_04_box_F": {400}; // Fracht
	case "B_Heli_Transport_03_unarmed_F": {250}; //CIV Chainok
	case "B_Heli_Transport_03_F": {100}; // Cop Chainok
	case "I_Truck_02_fuel_F": {150};
	case "B_MRAP_01_F": {100};
	case "O_Plane_CAS_02_F": {3000};
	case "O_MRAP_02_F": {100};
	case "I_MRAP_03_F": {100};
	case "O_Truck_03_ammo_F": {1200};
	case "B_Heli_Light_01_F": {90};
	case "C_Heli_Light_01_civil_F": {90};
	case "O_Heli_Light_02_unarmed_F": {210};
	case "I_Heli_Transport_02_F": {400};
	case "I_Heli_light_03_unarmed_F": {150};
	case "C_Rubberboat": {180};
	case "B_SDV_01_F": {300};
	case "C_Van_01_Fuel_F": {150};
	case "O_Boat_Armed_01_hmg_F": {175};
	case "B_Boat_Armed_01_minigun_F": {175};
	case "I_Boat_Armed_01_minigun_F": {175};
	case "B_G_Boat_Transport_01_F": {180};
	case "B_Boat_Transport_01_F": {180};
	case "O_Truck_03_fuel_F": {600};
	case "Land_CargoBox_V1_F": {5000};
	case "Box_IND_Grenades_F": {350};
	case "I_supplyCrate_F": {2500};
	case "C_Offroad_02_unarmed_F": {100};
	case "B_T_LSV_01_unarmed_F": {100};
	case "O_T_LSV_02_unarmed_F": {100};
	case "B_T_VTOL_01_vehicle_F": {300};
	case "C_Plane_Civil_01_F": {300};
    case "C_Plane_Civil_01_racing_F": {300};
	case "B_T_VTOL_01_infantry_F": {400};
	case "I_C_Boat_Transport_02_F": {300};
	case "C_Scooter_Transport_01_F": {80};
	default {-1};
};