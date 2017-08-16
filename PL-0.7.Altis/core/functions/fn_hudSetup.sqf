#include "..\..\script_macros.hpp"
/*
	File: fn_hudSetup.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Setups the hud for the player?
*/
disableSerialization;

2 cutRsc ["playerHUD","PLAIN"];
[] call life_fnc_hudUpdate;

[] spawn
{
	private["_dam"];	
	while {true} do
	{	
		_dam = damage player;
		waitUntil {(damage player) != _dam};
		[] call life_fnc_hudUpdate;
	};
};

[] spawn
{
	private["_counter"];
	sleep 1;
	_counter = 180;
	_timeSinceLastUpdate = 0;	
	while {true} do
	{
		sleep 1;
		_counter = _counter - 1;
		[] call life_fnc_hudUpdate;
	};
}; 