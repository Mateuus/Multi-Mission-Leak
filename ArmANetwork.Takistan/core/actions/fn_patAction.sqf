/*
	File: fn_patAction.sqf
	Author: Pydrex
	
	Description:
	Starts the patdown process
*/
private["_target"];
_target = cursorTarget;

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};

if(_target getVariable["tied",false]) exitWith {};
[[player],"life_fnc_removeWeaponActionCiv",_target,false] call life_fnc_MP;