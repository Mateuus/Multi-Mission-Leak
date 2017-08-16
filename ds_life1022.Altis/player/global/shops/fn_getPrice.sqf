/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Returns the price of something
*/

private ["_tempArray","_price"];

params ["_className","_search","_type"];

switch(_type)do {
	case 0: {_tempArray = [DS_shopIndex] call DS_fnc_weaponShopConfig;};
	case 1: {_tempArray = [DS_shopIndex] call DS_fnc_licenseShopConfig;};
	case 2: {_tempArray = [DS_shopIndex] call DS_fnc_clothingShopConfig;};
	case 3: {_tempArray = [DS_shopIndex] call DS_fnc_vehShopConfig;};
};

{
	if((_x select 0) isEqualTo _className)exitWith {
		_price = _x select 1;
	};
} forEach _tempArray;

//If something breaks, don't let fools exploit shiz
if(isNil "_price")then{_price = 666};
if(_price < 1)then{_price = 666};

if(!(_type isEqualTo 1))then {
	switch(DS_perkLevel)do {
		case 1: {_price = (round(_price*0.95))};
		case 2: {_price = (round(_price*0.9))};
		case 3: {_price = (round(_price*0.85))};
		case 4: {_price = (round(_price*0.8))};
		case 5: {_price = (round(_price*0.75))};
		default {_price = _price};
	};
};

_price;