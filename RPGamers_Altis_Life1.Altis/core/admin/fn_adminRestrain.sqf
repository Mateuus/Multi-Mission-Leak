
#include "..\..\script_macros.hpp"
/*
	File: fn_adminTpHere.sqf
	Author: ColinM9991
	
	Description:
	Teleport selected player to you.
*/
if(FETCH_CONST(life_adminlevel) < 5) exitWith {closeDialog 0; [localize "STR_ANOTF_ErrorLevel",5,"gray"] call RPG_Fnc_Msg;};

private["_target"];
_target = lbData[2902,lbCurSel (2902)];
_target = call compile format["%1", _target];
if(isNil "_target") exitwith {};
if(isNull _target) exitWith {};
if(_target == player) exitWith {[localize "STR_ANOTF_Error",5,"gray"] call RPG_Fnc_Msg;};

[_target,"cuffs"] spawn life_fnc_nearestSound;
_target setVariable["restrained",true,true];

[[player],"life_fnc_restrain",_target,false] spawn BIS_fnc_MP;