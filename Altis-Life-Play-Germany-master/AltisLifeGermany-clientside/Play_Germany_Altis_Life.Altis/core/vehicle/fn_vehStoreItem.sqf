#include <macro.h>
#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehStoreItem.sqf
	Author: Bryan "Tonic" Boardwine
	Modified by: RafiQuak for PlayGermany

	Description:
	Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
	if the vehicle has room for the item.
*/
private["_ctrl","_num","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val"];
disableSerialization;

if(!(life_trunk_vehicle getVariable "trunk_in_use" == profileName)) exitWith {hint "Jemand anderes greift jetzt auf den Kofferraum zu."; closeDialog 0;};

_ctrl = ctrlSelData(3503);
_num = ctrlText 3506;
if(!([_num] call TON_fnc_isnumber)) exitWith {hint "Invalid Number format";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "You can't enter anything below 1!";};

if(life_trunk_vehicle isKindOf "House_F") then {
	_mWeight = 0;
	{_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);} foreach (life_trunk_vehicle getVariable["containers",[]]);
	_totalWeight = [_mWeight,(life_trunk_vehicle getVariable["Trunk",[[],0]]) select 1];
} else {
	_totalWeight = [life_trunk_vehicle] call life_fnc_vehicleWeight;
};
_itemWeight = ([_ctrl] call life_fnc_itemWeight) * _num;
_veh_data = life_trunk_vehicle getVariable ["Trunk",[[],0]];
_inv = _veh_data select 0;

if(_ctrl == "goldbar" && {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "Ship" OR life_trunk_vehicle isKindOf "House_F" OR typeOf life_trunk_vehicle == "B_Slingload_01_Repair_F")}) exitWith {hint "Du kannst das nur in einem Fahrzeug lagern!"};
if(_ctrl == "goldbar" && life_trunk_vehicle getVariable["RopeAttach",false]) then {[life_trunk_vehicle] spawn life_fnc_slingloadoff};

if(typeOf life_trunk_vehicle != "B_Truck_01_ammo_F" && _ctrl in ["uranium_ore","uranium_cleaned","uranium_processed","uranium_enriched","uranium_fuelrod","uranium_dirty"]) exitWith {hint "Die Strahlung des Uran ist zu hoch und kann nicht in diesem Fahrzeug gelagert werden!"};
if(!(typeOf life_trunk_vehicle in ["C_Van_01_fuel_F","C_Truck_02_fuel_F","O_Truck_03_fuel_F","B_Truck_01_fuel_F"]) && _ctrl in ["oil_unprocessed","oil_processed"]) exitWith {hint "Du kannst das da nicht einfach reinleeren! Du brauchst schon einen Tankwagen"};


if(_ctrl == "money") then
{
	_index = [_ctrl,_inv] call TON_fnc_index;
	if(CASH < _num) exitWith {hint "You don't have that much cash on you to store in the vehicle!"};
	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_num];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};

	CASH = CASH - _num;
	[] call life_fnc_hudUpdate;
	life_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[life_trunk_vehicle] call life_fnc_vehInventory;
}
	else
{
	if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {hint "In diesem Fahrzeug ist dafür kein Platz mehr."};

	if(!([false,_ctrl,_num] call life_fnc_handleInv)) exitWith {hint "Couldn't remove the items from your inventory to put in the vehicle.";};
	_index = [_ctrl,_inv] call TON_fnc_index;
	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_num];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};

	life_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[life_trunk_vehicle] call life_fnc_vehInventory;
};
