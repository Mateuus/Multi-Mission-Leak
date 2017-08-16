/*
		fn_gettime.sqf
		Author: G00golplexian
		
		Description: Gives you the in-game time.
*/
private ["_year","_month","_day","_hour","_min","_mode"];

_mode = _this select 0;
_year = date select 0;
_month = date select 1;
_day = date select 2;
_hour = date select 3;
_min = date select 4;

switch(_mode) do {

//get date 
case 0: {
		format["%1.%2.%3",
		_day,
		_month,
		_year];
	};

//get time
case 1: {
		format["%1:%2 Uhr",		
		if(_hour < 10) then {"0"+format["%1",_hour]} else {_hour},
		if(_min < 10) then {"0"+format["%1",_min]} else {_min}];
	};
	
//get everything
case 2:	{
		format["%1.%2.%3 %4:%5 Uhr",
		_day,
		_month,
		_year,
		if(_hour < 10) then {"0"+format["%1",_hour]} else {_hour},
		if(_min < 10) then {"0"+format["%1",_min]} else {_min}];
	};
};