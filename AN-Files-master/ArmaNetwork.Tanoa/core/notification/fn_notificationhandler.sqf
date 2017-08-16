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
    ["_message","",[""]],
    ["_custom",false,[true]],
    ["_colour",[],[[]]]
];

try
{
    if (_message isEqualTo "") then 
    {
        throw "Error - Unknown Message Type";
    };

    if (_custom) then 
    {
        if (_colour isEqualTo []) then 
        {
            throw "Error - Colour not defined";
        };

        [_message,_colour] call life_fnc_addNotification;
    }
    else
    {
        private _isClass = isClass (missionConfigFile >> "CfgMessages" >> _message);

        if !(_isClass) then 
        {
            throw "Error - Message isn't a class!";
        };

        private _config = getText (missionConfigFile >> "CfgMessages" >> _message >> "text");
        private _setC = getArray (missionConfigFile >> "CfgMessages" >> _message >> "colour");

        [_config,_setC] call life_fnc_addNotification;
    };
}
catch
{
    [_exception,[0.77,0.07,0,1]] call life_fnc_addNotification;
};