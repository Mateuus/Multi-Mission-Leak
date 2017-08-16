#include "..\..\script_macros.hpp"

if(FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0;};

private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];

if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};
if(_unit == player) exitWith {hint localize "STR_ANOTF_Error";};


[player] remoteExec ["life_fnc_ts3warning",0];            