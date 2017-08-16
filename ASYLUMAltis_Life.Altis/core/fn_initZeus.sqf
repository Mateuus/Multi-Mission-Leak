/*
	File: fn_initZeus.sqf
	Author: John "Paratus" VanderZwet

	Description:
	Zeus Initialization file.
*/
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};

if(life_adminlevel < 2) exitWith
{
	["Blacklisted",false,false] call BIS_fnc_endMission;
};