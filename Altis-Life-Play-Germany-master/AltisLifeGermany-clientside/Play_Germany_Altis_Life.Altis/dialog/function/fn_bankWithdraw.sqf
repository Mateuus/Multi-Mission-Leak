#include <macro.h>
/*
	Bryan "Tonic" Boardwine

	Description:
	Withdraws money from the players account
*/
private["_val"];
_val = parseNumber(ctrlText 2702);
if(isNil "PG_bank") exitWith {hint "Glückwunsch! Du hast einen so schwerwiegenden Fahler bekommen, dass du reconnecten musst. SRY";};
if(isNil "PG_cash") exitWith {hint "Glückwunsch! Du hast einen so schwerwiegenden Fahler bekommen, dass du reconnecten musst. SRY";};
if(_val > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > BANK) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
if(_val < 100 && BANK > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.

ADD(CASH,_val);
SUB(BANK,_val);
hint format [localize "STR_ATM_WithdrawSuccess",[_val] call life_fnc_numberText];
[] spawn life_fnc_atmMenu;
[] call life_fnc_hudUpdate;