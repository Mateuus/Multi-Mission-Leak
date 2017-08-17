#include "..\..\script_macros.hpp"
/*
    File: fn_syncData.sqf
    Author: Bryan "Tonic" Boardwine"

    Description:
    Used for player manual sync to the server.
*/
_fnc_scriptName = "Player Synchronization";
if (isNil "life_session_time") then {life_session_time = false;};
if (life_session_time) exitWith {[localize "STR_Session_SyncdAlready",true,"slow"] call life_fnc_notificationSystem;};

[] call SOCK_fnc_updateRequest;
//[localize "STR_Session_SyncData",true,"slow"] call life_fnc_notificationSystem;
["Data has been saved..",false,"slow"] call life_fnc_notificationSystem;
[] spawn {
    life_session_time = true;
    sleep (5 * 60);
    life_session_time = false;
};
