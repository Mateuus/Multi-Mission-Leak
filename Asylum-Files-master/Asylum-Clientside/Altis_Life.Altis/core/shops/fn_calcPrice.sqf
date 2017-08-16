/*
	File: fn_calcPrice.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Returns price of an object.
*/
private["_item","_base","_quantity","_price","_purchase","_max","_demand","_minSale"];

_item = [_this,0,"",[""]] call BIS_fnc_param;
_base = [_this,1,0,[0]] call BIS_fnc_param;
_quantity = [_this,2,0,[0]] call BIS_fnc_param;
_purchase = [_this,3,true,[true]] call BIS_fnc_param;

_max = if (_purchase) then { 15 } else { 50 };
_minSale = 35;

// Ignore unlimited stuff
if (_purchase && _quantity < 0) exitWith { _base };
if (!_purchase && _quantity < 0) exitWith { _base * 0.7 };

_demand = _item call life_fnc_itemDemand;

_percent = (_quantity * _max) / _demand;

if (_percent > _max) then { _percent = _max; };
if (!_purchase && _percent < _minSale) then { _percent = _minSale; };

_price = _base - (_base * (_percent / 100));

(floor _price);