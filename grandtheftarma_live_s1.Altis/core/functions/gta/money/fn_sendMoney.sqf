/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [
  ["_target", objNull, [objNull]],
  ["_value", 0, [0]],
  ["_wire", false, [true]]
];

//--- Error checks
if (
  isNull _target
  || {!isPlayer _target}
  || {_value <= 0}
) exitWith {false};

//--- Check wire min and max limits
if (_wire && (_value < 10000 || {_value > 999999})) exitWith {
  [
    1,
    ["STR_GTA_MONEY_WIRELIMIT_MIN", "STR_GTA_MONEY_WIRELIMIT_MAX"] select (_value > 999999),
    ["Error", "#ff0000"]
  ] call GTA_fnc_broadcast;
  false
};

//--- Check balance
if ((_wire && {GTA_money_bank < _value}) || {!_wire && {GTA_money_cash < _value}}) exitWith {false};

//--- Update money
if (_wire) then {
  GTA_money_bank = GTA_money_bank - _value;
  [1] call GTA_fnc_updatePlayerPartial;
} else {
  GTA_money_cash = GTA_money_cash - _value;
  [0] call GTA_fnc_updatePlayerPartial;
};

//--- Send to target
[_money, _wire, profileName, name _target] remoteExec ["GTA_fnc_receiveMoney", _target];

//--- Hint
hint parseText (format [localize (["STR_GTA_MONEY_SEND_HAND", "STR_GTA_MONEY_SEND_WIRE"] select _wire), name _target, [_value] call life_fnc_numberText]);

true
