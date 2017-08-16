#include <macro.h>

/*
	File: fn_adminMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Opens the admin menu, sorry nothing special in here. Take a look for yourself.
	Terror = 2402
	Spectate = 2403
	Teleport = 2404
	Teleport To Player = 2405
	Freeze Player = 2406
	God Mode = 2407
	Map Markers = 2408
	Server Cleanup = 2409
	Not Used = 2410
*/
private["_display","_list","_side"];
disableSerialization;
waitUntil {!isNull (findDisplay 2900)};
_display = findDisplay 2900;
_list = _display displayCtrl 2902;
if(FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0;};

switch(FETCH_CONST(life_adminlevel)) do
{
	case 1: {ctrlEnable [2402,false];ctrlEnable [2403,false];ctrlEnable [2404,false];ctrlEnable [2405,false];ctrlEnable [2406,false];ctrlShow [2407,false];ctrlEnable [2408,false];ctrlEnable [2409,false];ctrlEnable [2410,false];};
	case 2: {ctrlEnable [2402,false];ctrlEnable [2404,false];ctrlEnable [2405,false];ctrlEnable [2407,false];ctrlEnable [2408,false];ctrlEnable [2409,false];ctrlEnable [2410,false];};
	case 3: {ctrlEnable [2402,false];ctrlEnable [2407,false];ctrlEnable [2409,false];ctrlEnable [2410,false];};
	case 4: {ctrlEnable [2402,false];ctrlEnable [2409,false];ctrlEnable [2410,false];};
};

lbClear _list;

{
	_side = switch(side _x) do {case west: {"Cop"}; case civilian : {"Civ"}; case independent : {"Med"}; default {"Unknown"};};
	_list lbAdd format["%1 - %2", _x getVariable["realname",name _x],_side];
	_list lbSetdata [(lbSize _list)-1,str(_x)];
} foreach playableUnits;
