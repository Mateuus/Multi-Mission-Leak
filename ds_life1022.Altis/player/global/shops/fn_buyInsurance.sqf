/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Buys insurance
*/

disableSerialization;

private ["_price","_index","_rent"];

ctrlShow[66654,false];
//systemchat format ["ClassName = %1",DS_className];
_index = 0;
_rent = 0;
if (DS_realEstateArray select 29 > 0)then
	{
	_rent = _rent + 1;
	};
	if (DS_realEstateArray select 30 > 0)then
	{
	_rent = _rent + 1;
	};
	if (DS_realEstateArray select 31 > 0)then
	{
	_rent = _rent + 1;
	};
	if (DS_realEstateArray select 32 > 0)then
	{
	_rent = _rent + 2;
	};
	if (DS_realEstateArray select 33 > 0)then
	{
	_rent = _rent + 2;
	};
	if (DS_realEstateArray select 34 > 0)then
	{
	_rent = _rent + 2;
	};
	if (DS_realEstateArray select 35 > 0)then
	{
	_rent = _rent + 3;
	};
	if (DS_realEstateArray select 36 > 0)then
	{
	_rent = _rent + 3;
	};
	if (DS_realEstateArray select 37 > 0)then
	{
	_rent = _rent + 3;
	};

switch(DS_className)do
	{
	case "0":
		{
		if(_rent < 5)then
			{
			_price = 50000;
			}
			else
			{
			if(_rent < 10)then
				{
				_price = 70000;
				}
				else
				{
				_price = 100000;
				};
			};
		_index = 0;
		};
	case "1":
		{
		if(_rent < 5)then
			{
			_price = 40000;
			}
			else
			{
			if(_rent < 10)then
				{
				_price = 60000;
				}
				else
				{
				_price = 80000;
				};
			};
		_index = 1;
		};
	case "2":
		{
		if(_rent < 5)then
			{
			_price = 100000;
			}
			else
			{
			if(_rent < 10)then
				{
				_price = 200000;
				}
				else
				{
				_price = 300000;
				};
			};
		_index = 2;
		};
	case "3":
		{
		if(_rent < 5)then
			{
			_price = 100000;
			}
			else
			{
			if(_rent < 10)then
				{
				_price = 140000;
				}
				else
				{
				_price = 220000;
				};
			};
		_index = 3;
		};
	case "4":
		{
		if(_rent < 5)then
			{
			_price = 70000;
			}
			else
			{
			if(_rent < 10)then
				{
				_price = 100000;
				}
				else
				{
				_price = 160000;
				};
			};
		_index = 4;
		};
	case "5":
		{
		if(_rent < 5)then
			{
			_price = 40000;
			}
			else
			{
			if(_rent < 10)then
				{
				_price = 70000;
				}
				else
				{
				_price = 120000;
				};
			};
		_index = 5;
		};
	default {_price = 400000;_index = 0;};
	};

if([_price,true] call DS_fnc_checkMoney)exitwith{hint "You don't have enough money in your bank to purchase this"};
[_price,true,false] call DS_fnc_handleMoney;
hint format ["You have bought this insurance policy for $%1\n\nBuying more of this insurance type will continue to stack it",[_price] call DS_fnc_numberText];

_temp = (DS_realEstateArray select _index);
_temp = _temp + 10;
DS_realEstateArray set [_index,_temp];
[] call DS_fnc_compileData;

if(((DS_infoArray select 13) == 14)&&((DS_realEstateArray select 0) > 9))then {
	[0] call DS_fnc_questCompleted;
};
if(((DS_infoArray select 13) == 35)&&((DS_realEstateArray select 0) > 99))then {
	[0] call DS_fnc_questCompleted;
};