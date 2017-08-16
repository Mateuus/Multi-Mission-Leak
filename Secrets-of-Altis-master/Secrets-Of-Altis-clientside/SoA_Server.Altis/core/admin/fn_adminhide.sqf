#include "..\..\script_macros.hpp"

if (FETCH_CONST(life_adminlevel) < 4) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

if!(life_hiding) then {
	[player, true] remoteExecCall ["life_fnc_hideit",0,true];
	hint "You are now invisible!";
	
	life_hiding = true;
	//[name player, "hat die Unsichtbarkeits-Funktion aktiviert!",call life_adminlevel,7,"",admingrund] remoteExecCall ["life_fnc_logdat",2];
	
} else {
	[player, false] remoteExecCall ["life_fnc_hideit",0,true];
	hint "Has activated the invisibility function!";
	
	life_hiding = false;
	//[name player, "hat die Unsichtbarkeits-Funktion deaktiviert!",call life_adminlevel,7] remoteExecCall ["life_fnc_logdat",2];
};