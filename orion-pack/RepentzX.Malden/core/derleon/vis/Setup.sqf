#include "..\..\script_macros.hpp"
#include "..\lb_script_macros.hpp"
/*
	File: vis_Setup.sqf
	Author: Leon "DerL30N" Beeser
	
	Description:
	Creates and sets up important vars and actions for ignition option and easy vis deac.
*/

vis_ignitionOn = false;
vis_isActive = true;
vis_isRunning = false;

player addAction[localize "STR_VIS_SU_ignitionOn",{vis_ignitionOn = true},"",0,false,false,"",' !vis_ignitionOn && (!(isEngineOn (vehicle player))) && vis_isActive && vis_isRunning && (driver (vehicle player) == player)'];
player addAction[localize "STR_VIS_SU_ignitionOff",{vis_ignitionOn = false},"",0,false,false,"",' vis_ignitionOn && (!(isEngineOn (vehicle player))) && vis_isActive && vis_isRunning && (driver (vehicle player) == player)'];
player addAction[localize "STR_VIS_SU_ignitionOff",{vis_ignitionOn = false; (vehicle player) engineOn false},"",0,false,false,"",' (isEngineOn (vehicle player)) && vis_isActive && vis_isRunning && (driver (vehicle player) == player)'];
if (LB_SETTINGS(getNumber,"hudToggle") isEqualTo 1) then
{
	player addAction[localize "STR_VIS_SU_visOff",{vis_isActive = false},"",0,false,false,"",' vis_isActive && vis_isRunning && (driver (vehicle player) == player)'];
	player addAction[localize "STR_VIS_SU_visOn",{vis_isActive = true; [] call life_fnc_vis_setup},"",0,false,false,"",' !vis_isActive && !vis_isRunning && (driver (vehicle player) == player)'];
};
diag_log "--- VIS -> Setup.sqf -> done! ---";