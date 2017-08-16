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
	["_skill","",[""]]
];

if (_license isEqualTo "") exitWith {};

private _success = false;
private _index = AN_Skills find _skill;

if !(_index isEqualTo -1) then 
{
	AN_Skills deleteAt _index;
    _success = true;
};

_success