/*
	COPY PASTE TIME
*/
private["_val"];
_val = parseNumber(ctrlText 2702);
if(_val > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call tanoarpg_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > life_atmcash) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
if(_val < 100 && life_atmcash > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.

life_cash = life_cash + _val;
life_atmcash = life_atmcash - _val;

hint format [localize "STR_ATM_WithdrawSuccess",[_val] call tanoarpg_fnc_numberText];
[] call tanoarpg_fnc_atmMenu;
[6] call XAS_fnc_updatePartial;
[player, player, _val, "WITHDRAW", life_atmcash, life_cash] remoteExec ["TEX_fnc_handleDBLog", 2];