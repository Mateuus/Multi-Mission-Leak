/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Plays sounds from police officers and their vehicles
*/
private["_key"];

_key = _this select 0;
if(((vehicle player) == player)||(driver(vehicle player) != player))exitwith{};
if(isNil {DS_yelp})then{DS_yelp = false};
if(DS_yelp)exitwith{};

switch(_key)do
	{
	case 1:
		{
		[[(vehicle player),"yelp"],"DS_fnc_playSounds"] spawn DS_fnc_MP;
		};
	case 2:
		{
		[[(vehicle player),"pullOver"],"DS_fnc_playSounds"] spawn DS_fnc_MP;
		};
	case 3:
		{
		[[(vehicle player),"policeSound1"],"DS_fnc_playSounds"] spawn DS_fnc_MP;
		};
	};

DS_yelp = true;
if(((DS_infoArray select 19) > 35)&&(player getVariable ["security",false]))then
	{
	sleep 10;
	}
	else
	{
	sleep 20;
	};
DS_yelp = false;
	
	
