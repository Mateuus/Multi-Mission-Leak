#include "..\..\script_macros.hpp"
/*
	File: fn_collectantiqui.sqf
	Author: Bryan "Tonic" Boardwine
	
	Created by: [Larry]
	Description:
	Main functionality for gathering.
*/
private["_gather","_itemWeight","_diff","_itemName","_val"];
if(life_action_collecting) exitWith {};
if(vehicle player != player) exitWith {};

life_action_collecting = true;
_gather = "antiqui"; _val = 2;
_diff = [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff isEqualTo 0) exitWith {hint localize "STR_NOTF_InvFull";life_action_collecting = false;};
sleep 1;

if(([true,_gather,_diff] call life_fnc_handleInv)) then {
	_itemName = M_CONFIG(getText,"VirtualItems",_gather,"displayName");
	titleText[format[localize "STR_NOTF_Gather_Success",(localize _itemName),_diff],"PLAIN"];
	
	[7] call life_fnc_updateEXP;
};
life_action_collecting = false;