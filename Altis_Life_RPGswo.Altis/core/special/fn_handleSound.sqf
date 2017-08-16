/*
File: fn_handleSound.sqf
Auhtor: MarkusSR1984

Description:
Verarbeitet den Sound im Spiel
*/

_time = param [0,1,[0]];
_volume = param [1,0.7,[0]];
DWEV_soundHandler = false;
_time fadeSound _volume;
sleep 0.5;
DWEV_soundHandler = true;



while {true} do 
{
	_time fadeSound _volume;
	sleep 0.3;
	if (!DWEV_soundHandler) exitWith {};
};