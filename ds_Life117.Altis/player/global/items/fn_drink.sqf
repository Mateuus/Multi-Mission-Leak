/*
			File: fn_medikit.sqf
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			Drinking
*/
private ["_item","_chance"];

_item = _this select 0;
_chance = 0;

DS_thirst = 100;
[]call DS_fnc_updateHud;
{
	if(_x distance player < 100)then
		{
		[[player,"drink"],"DS_fnc_playSounds",_x,false] spawn DS_fnc_MP;
		};
}forEach playableUnits;

if(_item != "water")then
	{
	_chance = random 100;
	};
[] call DS_fnc_stamina;	

if(((getPos player select 2) > 9999)&&((DS_infoArray select 13) == 43))then
	{
	[0] call DS_fnc_questCompleted;
	};

if(_chance > 50)then
	{
	[]spawn	
		{
		sleep (random 600) + 60;
		_type = round random 4;
		if(_type == 0)then
			{
			[[player,"Burp1"],"DS_fnc_playSounds",true,false] spawn DS_fnc_MP;
			}
			else
			{
			if(_type < 3)then
				{
				[[player,"Burp2"],"DS_fnc_playSounds",true,false] spawn DS_fnc_MP;
				}
				else
				{
				[[player,"Burp3"],"DS_fnc_playSounds",true,false] spawn DS_fnc_MP;
				}
			};
		};
	};
















