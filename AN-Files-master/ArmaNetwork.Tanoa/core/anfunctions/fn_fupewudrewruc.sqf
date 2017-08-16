#include <macro.h>
#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehStoreItem.sqf
	Author: Bryan "Tonic" Boardwine
	Modified by Rathbone for ArmA.Network
	Description:
	Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
	if the vehicle has room for the item.
*/
private["_ctrl","_num","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val"];
if(isNil "life_trunk_vehicle" OR isNull life_trunk_vehicle OR !alive life_trunk_vehicle OR player distance life_trunk_vehicle > 10) exitWith {closeDialog 0;};
if((life_trunk_vehicle getVariable ["trunk_in_use",false]) && (life_trunk_vehicle getVariable ["trunk_used_by",""] != getPlayerUID player)) exitWith {closeDialog 0;hintSilent localize "STR_MISC_VehInvUse";};
if(!alive player) exitwith {closeDialog 0;};
disableSerialization;
_ctrl = ctrlSelData(3503);
_num = ctrlText 3506;
if(!([_num] call life_fnc_spunetuwada)) exitWith {hintSilent "Invalid Number format";};
_num = parseNumber(_num);
if((life_trunk_vehicle getVariable ["trunk_in_use",false]) && (life_trunk_vehicle getVariable ["trunk_used_by",""] != getPlayerUID player)) exitWith {closeDialog 0;hintSilent localize "STR_MISC_VehInvUse";};
if(_num < 1) exitWith {hintSilent "You can't enter anything below 1!";};
if(_num > 50) exitWith {hintSilent "You can't store more than 10 items at a time!";};
_maxWeight = getNumber(missionConfigFile >> "CfgVehicles" >> (typeOf life_trunk_vehicle) >> "trunk" >> str(playerSide));

_itemWeight = (getNumber(missionConfigFile >> "VirtualItems" >> _ctrl >> "weight")) * _num;

if(_ctrl isEqualTo "goldbar" && {!(life_trunk_vehicle isKindOf "LandVehicle")}) exitWith {hintSilent "You cannot store that in anything but a land vehicle!"};

if(life_trunk_weight >= _maxWeight) exitWith {hintSilent "The Vehicle is either full or cannot hold that much!";};
if((life_trunk_weight + _itemWeight) > _maxWeight) exitWith {hintSilent "You can't store that much!";};
if(!([_ctrl,_num] call life_fnc_virtualItemRemove)) exitWith {hintSilent "Couldn't remove the items from your inventory to put in the vehicle.";};
if((life_trunk_vehicle getVariable ["trunk_in_use",false]) && {((life_trunk_vehicle getVariable["trunk_used_by",""]) != getPlayerUID player)}) exitWith {closeDialog 0;hintSilent localize "STR_MISC_VehInvUse"};
_index = [_ctrl,life_trunk] call life_fnc_uiudhfyqwtfkdsf;
if(_index isEqualTo -1) then {
	life_trunk pushBack [_ctrl,_num];
} else {
	_val = (life_trunk select _index) select 1;
	life_trunk set[_index,[_ctrl,_val + _num]];
};
if((life_trunk_vehicle getVariable ["trunk_in_use",false]) && {((life_trunk_vehicle getVariable["trunk_used_by",""]) != getPlayerUID player)}) exitWith {closeDialog 0;hintSilent localize "STR_MISC_VehInvUse"};
call life_fnc_wrehufrutedru;
