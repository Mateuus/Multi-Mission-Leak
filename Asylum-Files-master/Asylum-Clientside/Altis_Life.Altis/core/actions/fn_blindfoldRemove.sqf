/*
	File: fn_blindfoldRemove.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Removes blindfold from the target
*/

_unit = [_this,3,Objnull,[Objnull]] call BIS_fnc_param;
if (_unit != player) then { _unit = cursorTarget };

if (isNull (_unit getVariable ["blindfold", objNull])) exitWith {};

[true,"blindfold",1] call life_fnc_handleInv;
_unit setVariable ["blindfolded", nil, true];