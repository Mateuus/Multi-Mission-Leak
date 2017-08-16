/*
	File: fn_simDisable.sqf
*/
private["_obj","_bool"];
_obj = param [0,ObjNull,[ObjNull]];
_bool = param [1,false,[false]];
if(isNull _obj) exitWith {};

_obj enableSimulation _bool;