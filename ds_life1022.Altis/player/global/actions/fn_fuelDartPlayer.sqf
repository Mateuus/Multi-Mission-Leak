/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Lowers the fuel on the clients chopper if hit by a dart (Ran on the drivers machine)
*/

private["_vehicle","_rand","_className","_maxRand","_driver","_smoke","_smokeSpawn","_sp","_fromCar","_targets"];

_fromCar = _this select 0;
if(isNil "_fromCar")then{_fromCar = false;};
_vehicle = vehicle player;
hint "You have been hit by a fuel dart";
titleText ["!!! YOU HAVE BEEN HIT BY A FUEL DART !!!","PLAIN"];
player say3D "fail";
if((random 6) > 3)then {
	_targets = allPlayers select {(_x distance player) < 300};
	[_vehicle,"FuelDartHit",true] remoteExecCall ["DS_fnc_playSounds",_targets];
} else {
	player say3D "FuelDartHit";
};
_sp = [(getpos player select 0) + 0, (getpos player select 1) + 0, getpos player select 2];
_smoke = "SmokeShellGreen";
_smokeSpawn = _smoke createVehicle _sp;

if(_vehicle isKindOf "Car")then {
	if(_vehicle getVariable ["fuelAdv",false])then {
		_vehicle setFuel ((Fuel _vehicle) - 0.2);
	} else {
		_vehicle setFuel ((Fuel _vehicle) - 0.5);
	};
} else {
	if(_vehicle getVariable ["fuelAdv",false])then {
		_vehicle setFuel ((Fuel _vehicle) - 0.3);
		if((Fuel _vehicle) < 0.02)then {
			_vehicle setFuel 0.02;
		};
	} else {
		_vehicle setFuel 0.02;
	};
};