/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [
  ["_vehicle", objNull, [objNull]]
];

_vehicle setVectorUp surfaceNormal getPos _vehicle;
_vehicle setPosATL [getPosATL _vehicle select 0, getPosATL _vehicle select 1, 0];
