#include "..\script_macros.hpp"
/*
	File: fn_hudSetup.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Setups the hud for the player?
*/
disableSerialization;

if(ES_firstDia) exitWith {};

2 cutRsc["playerHUD","PLAIN",0.5,false];
3 cutRsc["Status_Bar","PLAIN",0.5,false];

[] call ES_fnc_hudUpdate;
[] spawn ES_fnc_Status_Bar;

[] spawn
{
	private["_dam"];
	while {true} do
	{
		_dam = damage player;
		waitUntil {(damage player) != _dam};
		[] call ES_fnc_hudUpdate;
	};
};