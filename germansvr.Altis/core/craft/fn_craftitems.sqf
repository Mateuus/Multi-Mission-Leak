#include "..\..\script_macros.hpp"
/*
	File: fn_craftitems.sqf
	Description: Crafting System
	Author: Maxos
*/
_diff = 0;
_item = "";
_name = "";
_blue = round(random 100);

switch(_blue) do {
	case 10:{_item = "bp_sln9mm";};
	case 20:{_item = "bp_sln556";};
	case 30:{_item = "bp_sln65";};
	case 40:{_item = "bp_bipod";};
	case 50:{_item = "bp_sniperoptic";};
	case 60:{_item = "bp_mk18";};
	case 70:{_item = "bp_mxc";};
	case 80:{_item = "bp_mx";};
	case 90:{_item = "bp_mxm";};
};

//kein Item
if (_item == "") exitWith {hint "Leider habe ich heute nichts für dich"};

//abfrage ob platz
_diff = [_item,1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(EQUAL(_diff,0)) exitWith {hint localize "STR_NOTF_InvFull"};

//name
_name = M_CONFIG(getText,"VirtualItems",_item,"displayName");

//ob hinzugefügt werden konnte und hint für item
if(([true,_item,1] call life_fnc_handleInv)) then
{
	hint format["Du hast ein %1 bekommen",localize _name];
};