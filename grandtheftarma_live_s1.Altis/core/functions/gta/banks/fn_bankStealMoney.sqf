/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private ["_money", "_bank", "_vault"];
_money = [_this, 0, objNull, [objNull]] call GTA_fnc_param;
_bank = [_this, 1, "", [""]] call GTA_fnc_param;
_vault = [_this, 2, "", [""]] call GTA_fnc_param;

//--- Error checks
if (isNull _money) exitWith {};
if !([_bank, _vault] call GTA_fnc_bankCanSteal) exitWith {};
if (["moneybag", 1, life_carryWeight, life_maxWeight] call life_fnc_calWeightDiff <= 0) exitWith {titleText ["Not enough space in inventory", "PLAIN"]};

//--- Steal action
if ([15 + random 5, "Stealing Money", nil, {!isNull _this}, _money] call GTA_fnc_action) then {
  //--- Money doesn't exist
  if (isNull _money) exitWith {};

  //--- Delete money
  deleteVehicle _money;

  //--- Add money bag
  [true, "moneybag", 1] call life_fnc_handleInv;

  //--- XP
  ["banksafe", "Dirty Money"] call GTA_fnc_addExp;
} else {
  titleText ["Interrupted", "PLAIN"];
};
