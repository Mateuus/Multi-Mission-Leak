// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private["_val"];

_val = parseNumber(ctrlText 2702);

if( _val <= 0 ) exitWith {};
if(_val > XY_CA) exitWith {hint localize "STR_NOTF_NotEnoughMoney"};
if( _val < 100 ) exitWith {hint "Du musst mindestens 100€ abheben"};

XY_CC = XY_CC + _val;
XY_CA = XY_CA - _val;
[0] call XY_fnc_updatePartial;

[getPlayerUID player, 3, format ["Hat %1€ abgehoben", [_val] call XY_fnc_numberText ]] remoteExec ["XYDB_fnc_log", XYDB];

hint format [localize "STR_ATM_WithdrawSuccess",[_val] call XY_fnc_numberText];

closeDialog 0;