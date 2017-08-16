/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	For the mean time it blocks the player from opening another persons backpack
*/
private["_container","_unit"];
if(count _this == 1) exitWith {false};
_unit = _this select 0;
_container = _this select 1;

/*//test
_unitsnear = (nearestObjects[_container, ["Man"], 12]) arrayIntersect playableUnits;
_playerList = [];
{
_playerList pushBack [name _x, getPlayerUID _x];
}forEach _unitsnear;

sendlogfile = [format ["###### OPEN I: %1(%2) NEAR PLAYER: %3",name player,getPlayerUID player,_playerList],"duping"];
publicVariableServer "sendlogfile";

//test*/

_house = nearestBuilding (getPosATL player);
if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F","Box_IND_AmmoVeh_F","Box_IND_WpsSpecial_F"] && {(_house getVariable ["locked",false])}) then
{
sendlogfile = [format ["###### Kisten Diebstahl von %1 bei Besitzer %2?",name player,_house getVariable "house_owner"],"Kisten"];
publicVariableServer "sendlogfile";


};


_isPack = getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack");
if(_isPack == 1 && playerSide != west) then {
	hint localize "STR_MISC_Backpack";
	[] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
	};
};

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F","Box_IND_AmmoVeh_F"]) exitWith {
	_house =(nearestObjects[getPosATL player, ["House_F"],12] select 0);
	if(!(_house in life_vehicles) && {(_house getVariable ["locked",false])}) then {
		hint localize "STR_House_ContainerDeny";
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
		};
	};
};

if(_container isKindOf "LandVehicle" OR _container isKindOf "Ship" OR _container isKindOf "Air") exitWith {
	if(!(_container in life_vehicles) && {(locked _container) == 2}) exitWith {
		hint localize "STR_MISC_VehInventory";
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
		};
	};
};

//Allow alive players who've been knocked out to be looted, just not the dead ones
if(_container isKindOf "Man" && !alive _container) exitWith {
hint localize "STR_NOTF_NoLootingPerson";
[] spawn {
waitUntil {!isNull (findDisplay 602)};
closeDialog 0;
};
};

