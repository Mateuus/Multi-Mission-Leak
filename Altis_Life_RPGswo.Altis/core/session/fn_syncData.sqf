/*
	File: fn_syncData.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Used for player manual sync to the server.
*/
_fnc_scriptName = "Player Synchronization";
private["_exit","_manuelSync"];
_manuelSync = param [0,"0",["0"]];
if(isNil "DWEV_session_time") then {DWEV_session_time = false;};
if(DWEV_session_time && _manuelSync == "0") exitWith {hint "Du hast bereits Synchronisiert, es ist nur alle 3 Minuten erlaubt.";};

[] call SOCK_fnc_updateRequest;

if(_manuelSync == "0")then
{
   hint "Synchronisiere Daten.\n\nBitte warte 20 Sekunden bevor du ausloggst.";
    [] spawn
    {
        DWEV_session_time = true;
        sleep (5 * 60);
        DWEV_session_time = false;
    };
};
	