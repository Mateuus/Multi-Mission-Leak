// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0
private["_value"];

_value = parseNumber(ctrlText 2702);

if( _value <= 0 ) exitWith {};
if( _value > XY_CC ) exitWith {
    hint localize "STR_NOTF_NotEnoughMoney"
};
if( _value < 100 ) exitWith { 
    hint "Du musst mindestens 100€ einzahlen" 
};

XY_CC = XY_CC - _value;
XY_CA = XY_CA + _value;
[0] call XY_fnc_updatePartial;

[getPlayerUID player, 4, format ["Hat %1€ eingezahlt", [_value] call XY_fnc_numberText ]] remoteExec ["XYDB_fnc_log", XYDB];

hint format[localize "STR_ATM_DepositMSG", [_value] call XY_fnc_numberText];

closeDialog 0;