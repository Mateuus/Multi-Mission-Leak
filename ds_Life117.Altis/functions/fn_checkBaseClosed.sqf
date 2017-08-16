/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Alters server sell prices
*/
private["_base","_exit","_type","_baseMarker","_return"];

_exit = false;
_type = _this select 0;
_return = true;

if(playerside != civilian)exitwith{};

if(_type == 0)then
	{

	switch(true)do
		{
		case (player distance baseClan1 < 100):
			{
			_base = baseClan1;
			};
		case (player distance baseClan2 < 100):
			{
			_base = baseClan2;
			};
		case (player distance baseClan3 < 100):
			{
			_base = baseClan3;
			};
		case (player distance baseClan4 < 100):
			{
			_base = baseClan4;
			};
		case (player distance baseClan5 < 100):
			{
			_base = baseClan5;
			};
		case (player distance baseClan6 < 100):
			{
			_base = baseClan6;
			};
		case (player distance baseClan7 < 100):
			{
			_base = baseClan7;
			};
		case (player distance baseClan8 < 100):
			{
			_base = baseClan8;
			};
		case default
			{
			_exit = true;
			}
		};
	if(_exit)exitwith{};
		
	if(_base getVariable ["baseClosed",false])then
		{
		hint "This base has been shut down by the police, bases remain closed for 1 hour";
		closeDialog 0;
		};
		
	}
	else
	{
	_baseMarker = (getMarkerPos (_this select 1));
	switch(true)do
		{
		case (_baseMarker distance baseClan1 < 100):
			{
			_base = baseClan1;
			};
		case (_baseMarker distance baseClan2 < 100):
			{
			_base = baseClan2;
			};
		case (_baseMarker distance baseClan3 < 100):
			{
			_base = baseClan3;
			};
		case (_baseMarker distance baseClan4 < 100):
			{
			_base = baseClan4;
			};
		case (_baseMarker distance baseClan5 < 100):
			{
			_base = baseClan5;
			};
		case (_baseMarker distance baseClan6 < 100):
			{
			_base = baseClan6;
			};
		case (_baseMarker distance baseClan7 < 100):
			{
			_base = baseClan7;
			};
		case (_baseMarker distance baseClan8 < 100):
			{
			_base = baseClan8;
			};
		case default
			{
			_exit = true;
			}
		};

	if(_exit)exitwith{};
	
	if(_base getVariable ["baseClosed",false])then
		{
		_return = false;
		}
		else
		{
		_return = true;
		}
	};
	
_return;