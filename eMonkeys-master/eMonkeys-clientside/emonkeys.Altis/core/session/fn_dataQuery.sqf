/*
	File: fn_dataQuery.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the 'authentication' process and sends a request out to
	the server to check for player information.
*/
private["_uid","_side","_sender"];
if(eM_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
_sender = player;
_uid = getPlayerUID _sender;
_side = playerSide;


[format["<t align='center' shadow='1' size='1.2'>Empfange Spielerinformationen... UID [%1]</t>",_uid],(findDisplay 38210) displayCtrl 3400, 1] call EMonkeys_fnc_updateDialogText;

[[_uid,_side,_sender],"DB_fnc_queryRequest",false,false] call EMonkeys_fnc_MP;