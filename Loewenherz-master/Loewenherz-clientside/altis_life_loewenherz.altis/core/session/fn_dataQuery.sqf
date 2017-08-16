/*
	File: fn_dataQuery.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the 'authentication' process and sends a request out to
	the server to check for player information.
*/
private["_uid","_side","_sender"];
if(lhm_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
_sender = player;
_uid = getPlayerUID _sender;
_side = playerSide;
["Query request sent",format[localize "STR_Session_Query",_uid]] call lhm_fnc_statusMsg;
0 cutFadeOut 999999999;

[[_uid,_side,_sender],"DB_fnc_queryRequest",false,false] call lhm_fnc_mp;
// [[_uid,_sender],"lhm_fnc_queryPos",false,false] call lhm_fnc_mp; // Get Players Position