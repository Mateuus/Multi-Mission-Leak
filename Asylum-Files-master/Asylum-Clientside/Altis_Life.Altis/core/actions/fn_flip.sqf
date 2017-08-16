/*
		File: fn_flip.sqf
		Author: Mike "Revir" Berlin
		
		Description: Flips a vehicle
*/
private["_car","_dir"];
if(!isNil "flip_active") exitWith {};
flip_active = true;
_car = cursorTarget;
_dir = vectorUp _car;
if ((_dir select 2 < 0.8) || (_dir select 1 < 0.8)) then 
{
	hint format ["Stand clear the vehicle will unflip in 5 seconds.."];
	sleep 5;
	[_car, "ASY_fnc_flipVehicle", false, false] spawn life_fnc_MP;
}
else
{
	hint format ["Car is not upside down"];
};
flip_active = nil;