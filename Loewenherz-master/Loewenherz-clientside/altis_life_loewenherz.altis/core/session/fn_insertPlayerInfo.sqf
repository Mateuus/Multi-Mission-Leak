/*
	File: fn_insertPlayerInfo.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Read the file name... Explains it.
*/
if(lhm_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
["Insert Player",localize "STR_Session_QueryFail"] call lhm_fnc_statusMsg;
0 cutFadeOut 9999999;

[[getPlayerUID player,profileName,lhm_cash,lhm_atmcash,player],"DB_fnc_insertRequest",false,false] call lhm_fnc_mp;
diag_log "::lhm Client:: insert Request for new Player..";