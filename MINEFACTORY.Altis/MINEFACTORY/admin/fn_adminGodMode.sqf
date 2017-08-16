#include "..\..\script_macros.hpp"
/*
	File: fn_adminGodMode.sqf
	Author: Tobias 'Xetoxyc' Sittenauer
 
	Description: Enables God mode for Admin
*/

if(FETCH_CONST(life_adminlevel) < 3) exitWith {closeDialog 0; hint  "Das geht gerade nicht.Level";};

[name player] RemoteExecCall ["life_fnc_revived",cursorTarget];