/*
	File: fn_way_one_1.sqf
	Author: Baney

	Description:
	Keine Zeit für Beschreibung, Star Trek gucken


	You're not allowed to modify this file!
        Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/




private ["_terminals"];

_terminals = param [0,[],[[]]];

if(count(_terminals) == 0 ) exitWith {hint "Fehler: fn_way_one_addaction";};


{
	_x addaction ["Bedienen",lhm_fnc_way_one_status,[]];
} foreach _terminals;