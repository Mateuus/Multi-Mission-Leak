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

if ((FETCH_CONST(life_medicLevel)) < 1 && (FETCH_CONST(life_adminlevel) isEqualTo 0)) exitWith {
    ["Notwhitelisted",false,true] call BIS_fnc_endMission;
    sleep 35;
};

if (LIFE_SETTINGS(getNumber,"restrict_medic_weapons") isEqualTo 1) then {
    [] spawn {
        for "_i" from 0 to 1 step 0 do {
            waitUntil {sleep 3; currentWeapon player != ""};
            removeAllWeapons player;
        };
    };
};

//Set Paycheck for Medics for each rank
switch (FETCH_CONST(life_mediclevel)) do
{
	case 1: {life_paycheck = life_paycheck + 500;}; //Rank 1
	case 2: {life_paycheck = life_paycheck + 1000;}; //Rank 2
	case 3: {life_paycheck = life_paycheck + 1500;}; //Rank 3
	case 4: {life_paycheck = life_paycheck + 2000;}; //Rank 4
};

player setVariable["rank",(FETCH_CONST(life_mediclevel)),true];
//[] call life_fnc_spawnMenu;

//Load the main menu
[] spawn life_fnc_initMainMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

[] spawn life_fnc_placeablesInit;
