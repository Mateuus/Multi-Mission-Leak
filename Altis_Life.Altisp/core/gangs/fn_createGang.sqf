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
if(_length > 32) exitWith {hint localize "STR_GNOTF_Over32"};
_badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} forEach _chrByte;
if(_badChar) exitWith {hint localize "STR_GNOTF_IncorrectChar";};
if(BANK < (LIFE_SETTINGS(getNumber,"gang_price"))) exitWith {hint format[localize "STR_GNOTF_NotEnoughMoney",[((LIFE_SETTINGS(getNumber,"gang_price")) - BANK)] call life_fnc_numberText];};

if(life_HC_isActive) then {
	[player,getPlayerUID player,_gangName] remoteExec ["HC_fnc_insertGang",HC_Life];
} else {
	[player,getPlayerUID player,_gangName] remoteExec ["TON_fnc_insertGang",RSERV];
};

if(EQUAL(LIFE_SETTINGS(getNumber,"player_advancedLog"),1)) then {
	if(EQUAL(LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging"),1)) then {
		advanced_log = format ["created a gang named: %1 for %2",_gangName,(LIFE_SETTINGS(getNumber,"gang_price"))];
	} else {
		advanced_log = format ["%1 - %2 created a gang named: %3 for %4",profileName,(getPlayerUID player),_gangName,(LIFE_SETTINGS(getNumber,"gang_price"))];
	};
	publicVariableServer "advanced_log";
};

hint localize "STR_NOTF_SendingData";
closeDialog 0;
life_action_gangInUse = true;