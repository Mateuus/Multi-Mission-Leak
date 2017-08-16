/*
	Author: Christian "Cifon" Runggas
	E-mail: me@cifon.de
*/
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _player) exitWith {};
if(count eM_ausweis == 0) exitWith { };

[eM_ausweis,"EMonkeys_fnc_ausweis",_player,false] call EMonkeys_fnc_mp;