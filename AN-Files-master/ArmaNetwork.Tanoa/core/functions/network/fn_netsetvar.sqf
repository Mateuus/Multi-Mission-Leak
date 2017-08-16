/*
	File: fn_netSetVar.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Set a variable on a client.
*/
disableSerialization;
private["_varName","_ns","_value"];
_varName = param [0,"",[""]];
_value = param [1,-9999,[sideUnknown,"",[],{},false,0,ObjNull,GrpNull,displayNull]];
_ns = param [2,missionNamespace,[missionNamespace]];

if(_varName == "") exitWith {}; //Error checking
_ns setVariable[_varName,_value];
