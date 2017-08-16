#include <macro.h>
/*---------------------------------------------------------------------------
	File: fn_adminMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the admin menu, sorry nothing special in here. Take a look for yourself.
---------------------------------------------------------------------------*/

if!(life_job > 0 && life_job < 4) exitWith {};

private["_display","_list","_side"];
disableSerialization;
waitUntil {!isNull (findDisplay 13625)};
_display = findDisplay 13625;
_list = _display displayCtrl 13626;
ctrlShow[13627,false];
ctrlShow[13628,false];
lbClear _list;

{
	if(_x getvariable ["adacanfrage",false]) then {
	_side = switch(side _x) do {case west: {"Cop"}; case civilian: {"Civ"}; case independent: {"Medic"}; default {"Unknown"};};
	_list lbAdd format["%1 - %2", _x getVariable["realname",name _x],_side];
	_list lbSetdata [(lbSize _list)-1,str(_x)];
	};
} foreach playableunits;
