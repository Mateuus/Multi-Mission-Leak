#include <macro.h>
/*
	File: fn_adminJail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Send player to jail via admin command
*/
if(__GETC__(life_adminlevel) < 4) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1",_unit];
if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};

[_unit,false] call life_fnc_adminArrest;