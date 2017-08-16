/*
    ArmA.Network
    Author: Rathbone
    Copyright (c) ArmA.Network 2015 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
try
{
    if !(isNil "APBInfo") then 
    {
        throw "Previous APB Information has been found!";
    };

    [1] call life_fnc_wantedAPBDisplay;

    {
        ctrlShow [_x,false];
    } forEach [2400,2401,2402,2403];
}
catch
{
    hintSilent _exception;
};
