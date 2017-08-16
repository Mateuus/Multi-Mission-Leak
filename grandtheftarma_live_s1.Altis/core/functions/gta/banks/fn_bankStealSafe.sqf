/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private ["_safe", "_bank", "_vault", "_bags"];
_safe = [_this, 0, objNull, [objNull]] call GTA_fnc_param;
_bank = [_this, 1, "", [""]] call GTA_fnc_param;
_vault = [_this, 2, "", [""]] call GTA_fnc_param;
_bags = _safe getVariable ["safe_bags", 5];

//--- Error checks
if (isNull _safe) exitWith {};
if !([_bank, _vault] call GTA_fnc_bankCanSteal) exitWith {};
if (["moneybag", 1, life_carryWeight, life_maxWeight] call life_fnc_calWeightDiff <= 0) exitWith {titleText ["Not enough space in inventory", "PLAIN"]};

//--- Steal action
_safe setVariable ["safe_thief", player, true];
if ([25, "Stealing Money", nil, {!isNull _this && {(_this getVariable ["safe_thief", objNull]) in [player, objNull]}}, _safe] call GTA_fnc_action) then {
  //--- Delete safe if empty
  if (_bags == 1) then {
    deleteVehicle _safe;
  } else {
    //--- Set number of bags
    _safe setVariable ["safe_bags", _bags - 1, true];
  };

  //--- Add money bag
  [true, "moneybag", 1] call life_fnc_handleInv;

  //--- XP
  ["banksafe", "Safe Cracker"] call GTA_fnc_addExp;
} else {
  titleText ["Interrupted", "PLAIN"];
};

//--- Reset thief
if ((_safe getVariable ["safe_thief", objNull]) in [player, objNull]) then {
  _safe setVariable ["safe_thief", nil, true];
};
