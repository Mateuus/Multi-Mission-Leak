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
	case (player distance (getMarkerPos "lead_1") < 30): {["copper"] call EMonkeys_fnc_gatherSystem;};
	case (player distance (getMarkerPos "iron_1") < 30): {["iron"] call EMonkeys_fnc_gatherSystem;};
	case (player distance (getMarkerPos "salt_1") < 30) : {["salt"] call EMonkeys_fnc_gatherSystem;};
	case (player distance (getMarkerPos "sand_1") < 30) : {["sand"] call EMonkeys_fnc_gatherSystem;};
	case (player distance (getMarkerPos "diamond_1") < 30): {["diamond"] call EMonkeys_fnc_gatherSystem;};
	case (player distance (getMarkerPos "rock_1") < 30): {["rock"] call EMonkeys_fnc_gatherSystem;};
	case (player distance (getMarkerPos "silver_1") < 30): {["silver"] call EMonkeys_fnc_gatherSystem;};
	case (player distance (getMarkerPos "mine_1") < 30): {[] call EMonkeys_fnc_gathermine;};
	default {_mine = "";};
};

if(_mine == "") exitWith {eM_action_gather = false;};
