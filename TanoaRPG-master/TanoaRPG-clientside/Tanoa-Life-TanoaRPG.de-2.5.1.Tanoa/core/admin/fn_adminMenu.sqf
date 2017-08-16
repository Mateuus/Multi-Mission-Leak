#include <macro.h>
/*
	File: fn_adminMenu.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: CooliMC
	
	Description:
	Opens the admin menu, sorry nothing special in here. Take a look for yourself.
	Therefor CooliMC added new cool Functions
*/
private["_display","_list","_side","_menumode"];
_menumode = _this select 0;

if(__GETC__(life_adminlevel) < _menumode) exitWith {closeDialog 0;};
disableSerialization;
waitUntil {!isNull (findDisplay 2900)};
_display = findDisplay 2900;
_list = _display displayCtrl 2902;
if(__GETC__(life_adminlevel) < _menumode) exitWith {closeDialog 0;};

//Purge List
lbClear _list;

{
	_side = switch(side _x) do {case west: {"Cop"}; case civilian : {"Civ"}; case independent : {"Med/ADAC"}; case east : {"Imperium"}; default {"Unknown"};};
	_list lbAdd format["%1 - %2", _x getVariable["realname",name _x],_side];
	_list lbSetdata [(lbSize _list)-1,str(_x)];
} foreach playableUnits;
if(__GETC__(life_adminlevel) < _menumode) exitWith {closeDialog 0;};