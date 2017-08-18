#include <macro.h>
/*
	File: fn_adminImpound.sqf
	Author: Kevin Webb
	
	Description:
	Instantly garages the vehicle.
*/
if(__GETC__(life_adminlevel) < 4) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};
private["_vehicle","_type","_time","_price","_vehicleData","_upp","_ui","_progress","_pgText","_cP","_veh"];
_vehicle = cursorTarget;
_veh = typeOf _vehicle;
if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship"))) exitWith {};

_vehicleData = _vehicle getVariable["vehicle_info_owners",[]];
_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
if((count crew _vehicle) == 0) then
{
	_type = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	[[_vehicle,true,player],"TON_fnc_vehicleStore",false,false] spawn life_fnc_MP;
	[[0,format[localize "STR_NOTF_HasImpounded",profileName,(_vehicleData select 0) select 1,_vehicleName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
};