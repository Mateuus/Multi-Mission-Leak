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

switch (_veh) do {
	case "B_Boat_Armed_01_minigun_F":
	{
		_vehicle removeMagazinesTurret ["200Rnd_40mm_G_belt",[0]];
	};
	case "B_APC_Wheeled_01_cannon_F":
	{
		_vehicle removeMagazinesTurret ["60Rnd_40mm_GPR_Tracer_Red_shells",[0]];
		_vehicle removeMagazinesTurret ["40Rnd_40mm_APFSDS_Tracer_Red_shells",[0]];
	};
	case "O_Heli_Attack_02_black_F":
	{
		_vehicle removeMagazinesTurret ["250Rnd_30mm_APDS_shells",[0]];
		_vehicle removeMagazinesTurret ["8Rnd_LG_scalpel",[0]];
		_vehicle removeMagazinesTurret ["38Rnd_80mm_rockets",[0]];
	};
	case "O_Heli_Light_02_F":
	{
		_vehicle removeMagazinesTurret ["12Rnd_PG_missiles",[0]];
	};
	case "I_Heli_light_03_F":
	{
		_vehicle removeMagazinesTurret ["24Rnd_missiles",[0]];
	};
	
	case "B_Heli_Transport_01_camo_F":
	{
		_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[1]];
	    _vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[2]];
	};

	case "B_UGV_01_rcws_F":
	{
		_vehicle removeWeaponTurret ["HMG_127",[0]];
		_vehicle removeWeaponTurret ["GMG_UGV_40mm",[0]];

		_vehicle removeMagazineTurret ["500Rnd_127x99_mag",[0]];
		_vehicle removeMagazineTurret ["200Rnd_40mm_G_belt",[0]];
	};

	case "O_Plane_CAS_02_F":
	{
		_vehicle removeMagazinesTurret ["500Rnd_Cannon_30mm_Plane_CAS_02_F",[0]];
		_vehicle removeMagazinesTurret ["2Rnd_Missile_AA_03_F",[0]];
		_vehicle removeMagazinesTurret ["4Rnd_Missile_AGM_01_F",[0]];
		_vehicle removeMagazinesTurret ["2Rnd_Bomb_03_F",[0]];
		_vehicle removeMagazinesTurret ["20Rnd_Rocket_03_HE_F",[0]];
		_vehicle removeMagazinesTurret ["20Rnd_Rocket_03_AP_F",[0]];
		_vehicle removeWeaponTurret ["Cannon_30mm_Plane_CAS_02_F",[-1]];
		_vehicle removeWeaponTurret ["Missile_AA_03_Plane_CAS_02_F",[-1]];
		_vehicle removeWeaponTurret ["Missile_AGM_01_Plane_CAS_02_F",[-1]];
		_vehicle removeWeaponTurret ["Rocket_03_HE_Plane_CAS_02_F",[-1]];
		_vehicle removeWeaponTurret ["Rocket_03_AP_Plane_CAS_02_F",[-1]];
		_vehicle removeWeaponTurret ["Bomb_03_Plane_CAS_02_F",[-1]];

		_vehicle setVehicleAmmo 0;
		_vehicle setVehicleAmmoDef 0;
	};
	case "I_Plane_Fighter_03_AA_F":
	{
		_vehicle removeMagazinesTurret ["300Rnd_20mm_shells",[0]];
		_vehicle removeMagazinesTurret ["2Rnd_AAA_missiles",[0]];
		_vehicle removeMagazinesTurret ["4Rnd_GAA_missiles",[0]];
		_vehicle removeWeaponTurret ["Twin_Cannon_20mm",[-1]];
		_vehicle removeWeaponTurret ["missiles_Zephyr",[-1]];
		_vehicle removeWeaponTurret ["missiles_ASRAAM",[-1]];

		_vehicle setVehicleAmmo 0;
		_vehicle setVehicleAmmoDef 0;
	};
};

if(_veh == "B_Heli_Transport_01_F") then 
{
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[1]];
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[2]];
};

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;