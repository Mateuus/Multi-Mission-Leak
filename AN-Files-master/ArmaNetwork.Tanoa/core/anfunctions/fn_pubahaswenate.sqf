/*
	File: fn_freezePlayer.sqf
	Author: ColinM9991

	Description: Freezes selected player
*/
private["_admin"];
_admin = param [0,ObjNull,[ObjNull]];
if(life_frozen) then {
	hintSilent localize "STR_NOTF_Unfrozen";
	[1,format[localize "STR_ANOTF_Unfrozen",profileName]] remoteExecCall ["life_fnc_brusathusek",_admin];
	disableUserInput false;
	life_frozen = false;
} else {
	hintSilent localize "STR_NOTF_Frozen";
	[1,format[localize "STR_ANOTF_Frozen",profileName]] remoteExecCall ["life_fnc_brusathusek",_admin];
	disableUserInput true;
	life_frozen = true;
};
