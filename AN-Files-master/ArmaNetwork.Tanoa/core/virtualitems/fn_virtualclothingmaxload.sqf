/*
    ArmA.Network
    Rathbone
    Copyright (c) ArmA.Network 2015 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/

params [
    ["_clothing", "", [""]]
];

if (_clothing isEqualTo "") exitWith
{
    0
};

if (_clothing in ["U_B_Wetsuit", "U_O_Wetsuit", "U_I_Wetsuit"]) then
{
    _clothing = "Supply40";
};

private _type = [_clothing] call BIS_fnc_itemType;
_type = (_type select 1);

if (_type in ["Uniform", "Vest"]) then {
    _clothing = getText (configfile >> "CfgWeapons" >> _clothing >> "ItemInfo" >> "containerClass");
};
private _maxLoad = getNumber (configFile >> "CfgVehicles" >> _clothing >> "maximumLoad");

round (_maxLoad / 8)
