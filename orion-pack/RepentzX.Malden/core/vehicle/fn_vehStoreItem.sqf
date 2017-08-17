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
if ((life_trunk_vehicle getVariable ["trunk_in_use_by",player]) != player) exitWith { closeDialog 0; [localize "STR_MISC_VehInvUse",true,"slow"] call life_fnc_notificationSystem; };

_ctrl = ctrlSelData(3503);
_num = ctrlText 3506;
if (!([_num] call TON_fnc_isnumber)) exitWith {[localize "STR_MISC_WrongNumFormat",true,"slow"] call life_fnc_notificationSystem;};
_num = parseNumber(_num);
if (_num < 1) exitWith {[localize "STR_MISC_Under1",true,"slow"] call life_fnc_notificationSystem;};

_totalWeight = [life_trunk_vehicle] call life_fnc_vehicleWeight;

_itemWeight = ([_ctrl] call life_fnc_itemWeight) * _num;
_veh_data = life_trunk_vehicle getVariable ["Trunk",[[],0]];
_inv = _veh_data select 0;

if (_ctrl == "goldenbarz3" && {!(life_trunk_vehicle isKindOf "LandVehicle")}) exitWith {[localize "STR_NOTF_canOnlyStoreInLandVeh",true,"slow"] call life_fnc_notificationSystem;};

//Relic
if (_ctrl == "relic1" || _ctrl == "relic2" || _ctrl == "relic3" || _ctrl == "relic4" || _ctrl == "relicTransport" || _ctrl == "planeTreasure" || _ctrl == "excavator") exitWith {[localize "STR_NOTF_cannotStoreRelic",true,"slow"] call life_fnc_notificationSystem;};

if (_ctrl == "money") then {
    _index = [_ctrl,_inv] call TON_fnc_index;
    if (civRDM < _num) exitWith {[localize "STR_NOTF_notEnoughCashToStoreInVeh",true,"slow"] call life_fnc_notificationSystem;};
    if (_index isEqualTo -1) then {
        _inv pushBack [_ctrl,_num];
    } else {
        _val = _inv select _index select 1;
        _inv set[_index,[_ctrl,_val + _num]];
    };

    civRDM = civRDM - _num;
    [0] call SOCK_fnc_updatePartial;
    life_trunk_vehicle setVariable ["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
    [life_trunk_vehicle] call life_fnc_vehInventory;
} else {
    if (((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {[localize "STR_NOTF_VehicleFullOrInsufCap",true,"slow"] call life_fnc_notificationSystem;};

    if (!([false,_ctrl,_num] call life_fnc_handleInv)) exitWith {[localize "STR_CouldNotRemoveItemsToPutInVeh",true,"slow"] call life_fnc_notificationSystem;};
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