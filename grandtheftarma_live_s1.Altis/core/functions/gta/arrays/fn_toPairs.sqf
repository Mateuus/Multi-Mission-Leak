/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [
  ["_array", [], [[]]]
];
private _blacklist = [];
private _return = [];

//--- Loop through
{
  if !(_x in _blacklist) then {
    private _entry = _x;
    private _count = {_x == _entry} count _array;

    //--- Push pair
    _return pushBack [_entry, _count];

    //--- Blacklist entry
    _blacklist pushBack _entry;
  };
} forEach _array;

_return
