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
	["_value",0,[0]],
	["_math",false,[false]]
];

private _index = -1;
private _define = 
{
	if !([_x] call life_fnc_arrayValidArray) then 
	{ 
		false 
	};
	if (_string isEqualTo (_x select 0)) exitWith 
	{
		[_array, _string, _value, _math] call life_fnc_arraySetValue;
		false
	};
	true
} forEach _array;

if (isNil "_define") then 
{ 
	_define = true;
};

if (_define) then
{
	_index = _array pushBack [_string, _value];
};

_index
