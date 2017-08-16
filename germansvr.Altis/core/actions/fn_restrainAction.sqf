#include "..\..\script_macros.hpp"
/*
    File: fn_restrainAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Restrains the target.
*/
private ["_unit","_w"];
_unit = cursorObject;
if (isNull _unit) exitWith {}; //Not valid
if (player distance _unit > 3) exitWith {};
if (_unit getVariable "restrained") exitWith {};
if (player isEqualTo _unit) exitWith {};
if(life_inv_zipties < 1) exitWith {hint "Du hast keine Handschellen.";};
if (!isPlayer _unit) exitWith {};

_gP = getDir player;
_gU = getDir _unit;
_dif = _gP - _gU;
//if (_dif < 25 && _dif > -25) then  {
	life_inv_zipties = life_inv_zipties - 1;
	_unit setVariable ["restrained",true,true];
	[player] remoteExec ["life_fnc_restrain",_unit];
	[_unit,"hand"] remoteExec ["life_fnc_say3D",RANY];
//} else {
//	hint "Wie willst du den den hier festnehmen? Von hinten scheinbar nicht.";
//};