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
if (_amount isEqualTo 0) exitWith {false};

private _result = [AN_Inventory,_item,_amount,false] call life_fnc_arraySetValue;

_result