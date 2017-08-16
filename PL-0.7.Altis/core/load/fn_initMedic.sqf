#include "..\script_macros.hpp"
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the medic..
*/
private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

if ((str(player) in ["medic_1"])) then {
	if((FETCH_CONST(life_mediclevel)) < 5 && (FETCH_CONST(life_adminlevel) == 0)) exitWith {
		["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
		sleep 35;
	};
} else {
if((FETCH_CONST(life_mediclevel)) < 1 && (FETCH_CONST(life_adminlevel) == 0)) exitWith {
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
};
};

0 enableChannel false;
1 enableChannel false;
2 enableChannel false;

player setVariable["rank",(FETCH_CONST(life_mediclevel)),true];
switch (FETCH_CONST(life_mediclevel)) do {
	case 1: {life_paycheck = 5000;}; // Rank 1
	case 2: {life_paycheck = 10000;}; // Rank 2
	case 3: {life_paycheck = 15000;}; // Rank 3
	case 4: {life_paycheck = 20000;}; // Rank 4
	case 5: {life_paycheck = 25000;}; // Rank 5
};

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
[] spawn life_fnc_placeablesInit;
[] call life_fnc_skin;