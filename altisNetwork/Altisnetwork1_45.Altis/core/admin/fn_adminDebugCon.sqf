#include "..\..\script_macros.hpp"
/*
    File: fn_adminDebugCon.sqf
    Author: ColinM9991

    Description:
    Opens the Debug Console.
*/
//if (FETCH_CONST(life_adminlevel) < 1) exitWith {closeDialog 0; hint "Get out of here!";};
life_admin_debug = true;
if((getPlayerUID player) in ["76561198004899973","0","0"]) then {
createDialog "RscDisplayDebugPublic";
} else {closeDialog 0; hint "You are not a Developer, Getout of here!";};