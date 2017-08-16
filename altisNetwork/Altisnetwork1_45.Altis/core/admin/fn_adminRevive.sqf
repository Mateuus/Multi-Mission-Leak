#include "..\..\script_macros.hpp"
/*
	File: fn_adminTpHere.sqf
	Author: ColinM9991

	Description:
	Teleport selected player to you.

if(FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};
[[name player],"life_fnc_revivePlayer",cursorTarget,FALSE] spawn life_fnc_MP;
*/

if (FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};
[profileName] remoteExecCall ["life_fnc_revived",cursorTarget];