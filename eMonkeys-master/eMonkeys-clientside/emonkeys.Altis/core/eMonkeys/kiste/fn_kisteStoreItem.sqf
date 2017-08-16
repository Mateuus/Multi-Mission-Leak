#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehStoreItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
	if the vehicle has room for the item.
*/
private["_ctrl","_num","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val"];
disableSerialization;

_ctrl = ctrlSelData(3503);
_num = ctrlText 3506;
if(!([_num] call fnc_isnumber)) exitWith {hint "Invalid Number format";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "Du kannst keine werte unter 1 eingeben!";};

_totalWeight = [eM_trunk_vehicle] call EMonkeys_fnc_vehicleWeight;
_itemWeight = ([_ctrl] call EMonkeys_fnc_itemWeight) * _num;
_veh_data = eM_trunk_vehicle getVariable ["Trunk",[[],0]];
_inv = _veh_data select 0;



if(_ctrl == "money") then
{
	_index = [_ctrl,_inv] call TON_fnc_index;
	if(EMonkeys_c164 < _num) exitWith {hint "Du hast nicht so viel Geld dabei!"};
	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_num];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	EMonkeys_c164 = EMonkeys_c164 - _num;
	eM_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[eM_trunk_vehicle] call EMonkeys_fnc_kisteInventory;
	[0] call SOCK_fnc_updatePartial;
}
	else
{
	if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {hint "Das Fahrzeug ist bereits voll!"};

	if(!([false,_ctrl,_num] call EMonkeys_fnc_handleInv)) exitWith {hint "Das Fahrzeug kann nicht so viel aufnehmen.";};
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
	
	eM_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[eM_trunk_vehicle] call EMonkeys_fnc_kisteInventory;

};
