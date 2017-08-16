#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/
private["_payplus"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};

if((__GETC__(life_coplevel) == 0) && (__GETC__(life_adminlevel) == 0)) then {
	["NotWhitelisted",false,true] call BIS_fnc_endMission;
	sleep 35;
};
player setVariable["rank",(__GETC__(life_coplevel)),true];

_payplus = 0.25;
life_paycheck = (life_paycheck * (1 + (_payplus * ((__GETC__(life_coplevel)) - 1))));
/*switch(__GETC__(life_coplevel)) do {
	case 1: {life_paycheck = (life_paycheck * (1 + (_payplus * 0)))};
	case 2: {life_paycheck = (life_paycheck * (1 + (_payplus * 1)))};
	case 3: {life_paycheck = (life_paycheck * (1 + (_payplus * 2)))};
	case 4: {life_paycheck = (life_paycheck * (1 + (_payplus * 3)))};
	case 5: {life_paycheck = (life_paycheck * (1 + (_payplus * 4)))};
	case 6: {life_paycheck = (life_paycheck * (1 + (_payplus * 5)))};
	case 7: {life_paycheck = (life_paycheck * (1 + (_payplus * 6)))};
	case 8: {life_paycheck = (life_paycheck * (1 + (_payplus * 7)))};
	case 9: {life_paycheck = (life_paycheck * (1 + (_payplus * 8)))};
	case 10: {life_paycheck = (life_paycheck * (1 + (_payplus * 9)))};
};*/

[] call tanoarpg_fnc_setSkinns;
[] call tanoarpg_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.