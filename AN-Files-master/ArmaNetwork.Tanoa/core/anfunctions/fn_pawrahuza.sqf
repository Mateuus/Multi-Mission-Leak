#include <macro.h>
/*
	File: fn_syncData.sqf
	Author: Bryan "Tonic" Boardwine"
	Description:
	Used for player manual sync to the server.
*/
if(diag_tickTime < (life_session_time + (5 * 60))) exitWith {["SyncAlready"] call life_fnc_notificationHandler;};
call life_fnc_kecedretr;
["SyncDone"] call life_fnc_notificationHandler;
life_session_time = diag_tickTime;
