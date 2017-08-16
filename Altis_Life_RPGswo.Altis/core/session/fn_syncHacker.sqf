/*
	Copyright © 2013 Bryan "Tonic" Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
	File: fn_syncData.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Used for player manual sync to the server.
*/
_fnc_scriptName = "Player Synchronization";
private["_exit"];
if(isNil "DWEV_session_time") then {DWEV_session_time = false;};
if(DWEV_session_time) exitWith {hint "";};
/*
switch (typeName DWEV_fnc_MP_packet) do
{
	case "ARRAY":
	{
		if(count DWEV_fnc_MP_packet == 0) exitWith
		{
			_exit = true;
		};
	};
	
	default {_exit = true;};
};

if(!isNil "_exit") exitWith {hint "Ein Cheater hat das BIS Framework beschädigt und raubt dir nun den Spaß an unserer Mission.\n\nWenn du denkst dies ist nur ein Fehler, versuch es in einer Minute erneut.";};
*/

[] call SOCK_fnc_updateRequest;
//hint "Synchronisiere Daten.\n\nBitte warte 20 sekunden bevor du ausloggst.";
[] spawn
{
	DWEV_session_time = true;
	sleep 1;
	DWEV_session_time = false;
};
	