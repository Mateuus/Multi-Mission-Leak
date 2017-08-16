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
    ["_data","",[""]]
];

try
{
    if (isNull (findDisplay 56874)) then 
    {
        throw "Wanted GUI Error - Dialog not found";
    };

    if (_data isEqualTo "") then 
    {
        throw "Wanted Internal Error - Data not found";
    };

    if !(isNil "WantedInfo") then 
    {
        throw "Wanted Internal Error - Variable Exists";
    };

    _data = call compile _data;

    if !(_data select 6 isEqualTo "0") then 
    {
        throw "A Bounty has already been set on this felon.";
    };

    WantedInfo = [];
    WantedInfo = ["bounty",_data select 0];

    [3] call life_fnc_wantedMenuDisplay;
}
catch
{
    hintSilent _exception;
};
