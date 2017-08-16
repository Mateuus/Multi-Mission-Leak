#include "..\script_macros.hpp"
/*
	File: fn_syncData.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Used for player manual sync to the server.
*/
_fnc_scriptName = "Player Synchronization";
if(isNil "ES_session_time") then {ES_session_time = false;};
if(ES_session_time) exitWith {hint localize "STR_Session_SyncdAlready";};

[] call SOCK_fnc_updateRequest;
hint localize "STR_Session_SyncData";
[] spawn {
	ES_session_time = true;
	sleep (5 * 60);
	ES_session_time = false;
};
