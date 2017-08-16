/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Takes items from item briefcases
*/

private ["_vehicle","_dialog","_vehData","_vehInventory","_nearbyPlayers","_sleepTimer","_item","_amount","_itemWeight","_value","_isEmpty"];

params [["_check",false,[false]]];

disableSerialization;

_vehicle = DS_bootVeh;
_dialog = findDisplay 666682;

if(player distance _vehicle > 20)exitWith{hint "You're too far from the vehicle"};

_vehData = _vehicle getVariable ["boot",[[],0]];
_vehInventory = _vehData select 0;
_nearbyPlayers = {(alive _x)&&(!(_x isEqualTo player))&&(_x distance player < 20)} count allPlayers;

if((_nearbyPlayers > 0)&&(!_check))exitWith {
	_sleepTimer = (random(3));
	sleep _sleepTimer;
	[true] spawn DS_fnc_briefcaseItemTakeAll;
};

{
    _item = _x select 0;
    _amount = _x select 1;
    _itemWeight = [_item,_amount] call DS_fnc_itemWeight;

    if((_itemWeight) < (DS_maxWeight - DS_currentWeight))then {
        [_item,true,_amount] call DS_fnc_handleInventory;
        _vehInventory set [_forEachIndex,[_item,0]];
    };
} forEach _vehInventory;

DS_bootVeh setVariable ["boot",[_vehInventory,0],true];
DS_bootVeh setVariable ["boot_open",false,true];

_isEmpty = true;

{
	if((_x select 1) > 0)exitWith{_isEmpty = false;};
} forEach _vehInventory;

if(_isEmpty)then {
	deleteVehicle _vehicle;
	closeDialog 0;
};