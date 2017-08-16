scriptName "fn_move";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_move.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_move.sqf"

if (!isServer) exitWith {};

_vehicles = _this select 0;
_markers = _this select 1;

// Move file debug
systemChat "Move called";

_attack = false;

// Loop until the convoy is being attacked
while {!_attack} do {
	{
		if (!alive _x || !canMove _x || !isNull (_x findNearestEnemy (getPos _x)) || isNull driver _x) then {
			_attack = true
		};
	} forEach mav_convoy_vehicles;
};

// Attack...
[] spawn mav_convoy_fnc_attack;