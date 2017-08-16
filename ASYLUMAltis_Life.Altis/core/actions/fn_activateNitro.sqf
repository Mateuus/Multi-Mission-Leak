/*
		File: activateNitro.sqf
		Author: John "Paratus" VanderZwet
		
		Description: Activates nitrous injector on car
*/

_vehicle = vehicle player;

if (_vehicle == player) exitWith {};
if (driver _vehicle != player) exitWith {};

if ((_vehicle getVariable ["nitro",0]) < 1) exitWith {};

if ((speed _vehicle) <= 10) exitWith { systemChat format ["You must be moving at over 10km/h to activate Nitro."]; };

_vehicle setVariable["nitro",((_vehicle getVariable["nitro",0]) - 1),true];
_vehicle setVariable["nitroTime", time, false];
systemChat format ["Nitro engaged."];
_vel = velocity _vehicle;
_dir = direction _vehicle;
_speed = 20; //how much you want to add speed for the vehicle
_vehicle setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+ (cos _dir*_speed),(_vel select 2)];
