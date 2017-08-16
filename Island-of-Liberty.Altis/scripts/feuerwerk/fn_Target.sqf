/*
	File: fn_Target.sqf
	Author: PerFecTiiNsKiLLz
	Edited by: Eisenschmiede 28.10.2015 (PerFecTiiNsKiLLz)


	Description:
	Pfiuuuuuuu
*/

private["_target"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

[[getPos _target, 'random','random']  remoteExec ["life_fnc_callFireworks",0];