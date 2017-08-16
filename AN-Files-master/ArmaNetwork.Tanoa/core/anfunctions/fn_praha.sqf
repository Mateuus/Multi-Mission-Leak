/*
	File: fn_adminFreeze.sqf
	Author: ColinM9991

	Description: Freezes selected player
*/
if((call life_adminlevel) < 2) exitWith {closeDialog 0; hintSilent localize "STR_ANOTF_ErrorLevel";};
private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};
if(_unit isEqualTo player) exitWith {hintSilent localize "STR_ANOTF_Error";};
[player] remoteExecCall ["life_fnc_pubahaswenate",_unit];
