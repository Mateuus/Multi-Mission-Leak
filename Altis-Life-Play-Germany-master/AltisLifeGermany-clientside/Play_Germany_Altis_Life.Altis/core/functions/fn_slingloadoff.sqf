/*
	File: fn_slingload.sqf
	Author: Arkensor
	
	Description:
	Slingload contol kind of thing
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};

_vehicle enableRopeAttach false; 
_vehicle setVariable["RopeAttach",false,true]; 
