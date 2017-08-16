/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Boat Cruise Control
*/

private ["_vehicle","_speed","_dir","_x","_y"];

if(isNil "DS_cruiseControl")then {DS_cruiseControl = false;};

if(DS_cruiseControl)then {
	DS_cruiseControl = false;
} else {
	DS_cruiseControl = true;
};

_vehicle = (vehicle player);
_speed = speed _vehicle;
if(_speed < 30)exitWith{hint "Moving too slow for cruise control";DS_cruiseControl = false;};
if(_speed > 95)exitWith{hint "Moving too fast for cruise control";DS_cruiseControl = false;};

hint format ["Cruise Control activated at a speed of %1km/h",round(_speed)];

while{true}do {
	if(!DS_cruiseControl)exitWith{hint "Cruise Control Deactivated";};
	if(fuel(_vehicle) == 0)exitWith{hint "Cruise Control Deactivated";};
	if (isNil "_vehicle")exitWith{};
	if (damage (_vehicle) > 0.5) exitWith{hint "Vehicle is too damaged to continue on cruise control.";};
	if (_vehicle != (vehicle player))exitWith{hint "Cruise Control Deactivated";};
	if (!(surfaceIsWater (position _vehicle)))exitWith{hint "Cruise Control Deactivated";};
	if (!isEngineOn _vehicle)exitWith{hint "Cruise Control Deactivated";};
	_dir = getDir (_vehicle);
	_x = (sin _dir)*(_speed/3.6);
	_y = (cos _dir)*(_speed/3.6);
	(_vehicle) setVelocity [(_x), (_y), ((velocity (_vehicle)) select 2)];
	sleep 0.05;
};

DS_cruiseControl = false;