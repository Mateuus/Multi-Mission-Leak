#include "..\..\script_macros.hpp"
/*
	File: fn_adminTpHere.sqf
	Author: ColinM9991
	
	Description:
	Teleport selected player to you.
*/
if(FETCH_CONST(life_adminlevel) < 4) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

private["_target"];
_target = lbData[2902,lbCurSel (2902)];
_target = call compile format["%1", _target];
if(isNil "_target") exitwith {};
if(isNull _target) exitWith {};
if(_unit == player) exitWith {hint localize "STR_ANOTF_Error";};

["Admin"] remoteExec ["life_fnc_revived",_target];
hint format["You have brought %1 back to life",_target getVariable["realname",name _target]];
//[0,format["Admin %1 has brought a player back to life.",profileName]] remoteExec ["life_fnc_broadcast",RCLIENT];