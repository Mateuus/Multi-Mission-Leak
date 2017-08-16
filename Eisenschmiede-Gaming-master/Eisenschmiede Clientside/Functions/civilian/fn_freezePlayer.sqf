#include "..\script_macros.hpp"
/*
	File: fn_freezePlayer.sqf
	Author: ColinM9991
	Description: Freezes selected player
*/
private["_admin"];
_admin = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(ES_frozen) then {
	hint localize "STR_NOTF_Unfrozen";
	[1,format[localize "STR_ANOTF_Unfrozen",profileName]] remoteExecCall ["ES_fnc_broadcast",_admin];
	disableUserInput false;
	ES_frozen = false;
} else {
	hint localize "STR_NOTF_Frozen";
	[1,format[localize "STR_ANOTF_Frozen",profileName]] remoteExecCall ["ES_fnc_broadcast",_admin];
	disableUserInput true;
	ES_frozen = true;
};