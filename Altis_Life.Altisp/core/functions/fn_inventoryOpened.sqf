#include "..\..\script_macros.hpp"
/*
	File: fn_inventoryOpened.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	For the mean time it blocks the player from opening another persons backpack
*/
private["_container","_unit","_list"];
if(EQUAL(count _this,1)) exitWith {false};
_unit = SEL(_this,0);
_container = SEL(_this,1);


_exit = {
	for "_i" from 1 to 6 do {
		closeDialog 0;
		sleep 0.2;
	};
	waitUntil {(!isNull (findDisplay 602))};
	closeDialog 0;
	closeDialog 0;
};

_isPack = FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,typeOf _container,"isBackpack");
if(EQUAL(_isPack,1)) exitWith {
	hint localize "STR_MISC_Backpack";
	[] spawn _exit;
};

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
	_house = nearestObject [player, "House"];
	if(!(_house in life_vehicles) && (_house GVAR ["locked",true])) exitWith {
		hint localize "STR_House_ContainerDeny";
		[] spawn _exit;
	};
};

_list = ["LandVehicle","Ship","Air"];
if(KINDOF_ARRAY(_container,_list)) exitWith {
	if(!(_container in life_vehicles) && (_container GVAR ["locked",true])) exitWith {
		hint localize "STR_MISC_VehInventory";
		[] spawn _exit;
	};
};

//Allow alive players who've been knocked out to be looted, just not the dead ones
if(_container isKindOf "Man" && !alive _container) exitWith {
	hint localize "STR_NOTF_NoLootingPerson";
	true;
	[] spawn _exit;
};

[] call life_fnc_playerSkins;
[] call life_fnc_specCheck;