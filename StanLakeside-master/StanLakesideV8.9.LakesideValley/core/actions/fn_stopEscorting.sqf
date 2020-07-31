/*
	File: fn_stopEscorting.sqf
	
	Description:
	ASFSDFHAGFASF
*/
private["_unit"];
_unit = param [0,ObjNull,[ObjNull]];
if(isNull _unit) exitWith {}; //Not valid
if(!(_unit getVariable ["Escorting", false])) exitWith {}; //He's not being Escorted.
if(isNull _unit) exitWith {}; //Not valid
detach _unit;
_unit setVariable["Escorting", nil, true];