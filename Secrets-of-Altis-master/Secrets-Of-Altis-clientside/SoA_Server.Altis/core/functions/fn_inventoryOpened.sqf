/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	For the mean time it blocks the player from opening another persons backpack
*/
private["_container","_unit"];
if(count _this == 1) exitWith {false};
_unit = _this select 0;
_container = _this select 1;

_isPack = getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack");
if(_isPack == 1) then {
	hint localize "STR_MISC_Backpack";
	[] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
		sleep 0.1;
		closeDialog 0;
	};
};

if((typeOf _container) in ["Land_PlasticCase_01_large_F","CargoNet_01_box_F"]) exitWith {
	_house = nearestBuilding (getPosATL player);
	if(!(_house in life_vehicles) && {(_house getVariable ["locked",false])}) then {
		hint localize "STR_House_ContainerDeny";
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
			sleep 0.1;
			closeDialog 0;
		};
	};
};

if(_container isKindOf "LandVehicle" OR _container isKindOf "Ship" OR _container isKindOf "Air") exitWith {
	if!(_container in life_vehicles) exitWith {
		hint "Du bist nicht berechtigt auf dieses Fahrzeug zuzugreifen.";
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
			sleep 0.1;
			closeDialog 0;
		};
	};
};

if(_container isKindOf "Man" && !alive _container) exitWith {
	hint localize "STR_NOTF_NoLootingPerson";
	[] spawn {
		 waitUntil {!isNull (findDisplay 602)};
		 closeDialog 0;
		 sleep 0.1;
		 closeDialog 0;
	};
};

//[] call life_fnc_UpdateClothing;