#include "..\..\..\script_macros.hpp"
/*
	File: fn_sellGarage.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sells a vehicle from the garage.
*/
private["_vehicle","_vehicleLife","_vid","_pid","_unit","_sellPrice"];
disableSerialization;
if(EQUAL(lbCurSel 2802,-1)) exitWith {hint  "Du hast nichts ausgewählt."};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vehicleLife = _vehicle;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = steamid;
_unit = player;

if(isNil "_vehicle") exitWith {hint  "Die Auswahl hat einen Fehler..."};
if((time - life_action_delay) < 1.5) exitWith {hint  "Du führst bereits eine Aktion aus. Bitte warte, bis diese beendet ist.Delay";};
if(!isClass (missionConfigFile >> CONFIG_LIFE_VEHICLES >> _vehicleLife)) then {
	_vehicleLife = "Default"; //Use Default class if it doesn't exist
	diag_log format["%1: LifeCfgVehicles class doesn't exist",_vehicle];
};

_sellPrice = switch(playerSide) do {
	case civilian: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_vehicleLife,"garageSell"),0)};
	case west: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_vehicleLife,"garageSell"),1)};
	case independent: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_vehicleLife,"garageSell"),2)};
	case east: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_vehicleLife,"garageSell"),3)};
};

if(!(EQUAL(typeName _sellPrice,typeName 0)) OR _sellPrice < 1) then {_sellPrice = 1000};

if(life_HC_isActive) then {
	[_vid,_pid,_sellPrice,player,life_garage_type] remoteExecCall ["HC_fnc_vehicleDelete",HC_Life];
} else {
	[_vid,_pid,_sellPrice,player,life_garage_type] remoteExecCall ["TON_fnc_vehicleDelete",RSERV];
};

hint format[ "Du verkaufst dein Fahrzeug für $%1",[_sellPrice] call life_fnc_numberText];
ADD(BANK,_sellPrice);
life_action_delay = time;
closeDialog 0;
