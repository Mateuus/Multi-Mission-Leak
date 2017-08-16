#include "..\script_macros.hpp"
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Cop Initialization file.
*/
private "_end";
player addRating 9999999;
enableRadio false;
waitUntil {!(isNull (findDisplay 46))};
_end = false;

if(life_blacklisted) exitWith {
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

	if((FETCH_CONST(life_coplevel) == 0) && (FETCH_CONST(life_adminlevel) == 0)) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
	};



player setVariable["rank",(FETCH_CONST(life_coplevel)),true];
[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

switch (FETCH_CONST(life_coplevel)) do 
{
	case 1: { life_paycheck = life_paycheck + 350; }; //Level 1
    case 2: { life_paycheck = life_paycheck + 4000; }; //Level 2
    case 3: { life_paycheck = life_paycheck + 6000; }; //Level 3
    case 4: { life_paycheck = life_paycheck + 8000; }; //Level 4
    case 5: { life_paycheck = life_paycheck + 10000; }; //Level 5
    case 6: { life_paycheck = life_paycheck + 12000; }; //Level 6
    case 7: { life_paycheck = life_paycheck + 14000; }; //Level 7
    case 8: { life_paycheck = life_paycheck + 18000; }; //Level 8
    case 9: { life_paycheck = life_paycheck + 20000; }; //Level 
	default { life_paycheck = life_paycheck }; 
};

[] spawn life_fnc_setzenInit;