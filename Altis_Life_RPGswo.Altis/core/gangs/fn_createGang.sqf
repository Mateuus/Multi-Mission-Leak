#include "..\..\macros.hpp"
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
if(_length > 32) exitWith {hint "Es sind maximal 32 Zeichen beim Gangnamen erlaubt."};
_badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} foreach _chrByte;
if(_badChar) exitWith {hint "Es sind nur Zahlen, Buchstaben und Unterstriche im Gangnamen erlaubt.";};

_gangTag = ctrlText (getControl(2520,2524));
_length = count (toArray(_gangTag));
_chrByte = toArray (_gangTag);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890");
if((_length < 2) || (_length > 5)) exitWith {hint "Es sind mindestens 2 und maximal 5 Zeichen erlaubt."};
_badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} foreach _chrByte;
if(_badChar) exitWith {hint "Es sind nur Zahlen und Buchstaben im Gangtag erlaubt.";};

if(dwf_atmcash < (__GETC__(DWEV_gangPrice))) exitWith {hint format["Du hast nicht genug Geld auf deiner Bank.\n\nDir fehlen: %1€",[((__GETC__(DWEV_gangPrice))-dwf_atmcash)] call DWEV_fnc_numberText];};

[player,getPlayerUID player,_gangName,_gangTag] remoteExec ["DWF_fnc_insertGang",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})]; // Kein remoteExec
hint "Sende Informationen an den Server, bitte warten.....";
closeDialog 0;
DWEV_action_gangInUse = true;