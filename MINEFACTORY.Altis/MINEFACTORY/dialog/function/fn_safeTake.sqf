#include "..\..\..\script_macros.hpp"
/*
	File: fn_safeTake.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gateway to fn_vehTakeItem.sqf but for safe(s).
*/
private["_ctrl","_num","_safeInfo"];
disableSerialization;

if((lbCurSel 3502) == -1) exitWith {hint  "Du musst einen Gegenstand auswählen!";};
_ctrl = CONTROL_DATA(3502);
_num = ctrlText 3505;
_safeInfo = life_safeObj GVAR ["safe",0];

//Error checks
if(!([_num] call TON_fnc_isnumber)) exitWith {hint  "Ungültiges Zahlenformat";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint  "Du kannst nichts unter 1 eingeben!";};
if(!(EQUAL(_ctrl,"goldBar"))) exitWith {hint  "Du kannst nur Goldbarren in den Tresor legen."};
if(_num > _safeInfo) exitWith {hint format[ "Es sind keine %1 Goldbarren im Tresor!",_num];};

//Secondary checks
_num = [_ctrl,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(EQUAL(_num,0)) exitWith {hint  "Dein Inventar ist voll."};


//Take it
if(!([true,_ctrl,_num] call life_fnc_handleInv)) exitWith {hint  "Es konnte nichts zu deinem Inventar hinzugefügt werden";};
life_safeObj SVAR ["safe",_safeInfo - _num,TRUE];
[life_safeObj] call life_fnc_safeInventory;