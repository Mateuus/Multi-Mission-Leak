/*
	File: fn_getQuantity.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Returns the quantity of an item available for sale, -1 if unlimited.
*/
private["_ret"];

if (playerSide in ["west","independent"]) exitWith { -1 };

_ret = -1;

{
	if (_x select 0 == _this) exitWith
	{
		_ret = _x select 1;
	}
} forEach life_price_index;

_ret;