/*
    ArmA.Network
    Author: Rathbone
    Copyright (c) ArmA.Network 2015 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/

if !(Draw3DOn) exitWith {false};

params [
    ["_text","",[""]],
    ["_colour",[],[[]]]
];

if (_text isEqualTo "") exitWith {};
if (_colour isEqualTo []) exitWith {};

disableSerialization;
private _display = uiNameSpace getVariable ["ANNotification", displayNull];
if (isNull _display) exitWith {};
 
private _control = _display ctrlCreate ["RscText", -1];
_control ctrlSetFade 1;
_control ctrlSetPosition [(0.0101562 * safezoneW + safezoneX),(0.214 * safezoneH + safezoneY),(0.283594 * safezoneW),(0.022 * safezoneH)];
_control ctrlCommit 0;
_control ctrlSetText _text;
_control ctrlSetTextColor _colour;
reverse NotificationArray;
NotificationArray pushBack [_control, 0, time + 7];
reverse NotificationArray;
if !(life_silentMode) then 
{
    playsound "notificationpop";
};
[] call life_fnc_pushNotification;