/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private ["_unit", "_distance", "_side", "_units"];
_unit = [_this, 0, objNull, [objNull]] call GTA_fnc_param;
_distance = [_this, 1, 30, [30]] call GTA_fnc_param;
_side = [_this, 2, sideUnknown, [sideUnknown]] call GTA_fnc_param;
_units = [];

//--- Loop through
{
	if (_unit distance _x <= _distance && {_side == sideUnknown || {side group _x == _side}}) then {
		_units pushBack _x;
	};
} forEach ([] call GTA_fnc_allPlayers);

_units
