/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Upgrades the clan base
*/

private["_clan","_infoArray","_action","_fail","_base","_clanBalance"];

_fail = false;
_clanBalance = 0;

switch(true)do
	{
	case (player distance baseClan1 < 100):
		{
		_base = baseClan1;
		_clanBalance = DS_gangBank1;
		};
	case (player distance baseClan2 < 100):
		{
		_base = baseClan2;
		_clanBalance = DS_gangBank2;
		};
	case (player distance baseClan3 < 100):
		{
		_base = baseClan3;
		_clanBalance = DS_gangBank3;
		};
	case (player distance baseClan4 < 100):
		{
		_base = baseClan4;
		_clanBalance = DS_gangBank4;
		};
	case (player distance baseClan5 < 100):
		{
		_base = baseClan5;
		_clanBalance = DS_gangBank5;
		};
	case (player distance baseClan6 < 100):
		{
		_base = baseClan6;
		_clanBalance = DS_gangBank6;
		};
	case (player distance baseClan7 < 100):
		{
		_base = baseClan7;
		_clanBalance = DS_gangBank7;
		};
	case (player distance baseClan8 < 100):
		{
		_base = baseClan8;
		_clanBalance = DS_gangBank8;
		};
	case (player distance baseClan9 < 100):
		{
		_base = baseClan9;
		_clanBalance = DS_gangBank9;
		};
	case (player distance baseClan10 < 100):
		{
		_base = baseClan10;
		_clanBalance = DS_gangBank10;
		};
	case (player distance baseClan11 < 100):
		{
		_base = baseClan11;
		_clanBalance = DS_gangBank11;
		};
	case (player distance baseClan12 < 100):
		{
		_base = baseClan12;
		_clanBalance = DS_gangBank12;
		};
	};

switch (DS_className) do
	{
	case "0":{_infoArray = [1000000,"Treat Sickness","You can now scroll on this to treat your sicknesses for free until the end of the current month","baseSickness",0,0];};
	case "2":{_infoArray = [5000000,"Vehicle Re-arm/Repair/Refuel Point","You can now scroll on this to re-arm, repair and refuel all nearby vehicles until the end of the current month","baseVehicle",1,0];};
	case "4":{_infoArray = [10000000,"Markers","You can now see markers of all nearby friends and enemies on your map (within 600m) until the end of the current month","baseMarkers",2,0];};
	case "6":{_infoArray = [10000000,"KOS Warning","You can now be informed when someone attempts to capture the KOS point when you own it until the end of the current month","baseKos",3,0];};
	case "8":{_infoArray = [15000000,"Factory","You now craft things at your flag","factory",4,0];};
	case "10":{_infoArray = [2500000,"Special Items","You can now purchase a new vest, all attachments, all facegear, and licenses from your clan flag","special",5,0];};
	case "12":{_infoArray = [2500000,"Clan Storage","You can now store weapons and items at your gang flag, available to all clan members and saving through restarts","storage",6,0];};
	};

_action = [
		format ["This upgrade cost %1 (From your gangs bank account) and is active until the end of the month. Buy?",[(_infoArray select 0)] call DS_fnc_numberText],
		"Buy Base Upgrade",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;
if(!_action)exitwith{};
if(_base getVariable [(_infoArray select 3),false])exitwith{hint "This base already has this upgrade installed";_fail = true};

switch(true)do
	{
	case (player distance baseClan1 < 100):
		{
		_base = baseClan1;
		_clanBalance = DS_gangBank1;
		};
	case (player distance baseClan2 < 100):
		{
		_base = baseClan2;
		_clanBalance = DS_gangBank2;
		};
	case (player distance baseClan3 < 100):
		{
		_base = baseClan3;
		_clanBalance = DS_gangBank3;
		};
	case (player distance baseClan4 < 100):
		{
		_base = baseClan4;
		_clanBalance = DS_gangBank4;
		};
	case (player distance baseClan5 < 100):
		{
		_base = baseClan5;
		_clanBalance = DS_gangBank5;
		};
	case (player distance baseClan6 < 100):
		{
		_base = baseClan6;
		_clanBalance = DS_gangBank6;
		};
	case (player distance baseClan7 < 100):
		{
		_base = baseClan7;
		_clanBalance = DS_gangBank7;
		};
	case (player distance baseClan8 < 100):
		{
		_base = baseClan8;
		_clanBalance = DS_gangBank8;
		};
	case (player distance baseClan9 < 100):
		{
		_base = baseClan9;
		_clanBalance = DS_gangBank9;
		};
	case (player distance baseClan10 < 100):
		{
		_base = baseClan10;
		_clanBalance = DS_gangBank10;
		};
	case (player distance baseClan11 < 100):
		{
		_base = baseClan11;
		_clanBalance = DS_gangBank11;
		};
	case (player distance baseClan12 < 100):
		{
		_base = baseClan12;
		_clanBalance = DS_gangBank12;
		};
	};

sleep (random 3);

//systemchat format ["%1 || %2",_clanBalance,(_infoArray select 0)];

if(_clanBalance < (_infoArray select 0))exitWith
	{
	hint "There is not enough money in your gangs bank balance to purchase this upgrade";
	};

hint format ["Upgrade Added! %1",(_infoArray select 2)];
_base setVariable [(_infoArray select 3),true,true];
[player,false,(_infoArray select 0),"Base Upgrade"] remoteExec ["HUNT_fnc_gangMoney",2];

if(_fail)exitwith{};
[player,(_infoArray select 4)] remoteExec ["HUNT_fnc_buyBaseUpgrades",2];
//[] call DS_fnc_compileData;