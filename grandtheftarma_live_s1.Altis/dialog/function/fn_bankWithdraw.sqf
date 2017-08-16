private "_val";
_val = parseNumber ctrlText 2702;
if (_val > 999999) exitWith {hint localize "STR_ATM_WithdrawMax"};
if (_val < 0) exitwith {};
if (!([str(_val)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if (_val > GTA_money_bank) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
if (_val < 100) exitWith {hint localize "STR_ATM_WithdrawMin"};

GTA_money_cash = GTA_money_cash + _val;
GTA_money_bank = GTA_money_bank - _val;
[6] call GTA_fnc_updatePlayerPartial;

hint format [localize "STR_ATM_WithdrawSuccess", [_val] call life_fnc_numberText];
[] call life_fnc_atmMenu;
