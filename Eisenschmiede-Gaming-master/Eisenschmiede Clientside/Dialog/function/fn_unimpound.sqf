#include "..\script_macros.hpp"
/*
	File: fn_unimpound.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Yeah... Gets the vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;
if(EQUAL(lbCurSel 2802,-1)) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};

_price = switch(playerSide) do {
	case civilian: {SEL(M_CONFIG(getArray,"CfgVehicles",_vehicle,"storageFee"),0)};
	case west: {SEL(M_CONFIG(getArray,"CfgVehicles",_vehicle,"storageFee"),1)};
	case independent: {SEL(M_CONFIG(getArray,"CfgVehicles",_vehicle,"storageFee"),2)};
	case east: {SEL(M_CONFIG(getArray,"CfgVehicles",_vehicle,"storageFee"),4)};
};

if(!(EQUAL(typeName _price,typeName 0)) OR _price < 1) then {_price = 1000};
if(ES_atmbank < _price) exitWith {hint format[(localize "STR_Garage_CashError"),[_price] call ES_fnc_numberText];};

if(EQUAL(typeName ES_garage_sp,typeName [])) then {
	[_vid,_pid,SEL(ES_garage_sp,0),_unit,_price,SEL(ES_garage_sp,1)] remoteExec ["ES_fnc_spawnVehicle",2];
} else {
	if(ES_garage_sp in ["medic_spawn_1","medic_spawn_2","medic_spawn_3"]) then {
		[_vid,_pid,ES_garage_sp,_unit,_price] remoteExec ["ES_fnc_spawnVehicle",2];
	} else {
		[_vid,_pid,(getMarkerPos ES_garage_sp),_unit,_price,markerDir ES_garage_sp] remoteExec ["ES_fnc_spawnVehicle",2];
	};
};

hint localize "STR_Garage_SpawningVeh";
ES_atmbank = ES_atmbank - _price;