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
    ["_mode",-1,[0]]
];

try
{
    if (isNull (findDisplay 56874)) then 
    {
        throw "Wanted Menu doesn't exist";
    };

    if (_mode isEqualTo -1) then 
    {
        throw "Wanted Displayhandler Mode doesn't exist";
    };

    disableSerialization;
    private _display = findDisplay 56874;
    private _mainHandler = _display displayCtrl 1000;

    private _main = [
        1000,
        1004,
        1002,
        1001,
        1003,
        1005,
        1500,
        1501,
        1100,
        1101,
        2400,
        2401,
        2403,
        2404,
        2402,
        2405
    ];

    private _new = [
        3000,
        3001,
        3002,
        3100,
        3003,
        3400,
        3500,
        3501,
        3004,
        3400,
        3401,
        3005,
        3402,
        3403,
        3404       
    ];

    private _existing = [
        4000,
        4001,
        4500,
        4002,
        4501,
        4003,
        4004,
        4400,
        4401,
        4402,
        4403
    ];

    private _bounty = [
        5000,
        5001,
        5100,
        5002,
        5400,
        5500,
        5501
    ];

    switch _mode do 
    {
        case 0: //main menu
        {
            if !(ctrlShown _mainHandler) then 
            {
                {
                    ctrlShow [_x,true];
                } forEach _main;
            };

            {
                ctrlShow [_x,false];
            } forEach _new;

            {
                ctrlShow [_x,false];
            } forEach _existing;

            {
                ctrlShow [_x,false];
            } forEach _bounty
        };
        case 1: //add new to list
        {
            {
                ctrlShow [_x,false];
            } forEach _main;

            {
                ctrlShow [_x,true];
            } forEach _new;
        };
        case 2: //add existing
        {
            {
                ctrlShow [_x,false];
            } forEach _main;

            {
                ctrlShow [_x,true];
            } forEach _existing;
        };
        case 3:
        {
            {
                ctrlShow [_x,false];
            } forEach _main;

            {
                ctrlShow [_x,true];
            } forEach _bounty;
        };
        default {};
    };
}
catch
{
    hintSilent _exception;
};
