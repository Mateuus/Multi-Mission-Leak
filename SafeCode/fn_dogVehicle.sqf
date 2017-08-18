/*
	File: fn_dogVehicle.sqf
	Author: ishi
	Rewrite of |TG-355th| Yink's dog PoC
	
	Description:
	Get in the vehicle
*/
private ["_unit","_dog","_veh"];
_unit 	= _this select 0;
_dog 	= _unit getvariable "dog";

while {alive _dog} do
{
	waituntil {(((vehicle _unit)!= _unit)&&((_dog distance _unit)<8))};
	_veh = vehicle _unit;
	_dog attachto [_unit,[0,0.1,-0.2]];
	_dog attachto [_veh];
	waituntil {(vehicle _unit)!= _veh};
	detach _dog;
	_dog setpos [((getpos _unit) select 0) + 2,((getpos _unit) select 1) + 2,0];
};