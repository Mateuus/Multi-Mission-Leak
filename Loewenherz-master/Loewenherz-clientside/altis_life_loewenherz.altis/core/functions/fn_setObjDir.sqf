/*
	Filename: fn_setObjDir.sqf
	Author: Blackd0g

Set a direction from a object to another one

Example: [player, object] call lhm_fnc_setObjDir
*/

private ["_unit","_obj"];

_unit = _this select 0;
_obj = _this select 1;

_unit setDir ([_unit,_obj] call BIS_fnc_dirTo);