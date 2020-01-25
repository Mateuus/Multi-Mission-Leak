#include <macro.h>
/*
	
	
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
if(cash_in_bank < (__GETC__(life_gangPrice))) exitWith {hint format[localize "STR_GNOTF_NotEnoughMoney",[((__GETC__(life_gangPrice))-cash_in_bank)] call life_fnc_numberText];};

[player,getPlayerUID player,_gangName] remoteExec ["TON_fnc_insertGang",(call life_fnc_HCC)];
hint localize "STR_NOTF_SendingData";
closeDialog 0;
life_action_gangInUse = true;