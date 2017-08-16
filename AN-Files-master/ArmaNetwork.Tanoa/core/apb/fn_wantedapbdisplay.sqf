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
    if (isNull (findDisplay 56872)) then 
    {
        throw "APB Menu doesn't exist";
    };

    if (_mode isEqualTo -1) then 
    {
        throw "Wanted APB Displayhandler Mode doesn't exist";
    };

    private _apbCreate = [
        3000,
        3003,
        3404,
        3400,
        3001,
        3500,
        3002,
        3401,
        3004,
        3402,
        3005,
        3006,
        3800,
        3801,
        3007,
        3008
    ];

    private _apbControls = [
        1000,
        1001,
        1002,
        1003,
        1004,
        1005,
        1500,
        1100,
        1101,
        2404
    ];

    switch _mode do 
    {
        case 0: //main menu
        {
            if !(ctrlVisible 1000) then 
            {
                {
                    ctrlShow [_x,true];
                } forEach _apbControls;
            };

            {
                ctrlShow [_x,false];
            } forEach _apbCreate;
        };
        case 1: //create new apb
        {
            {
                ctrlShow [_x,false];
            } forEach _apbControls;

            {
                ctrlShow [_x,true];
            } forEach _apbCreate;
        };
        default {};
    };
}
catch
{
    hintSilent _exception;
};
