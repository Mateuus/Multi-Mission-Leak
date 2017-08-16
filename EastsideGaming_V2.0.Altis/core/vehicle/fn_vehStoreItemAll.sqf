#include "..\..\script_macros.hpp"
#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
    File: fn_vehStoreItem.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
    if the vehicle has room for the item.
*/
private ["_ctrl","_num","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val"];
disableSerialization;
if ((life_trunk_vehicle getVariable ["trunk_in_use_by",player]) != player) exitWith { closeDialog 0; hint localize "STR_MISC_VehInvUse"; };
if ((lbCurSel ((findDisplay 3500) displayCtrl 3503)) isEqualTo -1)exitWith {hint "Du musst etwas auswählen."};

_ctrl = ctrlSelData(3503);

if(life_trunk_vehicle isKindOf "House_F") then {
	_mWeight = 0;
	{_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);} foreach (life_trunk_vehicle getVariable["containers",[]]);
	_totalWeight = [_mWeight,(life_trunk_vehicle getVariable["Trunk",[[],0]]) select 1];
} else {
	_totalWeight = [life_trunk_vehicle] call life_fnc_vehicleWeight;
};
_num2 = getNumber(missionConfigFile >> "VirtualItems" >> _ctrl >> "weight");
_num1 = (floor (((_totalWeight select 0) - (_totalWeight select 1)) / _num2));
_num = if (_num1 <= (ITEM_VALUE(_ctrl))) then {_num1}else{(ITEM_VALUE(_ctrl))};
_itemWeight = ([_ctrl] call life_fnc_itemWeight) * _num;
_veh_data = life_trunk_vehicle getVariable ["Trunk",[[],0]];
_inv = _veh_data select 0;

if (_ctrl isEqualTo "goldbar" && {!(life_trunk_vehicle isKindOf "LandVehicle")}) exitWith {hint localize "STR_NOTF_canOnlyStoreInLandVeh";};

if (_ctrl isEqualTo "money") then {
    _index = [_ctrl,_inv] call TON_fnc_index;
    if (CASH < _num) exitWith {hint localize "STR_NOTF_notEnoughCashToStoreInVeh";};
    if (_index isEqualTo -1) then {
        _inv pushBack [_ctrl,_num];
    } else {
        _val = _inv select _index select 1;
        _inv set[_index,[_ctrl,_val + _num]];
    };

    CASH = CASH - _num;
    [0] call SOCK_fnc_updatePartial;
    life_trunk_vehicle setVariable ["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
    [life_trunk_vehicle] call life_fnc_vehInventory;
} else {
    if (((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {hint localize "STR_NOTF_VehicleFullOrInsufCap";};

    if (!([false,_ctrl,_num] call life_fnc_handleInv)) exitWith {hint localize "STR_CouldNotRemoveItemsToPutInVeh";};
    _index = [_ctrl,_inv] call TON_fnc_index;
    if (_index isEqualTo -1) then {
        _inv pushBack [_ctrl,_num];
    } else {
        _val = _inv select _index select 1;
        _inv set[_index,[_ctrl,_val + _num]];
    };

    life_trunk_vehicle setVariable ["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
    [life_trunk_vehicle] call life_fnc_vehInventory;
};