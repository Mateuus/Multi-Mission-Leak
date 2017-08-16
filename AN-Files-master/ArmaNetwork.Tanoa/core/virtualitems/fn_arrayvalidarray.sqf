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
	["_array",[],[[]]]
];

if !(_array isEqualType []) exitWith 
{
	false
};

if !((count _array) isEqualTo 2) exitWith 
{
	false
};

if (isNil {_array select 0}) exitWith 
{
	false
};

if !((_array select 0 ) isEqualType "") exitWith 
{
	false
};

if (isNil {_array select 1}) exitWith 
{
	false
};

true
