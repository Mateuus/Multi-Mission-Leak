/*
	File: fn_stopEscorting.sqf

	Description:
	ASFSDFHAGFASF
*/
private "_unit";
_unit = param [0,ObjNull,[ObjNull]];
if(isNull _unit) exitWith {};
if(!(_unit getVariable "Escorting")) exitWith {life_escortTarget = objNull;};
detach _unit;
_unit setVariable["Escorting",false,true];
life_escortTarget = objNull;
