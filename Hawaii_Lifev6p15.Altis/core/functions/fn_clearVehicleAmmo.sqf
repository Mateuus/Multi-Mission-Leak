#include "..\..\script_macros.hpp"
/*
	File: fn_clearVehicleAmmo.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Clears the vehicle of ammo types that we don't want.
*/
private["_vehicle","_veh"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //DAFUQ
_veh = typeOf _vehicle;

if(EQUAL(_veh,"B_Boat_Armed_01_minigun_F")) then {
	_vehicle removeMagazinesTurret ["200Rnd_40mm_G_belt",[0]];
	_vehicle setVehicleAmmo 0;
};

if(EQUAL(_veh,"B_Heli_Transport_01_F")) then 
{
	_vehicle setVehicleAmmo 0;
};

if(EQUAL(_veh,"B_Heli_Transport_01_camo_F")) then 
{
	_vehicle setVehicleAmmo 0;
};

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;