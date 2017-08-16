/*
	File: fn_brendspawn.sqf
	Author: Bloodwyn

	Description:
	Player respawns in a city
*/
player setposATL [23510.6,17820.5,10.6];
_action = [
		"Wollen Sie wirklich in einer Stadt respawnen?",
		"Teilnahmebestaetigung",
		"JA",
		"NEIN"
	] call BIS_fnc_guiMessage;

	waituntil{ str _action == "true" or  str _action == "false"};

	if(_action)then{
		[] call lhm_fnc_spawnMenu;
		sleep 1;
		if(!dialog) then {[] call lhm_fnc_spawnMenu;};
	};