#include "..\script_macros.hpp"
/*
    File: fn_initCop.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Cop Initialization file.
*/
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};

if (life_blacklisted) exitWith {
    ["Blacklisted",false,true] call BIS_fnc_endMission;
    sleep 30;
};

if ((FETCH_CONST(life_copLevel)) < 1 && (FETCH_CONST(life_adminlevel) isEqualTo 0)) exitWith {
    ["Notwhitelisted",false,true] call BIS_fnc_endMission;
    sleep 35;
};


player setVariable ["rank",(FETCH_CONST(life_coplevel)),true];
sleep 2;
if(life_firstSpawn) then {
	[] spawn life_fnc_ladeSpieler;
} else {
	[] call life_fnc_spawnMenu;
};

waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

//Weil die Cops sonst nichts können :D
player setUnitRecoilCoefficient 0.8;
player setAnimSpeedCoef 1.1;