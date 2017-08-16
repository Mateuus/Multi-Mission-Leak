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
    if !(playerSide isEqualTo west) then 
    {
        throw "You do not have access to the TSO Database";
    };

    disableSerialization;
    createDialog "TSODatabase";
    private _display = findDisplay 56873;
    private _loading = _display displayCtrl 1002;
    private _text = "";

    {
        ctrlShow [_x,false];
    } forEach [2400,2401,2402,2403,2404,2405];

    for [{private _i = 0},{_i < 5},{_i = _i + 1}] do 
    {
        sleep 0.5;
        _text = ctrlText 1002;
        _text = _text + ".";
        _loading ctrlSetText _text; 
    };

    ctrlShow [1002,false];

    {
        ctrlShow [_x,true];
    } forEach [2400,2401,2402,2403,2404,2405];
}
catch
{
    hintSilent _exception;
};
