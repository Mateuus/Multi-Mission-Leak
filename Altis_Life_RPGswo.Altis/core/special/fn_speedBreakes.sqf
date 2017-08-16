/*
	File: fn_speedBreakes.sqf
	Author: MarkusSR1984
	
	Description:
	Why should i comment this ????
*/

_maxSpeed = 60;
_warnedPlayer = false;
DWEV_speedbreakes = true;

switch ((side player)) do
{
	case west: {_maxSpeed = 75;};
	case independent: {_maxSpeed = 75;};
	default {_maxSpeed = 60;};
};

while {DWEV_speedbreakes} do
{
	_vehicle = (vehicle player);
	_speed = (speed _vehicle);
	
	if (_speed < 0) then {_speed = 0 - _speed;};
	
	if (_speed >= (_maxSpeed - 10) && !_warnedPlayer  && (vehicle player) iskindof "LandVehicle") then
	{
		hint "ACHTUNG Du bist zu schnell. Speedbreakes sind aktiv !!!!!";
		playSound "Alarm";
		_warnedPlayer = true;
	}
	else
	{
		_warnedPlayer = false;
	};
	
	if (_speed >= (_maxSpeed  - 5)) then
	{
		_vel = velocity _vehicle;
		_dir = direction _vehicle;
		_brake = 20;
			
		_vehicle setVelocity [
		((_vel select 0) * ((100 - _brake) / 100)), 
		((_vel select 1) * ((100 - _brake) / 100)),
		(_vel select 2)];
	};
	
	if (_speed >= _maxSpeed && _warnedPlayer) then
	{
		(vehicle player) setHitPointDamage["HitLFWheel",1];
		(vehicle player) setHitPointDamage["HitLF2Wheel",1];
		(vehicle player) setHitPointDamage["HitRFWheel",1];
		hint "Die Automatischen Speedbreakes haben deine Reifen zerstört! Fahre in Zukunft einfach langsamer um das zu vermeiden !";
		_warnedPlayer = false;
	};
	
	uisleep 0.15;

};
