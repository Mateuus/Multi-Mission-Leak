#include "..\..\script_macros.hpp"
/*
	File: fn_bankWithdraw.sqf
	Bryan "Tonic" Boardwine

	Description:
	Withdraws money from the players account
*/
private ["_value"];
_value = parseNumber(ctrlText 2702);
if (_value > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if (_value < 0) exitWith {};
if (!([str(_value)] call TON_fnc_isnumber)) exitWith {hint localize "STR_ATM_notnumeric"};
if (_value > BANK) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
if (_value < 100 && BANK > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.

CASH = CASH + _value;
BANK = BANK - _value;
hint format [localize "STR_ATM_WithdrawSuccess",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;

_playerID = getPlayerUID player;
_playerName = name player;
_type = 4;
_amount = _value;
_cashAct = [life_cash]call life_fnc_numberText;
_bankAct = [life_atmbank]call life_fnc_numberText;
[_playerID,_playerName,"","",_type,_amount,_cashAct,_bankAct] remoteExecCall ["TON_fnc_moneyLog", (call life_fnc_HCC)];