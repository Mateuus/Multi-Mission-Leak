#include "..\..\script_macros.hpp"
/*
    File: fn_adminDebugCon.sqf
    Author: ColinM9991

    Description:
    Opens the Debug Console.
*/
if (FETCH_CONST(life_adminlevel) < 5) exitWith {closeDialog 0; [localize "STR_NOTF_adminDebugCon",5,"gray"] call RPG_Fnc_Msg;};
life_admin_debug = true;

createDialog "RscDisplayDebugPublic";
[0,format [localize "STR_NOTF_adminHasOpenedDebug",profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];

