/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Takes items from item briefcases
*/

private ["_vehicle","_dialog","_storeAmount","_list2","_storeItem","_index","_parsed","_itemWeight","_vehData","_vehInventory","_value","_nearbyPlayers","_sleepTimer","_isEmpty"];

params [["_check",false,[false]]];

disableSerialization;

_vehicle = DS_bootVeh;
_dialog = findDisplay 666682;
_storeAmount = ctrlText 1400;
_list2 = _dialog displayCtrl 1500;
_storeItem = lbData [1500,lbCurSel 1500];
_index = -1;
_parsed = (parseNumber(_storeAmount));

if(_storeItem isEqualTo "")exitWith{hint "No item selected"};
if(_parsed < 1)exitWith{hint "Select an amount you wish to store"};
if(player distance _vehicle > 20)exitWith{hint "You're too far from the vehicle"};

_itemWeight = [_storeItem,_parsed] call DS_fnc_itemWeight;
_vehData = _vehicle getVariable ["boot",[[],0]];
_vehInventory = _vehData select 0;

if((_itemWeight) > (DS_maxWeight - DS_currentWeight))exitWith{hint "You can not carry this amount"};

{
	if((_x select 0) isEqualTo _storeItem)exitWith {
		_index = _forEachIndex;
	};
} forEach _vehInventory;

_value = (_vehInventory select _index) select 1;
_nearbyPlayers = {(alive _x)&&(!(_x isEqualTo player))&&(_x distance player < 20)} count allPlayers;
if(_parsed > _value)exitWith{hint "There isn't that many of that item in this vehicle"};

if((_nearbyPlayers > 0)&&(!_check))exitWith {
	_sleepTimer = (random(3));
	sleep _sleepTimer;
	[true] spawn DS_fnc_briefcaseItemTake;
};

if(_parsed > _value)exitWith{hint "There isn't that many of that item in this vehicle"};

[_storeItem,true,_parsed] call DS_fnc_handleInventory;

_value = _value - _parsed;
_vehInventory set [_index,[_storeItem,_value]];

DS_bootVeh setVariable ["boot",[_vehInventory,0],true];
DS_bootVeh setVariable ["boot_open",false,true];

_isEmpty = true;

{
	if((_x select 1) > 0)exitWith{_isEmpty = false;};
} forEach _vehInventory;

if(_isEmpty)then {
	deleteVehicle _vehicle;
	closeDialog 0;
} else {
	closeDialog 0;
	[_vehicle] spawn DS_fnc_menuBriefcase;
};