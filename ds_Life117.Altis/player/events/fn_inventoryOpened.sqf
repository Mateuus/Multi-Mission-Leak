/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Stops people taking shit outta ya bag
*/
private["_container","_unit","_copLevel","_nearCops"];
if(count _this == 1) exitWith {false};
_unit = _this select 0;
_container = _this select 1;
if(playerside == west)then
	{
	_copLevel = DS_coplevel;
	}
	else
	{
	_copLevel = 0;
	};

_isPack = getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack");
if((_isPack == 1)&&(_copLevel < 3)) then 
	{
	hint "You are not allowed to look into someone else's backpack!";
	[] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
	};
	};

	 if(_container isKindOf "LandVehicle" OR _container isKindOf "Ship" OR _container isKindOf "Air") exitWith 
		{
		if(!(_container in DS_keyRing) && {(locked _container) == 2} && ((_copLevel < 5)&&((player getVariable ["policeSquad",""]) != "Highway Patrol"))) exitWith 
			{
			hint "You can not enter somebody else's inventory while it's locked";
			[] spawn 
				{
				waitUntil {!isNull (findDisplay 602)};
				closeDialog 0;
				};
			};
		};
