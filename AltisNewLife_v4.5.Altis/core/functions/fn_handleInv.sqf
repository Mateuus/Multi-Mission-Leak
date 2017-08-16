#include <macro.h>
private["_math","_item","_num","_return","_var","_weight","_value","_diff"];
_math = [_this,0,false,[false]] call BIS_fnc_param;
_item = [_this,1,"",[""]] call BIS_fnc_param;
_num = [_this,2,0,[0]] call BIS_fnc_param;
if(_item == "" OR _num == 0) exitWith {false};
_var = ITEM_VARNAME(_item);

if(_math) then
{
	_diff = [_item,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
	_num = _diff;
	if(_num <= 0) exitWith {false};
};
_weight = ([_item] call life_fnc_itemWeight) * _num;
_value = GVAR_MNS _var;
if(_math) then
{
	//Lets add!
	if((life_carryWeight + _weight) <= life_maxWeight) then
	{
		SVAR_MNS[_var,(_value + _num)];
		
		if((GVAR_MNS _var) > _value) then
		{
			life_carryWeight = life_carryWeight + _weight;
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
		SVAR_MNS[_var,(_value - _num)];
		
		if((GVAR_MNS _var) < _value) then
		{
			life_carryWeight = life_carryWeight - _weight;
			_return = true;
		}
			else
		{
			_return = false;
		};
	};
};
_return;