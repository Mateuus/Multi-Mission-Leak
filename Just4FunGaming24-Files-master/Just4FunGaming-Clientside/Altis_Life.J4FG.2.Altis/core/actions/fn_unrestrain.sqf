/*
	File: fn_unrestrain.sqf
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit || !(_unit getVariable["restrained", false])) exitWith {};

_unit setVariable["restrained", false, true];
_unit setVariable["escorting", false, true];
_unit setVariable["transporting", false, true];
detach _unit;

[player, "cuff"] remoteExec ["say3D", -2];
[ 0, format[localize "STR_NOTF_Unrestrain",_unit getVariable["realName", name _unit], profileName] ] remoteExec ["XY_fnc_broadcast", [west, 2]];