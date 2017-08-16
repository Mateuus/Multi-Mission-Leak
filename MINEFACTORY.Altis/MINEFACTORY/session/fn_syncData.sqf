#include "..\..\script_macros.hpp"
/*
	File: fn_syncData.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Used for player manual sync to the server.
*/
_fnc_scriptName = "Player Synchronization";
if(isNil "life_session_time") then {life_session_time = false;};
if(life_session_time) exitWith { hint  "Du hast bereits die Sync-Option verwendet, diese Funktion kann nur einmal alle 5 Minuten verwendet werden."; };

[] call SOCK_fnc_updateRequest;
[] spawn {
	life_session_time = true;
	sleep (5 * 60);
	life_session_time = false;
};