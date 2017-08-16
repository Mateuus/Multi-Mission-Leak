/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Clears ammo from vehicles that are too OP
*/

private["_vehicle","_vehType"];

_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _vehicle)exitwith{};

_vehType = typeOf _vehicle;

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;

switch(_vehType)do {
	case "B_Plane_Fighter_01_F": {
		_vehicle disableTIEquipment false;
		_vehicle removeMagazinesTurret ["magazine_Fighter01_Gun20mm_AA_x450",[-1]];
		private _pylons = [];
		private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _vehicle >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
		private _nonPylonWeapons = [];
		{ _nonPylonWeapons append getArray (_x >> "weapons") } forEach ([_vehicle, configNull] call BIS_fnc_getTurrets);
		{ _vehicle removeWeaponGlobal _x } forEach ((weapons _vehicle) - _nonPylonWeapons);
		{ _vehicle setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
	};
	case "O_Plane_Fighter_02_F": {
		_vehicle disableTIEquipment false;
		_vehicle removeMagazinesTurret ["magazine_Fighter02_Gun30mm_AA_x180",[-1]];
		private _pylons = [];
		private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _vehicle >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
		private _nonPylonWeapons = [];
		{ _nonPylonWeapons append getArray (_x >> "weapons") } forEach ([_vehicle, configNull] call BIS_fnc_getTurrets);
		{ _vehicle removeWeaponGlobal _x } forEach ((weapons _vehicle) - _nonPylonWeapons);
		{ _vehicle setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
	};
	case "I_Plane_Fighter_04_F": {
		_vehicle disableTIEquipment false;
		_vehicle removeMagazinesTurret ["magazine_Fighter04_Gun20mm_AA_x250",[-1]];
		private _pylons = [];
		private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _vehicle >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
		private _nonPylonWeapons = [];
		{ _nonPylonWeapons append getArray (_x >> "weapons") } forEach ([_vehicle, configNull] call BIS_fnc_getTurrets);
		{ _vehicle removeWeaponGlobal _x } forEach ((weapons _vehicle) - _nonPylonWeapons);
		{ _vehicle setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
	};
	case "B_APC_Wheeled_01_cannon_F": {
		_vehicle disableTIEquipment false;
		_vehicle removeMagazinesTurret ["60Rnd_40mm_GPR_Tracer_Red_shells",[0]];
		_vehicle removeMagazinesTurret ["60Rnd_40mm_GPR_Tracer_Red_shells",[0]];
		_vehicle removeMagazinesTurret ["40Rnd_40mm_APFSDS_Tracer_Red_shells",[0]];
		_vehicle removeMagazinesTurret ["40Rnd_40mm_APFSDS_Tracer_Red_shells",[0]];
		_vehicle addWeapon "SmokeLauncher";
		_vehicle addMagazineTurret ["SmokeLauncherMag",[0]];
		_vehicle addMagazineTurret ["SmokeLauncherMag",[0]];
		_vehicle addMagazineTurret ["SmokeLauncherMag",[0]];
		_vehicle addMagazineTurret ["SmokeLauncherMag",[0]];
		_vehicle addMagazineTurret ["SmokeLauncherMag",[0]];
		_vehicle addMagazineTurret ["SmokeLauncherMag",[0]];
		_vehicle addMagazineTurret ["SmokeLauncherMag",[0]];
		_vehicle addMagazineTurret ["SmokeLauncherMag",[0]];
		_vehicle addMagazineTurret ["SmokeLauncherMag",[0]];
		_vehicle addMagazineTurret ["SmokeLauncherMag",[0]];
		_vehicle addMagazineTurret ["SmokeLauncherMag",[0]];
		_vehicle addMagazineTurret ["SmokeLauncherMag",[0]];
		_vehicle addMagazineTurret ["SmokeLauncherMag",[0]];
		_vehicle addMagazineTurret ["SmokeLauncherMag",[0]];
		_vehicle addWeapon "TruckHorn3";
		_vehicle addWeapon "SEARCHLIGHT";
		_vehicle addWeapon "HMG_127_APC";
		if(!(_vehicle getVariable ["vehAmmo",false]))then {
			_vehicle animate ["HideTurret",1];
			_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt",[0]];
			_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt",[0]];
			_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt",[0]];
			_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt",[0]];
			_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt",[0]];
		} else {
			_vehicle animate ["HideTurret",0];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[0]];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[0]];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[0]];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[0]];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[0]];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[0]];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[0]];
			_vehicle addMagazineTurret ["2000Rnd_65x39_Belt",[0]];
			_vehicle addMagazineTurret ["2000Rnd_65x39_Belt",[0]];
			_vehicle addMagazineTurret ["2000Rnd_65x39_Belt",[0]];
			_vehicle addMagazineTurret ["2000Rnd_65x39_Belt",[0]];
			_vehicle addMagazineTurret ["2000Rnd_65x39_Belt",[0]];
		};
	};
	case "O_APC_Wheeled_02_rcws_F": {
		_vehicle disableTIEquipment false;
		_vehicle removeMagazinesTurret ["96Rnd_40mm_G_belt",[0]];
		_vehicle removeMagazinesTurret ["96Rnd_40mm_G_belt",[0]];
		if(!(_vehicle getVariable ["vehAmmo",false]))then {
			_vehicle animate ["HideTurret",1];
			_vehicle removeMagazinesTurret ["500Rnd_127x99_mag_Tracer_Green",[0]];
			_vehicle removeMagazinesTurret ["500Rnd_127x99_mag_Tracer_Green",[0]];
			_vehicle removeMagazinesTurret ["500Rnd_127x99_mag_Tracer_Green",[0]];
			_vehicle removeMagazinesTurret ["500Rnd_127x99_mag_Tracer_Green",[0]];
			_vehicle removeMagazinesTurret ["500Rnd_127x99_mag_Tracer_Green",[0]];
		} else {
			_vehicle animate ["HideTurret",0];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[0]];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[0]];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[0]];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[0]];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[0]];
		};
	};
	case "O_T_LSV_02_armed_F": {
		if(_vehicle getVariable ["vehAmmo",false])then {
			_vehicle addMagazineTurret ["500Rnd_65x39_Belt",[0]];
			_vehicle addMagazineTurret ["500Rnd_65x39_Belt",[0]];
			_vehicle addMagazineTurret ["500Rnd_65x39_Belt",[0]];
			_vehicle addMagazineTurret ["500Rnd_65x39_Belt",[0]];
			_vehicle addMagazineTurret ["500Rnd_65x39_Belt",[0]];
		};
	};
	case "B_T_LSV_01_armed_F": {
		if(_vehicle getVariable ["vehAmmo",false])then {
			_vehicle addMagazineTurret ["500Rnd_127x99_mag",[0]];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag",[0]];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag",[0]];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag",[0]];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag",[0]];
		};
	};
	case "O_T_VTOL_02_infantry_F": {
		_vehicle removeMagazinesTurret ["38Rnd_80mm_rockets",[0]];
		_vehicle removeMagazinesTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
		_vehicle removeMagazinesTurret ["250Rnd_30mm_HE_shells_Tracer_Green",[0]];
		_vehicle removeMagazinesTurret ["8Rnd_LG_scalpel",[0]];
	};
	case "O_T_VTOL_02_vehicle_F": {
		_vehicle removeMagazinesTurret ["38Rnd_80mm_rockets",[0]];
		_vehicle removeMagazinesTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
		_vehicle removeMagazinesTurret ["250Rnd_30mm_HE_shells_Tracer_Green",[0]];
		_vehicle removeMagazinesTurret ["8Rnd_LG_scalpel",[0]];
	};
	case "B_Heli_Attack_01_F": {
		_vehicle removeMagazinesTurret ["4Rnd_AAA_missiles",[0]];
		_vehicle removeMagazinesTurret ["24Rnd_PG_missiles",[0]];
		_vehicle addWeapon "gatling_30mm";
		_vehicle addMagazineTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
		_vehicle addMagazineTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
		_vehicle addMagazineTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
		_vehicle removeMagazinesTurret ["1000Rnd_20mm_shells",[0]];
		_vehicle removeMagazinesTurret ["1000Rnd_20mm_shells",[0]];
		_vehicle addMagazineTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
		_vehicle addMagazineTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
		_vehicle addMagazineTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
		_vehicle addMagazineTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
		_vehicle addMagazineTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
		_vehicle addMagazineTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
		_vehicle addMagazineTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
		_vehicle addMagazineTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
		_vehicle addMagazineTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
		_vehicle addMagazineTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
		_vehicle setVariable["securityAdv",true,true];
		_vehicle setVariable["fuelAdv",true,true];
	};
	case "B_Heli_Transport_01_camo_F": {
		_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[1]];
		_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[1]];
		_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[1]];
		_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[1]];
		_vehicle addWeapon "HMG_127";
	};
	case "B_Heli_Transport_01_F": {
		_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[1]];
		_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[1]];
		_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[1]];
		_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[1]];
		_vehicle addWeapon "HMG_127";
	};
	case "I_APC_Wheeled_03_cannon_F": {
		_vehicle removeMagazinesTurret ["2Rnd_GAT_missiles",[0]];
		_vehicle removeMagazinesTurret ["140Rnd_30mm_MP_shells_Tracer_Yellow",[0]];
		_vehicle removeMagazinesTurret ["60Rnd_30mm_APFSDS_shells_Tracer_Yellow",[0]];
		if(_vehicle getVariable ["vehAmmo",false])then {
			_vehicle addWeapon "HMG_127";
			_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[0]];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[0]];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[0]];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[0]];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[0]];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[0]];
			_vehicle addMagazineTurret ["1000Rnd_65x39_Belt_Yellow",[0]];
			_vehicle addMagazineTurret ["1000Rnd_65x39_Belt_Yellow",[0]];
			_vehicle addMagazineTurret ["1000Rnd_65x39_Belt_Yellow",[0]];
			_vehicle addMagazineTurret ["1000Rnd_65x39_Belt_Yellow",[0]];
			_vehicle addMagazineTurret ["1000Rnd_65x39_Belt_Yellow",[0]];
		};
	};
	case "I_Plane_Fighter_03_AA_F": {
		_vehicle removeMagazinesTurret ["300Rnd_20mm_shells",[-1]];
		_vehicle removeMagazinesTurret ["2Rnd_AAA_missiles",[-1]];
		_vehicle removeMagazinesTurret ["4Rnd_GAA_missiles",[-1]];
		if(playerSide isEqualTo west)then {
			_vehicle addWeapon "mortar_82mm";
			_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[-1]];
			_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[-1]];
			_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[-1]];
			_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[-1]];
		};
	};
	case "B_MRAP_01_hmg_F": {
		_vehicle addWeapon "mortar_82mm";
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Flare_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Flare_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Flare_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Flare_white",[0]];
		if(_vehicle getVariable ["vehAmmo",false])then {
			_vehicle addMagazineTurret ["500Rnd_127x99_mag",[0]];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag",[0]];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag",[0]];
		};
	};
	case "B_G_Offroad_01_armed_F": {
		if(_vehicle getVariable ["vehAmmo",false])then {
			_vehicle addWeapon "HMG_127";
			_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[1]];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[1]];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[1]];
		};
	};
	case "I_MRAP_03_hmg_F": {
		if(_vehicle getVariable ["vehAmmo",false])then {
			_vehicle addMagazineTurret ["500Rnd_127x99_mag",[0]];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag",[0]];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag",[0]];
		};
	};
	case "O_MRAP_02_hmg_F": {
		if(_vehicle getVariable ["vehAmmo",false])then {
			_vehicle addMagazineTurret ["500Rnd_127x99_mag",[0]];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag",[0]];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag",[0]];
		};
	};
	case "B_Plane_CAS_01_F": {
		_vehicle removeMagazinesTurret ["1000Rnd_Gatling_30mm_Plane_CAS_01_F",[-1]];
		_vehicle removeMagazinesTurret ["2Rnd_Missile_AA_04_F",[-1]];
		_vehicle removeMagazinesTurret ["6Rnd_Missile_AGM_02_F",[-1]];
		_vehicle removeMagazinesTurret ["4Rnd_Bomb_04_F",[-1]];
		_vehicle removeMagazinesTurret ["7Rnd_Rocket_04_HE_F",[-1]];
		_vehicle removeMagazinesTurret ["7Rnd_Rocket_04_AP_F",[-1]];
	};
	case "O_Plane_CAS_02_F": {
		_vehicle removeMagazinesTurret ["500Rnd_Cannon_30mm_Plane_CAS_02_F",[-1]];
		_vehicle removeMagazinesTurret ["2Rnd_Missile_AA_03_F",[-1]];
		_vehicle removeMagazinesTurret ["4Rnd_Missile_AGM_01_F",[-1]];
		_vehicle removeMagazinesTurret ["2Rnd_Bomb_03_F",[-1]];
		_vehicle removeMagazinesTurret ["20Rnd_Rocket_03_HE_F",[-1]];
		_vehicle removeMagazinesTurret ["20Rnd_Rocket_03_AP_F",[-1]];
		if(playerSide isEqualTo west)then {
			_vehicle addWeapon "mortar_82mm";
			_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[-1]];
			_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[-1]];
			_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[-1]];
			_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[-1]];
		};
	};
	case "O_Boat_Armed_01_hmg_F": {
		_vehicle removeMagazinesTurret ["200Rnd_40mm_G_belt",[0]];
	};
	case "B_Boat_Armed_01_minigun_F": {
		_vehicle removeMagazinesTurret ["200Rnd_40mm_G_belt",[0]];
	};
	case "I_MRAP_03_F": {
		_vehicle addWeapon "mortar_82mm";
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[-1]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[-1]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[-1]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[-1]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Flare_white",[-1]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Flare_white",[-1]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Flare_white",[-1]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Flare_white",[-1]];
	};
	case "O_MRAP_02_F": {
		_vehicle addWeapon "mortar_82mm";
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[-1]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[-1]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[-1]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[-1]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Flare_white",[-1]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Flare_white",[-1]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Flare_white",[-1]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Flare_white",[-1]];
	};
	case "B_APC_Wheeled_01_cannon_F": {
		_vehicle removeMagazinesTurret ["60Rnd_40mm_GPR_Tracer_Red_shells",[0]];
		_vehicle removeMagazinesTurret ["40Rnd_40mm_APFSDS_Tracer_Red_shells",[0]];
		_vehicle addWeapon "mortar_82mm";
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Flare_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Flare_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Flare_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Flare_white",[0]];
	};
	case "O_G_Offroad_01_armed_F": {
		_vehicle removeMagazinesTurret ["100Rnd_127x99_mag_Tracer_Yellow",[0]];
		_vehicle removeMagazinesTurret ["100Rnd_127x99_mag_Tracer_Yellow",[0]];
		_vehicle removeMagazinesTurret ["100Rnd_127x99_mag_Tracer_Yellow",[0]];
		_vehicle removeMagazinesTurret ["100Rnd_127x99_mag_Tracer_Yellow",[0]];
		_vehicle addMagazineTurret ["200Rnd_65x39_Belt_Tracer_Yellow",[0]];
		_vehicle addMagazineTurret ["200Rnd_65x39_Belt_Tracer_Yellow",[0]];
		_vehicle addMagazineTurret ["200Rnd_65x39_Belt_Tracer_Yellow",[0]];
		_vehicle addMagazineTurret ["200Rnd_65x39_Belt_Tracer_Yellow",[0]];
		_vehicle addWeapon "LMG_M200";
		_vehicle addWeapon "mortar_82mm";
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Flare_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Flare_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Flare_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Flare_white",[0]];
		if(_vehicle getVariable ["vehAmmo",false])then {
			_vehicle addWeapon "HMG_127";
			_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[0]];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[0]];
			_vehicle addMagazineTurret ["500Rnd_127x99_mag_Tracer_Green",[0]];
		};
	};
	case "B_Heli_Light_01_armed_F": {
		_vehicle removeMagazinesTurret ["24Rnd_missiles",[-1]];
		_vehicle removeMagazinesTurret ["24Rnd_missiles",[-1]];
		_vehicle removeMagazinesTurret ["5000Rnd_762x51_Belt",[-1]];
		_vehicle removeMagazinesTurret ["5000Rnd_762x51_Belt",[-1]];
		_vehicle addWeapon "LMG_Minigun_Transport";
		_vehicle addMagazineTurret ["2000Rnd_65x39_Belt_Tracer_Red",[-1]];
		_vehicle addMagazineTurret ["2000Rnd_65x39_Belt_Tracer_Red",[-1]];
		if(_vehicle getVariable ["vehAmmo",false])then {
			_vehicle addMagazineTurret ["2000Rnd_65x39_Belt_Tracer_Red",[-1]];
			_vehicle addMagazineTurret ["2000Rnd_65x39_Belt_Tracer_Red",[-1]];
			_vehicle addMagazineTurret ["2000Rnd_65x39_Belt_Tracer_Red",[-1]];
			_vehicle addMagazineTurret ["2000Rnd_65x39_Belt_Tracer_Red",[-1]];
			_vehicle addMagazineTurret ["2000Rnd_65x39_Belt_Tracer_Red",[-1]];
			_vehicle addMagazineTurret ["2000Rnd_65x39_Belt_Tracer_Red",[-1]];
			_vehicle addMagazineTurret ["2000Rnd_65x39_Belt_Tracer_Red",[-1]];
		};
	};
	case "O_Heli_Light_02_F": {
		_vehicle removeMagazinesTurret ["12Rnd_PG_missiles",[-1]];
		_vehicle removeMagazinesTurret ["12Rnd_PG_missiles",[-1]];
		if(_vehicle getVariable ["vehAmmo",false])then {
			_vehicle addMagazineTurret ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[-1]];
			_vehicle addMagazineTurret ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[-1]];
			_vehicle addMagazineTurret ["2000Rnd_65x39_Belt_Tracer_Green_Splash",[-1]];
		};
	};
	case "O_Heli_Attack_02_black_F": {
		_vehicle removeMagazinesTurret ["8Rnd_LG_scalpel",[0]];
		_vehicle removeMagazinesTurret ["8Rnd_LG_scalpel",[0]];
		_vehicle removeMagazinesTurret ["8Rnd_LG_scalpel",[0]];
		_vehicle removeMagazinesTurret ["38Rnd_80mm_rockets",[0]];
		_vehicle removeMagazinesTurret ["38Rnd_80mm_rockets",[0]];
		_vehicle removeMagazinesTurret ["38Rnd_80mm_rockets",[0]];
		_vehicle removeMagazinesTurret ["250Rnd_30mm_HE_shells_Tracer_Green",[0]];
		_vehicle addMagazineTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
		_vehicle addMagazineTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
		_vehicle addMagazineTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
		_vehicle addWeapon "mortar_82mm";
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Flare_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Flare_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Flare_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Flare_white",[0]];
		if(_vehicle getVariable ["vehAmmo",false])then {
			_vehicle addMagazineTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
			_vehicle addMagazineTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
			_vehicle addMagazineTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
			_vehicle addMagazineTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
			_vehicle addMagazineTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
			_vehicle addMagazineTurret ["250Rnd_30mm_APDS_shells_Tracer_Green",[0]];
		};
	};
	case "I_Heli_light_03_F": {
		_vehicle removeMagazinesTurret ["24Rnd_missiles",[-1]];
		_vehicle removeMagazinesTurret ["24Rnd_missiles",[-1]];
		if((player getVariable ["policeSquad",""]) != "Coast Guard")then {
			_vehicle removeMagazinesTurret ["5000Rnd_762x51_Yellow_Belt",[-1]];
			_vehicle removeMagazinesTurret ["5000Rnd_762x51_Yellow_Belt",[-1]];
		};
		if(playerside isEqualTo civilian)then {
			_vehicle addMagazineTurret ["5000Rnd_762x51_Yellow_Belt",[-1]];
			_vehicle addMagazineTurret ["5000Rnd_762x51_Yellow_Belt",[-1]];
			_vehicle addMagazineTurret ["5000Rnd_762x51_Yellow_Belt",[-1]];
			_vehicle addMagazineTurret ["5000Rnd_762x51_Yellow_Belt",[-1]];
			_vehicle addMagazineTurret ["5000Rnd_762x51_Yellow_Belt",[-1]];
			_vehicle addMagazineTurret ["5000Rnd_762x51_Yellow_Belt",[-1]];
			_vehicle addMagazineTurret ["5000Rnd_762x51_Yellow_Belt",[-1]];
			_vehicle addMagazineTurret ["5000Rnd_762x51_Yellow_Belt",[-1]];
			_vehicle addMagazineTurret ["5000Rnd_762x51_Yellow_Belt",[-1]];
			_vehicle addMagazineTurret ["5000Rnd_762x51_Yellow_Belt",[-1]];
		};
		_vehicle addWeapon "mortar_82mm";
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Smoke_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Flare_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Flare_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Flare_white",[0]];
		_vehicle addMagazineTurret ["8Rnd_82mm_Mo_Flare_white",[0]];
	};
	case "B_Heli_Transport_03_black_F": {
		_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[2]];
		_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[2]];
		_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[1]];
		_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[1]];
		_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[0]];
		_vehicle animate["HideMiniguns",1];
	};
};