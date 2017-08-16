#include "..\..\script_macros.hpp"
/*
	File: fn_collectCrab.sqf
	Author: Bryan "Tonic" Boardwine
	
	Created by: [Larry]
	Description:
	Main functionality for gathering.
*/
private["_gather","_itemWeight","_diff","_itemName","_val"];
if(!license_civ_crab) exitWith {hint "Du darfst hier keine Krabben sammeln! Kauf dir die Lizens beim Lizensen Shop"};
if(life_action_collecting) exitWith {};
if(vehicle player != player) exitWith {};

life_action_collecting = true;
_gather = "crab"; _val = 5;
_diff = [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff isEqualTo 0) exitWith {hint localize "STR_NOTF_InvFull";life_action_collecting = false;};
sleep 1;

if(([true,_gather,_diff] call life_fnc_handleInv)) then {
	_itemName = M_CONFIG(getText,"VirtualItems",_gather,"displayName");
	titleText[format[localize "STR_NOTF_Gather_Success",(localize _itemName),_diff],"PLAIN"];
	
	[5] call life_fnc_updateEXP;
};
life_action_collecting = false;