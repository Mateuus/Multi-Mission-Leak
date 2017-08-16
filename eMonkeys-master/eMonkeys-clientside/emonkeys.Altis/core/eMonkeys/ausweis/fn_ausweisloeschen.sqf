/*
	Author: Christian "Cifon" Runggas
	E-mail: me@cifon.de
*/
if(count eM_ausweis == 0) exitWith { };
if(isNil "eM_ausweis") exitWith {};
if(EMonkeys_c164 < 10000) exitWith {hint "Du hast keine 10000€ bei."};

[[player,getPlayerUID player,name player], "EMonkeys_fnc_ausweisdel",false,false] call EMonkeys_fnc_mp;

EMonkeys_c164 = EMonkeys_c164 - 10000;
[] spawn EMonkeys_fnc_invisible; 
