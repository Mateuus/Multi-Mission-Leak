#include "..\..\macros.hpp"
/*
	File: fn_adminMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the admin menu, sorry nothing special in here. Take a look for yourself.
*/
if(__GETC__(DWEV_adminlevel) < 2) exitWith {closeDialog 0;}; //Ab S
private["_display","_list","_side"];
disableSerialization;
waitUntil {!isNull (findDisplay 2900)};
_display = findDisplay 2900;
_list = _display displayCtrl 2902;
if(__GETC__(DWEV_adminlevel) < 2) exitWith {closeDialog 0;};//Ab S
//Purge List
lbClear _list;

{
	_side = _x getVariable["playertype",""];
	_list lbAdd format["%1 (%2)", getPlayerName(_x),_side];
	_list lbSetdata [(lbSize _list)-1,str(_x)];
} foreach playableUnits;
if(__GETC__(DWEV_adminlevel) < 2) exitWith {closeDialog 0;};//Ab S