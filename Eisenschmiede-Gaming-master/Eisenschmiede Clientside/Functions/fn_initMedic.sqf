#include "script_macros.hpp"
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the medic..
*/
private["_end"];
player addRating 99999999; 
waitUntil {!(isNull (findDisplay 46))};

if(str(player) in ["medic_1"]) then {
	if((FETCH_CONST(ES_medicLevel) >= 6) && (FETCH_CONST(ES_adminlevel) == 0)) then {
		player enableSimulation false;
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
};

if((FETCH_CONST(ES_medicLevel)) < 1 && (FETCH_CONST(ES_adminlevel) == 0)) exitWith {
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
};

if(EQUAL(ES_SETTINGS(getNumber,"allow_medic_weapons"),0)) then
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
[] call ES_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

[] call ES_fnc_FeuerwehrSeil;
[] spawn ES_fnc_IgiLoadInit;

save_veh_gear = true;