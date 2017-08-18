#include <macro.h>
/*
	File: fn_adminFeed.sqf
	Author: Michael Francis
 
	Description:
	Feeds a selected player
*/
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};
private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};

[[player],"life_fnc_feedPlayer",_unit,false] spawn life_fnc_MP;
[[0,format["%2 has fed %1! How generous!",_unit getVariable["realname",name _unit],profileName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;