#include <macro.h>
/*
	File: fn_adminMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the admin menu, sorry nothing special in here. Take a look for yourself.
*/
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;};
private["_display","_list","_side"];
disableSerialization;
waitUntil {!isNull (findDisplay 2900)};
_display = findDisplay 2900;
_list = _display displayCtrl 2902;
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;};

switch(__GETC__(life_adminlevel)) do
{
	case 1: {ctrlShow [2904,false];ctrlShow [2905,false];ctrlShow [2906,false];ctrlShow [2907,false];ctrlShow [2908,false];ctrlShow [2909,false];ctrlShow [2910,false];ctrlShow [2911,false];ctrlShow [2912,false];ctrlShow [2913,false];ctrlShow [2914,false];ctrlShow [2915,false];ctrlShow [2916,false];ctrlShow [2917,false];ctrlShow [2918,false];ctrlShow [2919,false];ctrlShow [2920,false];ctrlShow [2921,false];};
	case 2: {ctrlShow [2906,false];ctrlShow [2918,false];ctrlShow [2907,false];ctrlShow [2905,false];ctrlShow [2916,false];ctrlShow [2914,false];ctrlShow [2915,false];ctrlShow [2920,false];ctrlShow [2919,false];ctrlShow [2917,false];ctrlShow [2909,false];ctrlShow [2908,false];ctrlShow [2921,false];ctrlShow [2910,false];ctrlShow [2911,false];};
	case 3: {ctrlShow [2916,false];ctrlShow [2914,false];ctrlShow [2915,false];ctrlShow [2920,false];ctrlShow [2919,false];ctrlShow [2917,false];ctrlShow [2909,false];ctrlShow [2908,false];ctrlShow [2921,false];ctrlShow [2910,false];ctrlShow [2911,false];};
	case 4: {ctrlShow [2921,false];ctrlShow [2910,false];ctrlShow [2911,false];};
};

//Purge List
lbClear _list;

{
	_side = switch(side _x) do {case west: {"Cop"}; case civilian : {"Civ"}; case independent : {"Med"}; default {"Unknown"};};
	_list lbAdd format["%1 - %2", _x getVariable["realname",name _x],_side];
	_list lbSetdata [(lbSize _list)-1,str(_x)];
} foreach playableUnits;
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0;};