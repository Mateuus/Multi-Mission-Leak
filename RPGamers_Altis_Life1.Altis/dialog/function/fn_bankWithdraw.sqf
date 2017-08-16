#include "..\..\script_macros.hpp"
/*
    File: fn_bankWithdraw.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Withdraws money from the players account
*/
private ["_value"];
_value = parseNumber(ctrlText 2702);
if (_value > 999999) exitWith {[localize "STR_ATM_WithdrawMax",5,"gray"] call RPG_Fnc_Msg;};
if (_value < 0) exitWith {};
if (!([str(_value)] call TON_fnc_isnumber)) exitWith {[localize "STR_ATM_notnumeric",5,"gray"] call RPG_Fnc_Msg;};
if (_value > BANK) exitWith {[localize "STR_ATM_NotEnoughFunds",5,"gray"] call RPG_Fnc_Msg;};
if (_value < 100 && BANK > 20000000) exitWith {[localize "STR_ATM_WithdrawMin",5,"gray"] call RPG_Fnc_Msg;}; //Temp fix for something.

CASH = CASH + _value;
BANK = BANK - _value;
[format [localize "STR_ATM_WithdrawSuccess",[_value] call life_fnc_numberText],5,"blue"] call RPG_Fnc_Msg;
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;

if (LIFE_SETTINGS(getNumber,"player_moneyLog") isEqualTo 1) then {
    if (LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        money_log = format [localize "STR_DL_ML_withdrewBank_BEF",_value,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    } else {
        money_log = format [localize "STR_DL_ML_withdrewBank",profileName,(getPlayerUID player),_value,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    };
    publicVariableServer "money_log";
};
