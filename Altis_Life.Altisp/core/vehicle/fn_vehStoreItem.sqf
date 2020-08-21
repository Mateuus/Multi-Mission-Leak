#include "..\..\script_macros.hpp"
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
if(!([_num] call TON_fnc_isnumber)) exitWith {hint localize "STR_MISC_WrongNumFormat";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint localize "STR_MISC_Under1";};

_totalWeight = [life_trunk_vehicle] call life_fnc_vehicleWeight;

_itemWeight = ([_ctrl] call life_fnc_itemWeight) * _num;
_veh_data = life_trunk_vehicle getVariable ["Trunk",[[],0]];
_inv = _veh_data select 0;

if(_ctrl == "goldbar" && {!(life_trunk_vehicle isKindOf "LandVehicle")}) exitWith {hint localize "STR_NOTF_canOnlyStoreInLandVeh";};
if (_ctrl == "uranwy" && {! (life_trunk_vehicle IsKindOf "LandVehicle")}) exitWith {hint "Nie możesz przenosić uranu inaczej niz pojazdem naziemnym!";};
if (_ctrl == "uranoc" && {! (life_trunk_vehicle IsKindOf "LandVehicle")}) exitWith {hint "Nie możesz przenosić uranu inaczej niz pojazdem naziemnym!";};
if (_ctrl == "uranpr" && {! (life_trunk_vehicle IsKindOf "LandVehicle")}) exitWith {hint "Nie możesz przenosić uranu inaczej niz pojazdem naziemnym!";};
if (_ctrl == "uranwz" && {! (life_trunk_vehicle IsKindOf "LandVehicle")}) exitWith {hint "Nie możesz przenosić uranu inaczej niz pojazdem naziemnym!";};
if (_ctrl == "buran" && {! (life_trunk_vehicle IsKindOf "LandVehicle")}) exitWith {hint "Nie możesz przenosić uranu inaczej niz pojazdem naziemnym!";};

if(_ctrl == "money") then
{
	_index = [_ctrl,_inv] call TON_fnc_index;
	if(CASH < _num) exitWith {hint localize "STR_NOTF_notEnoughCashToStoreInVeh";};
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
	life_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[life_trunk_vehicle] call life_fnc_vehInventory;
}
else
{
	if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {hint localize "STR_NOTF_VehicleFullOrInsufCap";};

	if(!([false,_ctrl,_num] call life_fnc_handleInv)) exitWith {hint localize "STR_CouldNotRemoveItemsToPutInVeh";};
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
[9] call SOCK_fnc_updatePartial;