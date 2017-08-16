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

if((FETCH_CONST(life_medicLevel)) < 1 && (FETCH_CONST(life_adminlevel) == 0)) exitWith {
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
};

if(EQUAL(LIFE_SETTINGS(getNumber,"allow_medic_weapons"),0)) then
{
	[] spawn
	{
		while {true} do
		{
			waitUntil {sleep 3; currentWeapon player != ""};
			removeAllWeapons player;
		};
	};
};

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

switch (FETCH_CONST(life_mediclevel)) do 
{
	case 1: { life_paycheck = life_paycheck + 1000; }; //Level 1
	case 2: { life_paycheck = life_paycheck + 2000; }; //Level 2
	case 3: { life_paycheck = life_paycheck + 3000; }; //Level 3
    case 4: { life_paycheck = life_paycheck + 4000; }; //Level 4
    case 5: { life_paycheck = life_paycheck + 5000; }; //Level 5
	case 6: { life_paycheck = life_paycheck + 6000; }; //Level 5
	case 7: { life_paycheck = life_paycheck + 7000; }; //Level 5
	default { life_paycheck = life_paycheck }; 
};

[] spawn life_fnc_setzenInit;