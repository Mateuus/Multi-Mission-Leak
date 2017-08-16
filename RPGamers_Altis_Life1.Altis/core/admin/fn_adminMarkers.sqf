#include "..\..\script_macros.hpp"
/*
    File: fn_adminMarkers.sqf
    Author: NiiRoZz
    Description:
    Display markers for all players
*/
if (FETCH_CONST(life_adminlevel) < 4) exitWith {closeDialog 0; [localize "STR_ANOTF_ErrorLevel",5,"gray"] call RPG_Fnc_Msg;};

[] spawn TON_fnc_MapMarkersAdmin;
