#include <macro.h>
/*
	File: fn_adminMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the admin menu, sorry nothing special in here. Take a look for yourself.
*/
private "_list";
private["_display","_list","_side"];
disableSerialization;
waitUntil {!isNull (findDisplay 2900)};
_list = CONTROL(2900,2902);
//Purge List
lbClear _list;

if(FETCH_CONST(life_adminlevel) > 0) then {
{
	_side = switch(side _x) do {case west: {"Cop"}; case civilian: {"Civ"}; case independent: {"Medic"}; default {"Unknown"};};
	_list lbAdd format["%1 - %2", _x getVariable["realname",name _x],_side];
	_list lbSetdata [(lbSize _list)-1,str(_x)];
} foreach playableUnits;
} else {
	{ctrlEnable[_x,false]} forEach [2907,2908,2909];
};

{
	_list lbAdd (_x select 0);
	_list lbSetdata [(lbSize _list)-1,_x select 1];
} foreach PG_event_stuff;