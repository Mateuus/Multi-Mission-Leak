/*

    File: fn_clearVehicleAmmo.sqf
	Autor: TheTotenkopf™
	
	Description: Entfernt alle Waffen/Flaires und Repairiert sie noch einmal falls beim Spawnen etwas zerstört wurde.

*/
private["_veh","_classname","_vehicle"];

_veh = _this select 0;
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_classname = typeOf _veh;

switch (_classname) do
{	
	//Y32
	case "O_T_VTOL_02_vehicle_F":
	{
		//Remove ammo and Flaires
		_veh setVehicleAmmo 0;
		_veh setDamage 0;
		_veh allowDamage true;
		systemChat "Waffen entfernt und repariert";
		{
			_veh removeWeaponGlobal _x;
		} foreach weapons _veh;
	};
	
	//Cop Hellcat
	case "I_Heli_light_03_F":
	{
		//Remove ammo and Flaires
		_veh setVehicleAmmo 0;
		_veh setDamage 0;
		_veh allowDamage true;
		systemChat "Waffen entfernt und repariert";
		{
			_veh removeWeaponGlobal _x;
		} foreach weapons _veh;
	};
	

	//To-199 Neophron (CAS)
	case "O_Plane_CAS_02_F":
	{
		//Remove ammo and Flaires
		_veh setVehicleAmmo 0;
		_veh setDamage 0;
		_veh allowDamage true;
        systemChat "Waffen entfernt und Repariert";
		{
			_veh removeWeaponGlobal _x;
		} foreach weapons _veh;
    };
	
	//Wipeout
	case "B_Plane_CAS_01_F":
	{
		//Remove ammo and Flaires
		_veh setVehicleAmmo 0;
		_veh setDamage 0;
		_veh allowDamage true;
        systemChat "Waffen entfernt und Repariert";
		{
			_veh removeWeaponGlobal _x;
		} foreach weapons _veh;
    };
	
	//Buzzard
	case "I_Plane_Fighter_03_CAS_F":
	{
		//Remove ammo and Flaires
		_veh setVehicleAmmo 0;
		_veh setDamage 0;
		_veh allowDamage true;
        systemChat "Waffen entfernt und Repariert";
		{
			_veh removeWeapon _x;
		} foreach weapons _veh;
    };
	
	//GhostHawk (Black)
    case "B_Heli_Transport_01_F":
    {
        //Remove ammo and Flaires
		_veh setVehicleAmmo 0;
		_veh setDamage 0;
		_veh allowDamage true;
        systemChat "Waffen entfernt und Repariert";
		{
			_veh removeWeapon _x;
		} foreach weapons _veh;
    };

	//GhostHawk (Camo)
	case "B_Heli_Transport_01_camo_F":
    {
        //Remove ammo and Flaires
        _veh setVehicleAmmo 0;
		_veh setDamage 0;
		_veh allowDamage true;
        systemChat "Waffen entfernt und Repariert";
		{
			_veh removeWeapon _x;
		} foreach weapons _veh;
    };

	//Hellcat (Unarmed)
	case "I_Heli_light_03_unarmed_F":
    {
        //Remove ammo and Flaires
        _veh setVehicleAmmo 0;
		_veh setDamage 0;
		_veh allowDamage true;
        systemChat "Waffen entfernt und Repariert";
    };

	//Mohawk
	case "I_Heli_Transport_02_F":
    {
        //Remove ammo and Flaires
        _veh setVehicleAmmo 0;
		_veh setDamage 0;
		_veh allowDamage true;
        systemChat "Waffen entfernt und Repariert";
    };
	
	//MiniGun Boat
	case "B_Boat_Armed_01_minigun_F":
	{
		//Remove ammo and Flaires
		_veh setVehicleAmmo 0;
		_veh setDamage 0;
		_veh allowDamage true;
		{
			_veh removeWeapon _x;
		} foreach weapons _veh;
	};
	
	//Gorgon
	case "I_APC_Wheeled_03_cannon_F":
	{
		//Remove ammo and Flaires
		_veh setVehicleAmmo 0;
		_veh setDamage 0;
		_veh addMagazine ["1000Rnd_65x39_Belt_Yellow", 75];
		_veh allowDamage true;
		systemChat "Waffen entfernt und Repariert";
	};
	
	//Box
	case "C_supplyCrate_F":
	{
		//Remove ammo and Flaires
		_veh setVehicleAmmo 0;
		_veh setDamage 0;
		_veh allowDamage true;
		systemChat "Waffen entfernt und Repariert";
	};
	
	//Box
	case "Box_IND_AmmoVeh_F":
	{
		//Remove ammo and Flaires
		_veh setVehicleAmmo 0;
		_veh setDamage 0;
		_veh allowDamage true;
		systemChat "Waffen entfernt und Repariert";
	};
	
	//Box
	case "B_Slingload_01_Cargo_F":
	{
		//Remove ammo and Flaires
		_veh setVehicleAmmo 0;
		_veh setDamage 0;
		_veh allowDamage true;
		systemChat "Waffen entfernt und Repariert";
	};
	
	//Box
	case "B_Slingload_01_Fuel_F":
	{
		//Remove ammo and Flaires
		_veh setVehicleAmmo 0;
		_veh setDamage 0;
		_veh allowDamage true;
		systemChat "Waffen entfernt und Repariert";
	};
	
	//Boote
	case "C_Boat_Transport_02_F":
	{
		//Remove ammo and Flaires
		_veh setVehicleAmmo 0;
		_veh setDamage 0;
		_veh allowDamage true;
		{
			_veh removeWeapon _x;
		} foreach weapons _veh;
	};
	case "I_C_Boat_Transport_02_F":
	{
		//Remove ammo and Flaires
		_veh setVehicleAmmo 0;
		_veh setDamage 0;
		_veh allowDamage true;
		{
			_veh removeWeapon _x;
		} foreach weapons _veh;
	};
	case "O_Boat_Armed_01_hmg_F":
	{
		//Remove ammo and Flaires
		_veh setVehicleAmmo 0;
		_veh setDamage 0;
		_veh allowDamage true;
		{
			_veh removeWeapon _x;
		} foreach weapons _veh;
	};
	case "I_Boat_Armed_01_minigun_F":
	{
		//Remove ammo and Flaires
		_veh setVehicleAmmo 0;
		_veh setDamage 0;
		_veh allowDamage true;
		{
			_veh removeWeapon _x;
		} foreach weapons _veh;
	};
	
	//Verhindert das Slingloaden von HEMTT und Zamak (des nervt und zerstört RP :lol:)
	case "B_Truck_01_covered_F":
	{
		_veh enableRopeAttach false;
	};
	case "B_Truck_01_transport_F":
	{
		_veh enableRopeAttach false;
	};
	case "O_Truck_03_covered_F":
	{
		_veh enableRopeAttach false;
	};
};

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;

//Kein Boot-Slingloading mehr
if(_veh isKindOf "Ship") then { _veh enableRopeAttach false; };