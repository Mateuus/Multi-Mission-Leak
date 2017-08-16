#include <macro.h>
/*
	File: fn_bankDeposit.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Figure it out.
*/
private["_value"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(isNil "PG_bank") exitWith {hint "Glückwunsch! Du hast einen so schwerwiegenden Fahler bekommen, dass du reconnecten musst. SRY";};
if(isNil "PG_cash") exitWith {hint "Glückwunsch! Du hast einen so schwerwiegenden Fahler bekommen, dass du reconnecten musst. SRY";};
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > CASH) exitWith {hint localize "STR_ATM_NotEnoughCash"};

CASH = CASH - _value;
BANK = BANK + _value;

hint format[localize "STR_ATM_DepositMSG",[_value] call life_fnc_numberText];
[] call life_fnc_hudUpdate;
[] spawn life_fnc_atmMenu;