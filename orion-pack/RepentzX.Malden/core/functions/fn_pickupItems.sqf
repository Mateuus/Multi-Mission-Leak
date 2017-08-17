/*	File: fn_pickupItems.sqf	Author: John "Paratus" VanderZwet*/
private["_objects","_items","_list","_lastItems","_itemName","_itemInfo","_picture"];
disableSerialization;

if (isNull (findDisplay 1520)) exitWith {hint"Error";closeDialog 0;};

life_pickingUp = true;

_list = ((findDisplay 1520) displayCtrl 1521);
_lastItems = [];


_items = [];
_objects = nearestObjects [player, [], 10];
{
	if (count (_x getVariable ["item",[]]) > 0) then { _items set[count _items, _x]; };
} forEach _objects;
//diag_log format["Life Items: %1",_items];
life_itemPickUpArray = _items;
ctrlEnable [1522, (count _items > 0)];
lbClear _list;
{
	_itemInfo = _x getVariable ["item", ["Unknown",0]];
	diag_log format["Item Info: %1",_itemInfo];
	if ((_itemInfo select 0) == "money") then { _list lbAdd format["$%1 Cash", [_itemInfo select 1] call life_fnc_numberText]; }
	else { _list lbAdd format["%1x %2", _itemInfo select 1, localize getText(missionConfigFile >> "VirtualItems" >> _itemInfo select 0 >> "displayName")];};
} foreach _items;
if (count _items < 1) then { _list lbAdd "Nothing left to pickup"; };
_list lbSetSelected [0, true];

_lastItems = _items;



life_pickingUp = false;