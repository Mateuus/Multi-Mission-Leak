/*
    ArmA.Network
    Author: Rathbone
    Copyright (c) ArmA.Network 2015 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
private _unit = (_this select 0);
private _pos = _unit modelToWorld [0,3,0];
private _pos = [_pos select 0, _pos select 1, 0];
private _itemInventory = [];
private _weight = 0;

if !((count AN_Inventory) isEqualTo 0) then 
{
	{
		_itemInventory pushBack [(_x select 0),(_x select 1)];
	} forEach AN_Inventory;
};

if (count _itemInventory > 0) then 
{
	private _obj = "Land_Suitcase_F" createVehicle _pos;
	[_obj] remoteExecCall ["life_fnc_fufuspuspub",0];
	_obj allowDamage false;
	_obj setPos _pos;
	_obj setVariable["Trunk",_itemInventory,true];
};

if (an_cash > 0) then 
{
	private _obj = "Land_Money_F" createVehicle _pos;
	_obj setVariable["item",["money",an_cash],true];
	[_obj] remoteExecCall ["life_fnc_fufuspuspub",0];
	_obj setPos _pos;
	[an_cash,0,1] call life_fnc_sewawruk;
	ancash_box = 0;
};

AN_Inventory = [];