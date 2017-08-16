#include "..\script_macros.hpp"
/*
	File: fn_bankDeposit.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Figure it out.
*/
private "_value";
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call ES_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > ES_cash) exitWith {hint localize "STR_ATM_NotEnoughCash"};

ES_cash = ES_cash - _value;
ES_atmbank = ES_atmbank + _value;

hint format[localize "STR_ATM_DepositMSG",[_value] call ES_fnc_numberText];

_toLog = format ["Name: %1 (%2) %3 $ auf Konto eingezahlt", player getVariable["realname",name player], getPlayerUID player, [_value] call ES_fnc_numberText];
["DEPOSIT_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];

[] call ES_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;