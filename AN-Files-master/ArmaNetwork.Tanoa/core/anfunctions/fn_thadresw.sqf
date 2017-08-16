/*
    ArmA.Network
    Author: Rathbone
    Copyright (c) ArmA.Network 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
params [
    ["_gear",[],[[]]]
];

removeAllAssignedItems player;
removeAllWeapons player;
removeHeadgear player;
removeGoggles player;
removeUniform player;
removeVest player;
removeBackpack player;

if (_gear isEqualTo [] OR {count _gear isEqualTo 0}) exitwith
{
    switch playerSide do
    {
        case west:
        {
            call life_fnc_janadawr;
        };
        case civilian:
        {
            call life_fnc_gukuxeku;
        };
        case independent:
        {
            call life_fnc_spedesaw;
        };
    };
};

_gear params [
    ["_loadout",[],[[]]],
    ["_virtualItems",[],[[]]]
];

player setUnitLoadout _loadout;

if !((count _virtualItems) isEqualTo 0) then
{
    AN_Inventory = _virtualItems;
};

true
