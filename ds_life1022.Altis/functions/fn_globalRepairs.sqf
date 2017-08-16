/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Repairs buildings on the server
*/

private ["_buildings"];

params [["_position",[],[[]]]];

if(_position isEqualTo [])exitWith{};

_buildings = nearestObjects [_position,["All"],300];

{
	if((!(_x isKindOf "Air"))&&(!(_x isKindOf "LandVehicle")))then {
		_x setDamage 0;
	};
} forEach _buildings;