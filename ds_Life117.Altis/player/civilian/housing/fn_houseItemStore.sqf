#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Store inventory items into houses
*/

private ["_vehicle","_dialog","_storeAmount","_list2","_vehWeight","_itemWeight","_storeItem","_held","_parsed","_multiple","_indexx","_value","_newWeight"];

_vehicle = DS_bootVeh;
disableSerialization;
_dialog = findDisplay 666668;
_storeAmount = ctrlText 1401; 
_list2 = _dialog displayCtrl 1501;
_storeItem = ctrlSelData(1501);
_indexx = -1;

_parsed = (parseNumber(_storeAmount));

if(_storeItem == "cracker")exitwith{hint "You can not store this item"};
if(_storeItem == "")exitwith{hint "No item selected"};
if(_parsed < 1)exitwith{hint "Select an amount you wish to store"};
_vehMaxWeight = _vehicle getVariable ["storage",0];
_vehMaxWeight = (_vehMaxWeight*500)+500;

_itemWeight = [_storeItem,_parsed] call DS_fnc_itemWeight;
_vehData = _vehicle getVariable ["boot",[[],0]];
_vehInventory = _vehData select 0;

if(((_vehData select 1) + _itemWeight) > _vehMaxWeight)exitwith{hint "The vehicle can not hold this much of that item"};

_held = format ["DS_item_%1",_storeItem];
_held = missionNamespace getVariable _held;
if(_parsed > _held)exitwith{hint "You do not have that much of this item to store"};
//_index = [_storeItem] call DS_fnc_itemIndex;
[_storeItem,false,_parsed] call DS_fnc_handleInventory;
{
	if((_x select 0) == _storeItem)then
		{
		_indexx = _forEachIndex;
		};
}forEach _vehInventory;

if(_indexx == -1)then
	{
	_vehInventory pushBack [_storeItem,_parsed];
	_newWeight = (_itemWeight + (_vehData select 1));
	}
	else
	{
	_value = (_vehInventory select _indexx) select 1;//1
	_value = _value + _parsed;//2
	_newWeight = (_itemWeight + (_vehData select 1));
	_vehInventory set[_indexx,[_storeItem,_value]];
	};
DS_bootVeh setVariable["boot",[_vehInventory,_newWeight],true];

closeDialog 0;
sleep 0.2;
[]spawn DS_civ_houseStorage;





