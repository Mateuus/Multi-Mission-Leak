#include "..\script_macros.hpp"
/*
	Bryan "Tonic" Boardwine
	
	Description:
	Withdraws money from the players account
*/
private["_val"];
_val = parseNumber(ctrlText 2702);
if(_val > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call ES_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > ES_atmbank) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
if(_val < 100 && ES_atmbank > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.

ES_cash = ES_cash + _val;
ES_atmbank = ES_atmbank - _val;

hint format [localize "STR_ATM_WithdrawSuccess",[_val] call ES_fnc_numberText];
[] call ES_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;

_toLog = format ["Name: %1 (%2) %3 $ seinem Bankkonto abgebucht", player getVariable["realname",name player], getPlayerUID player, [_val] call ES_fnc_numberText];
["DEPOSIT_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];