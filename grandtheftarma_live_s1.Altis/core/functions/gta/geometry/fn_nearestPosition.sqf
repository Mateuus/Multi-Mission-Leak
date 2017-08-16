/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [
  ["_origin", [0, 0, 0]],
  ["_positions", [], [[]]]
];
private _nearestIndex = 0;
private _nearestDist = -1;

//--- Convert origin position
_origin = [_origin] call GTA_fnc_position;

{
  //--- Convert current position
  _x = [_x] call GTA_fnc_position;

  //--- Get distance
  private _distance = _origin distance _x;

  //--- Check if distance is less than current nearest
  if (_nearestDist == -1 || {_distance < _nearestDist}) then {
    _nearestIndex = _forEachIndex;
    _nearestDist = _distance;
  };
} forEach _positions;

//--- Return closest position
_positions select _nearestIndex
