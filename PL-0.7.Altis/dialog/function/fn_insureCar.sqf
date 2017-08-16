#include "..\..\script_macros.hpp"
/*
	File: fn_insureCar.sqf
	Author: Guit0x "Lintox"

	Description:
	Insure a vehicle from the garage.
*/

private["_vehicle","_vid","_pid","_unit","_price","_log"];
disableSerialization;
if(EQUAL(lbCurSel 2802,-1)) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = steamid;
_unit = player;

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};

_Price = switch(playerSide) do {
        case civilian: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_vehicle,"insurance"),0)};
        case west: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_vehicle,"insurance"),1)};
        case independent: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_vehicle,"insurance"),2)};
        case east: {SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_vehicle,"insurance"),3)};
};

if(!(EQUAL(typeName _Price,typeName 0)) || _Price < 1) then {_Price = 1000};
if(BANK < _price) exitWith {hint format[(localize "STR_GNOTF_NotEnoughMoney"),[_price] call life_fnc_numberText];};

[[_vid,_pid,_unit,_price],"TON_fnc_insureCar",false,false] spawn life_fnc_MP;
hint localize "STR_Assur_OK";
SUB(BANK,_price);
closeDialog 0;