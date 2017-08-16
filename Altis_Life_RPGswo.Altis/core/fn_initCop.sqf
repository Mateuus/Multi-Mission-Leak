#include "..\macros.hpp"
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/
private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
[] spawn DWEV_fnc_copMarkers;
_end = false;
	
if(DWEV_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

if(!(str(player) in ["cop_1","cop_2","cop_3","cop_4"])) then {
	if((__GETC__(DWEV_coplevel) == 0)) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
};
//Show Ranks
player setVariable["coplevel", __GETC__(DWEV_coplevel), true];
player setVariable["mediclevel", __GETC__(DWEV_medicLevel), true];

if (!isNil "DWEV_var_traveler") then // Kein spawnmenü für reisende
{
	DWEV_var_traveler = nil;
	[] call DWEV_fnc_travelSpawn;
}
else
{
	[] call DWEV_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.		
};
[] spawn DWEV_fnc_placeablesInit;
[] execVM "core\session\fn_updateVars.sqf";
