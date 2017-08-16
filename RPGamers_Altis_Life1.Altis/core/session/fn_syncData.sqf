#include "..\..\script_macros.hpp"
/*
    File: fn_syncData.sqf
    Author: Bryan "Tonic" Boardwine"

    Description:
    Used for player manual sync to the server.
*/
_fnc_scriptName = "Player Synchronization";
if (isNil "life_session_time") then {life_session_time = false;};
if (life_session_time) exitWith {[localize "STR_Session_SyncdAlready",5,"gray"] call RPG_Fnc_Msg;[localize "STR_Session_SyncdAlready1",5,"gray"] call RPG_Fnc_Msg;};

[] call SOCK_fnc_updateRequest;
[localize "STR_Session_SyncData",5,"blue"] call RPG_Fnc_Msg;
[localize "STR_Session_SyncData1",5,"blue"] call RPG_Fnc_Msg;
createDialog "life_synced_phone";
[] spawn {
    life_session_time = true;
    sleep (5 * 60);
    life_session_time = false;
};
