#include "..\macros.hpp"
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the medic..
*/
private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};
	
if(DWEV_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

if((str(player) in ["medic_1","medic_2","medic_3","medic_4","medic_5","medic_6","medic_7","medic_8","medic_9","medic_10","medic_11","medic_12","medic_13","medic_14","medic_15"])) then {
	if((__GETC__(DWEV_medicLevel) < 1)) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
};

if((str(player) in ["hc_1"])) then {
	if((__GETC__(DWEV_adminevel) < 4)) then { //level 4 oder höher
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
[] spawn DWEV_fnc_medicPlaceablesInit;
[] execVM "core\session\fn_updateVars.sqf";
