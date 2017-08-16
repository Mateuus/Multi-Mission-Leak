#include <macro.h>
/*
	fn_adminfirework.sqf
	Author: G00golplexian
	
	Description: Random firework :D
*/
if(__GETC__(life_adminlevel) < 2) exitWith {
	closeDialog 0; 
	[] call life_fnc_crashStart;
	_message = format["%1 verwendet unbefugt den Admin-Teleport (wegporten)!", name player];
	[["",_message,player,8],"SOA_fnc_handleMessages",false,false] spawn life_fnc_MP;
};

_mode = _this select 0;

switch(_mode) do {

	case 0: {[5] spawn life_fnc_firework;};
	case 1: {
		_rnd = round(random 4);

		switch(_rnd) do {
			case 0: {[0] spawn life_fnc_firework;};
			case 1: {[1] spawn life_fnc_firework;};
			case 2: {[2] spawn life_fnc_firework;};
			case 3: {[3] spawn life_fnc_firework;};
			case 4: {[4] spawn life_fnc_firework;};
		};
	};
};