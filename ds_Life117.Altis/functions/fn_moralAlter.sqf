/*
	File: fn_moralAlter.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Alters ones morality level based on provided information and donation level
*/
private["_donor","_amount","_increase"];

_donor = (DS_perkLevel);
_amount = 0;
_increase = false;

if(isNil {_donor})then{_donor = 0;};

_amount = _this select 0;
_increase = _this select 1;

switch(_donor)do
	{
	case 0:
		{
		_donor = 1;
		};
	case 1:
		{
		_donor = 1.2;
		};
	case 2:
		{
		_donor = 1.4;
		};
	case 3:
		{
		_donor = 1.6;
		};
	case 4:
		{
		_donor = 1.8;
		};
	case 5:
		{
		_donor = 2;
		};
	case 6:
		{
		_donor = 2;
		};
	};
	
//Lower to 50%
_amount = (_amount/2);
	
if(_increase)then
	{
	DS_moral = DS_moral + (((_amount)*_donor)*2);
	}
	else
	{
	DS_moral = DS_moral - ((_amount)*_donor);
	};

	if(DS_moral < 0)then{DS_moral = 0};
	if(DS_moral > 999)then{DS_moral = 999};
[] call DS_fnc_stamina;