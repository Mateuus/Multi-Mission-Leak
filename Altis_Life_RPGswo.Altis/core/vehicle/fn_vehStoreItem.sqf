#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehStoreItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
	if the vehicle has room for the item.
*/
private["_ctrl","_num","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val","_TypeOfvehicle","_Items","_Trucks","_LandVehicle"];
disableSerialization;

_ctrl = ctrlSelData(3503);
_num = ctrlText 3506;
if(!([_num] call DWF_fnc_isnumber)) exitWith {hint "Ungültiges Zahlenformat";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "Du kannst keine Zahl unter 1 eingeben!";};

if(DWEV_trunk_vehicle isKindOf "House_F") then {
	_mWeight = 0;
	{_mWeight = _mWeight + ([(typeOf _x)] call DWEV_fnc_vehicleWeightCfg);} foreach (DWEV_trunk_vehicle getVariable["containers",[]]);
	_totalWeight = [_mWeight,(DWEV_trunk_vehicle getVariable["Trunk",[[],0]]) select 1];
} else {
	_totalWeight = [DWEV_trunk_vehicle] call DWEV_fnc_vehicleWeight;
};
_itemWeight = ([_ctrl] call DWEV_fnc_itemWeight) * _num;
_veh_data = DWEV_trunk_vehicle getVariable ["Trunk",[[],0]];
_inv = _veh_data select 0;

_TypeOfvehicle = TypeOf DWEV_trunk_vehicle;
_LandVehicle = DWEV_trunk_vehicle isKindOf "LandVehicle";
_Items = ["uranium1","uranium2","uranium3","uranium4","uranium5","ipuranium","goldbar"];
_Trucks = ["Box_IND_Grenades_F","B_supplyCrate_F"];

if ((_ctrl in _Items) && !((_TypeOfvehicle in _Trucks) OR _LandVehicle)) exitwith {hint "Uraniumprodukte und Bankgold koennen nur in Landfahrzeuge transportiert oder in Lagerkisten gelagert werden!"};

if(_ctrl == "money") then
{
	_index = [_ctrl,_inv] call DWF_fnc_index;
	if(dwf_cash < _num) exitWith {hint "Du hast nicht genug Geld bei dir, um diese Summe ins Fahrzeug zu legen."};
	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_num];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	dwf_cash = dwf_cash - _num;
	DWEV_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[DWEV_trunk_vehicle] call DWEV_fnc_vehInventory;
}
	else
{
	if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {hint "Das Fahrzeug ist entweder voll oder kann die Menge nicht tragen."};

	if(!([false,_ctrl,_num] call DWEV_fnc_handlelnv)) exitWith {hint "Der Gegenstand konnte nicht aus deinem Inventar entfernt werden, um es ins Fahrzeug zu legen.";};
	_index = [_ctrl,_inv] call DWF_fnc_index;
	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_num];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	DWEV_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[DWEV_trunk_vehicle] call DWEV_fnc_vehInventory;
};
