/*
	File: fn_removeMoney.sqf
	Author: Blackd0g

	Description:
	remove a specific amount of the bank/cash $ from the plyer

	Usage:
*/
private ["_mode","_value","_ATM_or_Cash"];
_mode = param [0,false,[false]]; // true = percent, false = fix money amount
_value = param [1,0,[0]]; // value or percent eg. 3 or 50000
_ATM_or_Cash = param [2,false,[false]]; // ATM or Cash
if(_value isEqualTo 0) exitWith {}; // error check
if (BankHeistState != -1) exitWith {}; // no remove for the bank heist team

switch (_ATM_or_Cash) do
{
	case true: // BANK
	{
		if(_value > lhm_atmcash) exitWith {};
		if(_mode) then { // percent
			if(_value > 100) then {_value = 100;};
			lhm_atmcash = lhm_atmcash - round(lhm_atmcash * (_value / 100));
			if(lhm_atmcash < 0) then {lhm_atmcash = 0;};
		} else { // fix amount
			lhm_atmcash = lhm_atmcash - round _value;
			if(lhm_atmcash < 0) then {lhm_atmcash = 0;};
		};
	};

	case false: // CASH
	{
		if(_value > lhm_cash) exitWith {};
		if(_mode) then { // percent
			if(_value > 100) then {_value = 100;};
			lhm_cash = lhm_cash - round(lhm_cash * (_value / 100));
			if(lhm_cash < 0) then {lhm_cash = 0;};
		} else { // fix amount
			lhm_cash = lhm_cash - round _value;
			if(lhm_cash < 0) then {lhm_cash = 0;};
		};
	};
};

[1] call sock_fnc_updatePartial; // request update to database