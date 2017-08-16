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

_isPack = FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,typeOf _container,"isBackpack");
if(EQUAL(_isPack,1)) exitWith {
	hint  "Du bist nicht berechtigt, in fremde Rucksäcke zu schauen!";
	true;
};

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
	_house = nearestObject [player, "House"];
	if(!(_house in life_vehicles) && (_house GVAR ["locked",true])) exitWith {
		hint  "Du bist nicht berechtigt, auf diesen Container zuzugreifen, ohne dass der Besitzer ihn aufgeschlossen hat.";
		true;
	};
};

_list = ["LandVehicle","Ship","Air"];
if(KINDOF_ARRAY(_container,_list)) exitWith {
	if(!(_container in life_vehicles) && (_container GVAR ["locked",true])) exitWith {
		hint  "Du bist nicht berechtigt, auf dieses Fahrzeug zuzugreifen, während es abgeschlossen ist.";
		true;
	};
};

//Allow alive players who've been knocked out to be looted, just not the dead ones
if(_container isKindOf "Man" && !alive _container) exitWith {
	hint  "Du darfst keine Leichen durchsuchen";
	true;
};
