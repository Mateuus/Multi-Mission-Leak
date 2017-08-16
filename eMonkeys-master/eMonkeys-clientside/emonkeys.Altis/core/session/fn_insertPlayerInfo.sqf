/*
	File: fn_insertPlayerInfo.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Read the file name... Explains it.
*/
_mode = [_this,0,0,[1]] call BIS_fnc_param;
if(eM_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...

//Text im Lade Bildschirm
["<t align='center' shadow='1' size='1.2'>Der Server hat keine Informationen zu deiner UID finden können, versuche neuen Spieler zu erstellen</t>",(findDisplay 38210) displayCtrl 3400, 1] call EMonkeys_fnc_updateDialogText;

switch (_mode) do
{
	case 0: {[[getPlayerUID player,profileName,EMonkeys_c164,EMonkeys_a164,player],"DB_fnc_insertRequest",false,false] call EMonkeys_fnc_mp;};
	case 1: {[[getPlayerUID player,profileName,EMonkeys_c164,EMonkeys_a164,player],"DB_fnc_insertRequest",false,false] call EMonkeys_fnc_mp; eM_StartTutorial = true;};
};