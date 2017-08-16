#include "..\..\script_macros.hpp"
/*
    File: fn_bankWithdraw.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Withdraws money from the players account
*/
private ["_value"];
if(ESG_stop_dupe)exitWith{hint "Bitte warte noch kurz!"};
_value = parseNumber(ctrlText 2702);
if (_value > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if (_value < 0) exitWith {};
if (!([str(_value)] call TON_fnc_isnumber)) exitWith {hint localize "STR_ATM_notnumeric"};
if (_value > BANK) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
if (_value < 100 && BANK > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.

CASH = CASH + _value;
BANK = BANK - _value;
hint format [localize "STR_ATM_WithdrawSuccess",[_value] call life_fnc_numberText];
_log = format["%1 (%2) hat %3 von seinem Konto abgehoben", player getVariable["realname", name player], getPlayerUID player, [_value]call life_fnc_numberText];
["BANK_WITHDRAW_LOG", _log] remoteExecCall ["ESG_fnc_logging", 2];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;
[]spawn {
	ESG_stop_dupe = true;
	sleep 15;
	ESG_stop_dupe = false;
};