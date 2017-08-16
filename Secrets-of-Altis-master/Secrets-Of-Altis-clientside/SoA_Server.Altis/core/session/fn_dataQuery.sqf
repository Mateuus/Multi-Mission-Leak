/*
	File: fn_dataQuery.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the 'authentication' process and sends a request out to
	the server to check for player information.
*/
private["_uid","_side","_sender"];
disableSerialization;
if(life_session_completed) exitWith {};
_sender = player;
_uid = getPlayerUID _sender;
_side = playerSide;

if(_side != civilian) then {[_sender,_side] remoteExecCall ["DB_fnc_protocol",2]};
[_sender] remoteExecCall ["DB_fnc_kennzeichen",2];
[_sender,_uid] remoteExecCall ["DB_fnc_getnumber",2];
[_sender] remoteExecCall ["DB_fnc_version",2];
[_uid,_side,_sender] remoteExec ["DB_fnc_queryRequest",2];