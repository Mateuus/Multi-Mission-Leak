/*
	File: fn_fireEMP.sqf
	Author: Chronic [MIT]

	Description:
	Handles the creation of an EMP grenade
*/

_projectile = _this select 0;

if(playerSide != west) exitWith {};

if(isNil "life_empLogic") then {
	life_empLogic = objNull;
};
if(!isNull life_empLogic) exitWith {
	deleteVehicle _projectile;
	titleText ["If you fire EMPs too rapidly, the universe will implode!", "PLAIN"];
};

// assign something to life_empLogic so that the user can't immediately use another one
life_empLogic = _projectile;
_lastPos = position _projectile;

sleep 1;
while {(_lastPos distance (position _projectile)) > 0} do {
	_lastPos = position _projectile;
	sleep 0.2;
};
deleteVehicle _projectile;

"LOGIC" createUnit [_lastPos, createGroup (createCenter sideLogic), "if(local this) then {life_empLogic = this}; this say3D 'EMP';"];

_radius = 15;
_duration = 60;
sleep 1;
_affectedCars = _lastPos nearObjects ["Car", _radius];
_affectedHelis = _lastPos nearObjects ["Helicopter", _radius];
_affectedPlanes = _lastPos nearObjects ["Plane", _radius];
_affectedShips = _lastPos nearObjects ["Ship", _radius];
_affected = _affectedCars + _affectedHelis + _affectedPlanes + _affectedShips;
[[_affected, _duration, random(1)], "life_fnc_disableVehicles", true, false] call life_fnc_MP;

sleep 5;
deleteVehicle life_empLogic;
life_empLogic = objNull;