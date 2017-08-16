/*
    ArmA.Network
    Author: Rathbone
    Copyright (c) ArmA.Network 2015 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
if !(isNil "PlayerPrep") exitWith {};

switch (playerSide) do 
{
    case civilian: 
    {
        [profilename,(getPlayerUID player),player] remoteExecCall ["life_fnc_finaliseCivPlayer",2];
    };
    case west: 
    {
        [profilename,(getPlayerUID player),player] remoteExecCall ["life_fnc_finaliseCopPlayer",2];
    };
    case independent: 
    {
        [profilename,(getPlayerUID player),player] remoteExecCall ["life_fnc_finaliseEMSPlayer",2];
    };
};
