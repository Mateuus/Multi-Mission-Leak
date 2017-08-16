/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Stops people taking shit outta ya bag
*/

private ["_unit","_container","_copLevel","_isBackpack"];

if((count _this) isEqualTo 1)exitWith{false};

_unit = _this select 0;
_container = _this select 1;
_copLevel = if(playerSide isEqualTo west)then{DS_copLevel}else{0};

_isBackpack = getNumber (configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack");
if((_isBackpack isEqualTo 1)&&(_copLevel < 3))exitWith {
	hint "You are not allowed to look into someone else's backpack!";
	[] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
	};
};

if((typeOf _container) isEqualTo "Box_NATO_Ammo_F")exitWith {
	if(!(_container in DS_keyRing))exitWith {
		hint "You can not open someone else's compensation box without it's keys";
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
		};
	};
};

 if((_container isKindOf "LandVehicle")||(_container isKindOf "Ship")||(_container isKindOf "Air"))exitWith {
	if(!(_container in DS_keyRing)&&{(locked _container) isEqualTo 2}&&((_copLevel < 5)&&((player getVariable ["policeSquad",""]) != "Highway Patrol")))exitWith {
		hint "You can not enter somebody else's inventory while it's locked";
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
		};
	};
};