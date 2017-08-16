/*
	File: fn_syncData.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Used for player manual sync to the server.
*/
_fnc_scriptName = "Player Synchronization";
private["_exit"];
if(isNil "EMonkeys_session_time") then {EMonkeys_session_time = false;};
if (eM_paintball) exitWith {};
if(EMonkeys_session_time) exitWith {hint "Sie haben bereits synchronisiert, bitte versuchen Sie es in etwa 5 Minuten erneut.";};


if(!isNil "_exit") exitWith {hint "Because of some cheater corrupting the BIS MP Framework they have stopped you from enjoying our mission.\n\nYou can try this again in a minute if you feel it is a mistake.";};

[] call SOCK_fnc_updateRequest;
hint "Spielerdaten werden mit der Datenbank synchronisiert. \n\nBitte warten Sie 20 Sekunden bevor Sie sich ausloggen.";
[] spawn
{
	EMonkeys_session_time = true;
	uisleep (5 * 60);
	EMonkeys_session_time = false;
};
	