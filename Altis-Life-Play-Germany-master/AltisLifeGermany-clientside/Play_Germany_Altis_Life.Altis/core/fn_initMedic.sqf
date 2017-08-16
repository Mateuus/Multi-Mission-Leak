#include <macro.h>
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the medic..
*/
private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

if((FETCH_CONST(life_medicLevel)) < 1 && (FETCH_CONST(life_alacLevel)) < 1 && (FETCH_CONST(life_thwLevel)) < 1 && (FETCH_CONST(life_eventLevel)) < 1) exitWith {
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
};

if(PG_kickedOut) then {
	closeDialog 0;
	cutText ["","BLACK IN"];
	[]call PG_fnc_clothing;
	{_unit = _x; {_unit setObjectTexture [_forEachIndex,_x]} foreach getObjectTextures _unit;} forEach allPlayers;
	life_firstSpawn = false;
} else {
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
};

[] spawn PG_fnc_placeablesInit;