/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [
  ["_value", 0, [0]],
  ["_wire", false, [true]],
  ["_from", "", [""]]
];

//--- Error checks
if (_value <= 0) exitWith {};

//--- Adjust money
if (_wire) then {
  GTA_money_bank = GTA_money_bank + _value;
} else {
  GTA_money_cash = GTA_money_cash + _value;
};

//--- Update
[parseNumber _wire] call GTA_fnc_updatePlayerPartial;

//--- Hint
hint parseText (format [localize (["STR_GTA_MONEY_RECEIVED_HAND", "STR_GTA_MONEY_RECEIVED_WIRE"] select _wire), _from, [_value] call life_fnc_numberText] + localize "STR_GTA_MONEY_RECEIVED_WARNING")
