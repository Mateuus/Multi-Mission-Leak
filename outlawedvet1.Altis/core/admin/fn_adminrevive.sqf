#include "..\..\script_macros.hpp"
/*
    File: fn_adminrevive.sqf
    Author: RPGforYOU

    Description:
    Revives cursor target
*/
if (FETCH_CONST(life_adminlevel) < 5) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};
[profileName] remoteExecCall ["life_fnc_revived",cursorTarget];
