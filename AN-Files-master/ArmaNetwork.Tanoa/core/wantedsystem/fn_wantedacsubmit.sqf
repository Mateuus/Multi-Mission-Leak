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
        throw "Wanted GUI Error - GUI not Found";
    };

    if (isNil "TSOWantedCrimes") then 
    {
        throw "Error - Important Info is Missing!";
    };

    if (TSOWantedCrimes isEqualTo []) then 
    {
        throw "Error - Information isn't ready";
    };

    private _data = lbData [1500,lbCurSel 1500];

    _data = call compile _data;
  
    ["existing", _data select 0, TSOWantedCrimes] remoteExecCall ["life_fnc_wantedListEditEntry",2];

    closeDialog 0;
}
catch
{
    hintSilent _exception;
};