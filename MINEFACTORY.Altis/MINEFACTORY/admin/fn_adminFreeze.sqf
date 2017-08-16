#include "..\..\script_macros.hpp"
/*
	File: fn_adminFreeze.sqf
	Author: ColinM9991

	Description: Freezes selected player
*/
if(FETCH_CONST(life_adminlevel) < 4) exitWith {closeDialog 0; hint  "Das geht gerade nicht.Level";};

private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};
if(_unit == player) exitWith {hint  "Das geht gerade nicht.";};

[player] remoteExec ["life_fnc_freezePlayer",_unit];
