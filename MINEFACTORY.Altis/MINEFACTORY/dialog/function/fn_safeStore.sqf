#include "..\..\..\script_macros.hpp"
/*
	File: fn_safeStore.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gateway copy of fn_vehStoreItem but designed for the safe.
*/
private["_ctrl","_num"];
disableSerialization;
_ctrl = CONTROL_DATA(3503);
_num = ctrlText 3506;

//Error checks
if(!([_num] call TON_fnc_isnumber)) exitWith {hint  "Ungültiges Zahlenformat";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint  "Du kannst nichts unter 1 eingeben!";};
if(!(EQUAL(_ctrl,"goldbar"))) exitWith {hint  "Du kannst nur Goldbarren in den Tresor legen."};
if(_num > life_inv_goldbar) exitWith {hint format[ "Du hast keine %1 Goldbarren",_num];};

//Store it.
if(!([false,_ctrl,_num] call life_fnc_handleInv)) exitWith {hint  "Gegenstände konnten nicht von deinem Inventar in den Tresor gepackt werden.";};
_safeInfo = life_safeObj GVAR["safe",0];
life_safeObj GVAR ["safe",_safeInfo + _num,true];

[life_safeObj] call life_fnc_safeInventory;