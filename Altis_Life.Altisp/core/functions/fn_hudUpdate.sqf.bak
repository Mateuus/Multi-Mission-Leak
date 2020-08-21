#include "..\..\script_macros.hpp"
/*
    File: fn_hudUpdate.sqf
    Author: Daniel Stuart

    Description:
    Updates the HUD when it needs to.
*/
disableSerialization;

if (isNull LIFEdisplay) then {[] call life_fnc_hudSetup;};
LIFEctrl(1000) ctrlsetText format["%1", life_hunger];
LIFEctrl(1001) ctrlsetText format["%1", life_thirst];
LIFEctrl(1002) ctrlsetText format["%1", round((1 - (damage player)) * 100)];
LIFEctrl(1004) ctrlsetText format["%1", life_carryWeight]; 
LIFEctrl(1005) ctrlsetText format["%1", life_maxWeight];