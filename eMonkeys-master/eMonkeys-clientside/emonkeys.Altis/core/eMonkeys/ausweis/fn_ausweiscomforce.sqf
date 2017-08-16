/*
	Author: Christian "Cifon" Runggas
	E-mail: me@cifon.de
*/
_unit = cursorTarget;

if(isNull _unit) exitWith {};
if((player distance _unit > 3)) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};

[player,"EMonkeys_fnc_ausweiscomforceback",_unit,false] call EMonkeys_fnc_mp;
