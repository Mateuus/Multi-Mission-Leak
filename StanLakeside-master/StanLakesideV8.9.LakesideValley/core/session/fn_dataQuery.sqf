/*
	File: fn_dataQuery.sqf
	
	
	Description:
	Starts the 'authentication' process and sends a request out to
	the server to check for player information.
*/
private["_uid","_side","_sender"];
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
_uid = getPlayerUID player;
_side = playerSide;
[format[localize "STR_Session_Query",_uid],false] spawn domsg;

[_uid,_side,player] remoteExecCall ["DB_fnc_queryRequest",(call life_fnc_HCC)];