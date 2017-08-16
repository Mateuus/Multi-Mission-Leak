#include "..\script_macros.hpp"
/*
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
if(_length > 32) exitWith {hint localize "STR_GNOTF_Over32"};
_badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} foreach _chrByte;
if(_badChar) exitWith {hint localize "STR_GNOTF_IncorrectChar";};
if(ES_atmbank < (ES_SETTINGS(getNumber,"gang_price"))) exitWith {hint format[localize "STR_GNOTF_NotEnoughMoney",[((ES_SETTINGS(getNumber,"gang_price")) - ES_atmbank)] call ES_fnc_numberText];};

[player,getPlayerUID player,_gangName] remoteExec ["ES_fnc_insertGang",2];
hint localize "STR_NOTF_SendingData";
closeDialog 0;
ES_action_gangInUse = true;

["GangErstellen"] call ES_fnc_xp_add;