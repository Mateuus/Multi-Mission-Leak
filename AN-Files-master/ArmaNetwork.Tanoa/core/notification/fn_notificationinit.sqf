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
    ["_mode",false,[true]]
];

if (_mode) then 
{
    ("NotificationLayer" call BIS_fnc_rscLayer) cutRsc ["ANNotification", "PLAIN", 1, false];
    Draw3DEH = addMissionEventHandler ["Draw3D", { _this call life_fnc_draw3dThread; }];
    Draw3DOn = true;
}
else
{
    Draw3DOn = false;
    ("NotificationLayer" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
    removeMissionEventHandler ["Draw3D",Draw3DEH];
    Draw3DEH = -1;
};