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


//////////Punishment checks //////////
if (life_blacklisted) exitWith {
    ["Blacklisted",false,true] call BIS_fnc_endMission;
	uiSleep 5;
};

if(life_permban) exitWith
{
	["PERMBAN",false,true] call BIS_fnc_endMission;
	uiSleep 5;
};

if(life_dayban) exitWith
{
	["DAYBAN",false,true] call BIS_fnc_endMission;
	uiSleep 5;
};

if(life_tempban) exitWith
{
	["TEMPBAN",false,true] call BIS_fnc_endMission;
		uiSleep 5;
};

//////////Slot checks //////////

//SWAT Commander Slot
if((str(player) in ["pol_21"])) then {
	if(FETCH_CONST(life_swatlevel) < 3) then {
		["NotSwatLeader",false,true] call BIS_fnc_endMission;
		uiSleep 5;
	};
};

//Reserved slots
if((str(player) in ["pol_1","pol_2","pol_3","pol_4"])) then {
	if(FETCH_CONST(life_donorlevel) < 1) then {
		["NotDonator",false,true] call BIS_fnc_endMission;
		uiSleep 5;
	};
};

//Whitelisted slots
if((str(player) in ["pol_10","pol_11","pol_12","pol_13","pol_14","pol_15","pol_16","pol_17"])) then {
	if(FETCH_CONST(life_coplevel) < 1) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		uiSleep 5;
	};
};

//Member slots
if((str(player) in ["pol_18","pol_19","pol_20"])) then {
	if(FETCH_CONST(life_adminlevel) < 3) then {
		["NotOutlawedVeterans",false,true] call BIS_fnc_endMission;
		uiSleep 5;
	};
};

player setVariable["donrank",(FETCH_CONST(life_donorlevel)),true];
player setVariable["rank",(FETCH_CONST(life_coplevel)),true];
player setVariable["swatrank",(FETCH_CONST(life_swatlevel)),true];
player setVariable["dearank",(FETCH_CONST(life_armylevel)),true];
player setVariable["adminrank",(FETCH_CONST(life_adminlevel)),true];
player setVariable["combatlog",0,true];

[] call life_fnc_spawnMenu;
[] spawn life_fnc_placeablesInit;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
