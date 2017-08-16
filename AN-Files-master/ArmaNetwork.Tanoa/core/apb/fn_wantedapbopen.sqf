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
    if ((time - life_query_time) < 8) then 
    {
        throw "TSO Database Server is being overloaded. Try again in 5 seconds...";
    };

    if !(playerSide isEqualTo west) then 
    {
        throw "You do not have access to the TSO APB Database";
    };

    disableSerialization;
    
    
    if (isNull (findDisplay 56872)) then 
    {
        createDialog "APBSystem";
    };

    [0] call life_fnc_wantedAPBDisplay;

    {
        ctrlShow [_x,false];
    } forEach [2400,2401,2402,2403];

    lbSetCurSel [1500,-1];
    life_query_time = time;

    [player] remoteExec ["life_fnc_fetchActiveAPBs",2];
}
catch
{
    hintSilent _exception;
};
