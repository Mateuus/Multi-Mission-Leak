/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	returns price of selected vehicle depending on perk level and player side
*/

private["_tempArray","_className","_price","_shop","_search","_type"];

_className = _this select 0;
_search = _this select 1;
_type = _this select 2;
switch(_type)do
	{
	case 0:
		{
		_tempArray = [DS_shopIndex] call DS_fnc_weaponShopConfig;
		};
	case 1:
		{
		_tempArray = [DS_shopIndex] call DS_fnc_licenseShopConfig;
		};
	case 2:
		{
		_tempArray = [DS_shopIndex] call DS_fnc_clothingShopConfig;
		};
	case 3:
		{
		_tempArray = [DS_shopIndex] call DS_fnc_vehShopConfig;
		};
	};

{
	if(_className == (_x select 0))then
		{
		_price = _x select 1;
		};
}forEach _tempArray;	

//If something breaks, don't let fools exploit shiz
if(_price < 1)then{_price = 666};
if(isNil "_price")then{_price = 666};

switch(DS_perkLevel)do
	{
	case 1:{_price = (round(_price*0.9))};
	case 2:{_price = (round(_price*0.8))};
	case 3:{_price = (round(_price*0.7))};
	case 4:{_price = (round(_price*0.6))};
	case 5:{_price = (round(_price*0.5))};
	default {_price = _price};
	};

_price;
