/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [["_unit", objNull, [objNull]]];
private ["_vehicle", "_ejectPos", "_boundingBox"];
_vehicle = vehicle _unit;

//--- Exit if unit is not inside a vehicle
if (_unit isEqualTo _vehicle) exitWith {};

if (alive _unit) then {
  unassignVehicle _unit;
  moveOut _unit;
} else {
  //--- Attempt to retrieve eject position from model selections
  _ejectPos = _vehicle selectionPosition (["pos cargo", "pos driver"] select (driver _vehicle isEqualTo _unit));

  if (_ejectPos isEqualTo [0, 0, 0]) then {
    //--- Get position from bounding box
    _boundingBox = boundingBoxReal _vehicle;
    _ejectPos = [((_boundingBox select 0) select 0) + 0.5, 0, (_boundingBox select 0) select 2];
  };

  //--- Set the position
  _unit setPosASL AGLtoASL (_vehicle modelToWorldVisual _ejectPos);
};
