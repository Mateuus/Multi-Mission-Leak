/*
	Author: Bryan "Tonic" Boardwine

	Description:
	For the mean time it blocks the player from opening another persons backpack
*/
//call _exit; fix for i and space bug
//waituntil 602 fix for sitdown and loot
private["_container","_unit","_isPack","_house"];
if(count _this == 1) exitWith {false};
_unit = _this select 0;
_container = _this select 1;
_exit = {
	[] spawn {
		for "_i" from 1 to 6 do {
			closeDialog 0;
			sleep 0.2;
		};
		if(!isNull (findDisplay 602)) then {
			closeDialog 0;
			closeDialog 0;
		};
	};
};
_isPack = getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack");
if(_isPack == 1) then {
		hintSilent localize "STR_MISC_Backpack";
		call _exit;
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
		};
};

if((typeOf _container) in ["Box_IND_Grenades_F","I_supplyCrate_F"]) exitWith {
	_house = nearestBuilding (getPosATL player);
	if(!(_house in life_2vehicles) && {(_house getVariable ["locked",false])}) then {
		hintSilent localize "STR_House_ContainerDeny";
		[[0,"STR_NOTF_kill",true,[_unit getVariable["realname", name _unit], profileName]],"life_fnc_broadcast",civilian,false] spawn life_fnc_MP;
		[[0,"STR_NOTF_kill",true,[_unit getVariable["realname", name _unit], profileName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
		[[0,"STR_NOTF_kill",true,[_unit getVariable["realname", name _unit], profileName]],"life_fnc_broadcast",independent,false] spawn life_fnc_MP;
		sleep 1;
		player setDamage 100;
		call SOCK_fnc_syncData;
		call _exit;
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
		};
	};
};

if(_container isKindOf "LandVehicle" OR _container isKindOf "Ship" OR _container isKindOf "Air") exitWith {
	if(!(_container in life_2vehicles) && {(locked _container) == 2}) exitWith {
		hintSilent localize "STR_MISC_VehInventory";
		call _exit;
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
		};
	};
};

//Allow alive players who've been knocked out to be looted, just not the dead ones
if(_container isKindOf "Man" && !alive _container) exitWith {
	hintSilent localize "STR_NOTF_NoLootingPerson";
	call _exit;
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
		};
};