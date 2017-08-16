/*
    ArmA.Network
    Author: Rathbone
    Copyright (c) ArmA.Network 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
private _inventory = [];
private _virtualItems = [];

private _loadout = getUnitLoadout player;
_inventory pushBack _loadout;

if !(count AN_Inventory isEqualTo 0) then 
{
    {
        private _item = _x select 0;
        if ([_item] call life_fnc_virtualCanSave) then 
        {
            _virtualItems pushBack _x;
        };
    } forEach AN_Inventory;
};

_inventory pushBack _virtualItems;

_inventory
