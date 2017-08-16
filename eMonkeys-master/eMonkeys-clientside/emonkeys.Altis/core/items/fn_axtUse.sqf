/*
    File: fn_axtUse.sqf
    Author: Bryan "Tonic" Boardwine
	Edit: E-Monkeys.com | Avanix-Gaming.de    
    Description:
    Main functionality for Axt in mining.
*/
closeDialog 0;
private["_mine"];
if(isNil "eM_action_gather") then {eM_action_gather = true;};

switch (true) do
{
	case (player distance (getMarkerPos "holz_1") < 30): {["wood"] call EMonkeys_fnc_gatherSystem;};
	default {_mine = "";};
};

if(_mine == "") exitWith {eM_action_gather = false;};