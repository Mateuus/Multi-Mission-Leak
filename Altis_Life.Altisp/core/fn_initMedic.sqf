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

if((FETCH_CONST(life_medicLevel)) == 0) exitWith {
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
};

if(EQUAL(LIFE_SETTINGS(getNumber,"restrict_medic_weapons"),1)) then {
	[] spawn {
		for "_i" from 0 to 1 step 0 do {
			waitUntil {sleep 3; currentWeapon player != ""};
			removeAllWeapons player;
		};
	};
};

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
player setVariable["rank",(FETCH_CONST(life_medicLevel)),true];
[] call life_fnc_placeablesInit;
[] call life_fnc_playerSkins;
[] call life_fnc_specCheck;
setTerrainGrid 50; 
