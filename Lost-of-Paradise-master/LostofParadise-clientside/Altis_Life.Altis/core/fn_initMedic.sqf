#include <macro.h>
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Sebi, lostofparadise.de
	
	Description:
	Initializes the medic..
*/
private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

if((__GETC__(life_medicLevel)) < 1) exitWith {
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
};

[] call life_fnc_spawnMenu;
[] execVM "welcome.sqf";
[player, uniform player] call life_fnc_equipGear;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
[] spawn
{
	private["_texture"];
	while {true} do
	{
		waitUntil{uniform player == "U_C_WorkerCoveralls"};
		_texture =
		switch (__GETC__(life_mediclevel)) do
		{
			case 1: {"textures\medic_uniform.paa"};
			case 2: {"textures\medic_uniform.paa"};
			case 3: {"textures\medic_uniform.paa"};
			case 4: {"textures\medic_uniform.paa"};
			case 5: {"textures\medic_uniform.paa"};
		};
		if(backpack player != "") then {(unitBackpack player) setObjectTextureGlobal [0,""];};
		player setObjectTextureGlobal [0,_texture];
		waitUntil{uniform player != "U_C_WorkerCoveralls"};
	};
};
//sleep 10;
//[] execVM "welcomeNotification.sqf";
//sleep 2;
//[] call life_fnc_disableRope;