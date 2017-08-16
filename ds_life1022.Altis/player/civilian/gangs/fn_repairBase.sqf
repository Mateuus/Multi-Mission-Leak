/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Repairs buildings nearby to a players base flag
*/

private ["_action","_buildingarray","_pos","_index","_price","_currentValue"];

switch(true)do
	{
	case (player distance baseClan1 < 100):
		{
		_index = 0;
		};
	case (player distance baseClan2 < 100):
		{
		_index = 1;
		};
	case (player distance baseClan3 < 100):
		{
		_index = 2;
		};
	case (player distance baseClan4 < 100):
		{
		_index = 3;
		};
	case (player distance baseClan5 < 100):
		{
		_index = 4;
		};
	case (player distance baseClan6 < 100):
		{
		_index = 5;
		};
	case (player distance baseClan7 < 100):
		{
		_index = 6;
		};
	case (player distance baseClan8 < 100):
		{
		_index = 7;
		};
	case (player distance baseClan9 < 100):
		{
		_index = 8;
		};
	case (player distance baseClan10 < 100):
		{
		_index = 9;
		};
	case (player distance baseClan11 < 100):
		{
		_index = 10;
		};
	case (player distance baseClan12 < 100):
		{
		_index = 11;
		};
	};

if((DS_baseRepairTimes select _index) > 4)then
	{
	_price = 4000000;
	}
	else
	{
	_priceArray = [250000,500000,1000000,2000000,4000000];
	_price = _priceArray select (DS_baseRepairTimes select _index);
	};

_action = [
	format ["Warning! This will repair all nearby buildings for a fee of $%1. Each time you use this the repair cost will double. Continue?",[_price] call DS_fnc_numberText],
	"Warning!",
	"Continue",
	"No Thanks"
] call BIS_fnc_guiMessage;
if(!_action)exitwith{};
if([_price,true] call DS_fnc_checkMoney)exitwith{hint "You do not have enough money in your bank to do this"};
[_price,true,false] call DS_fnc_handleMoney;

hint "Repairing, please wait...";
sleep 5;

_pos = (position player);

_currentValue = (DS_baseRepairTimes select _index);
_currentValue = _currentValue + 1;
DS_baseRepairTimes set [_index,_currentValue];
publicVariable "DS_baseRepairTimes";

[_pos] remoteExec ["DS_fnc_globalRepairs",2];

sleep 5;

hint format ["All building repaired and $%1 removed from your bank",[_price] call DS_fnc_numberText];

/*
lightHouse666 setDamage 0.9;
lightHouse6666 setDamage 0.9;
*/