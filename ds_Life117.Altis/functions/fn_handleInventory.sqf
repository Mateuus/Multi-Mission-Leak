/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Handles the players weight when he uses or gains an item
*/
private["_item","_add","_value","_weight","_amount","_fail","_index","_difference","_singleWeight","_newAmount","_difference2"];

_item = [_this,0,"",[""]] call BIS_fnc_param; 
_add = [_this,1,false,[false]] call BIS_fnc_param; 
_value = [_this,2,0,[0]] call BIS_fnc_param; 
_fail = false;
if((_item == "")||(_value == 0)) exitWith {};
_singleWeight = [_item,1] call DS_fnc_itemWeight;
if([_item,"item"] call KRON_StrInStr)then
	{
	_item = [_item,"DS_item_",""] call KRON_Replace;
	};
if(_add)then
	{
	_weight = [_item,_value] call DS_fnc_itemWeight;
	if((_weight + DS_currentWeight) > DS_maxWeight)exitwith{_fail = true};
	_item = format ["DS_item_%1",_item];
	_amount = missionNamespace getVariable _item;
	_amount = (_amount + _value);
	missionNamespace setVariable[_item,_amount];
	DS_currentWeight = DS_currentWeight + _weight;
	};
//Oh No, not enough space	
if(_fail)exitwith
	{
	_difference = DS_maxWeight - DS_currentWeight;
	if(_difference == 0)exitwith{};//wtf
    _difference = (floor(_difference/_singleWeight));//12
	_item = format ["DS_item_%1",_item];
	_newAmount = missionNamespace getVariable _item;//12
	_difference2 = _newAmount + _difference;//24
	missionNamespace setVariable[_item,_difference2];
	DS_currentWeight = DS_currentWeight + (_difference*_singleWeight);
	};

if(!_add)then
	{
	_weight = [_item,_value] call DS_fnc_itemWeight;
	DS_currentWeight = DS_currentWeight - _weight;
	if(DS_currentWeight < 0)then{DS_currentWeight = 0};
	_item = format ["DS_item_%1",_item];
	_amount = missionNamespace getVariable _item;
	_amount = (_amount - _value);
	if(_amount < 0)then{_amount = 0};
	missionNamespace setVariable[_item,_amount];
	};