/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Updates the gang members list
*/

private["_clan","_infoArray","_action","_fail","_base"];

_fail = false;

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
	};

switch (DS_className) do
	{
	case "0":{_infoArray = [1000000,"Treat Sickness","You can now scroll on this to treat your sicknesses for free until the end of the current month","baseSickness",0,0];};
	case "1":{_infoArray = [750,"Treat Sickness","You can now scroll on this to treat your sicknesses for free until the end of the current month","baseSickness",0,1];};
	case "2":{_infoArray = [5000000,"Vehicle Re-arm/Repair/Refuel Point","You can now scroll on this to Re-arm, Repair and Refuel all nearby vehicles until the end of the current month","baseVehicle",1,0];};
	case "3":{_infoArray = [2000,"Vehicle Re-arm/Repair/Refuel Point","You can now scroll on this to Re-arm, Repair and Refuel all nearby vehicles until the end of the current month","baseVehicle",1,1];};
	case "4":{_infoArray = [10000000,"Markers","You can now see markers of all nearby friends and enemies on your map (Within 600m) until the end of the current month","baseMarkers",2,0];};
	case "5":{_infoArray = [2000,"Markers","You can now see markers of all nearby friends and enemies on your map (Within 600m) until the end of the current month","baseMarkers",2,1];};
	case "6":{_infoArray = [10000000,"Kos Warning","Get a warning when someone attempts to capture the KOS point when you own it until the end of the current month","baseKos",3,0];};
	case "7":{_infoArray = [2000,"Kos Warning","Get a warning when someone attempts to capture the KOS point when you own it until the end of the current month","baseKos",3,1];};
	case "8":{_infoArray = [15000000,"Factory","You will have the ability to craft things at your flag","factory",4,0];};
	case "9":{_infoArray = [3000,"Factory","You will have the ability to craft things at your flag","factory",4,1];};
	};
	
_action = [
		format ["This upgrade cost %1 ($ or Tokens depending what you clicked) and is active until the end of the month. Buy?",[(_infoArray select 0)] call DS_fnc_numberText],
		"Buy Base Upgrade",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;
if(!_action)exitwith{};
if(_base getVariable [(_infoArray select 3),false])exitwith{hint "This base already has this upgrade installed";_fail = true};

if((_infoArray select 5) == 1)then
	{
	if((DS_realEstateArray select 6) < (_infoArray select 0))exitwith{hint "You do not have enough tokens to do this";_fail = true};
	_tempVal = DS_realEstateArray select 6;
	_tempVal = _tempVal - (_infoArray select 0);
	DS_realEstateArray set [6,_tempVal];
	_base setVariable [(_infoArray select 3),true,true];
	}
	else
	{
	if([(_infoArray select 0),true] call DS_fnc_checkMoney)exitwith{hint "You do not have enough money in your bank to cover this upgrades cost";_fail = true};
	[(_infoArray select 0),true,false] call DS_fnc_handleMoney;
	hint format ["Upgrade Added! %1",(_infoArray select 2)];
	_base setVariable [(_infoArray select 3),true,true];
	};
if(_fail)exitwith{};
[[player,(_infoArray select 4)],"HUNT_fnc_buyBaseUpgrades",false,false] spawn BIS_fnc_MP;
[] call DS_fnc_compileData;