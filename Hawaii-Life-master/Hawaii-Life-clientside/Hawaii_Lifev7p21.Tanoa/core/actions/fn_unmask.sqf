/*
	File: fn_unmask.sqf
	Author: Larry aka. Tim
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((player distance _unit > 3)) exitWith {};
if(!(_unit getVariable "masked")) exitWith {};
if(player isEqualTo _unit) exitWith {};
if(!isPlayer _unit) exitWith {};

_unit setVariable["masked",FALSE,TRUE];
[player] remoteExecCall ["life_fnc_masked",_unit];
[true,"blindfold",1] call life_fnc_handleInv;
hint "Du hast ihm seine Maske abgenommen. Er kann nun wieder sehen.";