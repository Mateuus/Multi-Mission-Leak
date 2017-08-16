#include <macro.h>
/*
	File: fn_freezePlayer.sqf
	Author: ColinM9991
 
	Description: Freezes selected player
*/
private["_admin"];
_admin = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_level = _this select 1;

if(life_frozen) then {
	hint localize "STR_NOTF_Unfrozen";
	[1,format[localize "STR_ANOTF_Unfrozen",profileName]] remoteExecCall ["life_fnc_broadcast",_admin];
	disableUserInput false;
	life_frozen = false;
	
	[name _admin, format["hat %1 freigegeben!",name player],_level,7] remoteExecCall ["life_fnc_logdat",2];
} else {
	hint localize "STR_NOTF_Frozen";
	[1,format[localize "STR_ANOTF_Frozen",profileName]] remoteExecCall ["life_fnc_broadcast",_admin];
	disableUserInput true;
	life_frozen = true;
	
	[name _admin, format["hat %1 eingefroren!",name player],_level,7] remoteExecCall ["life_fnc_logdat",2];
};