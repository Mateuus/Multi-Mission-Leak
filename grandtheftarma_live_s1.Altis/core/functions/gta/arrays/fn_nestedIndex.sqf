/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

if (!params [
  ["_haystack", [], [[]]],
  "_needle"
]) exitWith {};
private _index = -1;

{
  if (_needle in _x) exitWith {_index = _forEachIndex};
} forEach _haystack;

_index
