#include "..\..\macros.hpp"
/*
	File: fn_handlelnv.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Do I really need one?
*/
private["_math","_item","_num","_return","_var","_weight","_value","_diff"];
_math = param [0,false,[false]]; //true = add; false = subtract;
_item = param [1,"",[""]]; //The item we are using to add or remove.
_num = param [2,0,[0]]; //Number of items to add or remove.
if(_item == "" OR _num == 0) exitWith {false};

_var = ITEM_VARNAME(_item);

if(_math) then
{
	_diff = [_item,_num,DWEV_carryWeight,DWEV_maxWeight] call DWEV_fnc_calWeightDiff;
	_num = _diff;
	if(_num <= 0) exitWith {false};
};
_weight = ([_item] call DWEV_fnc_itemWeight) * _num;
_value = ITEM_VALUE(_item);

if(_math) then
{
	//Lets add!
	if((DWEV_carryWeight + _weight) <= DWEV_maxWeight) then
	{
		missionNamespace setVariable[_var,(_value + _num)];
		
		if((missionNamespace getVariable _var) > _value) then
		{
			DWEV_carryWeight = DWEV_carryWeight + _weight;
			_return = true;
		}
			else
		{
			_return = false;
		};
	}
		else
	{
		_return = false;
	};
}
	else
{
	//Lets subtract!
	if((_value - _num) < 0) then
	{
		_return = false;
	}
		else
	{
		missionNamespace setVariable[_var,(_value - _num)];
		
		if((missionNamespace getVariable _var) < _value) then
		{
			DWEV_carryWeight = DWEV_carryWeight - _weight;
			if (DWEV_carryWeight < 0) then {DWEV_carryWeight = 0;}; // Minus Gewicht fix (Spieler)
			_return = true;
		}
			else
		{
			_return = false;
		};
	};
};

_return;