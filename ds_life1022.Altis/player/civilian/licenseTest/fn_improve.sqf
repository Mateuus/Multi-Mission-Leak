/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Gives a player a license for the license test
*/

private["_current","_type","_str2","_str","_decrease"];

_type = (_this select 0);
_decrease = false;

switch(_type)do
	{
	case 0://Car
		{
		_current = DS_realEstateArray select 17;
		if(_current > 0)then
			{
			_current = _current - 1;
			_decrease = true;
			DS_realEstateArray set [17,_current];
			};
		_current = DS_realEstateArray select 20;
		if(_current > 0)then
			{
			_current = _current - 1;
			_decrease = true;
			DS_realEstateArray set [20,_current];
			};
		_str2 = "Driving";
		_str = "Drivers and weapons";
		};
	case 1://Truck
		{
		_current = DS_realEstateArray select 18;
		if(_current > 0)then
			{
			_current = _current - 1;
			_decrease = true;
			DS_realEstateArray set [18,_current];
			};
		_current = DS_realEstateArray select 20;
		if(_current > 0)then
			{
			_current = _current - 1;
			_decrease = true;
			DS_realEstateArray set [20,_current];
			};
		_str2 = "Driving";
		_str = "Truck and weapons";
		};
	case 2://Air
		{
		_current = DS_realEstateArray select 19;
		if(_current > 0)then
			{
			_current = _current - 1;
			_decrease = true;
			DS_realEstateArray set [19,_current];
			};
		_current = DS_realEstateArray select 20;
		if(_current > 0)then
			{
			_current = _current - 1;
			_decrease = true;
			DS_realEstateArray set [20,_current];
			};
		_str2 = "Flying";
		_str = "Pilots and weapons";
		};
	case 3://Boats
		{
		_current = DS_realEstateArray select 13;
		if(_current > 0)then
			{
			_current = _current - 1;
			_decrease = true;
			DS_realEstateArray set [13,_current];
			};
		_current = DS_realEstateArray select 20;
		if(_current > 0)then
			{
			_current = _current - 1;
			_decrease = true;
			DS_realEstateArray set [20,_current];
			};
		_str2 = "Boating";
		_str = "Boat and weapons";
		};
	};
if(_decrease)then
	{
	sleep 10;
	systemchat format ["Because you have completed a legal %2 job the price of your %1 license has decreased",_str,_str2];
	hint format ["Because you have completed a legal %2 job the price of your %1 license has decreased",_str,_str2];
	//[] call DS_fnc_compileData;
	};