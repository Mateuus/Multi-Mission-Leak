#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pulls up the menu and creates the gang?
*/
private["_gangName","_length","_badChar","_chrByte","_allowed"];
disableSerialization;

_gangName = ctrlText (getControl(2520,2522));
_length = count (toArray(_gangName));
_chrByte = toArray (_gangName);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_ ");
if(_length > 32) exitWith {hint localize "STR_GNOTF_Over32"};
_badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} foreach _chrByte;
if(_badChar) exitWith {hint localize "STR_GNOTF_IncorrectChar";};
if(_gangName == "Dein Gang Name") exitWith {hint "Dieser Name ist standardmäßig nicht verfügbar, da müsst ihr euch schon etwas eigenes einfallen lassen."};
if(life_beatbankgeld < (__GETC__(life_gangPrice))) exitWith {hint format[localize "STR_GNOTF_NotEnoughMoney",[((__GETC__(life_gangPrice))-life_beatbankgeld)] call life_fnc_numberText];};
life_action_gangInUse = true;

[player,getPlayerUID player,_gangName] remoteExec ["SOA_fnc_insertGang",2];
hint localize "STR_NOTF_SendingData";
closeDialog 0;