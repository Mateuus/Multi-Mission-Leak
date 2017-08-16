/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [["_vehicle", objNull, [objNull]], ["_jip", false, [true]]];

//--- Error check
if (isNull _vehicle) exitWith {};

//--- Killed
_vehicle removeAllEventHandlers "Killed";
_vehicle addEventHandler ["Killed", {
  params ["_vehicle", "_killer"];

  //--- Destroy the vehicle
  if (_vehicle isKindOf "Helicopter") then {
    if (isServer) then {
      [_vehicle] call GTA_fnc_deleteVehicleFromObject;
    } else {
      [[_vehicle], "GTA_fnc_deleteVehicleFromObject", false] call GTA_fnc_remoteExec;
    };
  };
}];

//--- Handle Damage
_vehicle removeAllEventHandlers "HandleDamage";
_vehicle addEventHandler ["HandleDamage", {
  params ["_vehicle", "_part", "_damage", "_source", "_projectile"];

  if (_projectile == "" && {_vehicle isKindOf "Car"}) then {
    private ["_partEngine", "_partFuel", "_partBody"];
    _partEngine = getText (configfile >> "CfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name");
    _partFuel = getText (configfile >> "CfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitFuel" >> "name");

    if (_part in [_partEngine, _partFuel, _partBody]) then {
      _damage = _vehicle getHit _part;
    };

    if (_part == "") then {
      _damage = vehicle player;
    };
  };

  _damage
}];

//--- Get out
_vehicle removeAllEventHandlers "GetOut";
_vehicle addEventHandler ["GetOut", {
  params ["_vehicle", "_position", "_unit", "_turret"];

  //--- Turn off engine if no drive is present
  if (local _vehicle && {isNull driver _vehicle} && {isEngineOn _vehicle}) then {
    _vehicle engineOn false;
  };

  //[_vehicle, ["MRAP_01_base_F", "MRAP_02_base_F", "MRAP_03_base_F"]] call GTA_fnc_isKindOf
  if (_unit isEqualTo player) then {
    //--- Prevent the player from firing for a short duration
    [player, 2] call GTA_fnc_unitDisableFire;
  };
}];

_vehicle removeAllEventHandlers "RopeAttach";
_vehicle addEventHandler ["RopeAttach", {
  params ["_vehicle", "_rope", "_object"];

  if (local _vehicle) then {
    private "_trunk";
    _items = _object getVariable "trunk";

    //--- Perk
    if !(["loadmaster"] call GTA_fnc_hasPerk) exitWith {
      [1, "You are unable to use sling load without the Loadmaster perk.", ["Warning", "#ff8800"]] call GTA_fnc_broadcast;
      deleteVehicle _rope;
    };

    //--- Trunk is not empty
    if (!(_object isKindOf "Slingload_01_Base_F") && {!isNil "_items"} && {count (_items select 0) > 0}) exitWith {
      [1, "You are unable to tow vehicles that have items stored in them.", ["Warning", "#ff8800"]] call GTA_fnc_broadcast;
      deleteVehicle _rope;
    };
  };
}];

if (!_jip && {local _vehicle}) then {
  _vehicle setVariable ["GTA_setupVehicleEH", true, true];
};
