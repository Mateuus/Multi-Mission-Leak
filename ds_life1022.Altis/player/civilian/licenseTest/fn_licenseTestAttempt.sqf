/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Handles a license test attempt
*/

private["_current","_type","_pack","_display","_return","_units","_newPrice","_basePrice"];

_type = (_this select 0);

switch(_type)do
	{
	case 0://Car
		{
		_current = DS_realEstateArray select 17;
		_current = _current + 1;
		_multiplier = 1.1;
		_basePrice = 100;
		_newPrice = _basePrice*(_current*_multiplier);
		_newPrice = floor(_newPrice);
		_return = [];
		_return pushBack _current;
		_return pushBack _newPrice;
		};
	case 1://Truck
		{
		_current = DS_realEstateArray select 18;
		_current = _current + 1;
		_multiplier = 1.2;
		_basePrice = 200;
		_newPrice = _basePrice*(_current*_multiplier);
		_newPrice = floor(_newPrice);
		_return = [];
		_return pushBack _current;
		_return pushBack _newPrice;
		};
	case 2://Air
		{
		_current = DS_realEstateArray select 19;
		_current = _current + 1;
		_multiplier = 1.2;
		_basePrice = 5500;
		_newPrice = _basePrice*(_current*_multiplier);
		_newPrice = floor(_newPrice);
		_return = [];
		_return pushBack _current;
		_return pushBack _newPrice;
		};
	case 3://Boat
		{
		_current = DS_realEstateArray select 13;
		_current = _current + 1;
		_multiplier = 1.2;
		_basePrice = 220;
		_newPrice = _basePrice*(_current*_multiplier);
		_newPrice = floor(_newPrice);
		_return = [];
		_return pushBack _current;
		_return pushBack _newPrice;
		};
	case 4://Weapons
		{
		_current = DS_realEstateArray select 20;
		_current = _current + 1;
		_multiplier = 1.2;
		_basePrice = 3500;
		_newPrice = _basePrice*(_current*_multiplier);
		_newPrice = floor(_newPrice);
		_return = [];
		_return pushBack _current;
		_return pushBack _newPrice;
		};
	case 5://WeaponsAdv
		{
		_current = DS_realEstateArray select 20;
		_current = _current + 1;
		_multiplier = 1.2;
		_basePrice = 3500;
		_newPrice = _basePrice*(_current*_multiplier);
		_newPrice = floor(_newPrice);
		_return = [];
		_return pushBack _current;
		_return pushBack _newPrice;
		};
	};
_return;