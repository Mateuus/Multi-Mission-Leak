#include "..\script_macros.hpp"
/*
	File: fn_initZeus.sqf
	
	Description:
	Zeus Initialization file.
*/

player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
[] spawn ES_fnc_copMarkers;

if(ES_adminlevel < 6) exitWith
{
    endMission "Loser";
};