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
    ["_item","",[""]],
    ["_amount",0,[0]]
];

if (_item isEqualTo "") exitWith {false};

private _weight = getNumber (missionConfigFile >> "VirtualItems" >> _item >> "weight");
private _inventoryWeight = call life_fnc_virtualInventoryWeight;

!(_inventoryWeight + (_weight * _amount) > life_maxWeight)
