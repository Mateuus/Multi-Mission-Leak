/*
	COPY PASTE TIME
*/
private["_val"];
_val = parseNumber(ctrlText 2702);
if(_val > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call lhm_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > lhm_atmcash) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
if(_val < 100 && lhm_atmcash > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.

lhm_cash = lhm_cash + _val;
lhm_atmcash = lhm_atmcash - _val;
hint format [localize "STR_ATM_WithdrawSuccess",[_val] call lhm_fnc_numberText];
[] call lhm_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;