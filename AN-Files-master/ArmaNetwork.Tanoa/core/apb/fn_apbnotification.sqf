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
    ["_mode",-1,[0]],
    ["_text","",[""]],
    ["_addition","",[""]],
    ["_coords",[],[[]]]
];

if (_mode isEqualTo -1) exitWith {};

switch _mode do 
{
    case 0: 
    {
        if (_text isEqualTo "") then
        {
            ["UrgentAPB",["New Urgent APB!"]] call BIS_fnc_showNotification;
        }
        else
        {
            ["UrgentAPBName",[format["Urgent APB Assigned: %1",_text]]] call BIS_fnc_showNotification;
        };
    };
    case 1:
    {
        if (isNil "life_apb_task") then 
        {
            hintSilent "You have a new TSO APB Assignment assigned to you. Check Tasks under the Briefing in Map Menu to view the task.";
            private _info = format ["%1 - %2",_text,_addition];
            life_apb_task = player createSimpleTask ["APB"];
            life_apb_task setSimpleTaskDescription [_info,"APB Assignment",""];
            life_apb_task setTaskState "Assigned";
            
            if !(_coords isEqualTo []) then 
            {
                life_apb_task setSimpleTaskDestination _coords;
            };
        };
    };
    case 2:
    {
        if !(isNil "life_apb_task") then 
        {
           life_apb_task setTaskState "Canceled";
           player removeSimpleTask life_apb_task;
           life_apb_task = nil;
        };
    };
    default {};
};