#include "..\..\..\script_macros.hpp"
/*
	File: fn_insureCar.sqf
	Author: Guit0x "Lintox"
	
	Description:
	Insure a vehicle from the garage.
*/
private["_vehicle","_vehicleLife","_vid","_pid","_unit","_assurPrice"];
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

_assurPrice = switch(playerSide) do {
	case civilian: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_vehicleLife,"assurPrice"),0)};
	case west: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_vehicleLife,"assurPrice"),1)};
	case independent: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_vehicleLife,"assurPrice"),2)};
	case east: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_vehicleLife,"assurPrice"),3)};
};

if(!(EQUAL(typeName _assurPrice,typeName 0)) OR _assurPrice < 1) then {_assurPrice = 1000};
if(BANK < _assurPrice) exitWith {hint format[ "Du hast keine $%1 auf deinem Bankkonto",[_assurPrice] call life_fnc_numberText];};

[_vid,_pid,_assurPrice,player,life_garage_type] remoteExecCall ["HC_fnc_insureCar",HC_Life];

SUB(BANK,_assurPrice);

life_action_delay = time;

closeDialog 0;