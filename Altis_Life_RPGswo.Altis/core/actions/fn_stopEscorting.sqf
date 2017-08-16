/*
	File: fn_stopEscorting.sqf
	
	Description:
	ASFSDFHAGFASF
*/
private["_unit"];
_unit = param [0,ObjNull,[ObjNull]];
if(isNull _unit) exitWith {}; //Not valid
if(!(_unit getVariable "Escorting")) exitWith {}; //He's not being Escorted.
//if(side _unit != civilian) exitWith {}; //Not a civ
if(isNull _unit) exitWith {}; //Not valid
detach _unit;
_unit setVariable["Escorting",false,true];