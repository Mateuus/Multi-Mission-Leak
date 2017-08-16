#include "..\..\macros.hpp"
/*
	Author: ME
	
	Description:
	Geld vom Gangkonto abheben
*/
private["_value"];

_value = param [0,0,[0]];

if (_value == 0 || _value > 999999) exitWith {};

dwf_cash = dwf_cash + _value;
hint format["Du hast %1€ vom Staatskonto abgehoben",[_value] call DWEV_fnc_numberText];
[0] call SOCK_fnc_updatePartial;
[] call DWEV_fnc_atmMenu;
