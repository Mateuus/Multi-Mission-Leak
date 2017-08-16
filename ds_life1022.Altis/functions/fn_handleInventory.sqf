/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Handles the players weight when they use or gain an item
*/

private ["_singleWeight","_weight","_difference","_amount"];

params [
	["_item","",[""]],
	["_add",false,[false]],
	["_value",0,[0]],
	["_force",false,[false]]
];

if((_item isEqualTo "")||{_value isEqualTo 0})exitWith{};

if([_item,"item"] call DS_fnc_strInStr)then {
	_item = [_item,"DS_item_",""] call DS_fnc_strReplace;
};

_singleWeight = [_item,1] call DS_fnc_itemWeight;
_weight = (_singleWeight*_value);
_item = format ["DS_item_%1",_item];

if(_add)then {
	if(((DS_currentWeight + _weight) > DS_maxWeight)&&(_weight > 0)&&(!_force))exitWith {
		_difference = DS_maxWeight - DS_currentWeight;
		if(_difference <= 0)exitWith{};

	    _difference = (floor (_difference/_singleWeight));
		_amount = ((missionNamespace getVariable _item) + _difference);
		missionNamespace setVariable [_item,_amount];

		DS_currentWeight = DS_currentWeight + (_difference*_singleWeight);
	};

	_amount = ((missionNamespace getVariable _item) + _value);
	missionNamespace setVariable [_item,_amount];

	DS_currentWeight = DS_currentWeight + _weight;
} else {
	_amount = ((missionNamespace getVariable _item) - _value);
	if(_amount < 0)then{_amount = 0;};
	missionNamespace setVariable [_item,_amount];

	DS_currentWeight = DS_currentWeight - _weight;
	if(DS_currentWeight < 0)then{DS_currentWeight = 0;};
};