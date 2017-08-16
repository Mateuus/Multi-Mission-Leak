/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Used for syncing house container data but when the inventory menu
	is closed a sync request is sent off to the server.
*/
private["_container"];
_container = param [1,ObjNull,[ObjNull]];
if(isNull _container) exitWith {}; //MEH

//LHM DonatorWeaponDrop START
player spawn lhm_fnc_DropDonWeapon;
//LHM DonatorWeaponDrop END

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
	[[_container],"TON_fnc_updateHouseContainers",false,false] call lhm_fnc_mp;
	SystemChat "StorageBox synchronized";
};

//////// LHM BASEBUILD START ////////
if((typeOf _container) == "B_CargoNet_01_ammo_F") exitWith {
	[[_container],"build_fnc_updateCargo",false,false] call lhm_fnc_mp;
	//SystemChat "StorageBox synchronized";
};

//bloodwyn
_gearold = lhm_gearA3;
[] call lhm_fnc_saveGearA3;
if(!(_gearold isEqualTo lhm_gearA3))then{
	[3] call SOCK_fnc_updatePartial;
};

[] call SOCK_fnc_updateRequest;
//diag_log "::lhm Client:: Player Session synced after inventory closed.";
//////// LHM BASEBUILD END /////////