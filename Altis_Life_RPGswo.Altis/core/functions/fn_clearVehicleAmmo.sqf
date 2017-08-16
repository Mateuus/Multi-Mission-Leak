/*
	File: fn_clearVehicleAmmo.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Clears the vehicle of ammo types that we don't want.
*/
private["_vehicle","_veh"];
_vehicle = param [0,ObjNull,[ObjNull]];
if(isNull _vehicle) exitWith {}; //DAFUQ
_veh = typeOf _vehicle;

_vehicle setVehicleAmmo 0;

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;

// fahrzeuge können mit tankfahrzeugen nicht mehr getankt, munitioniert oder repariert werden
_vehicle setFuelCargo 0;
_vehicle setRepairCargo 0;
_vehicle setAmmoCargo 0;