/*
    File: fn_syncData.sqf
    Author: Bryan "Tonic" Boardwine"

    Description:
    Used for player manual sync to the server.
*/
private["_exit"];

if( time - XY_lastSave < 300 ) exitWith {
    hint localize "STR_Session_SyncdAlready";
};
XY_lastSave = time;

[] call XY_fnc_updateRequest;
hint localize "STR_Session_SyncData";