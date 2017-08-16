#include "..\..\script_macros.hpp"
/*
	File: fn_adminCompensate.sqf
	Author: ColinM9991
	
	Description:
	Figure it out.
*/
private["_value","_action"];
if(FETCH_CONST(life_adminlevel) < 4) exitWith {closeDialog 0; hint  "Das geht gerade nicht.Level";};
_value = parseNumber(ctrlText 9922);
if(_value < 0) exitWith {};
if(_value > 999999) exitWith {hint  "Maximaler Wert $999,999!"};

_action = [
	format [ "Du bist dabei dir selbst $%1 zu geben um einen anderen Spieler zu entschädigen.<br/><br/>Gib das Geld dann an den Spieler weiter.",[_value] call life_fnc_numberText],
	 "Entschädigen",
	 "Ja",
	 "Nein"
] call BIS_fnc_guiMessage;

if(_action) then {
	life_cash = life_cash + _value;
	hint format [ "Dir wurden $%1 auf deinem Bankkonto gutgeschrieben.",[_value] call life_fnc_numberText];
	closeDialog 0;
} else {
	hint  "Aktion abgebrochen";
	closeDialog 0;
};