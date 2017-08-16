#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Takes inventory items from houses
*/

private ["_vehicle","_dialog","_storeAmount","_list2","_vehWeight","_itemWeight","_storeItem","_held","_parsed","_multiple","_indexx","_value","_newWeight"];

_vehicle = DS_bootVeh;
disableSerialization;
_dialog = findDisplay 666668;
_storeAmount = ctrlText 1400; 
_list2 = _dialog displayCtrl 1500;
_storeItem = ctrlSelData(1500);
_indexx = -1;

_parsed = (parseNumber(_storeAmount));

if(_storeItem == "")exitwith{hint "No item selected"};
if(_parsed < 1)exitwith{hint "Select an amount you wish to store"};

_itemWeight = [_storeItem,_parsed] call DS_fnc_itemWeight;
_vehData = _vehicle getVariable ["boot",[[],0]];
_vehInventory = _vehData select 0;

if((_itemWeight) > (DS_maxWeight - DS_currentWeight))exitwith{hint "You can not carry this amount"};

{
	if((_x select 0) == _storeItem)then
		{
		_indexx = _forEachIndex;
		};
}forEach _vehInventory;

_value = (_vehInventory select _indexx) select 1;
if(_parsed > _value)exitwith{hint "There isn't that many of that item in this vehicle"};
[_storeItem,true,_parsed] call DS_fnc_handleInventory;
_value = _value - _parsed;
_newWeight = ((_vehData select 1) - (_itemWeight));
if(_value > 0)then
	{
	_vehInventory set[_indexx,[_storeItem,_value]];
	}
	else
	{
	_vehInventory set[_indexx,[_storeItem,_value]];
	};
if(_newWeight < 1)then{_newWeight = 0};
DS_bootVeh setVariable["boot",[_vehInventory,_newWeight],true];

closeDialog 0;
sleep 0.2;
[]spawn DS_civ_houseStorage;


