#include <macro.h>

/*
	File: fn_calWeightDiff.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Calculates weight differences in the _cWeight (current Weight) against the _mWeight (Max Weight)
	Multiple purpose system for this life mission.
*/
private["_item","_value","_cWeight","_mWeight","_sum","_weight"];
_item = param [0,"",[""]];
_value = param [1,-1,[0]];
_cWeight = param [2,-1,[0]];
_mWeight = param [3,-1,[0]];

if(EQUAL(_item,"") OR EQUAL(_value,-1) OR EQUAL(_cWeight,-1) OR EQUAL(_mWeight,-1)) exitWith {};
_weight = getNumber(missionConfigFile >> "VirtualItems" >> _item >> "weight") * _value;
_sum = _value;

if((_cWeight + _weight) > _mWeight) then {
	for "_i" from 0 to 1 step 0 do {
		SUB(_sum,1);
		if(_sum < 1) exitWith {};
		_weight = getNumber(missionConfigFile >> "VirtualItems" >> _item >> "weight") * _sum;
		if((_cWeight + _weight) <= _mWeight) exitWith {};
	};
};

_sum;
