#include <macro.h>
/*
	File: fn_adminRestrain.sqf
	Author: Kevin

	Description:
	Restrains the chosen player for a talking to
*/
if(__GETC__(life_adminlevel) < 4) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};
if(_unit == player) exitWith {hint "Restraining yourself seems like a really good idea.";};

[[0,format["%1 was restrained by an Admin!",_unit getVariable["realname",name _unit]]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
hint "You have restrained the target player, please remember to unrestrain them!";
[[player],"life_fnc_adminRestrainAction",_unit,false] spawn life_fnc_MP;