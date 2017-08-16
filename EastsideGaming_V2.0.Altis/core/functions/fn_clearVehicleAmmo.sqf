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

if(_veh isEqualTo "B_Boat_Armed_01_minigun_F") then
{
	_vehicle removeMagazinesTurret ["200Rnd_40mm_G_belt",[0]];
};
if(_veh isEqualTo "B_APC_Wheeled_01_cannon_F") then
{
	_vehicle removeMagazinesTurret ["60Rnd_40mm_GPR_Tracer_Red_shells",[0]];
	_vehicle removeMagazinesTurret ["40Rnd_40mm_APFSDS_Tracer_Red_shells",[0]];
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_belt",[-1]];
};

if(_veh isEqualTo "I_APC_Wheeled_03_cannon_F") then
{
	_vehicle removeMagazinesTurret ["140Rnd_30mm_MP_shells_Tracer_Yellow",[0]];
	_vehicle removeMagazinesTurret ["60Rnd_30mm_APFSDS_shells_Tracer_Yellow",[0]];
	_vehicle removeMagazinesTurret ["1000Rnd_65x39_Belt_Yellow",[-1]];
	_vehicle removeMagazinesTurret ["2Rnd_GAT_missiles",[-1]];
};
if(_veh isEqualTo "O_Heli_Attack_02_F") then
{
	_vehicle removeMagazinesTurret ["192Rnd_CMFlare_Chaff_Magazine",[-1]];
	_vehicle removeMagazinesTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
	_vehicle removeMagazinesTurret ["250Rnd_30mm_HE_shells_Tracer_Green",[0]];
	_vehicle removeMagazinesTurret ["8Rnd_LG_scalpel",[0]];
	_vehicle removeMagazinesTurret ["38Rnd_80mm_rockets",[0]];
};
if(_veh isEqualTo "O_Heli_Attack_02_black_F" || _veh isEqualTo "O_Heli_Attack_02_dynamicLoadout_black_F") then
{
	_vehicle removeMagazinesTurret ["192Rnd_CMFlare_Chaff_Magazine",[-1]];
	_vehicle removeMagazinesTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
	_vehicle removeMagazinesTurret ["250Rnd_30mm_HE_shells_Tracer_Green",[0]];
	_vehicle removeMagazinesTurret ["8Rnd_LG_scalpel",[0]];
	_vehicle removeMagazinesTurret ["38Rnd_80mm_rockets",[0]];
};

if(_veh isEqualTo "B_Heli_Light_01_armed_F") then
{
	_vehicle removeMagazinesTurret ["24Rnd_missiles",[-1]];
};

if(_veh isEqualTo "I_Plane_Fighter_03_AA_F") then
{
	_vehicle removeMagazinesTurret ["300Rnd_20mm_shells",[-1]];
	_vehicle removeMagazinesTurret ["2Rnd_AAA_missiles",[-1]];
	_vehicle removeMagazinesTurret ["4Rnd_GAA_missiles",[-1]];
	_vehicle removeMagazinesTurret ["120Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_veh isEqualTo "B_Plane_CAS_01_F") then
{
	_vehicle removeMagazinesTurret ["1000Rnd_Gatling_30mm_Plane_CAS_01_F",[-1]];
	_vehicle removeMagazinesTurret ["2Rnd_Missile_AA_04_F",[-1]];
	_vehicle removeMagazinesTurret ["6Rnd_Missile_AGM_02_F",[-1]];
	_vehicle removeMagazinesTurret ["4Rnd_Bomb_04_F",[-1]];
	_vehicle removeMagazinesTurret ["7Rnd_Rocket_04_HE_F",[-1]];
	_vehicle removeMagazinesTurret ["7Rnd_Rocket_04_AP_F",[-1]];
	_vehicle removeMagazinesTurret ["120Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_veh isEqualTo "O_Plane_CAS_02_F") then
{
	_vehicle removeMagazinesTurret ["500Rnd_Cannon_30mm_Plane_CAS_02_F",[-1]];
	_vehicle removeMagazinesTurret ["2Rnd_Missile_AA_03_F",[-1]];
	_vehicle removeMagazinesTurret ["4Rnd_Missile_AGM_01_F",[-1]];
	_vehicle removeMagazinesTurret ["2Rnd_Bomb_03_F",[-1]];
	_vehicle removeMagazinesTurret ["20Rnd_Rocket_03_HE_F",[-1]];
	_vehicle removeMagazinesTurret ["20Rnd_Rocket_03_AP_F",[-1]];
	_vehicle removeMagazinesTurret ["120Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_veh isEqualTo "B_Heli_Attack_01_F") then
{
	_vehicle removeMagazinesTurret ["240Rnd_CMFlare_Chaff_Magazine",[-1]];
	_vehicle removeMagazinesTurret ["1000Rnd_20mm_shells",[0]];
	_vehicle removeMagazinesTurret ["4Rnd_AAA_missiles",[0]];
	_vehicle removeMagazinesTurret ["24Rnd_PG_missiles",[0]];
};
if(_veh isEqualTo "B_Heli_Transport_01_F") then
{
	_vehicle removeMagazinesTurret ["168Rnd_CMFlare_Chaff_Magazine",[-1]];
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[1]];
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[2]];
};
if(_veh isEqualTo "B_Heli_Transport_03_unarmed_F") then
{
	_vehicle removeMagazinesTurret ["168Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_veh isEqualTo "O_Heli_Transport_04_F") then
{
	_vehicle removeMagazinesTurret ["168Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_veh isEqualTo "O_Heli_Transport_04_ammo_F") then
{
	_vehicle removeMagazinesTurret ["168Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_veh isEqualTo "O_Heli_Transport_04_bench_F") then
{
	_vehicle removeMagazinesTurret ["168Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_veh isEqualTo "O_Heli_Transport_04_box_F") then
{
	_vehicle removeMagazinesTurret ["168Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_veh isEqualTo "O_Heli_Transport_04_covered_F") then
{
	_vehicle removeMagazinesTurret ["168Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_veh isEqualTo "O_Heli_Transport_04_medevac_F") then
{
	_vehicle removeMagazinesTurret ["168Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_veh isEqualTo "O_Heli_Transport_04_repair_F") then
{
	_vehicle removeMagazinesTurret ["168Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_veh isEqualTo "I_Heli_light_03_unarmed_F") then
{
	_vehicle removeMagazinesTurret ["168Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_veh isEqualTo "I_Heli_Transport_02_F") then
{
	_vehicle removeMagazinesTurret ["168Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_veh isEqualTo "B_Heli_Transport_03_F") then
{
	_vehicle removeMagazinesTurret ["168Rnd_CMFlare_Chaff_Magazine",[-1]];
	// _vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[1]];
	// _vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[2]];
};
if(_veh isEqualTo "I_Heli_light_03_F") then
{
	_vehicle removeMagazinesTurret ["5000Rnd_762x51_Yellow_Belt",[-1]];
	_vehicle removeMagazinesTurret ["24Rnd_missiles",[-1]];
	_vehicle removeMagazinesTurret ["168Rnd_CMFlare_Chaff_Magazine",[-1]];
};
if(_veh isEqualTo "I_MRAP_03_hmg_F") then
{
	_vehicle removeMagazinesTurret ["200Rnd_127x99_mag_Tracer_Yellow",[-1]];
	_vehicle removeMagazinesTurret ["200Rnd_127x99_mag_Tracer_Yellow",[-1]];
};
if(_veh isEqualTo "O_MRAP_02_hmg_F") then
{
	_vehicle removeMagazinesTurret ["200Rnd_127x99_mag_Tracer_Green",[-1]];
	_vehicle removeMagazinesTurret ["200Rnd_127x99_mag_Tracer_Green",[-1]];
};
if (_veh isEqualTo "B_APC_Tracked_01_CRV_F") Then {
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_belt",[-1]];
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_belt",[0]];
};
if (_veh isEqualTo "B_APC_Tracked_01_rcws_F") Then {
	_vehicle removeMagazinesTurret ["96Rnd_40mm_G_belt",[0]];
	_vehicle removeMagazinesTurret ["96Rnd_40mm_G_belt",[0]];
};

if (_veh isEqualTo "O_APC_Wheeled_02_rcws_F") Then {
	_vehicle removeMagazinesTurret ["96Rnd_40mm_G_belt",[0]];
	_vehicle removeMagazinesTurret ["96Rnd_40mm_G_belt",[0]];
	_vehicle removeMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[0]];
};

if (_veh isEqualTo "B_APC_Tracked_01_CRV_F") Then {
	_vehicle removeMagazineTurret ["2000Rnd_65x39_belt",[0]];
};
if (_veh isEqualTo "B_APC_Tracked_01_rcws_F") Then {
	_vehicle removeMagazineTurret ["500Rnd_127x99_mag_Tracer_Red",[-1]];
	_vehicle removeMagazineTurret ["96Rnd_40mm_G_belt",[0]];
};

if (_veh isEqualTo "O_T_VTOL_02_infantry_F") Then {

	_vehicle removeMagazineTurret ["38Rnd_80mm_rockets",[0]];
	_vehicle removeMagazineTurret ["38Rnd_80mm_rockets",[-1]];
	_vehicle removeMagazinesTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
	_vehicle removeMagazinesTurret ["250Rnd_30mm_HE_shells_Tracer_Green",[0]];
	_vehicle removeMagazinesTurret ["8Rnd_LG_scalpel",[0]];
};

if (_veh isEqualTo "B_Plane_Fighter_01_F" || _veh isEqualTo "B_Plane_Fighter_01_Stealth_F") Then {

	_vehicle removeMagazineTurret ["Laserbatteries",[-1]];
	_vehicle removeMagazineTurret ["240Rnd_CMFlare_Chaff_Magazine",[-1]];
	_vehicle removeMagazineTurret ["magazine_Fighter01_Gun20mm_AA_x450",[-1]];
	_vehicle removeMagazineTurret ["PylonRack_Missile_AMRAAM_D_x1",[-1]];
	_vehicle removeMagazineTurret ["PylonRack_Missile_AGM_02_x2",[-1]];
	_vehicle removeMagazineTurret ["PylonMissile_Missile_BIM9X_x1",[-1]];
	_vehicle removeMagazineTurret ["PylonMissile_Missile_AMRAAM_D_INT_x1",[-1]];
	_vehicle removeMagazineTurret ["PylonMissile_Bomb_GBU12_x1",[-1]];
	_vehicle removeMagazineTurret ["Laserbatteries",[-1]];
	_vehicle removeMagazineTurret ["240Rnd_CMFlare_Chaff_Magazine",[-1]];
	_vehicle removeMagazineTurret ["magazine_Fighter01_Gun20mm_AA_x450",[-1]];
	_vehicle removeMagazineTurret ["PylonRack_Missile_AMRAAM_D_x1",[-1]];
	_vehicle removeMagazineTurret ["PylonRack_Missile_AGM_02_x2",[-1]];
	_vehicle removeMagazineTurret ["PylonMissile_Missile_BIM9X_x1",[-1]];
	_vehicle removeMagazineTurret ["PylonMissile_Missile_AMRAAM_D_INT_x1",[-1]];
	_vehicle removeMagazineTurret ["PylonMissile_Bomb_GBU12_x1",[-1]];
};

if (_veh isEqualTo "O_Plane_Fighter_02_F" || _veh isEqualTo "O_Plane_Fighter_02_Stealth_F") Then {

	_vehicle removeMagazineTurret ["Laserbatteries",[-1]];
	_vehicle removeMagazineTurret ["240Rnd_CMFlare_Chaff_Magazine",[-1]];
	_vehicle removeMagazineTurret ["magazine_Fighter02_Gun30mm_AA_x180",[-1]];
	_vehicle removeMagazineTurret ["PylonMissile_Missile_AA_R73_x1",[-1]];
	_vehicle removeMagazineTurret ["PylonMissile_Missile_AA_R77_x1",[-1]];
	_vehicle removeMagazineTurret ["PylonMissile_Bomb_KAB250_x1",[-1]];
	_vehicle removeMagazineTurret ["PylonMissile_Missile_AA_R77_INT_x1",[-1]];
	_vehicle removeMagazineTurret ["Laserbatteries",[-1]];
	_vehicle removeMagazineTurret ["240Rnd_CMFlare_Chaff_Magazine",[-1]];
	_vehicle removeMagazineTurret ["magazine_Fighter02_Gun30mm_AA_x180",[-1]];
	_vehicle removeMagazineTurret ["PylonMissile_Missile_AA_R73_x1",[-1]];
	_vehicle removeMagazineTurret ["PylonMissile_Missile_AA_R77_x1",[-1]];
	_vehicle removeMagazineTurret ["PylonMissile_Bomb_KAB250_x1",[-1]];
	_vehicle removeMagazineTurret ["PylonMissile_Missile_AA_R77_INT_x1",[-1]];
};

if (_veh isEqualTo "I_Plane_Fighter_04_F" ) Then {

	_vehicle removeMagazineTurret ["Laserbatteries",[-1]];
	_vehicle removeMagazineTurret ["240Rnd_CMFlare_Chaff_Magazine",[-1]];
	_vehicle removeMagazineTurret ["magazine_Fighter04_Gun20mm_AA_x250",[-1]];
	_vehicle removeMagazineTurret ["PylonMissile_Missile_BIM9X_x1",[-1]];
	_vehicle removeMagazineTurret ["PylonRack_Missile_AGM_02_x1",[-1]];
	_vehicle removeMagazineTurret ["PylonRack_Missile_AMRAAM_C_x1",[-1]];
	_vehicle removeMagazineTurret ["Laserbatteries",[-1]];
	_vehicle removeMagazineTurret ["240Rnd_CMFlare_Chaff_Magazine",[-1]];
	_vehicle removeMagazineTurret ["magazine_Fighter04_Gun20mm_AA_x250",[-1]];
	_vehicle removeMagazineTurret ["PylonMissile_Missile_BIM9X_x1",[-1]];
	_vehicle removeMagazineTurret ["PylonRack_Missile_AGM_02_x1",[-1]];
	_vehicle removeMagazineTurret ["PylonRack_Missile_AMRAAM_C_x1",[-1]];
};

if (_veh isEqualTo "B_UAV_02_F" ) Then {

	_vehicle removeMagazinesTurret ["Laserbatteries",[0]];
	_vehicle removeMagazinesTurret ["PylonRack_3Rnd_LG_scalpel",[0]];
	_vehicle removeMagazinesTurret ["6Rnd_LG_scalpel",[0]];
};

if (_veh isEqualTo "B_T_UAV_03_F" ) Then {

	_vehicle removeMagazinesTurret ["Laserbatteries",[0]];
	_vehicle removeMagazinesTurret ["PylonRack_12Rnd_missiles",[0]];
	_vehicle removeMagazinesTurret ["PylonRack_3Rnd_LG_scalpel",[0]];
	_vehicle removeMagazinesTurret ["6Rnd_LG_scalpel",[0]];
};

if (_veh isEqualTo "B_UAV_05_F" ) Then {

	_vehicle removeMagazinesTurret ["Laserbatteries",[0]];
	_vehicle removeMagazinesTurret ["PylonMissile_Bomb_GBU12_x1",[0]];

};

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;