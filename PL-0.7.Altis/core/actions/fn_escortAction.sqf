#include "..\..\script_macros.hpp"
/*
	File: fn_escortAction.sqf
*/
private "_unit";
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNil "_unit" || isNull _unit || !isPlayer _unit) exitWith {};
if((player distance _unit > 3)) exitWith {};

_unit attachTo [player,[0.1,1.1,0]];
_unit SVAR ["transporting",false,true];
_unit SVAR ["Escorting",true,true];
player reveal _unit;