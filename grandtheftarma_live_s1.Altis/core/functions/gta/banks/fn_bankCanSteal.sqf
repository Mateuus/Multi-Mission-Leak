/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private ["_bank", "_vault", "_cfg", "_bankReqWest", "_vaultPosition", "_vaultBuilding", "_vaultDoors"];
_bank = [_this, 0, "", [""]] call GTA_fnc_param;
_vault = [_this, 1, "", [""]] call GTA_fnc_param;
_cfg = missionConfigFile >> "GTA_CfgBanks" >> _bank;

//--- Bank config
_bankReqWest = getNumber (_cfg >> "requiredWest");

//--- Vault config
_vaultPosition = getArray (_cfg >> "Vaults" >> _vault >> "position");
_vaultBuilding = getText (_cfg >> "Vaults" >> _vault >> "building");
_vaultDoors = getArray (_cfg >> "Vaults" >> _vault >> "doors");

//--- Find vault building
_vaultBuilding = nearestObject [_vaultPosition, _vaultBuilding];

//--- Required west count
//if (west countSide allPlayers < _bankReqWest) exitWith {[1, ["STR_GTA_BANKS_WESTLIMIT", _bankReqWest], ["Warning", "#ff8800"]] call GTA_fnc_broadcast; false};

//--- Vault doors unlocked
_vaultLocked = true;

{
  //--- Check if vault door is unlocked
  if (_vaultBuilding getVariable [format ["BIS_disabled_door_%1", _x], 1] == 0) exitWith {
    _vaultLocked = false;
  };
} forEach _vaultDoors;

//--- Vault door locked state
if (_vaultLocked) exitWith {[1, "STR_GTA_BANKS_VAULTLOCKED", ["Warning", "#ff8800"]] call GTA_fnc_broadcast; false};

true
