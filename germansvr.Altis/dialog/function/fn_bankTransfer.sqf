#include "..\..\script_macros.hpp"
/*
    File: fn_bankTransfer.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Figure it out again.
*/
private ["_val","_unit","_tax"];
_val = parseNumber(ctrlText 2702);
_unit = call compile format ["%1",(lbData[2703,(lbCurSel 2703)])];
if (isNull _unit) exitWith {};
if ((lbCurSel 2703) isEqualTo -1) exitWith {hint localize "STR_ATM_NoneSelected"};
if (isNil "_unit") exitWith {hint localize "STR_ATM_DoesntExist"};
if (_val > 999999) exitWith {hint localize "STR_ATM_TransferMax";};
if (_val < 0) exitWith {};
if (!([str(_val)] call TON_fnc_isnumber)) exitWith {hint localize "STR_ATM_notnumeric"};
if (_val > BANK) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
_tax = _val * LIFE_SETTINGS(getNumber,"bank_transferTax");
if ((_val + _tax) > BANK) exitWith {hint format [localize "STR_ATM_SentMoneyFail",_val,_tax]};

BANK = BANK - (_val + _tax);

[_val,profileName] remoteExecCall ["life_fnc_wireTransfer",_unit];
[] call life_fnc_atmMenu;
[1] call SOCK_fnc_updatePartial;
hint format [localize "STR_ATM_SentMoneySuccess",[_val] call life_fnc_numberText,_unit getVariable ["realname",name _unit],[_tax] call life_fnc_numberText];
[player, _unit, _val, "ATM", BANK, CASH] remoteExec ["DB_fnc_handleDBLog", 2];