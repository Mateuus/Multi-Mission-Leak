#include "..\..\script_macros.hpp"
/*
    File: fn_adminMarkers.sqf
    Author: NiiRoZz
    Description:
    Display markers for all players
*/
if (FETCH_CONST(life_adminlevel) < 3) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

[] spawn TON_fnc_MapMarkersAdmin;
