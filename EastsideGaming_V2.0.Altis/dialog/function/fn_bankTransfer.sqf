#include "..\..\script_macros.hpp"
/*
    File: fn_bankTransfer.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Figure it out again.
*/
private ["_value","_unit","_tax"];
if(ESG_stop_dupe)exitWith{hint "Bitte warte noch kurz!"};
_value = parseNumber(ctrlText 1401);
_unit = call compile format ["%1",(lbData[2703,(lbCurSel 2703)])];
if (isNull _unit) exitWith {};
if ((lbCurSel 2703) isEqualTo -1) exitWith {hint localize "STR_ATM_NoneSelected"};
if (isNil "_unit") exitWith {hint localize "STR_ATM_DoesntExist"};
if (_value > 999999) exitWith {hint localize "STR_ATM_TransferMax";};
if (_value <= 0) exitWith {};
if (!([str(_value)] call TON_fnc_isnumber)) exitWith {hint localize "STR_ATM_notnumeric"};
if (_value > BANK) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
_tax = _value * LIFE_SETTINGS(getNumber,"bank_transferTax");
if ((_value + _tax) > BANK) exitWith {hint format [localize "STR_ATM_SentMoneyFail",_value,_tax]};
if(_tax >= 1)then {
	BANK = BANK - (_value + _tax);
}else{
	_tax = 1;
};

[_value,profileName] remoteExecCall ["life_fnc_wireTransfer",_unit];
[] call life_fnc_atmMenu;
[1] call SOCK_fnc_updatePartial;
hint format [localize "STR_ATM_SentMoneySuccess",[_value] call life_fnc_numberText,_unit getVariable ["realname",name _unit],[_tax] call life_fnc_numberText];
_log = format["%1 (%2) hat %3 (%4) %5$ überwiesen.", player getVariable["realname", name player], getPlayerUID player, _unit getVariable["realname", name _unit], getPlayerUID _unit, [_value]call life_fnc_numberText];
["BANK_TRANSFER_LOG", _log] remoteExecCall ["ESG_fnc_logging", 2];
[]spawn {
	ESG_stop_dupe = true;
	sleep 15;
	ESG_stop_dupe = false;
};