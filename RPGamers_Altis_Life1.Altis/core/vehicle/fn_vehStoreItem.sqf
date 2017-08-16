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
if ((life_trunk_vehicle getVariable ["trunk_in_use_by",player]) != player) exitWith { closeDialog 0; [localize "STR_MISC_VehInvUse",5,"gray"] call RPG_Fnc_Msg; };

_ctrl = ctrlSelData(3503);
_num = ctrlText 3506;
if (!([_num] call TON_fnc_isnumber)) exitWith {[localize "STR_MISC_WrongNumFormat",5,"gray"] call RPG_Fnc_Msg;};
_num = parseNumber(_num);
if (_num < 1) exitWith {[localize "STR_MISC_Under1",5,"gray"] call RPG_Fnc_Msg;};

_totalWeight = [life_trunk_vehicle] call life_fnc_vehicleWeight;

_itemWeight = ([_ctrl] call life_fnc_itemWeight) * _num;
_veh_data = life_trunk_vehicle getVariable ["Trunk",[[],0]];
_inv = _veh_data select 0;

if (_ctrl == "goldbar" && {!(life_trunk_vehicle isKindOf "LandVehicle")}) exitWith {[localize "STR_NOTF_canOnlyStoreInLandVeh",5,"gray"] call RPG_Fnc_Msg;};

if (_ctrl == "money") then {
    _index = [_ctrl,_inv] call TON_fnc_index;
    if (CASH < _num) exitWith {[localize "STR_NOTF_notEnoughCashToStoreInVeh",5,"gray"] call RPG_Fnc_Msg;};
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
    if (((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {[localize "STR_NOTF_VehicleFullOrInsufCap",5,"gray"] call RPG_Fnc_Msg;};

    if (!([false,_ctrl,_num] call life_fnc_handleInv)) exitWith {[localize "STR_CouldNotRemoveItemsToPutInVeh",5,"gray"] call RPG_Fnc_Msg;};
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