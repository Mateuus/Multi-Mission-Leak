/*
	File: fn_insertPlayerInfo.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Read the file name... Explains it.
*/
if(life_session_completed) exitWith {};
//cutText[localize "STR_Session_QueryFail","BLACK FADED"];
//0 cutFadeOut 9999999;
life_newplayer = true;

[getPlayerUID player,profileName,life_beatgeld,life_beatbankgeld,life_exp,player] remoteExecCall ["DB_fnc_insertRequest",2];