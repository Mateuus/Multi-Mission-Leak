#include <macro.h>
/*
	File: fn_vehicleWeightCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for vehicle weight.
*/
private["_className","_return","_nodonator"];
_className = [_this,0,"",[""]] call BIS_fnc_param;
_return = -1;
_nodonator = 0;

switch (_className) do
{
	case "B_Heli_Light_01_F": {_return = 120};  // HummingBird
	case "B_Truck_01_mover_F": {_return = 400}; //COP HEMMT
	case "O_Heli_Light_02_unarmed_F": {_return = 250}; // Orca
	case "I_Heli_light_03_unarmed_F": {_return = 150}; // Hellcat
	case "C_Offroad_01_repair_F": {_return = 100}; // Offroad Rep
	case "C_Offroad_01_F": {_return = 100}; // Offroad
	case "C_Van_01_box_F": {_return = 200}; // Truck Boxer
	case "C_SUV_01_F": {_return = 80}; // SUV
	case "B_Quadbike_01_F": {_return = 35}; // Quad
	case "C_Van_01_fuel_F": {_return = 220}; // Truck Fuel
	case "C_Hatchback_01_F": {_return = 60}; // Limo
	case "C_Van_01_transport_F": {_return = 180}; // Truck Offen
	case "C_Hatchback_01_sport_F": {_return = 65}; // Sportlimo
	case "I_Truck_02_transport_F": {_return = 200}; // Zamak Offen
	case "O_Truck_03_transport_F": {_return = 400}; // Tempest Offen
	case "B_Truck_01_transport_F": {_return = 1000}; // Hemmtt Offen
	case "O_Truck_02_covered_F": {_return = 275}; // Zamak Abgedeckt
	case "O_Truck_03_covered_F": {_return = 550}; // Tempest Abgedeckt
	case "O_Truck_03_fuel_F": {_return = 1000}; // Tempest Fuel
	case "B_Truck_01_covered_F": {_return = 1500}; // Hemmtt Abgedeckt
	case "B_Truck_01_box_F": {_return = 2600}; // Hemmtt Box
	case "B_Truck_01_fuel_F": {_return = 2200}; // Hemmtt Fuel
	case "O_Truck_03_device_F": {_return = 1800}; // Tempest Gerät
	case "O_MRAP_02_F": {_return = 250}; // Ifrit
	case "B_G_Offroad_01_armed_F": {_return = 50}; // Offroad Bewaf
	case "I_Heli_Transport_02_F": {_return = 350}; // Mohawk
	case "I_MRAP_03_F": {_return = 50}; // Strider
	case "B_MRAP_01_F": {_return = 50}; // Hunter
	case "B_Heli_Transport_03_unarmed_F": {_return = 600}; // Huron
	case "B_Heli_Transport_01_F": {_return = 120}; // Ghosthawk
	case "O_SDV_01_F": {_return = 80}; // Uboot
	case "C_Boat_Civil_01_police_F": {_return = 100}; // PolizeiBoot
	case "B_Truck_01_ammo_F": {_return = 2100}; // Hemmtt Ammo
	case "O_Truck_03_ammo_F": {_return = 1850}; // Tempest Ammo
	case "Land_CargoBox_V1_F": {_return = 800};
	case "Box_IND_Grenades_F": {_return = 150};
	case "I_supplyCrate_F": {_return = 300};
	case "I_APC_Wheeled_03_cannon_F": {_return = 2500};
	case "O_Heli_Transport_04_F": {_return = 1200};
	case "I_Plane_Fighter_03_CAS_F": {_return = 1500};
	case "O_Plane_CAS_02_F": {_return = 2800};
	case "B_Plane_CAS_01_F": {_return = 3500};
	case "O_Heli_Transport_04_black_F": {_return = 450};
	case "O_Heli_Transport_04_fuel_F": {_return = 1150};	//Taru Treibstoff
	case "Box_IND_AmmoVeh_F": {_return = 300;  _nodonator = 1;};
	case "C_supplyCrate_F": {_return = 200; _nodonator = 1;};
    case "B_Slingload_01_Cargo_F": {_return = 300};
	case "B_Slingload_01_Fuel_F": {_return = 500};
	case "Box_East_AmmoVeh_F": {50};
	case "C_Boat_Civil_04_F": {_return = 2500};
	case "I_Truck_02_covered_F":  {_return = 350}; // Zamak Abgedeckt
	
	//Apex-Content
	case "C_Offroad_02_unarmed_F":  {_return = 120};	//Cheap Civil Überrol <-- Rechtschreibskillz
	case "C_Plane_Civil_01_racing_F":  {_return = 100};	//Caesar Racing 75k
	case "C_Plane_Civil_01_F":  {_return = 400};		//Caesar Farm
	case "C_Scooter_Transport_01_F":  {_return = 50};	//Jetski
	case "I_C_Offroad_02_unarmed_F":  {_return = 120};	//Cheap Civil
	case "B_CTRG_LSV_01_light_F":  {_return = 100};		//Cheap Militär
	case "B_T_LSV_01_unarmed_F": {_return = 100};		//Cheap Militär
	case "O_LSV_02_unarmed_F": {_return = 100};			//Cheap Militär2
	case "B_T_VTOL_01_vehicle_F": {_return = 1000};		//VTOL Unbewaffnet
	case "O_T_VTOL_02_vehicle_F": {_return = 550};		//Y32
	
	
	
	//Boote 2.0 Update
	case "C_Rubberboat":  {_return = 100};
	case "B_Lifeboat":  {_return = 200};
	case "O_Lifeboat":  {_return = 300};
	case "C_Boat_Civil_01_F":  {_return = 400};
	case "C_Boat_Civil_01_rescue_F":  {_return = 450};
	case "B_Boat_Transport_01_F":  {_return = 600};
	case "O_Boat_Transport_01_F":  {_return = 700};
	case "I_Boat_Transport_01_F":  {_return = 800};
	case "I_G_Boat_Transport_01_F":  {_return = 900};
	case "C_Boat_Transport_02_F":  {_return = 600};
	case "I_C_Boat_Transport_02_F":  {_return = 600};
	case "B_Boat_Armed_01_minigun_F":  {_return = 1000};
	case "O_Boat_Armed_01_hmg_F":  {_return = 1500};
	case "I_Boat_Armed_01_minigun_F":  {_return = 2000};
	
	//Shipwrecks
	case "Land_Wreck_Traw_F": {10000};
	case "Land_Wreck_Traw2_F": {10000};
	

	default {_return = -1};
};

if(_return > 0 && _nodonator == 0) then
{
	if((__GETC__(life_donator)) == 1) then // Donator 10 euro +150
	{
		_return = (_return + 150);
	};
	
	if((__GETC__(life_donator)) > 1) then // Donator 20 euro +300
	{
		_return = (_return + 300);
	};
};

_return;