/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	For the mean time it blocks the player from opening another persons backpack
*/
private["_container","_unit","_return"];
if(count _this == 1) then {false};
_unit = _this select 0;
_container = _this select 1;
_return = false;

_isPack = getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack");
if(_isPack == 1) then {
    hint localize "STR_MISC_Backpack";
	_return = true;
};

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) then {
	_house = nearestBuilding (getPosATL player);
	if(!(_house in life_vehicles) && {(_house getVariable ["locked",false])}) then {
		hint localize "STR_House_ContainerDeny";
		_return = true;
	};
};

if(_container isKindOf "LandVehicle" OR _container isKindOf "Ship" OR _container isKindOf "Air") then {
	if(!(_container in life_vehicles) && {(locked _container) == 2}) then {
		hint localize "STR_MISC_VehInventory";
		_return = true;
	};
};

//Allow alive players who've been knocked out to be looted, just not the dead ones
if(_container isKindOf "Man" && !alive _container) then {
	hint localize "STR_NOTF_NoLootingPerson";
	_return = true;
};

if(_container isKindOf "Car" || _container isKindOf "Ship" || _container isKindOf "Air") then {
	if(!(_container in life_vehicles) && {(locked _container) == 2}) then {
	hint "You're not allowed to open the vehicles inventory while it's locked.";
	_return = true;
};
};
 if(client_lastShotAt + (2*60) > diag_tickTime) then {
    hint localize "STR_MISC_InventoryCombat";
    _return = true;
};
_return