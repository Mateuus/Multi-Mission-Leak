/*
	File: fn_bankDeposit.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Figure it out.
*/
private["_value"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call lhm_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > lhm_cash) exitWith {hint localize "STR_ATM_NotEnoughCash"};

lhm_cash = lhm_cash - _value;
lhm_atmcash = lhm_atmcash + _value;

hint format[localize "STR_ATM_DepositMSG",[_value] call lhm_fnc_numberText];
[] call lhm_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;