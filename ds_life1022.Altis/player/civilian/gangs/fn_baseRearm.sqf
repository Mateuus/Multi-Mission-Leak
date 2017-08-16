/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Updates the gang members list
*/

private ["_clan","_nearVehicles"];

_clan = (_this select 0);

if(!(_clan getVariable ["baseVehicle",false]))exitWith{hint "You do not have this upgrade"};
if(_clan getVariable ["baseClosed",false])exitWith{hint "This base has been shut down by the police. Bases remain closed for 1 hour"};

hint "All nearby vehicles will be rearmed, refuelled and repaired in 30 seconds";
sleep 30;

_nearVehicles = (nearestObjects [player,["LandVehicle","Air","Ship"],30]);

{
	if(local _x)then {
		_x setDamage 0;
		_x setVehicleAmmo 1;
		_x setFuel 1;
	} else {
		[[_x],{(_this select 0) setDamage 0;}] remoteExec ["BIS_fnc_spawn",_x];
		[[_x],{(_this select 0) setVehicleAmmo 1;}] remoteExec ["BIS_fnc_spawn",_x];
		[[_x],{(_this select 0) setFuel 1;}] remoteExec ["BIS_fnc_spawn",_x];
	};

	if(typeOf _x == "B_Heli_Attack_01_F")then {
		[_x] spawn DS_fnc_clearVehAmmo;
	};
} forEach _nearVehicles;

hint "All nearby vehicles have been repaired, rearmed and refuelled";