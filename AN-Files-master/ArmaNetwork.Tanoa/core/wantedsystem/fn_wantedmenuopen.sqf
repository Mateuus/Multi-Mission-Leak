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
        throw "You do not have access to the TSO Database";
    };

    if (isNull (findDisplay 56874)) then 
    {
        disableSerialization;
        createDialog "TSOWanted";
        private _display = findDisplay 56874;

        private _displayEH = _display displayAddEventHandler ["Unload",
            {
                TSOWantedCrimes = nil;
            }
        ];
    };

    if !(isNil "TSOWantedCrimes") then 
    {
        TSOWantedCrimes = nil;
    };

    if !(isNil "WantedInfo") then 
    {
        WantedInfo = nil;
    };

    [0] call life_fnc_wantedMenuDisplay;

    {
        ctrlShow [_x,false];
    } forEach [2400,2401,2404,2402,2403,2405,1501];

    lbSetCurSel [1500,-1];

    life_query_time = time;
    [player,profileName] remoteExec ["life_fnc_fetchWantedList",2];
}
catch
{
    hintSilent _exception;
};
