#include "..\..\script_macros.hpp"
/*
	File: fn_hudUpdate.sqf
	Author: Daniel Stuart

	Description:
	Updates the HUD when it needs to.
*/

private["_counter"];
_counter = 180;
_counter = _counter - 1;

disableSerialization;

if(isNull LIFEdisplay) then {[] call life_fnc_hudSetup;};
LIFEctrl(2199) progressSetPosition (1 - (getFatigue player));
LIFEctrl(2200) progressSetPosition (1 / (100 / life_hunger));
LIFEctrl(2201) progressSetPosition (1 - (damage player));
LIFEctrl(2202) progressSetPosition (1 / (100 / life_thirst));
LIFEctrl(2204) progressSetPosition (100 / 100);

LIFEctrl(1199) ctrlsetText format[localize "STR_HUD_Stamina", round((1 - (getFatigue player)) * 100)];
LIFEctrl(1200) ctrlsetText format[localize "STR_HUD_Food", life_hunger];
LIFEctrl(1201) ctrlsetText format[localize "STR_HUD_Health", round((1 - (damage player)) * 100)];
LIFEctrl(1202) ctrlsetText format[localize "STR_HUD_Water", life_thirst];
LIFEctrl(1204) ctrlsetText format[localize "STR_HUD_Info", round diag_fps, west countSide playableUnits, independent countSide playableUnits, civilian countSide playableUnits, _counter];