// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

if( (lbCurSel 2401) < 0 ) exitWith {};

private _type = lbData[2401, (lbCurSel 2401)];
private _price = lbValue[2401, (lbCurSel 2401)];
private _amount = ctrlText 2404;

if( !([_amount] call XY_fnc_isnumber) ) exitWith {
    hint "Du musst eine Zahl eingeben";
};
_amount = parseNumber(_amount);

_price = _price * _amount;

private _config = [_type] call XY_fnc_itemConfig;
if( XY_carryWeight + ((_config select 1) * _amount) > XY_maxWeightCurrent ) exitWith {
    hint "So viel Platz hast du nicht";
};

if( !([_price] call XY_fnc_pay) ) exitWith {
    hint localize "STR_NOTF_NotEnoughMoney"
};

[true, _type, _amount] call XY_fnc_handleInv;

hint format[ "Gekauft: %1x %2 für %3€", _amount, _config select 2, [_price] call XY_fnc_numberText ];
[ getPlayerUID player, 14, format [ "Kauft %1x %2 (%3€)", _amount, _config select 2, [_price] call XY_fnc_numberText ] ] remoteExec ["XYDB_fnc_log", XYDB];

XY_forceSaveTime = time + 8;

[] call XY_fnc_virtualShopUpdate;