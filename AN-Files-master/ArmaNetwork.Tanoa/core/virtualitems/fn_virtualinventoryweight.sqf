/*
    ArmA.Network
    Author: Rathbone
    Copyright (c) ArmA.Network 2015 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
private _weight = 0;

{
	private _item = _x select 0;
	private _amount = _x select 1;
	private _itemWeight = getNumber (missionConfigFile >> "VirtualItems" >> _item >> "weight");
	_weight = _weight + (_itemWeight * _amount);
} forEach AN_Inventory;

_weight
