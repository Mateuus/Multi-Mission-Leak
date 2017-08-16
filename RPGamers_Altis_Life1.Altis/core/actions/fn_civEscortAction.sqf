#include "..\..\script_macros.hpp"
/*
	File: fn_escortAction.sqf
*/
private ["_unit"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if (!isNull(player getVariable ["escortingPlayer",objNull])) exitWith {};
if (isNil "_unit" || isNull _unit || !isPlayer _unit) exitWith {};
if (!(side _unit in [civilian,west])) exitWith {};
if (player distance _unit > 3) exitWith {};

_unit attachTo [player,[0.1,1.1,0]];
player setVariable ["escortingPlayer",_unit];
player setVariable ["isEscorting",true];
_unit setVariable ["transporting",false,true];
_unit setVariable ["Escorting",true,true];
player reveal _unit;

[_unit] spawn {
    _unit = _this select 0;
    waitUntil {(!(_unit getVariable ["Escorting",false]))};
    player setVariable ["escortingPlayer",nil];
    player setVariable ["isEscorting",false];
};

["Escorting",5,"blue"] call RPG_Fnc_Msg;