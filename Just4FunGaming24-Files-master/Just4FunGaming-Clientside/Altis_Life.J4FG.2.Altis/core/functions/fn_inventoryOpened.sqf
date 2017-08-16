/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	For the mean time it blocks the player from opening another persons backpack
*/
private["_container","_unit"];

if(count _this == 1) exitWith {
    false
};
_unit = _this select 0;
_container = _this select 1;

if(side _unit == WEST) exitWith {}; // Polizisten dürfen in Rucksäcke, Kisten und Fahrzeuge schauen

_isPack = getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack");
if(_isPack == 1) exitWith {
	hint localize "STR_MISC_Backpack";
	true
};

if( (typeOf _container) isEqualTo "B_supplyCrate_F" ) exitWith {
	_house = nearestBuilding (getPosATL player);
	if( !( _house in XY_vehicles ) && (_house getVariable ["locked", true]) ) then {
		hint localize "STR_House_ContainerDeny";
		true
	};
};

if(_container isKindOf "LandVehicle" || _container isKindOf "Ship" || _container isKindOf "Air") exitWith {
	if( !(_container in XY_vehicles) && {(locked _container) == 2} ) exitWith {
		hint localize "STR_MISC_VehInventory";
        true
	};
};

//Allow alive players who've been knocked out to be looted, just not the dead ones
if( _container isKindOf "Man" && !(alive _container) )  exitWith {
    hint localize "STR_NOTF_NoLootingPerson";
    true
};