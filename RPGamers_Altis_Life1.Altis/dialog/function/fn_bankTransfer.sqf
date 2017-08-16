#include "..\..\script_macros.hpp"
/*
    File: fn_bankTransfer.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Figure it out again.
*/
private ["_value","_unit","_tax"];
_value = parseNumber(ctrlText 2702);
_unit = call compile format ["%1",(lbData[2703,(lbCurSel 2703)])];
if (isNull _unit) exitWith {};
if ((lbCurSel 2703) isEqualTo -1) exitWith {[localize "STR_ATM_NoneSelected",5,"gray"] call RPG_Fnc_Msg;};
if (isNil "_unit") exitWith {[localize "STR_ATM_DoesntExist",5,"gray"] call RPG_Fnc_Msg;};
if (_value > 999999) exitWith {[localize "STR_ATM_TransferMax",5,"gray"] call RPG_Fnc_Msg;};
if (_value < 0) exitWith {};
if (!([str(_value)] call TON_fnc_isnumber)) exitWith {[localize "STR_ATM_notnumeric",5,"gray"] call RPG_Fnc_Msg;};
if (_value > BANK) exitWith {[localize "STR_ATM_NotEnoughFunds",5,"gray"] call RPG_Fnc_Msg;};
_tax = _value * LIFE_SETTINGS(getNumber,"bank_transferTax");
if ((_value + _tax) > BANK) exitWith {[format [localize "STR_ATM_SentMoneyFail"],5,"gray"] call RPG_Fnc_Msg; [format [localize "STR_ATM_SentMoneyFail1",_value,_tax],5,"gray"] call RPG_Fnc_Msg;};

BANK = BANK - (_value + _tax);

[_value,profileName] remoteExecCall ["life_fnc_wireTransfer",_unit];
[] call life_fnc_atmMenu;
[1] call SOCK_fnc_updatePartial;
[format [localize "STR_ATM_SentMoneySuccess",[_value] call life_fnc_numberText,_unit getVariable ["realname",name _unit]],5,"blue"] call RPG_Fnc_Msg;
[format [localize "STR_ATM_SentMoneySuccess1",[_tax] call life_fnc_numberText],5,"blue"] call RPG_Fnc_Msg;


if (LIFE_SETTINGS(getNumber,"player_moneyLog") isEqualTo 1) then {
    if (LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        money_log = format [localize "STR_DL_ML_transferredBank_BEF",_value,_unit getVariable ["realname",name _unit],[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    } else {
        money_log = format [localize "STR_DL_ML_transferredBank",profileName,(getPlayerUID player),_value,_unit getVariable ["realname",name _unit],[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];
    };
    publicVariableServer "money_log";
};
