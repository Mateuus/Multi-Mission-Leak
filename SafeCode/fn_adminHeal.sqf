#include <macro.h>
/*
	File: fn_adminHeal.sqf
	Author: Michael Francis
	
	Description:
	Very simple admin heal command
*/
if(__GETC__(life_adminlevel) < 2) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};
private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};

_unit setDamage 0;
[] call life_fnc_hudUpdate;
[[0,format["The admin %2 has healed %1!",_unit getVariable["realname",name _unit],profileName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;