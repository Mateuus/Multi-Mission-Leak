#include "..\..\script_macros.hpp"
/*
    File: fn_gangWithdraw.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Withdraws money from the gang bank.
*/
private ["_value"];
_value = parseNumber(ctrlText 2702);
_gFund = GANG_FUNDS;
group player setVariable ["gbank_in_use_by",player,true];

//Series of stupid checks
if (_value > 999999) exitWith {[localize "STR_ATM_WithdrawMax",5,"gray"] call RPG_Fnc_Msg;};
if (_value < 0) exitWith {};
if (!([str(_value)] call TON_fnc_isnumber)) exitWith {[localize "STR_ATM_notnumeric",5,"gray"] call RPG_Fnc_Msg;};
if (_value > _gFund) exitWith {[localize "STR_ATM_NotEnoughFundsG",5,"gray"] call RPG_Fnc_Msg;};
if (_val < 100 && _gFund > 20000000) exitWith {[localize "STR_ATM_WithdrawMin",5,"gray"] call RPG_Fnc_Msg;}; //Temp fix for something.
if ((group player getVariable ["gbank_in_use_by",player]) != player) exitWith {[localize "STR_ATM_WithdrawInUseG",5,"gray"] call RPG_Fnc_Msg;}; //Check if it's in use.

_gFund = _gFund - _value;
CASH = CASH + _value;
group player setVariable ["gang_bank",_gFund,true];

if (life_HC_isActive) then {
    [1,group player] remoteExec ["HC_fnc_updateGang",HC_Life]; //Update the database.
} else {
    [1,group player] remoteExec ["TON_fnc_updateGang",RSERV]; //Update the database.
};

[format [localize "STR_ATM_WithdrawSuccessG",[_value] call life_fnc_numberText],5,"blue"] call RPG_Fnc_Msg;
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;

if (LIFE_SETTINGS(getNumber,"player_moneyLog") isEqualTo 1) then {
    if (LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        money_log = format [localize "STR_DL_ML_withdrewGang_BEF",_value,[_gFund] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    } else {
        money_log = format [localize "STR_DL_ML_withdrewGang",profileName,(getPlayerUID player),_value,[_gFund] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    };
    publicVariableServer "money_log";
};
