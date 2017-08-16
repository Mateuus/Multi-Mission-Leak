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
    ["_item","",[""]]
];

if (_item isEqualTo "") exitWith {};

private _save = false;

if ((getNumber (missionConfigFile >> "VirtualItems" >> _item >> "saveItem")) isEqualTo 1) then 
{
    _save = true;
};

_save

