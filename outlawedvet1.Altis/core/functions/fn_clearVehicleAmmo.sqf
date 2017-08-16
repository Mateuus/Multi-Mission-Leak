#include "..\..\script_macros.hpp"
/*
    File: fn_clearVehicleAmmo.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Clears the vehicle of ammo types that we don't want.

    Syntax: _vehicle removeMagazinesTurret [magazineName, turretPath]
    Documentation: https://community.bistudio.com/wiki/removeMagazinesTurret
	
	//vehicle player magazinesTurret [0];
*/
private["_vehicle","_veh"];
_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if (isNull _vehicle) exitWith {};
_veh = typeOf _vehicle;

if (_veh isEqualTo "B_Boat_Armed_01_minigun_F") then {
    _vehicle removeMagazinesTurret ["200Rnd_40mm_G_belt",[0]];
	_vehicle addMagazineTurret ["200Rnd_40mm_G_belt",[0],10];
};

if (_veh isEqualTo "B_APC_Wheeled_01_cannon_F") then {
    _vehicle removeMagazinesTurret ["60Rnd_40mm_GPR_Tracer_Red_shells",[0]];
    _vehicle removeMagazinesTurret ["40Rnd_40mm_APFSDS_Tracer_Red_shells",[0]];
};

if (_veh isEqualTo "O_Heli_Attack_02_black_F") then {
    _vehicle removeMagazinesTurret ["250Rnd_30mm_APDS_shells",[0]];
    _vehicle removeMagazinesTurret ["8Rnd_LG_scalpel",[0]];
    _vehicle removeMagazinesTurret ["38Rnd_80mm_rockets",[0]];
};

if (_veh isEqualTo "O_Heli_Attack_02_F") then {
    _vehicle removeMagazinesTurret ["250Rnd_30mm_HE_shells_Tracer_Green",[0]];
    _vehicle removeMagazinesTurret ["250Rnd_30mm_APDS_shells",[0]];
    _vehicle removeMagazinesTurret ["8Rnd_LG_scalpel",[0]];
    _vehicle removeMagazinesTurret ["38Rnd_80mm_rockets",[0]];
};

if (_veh isEqualTo "B_Heli_Transport_01_F") then {
    _vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[1]];
    _vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[2]];
};

if (_veh isEqualTo "O_T_VTOL_02_infantry_F") then {
    _vehicle removeMagazinesTurret ["250Rnd_30mm_HE_shells_Tracer_Green",[0]];
    _vehicle removeMagazinesTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
	_vehicle removeMagazinesTurret ["8Rnd_LG_scalpel",[0]];
	_vehicle removeMagazinesTurret ["38Rnd_80mm_rockets",[0]];
};

if (_veh isEqualTo "B_Heli_Light_01_armed_F") then {
    _vehicle removeMagazinesTurret ["5000Rnd_762x51_Belt",[0]];
    _vehicle removeMagazinesTurret ["24Rnd_missiles",[0]];
	_vehicle addMagazineTurret ["5000Rnd_762x51_Belt",[0],2600];
	_vehicle addMagazineTurret ["24Rnd_missiles",[0],5];
};

if (_veh isEqualTo "B_T_LSV_01_armed_F") then {
    _vehicle removeMagazinesTurret ["100Rnd_127x99_mag_Tracer_Red",[0]];
    _vehicle removeMagazinesTurret ["130Rnd_338_Mag",[1]];
	_vehicle addMagazineTurret ["100Rnd_127x99_mag_Tracer_Red",[0],100];
	_vehicle addMagazineTurret ["130Rnd_338_Mag",[1],260];
};

if (_veh isEqualTo "I_MRAP_03_hmg_F") then {
    _vehicle removeMagazinesTurret ["200Rnd_127x99_mag_Tracer_Yellow",[1]];
	_vehicle addMagazineTurret ["200Rnd_127x99_mag_Tracer_Yellow",[1],200];
};

if (_veh isEqualTo "I_Plane_Fighter_03_CAS_F") then {
    _vehicle removeMagazinesTurret ["2Rnd_LG_scalpel",[-1]];
	_vehicle removeMagazinesTurret ["2Rnd_AAA_missiles",[-1]];
	_vehicle removeMagazinesTurret ["2Rnd_GBU12_LGB_MI10",[-1]];
	_vehicle removeMagazinesTurret ["300Rnd_20mm_shells",[-1]];
	_vehicle addMagazineTurret ["300Rnd_20mm_shells",[-1],60];
	_vehicle addMagazineTurret ["2Rnd_GBU12_LGB_MI10",[-1],1];
};



clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;
