/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Store inventory items into houses
*/

private ["_vehicle","_dialog","_storeAmount","_list2","_vehWeight","_itemWeight","_storeItem","_held","_parsed","_multiple","_index","_value","_newWeight"];

disableSerialization;

_vehicle = DS_bootVeh;
_dialog = findDisplay 666668;
_storeAmount = ctrlText 1401;
_list2 = _dialog displayCtrl 1501;
_storeItem = lbData [1501,lbCurSel 1501];
_index = -1;
_parsed = (parseNumber(_storeAmount));

if(isNil "DS_houseBlock")then{DS_houseBlock = false;};
if(DS_houseBlock)exitWith{hint "You can not store items in your house because you have recently robbed something";};

if(_storeItem in ["cracker"])exitWith{hint "You can not store this item"};
if(_storeItem isEqualTo "")exitWith{hint "No item selected"};
if(_parsed < 1)exitWith{hint "Select an amount you wish to store"};

_vehMaxWeight = _vehicle getVariable ["storage",0];
_vehMaxWeight = (_vehMaxWeight*250)+250;
_itemWeight = [_storeItem,_parsed] call DS_fnc_itemWeight;
_vehData = _vehicle getVariable ["boot",[[],0]];
_vehInventory = _vehData select 0;

if(((_vehData select 1) + _itemWeight) > _vehMaxWeight)exitWith{hint "The vehicle can not hold this much of that item"};

_held = format ["DS_item_%1",_storeItem];
_held = missionNamespace getVariable _held;
if(_parsed > _held)exitWith{hint "You do not have that much of this item to store"};

[_storeItem,false,_parsed] call DS_fnc_handleInventory;

{
	if((_x select 0) isEqualTo _storeItem)then {
		_index = _forEachIndex;
	};
}forEach _vehInventory;

if(_index == -1)then {
	_vehInventory pushBack [_storeItem,_parsed];
	_newWeight = (_itemWeight + (_vehData select 1));
} else {
	_value = (_vehInventory select _index) select 1;
	_value = _value + _parsed;
	_newWeight = (_itemWeight + (_vehData select 1));
	_vehInventory set[_index,[_storeItem,_value]];
};

DS_bootVeh setVariable["boot",[_vehInventory,_newWeight],true];
[_vehicle,player,1,DS_bootVeh] remoteExec ["HUNT_fnc_dupePrevention",2];

closeDialog 0;
sleep 0.2;
[]spawn DS_civ_houseStorage;