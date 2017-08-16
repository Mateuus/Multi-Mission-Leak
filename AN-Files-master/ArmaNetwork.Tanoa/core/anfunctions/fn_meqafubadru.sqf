#include <macro.h>

/*
	File: fn_handleInv.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Do I really need one?
*/
params [
	["_math",false,[false]],
	["_item","",[""]],
	["_num",0,[0]]
];

if (EQUAL(_item,"") OR EQUAL(_num,0)) exitWith {false};

private _return = false;
private _var = ITEM_VARNAME(_item);

if (_math) then
{
	private _diff = [_item,_num,life_carryWeight,life_maxWeight] call life_fnc_wacruspekuc;
	_diff = round(_diff);
	_num = _diff;
	if(_num <= 0) exitWith {false};
};
private _weight = ([_item] call life_fnc_pruvubezust) * _num;
private _value = round(ITEM_VALUE(_item));

if (_math) then
{
	if((life_carryWeight + _weight) <= life_maxWeight) then
	{
		SVAR_MNS [_var,(_value + _num)];
		if ((GVAR_MNS _var) > _value) then
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
	if ((_value - _num) < 0) then
	{
		_return = false;
	}
	else
	{
		SVAR_MNS[_var,(_value - _num)];
		if ((GVAR_MNS _var) < _value) then
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
