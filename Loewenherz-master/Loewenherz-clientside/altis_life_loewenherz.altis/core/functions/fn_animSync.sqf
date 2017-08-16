/*
	File: fn_animSync.sqf
*/
private["_unit","_anim"];
_unit = param [0,ObjNull,[Objnull]];
_anim = param [1,"",[""]];
if(isNull _unit) exitWith {};
_unit switchMove _anim;