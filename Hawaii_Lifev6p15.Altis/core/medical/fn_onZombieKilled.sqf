/*
	File: fn_onZombieKilled.sqf
	Author: Larry
*/
private["_unit","_killer"];
disableSerialization;
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

if (side _killer == civilian) then {
	[5,0] remoteExecCall ["life_fnc_addKillCiv",_killer];
};