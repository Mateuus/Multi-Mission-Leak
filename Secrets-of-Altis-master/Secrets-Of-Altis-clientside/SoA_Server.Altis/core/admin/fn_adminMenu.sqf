#include <macro.h>
/*
	File: fn_adminMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the admin menu, sorry nothing special in here. Take a look for yourself.
*/
if(__GETC__(life_adminlevel) < 1) exitWith {
	closeDialog 0; 
	[] call life_fnc_crashStart;
	_message = format["%1 verwendet unbefugt das Admin-Menu!", name player];
	[["",_message,player,8],"SOA_fnc_handleMessages",false,false] spawn life_fnc_MP;
};

switch(call life_adminlevel) do {
	case 1: {
		ctrlEnable[2906,false]; //Teleport
		ctrlEnable[2907,false]; //P to M teleport
		ctrlEnable[2908,false]; //Gottmode
		ctrlEnable[2909,false]; //Freeze
		ctrlEnable[2910,false]; //Markers
		//ctrlEnable[2911,false]; //Spectate
		ctrlEnable[2912,false]; //Massteleport
		ctrlEnable[2913,false]; //Firework
		ctrlEnable[2914,false]; //Show
		ctrlEnable[2916,false]; //Unsichtbar
		ctrlEnable[2917,false]; //Crash
	};
	
	case 2: {
		ctrlEnable[2912,false]; //Massteleport
		//ctrlEnable[2913,false]; //Firework
		//ctrlEnable[2914,false]; //Show
		//ctrlEnable[2917,false]; //Crash
	};
};

private["_display","_list","_side"];
disableSerialization;
waitUntil {!isNull (findDisplay 2900)};
_display = findDisplay 2900;
_list = _display displayCtrl 2902;
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;};

lbClear _list;

{
	_side = switch(side _x) do {case west: {"Cop"}; case civilian: {"Civ"}; case independent: {"Medic"}; default {"Unknown"};};
	_list lbAdd format["%1 - %2",name _x,_side];
	_list lbSetdata [(lbSize _list)-1,str(_x)];
} foreach playableUnits;

lbSort [_list,"DESC"];

if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;};