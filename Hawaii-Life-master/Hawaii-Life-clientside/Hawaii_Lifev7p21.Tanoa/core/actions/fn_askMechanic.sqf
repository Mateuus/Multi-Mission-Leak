#include "..\..\script_macros.hpp"
/*
	File: fn_askMechanic.sqf
	Author: Larry
	License: Only Hawaii-life.net is allowed to use this Script
*/
private ["_veh","_pos"];
_veh = param [0,ObjNull,[ObjNull]];
_pos = position player;
if(life_cash < 3500) then {
	_action = [format ["Da du bei einer Werkstatt bist kannst du einen Mechaniker beauftragen dein Fahrzeug zu reparieren. Das kostet dich 3.500$."],"Mechaniker beauftrgen","Ja","Nein"] call BIS_fnc_guiMessage;
	if(_action) then {
		life_atmbank = life_atmbank - 3500;
		[1] call SOCK_fnc_updatePartial;
		hint "Ein Mechaniker repariert dein Auto. Dies kann etwas Zeit in Anspruch nehmen.(20 sek)";
		sleep 20;
		if(_veh distance _pos > 10) exitWith { hint "Wie soll ich denn so dein Fahrzeug reparieren? Komm wieder her!" };
		hint "Dein Auto wurde erfolgreich repariert.";
		_veh setDammage 0;
	} else {
		[_veh] spawn life_fnc_repair_openMenu;
	};
} else {
	_action = [format ["Da du bei einer Werkstatt bist kannst du einen Mechaniker beauftragen dein Fahrzeug zu reparieren. Das kostet dich 3.500$."],"Mechaniker beauftrgen","Ja","Nein"] call BIS_fnc_guiMessage;
	if(_action) then {
		life_cash = life_cash - 3500;
		[0] call SOCK_fnc_updatePartial;
		hint "Ein Mechaniker repariert dein Auto. Dies kann etwas Zeit in Anspruch nehmen.(20 sek)";
		sleep 20;
		if(_veh distance _pos > 10) exitWith { hint "Wie soll ich denn so dein Fahrzeug reparieren? Komm wieder her!" };
		hint "Dein Auto wurde erfolgreich repariert.";
		_veh setDammage 0;
	} else {
		[_veh] spawn life_fnc_repair_openMenu;
	};
};