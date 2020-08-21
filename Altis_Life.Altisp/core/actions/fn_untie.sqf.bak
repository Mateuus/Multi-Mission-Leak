#include "..\..\script_macros.hpp"
/*
	File: fn_untie.sqf
	
	Description:
	Untie the target.
	
*/
private["_unit"];
_unit = param [0,ObjNull,[ObjNull]];
if(isNull _unit OR !(_unit GVAR ["tied",FALSE])) exitWith {}; //Error check?

_unit SVAR ["tied",FALSE,TRUE];
_unit SVAR ["Escorting",FALSE,TRUE];
_unit SVAR ["transporting",FALSE,TRUE];
detach _unit;