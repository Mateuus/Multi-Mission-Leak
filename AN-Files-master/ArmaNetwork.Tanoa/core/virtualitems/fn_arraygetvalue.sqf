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
	["_default",0,[0]]
];

private _value =
{
	if !([_x] call life_fnc_arrayValidArray) exitWith {};
	if (_string isEqualTo (_x select 0)) exitWith
	{ 
		(_array select _forEachIndex) select 1
	};
} forEach _array;

if (isNil "_value") then {
	_value = _default
}
else
{
	_value
};

_value
