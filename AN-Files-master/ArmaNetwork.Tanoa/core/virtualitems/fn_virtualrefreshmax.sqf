/*
    ArmA.Network
    Author: Rathbone
    Copyright (c) ArmA.Network 2015 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
private _maxLoadU = 0;
private _maxLoadV = 0;
private _maxLoadB = 0;

if (uniform player != "") then
{
    _maxLoadU = 24;
};

if (vest player != "") then
{
    _maxLoadV = [vest player] call life_fnc_virtualClothingMaxLoad;
};

if (backpack player != "") then
{
    _maxLoadB1 = [backpack player] call life_fnc_virtualClothingMaxLoad;
    _maxLoadB = _maxLoadB1 + _maxLoadB1;
};

life_maxWeight = life_maxWeightT + _maxLoadU + _maxLoadV + _maxLoadB;
