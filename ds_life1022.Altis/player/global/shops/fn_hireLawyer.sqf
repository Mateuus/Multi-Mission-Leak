/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Buys a Virtual Item Kit
*/

disableSerialization;

private["_chance","_weight","_index","_buyMulti","_strName"];

_chance = 0;

if(DS_atmCoin < DS_price)exitwith
	{
	systemchat "You do not have enough money in your bank to cover this lawyers fees";
	hint "You do not have enough money in your bank to cover this lawyers fees";
	};

switch(DS_price)do
	{
	case 20000:
		{
		_chance = 40;
		};
	case 50000:
		{
		_chance = 70;
		};
	case 75000:
		{
		_chance = 90;
		};
	case 100000:
		{
		_chance = 50;
		};
	case 150000:
		{
		_chance = 80;
		};
	};

