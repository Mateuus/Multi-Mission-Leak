#include <macro.h>
/*
	File: fn_adminComp.sqf
	Author: Kevin

	Description:
	For compensation requests
*/
if(__GETC__(life_adminlevel) < 2) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};
private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];

if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};
if(_unit == player) exitWith { hint "You may not adjust your own bank account at this time!";};
life_compTarget = _unit;

createDialog "Adjustment_ui";