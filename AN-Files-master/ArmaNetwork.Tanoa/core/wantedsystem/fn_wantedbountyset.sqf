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
    if (isNull (findDisplay 56874)) then 
    {
        throw "Wanted GUI Error - Dialog not found";
    };

    if (isNil "WantedInfo") then 
    {
        throw "Wanted Internal Error - Variable Doesn't Exist";
    };

    private _bounty = ctrlText 5400;

    if (_bounty isEqualTo "") then 
    {
        throw "You need to enter something!";
    };

    if !([_bounty] call life_fnc_spunetuwada) then 
    {
        throw "Enter a Numeric Value";
    };

    private _fallNu = parseNumber _bounty;

    if (_fallNu < 1000 OR {_fallNu > 900000}) then 
    {
        throw "The Bounty needs to be between $1000 and $900,000";
    };

    WantedInfo pushBack _bounty;
    WantedInfo pushBack (getPlayerUID player);

    WantedInfo remoteExecCall ["life_fnc_wantedListEditEntry",2];
    WantedInfo = nil;
    closeDialog 0;
    hintSilent format ["You've successfully set a bounty of $%1", _bounty];
}
catch
{
    hintSilent _exception;
};
