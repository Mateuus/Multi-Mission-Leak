
/*
	Author: Christian "Cifon" Runggas
	E-mail: me@cifon.de
*/
_unit = cursorTarget;

if(isNull _unit) exitWith {};
if((player distance _unit > 3)) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
if(_unit getVariable "onkill") exitWith {hint "Man zeigt toten keinen Ausweis";};

if(count eM_ausweis == 0) exitWith { };

[eM_ausweis,"EMonkeys_fnc_ausweis",_unit,false] call EMonkeys_fnc_mp; 