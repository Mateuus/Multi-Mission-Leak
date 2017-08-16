
/*
	File: fn_recordAdd.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Adds data to a players criminal record
*/

private ["_newRecord1","_newRecord2","_type","_strToAdd","_uid","_tempBounty","_testUID","_score","_chance","_entry","_time"];

_type = _this select 0;
_newRecord1 = _this select 1;
_newRecord2 = _this select 2;
_entry = [];

_tempBounty = (DS_wanted_stats select 0);

if(_tempBounty == 0)exitwith{};//Not Wanted

if(_type == 4)then
	{
	_strToAdd = "Sent to jail";
	};

//Scoring System - More wanted equals higher chance of being busted
if(_tempBounty > 50000)then
	{
	_chance = 100;
	}
	else
	{
		if(_tempBounty > 35000)then
			{
			_chance = 90;
			}
			else
			{
				if(_tempBounty > 22500)then
					{
					_chance = 80;
					}
					else
					{
						if(_tempBounty > 15000)then
							{
							_chance = 75;
							}
							else
							{
								if(_tempBounty > 8000)then
									{
									_chance = 70;
									}
									else
									{
									if(_tempBounty > 4000)then
										{
										_chance = 65;
										}
										else
										{
										_chance = 60;
										};
									};
							};
					};
			};
	};
_rand = random 100;	

if(_rand > _chance)exitwith{};
_time = serverTime;						
if(DS_moral == 0)then
	{
	sleep (_chance/2);
	}
	else
	{
	sleep ((_chance/4) + (DS_moral/10));
	};

switch(_type)do
	{
	case 0:
		{
		_strToAdd = format ["Spotted near %1",_newRecord1];
		};
	case 1:
		{
		_strToAdd = format ["Spotted near %1 in a %2",_newRecord1,_newRecord2];
		};
	case 2:
		{
		_strToAdd = format ["Used an ATM at %1",_newRecord1];
		};
	};
	
_entry pushBack _strToAdd;
_entry pushBack _time;
	
if(count DS_civRecords < 5)then
	{
	DS_civRecords pushBack _entry;
	}
	else
	{
	_tempArray = [];
	_tempArray pushBack (DS_civRecords select 1);
	_tempArray pushBack (DS_civRecords select 2);
	_tempArray pushBack (DS_civRecords select 3);
	_tempArray pushBack (DS_civRecords select 4);
	DS_civRecords = _tempArray;
	DS_civRecords pushBack _entry;
	};
	
