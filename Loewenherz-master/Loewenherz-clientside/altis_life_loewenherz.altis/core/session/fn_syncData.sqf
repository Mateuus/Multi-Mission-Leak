/*
	File: fn_syncData.sqf
	Author: Bryan "Tonic" Boardwine"

	Description:
	Used for player manual sync to the server.
*/
_fnc_scriptName = "Player Synchronization";
private["_exit"];
if(isNil "lhm_session_time") then {lhm_session_time = false;};
if(lhm_session_time) exitWith {hint localize "STR_Session_SyncdAlready";};

switch (typeName lhm_fnc_mp_packet) do
{
	case "ARRAY":
	{
		if(count lhm_fnc_mp_packet == 0) exitWith
		{
			_exit = true;
		};
	};

	default {_exit = true;};
};

if(!isNil "_exit") exitWith {hint localize "STR_Session_SyncCheater";};

[] call SOCK_fnc_updateRequest;
[] call SOCK_fnc_PlayerStatUpdateRequest;
diag_log "::lhm Client:: Player Session synced";
hint localize "STR_Session_SyncData";
[] spawn
{
	lhm_session_time = true;
	sleep (180);
	lhm_session_time = false;
};
