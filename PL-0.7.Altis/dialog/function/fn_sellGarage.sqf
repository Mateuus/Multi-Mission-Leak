#include "..\..\script_macros.hpp"
/*
	File: fn_sellGarage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells a vehicle from the garage.
*/
private["_vehicle","_vehicleLife","_vid","_pid","_unit","_sellPrice","_log"];

if( life_actionRestrict ) exitWith { hint "Vous allez trop vite !"; };
life_actionRestrict = true;

disableSerialization;
if(EQUAL(lbCurSel 2802,-1)) exitWith {life_actionRestrict = false;hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vehicleLife = _vehicle;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = steamid;
_unit = player;

if(isNil "_vehicle") exitWith {life_actionRestrict = false;hint localize "STR_Garage_Selection_Error"};
if((time - life_action_delay) < 1.5) exitWith {life_actionRestrict = false;hint localize "STR_NOTF_ActionDelay";};
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

if(!(EQUAL(typeName _sellPrice,typeName 0)) || _sellPrice < 1) then {_sellPrice = 1000};
[_vid,_pid,_sellPrice,player,life_garage_type] remoteExecCall ["TON_fnc_vehicleDelete",RSERV];
hint format[localize "STR_Garage_SoldCar",[_sellPrice] call life_fnc_numberText];
ADD(BANK,_sellPrice);

_playerName = name player;
_vehicleName = getText(configFile >> "CfgVehicles" >> _vehicle >> "displayName");
_type = 1;
_className = lbData[2302,(lbCurSel 2302)];
[_pid,_playerName,_className,_vehicleName,_type,_sellPrice] remoteExecCall ["TON_fnc_vehicleLog", (call life_fnc_HCC)];

life_action_delay = time;
closeDialog 0;

[] spawn {sleep 1;life_actionRestrict = false};

