/*
	File: fn_knockoutAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Knocks out the target.
*/
private["_target"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};
if(player distance _target > 4) exitWith {};
[_target, "knockout"] remoteExec ["tanoarpg_fnc_playSound3D", -2, true];
life_knockout = true;
[player,"acts_miller_knockout"] remoteExec ["tanoarpg_fnc_animSync", -2, false];
[] spawn {
	sleep 4;
	[player,""] remoteExec ["tanoarpg_fnc_animSync", -2, false];
};

sleep 0.08;
[_target,profileName] remoteExec ["tanoarpg_fnc_knockedOut", _target, false];

sleep 3;
life_knockout = false;