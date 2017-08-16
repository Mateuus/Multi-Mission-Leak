/*
	File: fn_spawnLast.sqf
	Author: Larry
	Disclaimer: You are not allowed to use this File.
*/
closeDialog 0;
player setPos life_civ_position;
if(player distance (getMarkerPos "respawn_civilian") < 1000) exitWith {
	life_is_alive = false;
	player enableSimulation true;
	0 cutText ["","BLACK IN"];
	[] call life_fnc_spawnMenu;
};
life_is_alive = true;[8] call SOCK_fnc_updatePartial;
[] spawn {
	cutText ["","BLACK IN"];
	private["_handle"];
	_handle = [] spawn life_fnc_initIntro;
	waitUntil {scriptDone _handle};
};