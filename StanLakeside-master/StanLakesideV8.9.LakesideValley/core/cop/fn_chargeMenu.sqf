#include <macro.h>
/*
	File: fn_chargeMenu.sqf
	Author: Kevin Webb
	
	Description:
	Opens the menu relating to charging civilians.
*/
private["_display","_list","_side"];
disableSerialization;
waitUntil {!isNull (findDisplay 1337)};
_display = findDisplay 1337;
_list = _display displayCtrl 1338;
/*Purge List*/
lbClear _list;

{
	_side = switch(side _x) do {case west: {"Cop"}; case east : {"Civ"}; case civilian : {"Civ"}; case independent : {"Medic"}; default {"Unknown"};};
	if(_side in ["Civ","Medic"]) then {
		_list lbAdd format["%1 - %2", name _x,_side];
		_list lbSetdata [(lbSize _list)-1,str(_x)];
	};
} foreach playableUnits;