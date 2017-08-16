/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

#define MAX_DISTANCE 2

params [
  ["_money", objNull, [objNull]]
];

//--- Errror checks
if (isNull _money || {player distance _money > MAX_DISTANCE}) exitWith {};

//--- Get value
private _value = _money getVariable "item";
if (isNil "_value") exitWith {};
_value = _value select 1;

//--- Action
if ([2 + random 3, "Picking up Money", nil, {!isNull _this && {player distance _this <= MAX_DISTANCE}}, _money] call GTA_fnc_action) then {
  //--- After action error checks
  if (isNull _money) exitWith {};

  //--- Delete the money pile
  deleteVehicle _money;

  //--- Limit the cash amount
  _value = _value min 500000;

  //--- On screen message
  titleText [format [localize "STR_NOTF_PickedMoney", [_value] call life_fnc_numberText], "PLAIN"];

  //--- Add money
  GTA_money_cash = GTA_money_cash + _value;
};
