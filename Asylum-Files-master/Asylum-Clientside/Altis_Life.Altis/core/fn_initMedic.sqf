/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the medic..
*/
private["_end"];
life_maxTalents = 9;
life_maxWeight = 80;
player addRating 99999999;
if(life_blacklisted) exitWith
{
	["NotWhitelisted",false,false] call BIS_fnc_endMission;
};
waitUntil {!(isNull (findDisplay 46))};

[] spawn life_fnc_medicMarkers;
[] call life_fnc_medicLoadout;

[] spawn
{
	while {true} do
	{
		waitUntil {sleep 3; currentWeapon player != ""};
		removeAllWeapons player;
	};
};

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.