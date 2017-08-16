/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private ["_building", "_door", "_bank", "_vault", "_cfg", "_vaultDoors", "_vaultTime"];
_building = [_this, 0, objNull, [objNull]] call GTA_fnc_param;

//--- Error checks
if (isNull _building) exitWith {};
if (isNil {_building getVariable "bank"}) exitWith {};

//--- Has Perk
if !(["black_decker"] call GTA_fnc_hasPerk) exitWith {[1, "The 'Black &amp; Decker' perk is required to open the vault door with a drill.", ["Warning", "#ff8800"]] call GTA_fnc_broadcast;};

//--- Bank details
_bank = _building getVariable "bank";
_vault = _building getVariable "bankVault";

//--- Check drill conditions
if !([_bank] call GTA_fnc_bankCanDrill) exitWith {};

//--- Bank config
_cfg = missionConfigFile >> "GTA_CfgBanks" >> _bank;
_vaultDoors = getArray (_cfg >> "Vaults" >> _vault >> "doors");
_vaultTime = getNumber (_cfg >> "Vaults" >> _vault >> "time");

//--- Get nearest door
_door = [_building] call GTA_fnc_nearestDoor;

//--- Check door index
if !(_door in _vaultDoors) exitWith {hint "You are not near a bank vault door"};

//--- Check if door is locked
if (_building getVariable [format ["BIS_disabled_door_%1", _door], 0] == 0) exitWith {hint "Bank vault door is already open"};

//--- Alert
[[[0, 1, 2], ["STR_GTA_BANKS_ALERT", [_bank] call GTA_fnc_bankName], ["Alert", "#ff0000"]], "GTA_fnc_broadcast", west] call GTA_fnc_remoteExec;

//--- Bank zone
[_bank, true] call GTA_fnc_bankZone;

//--- Consume drill
[false, "drill", 1] call life_fnc_handleInv;

//--- Drill action
if ([_vaultTime, "Drilling Vault Door"] call GTA_fnc_action) then {
  //--- Unlock vault door
  _building setVariable [format ["BIS_disabled_door_%1", _door], 0, true];
  _building animate [format ["door_4_rot", _door], 1];
} else {
  titleText ["Drilling interrupted", "PLAIN"];
};
