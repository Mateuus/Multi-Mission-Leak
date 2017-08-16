/*
			File: fn_medikit.sqf
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			Drinking
*/
private ["_item","_chance","_fatGuy","_foodValue"];

_item = _this select 0;
_chance = 0;
_fatGuy = false;

switch(_item)do
	{
	case "tbacon":
		{
		_foodValue = 100;
		};
	case "pie":
		{
		_foodValue = 80;
		};
	case "burger":
		{
		_foodValue = 80;
		};
	case "doritos":
		{
		_foodValue = 60;
		};
	case "chips":
		{
		_foodValue = 60;
		};
	case "turtle":
		{
		_foodValue = 100;
		};
	case "tuna":
		{
		_foodValue = 100;
		};
	case "catshark":
		{
		_foodValue = 100;
		};
	default 
		{
		_foodValue = 50;
		};
	};

_foodValue = _foodValue + DS_hunger;
if(_foodValue > 100)then
	{
	_foodValue = 100;
	};

{
	if(_x distance player < 100)then
		{
		[[player,"eat"],"DS_fnc_playSounds",_x,false] spawn DS_fnc_MP;
		};
}forEach playableUnits;

_chance = random 100;

if(_chance > 50)then
	{
	[]spawn	
		{
		sleep (random 600) + 60;
		_type = round random 4;
		if(_type == 0)then
			{
			[[player,"fart1"],"DS_fnc_playSounds",true,false] spawn DS_fnc_MP;
			}
			else
			{
			if(_type < 3)then
				{
				[[player,"fart2"],"DS_fnc_playSounds",true,false] spawn DS_fnc_MP;
				}
				else
				{
				[[player,"fart3"],"DS_fnc_playSounds",true,false] spawn DS_fnc_MP;
				}
			};
		};
	};

if((DS_infoArray select 13) > 39)then
	{
	DS_thirst = DS_thirst + (_foodValue/4);
	if(DS_thirst > 100)then{DS_thirst = 100};	
	};

DS_hunger = _foodValue;
	
	
[] call DS_fnc_updateHud;













