/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private ["_building", "_lock", "_bank", "_vault", "_cfg"];
_building = [_this, 0, objNull, [objNull]] call GTA_fnc_param;
_lock = [_this, 1, true, [true]] call GTA_fnc_param;
_bank = _building getVariable "bank";
_vault = _building getVariable "bankVault";

//--- Error checks
if (isNull _building) exitWith {};
if (isNil "_bank") exitWith {};
if (isNil "_vault") exitWith {};

//--- Vault config
_cfg = missionConfigFile >> "GTA_CfgBanks" >> _bank >> "Vaults" >> _vault;
_doors = getArray (_cfg >> "doors");

//--- Get nearest door
_door = [_building] call GTA_fnc_nearestDoor;

//--- Check nearest door is vault
if !(_door in _doors) exitWith {};

//--- Lock action
if ([30, ["Unlocking Vault", "Locking Vault"] select _lock] call GTA_fnc_action) then {
  if (_lock) then {
    //--- Lock vault doors
    _building setVariable [format ["BIS_disabled_door_%1", _door], 1, true];
    _building animate [format ["door_%1_rot", _door], 0];

    //--- Delete bank zone
    [_bank, false] call GTA_fnc_bankZone;
  } else {
    //--- Unlock vault door
    _building setVariable [format ["BIS_disabled_door_%1", _door], 0, true];
    _building animate [format ["door_%1_rot", _door], 1];
  };
} else {
  titleText ["Interrupted", "PLAIN"];
};
