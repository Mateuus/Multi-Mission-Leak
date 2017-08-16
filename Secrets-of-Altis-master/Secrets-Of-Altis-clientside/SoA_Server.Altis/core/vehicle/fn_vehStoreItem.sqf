#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehStoreItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
	if the vehicle has room for the item.
*/
private["_ctrl","_num","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val","_Truck","_FuelTrucks","_FuelStuff","_Plain","_Stuff","_StuffPlains"];
disableSerialization;

_ctrl = ctrlSelData(3503);
if((life_trunk_vehicle getVariable ["trunk_in_use",false]) && (life_trunk_vehicle getVariable ["trunk_in_use_by",false] != name player)) exitWith {closeDialog 0; hint localize "STR_MISC_VehInvUse";};
_num = ctrlText 3506;
if(!([_num] call SOA_fnc_isnumber)) exitWith {hint "Invalid Number format";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "Du kannst unter 1 nichts eingeben!";};

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
_mode = _this select 0;

if(_ctrl == "goldbar" && !(life_trunk_vehicle isKindOf "LandVehicle")) exitWith {hint "Dies kann nur in ein Auto eingelagert werden!"};
if(_ctrl == "heroinu" && !(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F" OR life_trunk_vehicle isKindOf "Land_Cargo40_military_green_F")) exitWith {hint "Dies kann nur in ein Auto eingelagert werden!"};
if(_ctrl == "heroinp" && !(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F" OR life_trunk_vehicle isKindOf "Land_Cargo40_military_green_F")) exitWith {hint "Dies kann nur in ein Auto eingelagert werden!"};
if(_ctrl == "plutoniumu" && !(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "Ship" OR life_trunk_vehicle isKindOf "House_F"  OR life_trunk_vehicle isKindOf "Land_Cargo40_military_green_F")) exitWith {hint "Dies kann nur in ein Auto eingelagert werden!"};
if(_ctrl == "plutonium" && !(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "Ship" OR life_trunk_vehicle isKindOf "House_F" OR life_trunk_vehicle isKindOf "Land_Cargo40_military_green_F")) exitWith {hint "Dies kann nur in ein Auto eingelagert werden!"};
if(_ctrl == "banane" && !(life_trunk_vehicle isKindOf "Ship" OR life_trunk_vehicle isKindOf "LandVehicle")) exitWith {hint "Dies kann nur in ein Boot eingelagert werden!"};

_Truck = TypeOf life_trunk_vehicle;
_FuelStuff = ["beerp","whiskey","moonshine","oilp"]; //Wich Items can be stored in?
_FuelTrucks = ["C_Van_01_fuel_F","B_Truck_01_fuel_F","O_Truck_02_fuel_F","O_Truck_03_fuel_F"]; //Fuel Trucks, who are allowed to carry fuel

switch (true) do
{
	case ((_ctrl in _FuelStuff) && (_Truck in _FuelTrucks)): {life_TankLaster = 1};
	case (!(_ctrl in _FuelStuff) && !(_Truck in _FuelTrucks)): {life_TankLaster = 2};
	case (!(_ctrl in _FuelStuff) && (_Truck in _FuelTrucks)): {life_TankLaster = 3};
	case ((_ctrl in _FuelStuff) && !(_Truck in _FuelTrucks)): {life_TankLaster = 4};
};

if (life_TankLaster == 3) exitWith {hint "Du kannst nur Alkohol und verarbeitetes Öl in einen Tanklaster füllen!";};
if (life_TankLaster == 4) exitWith {hint "Du kannst Alkohol und verarbeitetes Öl nur in einen Tanklaster füllen!";};

if(_mode == 0) then {
	if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {hint "Das Fahrzeug ist entweder überlastet oder kann dies nicht einlagern."};

	if(!([false,_ctrl,_num] call life_fnc_handleInv)) exitWith {hint "Konnte nicht eingelagert werden.";};
	_index = [_ctrl,_inv] call SOA_fnc_index;
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
} else {
	if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {hint "Das Fahrzeug ist entweder überlastet oder kann dies nicht einlagern."};

	_ctrlint = [_ctrl,0] call life_fnc_varHandle;
	_ctrlintparsed = call compile _ctrlint;
	
	if(!([false,_ctrl,_ctrlintparsed] call life_fnc_handleInv)) exitWith {hint "Konnte nicht eingelagert werden.";};
	_index = [_ctrl,_inv] call SOA_fnc_index;
	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_num];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _ctrlintparsed]];
	};
	
	life_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[life_trunk_vehicle] call life_fnc_vehInventory;
};