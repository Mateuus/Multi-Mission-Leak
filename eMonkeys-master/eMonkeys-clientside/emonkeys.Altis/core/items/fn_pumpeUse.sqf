/*
	File: fn_pickaxeUse.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Niklas "Rappelkiste" Quenter
	
	Description:
	Main functionality for pickaxe in mining.
*/
closeDialog 0;
private["_mine"];
if(isNil "eM_action_gather") then {eM_action_gather = true;};

switch (true) do
{
	case (player distance (getMarkerPos "waterplace_1") < 30): {["water"] call EMonkeys_fnc_gatherSystem;};
	case (player distance (getMarkerPos "oil_1") < 70) : {["oil"] call EMonkeys_fnc_gatherSystem;};
	case (player distance (getMarkerPos "oil_2") < 70) : {["oil"] call EMonkeys_fnc_gatherSystem;};
	default {_mine = "";};
};

if(_mine == "") exitWith {eM_action_gather = false;};
