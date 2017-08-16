#include "..\macros.hpp"
/*
	File: fn_initOpfor.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the Opfor..
*/
private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};
	
if(DWEV_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

if((str(player) in ["opfor_1","opfor_2","opfor_3","opfor_4","opfor_5","opfor_6","opfor_7","opfor_8","opfor_9","opfor_10","opfor_11","opfor_12","opfor_13","opfor_14","opfor_15"])) then {
	if((__GETC__(DWEV_opforLevel) < 1)) then { //level 1 oder höher
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
};

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
[] spawn DWEV_fnc_medicPlaceablesInit;
[] execVM "core\session\fn_updateVars.sqf";