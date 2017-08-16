#include "script_macros.hpp"
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/
private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

if(ES_blacklisted) exitWith {
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

if(str(player) in ["cop_32","cop_33","cop_34","cop_35","cop_36"]) then {
	if((FETCH_CONST(ES_donator) < 1) && (FETCH_CONST(ES_adminlevel) == 0)) then {
		player enableSimulation false;
		["NotPremium",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
};

if((FETCH_CONST(ES_coplevel) == 0) && (FETCH_CONST(ES_adminlevel) == 0)) then {
	["NotWhitelisted",false,true] call BIS_fnc_endMission;
	sleep 35;
};

player setVariable["rank",(FETCH_CONST(ES_coplevel)),true];
player setvariable ["pager","nichts",true];

[] call ES_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

if (isClass(configFile >> "CfgPatches" >> "EisenschmiedeHighTextures")) then { [] spawn ES_fnc_updateClothing; }else{ [] spawn ES_fnc_updateClothing; };
[] spawn ES_fnc_fastrope;

save_veh_gear = true;