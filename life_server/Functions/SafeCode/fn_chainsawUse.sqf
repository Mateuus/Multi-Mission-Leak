/*
	File: fn_chainsawUse.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for chainsaw.
*/
closeDialog 0;
private["_saw","_itemWeight","_diff","_itemName","_val"];
switch (true) do
{
	case (player distance (getMarkerPos "forrest_1") < 120): {_saw = "wood"; _val = 2;};
	case (player distance (getMarkerPos "forrest_2") < 120): {_saw = "wood"; _val = 2;};
	case (player distance (getMarkerPos "forrest_3") < 120): {_saw = "wood"; _val = 2;};
	case (player distance (getMarkerPos "forrest_4") < 120): {_saw = "wood"; _val = 2;};
	default {_saw = "";};
};
//Mine check
if(_saw == "") exitWith {hint localize "STR_ISTR_Saw_NotNear"};
if(vehicle player != player) exitWith {hint localize "STR_ISTR_Pick_sawVeh";};

_diff = [_saw,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};
life_action_inUse = true;
for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	player say3D "ChainSawUseSound";
	sleep 5;
};

if(([true,_saw,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_saw,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format[localize "STR_ISTR_Saw_Success",_itemName,_diff],"PLAIN"];
};

life_action_inUse = false;