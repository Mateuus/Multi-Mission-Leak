#include "..\script_macros.hpp"
/*
    File: fn_initCop.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Cop Initialization file.
*/
private "_end";
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
/*
//-- Public Police
if (!(str(player) in ["cop_1","cop_2","cop_3","cop_4","cop_5"])) then {
    if ((FETCH_CONST(life_coplevel) isEqualTo 0) && (FETCH_CONST(life_adminlevel) isEqualTo 0)) then {
        ["NotWhitelisted",false,true] call BIS_fnc_endMission;
        sleep 35;
    };
};
*/
//-- If you are Blacklisted
if (life_blacklisted) exitWith {
    ["Blacklisted",false,true] call BIS_fnc_endMission;
    sleep 30;
};

//-- If you are not whitelisted
if((FETCH_CONST(life_coplevel) isEqualTo 0) && (FETCH_CONST(life_adminlevel) >= 0)) then {
	["NotWhitelisted",false,true] call BIS_fnc_endMission;
	sleep 35;
};

//-- Set Paycheck for Police For Each rank
switch (FETCH_CONST(life_coplevel)) do
{
	case 1: {life_paycheck = life_paycheck + 2500;}; // Rank 1
	case 2: {life_paycheck = life_paycheck + 3000;}; // Rank 2
	case 3: {life_paycheck = life_paycheck + 3500;}; // Rank 3
	case 4: {life_paycheck = life_paycheck + 4000;}; // Rank 4
	case 5: {life_paycheck = life_paycheck + 4500;}; // Rank 5
	case 6: {life_paycheck = life_paycheck + 5000;}; // Rank 6
	case 7: {life_paycheck = life_paycheck + 5500;}; // Rank 7
	case 8: {life_paycheck = life_paycheck + 6000;}; // Rank 8
	case 9: {life_paycheck = life_paycheck + 6500;}; // Rank 9
	case 10: {life_paycheck = life_paycheck + 7000;}; // Rank 10
	case 11: {life_paycheck = life_paycheck + 7500;}; // Rank 11
	case 12: {life_paycheck = life_paycheck + 8000;}; // Rank 12
	case 13: {life_paycheck = life_paycheck + 8500;}; // Rank 13
};

/*
//-- Police Bank Account / Starting Money
if (life_westbankcount <= 1) then {
    BANK = 250000; //-- Police Starting Money
    life_westbankcount = life_westbankcount + 1;
};
*/
player setVariable["rank",(FETCH_CONST(life_coplevel)),true];
//[] call life_fnc_spawnMenu;
//Load the main menu
[] spawn life_fnc_initMainMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

[] spawn life_fnc_placeablesInit;