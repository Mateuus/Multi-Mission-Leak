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
    ["_mode","",[""]],
    ["_data","",[""]]
];

try
{
    if (_mode isEqualTo "" OR {_data isEqualTo ""}) then 
    {
        throw "Wanted Menu Error - Data passed null";
    };

    if (isNull (findDisplay 56874)) then 
    {
        throw "Wanted GUI Error - GUI not Found";
    };

    _data = call compile _data;

    switch _mode do 
    {
        case "coords":
        {
            WantedInfo = [];
            WantedInfo = ["coords", _data select 0];
        
            closeDialog 0;

            openMap [true,true];
            hintSilent "Click on map to attach coordinates to the standing Wanted List Entry. Suggested Coords are rough estimate of Felon location";
            onMapSingleClick "
                WantedInfo pushBack _pos; 
                WantedInfo remoteExecCall ['life_fnc_wantedListEditEntry',2]; 
                openMap [false,false];  
                WantedInfo = nil; 
                onMapSingleClick ''; 
                false
            ";
        };

        case "pardon":
        {
            ["pardon", _data select 0] remoteExecCall ["life_fnc_wantedListEditEntry",2];
            closeDialog 0;
            hintSilent format ["You've pardoned %1", _data select 2];
        };
        default {};
    };
}
catch
{
    hintSilent _exception;
};
