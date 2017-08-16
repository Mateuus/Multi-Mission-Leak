#include "..\..\script_macros.hpp"
/*
    File: fn_adminGodMode.sqf
    Author: Tobias 'Xetoxyc' Sittenauer

    Description: Enables God mode for Admin
*/

if (FETCH_CONST(life_adminlevel) < 4) exitWith {closeDialog 0; [localize "STR_ANOTF_ErrorLevel",5,"gray"] call RPG_Fnc_Msg;};

closeDialog 0;

if (life_god) then {
    life_god = false;
    [localize "STR_ANOTF_godModeOff",5,"blue"] call RPG_Fnc_Msg;
    player allowDamage true;
} else {
    life_god = true;
    [localize "STR_ANOTF_godModeOn",5,"blue"] call RPG_Fnc_Msg;
    player allowDamage false;
};