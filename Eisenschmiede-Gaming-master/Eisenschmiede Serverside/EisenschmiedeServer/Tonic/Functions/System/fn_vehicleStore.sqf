#include "\EisenschmiedeServer\Tonic\script_macros.hpp"
/*
	File: fn_vehicleStore.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Stores the vehicle in the 'Garage'
*/
/*
	File: fn_vehicleStore.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Stores the vehicle in the 'Garage'
*/
private["_vehicle","_impound","_vInfo","_vInfo","_plate","_uid","_query","_sql","_unit","_trunk","_vehItems","_vehMags","_vehWeapons","_vehBackpacks","_cargo"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_impound = [_this,1,false,[true]] call BIS_fnc_param;
_unit = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _vehicle OR isNull _unit) exitWith {ES_impound_inuse = false; (owner _unit) publicVariableClient "ES_impound_inuse";ES_garage_store = false;(owner _unit) publicVariableClient "ES_garage_store";}; //Bad data passed.

_vInfo = _vehicle getVariable["dbInfo",[]];

if(count _vInfo > 0) then {
	_plate = _vInfo select 1;
	_uid = _vInfo select 0;
};

//Save vehicle inventory
if(save_veh_virtualItems) then {
	_trunk = _vehicle getVariable["Trunk",[[],0]];
	_trunk = [_trunk] call ES_fnc_mresArray;
} else {
	_trunk = [[],0];
};


if((_unit getVariable "save_veh_gear")) then {
	_vehItems = getItemCargo _vehicle;
	_vehMags = getMagazineCargo _vehicle;
	_vehWeapons = getWeaponCargo _vehicle;
	_vehBackpacks = getBackpackCargo _vehicle;
	_cargo = [_vehItems,_vehMags,_vehWeapons,_vehBackpacks];
	_cargo = [_cargo] call ES_fnc_mresArray;
} else {
	_cargo = [];
};

if(_impound) then {
	if(count _vInfo == 0) then  {
		ES_impound_inuse = false;
		(owner _unit) publicVariableClient "ES_impound_inuse";
		if(!isNil "_vehicle" && {!isNull _vehicle}) then {
			deleteVehicle _vehicle;
		};
	} else {
		_cargo = [];
		_query = format["UPDATE vehicles SET active='0', inventory='%3', gear='%4', fuel='%5' WHERE pid='%1' AND plate='%2'",_uid,_plate,_trunk,_cargo,fuel _vehicle];

		_thread = [_query,1] call ES_fnc_asyncCall;
		//waitUntil {scriptDone _thread};
		if(!isNil "_vehicle" && {!isNull _vehicle}) then {
			deleteVehicle _vehicle;
		};
		ES_impound_inuse = false;
		(owner _unit) publicVariableClient "ES_impound_inuse";
	};
} else {
	if(count _vInfo == 0) exitWith {
		[1,(localize "STR_Garage_Store_NotPersistent")] remoteExecCall ["ES_fnc_broadcast",(owner _unit)];
		ES_garage_store = false;
		(owner _unit) publicVariableClient "ES_garage_store";
	};

	if(_uid != getPlayerUID _unit) exitWith {
		[1,(localize "STR_Garage_Store_NoOwnership")] remoteExecCall ["ES_fnc_broadcast",(owner _unit)];
		ES_garage_store = false;
		(owner _unit) publicVariableClient "ES_garage_store";
	};

	_query = format["UPDATE vehicles SET active='0', inventory='%3', gear='%4', fuel='%5' WHERE pid='%1' AND plate='%2'",_uid,_plate,_trunk,_cargo,fuel _vehicle];

	_thread = [_query,1] call ES_fnc_asyncCall;
	//waitUntil {scriptDone _thread};
	if(!isNil "_vehicle" && {!isNull _vehicle}) then {
		deleteVehicle _vehicle;
	};
	ES_garage_store = false;
	(owner _unit) publicVariableClient "ES_garage_store";
	[1,(localize "STR_Garage_Store_Success")] remoteExecCall ["ES_fnc_broadcast",(owner _unit)];
};
