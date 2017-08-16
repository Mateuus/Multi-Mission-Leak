#include <macro.h>
/*
	File: fn_initASF.sqf
	Parts from a file written by Bryan "Tonic" Boardwine
	
	Description:
	ASF Initialization file.
*/
private["_end"];
_exit = false;
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

if((FETCH_CONST(life_ASFlevel) < 1) && (FETCH_CONST(life_adminlevel) == 0)) exitWith {
    ["NotWhitelisted",false,true] call BIS_fnc_endMission;
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