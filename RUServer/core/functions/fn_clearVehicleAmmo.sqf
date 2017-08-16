#include "..\..\script_macros.hpp"
/*
    File: fn_clearVehicleAmmo.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Clears the vehicle of ammo types that we don't want.

    Syntax: _vehicle removeMagazinesTurret [magazineName, turretPath]
    Documentation: https://community.bistudio.com/wiki/removeMagazinesTurret
*/
private ["_vehicle","_veh"];
_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if (isNull _vehicle) exitWith {};
_veh = typeOf _vehicle;

if (_veh isEqualTo "B_Boat_Armed_01_minigun_F") then {
    _vehicle removeMagazinesTurret ["200Rnd_40mm_G_belt",[0]];
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_belt_Tracer_Red",[0]];
};

if (_veh isEqualTo "B_Heli_Transport_01_F") then {
    _vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[1]];
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[2]];
};

if (_veh isEqualTo "B_Heli_Attack_01_F") then {
    _vehicle removeMagazinesTurret ["1000Rnd_20mm_shells",[0]];
	_vehicle removeMagazinesTurret ["4Rnd_AAA_missiles",[0]];
	_vehicle removeMagazinesTurret ["24Rnd_PG_missiles",[0]];
};

if (_veh isEqualTo "O_Heli_Attack_02_F") then {
    _vehicle removeMagazinesTurret ["250Rnd_30mm_HE_shells_Tracer_Green",[0]];
	_vehicle removeMagazinesTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
	_vehicle removeMagazinesTurret ["8Rnd_LG_scalpel",[0]];
	_vehicle removeMagazinesTurret ["38Rnd_80mm_rockets",[0]];
};

if (_veh isEqualTo "O_T_VTOL_02_vehicle_hex_F") then {
	_vehicle removeMagazinesTurret ["250Rnd_30mm_HE_shells_Tracer_Green",[0]];
	_vehicle removeMagazinesTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
	_vehicle removeMagazinesTurret ["8Rnd_LG_scalpel",[0]];
	_vehicle removeMagazinesTurret ["38Rnd_80mm_rockets",[0]];
};

if (_veh isEqualTo "O_T_VTOL_02_infantry_grey_F") then {
    _vehicle removeMagazinesTurret ["250Rnd_30mm_HE_shells_Tracer_Green",[0]];
	_vehicle removeMagazinesTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
	_vehicle removeMagazinesTurret ["8Rnd_LG_scalpel",[0]];
	_vehicle removeMagazinesTurret ["38Rnd_80mm_rockets",[0]];
};

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;
