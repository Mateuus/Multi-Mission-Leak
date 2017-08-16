/*
	File: fn_dataQuery.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the 'authentication' process and sends a request out to
	the server to check for player information.
*/
private["_uid","_side","_sender"];
if(DWEV_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
_sender = player;
_uid = getPlayerUID _sender;
_side = (side player);
cutText[format["Sende Daten an den Server für Spielerinformationen UID [%1]",_uid],"BLACK FADED"];
0 cutFadeOut 999999999;


[_uid,_side,_sender] remoteExec ["DB_fnc_queryRequest", (if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
