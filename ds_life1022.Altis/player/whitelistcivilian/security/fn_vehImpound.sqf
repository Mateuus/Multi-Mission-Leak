/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Request an impound for a vehicle
*/

private["_vehicle","_type","_time","_price","_vehicleData","_upp","_ui","_progress","_action","_cP","_myCar","_pos","_sleep","_waitTime","_owner","_convoy","_pass"];
_vehicle = DS_cursorTarget;

if(!alive _vehicle) exitwith {hint 'You can not request an impound on a destroyed vehicle';};
if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_fuel_F") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_box_F") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_covered_F") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_medevac_F") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_repair_F") || (typeOf _vehicle == "B_Slingload_01_Cargo_F") || (typeOf _vehicle == "B_Slingload_01_Medevac_F") || (typeOf _vehicle == "B_Slingload_01_Repair_F") || (typeOf _vehicle == "B_Slingload_01_Fuel_F"))) exitWith {};
if(player distance _vehicle > 10) exitWith {};
if(_vehicle getVariable ["impound",false])exitwith{hint "This vehicle already has an impound order active"};

_action = [
		"This is to be used when arresting a suspect so that their vehicle gets impounded. Do not use it just to inform police and mechanics of abandoned vehicles",
		"Request Impound",
		"Continue",
		"Exit"
	] call BIS_fnc_guiMessage;

if(!_action)exitwith{};

_vehicle setVariable ["impound",true,true];
hint "Impound request sent";
[] remoteExecCall ["DS_fnc_impoundRequested",independent];
[] remoteExecCall ["DS_fnc_impoundRequested",west];