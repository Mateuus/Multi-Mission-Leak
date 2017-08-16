/*
	File: fn_medheal.sqf
	Author: Christian "Cifon" Runggas
*/

	if (EMonkeys_c164 < 30000) exitWith {hint "Du hast nicht genug Geld"};
	EMonkeys_c164 = EMonkeys_c164 - 30000;

	_PUID = getPlayerUID player;
    [[_PUID],"TON_fnc_lottoadd",false,false] call EMonkeys_fnc_MP;
	
