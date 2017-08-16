/*
	File: fn_axeUse.sqf
	Author: Bryan "Tonic" Boardwine
	Editor: Wilke "Pain"
	
	Description:
	Main functionality for axe in woodchopping.
*/
closeDialog 0;
private["_mine","_itemWeight","_diff","_itemName","_val"];
switch (true) do
{
	case (player distance (getMarkerPos "woods_1") < 30): {_mine = "woodu"; _val = 5;};

	default {_mine = "";};
};
//Mine check
if(_mine == "") exitWith {hint localize "STR_ISTR_Pick_NotNear"};
//Player check
if(vehicle player != player) exitWith {hint localize "STR_ISTR_Pick_MineVeh";};
//Tree check
if(player distance cursorObject > 5) exitWith {hint  "Es ist kein Baum in der Nähe"};
_tree = nearestTerrainObjects [cursorobject, ["Tree"], 1];
if (count _tree == 0) exitWith {hint  "Das ist kein Baum"};

_diff = [_mine,_val,ES_carryWeight,ES_maxWeight] call ES_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};
ES_action_inUse = true;
for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2.5;
};

if(([true,_mine,_diff] call ES_fnc_handleInv)) then
{
	_itemName = [([_mine,0] call ES_fnc_varHandle)] call ES_fnc_varToStr;
	titleText[format[localize "STR_ISTR_Pick_Success",_itemName,_diff],"PLAIN"];
	_tree select 0 setdamage 1;
};

ES_action_inUse = false;