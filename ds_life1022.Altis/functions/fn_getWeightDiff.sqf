/*
    Darkside Life

	Author:

	Description:
	Returns the difference between a current and max weight.
    This is used to determine how much space there is to add items in something.

    This will return 0 if there is no space for any items otherwise it will return
    however much the inventory can hold, which could be either the original value
    or the value lowered to whatever can be held.
*/

private ["_singleWeight","_weight","_return","_difference"];

params [
    ["_item","",[""]],
    ["_value",-1,[0]],
    ["_currentWeight",-1,[0]],
    ["_maxWeight",-1,[0]]
];

if((_item isEqualTo "")||{_value isEqualTo -1}||{_currentWeight isEqualTo -1}||{_maxWeight isEqualTo -1})exitWith{0};

_singleWeight = [_item,1] call DS_fnc_itemWeight;
_weight = (_singleWeight * _value);
_return = _value;

if((_currentWeight + _weight) > _maxWeight)then {
    _difference = (_maxWeight - _currentWeight);
    _return = if(_difference <= 0)then{0}else{floor (_difference/_singleWeight)};
};

_return;