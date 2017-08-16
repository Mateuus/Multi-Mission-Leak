/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [
  ["_lod1", "VIEW", [""]],
  ["_lod2", "GEOM"]
];

private _begPos = eyePos player;
private _endPos = _begPos vectorAdd (getCameraViewDirection player vectorMultiply 100);

//--- Return list of surface intersects between the player's camera and a specified distance
private _intersects = lineIntersectsSurfaces [_begPos, _endPos, vehicle player, objNull, true, 1, _lod1, _lod2];

//--- If no results are returned, return objNull
if (_intersects isEqualTo []) exitWith {objNull};

//--- Return
(_intersects select 0 param [3, objNull])
