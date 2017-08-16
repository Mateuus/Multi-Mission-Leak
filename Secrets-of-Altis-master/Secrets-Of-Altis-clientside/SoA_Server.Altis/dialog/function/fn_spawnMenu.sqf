/*
	File: fn_spawnMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the spawn point selection menu.
*/
private["_spCfg","_sp","_ctrl","_handle"];
disableSerialization;

if(life_is_arrested) exitWith {
	_handle = [] spawn life_fnc_respawned;
	waitUntil{scriptDone _handle};
};

if(!(createDialog "altistravel")) exitWith {[] spawn life_fnc_spawnMenu;};

if (life_level >= 1) then {ctrlEnable[7501,true]} else {ctrlEnable[7501,false]; ((findDisplay 7500) displayCtrl 7501) ctrlSetTooltip "Ab Level 1 verfügbar!"};
if (life_level >= 2) then {ctrlEnable[7503,true]} else {ctrlEnable[7503,false]; ((findDisplay 7500) displayCtrl 7503) ctrlSetTooltip "Ab Level 2 verfügbar!"};
if (life_level >= 4) then {ctrlEnable[7502,true]} else {ctrlEnable[7502,false]; ((findDisplay 7500) displayCtrl 7502) ctrlSetTooltip "Ab Level 4 verfügbar!"};

switch(playerside) do {
	case independent: {ctrlEnable[7501,false]; ((findDisplay 7500) displayCtrl 7501) ctrlSetTooltip "Nicht verfügbar!"; ctrlEnable[7506,false];((findDisplay 7500) displayCtrl 7506) ctrlSetTooltip "Nicht verfügbar!";};
	case west: {ctrlEnable[7506,false];((findDisplay 7500) displayCtrl 7506) ctrlSetTooltip "Nicht verfügbar!";};
};