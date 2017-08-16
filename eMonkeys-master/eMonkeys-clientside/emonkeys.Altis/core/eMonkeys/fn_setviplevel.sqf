/*
	Author: Christian "Cifon" Runggas
	E-mail: me@cifon.de
*/

private["_level"];


_level = [_this,0,"",[""]] call BIS_fnc_param;





if (EMonkeys_VIP == (parseNumber(_level)) || EMonkeys_VIP > (parseNumber(_level))) exitWith {hint "Du bist schon auf level 1 oder höher";};




if(!([_level] call fnc_isnumber)) exitWith {};

if(_level == "1") then {
if (EMonkeys_a164 < 10000000) exitWith {hint "du hast nicht genug Geld"};
EMonkeys_VIP = (parseNumber(_level));
EMonkeys_a164 = EMonkeys_a164 - 10000000;
hint "Du bist Jetzt VIP level 1 dir wurden 10.0000.000 abgezogen"
};

if(_level == "2") then {
if (EMonkeys_a164 < 20000000) exitWith {hint "du hast nicht genug Geld"};
EMonkeys_VIP = (parseNumber(_level));
EMonkeys_a164 = EMonkeys_a164 - 20000000;
hint "Du bist Jetzt VIP level 2 dir wurden 20.0000.000 abgezogen"
};





[0] call SOCK_fnc_updatePartial;
[8] call SOCK_fnc_updatePartial;