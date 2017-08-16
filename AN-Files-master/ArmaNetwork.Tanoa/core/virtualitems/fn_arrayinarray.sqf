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
    ["_string","",[""]]
];

if (_string isEqualTo "") exitWith {false};

private _result = 
{
	if !([_x] call life_fnc_arrayValidArray) exitWith {false};
	if (_string isEqualTo (_x select 0)) exitWith {true};
} forEach _array;

if(isNil "_result") then 
{ 
	_result = false 
};

_result
