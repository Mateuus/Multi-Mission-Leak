#include <macro.h>
/*
	File: fn_onPlayerRespawn.sqf
	
	
	Description:
	Does something but I won't know till I write it...
*/
params ["_unit"];

//Set some vars on our new body.
_unit setVariable["restrained", nil, true];
_unit setVariable["Escorting", nil, true];
_unit setVariable["transporting", nil, true]; //Again why the fuck am I setting this? Can anyone tell me?
_unit setVariable["steam64id",(getPlayerUID player), true]; //Reset the UID.
_unit setVariable["realname",profileName, true]; //Reset the players name.

_unit addRating 9999999999999999; //Set our rating to a high value, this is for a ARMA engine thing.
player playMoveNow "amovppnemstpsraswrfldnon";

//[] call life_fnc_setupActions;
[_unit,life_sidechat,playerSide] remoteExecCall ["TON_fnc_managesc",2];
player enableFatigue (__GETC__(life_enableFatigue));
player setVariable ["cash",cash_in_hand,true];
player setVariable ["bank",cash_in_bank,true];
