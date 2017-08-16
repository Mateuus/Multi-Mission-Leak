#include "..\..\script_macros.hpp"
/*
    File: fn_createGang.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Pulls up the menu and creates the gang with the name the user enters in.
*/
private ["_gangName","_length","_badChar","_chrByte","_allowed"];
disableSerialization;

_gangName = ctrlText (CONTROL(2520,2522));
_length = count (toArray(_gangName));
_chrByte = toArray (_gangName);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_ ");
if (_length > 32) exitWith {hint localize "STR_GNOTF_Over32"};
_badChar = false;
{if (!(_x in _allowed)) exitWith {_badChar = true;};} forEach _chrByte;
if (_badChar) exitWith {hint localize "STR_GNOTF_IncorrectChar";};
if (BANK < 150000) exitWith {hint format [localize "STR_GNOTF_NotEnoughMoney",[(150000 - BANK)] call life_fnc_numberText];};

[player,getPlayerUID player,_gangName] remoteExec ["TON_fnc_insertGang",RSERV];

hint localize "STR_NOTF_SendingData";
closeDialog 0;
life_action_gangInUse = true;
