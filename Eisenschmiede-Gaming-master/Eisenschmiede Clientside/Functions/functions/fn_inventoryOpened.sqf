#include "..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	For the mean time it blocks the player from opening another persons backpack
*/
_unit = param[0,objNull,[objNull]];
_container = param[1,objNull,[objNull]];

if(_container isKindOf "LandVehicle" ||_container isKindOf "Air" ||_container isKindOf "Ship") exitWith {
	if(!(_container in ES_vehicles) && locked _container != 0) exitWith {
		true;
	};
};

if(getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack") == 1) exitWith {
	true;
};

if(_container isKindOf "Man" && !alive _container) exitWith {
	true;
};

if (isClass(configFile >> "CfgPatches" >> "EisenschmiedeHighTextures")) then { [] spawn ES_fnc_updateClothing; }else{ [] spawn ES_fnc_updateClothing; };