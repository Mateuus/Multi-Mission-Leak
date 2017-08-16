/*
	File: fn_runDialog.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Display the run for office dialog.
*/

life_run_data = nil;
life_run_dialog = true;

[[getPlayerUID player, player],"ASY_fnc_getCandidate",false,false] spawn life_fnc_MP;

waitUntil { !isNil "life_run_data" };

life_run_dialog = nil;

if (count life_run_data > 0) exitWith { hint "You are already running for office and cannot change your platform after it has already begun.  To make changes, wait until after the election." };

disableSerialization;
createDialog "life_candidate_menu";