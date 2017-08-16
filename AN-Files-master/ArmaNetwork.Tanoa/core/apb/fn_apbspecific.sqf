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
    ["_mode","",[""]]
];

if (_mode isEqualTo "") exitWith {};
if (lbCurSel 1500 isEqualTo -1) exitWith {};

private _data = call compile (lbData [1500,lbCurSel 1500]);

_data params [
    ["_id",0,[0]],
    ["_playerID","",[""]],
    ["_title","",[""]],
    ["_desc","",[""]],
    ["_info","",[""]],
    ["_unit","",[""]],
    ["_emergency",0,[0]],
    ["_coords","",[""]]
];

_coords = call compile _coords;

switch _mode do 
{
    case "assign":
    {
        if (_unit isEqualTo "OPEN" && {isNil "life_apb_task"}) then 
        {
            [1,_id,profileName,player] remoteExecCall ["life_fnc_apbListHandler",2];
            [1,_title,_desc,_coords] call life_fnc_apbNotification;
            closeDialog 0;
        };
    };
    case "remove":
    {
        if (_unit isEqualTo profileName && {!isNil "life_apb_task"}) then 
        {
            [0,_id] remoteExecCall ["life_fnc_apbListHandler",2];
            [2] call life_fnc_apbNotification;
            closeDialog 0;
            hintSilent "The APB was removed from the list and was set to cancelled.";
        };
    };
    default {};
};