#include "..\..\script_macros.hpp"
/*
	File: fn_adminRelease.sqf
	
	Description:
	Release the chosen player from jail.
*/
if(FETCH_CONST(life_adminlevel) < 3) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];

if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};

[player,_unit,false] remoteExecCall ["life_fnc_releasePlayer",_unit];

titleText[localize "STR_Cop_AdminRelease","PLAIN"];
