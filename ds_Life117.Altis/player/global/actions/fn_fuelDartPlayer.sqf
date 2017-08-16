/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Lowers the fuel on the clients chopper if hit by a dart (Ran on the drivers machine)
*/
private["_vehicle","_rand","_className","_maxRand","_driver","_smoke","_smokeSpawn","_sp","_fromCar"];

_fromCar = _this select 0;
if(isNil {_fromCar})then{_fromCar = false;};
_vehicle = vehicle player;
hint "You have been hit by a fuel dart";
titleText ["!!! YOU HAVE BEEN HIT BY A FUEL DART !!!","PLAIN"];
player say3D "fail";
[[_vehicle,"FuelDartHit"],"DS_fnc_playSounds"] spawn DS_fnc_MP;
_sp = [(getpos player select 0) + 0, (getpos player select 1) + 0, getpos player select 2];
_smoke = "SmokeShellGreen";
_smokeSpawn = _smoke createVehicle _sp;

if(_vehicle isKindOf "Car")then
	{
	if(_vehicle getVariable ["fuelAdv",false])then
		{
		_vehicle setFuel ((Fuel _vehicle) - 0.2);
		}
		else
		{
		_vehicle setFuel ((Fuel _vehicle) - 0.5);
		};
	}
	else
	{
	if(_vehicle getVariable ["fuelAdv",false])then
		{
		_vehicle setFuel ((Fuel _vehicle) - 0.3);
		}
		else
		{
		_vehicle setFuel 0.02;
		};
	};