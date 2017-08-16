#include <macro.h>

/*
	File: fn_clearVehicleAmmo.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Clears the vehicle of ammo types that we don't want.
*/
private["_vehicle","_veh"];
_vehicle = param [0,Objnull,[Objnull]];
if(isNull _vehicle) exitWith {};
_veh = typeOf _vehicle;
if(EQUAL(_veh,"Cha_Mi24_D")) then {
	_vehicle setVehicleAmmo 0.5;
};

if(EQUAL(_veh,"O_MRAP_02_F")) then  {
	_vehicle setVehicleAmmo 0;
};

if(EQUAL(_veh,"sab_UN_UGV_armed")) then {
	_vehicle setVehicleAmmo 0.4;
};

if(EQUAL(_veh,"sab_UN_UAV")) then {
	_vehicle setVehicleAmmo 0;
};

if(EQUAL(_veh,"O_APC_Wheeled_02_rcws_F")) then
{
	_vehicle setVehicleAmmo 0.4;
};

if(EQUAL(_veh,"O_MBT_02_cannon_F")) then
{
	_vehicle setVehicleAmmo 0.4;
};

if(EQUAL(_veh,"O_APC_Wheeled_02_rcws_F")) then
{
	_vehicle setVehicleAmmo 0.4;
};
//_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
