#include "..\script_macros.hpp"
/*
	File: blindfoldOff.sqf
	Author: Jason_000
	Description: Takes the blindfold off

	
*/
_unit = [_this,3,Objnull,[Objnull]] call BIS_fnc_param;
if (_unit != player) then { _unit = cursorTarget };

if (isNull (_unit getVariable ["blindfold", objNull])) exitWith {};

[true,"blindfold",1] call ES_fnc_handleInv;
_unit setVariable ["blindfolded", nil, true];

[[_unit,profileName],"ES_fnc_blindfoldActionOff",_target,false] call ES_fnc_MP;