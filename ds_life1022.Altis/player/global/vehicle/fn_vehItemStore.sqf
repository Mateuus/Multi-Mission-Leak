/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Store inventory items into vehicles
*/

private ["_bonus","_vehicle","_dialog","_storeAmount","_list2","_vehWeight","_itemWeight","_storeItem","_held","_parsed","_multiple","_index","_value","_newWeight"];

disableSerialization;

_vehicle = DS_bootVeh;
_dialog = findDisplay 666668;
_storeAmount = ctrlText 1401;
_list2 = _dialog displayCtrl 1501;
_storeItem = lbData [1501,lbCurSel 1501];
_index = -1;
_bonus = 1;

if((typeOf _vehicle) isEqualTo "Box_NATO_Ammo_F")exitWith{};

switch(true)do {
	case (_vehicle getVariable ["extraspace1",false]): {_bonus = 1.2};
	case (_vehicle getVariable ["extraspace2",false]): {_bonus = 1.4};
	case (_vehicle getVariable ["extraspace3",false]): {_bonus = 1.6};
	case (_vehicle getVariable ["extraspace4",false]): {_bonus = 1.8};
	case (_vehicle getVariable ["extraspace5",false]): {_bonus = 2};
	default {_bonus = 1};
};

if(_vehicle getVariable ["extraspace",false])then {
	_bonus = _bonus + 0.5;
};

if(_vehicle getVariable ["extraspaceAdv",false])then {
	if(_vehicle getVariable ["extraspace",false])then {
		_bonus = _bonus + 0.5;
	} else {
		_bonus = _bonus + 1;
	};
};

_parsed = (parseNumber(_storeAmount));

if(_storeItem isEqualTo "")exitWith{hint "No item selected"};
if(_parsed < 1)exitWith{hint "Select an amount you wish to store"};

_vehMaxWeight = [(typeOf _vehicle)] call DS_fnc_getVehWeight;
_vehMaxWeight = (round(_vehMaxWeight*_bonus));
_itemWeight = [_storeItem,_parsed] call DS_fnc_itemWeight;
_vehData = _vehicle getVariable ["boot",[[],0]];
_vehInventory = _vehData select 0;

if(((_vehData select 1) + _itemWeight) > _vehMaxWeight)exitWith{hint "The vehicle can not hold this much of that item"};
if(_storeItem in ["ammoFlash","ammoTear","cracker","blackfoot","ammoRpg7","gunSpmg","armourAdv","gunRpg7","pawnee","gunNavid","spyDocs"])exitWith{hint "You can not store this item in a vehicle"};

_held = format ["DS_item_%1",_storeItem];
_held = missionNamespace getVariable _held;
if(_parsed > _held)exitWith{hint "You do not have that much of this item to store"};

[_storeItem,false,_parsed] call DS_fnc_handleInventory;

{
	if((_x select 0) isEqualTo _storeItem)then {
		_index = _forEachIndex;
	};
} forEach _vehInventory;

if(_index isEqualTo -1)then {
	_vehInventory pushBack [_storeItem,_parsed];
	_newWeight = (_itemWeight + (_vehData select 1));
} else {
	_value = (_vehInventory select _index) select 1;
	_value = _value + _parsed;
	_newWeight = (_itemWeight + (_vehData select 1));
	_vehInventory set [_index,[_storeItem,_value]];
};

DS_bootVeh setVariable ["boot",[_vehInventory,_newWeight],true];
DS_bootVeh setVariable ["boot_open",false,true];
[_vehicle,player,0] remoteExec ["HUNT_fnc_dupePrevention",2];

closeDialog 0;
[_vehicle] spawn DS_fnc_menuBoot;