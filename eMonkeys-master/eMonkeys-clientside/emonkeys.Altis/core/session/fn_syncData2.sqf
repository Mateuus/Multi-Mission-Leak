/*
	File: fn_syncData.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Used for player manual sync to the server.
*/
_fnc_scriptName = "Player Synchronization";
private["_exit"];
if(isNil "EMonkeys_session_time2") then {EMonkeys_session_time2 = false;};
if (eM_paintball) exitWith {};
if(EMonkeys_session_time2) exitWith {};



if(!isNil "_exit") exitWith {hint "Because of some cheater corrupting the BIS MP Framework they have stopped you from enjoying our mission.\n\nYou can try this again in a minute if you feel it is a mistake.";};

[] call SOCK_fnc_updateRequest;

[] spawn
{
	EMonkeys_session_time2 = true;
	uisleep (2 * 60);
	EMonkeys_session_time2 = false;
};
	