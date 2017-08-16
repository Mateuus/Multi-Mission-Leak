#include "..\..\script_macros.hpp"
/*
	File: fn_adminUnrestrain.sqf
	
	Description:
	Unrestrains
*/
if(FETCH_CONST(life_adminlevel) < 3) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};
if(FETCH_CONST(life_adminlevel) < 3) exitWith {hint localize "STR_ANOTF_ErrorLevel";};

if(isNull _unit OR !(_unit getVariable["restrained",FALSE])) exitWith {}; //Error check?

_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE];
detach _unit;

[[0,format[localize "STR_NOTF_Unrestrain",_unit getVariable["realname",name _unit], profileName]],"life_fnc_broadcast",true,FALSE] call life_fnc_MP;