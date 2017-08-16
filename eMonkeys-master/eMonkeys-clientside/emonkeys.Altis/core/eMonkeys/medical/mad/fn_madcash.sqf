/*
	Author: Christian "Cifon" Runggas
	E-mail: me@cifon.de
*/

if(!hasInterface && isServer) exitWith{};

_cash = [_this,0,"",["",0]] call BIS_fnc_param; //vl

if (playerSide != independent) exitwith {};

waitUntil {(!isNil {EMonkeys_medicLevel})};





if((call EMonkeys_medicLevel) < 0) exitWith {}; //vl

_count = independent countSide playableUnits;

_cash = parseNumber _cash;




if(_cash < 1) exitWith {};

_value = round (_cash/_count);

hint format ["Du hast ein Bonus von %1€ bekommen",[_value] call EMonkeys_fnc_numberText];

EMonkeys_a164 = EMonkeys_a164 + _value;