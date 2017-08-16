/*
	File: fn_inventoryOpened.sqf
	Author: John "Paratus" VanderZwet and Sgt. Chronic
	
	Description:
	Fired when a player opens a container.
*/

private ["_result","_owner","_container"];

if (life_adminlevel > 0) exitWith { false };

_result = false;
_owner = _this select 0;
_container = _this select 1;

if (_container isKindOf "Bag_Base" && cursorTarget getVariable ["playerSurrender",false]) exitWith { false };
if (_container isKindOf "Bag_Base" && !(cursorTarget getVariable ["playerSurrender",false]) && playerSide != west) exitWith { hint "No stealing allowed!"; true };
if (_container isKindOf "Man") exitWith { true };

_lk_var = false;
_nearSupplies = player nearSupplies 5;
_id = {if(_x getVariable["containerId", -1] > -1) exitWith {_x}; objNull} forEach _nearSupplies;
if (!isNull _id) then
{
	_house = _id getVariable["house", objNull];
	if(_house in life_houses || [_house] call life_fnc_getBuildID == life_gang) exitWith {};
	_lk_var = ((_house getVariable["life_locked", 1]) > 0);
};

if (_lk_var) exitWith { hint "You cannot open a house crate while the house doors are locked."; true };
if ((locked _container) > 1 && playerSide != west) exitWith { hint "The container is locked and cannot be opened!"; true };

false