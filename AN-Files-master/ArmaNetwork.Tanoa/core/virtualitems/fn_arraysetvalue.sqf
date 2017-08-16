/*
    ArmA.Network
    Author: Rathbone
    Copyright (c) ArmA.Network 2015 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
params [
	["_array",[],[[]]],
	["_string","",[""]],
	["_amount",0,[0]],
	["_math",false,[false]]
];

private _result = false;

private _index = 
{
	if !([_x] call life_fnc_arrayValidArray) exitWith 
	{
		-1
	};
	if (_string isEqualTo (_x select 0)) exitWith 
	{
		_forEachIndex
	};
	-1
} forEach _array;

if (isNil "_index") then 
{ 
	_index = -1 
};

if !(_index isEqualTo -1) then 
{
	private _oldValue = ( _array select _index ) select 1;
	if (_math) then 
	{
		_array set [ _index, [_string, (_oldValue + _amount)]];
		_result = true;
	} 
	else 
	{
		if (_amount > _oldValue) exitWith 
		{
			_result = false;
		};

		if (_amount isEqualTo _oldValue) then 
		{
			_array deleteAt _index;
		}
		else
		{
			_array set [ _index, [_string, _oldValue - _amount]];
		};
		_result = true;
	};
};

_result
