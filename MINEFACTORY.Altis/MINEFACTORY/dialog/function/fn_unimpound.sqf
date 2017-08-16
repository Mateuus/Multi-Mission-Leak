#include "..\..\..\script_macros.hpp"
/*
	File: fn_unimpound.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Yeah... Gets the vehicle from the garage.
*/
private["_vehicle","_vehicleLife","_vid","_pid","_unit","_price"];
disableSerialization;
if(EQUAL(lbCurSel 2802,-1)) exitWith {hint  "Du hast nichts ausgewählt."};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vehicleLife = _vehicle;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = steamid;
_unit = player;
_spawntext =  "Dein Fahrzeug ist bereit!";
if(isNil "_vehicle") exitWith {hint  "Die Auswahl hat einen Fehler..."};
if(!isClass (missionConfigFile >> CONFIG_LIFE_VEHICLES >> _vehicleLife)) then {
	_vehicleLife = "Default"; //Use Default class if it doesn't exist
	diag_log format["%1: LifeCfgVehicles class doesn't exist",_vehicle];
};

_price = switch(playerSide) do {
	case civilian: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_vehicleLife,"storageFee"),0)};
	case west: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_vehicleLife,"storageFee"),1)};
	case independent: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_vehicleLife,"storageFee"),2)};
	case east: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_vehicleLife,"storageFee"),3)};
};

if(!(EQUAL(typeName _price,typeName 0)) OR _price < 1) then {_price = 1000};
if(BANK < _price) exitWith {hint format[( "Du hast keine $%1 auf deinem Bankkonto"),[_price] call life_fnc_numberText];};

if(EQUAL(typeName life_garage_sp,typeName [])) then {
	if(life_HC_isActive) then {
		[_vid,_pid,SEL(life_garage_sp,0),_unit,_price,SEL(life_garage_sp,1),_spawntext] remoteExec ["HC_fnc_spawnVehicle",HC_Life];
	} else {
		[_vid,_pid,SEL(life_garage_sp,0),_unit,_price,SEL(life_garage_sp,1),_spawntext] remoteExec ["TON_fnc_spawnVehicle",RSERV];
	};
} else {
	if(life_garage_sp in ["medic_spawn_1","medic_spawn_2","medic_spawn_3"]) then {
		if(life_HC_isActive) then {
			[_vid,_pid,life_garage_sp,_unit,_price,0,_spawntext] remoteExec ["HC_fnc_spawnVehicle",HC_Life];
		} else {
			[_vid,_pid,life_garage_sp,_unit,_price,_spawntext] remoteExec ["TON_fnc_spawnVehicle",RSERV];
		};
	} else {
		if(life_HC_isActive) then {
			[_vid,_pid,(getMarkerPos life_garage_sp),_unit,_price,markerDir life_garage_sp,_spawntext] remoteExec ["HC_fnc_spawnVehicle",HC_Life];
		} else {
			[_vid,_pid,(getMarkerPos life_garage_sp),_unit,_price,markerDir life_garage_sp,_spawntext] remoteExec ["TON_fnc_spawnVehicle",RSERV];
		};
	};
};

hint  "Fahrzeug wird bereitgestellt, bitte warten...";
SUB(BANK,_price);
closeDialog 0;
