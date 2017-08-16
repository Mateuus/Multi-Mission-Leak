#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehStoreItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
	if the vehicle has room for the item.
*/

private ["_ctrl","_what","_num","_mWeight","_totalWeight","_itemWeight","_veh_data","_inv","_type","_fail","_index","_val"];
disableSerialization;

_ctrl = ctrlSelData(3503);
_what = param [0,"",[""]];
if(_what == "extra") then {
	_num = format["%1",LHM_quick_change_virtitem];
}else {
	_num = ctrlText 3506;
};
if(!([_num] call TON_fnc_isnumber)) exitWith {hint "Invalid Number format";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "You can't enter anything below 1!";};

if(lhm_trunk_vehicle isKindOf "House_F") then {
	_mWeight = 0;
	{_mWeight = _mWeight + ([(typeOf _x)] call lhm_fnc_vehicleWeightCfg);} foreach (lhm_trunk_vehicle getVariable["containers",[]]);
	_totalWeight = [_mWeight,(lhm_trunk_vehicle getVariable["Trunk",[[],0]]) select 1];
} else {
	_totalWeight = [lhm_trunk_vehicle] call lhm_fnc_vehicleWeight;
};
_itemWeight = ([_ctrl] call lhm_fnc_itemWeight) * _num;
_veh_data = lhm_trunk_vehicle getVariable ["Trunk",[[],0]];
_inv = _veh_data select 0;
_type = typeof lhm_trunk_vehicle;
_fail = true;
{
	if(_type iskindof _x) exitWith {_fail = false;};

} foreach ["Box_IND_Grenades_F","B_supplyCrate_F","LandVehicle"];

if(_ctrl == "goldbar" && _fail) exitWith {hint "Du kannst dieses Item nur in einem Haus oder Bodenfahrzeug lagern!"};

if(_ctrl == "money") then
{
	_index = [_ctrl,_inv] call TON_fnc_index;
	if(lhm_cash < _num) exitWith {hint "You don't have that much cash on you to store in the vehicle!"};
	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_num];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};

	lhm_cash = lhm_cash - _num;
	lhm_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[lhm_trunk_vehicle] call lhm_fnc_vehInventory;
}
	else
{
	if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {hint "Das Vehikel ist entweder voll oder kann nicht mehr aufnehmen."};

	if(!([false,_ctrl,_num] call lhm_fnc_handleInv)) exitWith {hint "Items vom Inventar konnent nicht in das Fahrzeug gelegt werden.";};
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

	lhm_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[lhm_trunk_vehicle] call lhm_fnc_vehInventory;
};
