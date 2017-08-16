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
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull";life_action_collecting = false;};
sleep 0.1;

if(([true,_gather,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format[localize "STR_NOTF_Gather_Success",_itemName,_diff],"PLAIN"];
};
life_action_collecting = false;