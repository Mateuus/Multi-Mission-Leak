/*
	File: fn_handleInv.sqf
	
	
	Description:
	Do I really need one?
*/

params [["_math", false, [false]], ["_item", "", [""]], ["_num", 0, [0]], "_return", "_var", "_weight", "_value", "_diff"];

if(_item isEqualTo "" OR _num isEqualTo 0) exitWith {false};

_var = [_item,0] call life_fnc_varHandle;
if(_math) then
{
	_diff = [_item,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
	_num = _diff;
	if(_num <= 0) exitWith {false};
};
_weight = ([_item] call life_fnc_itemWeight) * _num;
_value = missionNamespace getVariable _var;

if(_math) then
{
	//Lets add!
	if((life_carryWeight + _weight) <= life_maxWeight) then
	{
		missionNamespace setVariable[_var,(_value + _num)];
		
		if((missionNamespace getVariable _var) > _value) then
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
		missionNamespace setVariable[_var,(_value - _num)];
		
		if((missionNamespace getVariable _var) < _value) then
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