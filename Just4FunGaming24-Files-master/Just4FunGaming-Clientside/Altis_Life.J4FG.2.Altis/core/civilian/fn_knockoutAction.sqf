/*
	File: fn_knockoutAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Knocks out the target.
*/
private["_target"];

_target = [ _this, 0, ObjNull, [ObjNull] ] call BIS_fnc_param;

if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};
if(player distance _target > 4) exitWith {};

[ player, "AwopPercMstpSgthWrflDnon_End2" ] remoteExec ["XY_fnc_animSync", -2];
[_target, profileName] remoteExec ["XY_fnc_knockedOut", _target];