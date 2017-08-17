private["_vehicle","_rand","_className","_maxRand","_driver","_smoke","_smokeSpawn","_sp","_fromCar","_targets"];

_fromCar = _this select 0;
if (isNil "_fromCar") then {_fromCar = false;};
_vehicle = vehicle player;
hint "You have been hit by a anti-fuel rocket!";
titleText ["!!! YOU HAVE BEEN HIT BY A ANTI FUEL ROCKET !!!","PLAIN"];
if ((random 6) > 3) then {
	_targets = allPlayers select {(_x distance player) < 300};
	[_vehicle,"rockethit",true] remoteExecCall ["life_fnc_playSounds",_targets];
} else {
	player say3D "rockethit";
};
_sp = [(getpos player select 0) + 0, (getpos player select 1) + 0, getpos player select 2];
_smoke = "SmokeShellGreen";
_smokeSpawn = _smoke createVehicle _sp;

if(_vehicle isKindOf "Car") then {
		_vehicle setFuel ((Fuel _vehicle) - 0.01);
	} else {
		_vehicle setFuel 0.02;
};
