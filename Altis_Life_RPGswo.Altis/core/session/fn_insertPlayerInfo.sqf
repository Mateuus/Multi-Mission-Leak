/*
	File: fn_insertPlayerInfo.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Read the file name... Explains it.
*/
if(DWEV_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
cutText["Der Server findet keine daten über dich, versuche dich zu finden.","BLACK FADED"];
0 cutFadeOut 9999999;

[getPlayerUID player,profileName,dwf_cash,dwf_atmcash,player] remoteExec ["DB_fnc_insertRequest",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];



