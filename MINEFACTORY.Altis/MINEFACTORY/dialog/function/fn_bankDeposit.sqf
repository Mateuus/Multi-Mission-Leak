#include "..\..\..\script_macros.hpp"
/*
	File: fn_bankDeposit.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Figure it out.
*/
private "_value";
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999) exitWith {hint  "Du kannst nicht mehr als $999,999 gleichzeitig einzahlen";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint  "Die eingegebene Zahl ist keine richtige Zahl"};
if(_value > CASH) exitWith {hint  "Du hast nicht so viel Geld bei dir."};

CASH = CASH - _value;
BANK = BANK + _value;

hint format[ "EinzahlenSuccess",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;
