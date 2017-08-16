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

    if (lbCurSel 3100 isEqualTo -1) then 
    {
        throw "You need to select a civilian to charge!";
    };
    
    disableSerialization;
    private _display = findDisplay 56874;
    private _info = ctrlText 3400;

    if ([_info] call KRON_StrLen > 60) then 
    {
        throw "Additional Information has to be under 60 characters!";
    };

    if ([":",_info] call BIS_fnc_inString) then 
    {
        throw "A bad character was found. Try again.";
    };

    if (_info isEqualTo "") then 
    {
        _info = "No Additional Information";
    };

    private _felon = lbData [3100,lbCurSel 3100];

    WantedInfo = [];
    WantedInfo = [_felon, _info, TSOWantedCrimes, player];
  
    closeDialog 0;

    openMap [true,true];
    hintSilent "Click on map to attach coordinates to the new Wanted List Entry. Suggested Coords are rough estimate of Felon location";
    onMapSingleClick "
        WantedInfo pushBack _pos; 
        WantedInfo remoteExecCall ['life_fnc_wantedListNewEntry',2]; 
        openMap [false,false];  
        WantedInfo = nil; 
        onMapSingleClick ''; 
        false
    ";
}
catch
{
    hintSilent _exception;
};
