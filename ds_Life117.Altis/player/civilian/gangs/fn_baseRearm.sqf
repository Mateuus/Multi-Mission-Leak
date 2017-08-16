/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Updates the gang members list
*/

private["_clan","_nearVehicles","_action"];

_clan = (_this select 0);

if(!(_clan getVariable ["baseVehicle",false]))exitwith{hint "You do not have this upgrade"};

hint "All nearby vehicles will be rearmed, refuelled and repaired in 30 seconds";
sleep 30;

_nearVehicles = (nearestObjects [getPos Player, ["LandVehicle","Air","Ship"], 30]);
{
	[[[_x],{(_this select 0) setDamage 0;}],"BIS_fnc_spawn",_x,false] spawn BIS_fnc_MP;
	[[[_x],{(_this select 0) setVehicleAmmo 1;}],"BIS_fnc_spawn",_x,false] spawn BIS_fnc_MP;
	[[[_x],{(_this select 0) setFuel 1;}],"BIS_fnc_spawn",_x,false] spawn BIS_fnc_MP;
	_x setDamage 0;
	_x setVehicleAmmo 1;
	_x setFuel 1;
	if(typeOf _x == "B_Heli_Attack_01_F")then
		{
		[_x] spawn DS_fnc_clearVehAmmo;
		};
}forEach _nearVehicles;

hint "All nearby vehicles are repaired, rearmed and refuelled";