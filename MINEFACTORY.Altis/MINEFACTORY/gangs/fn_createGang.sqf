#include "..\..\script_macros.hpp"
/*
	File: fn_createGang.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pulls up the menu and creates the gang?
*/
private["_gangName","_length","_badChar","_chrByte","_allowed"];
disableSerialization;

_gangName = ctrlText (CONTROL(2520,2522));
_length = count (toArray(_gangName));
_chrByte = toArray (_gangName);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_ ");
if(_length > 32) exitWith {hint  "Dein Gang Name kann nicht länger als 32 Zeichen sein."};
_badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} foreach _chrByte;
if(_badChar) exitWith {hint  "Du hast ein ungültiges Zeichen in deinem Gang Namen. Der Name darf nur aus Zahlen und Buchstaben sowie einem Unterstrich bestehen";};
if(BANK < (LIFE_SETTINGS(getNumber,"gang_price"))) exitWith {hint format[ "Du hast nicht genug Geld auf deinem Bankkonto.\n\nDir fehlen: $%1",[((LIFE_SETTINGS(getNumber,"gang_price")) - BANK)] call life_fnc_numberText];};

if(life_HC_isActive) then {
	[player,getPlayerUID player,_gangName] remoteExec ["HC_fnc_insertGang",HC_Life];
} else {
	[player,getPlayerUID player,_gangName] remoteExec ["TON_fnc_insertGang",RSERV];
};

hint  "Sende Informationen an den Server, bitte warten.....";
closeDialog 0;
life_action_gangInUse = true;