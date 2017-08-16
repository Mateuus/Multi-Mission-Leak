/*
    ArmA.Network
    Author: Rathbone
    Copyright (c) ArmA.Network 2015 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
private _license = param[3,"",[""]];

if (_license isEqualTo "") exitWith {};
if (isNil "OnLawyerJob") then {OnLawyerJob = false;};
if (isNil "LawyerDutyOn") then {LawyerDutyOn = false;};

switch  _license do 
{
    case "rebel": 
    {
        if (an_bank < 30000) exitWith 
        {
            hintSilent "You do not have enough in your Bank to obtain Rebel Training";
        };

        if (life_lawyer) exitWith 
        {
            hintSilent "You're a Lawyer... Get the fuck out of here you snake!";
        };
    
        if ([_license] call life_fnc_licenseAdd) then 
        {
            [30000,1,1] call life_fnc_sewawruk;
            hintSilent "You've successfully completed the Rebel Training.";
        } 
        else
        {
            hintSilent "Error?";
        };
    };
    default {};
};
