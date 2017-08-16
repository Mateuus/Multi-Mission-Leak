/*
	File: fn_moveItem.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Player has placed an item or taken an item from a container
*/

private["_item", "_unit", "_container", "_house", "_containerId"];

if (playerSide == independent) exitWith {};

_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_container = [_this,1,objNull,[objNull]] call BIS_fnc_param;
_item = [_this,2,"",[""]] call BIS_fnc_param;

if (life_laser_inprogress) exitWith { deleteVehicle _container; };

if (_item == "ItemRadio") exitWith
{
	if (life_radio_chan > -1 && !("ItemRadio" in (assignedItems player))) then { [nil,nil,nil,-1] spawn life_fnc_useRadio; };
};

_house = _container getVariable["house", objNull];
if (!isNull _house) then
{
	_containerId = _container getVariable["containerId", -1];
	if (_containerId > -1) then { _container setVariable["lootModified", true, true]; };
};

[] spawn life_fnc_sessionUpdate;