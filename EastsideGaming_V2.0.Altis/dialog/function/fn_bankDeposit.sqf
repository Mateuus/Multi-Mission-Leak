#include "..\..\script_macros.hpp"
/*
    File: fn_bankDeposit.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Figure it out.
*/
private ["_value"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(ESG_stop_dupe)exitWith{hint "Bitte warte noch kurz!"};
if (_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if (_value <= 0) exitWith {};
if (!([str(_value)] call TON_fnc_isnumber)) exitWith {hint localize "STR_ATM_notnumeric"};
if (_value > CASH) exitWith {hint localize "STR_ATM_NotEnoughCash"};

CASH = CASH - _value;
BANK = BANK + _value;

hint format [localize "STR_ATM_DepositSuccess",[_value] call life_fnc_numberText];
_log = format["%1 (%2) hat %3$ auf sein Konto überwiesen", player getVariable["realname", name player], getPlayerUID player, [_value]call life_fnc_numberText];
["BANK_DEPOSIT_LOG", _log] remoteExecCall ["ESG_fnc_logging", 2];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;
[]spawn {
	ESG_stop_dupe = true;
	sleep 15;
	ESG_stop_dupe = false;
};