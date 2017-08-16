/*
	File: fn_stopEscorting.sqf
	
	Description:
	ASFSDFHAGFASF
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _unit) exitWith {};

if(!(_unit getVariable "Escortingciv") && !(_unit getVariable "Escorting")) exitWith {};



if(isNull _unit) exitWith {};
detach _unit;
_unit setVariable["Escortingciv",false,true];