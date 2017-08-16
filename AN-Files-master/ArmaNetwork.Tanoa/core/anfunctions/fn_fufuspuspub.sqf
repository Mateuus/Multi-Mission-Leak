/*
	File: fn_simDisable.sqf
*/
params [
	["_obj",objNull,[objNull]],
	["_bool",false,[false]]
];
if(isNull _obj) exitWith {};
if(isPlayer _obj) exitWith {};
_obj enableSimulation _bool;
