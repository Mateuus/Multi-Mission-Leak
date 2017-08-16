#include <macro.h>
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the medic..
*/
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

if((__GETC__(life_medicLevel)) < 1) exitWith {
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
};
player setVariable["medicrank",(__GETC__(life_medicLevel)),true];

[] call tanoarpg_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

[] call tanoarpg_fnc_setSkinns;
[] call tanoarpg_fnc_resetMedic;
[] execVM "IgiLoad\IgiLoadInit.sqf";
license_med_adac = true;
license_med_air = true;
