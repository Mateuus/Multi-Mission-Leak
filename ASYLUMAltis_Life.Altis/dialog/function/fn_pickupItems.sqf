/*
	File: fn_pickupItems.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Dialog code for picking up items.
*/
private["_objects","_items","_list","_lastItems","_itemName","_itemInfo","_picture"];
disableSerialization;

if (isNull (findDisplay 1520) || life_pickup_open) exitWith {};

life_pickup_open = true;

_list = ((findDisplay 1520) displayCtrl 1521);
_lastItems = [];

while {!isNull (findDisplay 1520)} do
{
	_items = [];
	_objects = nearestObjects [player, [], 4];
	{
		if (count (_x getVariable ["item",[]]) > 0) then { _items pushBack _x; };
	} forEach _objects;
	_items = [_items, [], {_ic = (_x getVariable ["item",[]]) select 0; _icf = [_ic,0] call life_fnc_varHandle; _i = -1; { if (_x == _icf) exitWith {_i = _forEachIndex} } forEach life_inv_items; _i;}, "ASCEND"] call BIS_fnc_sortBy;
	life_pickup_item_array = _items;
	if (!([_lastItems, _items] call BIS_fnc_areEqual)) then
	{
		ctrlEnable [1522, (count _items > 0)];
		lbClear _list;
		{
			_itemInfo = _x getVariable ["item", ["Unknown",0]];
			if (_itemInfo select 0 == "money") then { _list lbAdd format["$%1 Cash", [_itemInfo select 1] call life_fnc_numberText]; }
			else { _list lbAdd format["%1x %2", _itemInfo select 1, [([_itemInfo select 0,0] call life_fnc_varHandle)] call life_fnc_varToStr]; };
		} foreach _items;
		if (count _items < 1) then { _list lbAdd "There are no objects nearby which you can pick up."; };
		_list lbSetSelected [0, true];
	};
	_lastItems = _items;
	sleep 0.5;
};

life_pickup_open = false;